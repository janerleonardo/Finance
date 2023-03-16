import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'graph_wigget.dart';

class FinanceApp extends StatelessWidget {
  Widget _bottomAction(IconData icon) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(icon),
      ),
      onTap: () {},
    );
  }

  Widget _body() {
    return SafeArea(
        child: Column(
      children: [
        _selector(),
        _expenses(),
        _graph(),
        _list(),
      ],
    ));
  }

  _selector() => Container();

  _expenses() {
    return Column(
      children: [
        Text(
          "\$2361,41",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
          ),
        ),
        Text(
          "Total expenses",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: Colors.blueGrey,
          ),
        )
      ],
    );
  }

  _graph() {
    return Container(
      height: 250.0,
      child: GraphWidget(),
    );
  }

  _list() => Container();


  
  @override
  Widget build(BuildContext context) {
    final _buttomBar = BottomAppBar(
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
    );

    return Scaffold(
      bottomNavigationBar: _buttomBar,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: _body(),
    );
  }
}
