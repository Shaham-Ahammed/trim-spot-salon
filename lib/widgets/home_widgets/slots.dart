import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/blocs/slot_selection_bloc/slot_selection_bloc.dart';
import 'package:trim_spot_barber_side/blocs/user_details_bloc/user_details_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';

import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/homepage/slot_booking_colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/functions/total_slots_fetching.dart.dart';
import 'package:trim_spot_barber_side/widgets/home_widgets/slots_shimmer_effect.dart';

class SlotTiles extends StatefulWidget {
  const SlotTiles({
    super.key,
  });

  @override
  State<SlotTiles> createState() => _SlotTilesState();
}

class _SlotTilesState extends State<SlotTiles> {
  @override
  void initState() {
    context.read<SlotSelectionBloc>().add(FetchTotalSlots());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: SlotTileFucntions().fetchingBookedSlots(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SlotsInShimmerEffect();
          }

          return StreamBuilder(
              stream: CollectionReferences()
                  .shopDetailsReference()
                  .doc(BlocProvider.of<UserDetailsBloc>(context).state.shopId)
                  .collection(
                      FirebaseNamesShopSide.slotBookingCollectionReference)
                  .doc(FirebaseNamesShopSide.slotsBookingDocument)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: SlotsInShimmerEffect());
                }
                if (snapshot.hasData) {
                  String today =
                      DateFormat('dd-MM-yyyy').format(DateTime.now());
                  final List<dynamic> list = snapshot.data!.data()![today];
                  return BlocBuilder<SlotSelectionBloc, SlotSelectionState>(
                    builder: (context, state) {
                      final event = context.read<SlotSelectionBloc>();
                      return Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: (state.totalSlots.length / 4).ceil(),
                            itemBuilder: (BuildContext context, int index) {
                              int startIndex = index * 4;
                              int endIndex =
                                  startIndex + 4 > state.totalSlots.length
                                      ? state.totalSlots.length
                                      : startIndex + 4;
                              List<String> timeSlotsRow = state.totalSlots
                                  .sublist(startIndex, endIndex);
                              return Padding(
                                padding: EdgeInsets.only(
                                    top: mediaqueryHeight(0.02, context)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: timeSlotsRow.map((time) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left:
                                              mediaqueryHeight(0.014, context)),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        onTap: () {
                                          event.add(SelectedSlot(
                                            time: time,
                                          ));
                                        },
                                        child: Container(
                                            height: mediaqueryHeight(
                                                0.045, context),
                                            width:
                                                mediaqueryWidth(0.19, context),
                                            decoration: BoxDecoration(
                                              color: contianerColor(
                                                  time, context, list),
                                              border: Border.all(
                                                  color: borderColor(
                                                      time, context, list)),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            child: Center(
                                              child: myFont(time,
                                                  fontFamily: cabinCondensed,
                                                  fontSize: mediaqueryHeight(0.015, context),
                                                  fontWeight: FontWeight.normal,
                                                  fontColor: textColor(
                                                      time, context, list)),
                                            )),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
                return Container();
              });
        });
  }
}
