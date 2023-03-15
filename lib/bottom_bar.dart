import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class buttomBar extends StatelessWidget {

  
    Widget _bottomAction(IconData icon) {
      return InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
        onTap: () {},
      );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        notchMargin: 4.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           _bottomAction(FontAwesomeIcons.history),
           _bottomAction(FontAwesomeIcons.chartPie),
           SizedBox(width: 48.0),
           _bottomAction(FontAwesomeIcons.wallet),
           _bottomAction(Icons.settings),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
        ),
    );
  }


}