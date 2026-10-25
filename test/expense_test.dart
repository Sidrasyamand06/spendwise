import 'package:flutter_test/flutter_test.dart';
import 'package:spendwise/models/category.dart';
import 'package:spendwise/models/expense.dart';
import 'package:spendwise/extensions/format_extensions.dart';
import 'package:spendwise/extensions/expense_x.dart';

void main() {
  group('Expense Model & Extension Unit Tests', () {
    final sampleExpense = Expense(
      id: 'e1',
      title: 'Lunch',
      amount: 12.50,
      date: DateTime(2026, 3, 15),
      category: Category.food,
    );

    test('1. Expense formattedAmount formats correctly', () {
      expect(sampleExpense.formattedAmount, '\$12.50');
    });

    test('2. Expense copyWith updates specified fields', () {
      final updated = sampleExpense.copyWith(amount: 15.00);
      expect(updated.amount, 15.00);
      expect(updated.title, 'Lunch');
    });

    test('3. Expense toMap and fromMap conversion', () {
      final map = sampleExpense.toMap();
      final restored = Expense.fromMap(map);
      expect(restored, equals(sampleExpense));
    });

    test('4. Expense equality operator ==', () {
      final duplicate = Expense(
        id: 'e1',
        title: 'Lunch',
        amount: 12.50,
        date: DateTime(2026, 3, 15),
        category: Category.food,
      );
      expect(sampleExpense, equals(duplicate));
    });

    test('5. List total calculates sum correctly', () {
      final list = [
        sampleExpense,
        sampleExpense.copyWith(id: 'e2', amount: 20.00),
      ];
      expect(list.total, 32.50);
    });

    test('6. List totalsByCategory groups amounts', () {
      final list = [
        sampleExpense,
        Expense(
          id: 'e2',
          title: 'Bus',
          amount: 5.00,
          date: DateTime(2026, 3, 16),
          category: Category.transport,
        ),
      ];
      final totals = list.totalsByCategory;
      expect(totals[Category.food], 12.50);
      expect(totals[Category.transport], 5.00);
    });

    test('7. List inMonth filters expenses by year and month', () {
      final list = [
        sampleExpense,
        Expense(
          id: 'e2',
          title: 'Feb Expense',
          amount: 10.00,
          date: DateTime(2026, 2, 10),
          category: Category.bills,
        ),
      ];
      expect(list.inMonth(2026, 3).length, 1);
    });

    test('8. List topCategory identifies highest spend category', () {
      final list = [
        sampleExpense,
        Expense(
          id: 'e2',
          title: 'Flight',
          amount: 150.00,
          date: DateTime(2026, 3, 16),
          category: Category.transport,
        ),
      ];
      expect(list.topCategory, Category.transport);
    });
  });
}
