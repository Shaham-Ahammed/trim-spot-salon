import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/homepage/drawer/scaffold_key.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_barber_side/utils/logo.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

class AppBarHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryHeight(0.2, context),
      decoration: BoxDecoration(color: appBarColor),
      child: Column(
        children: [
          SizedBox(height: mediaqueryHeight(0.06, context)),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: mediaqueryWidth(0.05, context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform.scale(
                    scale: 1.25,
                    child: GestureDetector(
                        onTap: () {
                          homeScaffoldKey.currentState?.openDrawer();
                        },
                        child: StreamBuilder<QuerySnapshot>(
                          stream: ShopDetailsReference()
                              .shopDetailsReference()
                              // .where("phone",
                              //     isEqualTo: loginPhoneController.text)
                              .snapshots(),
                          builder:
                              (context,  snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return CircularProgressIndicator();
                            }

                            if (snapshot.hasData &&
                                snapshot.data!.docs.isNotEmpty) {
                              final doc =
                                  snapshot.data!.docs.first[SalonDocumentModel.name];

                              return CircleAvatar(
                                backgroundImage: NetworkImage(doc),
                              );
                            } else {
                            
                              return CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.amber,
                              );
                            }
                          },
                        ))),
                AppLogo(
                  size: mediaqueryHeight(0.045, context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
