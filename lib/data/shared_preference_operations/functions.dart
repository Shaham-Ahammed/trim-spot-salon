import 'package:shared_preferences/shared_preferences.dart';
import 'package:trim_spot_barber_side/data/shared_preference_operations/login_key.dart';

class SharedPreferenceOperation {
  setPhoneNumber(String phoneNumber) async {
    final SharedPreferences sharedPreference =
        await SharedPreferences.getInstance();
    sharedPreference.setString(loggedInNumber, phoneNumber);
  }
}
