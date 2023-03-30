import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'category_selection_widget.dart';
import 'numpad.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  late String category;
  late double value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Category',
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.close,
                color: Colors.grey,
              ))
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [_categorySelector(), _currentValue(), _numpad(), _submit()],
    );
  }

  _categorySelector() => Container(
        height: 80.0,
        child: CategorySelectionWidget(
          categories: {
            "GOD": FontAwesomeIcons.cross,
            "Baby": FontAwesomeIcons.babyCarriage,
            "Shopping": FontAwesomeIcons.cartShopping,
            "House": FontAwesomeIcons.house,
            "Me": FontAwesomeIcons.dumbbell,
            "Credit": FontAwesomeIcons.buildingColumns,
            "Thriftiness": FontAwesomeIcons.piggyBank
          },
          onCategoryChanged: (newCategory) => category = newCategory,
        ),
      );

  _currentValue() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Text(
          "\$${value.toStringAsFixed(2)}",
          style: TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.w500,
              fontSize: 50.0),
        ),
      );

  _numpad() => Numpad(sendValue: (newValue, inds)  {
    setState(() {
      if(inds){
        value = value *  10 +newValue;
      } else {
        value = newValue;
      }
      
    });
  });

  _submit() => Container(
    height: 50.0,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.blueAccent,
    ),
    child: MaterialButton(
      onPressed: () { 
        if (value > 0 && category != ""){

        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:  Text('Select a value or a category')));
        }
       },
      child: Text('Add expense',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0
      ),),
    ),
  );
}
