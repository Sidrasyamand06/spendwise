import 'category.dart';

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  const Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  // copyWith method
  Expense copyWith({
    String? id,
    String? title,
    double? amount,
    DateTime? date,
    Category? category,
  }) {
    return Expense(
      id: id ?? this.id,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  // toMap method
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category': category.name,
    };
  }

  // fromMap factory constructor
  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'] as String,
      title: map['title'] as String,
      amount: (map['amount'] as num).toDouble(),
      date: DateTime.parse(map['date'] as String),
      category: Category.values.firstWhere(
        (c) => c.name == map['category'],
        orElse: () => Category.other,
      ),
    );
  }

  // Equality operator (==) and hashCode
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Expense &&
        other.id == id &&
        other.title == title &&
        other.amount == amount &&
        other.date == date &&
        other.category == category;
  }

  @override
  int get hashCode {
    return Object.hash(id, title, amount, date, category);
  }
}
