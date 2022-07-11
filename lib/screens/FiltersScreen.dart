import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/MainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = "/filters";
  final _filters;
  final _setFilters;

  FiltersScreen(this._filters, this._setFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
//   bool _glutenFree = false;

//   bool _lactoseFree = false;

//   bool _vegan = false;

//   bool _vegetarian = false;
  Map<String, bool> _filterData;
  void initState() {
    _filterData = widget._filters;
    super.initState();
  }

  Widget _buildSwitchWidget(
      String title, String subTitle, bool currentValue, Function onChange) {
    return (SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subTitle),
      onChanged: onChange,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Filters Page"), actions: [
        IconButton(
          icon: Icon(Icons.save),
          onPressed: () {
            // print(this._filterData);
            widget._setFilters(this._filterData);
          },
        ),
      ]),
      drawer: MainDrawer(),
      body: Column(children: [
        Container(
          padding: EdgeInsets.all(20),
          child: Text(
            "Adjust your meal selection.",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
            child: ListView(
          children: [
            _buildSwitchWidget("Gluten-free", "Only include Gluten-free meals",
                widget._filters["glutenFree"], (newValue) {
              setState(() {
                widget._filters["glutenFree"] = newValue;
              });
            }),
            _buildSwitchWidget(
                "Lactose-free",
                "Only include Lactose-free meals",
                widget._filters["lactoseFree"], (newValue) {
              setState(() {
                widget._filters["lactoseFree"] = newValue;
              });
            }),
            _buildSwitchWidget(
                "Vegan", "Only include Vegan meals", widget._filters["vegan"],
                (newValue) {
              setState(() {
                widget._filters["vegan"] = newValue;
              });
            }),
            _buildSwitchWidget("Vegetarian", "Only include Vegetarian meals",
                widget._filters["vegetarian"], (newValue) {
              setState(() {
                widget._filters["vegetarian"] = newValue;
              });
            }),
          ],
        ))
      ]),
    );
  }
}
