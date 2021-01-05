import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:unit_converter/unit.dart';

/// Pantalla de conversión donde los usuarios pueden ingresar cantidades para convertir.
///
/// Actualmente, solo muestra una lista de unidades simuladas.
///
/// Si bien se llama ConverterRoute, un nombre más adecuado sería ConverterScreen,
/// porque es responsable de la interfaz de usuario en el destino de la ruta.
class ConverterRoute extends StatefulWidget {
  /// Color para esta [Category].
  final Color color;

  /// Unidades para esta [Category].
  final List<Unit> units;

  /// [ConverterRoute] requiere que el color y las unidades no sean nulos.
  const ConverterRoute({
    @required this.units,
    @required this.color,
  })  : assert(units != null),
        assert(color != null);

  @override
  _ConverterRouteState createState() => _ConverterRouteState();
}

class _ConverterRouteState extends State<ConverterRoute> {
  @override
  Widget build(BuildContext context) {
    // Aquí es solo un marcador de posición para una lista de unidades simuladas
    final unitWidgets = widget.units.map((Unit unit) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: widget.color,
        child: Column(
          children: <Widget>[
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: unitWidgets,
    );
  }
}
