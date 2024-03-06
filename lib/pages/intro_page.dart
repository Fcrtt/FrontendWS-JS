import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class IntroPage extends StatefulWidget {
  mapPage createState()=> mapPage();
}
class mapPage extends State<IntroPage>{
  late MapShapeSource _shapeSource;
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _shapeSource = MapShapeSource.asset('assets/world-map.json', shapeDataField: 'STATE_NAME');
    super.initState();
    _zoomPanBehavior = MapZoomPanBehavior();
  }
  @override
  Widget build(BuildContext context){
    return  Row(
      children: [
        Expanded(flex: 2,
        child:
        Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(

            color: Colors.white,
          border: Border.all(color: Colors.indigo),
            borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: SfMaps(
        layers: [MapShapeLayer(source: _shapeSource, zoomPanBehavior: _zoomPanBehavior)],
      ),
    ),
    ),
        Expanded(
    flex: 1,
    child:
        Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(

              color: Colors.white,
              border: Border.all(color: Colors.indigo),
              borderRadius: BorderRadius.all(Radius.circular(20))
          ),
        ),
    ),
    ],
    );
  }
}