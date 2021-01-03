import 'package:flutter/material.dart';
// Para usar @required, hay que importar la librería foundation (que re-exporta la librería de Dart meta.dart)
import 'package:flutter/foundation.dart';

/// @required es definido en el paquete meta.dart
/// import 'package:meta/meta.dart';

// Usamos underscore para indicar que estas variables son privadas
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

/// Un widget [Category] personalizado
///
/// El widget esta compuesto por un [Icon] y un [Text]. Al presionar el widget muestra
/// una animación de coloreado [InkWell] (tintero)
class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;

  /// Crea una [Category] (categoría).
  ///
  /// Una [Category] guarda el nombre de la categoría (e.g. 'Length'), su color para
  /// la UI, y el icono que la representa (e.g. a ruler).
  /// Mientras @required comprueba si se pasa un parámetro con nombre, sin embargo
  /// no comprueba si el objeto pasado es nulo. Comprobamos eso
  /// con la declaración assert.
  const Category(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.iconLocation})
      : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        super(key: key);

  /// Construye un widget personalizado que muestra la información para [Category].
  ///
  /// Esta información incluye el nombre, icono y color de [Category].
  @override
  // El parametro `context` describe la ubicación de este widget en la
  // jerarquía de widgets. Puede ser usado para abtener datos del Theme(tema) mas cercano,
  // ancestro en la jerarquía. Debajo, podemos obtener el display1 para el tema text.
  // Mira https://docs.flutter.io/flutter/material/Theme-class.html
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          // Podemos usar cualquiera de () => function() o () { function(); }
          // sintaxis.
          onTap: () {
            print('I was tapped!');
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              // Hay dos maneras de establecer una lista: `[]` y `List()`.
              // Es preferible usar la sintaxis literal, i.e. `[]`, en lugar de `List()`.
              // Si gustas puedes agregar argumento de tipo, i.e. <Widget>[].
              // Mira https://www.dartlang.org/guides/language/effective-dart/usage#do-use-collection-literals-when-possible
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    iconLocation,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
