import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool seleted;
const CategoryWidget({ Key? key, required this.name, required this.icon, required this.seleted }) : super(key: key);


  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container (
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: seleted ? Colors.blueAccent : Colors.grey,
                width: seleted ? 3.0 : 2.0
              )
            ),

            child: Icon(icon),
        ),
        Text(name)
      ]    
    ),
      
    );
  }
}