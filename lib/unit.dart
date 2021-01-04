import 'package:flutter/foundation.dart';

/// Información acerca de [Unit]
class Unit {
  final String name;
  final double conversion;

  /// Un [Unit] almacena su nombre y su factor de conversion.
  ///
  /// Un ejemplo podría ser 'Metro' y '1.0'.
  const Unit({@required this.name, @required this.conversion})
      : assert(name != null),
        assert(conversion != null);

  /// Crea un [Unit] desde un objeto JSON.
  Unit.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['conversion'] != null),
        name = jsonMap['name'],
        conversion = jsonMap['conversion'].toDouble;
}
