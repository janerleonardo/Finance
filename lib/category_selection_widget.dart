import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'category_widget.dart';

class CategorySelectionWidget extends StatefulWidget {
  const CategorySelectionWidget(
      {Key? key, required this.categories, required this.onCategoryChanged})
      : super(key: key);

  final Map<String, IconData> categories;
  final Function(String) onCategoryChanged;
  @override
  _CategorySelectionWidgetState createState() =>
      _CategorySelectionWidgetState();
}

class _CategorySelectionWidgetState extends State<CategorySelectionWidget> {
  String currentItem = "GOD";
  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];

    widget.categories.forEach((name, icon) {
      widgets.add(GestureDetector(
        onTap: () {
          setState(() {
            currentItem = name;
          });
          widget.onCategoryChanged(name);
        },
        child: CategoryWidget(
          name: name,
          icon: icon,
          seleted: name == currentItem,
        ),
      ));
    });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: widgets,
    );
  }
}
