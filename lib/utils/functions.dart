import 'package:intl/intl.dart';

String numberFormatting(number) {
  return '${NumberFormat('##,###').format(number)}원';
}
