import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/localization/app_localization.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget button;
  final String title;
  final Widget leading;

  const CustomAppBar({
    Key key,
    this.button,
    this.leading,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.black, width: 2),
                left: BorderSide(color: Colors.black, width: 2),
              ),
            ),
            child: Text(
              ' Minor ',
              style: GoogleFonts.turretRoad(
                fontSize: 25,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 2.3),
                right: BorderSide(color: Colors.black, width: 2.8),
              ),
            ),
            child: Text(
              " ${AppLocalizations.of(context).translate("appbar_title")} ",
              style: GoogleFonts.turretRoad(
                fontSize: 23,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: button,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
