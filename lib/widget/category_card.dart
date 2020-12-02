import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/screens/category_screen.dart';

class CategoryCard extends StatefulWidget {
  final String name;
  final String title;

  const CategoryCard({
    Key key,
    this.name,
    this.title,
  }) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
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
            builder: (context) => CategoryScreen(
              category: widget.name.toString().toLowerCase(),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Opacity(
          opacity: isTapped ? .5 : 1,
                  child: Container(
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.black, width: 1.8),
                top: BorderSide(color: Colors.black, width: 1.8),
                bottom: BorderSide(color: Colors.black, width: 3.5),
                right: BorderSide(color: Colors.black, width: 5),
              ),
            ),
            child: Center(
              child: Text(
                widget.title,
                style: GoogleFonts.turretRoad(
                    fontSize: 25, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
