import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class SearchDropdownItem {
  final String name;
  final String? description;
  final int id;

  const SearchDropdownItem({
    required this.name,
    this.description,
    required this.id,
  });

  @override
  String toString() =>
      'Product(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SearchDropdownItem &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              description == other.description &&
              id == other.id;

  @override
  int get hashCode => Object.hash(name, description, id);
}
