import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'search_dropdown_item.dart';

typedef SearchDropdownController = ValueNotifier<Map<SearchDropdownItem, int>>;

extension SumTotal on SearchDropdownController {


  double get total {
    double result = value.entries.fold<double>(
      0,
          (total, entry) => total + 100 * entry.value,
    );
    return (result * 100).round() / 100;
  }
}
