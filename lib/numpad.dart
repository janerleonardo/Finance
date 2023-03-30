import 'package:flutter/material.dart';

class Numpad extends StatefulWidget {
  const Numpad({super.key, required this.sendValue});
  final Function(double, bool) sendValue;

  @override
  State<Numpad> createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  double value = 0.0;
  Widget _num(String num, double height) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          value = double.parse(num);
        });
        widget.sendValue(value, true);
      },
      child: Container(
        height: height,
        child: Center(
          child: Text(
            num,
            style: TextStyle(fontSize: 40, color: Colors.grey),
          ),
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
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      value = 0.0;
                    });
                    widget.sendValue(value, false);
                  },
                  child: Container(
                    height: height,
                    child: Center(
                      child: Icon(
                        Icons.backspace,
                        color: Colors.grey,
                        size: 40,
                      ),
                    ),
                  ))
            ])
          ],
        );
      },
    ));
  }
}
