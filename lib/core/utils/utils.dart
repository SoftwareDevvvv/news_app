import 'package:intl/intl.dart';

class Utils{
  String convertToTimeString(string){
      return DateFormat.yMMMd().format(DateTime.parse(string));

  }
}