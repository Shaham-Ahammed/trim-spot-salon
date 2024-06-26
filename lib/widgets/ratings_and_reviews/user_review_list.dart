import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/utils/colors.dart';
import 'package:trim_spot_barber_side/utils/font.dart';
import 'package:trim_spot_barber_side/utils/mediaquery.dart';

ListView userRatingsAndReviews(AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
  return ListView.builder(
    itemCount: snapshot.data!.docs.length,
    itemBuilder: (context, index) {
      final reviewer = snapshot.data!.docs[index];
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index != 0)
              SizedBox(
                height: mediaqueryHeight(0.02, context),
              ),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: (reviewer[ReviewDocumentModel.imagePath]
                              as String)
                          .isEmpty
                      ? AssetImage("assets/images/profile upload.png")
                          as ImageProvider
                      : NetworkImage(reviewer[ReviewDocumentModel.imagePath]),
                  radius: mediaqueryHeight(0.03, context),
                ),
                SizedBox(
                  width: mediaqueryWidth(0.04, context),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myFont(reviewer[ReviewDocumentModel.userNmae],
                        fontFamily: balooChettan,
                        fontSize: mediaqueryHeight(0.023, context),
                        fontWeight: FontWeight.w500,
                        fontColor: whiteColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(5, (index) {
                        if (index <
                            int.parse(reviewer[ReviewDocumentModel.ratings])) {
                          return Icon(
                            Icons.star_rate_rounded,
                            color: Colors.yellow,
                            size: mediaqueryHeight(0.023, context),
                          );
                        } else {
                          return Icon(Icons.star_rate_rounded,
                              color: Colors.grey,
                              size: mediaqueryHeight(0.023, context));
                        }
                      }),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            Text(
              reviewer[ReviewDocumentModel.review],
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontFamily: balooChettan,
                  fontSize: mediaqueryHeight(0.018, context),
                  fontWeight: FontWeight.normal,
                  color: greyColor),
            ),
            SizedBox(
              height: mediaqueryHeight(0.02, context),
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      );
    },
  );
}
