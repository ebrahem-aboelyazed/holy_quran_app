import 'package:flutter/material.dart';
import 'package:holy_quran/utils/utils.dart';

class Borders {
  Borders._();

  static const OutlineInputBorder defaultBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.gray90),
  );

  static const OutlineInputBorder customLeftBorder = OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.gray90),
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(4),
      bottomLeft: Radius.circular(4),
    ),
  );

  static OutlineInputBorder loginBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.darkGray),
    borderRadius: BorderRadius.circular(8),
  );

  static OutlineInputBorder searchInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.gray90),
    borderRadius: BorderRadius.circular(24),
  );
}
