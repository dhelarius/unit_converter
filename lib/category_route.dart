import 'package:flutter/material.dart';
import 'package:unit_converter/category.dart';

final _backgroundColor = Colors.green[100];

/// Category Route (pantalla).
///
/// Esta es la pantalla 'home' del convertidor de unidades. Muestra un encabezado y
/// una lista de [Categories].
///
/// Si bien se llama CategoryRoute, un nombre más adecuado sería CategoryScreen,
/// porque es responsable de la interfaz de usuario en el destino de la ruta.
class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryNames = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.pinkAccent,
    Colors.red,
  ];

  /// Hace el número correcto de filas para el listview.
  ///
  /// Para el retrato, construimos un [ListView] a partir de la lista de widgets de categoría.
  Widget _buildCategoriesWidget(List<Widget> categories) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categories[index],
      itemCount: categories.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = <Category>[];

    for (var i = 0; i < _categoryNames.length; i++) {
      categories.add(Category(
          name: _categoryNames[i],
          color: _baseColors[i],
          iconLocation: Icons.cake));
    }

    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildCategoriesWidget(categories),
    );

    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Unit Converter',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
