import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;
  final centerMap = LatLng(-0.117104, -78.499723);
  String selectedStyle =
      'mapbox://styles/xanderjames1910/ckmyjvn6b1wgi17qjqbz1pnic';
  final oscuroStyle =
      'mapbox://styles/xanderjames1910/ckmyjt8wb1wbk17pds1smxbl9';
  final streetStyle =
      'mapbox://styles/xanderjames1910/ckmyjvn6b1wgi17qjqbz1pnic';

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: crearMapa(),
      floatingActionButton: botonesFlotantes(),
    );
  }

  Column botonesFlotantes() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        // Símbolos
        Container(
          height: 45.0,
          width: 45.0,
          child: FittedBox(
            child: FloatingActionButton(
              child: Icon(Icons.sentiment_very_dissatisfied),
              onPressed: () {
                mapController.addSymbol(
                  SymbolOptions(
                    geometry: centerMap,
                    iconImage: 'attraction-15',
                    iconSize: 3,
                    textField: 'Montaña creada',
                    textOffset: Offset(0, 2),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        // ZoomIN
        Container(
          height: 45.0,
          width: 45.0,
          child: FittedBox(
            child: FloatingActionButton(
              child: Icon(Icons.zoom_in),
              onPressed: () {
                mapController.animateCamera(CameraUpdate.zoomIn());
              },
            ),
          ),
        ),
        SizedBox(height: 5),
        // ZoomOut
        Container(
          height: 45.0,
          width: 45.0,
          child: FittedBox(
            child: FloatingActionButton(
              child: Icon(Icons.zoom_out),
              onPressed: () {
                mapController.animateCamera(CameraUpdate.zoomOut());
              },
            ),
          ),
        ),
        SizedBox(height: 8),
        // Cambiar Estilo
        FloatingActionButton(
          child: Icon(Icons.add_to_home_screen),
          onPressed: () {
            if (selectedStyle == oscuroStyle) {
              selectedStyle = streetStyle;
            } else {
              selectedStyle = oscuroStyle;
            }
            setState(() {});
          },
        ),
      ],
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      styleString: selectedStyle,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        zoom: 14,
        target: centerMap,
      ),
    );
  }
}
