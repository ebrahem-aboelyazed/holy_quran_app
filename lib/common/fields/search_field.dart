import 'package:flutter/material.dart';
import 'package:holy_quran/utils/utils.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    required this.onChanged,
    this.controller,
    this.initialValue,
    this.height = 54,
    this.width = double.infinity,
    super.key,
  });

  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextFormField(
        style: Styles.dimGrayP16W500.copyWith(fontSize: 15),
        controller: controller,
        initialValue: controller == null ? initialValue : null,
        scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'بحث',
          hintStyle: Styles.darkGray14P400W,
          filled: true,
          fillColor: AppColors.whiteSmoke,
          alignLabelWithHint: true,
          border: Borders.searchInputBorder,
          enabledBorder: Borders.searchInputBorder,
          focusedBorder: Borders.searchInputBorder,
          errorBorder: Borders.searchInputBorder,
          focusedErrorBorder: Borders.searchInputBorder,
        ),
      ),
    );
  }
}
