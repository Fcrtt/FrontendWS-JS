import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class IntroPage extends StatefulWidget {
  @override
  mapPage createState()=> mapPage();
}
class mapPage extends State<IntroPage>{
  late MapShapeSource _shapeSource;
  late MapZoomPanBehavior _zoomPanBehavior;
  late List<Model> _data;

  @override
  void initState() {
    _data = <Model>[
      Model('United States', 'Gold : 1061\nSilver : 830\nBronze : 738\nTotal : 2629'),
      Model('Afghanistan', 'Gold : 5\nSilver : 4\nBronze : 8\nTotal : 17'),
    ];
    _shapeSource = MapShapeSource.asset('assets/world-map.json',
      shapeDataField: "name",
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].country,);
    super.initState();
    _zoomPanBehavior = MapZoomPanBehavior();

  }
  @override
  Widget build(BuildContext context){
    return Container(
      color: Color(0xFF4A2545),
    child:   Row(
      children: [
        Expanded(flex: 2,
        child: Padding(
          //margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(10.0),
          child: PhysicalModel(
          color: Color(0xFFDCCCA3),
          borderRadius: BorderRadius.circular(20.0), // Rayon des coins
          elevation: 8,
            child:
            Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),


            child: SfMaps(
              layers: [MapShapeLayer(source: _shapeSource, zoomPanBehavior: _zoomPanBehavior,
                shapeTooltipBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 180,
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: Text(
                                _data[index].country,
                                style: TextStyle(
                                    color: Color(0xFFD34E24),
                                    decoration: TextDecoration.none,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .fontSize),
                              ),
                            ),
                            const Icon(
                              Icons.map,
                              color: Color(0xFFD34E24),
                              size: 16,
                            ),
                          ],
                        ),
                        const Divider(
                          color: Colors.white,
                          height: 10,
                          thickness: 1.2,
                        ),
                        Text(
                          _data[index].palmares,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xFFD34E24),
                              decoration: TextDecoration.none,
                              fontSize:
                              Theme.of(context).textTheme.bodyMedium!.fontSize),
                        ),
                      ],
                    ),
                  );
                },
                tooltipSettings: const MapTooltipSettings(

                    color: Colors.transparent,
                    strokeColor: Color(0xFFD34E24),
                    strokeWidth: 0.5,


                ),)],
            ),
          ),
      ),
    ),

        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
          child: PhysicalModel(
            color: Color(0xFFDCCCA3),
            borderRadius: BorderRadius.circular(20.0), // Rayon des coins
            elevation: 8,
            child:
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),

          ),
          ),
          ),
        ),
      ],
    )
    );
  }
}

class Model {
  const Model(this.country, this.palmares);

  final String country;
  final String palmares;
}