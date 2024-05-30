import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_spot_barber_side/data/firebase_references/shop_collection_reference.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';
import 'package:trim_spot_barber_side/data/shared_preference_operations/functions.dart';

part 'user_details_event.dart';
part 'user_details_state.dart';

class UserDetailsBloc extends Bloc<UserDetailsEvent, UserDetailsState> {
  UserDetailsBloc()
      : super(UserDetailsInitial(
            profileImage: '',
            userName: '',
            phone: '',
            shopId: "",
            shopImage: '',
            password: '',
            email: '',
            shopName: '',
            shopLocation: '',
            openingTime: '',
            closingTime: '',
            holidays: '')) {
    on<FetchingUserDetailsFromSplash>(_fetchingDetailsFromSplash);
  }
  _fetchingDetailsFromSplash(FetchingUserDetailsFromSplash event,
      Emitter<UserDetailsState> emit) async {
    final phone = await SharedPreferenceOperation().getPhoneNumber();
    if (phone == null || phone.isEmpty) {
      return;
    }
    final collection = await CollectionReferences()
        .shopDetailsReference()
        .where(SalonDocumentModel.phone, isEqualTo: phone)
        .get();
    final userData = collection.docs.first;
    emit(UserDetailsInitial(
        profileImage: userData[SalonDocumentModel.profileImage],
        userName: userData[SalonDocumentModel.name],
        phone: userData[SalonDocumentModel.phone],
        shopImage: userData[SalonDocumentModel.shopImage],
        password: userData[SalonDocumentModel.password],
        email: userData[SalonDocumentModel.email],
        shopId: userData.id,
        shopName: userData[SalonDocumentModel.shopName],
        closingTime: userData[SalonDocumentModel.parsedClosingTime],
        openingTime: userData[SalonDocumentModel.parsedOpeningTime],
        shopLocation: userData[SalonDocumentModel.locationName],
        holidays: (userData[SalonDocumentModel.holidays] as List<dynamic>)
            .cast<String>()
            .join(",")));
  }
}
