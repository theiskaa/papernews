import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/screens/article_screen.dart';

class BlogCard extends StatefulWidget {
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
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {

  
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
      child: buildCard(),
    );
  }

  Padding buildCard() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          child: Column(
            children: [
              CachedNetworkImage(imageUrl: widget.image),
              SizedBox(height: 3),
              Text(
                widget.title,
                style: GoogleFonts.turretRoad(
                  color: Colors.black,
                  fontSize: 23,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 5),
              Text(
                widget.des,
                style: GoogleFonts.turretRoad(
                  color: Colors.black.withOpacity(.7),
                  fontSize: 18.5,
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
