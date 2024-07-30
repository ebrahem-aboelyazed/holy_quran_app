import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

TextSpan verseSpan({
  required String text,
  required int pageIndex,
  required bool isSelected,
  required int surahNum,
  required int ayahNum,
  required bool isFirstAyah,
  double? fontSize = 24,
  LongPressGestureRecognizer? recognizer,
}) {
  if (text.isNotEmpty) {
    final partOne = text.length < 3 ? text[0] : text[0] + text[1];
    // final String partOne = pageIndex == 250
    //     ? text.length < 3
    //         ? text[0]
    //         : text[0] + text[1]
    //     : text.length < 3
    //         ? text[0]
    //         : text[0] + text[1];
    final partTwo = text.length > 2 ? text.substring(2, text.length - 1) : null;
    final initialPart = text.substring(0, text.length - 1);
    final lastCharacter = text.substring(text.length - 1);
    TextSpan? first;
    TextSpan? second;
    if (isFirstAyah) {
      first = TextSpan(
        text: partOne,
        style: TextStyle(
          fontFamily: 'page${pageIndex + 1}',
          fontSize: fontSize,
          height: 1.8,
          letterSpacing: 30,
          color: Colors.black,
          backgroundColor: _getBackgroundColor(isSelected),
        ),
        recognizer: recognizer,
      );
      second = TextSpan(
        text: partTwo,
        style: TextStyle(
          fontFamily: 'page${pageIndex + 1}',
          fontSize: fontSize,
          height: 1.8,
          letterSpacing: 5,
          color: Colors.black,
          backgroundColor: _getBackgroundColor(isSelected),
        ),
        recognizer: recognizer,
      );
    }

    final initialTextSpan = TextSpan(
      text: initialPart,
      style: TextStyle(
        fontFamily: 'page${pageIndex + 1}',
        fontSize: fontSize,
        height: 1.8,
        letterSpacing: 5,
        color: Colors.black,
        backgroundColor: _getBackgroundColor(isSelected),
      ),
      recognizer: recognizer,
    );

    final lastCharacterSpan = TextSpan(
      text: lastCharacter,
      style: TextStyle(
        fontFamily: 'page${pageIndex + 1}',
        fontSize: fontSize,
        height: 1.8,
        letterSpacing: 5,
        color: Colors.black,
        backgroundColor: _getBackgroundColor(isSelected),
      ),
      recognizer: recognizer,
    );

    return TextSpan(
      children: isFirstAyah
          ? [first!, second!, lastCharacterSpan]
          : [initialTextSpan, lastCharacterSpan],
      recognizer: recognizer,
    );
  } else {
    return const TextSpan(text: '');
  }
}

Color _getBackgroundColor(bool isSelected) {
  if (isSelected) {
    return Colors.orange.withOpacity(.25);
  }
  return Colors.transparent;
}

typedef LongPressStartDetailsFunction = void Function(LongPressStartDetails)?;
