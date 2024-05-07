import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/firebase_doc_and_collection_names.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';
import 'package:trim_spot_barber_side/utils/network_stream/network_stream.dart';
import 'package:trim_spot_barber_side/utils/no_network_display_widget.dart';
import 'package:trim_spot_barber_side/widgets/ratings_and_reviews/appbar.dart';
import 'package:trim_spot_barber_side/widgets/ratings_and_reviews/no_reviews.dart';
import 'package:trim_spot_barber_side/widgets/ratings_and_reviews/shimmer_effect.dart';
import 'package:trim_spot_barber_side/widgets/ratings_and_reviews/user_review_list.dart';

class ReviewsAndRatingsScreen extends StatelessWidget {
  const ReviewsAndRatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blackColor,
        appBar: PreferredSize(
            preferredSize:
                Size(double.infinity, mediaqueryHeight(0.106, context)),
            child: AppBarReviewsAndRatings()),
        body: SafeArea(
            child: StreamBuilder<bool>(
                stream: checkInternetconnectivity(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator(
                      color: blackColor,
                    );
                  }

                  if (!snapshot.data!) {
                    return NoNetworkDisplayWidget();
                  }
                  return Padding(
                    padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
                    child: StreamBuilder<QuerySnapshot>(
                        stream: CollectionReferences()
                            .shopDetailsReference()
                            .doc(UserDataDocumentFromFirebase.shopId)
                            .collection(FirebaseNamesShopSide
                                .reviewscollectionReference)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return ShimmerOfReviewsLoading();
                          }
                          if (!snapshot.hasData) {
                            return NoReviewsYetIllustration();
                          } else if (snapshot.data!.docs.isEmpty) {
                            return NoReviewsYetIllustration();
                          } else if (snapshot.data!.docs.isNotEmpty) {
                            return userRatingsAndReviews(snapshot);
                          }
                          return Container();
                        }),
                  );
                })));
  }
}
