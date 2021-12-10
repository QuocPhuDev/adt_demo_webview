import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'griddashboard.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "ADITECHCO VIỆT NAM",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Home",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/images/adt_logo.png",
                    width: 50,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard(
          )
        ],
      ),
    );
  }
}
