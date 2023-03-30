import 'package:flutter/material.dart';

class Numpad extends StatelessWidget {
  const Numpad({super.key});

  Widget _num(String num, double height) {
    return Container(
      height: height,
      child: Center(
        child: Text(
          num,
          style: TextStyle(fontSize: 40, color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constrains) {
        var height = constrains.biggest.height / 4;
        return Table(
          border: TableBorder.all(color: Colors.grey, width: 1.0),
          children: [
            TableRow(children: [
              _num("1", height),
              _num("2", height),
              _num("3", height)
            ]),
            TableRow(children: [
              _num("4", height),
              _num("5", height),
              _num("6", height)
            ]),
            TableRow(children: [
              _num("7", height),
              _num("8", height),
              _num("9", height)
            ]),
            TableRow(children: [
              _num(",", height),
              _num("0", height),
              Container(
                height: height,
                child: Center(
                  child: Icon(
                    Icons.backspace,
                    color: Colors.grey,
                    size: 40,
                  ),
                ),
              )
            ])
          ],
        );
      },
    ));
  }
}
