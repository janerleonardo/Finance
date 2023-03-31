
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'graph_wigget.dart';

class MonthWedget extends StatefulWidget {
  final List<DocumentSnapshot> documents;
  final double  total_value ;
  final List<double> perDay;
  final Map<String,double> categories;


  
  MonthWedget({key, required this.documents}): 
  total_value = documents.map((e) => e['value']).fold(0.0, (a, b) => a+b),
  perDay = List.generate(30, (index) {
      return documents.where((doc) => doc['day'] == (index + 1))
                      .map((e) => e['value']).fold(0.0, (a, b) => a+b);
  }),
  categories = documents.fold({}, (Map<String,double> map, document) {
        if (!map.containsKey(document['category'])){
            map[document['category']] = 0.0;
        }
        map[document['category']] = (map[document['category']]! + document['value'])! ;
        return map;
  }),
  super (key: key);

  @override
  State<MonthWedget> createState() => _MonthState();
}

class _MonthState extends State<MonthWedget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child:  Column(
      children: [
          _expenses(),
        _graph(),
        Container(
          color: Colors.blueAccent.withOpacity(0.15),
          height: 18.0,
        ),
        _list(),
      ],
    )
    ) ;
  }

   _expenses() {
    return Column(
      children: [
        Text(
          "\$${widget.total_value.toStringAsFixed(2)}",
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
      child: GraphWidget( data: widget.perDay,),
    );
  }

  _list() {
    return Expanded(
        child: ListView.separated(
      itemBuilder: (context, index) {
            var key = widget.categories.keys.elementAt(index);
            var data1 = widget.categories[key];
            return _Item(FontAwesomeIcons.shoppingCart, key, (100*data1!.toInt() ~/ widget.total_value) , data1);
            },
      separatorBuilder: (context, index) => Container(
        color: Colors.blueAccent.withOpacity(0.15),
        height: 8.0,
      ),
      itemCount: widget.categories.keys.length,
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


}