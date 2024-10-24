import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import 'search_dropdown_controller.dart';
import 'search_dropdown_field_settings.dart';
import 'search_dropdown_item.dart';
import 'search_dropdown_list.dart';


class SearchDropdownTypeAhead extends StatelessWidget
    with SharedSearchDropdownTypeAheadConfig {
  SearchDropdownTypeAhead({
    super.key,
    required this.controller,
    required this.dropdownController,
    required this.settings,
    required this.allItemList,
  });

  @override
  final TextEditingController controller;
  @override
  final SearchDropdownController dropdownController;
  @override
  final FieldSettings settings;
  @override
  final List<SearchDropdownItem> allItemList;



  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dropdownController,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children:
                [


                  Flexible(
                      fit: FlexFit.loose, // Use Flexible with FlexFit.loose
                      child: getContent(context)// Your child widget here
                  ),

                ]

          ),
        );
      },
    );
  }

  Widget getContent(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        children:
        [

          CupertinoTypeAheadField<SearchDropdownItem>(
            direction: settings.direction.value,
            builder: (context, controller, focusNode) => CupertinoTextField(
              controller: controller,
              focusNode: focusNode,
              autofocus: true,
              padding: const EdgeInsets.all(12),
              placeholder: hintText,
              placeholderStyle:
              CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: CupertinoColors.placeholderText,
                fontStyle: FontStyle.italic,
              ),
            ),
            decorationBuilder: (context, child) => DecoratedBox(
              decoration: BoxDecoration(
                color: CupertinoTheme.of(context)
                    .barBackgroundColor
                    .withOpacity(1),
                border: Border.all(
                  color: CupertinoDynamicColor.resolve(
                    CupertinoColors.systemGrey4,
                    context,
                  ),
                  width: 1,
                ),
                borderRadius: borderRadius,
              ),
              child: child,
            ),
            itemBuilder: (context, dropdownItem) => CupertinoListTile(
              title: Text(dropdownItem.name),
              subtitle: dropdownItem.description != null
                  ? Text(
                '${dropdownItem.description!} -  ',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )
                  : Text('\$${dropdownItem.id}'),
            ),
            debounceDuration: debounceDuration,
            hideOnSelect: settings.hideOnSelect.value,
            hideOnUnfocus: settings.hideOnUnfocus.value,
            hideWithKeyboard: settings.hideOnUnfocus.value,
            retainOnLoading: settings.retainOnLoading.value,
            onSelected: onSuggestionSelected,
            suggestionsCallback: suggestionsCallback,
            itemSeparatorBuilder: itemSeparatorBuilder,
            listBuilder:
            settings.gridLayout.value ? gridLayoutBuilder : null,
          ),
          const SizedBox(height: 32),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('Shopping Cart',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(fontSize: 24)),
                const Spacer(),
                Text(
                  'Total: \$${dropdownController.total}',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 18),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          if (dropdownController.value.isNotEmpty)
            Expanded(
              child: CupertinoProductList(dropdownController: dropdownController),
            )
          else
            Expanded(
              child: Center(
                child: Text(
                  'Your cart is empty',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 18),
                ),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CupertinoButton(
                onPressed: () => print("confirm"),
                child: const Text('Confirm'),
              ),
            ],
          ),



          ]
    );
  }


}



mixin SharedSearchDropdownTypeAheadConfig {
  FieldSettings get settings;
  SearchDropdownController get dropdownController;
  TextEditingController get controller;
  List<SearchDropdownItem> get allItemList;


  final String hintText = 'What are you looking for?';
  final BorderRadius borderRadius = BorderRadius.circular(10);
  void onSuggestionSelected(SearchDropdownItem product) {
    dropdownController.value = Map.of(
      dropdownController.value
        ..update(
          product,
              (value) => value + 1,
          ifAbsent: () => 1,
        ),
    );
    controller.clear();
  }

  Future<List<SearchDropdownItem>> suggestionsCallback(String pattern) async =>
      Future<List<SearchDropdownItem>>.delayed(
        Duration(milliseconds: settings.loadingDelay.value ? 300 : 0),
            () => allItemList.where((product) {
          final nameLower = product.name.toLowerCase().split(' ').join('');
          final patternLower = pattern.toLowerCase().split(' ').join('');
          return nameLower.contains(patternLower);
        }).toList(),
      );

  Widget itemSeparatorBuilder(BuildContext context, int index) =>
      settings.dividers.value
          ? const Divider(height: 1)
          : const SizedBox.shrink();

  List<Widget> maybeReversed(List<Widget> children) {
    if (settings.direction.value == VerticalDirection.up) {
      return children.reversed.toList();
    }
    return children;
  }

  Widget gridLayoutBuilder(
      BuildContext context,
      List<Widget> items,
      ) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: items.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisExtent: 58,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      reverse: SuggestionsController.of<SearchDropdownItem>(context).effectiveDirection ==
          VerticalDirection.up,
      itemBuilder: (context, index) => items[index],
    );
  }

  Duration get debounceDuration => settings.debounce.value
      ? const Duration(milliseconds: 300)
      : Duration.zero;
}
