
import 'package:flutter/cupertino.dart';

import 'search_dropdown_controller.dart';

class CupertinoProductList extends StatelessWidget {
  const CupertinoProductList({
    super.key,
    required this.dropdownController,
  });

  final SearchDropdownController dropdownController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: dropdownController.value.entries.map(
            (entry) {
          return CupertinoListTile(
            title: Text(entry.key.name),
            subtitle: entry.key.description != null
                ? Text(entry.key.description!)
                : null,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'x${entry.value}',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 18),
                ),
                Text(
                  ', \$${ entry.value}',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 18),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    dropdownController.value = Map.of(dropdownController.value)
                      ..update(
                        entry.key,
                            (value) => value - 1,
                        ifAbsent: () => 0,
                      );
                    if ((dropdownController.value[entry.key] ?? 0) <= 0) {
                      dropdownController.value = Map.of(dropdownController.value)
                        ..remove(entry.key);
                    }
                  },
                  child: const Icon(
                    CupertinoIcons.minus_circled,
                    size: 24,
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}
