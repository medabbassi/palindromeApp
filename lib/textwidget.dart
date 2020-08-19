import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextWidget extends StatelessWidget {
  String wave = '\u{1F44B}';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 30, 40, 20),
      child: Text(
        'Salut,\nFeed me a\nword ' + wave + '!!',
        style: GoogleFonts.lexendDeca(
            fontWeight: FontWeight.w800, fontSize: 60, color: Colors.white),
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
