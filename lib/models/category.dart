enum Category { food, transport, entertainment, bills, other }

extension CategoryExtension on Category {
  String get displayName => name[0].toUpperCase() + name.substring(1);
}
