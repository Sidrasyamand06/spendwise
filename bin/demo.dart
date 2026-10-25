import 'package:spendwise/models/category.dart';
import 'package:spendwise/models/expense.dart';
import 'package:spendwise/extensions/expense_x.dart';

void main() {
  print('=== SpendWise Fake Repository Demo ===\n');

  final expenses = [
    Expense(
      id: '1',
      title: 'Coffee & Breakfast',
      amount: 8.50,
      date: DateTime(2026, 3, 5),
      category: Category.food,
    ),
    Expense(
      id: '2',
      title: 'Taxi Ride',
      amount: 15.00,
      date: DateTime(2026, 3, 10),
      category: Category.transport,
    ),
    Expense(
      id: '3',
      title: 'Grocery Shopping',
      amount: 65.20,
      date: DateTime(2026, 3, 15),
      category: Category.food,
    ),
    Expense(
      id: '4',
      title: 'Movie Tickets',
      amount: 24.00,
      date: DateTime(2026, 3, 20),
      category: Category.entertainment,
    ),
    Expense(
      id: '5',
      title: 'Electricity Bill',
      amount: 45.00,
      date: DateTime(2026, 2, 28),
      category: Category.bills,
    ),
  ];

  print('Total Expenses Count: ${expenses.length}');
  print('Overall Total Spent: \$${expenses.total.toStringAsFixed(2)}');

  print('\nTotals by Category:');
  expenses.totalsByCategory.forEach((cat, amt) {
    print(' - ${cat.name}: \$${amt.toStringAsFixed(2)}');
  });

  print('\nTop Category: ${expenses.topCategory?.name}');

  final marchExpenses = expenses.inMonth(2026, 3);
  print('Expenses in March 2026: ${marchExpenses.length} items');

  print('\n=== Demo Completed Successfully ===');
}
