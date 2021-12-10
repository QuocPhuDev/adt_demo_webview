import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'webview.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "Scanner",
    subtitle: "Scan barcode",
    event: "3 Menus",
    img: "assets/images/adt_logo.png",
  );

  Items item2 = new Items(
    title: "Locations",
    subtitle: "Check with location",
    event: "4 Menus",
    img: "assets/images/adt_logo.png",
  );
  Items item3 = new Items(
    title: "Document Scan",
    subtitle: "Document scan",
    event: "1 Menus",
    img: "assets/images/adt_logo.png",
  );
  Items item4 = new Items(
    title: "Webview",
    subtitle: "Web content",
    event: "",
    img: "assets/images/adt_logo.png",
  );
  Items item5 = new Items(
    title: "Notifications",
    subtitle: "List notifications",
    event: "3 Menus",
    img: "assets/images/adt_logo.png",
  );
  Items item6 = new Items(
    title: "Settings",
    subtitle: "",
    event: "2 Menus",
    img: "assets/images/adt_logo.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    //var color = 0xff0277bd;
    var color = 0xffffffff;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  color: Color(color),
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      data.img,
                      width: 42,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.title,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      data.subtitle,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.blueGrey,
                              fontSize: 10,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      data.event,
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.lightBlueAccent,
                              fontSize: 11,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                onTap: () {
                  if (data.title.contains("Webview")) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WebViewPage()));
                  }
                },
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;

  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}
