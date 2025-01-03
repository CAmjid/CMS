
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:c_m_s_report_labortary/utils/constants/color_string.dart';
import 'package:c_m_s_report_labortary/utils/constants/text_styles.dart';
import 'package:c_m_s_report_labortary/widgets/custom_responsive_text.dart';
import 'package:c_m_s_report_labortary/widgets/image_view_widget.dart';
import 'package:flutter/material.dart';

class CustomDropdownExample extends StatefulWidget {
  final List<DropDownChildData> items;
  // final SingleSelectController<DropDownChildData?> controller;
  final MultiSelectController<DropDownChildData> multiSelectController;
  final String? hintText;
  final String? searchHintText;
  final Function(List<DropDownChildData>?)? onChanged;
  // final DropDownType dropDownType;
  const CustomDropdownExample(
      {super.key,
      required this.items,
      // required this.controller,
      this.hintText,
      this.searchHintText,
      required this.onChanged,
      required this.multiSelectController
      // required this.dropDownType
      });

  @override
  State<CustomDropdownExample> createState() => _CustomDropdownExampleState();
}

class _CustomDropdownExampleState extends State<CustomDropdownExample> {
  Future<List<DropDownChildData>> getFakeRequestData(String query) async {
    return await Future.delayed(const Duration(milliseconds: 2), () {
      return widget.items.where((e) {
        return e.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDropdown<DropDownChildData>.multiSelectSearchRequest(
      futureRequest: getFakeRequestData,
      items: widget.items, closeDropDownOnClearFilterSearch: true,

      listItemBuilder: (context, item, isSelected, onItemSelect) {
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                onItemSelect();
              },
              child: ListTile(
                leading: item.image != null
                    ? ImageView(
                        imageSource: item.image,
                        imageWidth: 70,
                        isCircularImage: true,
                      )
                    : null,
                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomResponsiveText(
                          text: item.title,
                          style: AppTextStyles.blackBodyText1,
                        ),
                        item.subtitle != null
                            ? CustomResponsiveText(
                                text: item.subtitle ?? "",
                                style: AppTextStyles.secondryBodyText1,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                    Spacer(),
                    item.price != null || item.toothNo != null
                        ? CustomResponsiveText(
                            text: item.price != null
                                ? "₹ ${item.price}"
                                : item.toothNo ?? "",
                            style: AppTextStyles.containerDarkText,
                          )
                        : SizedBox.shrink()
                  ],
                ),
                dense: true,
                trailing: item.showSelection == true
                    ? Checkbox(
                        side: BorderSide(
                            color: AppColors().primaryColor, width: 2),
                        activeColor: Colors.green,
                        value:
                            widget.multiSelectController.value.contains(item),
                        shape: CircleBorder(),
                        onChanged: (value) {},
                      )
                    : null,
              ),
            ),
            Divider(
              thickness: .3,
            )
          ],
        );
      },
      listItemPadding: EdgeInsets.all(8.0),
      expandedHeaderPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      itemsListPadding: EdgeInsets.symmetric(vertical: 5),
      overlayHeight: 15,
      decoration: CustomDropdownDecoration(
          closedBorderRadius: BorderRadius.circular(15),
          closedErrorBorderRadius: BorderRadius.circular(15),
          expandedBorderRadius: BorderRadius.circular(15),
          searchFieldDecoration:
              SearchFieldDecoration(suffixIcon: null, prefixIcon: null),
          closedFillColor: AppColors().filledColor,
          closedSuffixIcon: Icon(
            Icons.arrow_drop_down,
            color: AppColors().primaryColor,
            size: 35,
          )),
      hintBuilder: (context, hint, enabled) {
        return Text(
          hint,
          style: const TextStyle(color: Colors.black),
        );
      },
      multiSelectController: widget.multiSelectController,
      headerListBuilder: (context, selectedItems, enabled) {
        return Wrap(
          spacing: 8.0, // Add some space between the items
          children: selectedItems.map<Widget>((item) {
            return Text(item.title);
          }).toList(),
        );
      },
      // headerBuilder: (context, selectedItem, enabled) {
      //   return Text(selectedItem.title);
      // },
      hintText: widget.hintText ?? "",
      maxlines: 2,
      onListChanged: widget.onChanged,
      // controller: widget.controller,
      searchHintText: widget.searchHintText ?? "",
    );
  }
}

class DropDownChildData {
  final String title;
  String? image;
  String? subtitle;
  String? price;
  String? toothNo;
  bool? showSelection;
  DropDownChildData(
      {required this.title,
      this.image,
      this.subtitle,
      this.price,
      this.toothNo,
      this.showSelection = false});
}