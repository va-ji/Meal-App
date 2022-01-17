import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/wigets.dart';

import '../dummy_data.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegeterian = false;
  var _isVegan = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilters['gluten']!;
    _isLactoseFree = widget.currentFilters['lactose']!;
    _isVegeterian = widget.currentFilters['vegetarian']!;
    _isVegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget _buildSwitchListTille(
    String title,
    String description,
    bool value,
    Function(bool) upDateValues,
  ) {
    return SwitchListTile(
        title: Text(title),
        value: value,
        subtitle: Text(description),
        onChanged: upDateValues);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedFilters = {
                  'gluten': _isGlutenFree,
                  'lactose': _isLactoseFree,
                  'vegetarian': _isVegeterian,
                  'vegan': _isVegan,
                };
                widget.saveFilters(selectedFilters);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTille(
                  'Gluten Free',
                  'Only include gluten free meals',
                  _isGlutenFree,
                  (newValue) {
                    setState(
                      () {
                        _isGlutenFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTille(
                  'Lactose Free',
                  'Only include Lactose free meals',
                  _isLactoseFree,
                  (newValue) {
                    setState(
                      () {
                        _isLactoseFree = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTille(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _isVegeterian,
                  (newValue) {
                    setState(
                      () {
                        _isVegeterian = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTille(
                  'Vegan',
                  'Only include Vegan meals',
                  _isVegan,
                  (newValue) {
                    setState(
                      () {
                        _isVegan = newValue;
                      },
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
