import 'package:intl/intl.dart';
import 'package:trim_spot_barber_side/data/data_provider/user_data_document.dart';
import 'package:trim_spot_barber_side/data/repository/document_model.dart';

Future<bool> holidaychecking() async {
  final today = DateFormat('E').format(DateTime.now());
  final data = await UserDataDocumentFromFirebase().userDocument();
  List<String> holidays =
      (data[SalonDocumentModel.holidays] as List<dynamic>).cast<String>();
  if (holidays.contains(today)) {
    return true;
  }
  final todayInDateFormat = DateFormat('dd-MM-yyyy').format(DateTime.now());
  List<String> occasionalClosures =
      (data[SalonDocumentModel.occasionalClosures] as List<dynamic>)
          .cast<String>();
  if (occasionalClosures.contains(todayInDateFormat)) {
    return true;
  }
  return false;
}
