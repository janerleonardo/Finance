import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'graph_wigget.dart';

class FinanceApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FinanceApp();
  }
}

class _FinanceApp extends State<FinanceApp> {
  late PageController _controller;
  late int currentPage = 9;

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
        Container(
          color: Colors.blueAccent.withOpacity(0.15),
          height: 18.0,
        ),
        _list(),
      ],
    ));
  }

  Widget _pageItem(String name, int position) {
    var _alignment;

    final seleted = TextStyle(
        fontSize: 20.0, color: Colors.blueGrey, fontWeight: FontWeight.bold);
    final unseleted = TextStyle(
        fontSize: 20.0,
        color: Colors.blueGrey.withOpacity(0.4),
        fontWeight: FontWeight.normal);

    if (position == currentPage) {
      _alignment = Alignment.center;
    } else if (position > currentPage) {
      _alignment = Alignment.centerRight;
    } else {
      _alignment = Alignment.centerLeft;
    }
    return Align(
      alignment: _alignment,
      child: Text(
        name,
        style: position == currentPage ? seleted : unseleted,
      ),
    );
  }

  _selector() {
    return SizedBox.fromSize(
        size: Size.fromHeight(70.0),
        child: PageView(
          controller: _controller,
          onPageChanged: (newPage) {
            setState(() {
              currentPage = newPage;
            });
          },
          children: [
            _pageItem("Enero", 0),
            _pageItem("Febrero", 1),
            _pageItem("Marzo", 2),
            _pageItem("Abril", 3),
            _pageItem("Mayo", 4),
            _pageItem("Junio", 5),
            _pageItem("Julio", 6),
            _pageItem("Agosto", 7),
            _pageItem("Septiembre", 8),
            _pageItem("Octubre", 9),
            _pageItem("Noviembre", 10),
            _pageItem("Diciembre", 11),
          ],
        ));
  }

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

  _list() {
    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) =>
          _Item(FontAwesomeIcons.shoppingCart, "Shopping", 14, 230.00),
      separatorBuilder: (context, index) => Container(
        color: Colors.blueAccent.withOpacity(0.15),
        height: 8.0,
      ),
      itemCount: 10,
    ));
  }

  _Item(IconData icon, String name, int percent, double value) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32.0,
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
        "$percent% of expenses",
        style: TextStyle(fontSize: 20.0, color: Colors.blueGrey),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent.withOpacity(0.2),
          borderRadius: BorderRadius.circular(3.0),
        ),
        child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "\$$value",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent,
                  fontSize: 18.0),
            )),
      ),
    );
  }

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

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        PageController(initialPage: currentPage, viewportFraction: 0.4);
    super.initState();
  }
}
