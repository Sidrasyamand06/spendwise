import 'package:intl/intl.dart';

import '../models/expense.dart';

extension ExpenseFormatExtension on Expense {
  String get formattedAmount => '\$${amount.toStringAsFixed(2)}';
}

extension DateFormatExtension on DateTime {
  String get formattedDate => DateFormat('yyyy-MM-dd').format(this);
}
