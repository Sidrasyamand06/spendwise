import '../models/expense.dart';
import '../models/category.dart';

extension ExpenseListExtension on List<Expense> {
  /// Calculates the total amount spent across all expenses
  double get total {
    return fold(0.0, (sum, expense) => sum + expense.amount);
  }

  /// Groups total spending by category
  Map<Category, double> get totalsByCategory {
    final map = <Category, double>{};
    for (final expense in this) {
      map[expense.category] = (map[expense.category] ?? 0.0) + expense.amount;
    }
    return map;
  }

  /// Filters expenses that occurred in a specific year and month
  List<Expense> inMonth(int year, int month) {
    return where(
      (expense) => expense.date.year == year && expense.date.month == month,
    ).toList();
  }

  /// Returns the category with the highest total expenditure
  Category? get topCategory {
    final totals = totalsByCategory;
    if (totals.isEmpty) return null;

    Category? topCat;
    double maxAmount = -1;

    totals.forEach((category, amount) {
      if (amount > maxAmount) {
        maxAmount = amount;
        topCat = category;
      }
    });

    return topCat;
  }
}
