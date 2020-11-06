import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/screens/category_screen.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String title;

  const CategoryCard({
    Key key,
    this.name,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryScreen(
            category: name.toString().toLowerCase(),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
              title,
              style: GoogleFonts.turretRoad(
                  fontSize: 25, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ),
    );
  }
}
