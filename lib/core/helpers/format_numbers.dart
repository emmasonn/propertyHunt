import 'package:intl/intl.dart';

String formatQty(dynamic value) {
  String realValue = value.toString();

  final formatter = NumberFormat.decimalPattern();

  return formatter.format(double.tryParse(realValue));
}

String computeSubtraction(String amount, String smallerAmount) {
  double? netAmount =
      double.tryParse(amount)! - double.tryParse(smallerAmount)!;

  return NumberFormat.decimalPattern().format(netAmount);
}

String formatThousandEx(dynamic value) {
  String realValue = value.toString();

  final formatter = NumberFormat.decimalPattern();

  return formatter.format(double.tryParse(realValue)!);
}
