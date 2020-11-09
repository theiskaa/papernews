import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/localization/app_localization.dart';

class InfoLang extends StatelessWidget {
  const InfoLang({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildMinorNewsTitle(context),
            SizedBox(height: 30),
            buildTextBox(context),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Padding buildTextBox(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(color: Colors.black, width: 2.5),
            top: BorderSide(color: Colors.black, width: 2.5),
            bottom: BorderSide(color: Colors.black, width: 4),
            right: BorderSide(color: Colors.black, width: 6),
          ),
        ),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).translate("info_lang"),
              textAlign: TextAlign.center,
              style: GoogleFonts.turretRoad(
                color: Colors.black.withOpacity(.8),
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildMinorNewsTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black, width: 3),
              left: BorderSide(color: Colors.black, width: 3),
            ),
          ),
          child: Text(
            ' Minor ',
            style: GoogleFonts.turretRoad(
              fontSize: 35,
              fontWeight: FontWeight.w900,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.black, width: 3),
              right: BorderSide(color: Colors.black, width: 4),
            ),
          ),
          child: Text(
            " ${AppLocalizations.of(context).translate("appbar_title")} ",
            style: GoogleFonts.turretRoad(
              fontSize: 30,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}
