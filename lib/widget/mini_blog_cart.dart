import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/screens/article_screen.dart';

class MiniBlogCard extends StatefulWidget {
  final String title;
  final String des;
  final String url;

  const MiniBlogCard({
    Key key,
    this.title,
    this.des,
    this.url,
  }) : super(key: key);

  @override
  _MiniBlogCardState createState() => _MiniBlogCardState();
}

class _MiniBlogCardState extends State<MiniBlogCard> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        setState(() {
          isTapped = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isTapped = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          isTapped = false;
        });
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleScreen(
              blogUrl: widget.url,
            ),
          ),
        );
      },
     
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Opacity(
          opacity: isTapped ? .5 : 1,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.black, width: 2.5),
                top: BorderSide(color: Colors.black, width: 2.5),
                bottom: BorderSide(color: Colors.black, width: 4),
                right: BorderSide(color: Colors.black, width: 6),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: GoogleFonts.turretRoad(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.des,
                    style: GoogleFonts.turretRoad(
                      color: Colors.black.withOpacity(.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
