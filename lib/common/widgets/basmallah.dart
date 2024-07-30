import 'package:flutter/material.dart';
import 'package:holy_quran/gen/assets.gen.dart';

class Basmallah extends StatefulWidget {
  const Basmallah({
    required this.index,
    super.key,
  });

  final int index;

  @override
  State<Basmallah> createState() => BasmallahState();
}

class BasmallahState extends State<Basmallah> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      width: screenSize.width,
      child: Padding(
        padding: EdgeInsets.only(
          left: screenSize.width * .2,
          right: screenSize.width * .2,
          top: 8,
          bottom: 2,
        ),
        child: Image.asset(
          Assets.images.basmala.path,
          color: Colors.black,
          width: MediaQuery.of(context).size.width * .4,
        ),
      ),
    );
  }
}
