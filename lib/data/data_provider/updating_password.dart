import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/utils/forgot_password/controller.dart';

class UpdatePasswordFunction {
  Future<bool> checkUserExists() async {
    final phoneNumber = forgotPasswordPhoneController.text;

    final collection =
        await CollectionReferences().shopDetailsReference().get();

    final docs = collection.docs;

    final List<QueryDocumentSnapshot<Object?>> documents = [];
    for (var doc in docs) {
      if (doc[SalonDocumentModel.phone] == phoneNumber) {
        documents.add(doc);
        break;
      }
    }
    return documents.isNotEmpty;
  }

  updateNewPassword()async{
      final phoneNumber = forgotPasswordPhoneController.text;

      final collection =
          await CollectionReferences().shopDetailsReference().get();

      final docs = collection.docs;

      final List<QueryDocumentSnapshot<Object?>> documents = [];
      for (var doc in docs) {
        if (doc[SalonDocumentModel.phone] == phoneNumber) {
          documents.add(doc);
          break;
        }
      }
      final userDocument = documents.first;
      final DocumentReference documentReference =
          CollectionReferences().shopDetailsReference().doc(userDocument.id);
      try {
        documentReference.update({
          SalonDocumentModel.password:
              forgotPasswordNewPasswordController.text.trim()
        });
      
      } catch (e) {
        print("error in updation $e");
      
      }
  }
}
