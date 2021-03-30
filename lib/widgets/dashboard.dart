import 'package:flutter/material.dart';

Card makeDashboardItem(String title, IconData icon, Color boxdecoration) {
  return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: boxdecoration),
        child: new InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.black,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style: new TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}
