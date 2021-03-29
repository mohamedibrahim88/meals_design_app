import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meal_screen.dart';
import 'package:meals_app/screens/tabs_screen.dart';
import 'file:///C:/Users/master/AndroidStudioProjects/meals_app/lib/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget{
  Widget buildListTile (String text , IconData icon , Function hundler){
    return ListTile(
      leading: Icon (
        icon,
      ),
      title: Text(
        text
      ),
      onTap: hundler
    );
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget> [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(
              vertical: 20,
            ),
            height: 120,
            color: Theme.of(context).accentColor,
            child: Text('Cooking UP !!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor
            ),),
          ),
            SizedBox(
              height: 25,
            ),
            buildListTile('Meals', Icons.restaurant,() {
              Navigator.of(context).pushNamed('/');
            }
            ),
            SizedBox(
              height: 10,
            ),
            buildListTile('Filters', Icons.settings,(){
              Navigator.of(context).pushNamed(Filters.routeName);
            })
        ]
        ),
      ),
    );
  }

}