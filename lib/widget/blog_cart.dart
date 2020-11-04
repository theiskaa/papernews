import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/screens/article_screen.dart';

class BlogCard extends StatelessWidget {
  final String image;
  final String title;
  final String des;
  final String url;

  const BlogCard({
    Key key,
    this.image,
    this.title,
    this.des,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ArticleScreen(
            blogUrl: url,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          child: Column(
            children: [
              CachedNetworkImage(imageUrl: image),
              SizedBox(height: 3),
              Text(
                title,
                style: GoogleFonts.turretRoad(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                des,
                style: GoogleFonts.turretRoad(
                  color: Colors.black.withOpacity(.7),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
