import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class IntroPage extends StatefulWidget {
  @override
  mapPage createState() => mapPage();
}

class mapPage extends State<IntroPage> {
  late MapShapeSource _shapeSource;
  late MapZoomPanBehavior _zoomPanBehavior;
  late List<Model> _data;

  @override
  void initState() {
    _data = <Model>[
      const Model('United States', 'Gold : 1061\nSilver : 830\nBronze : 738\nTotal : 2629'),
      const Model('Afghanistan', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2'),
      const Model('Algeria', 'Gold : 5\nSilver : 4\nBronze : 8\nTotal : 17'),
      const Model('Argentina', 'Gold : 21\nSilver : 26\nBronze : 30\nTotal : 77'),
      const Model('Armenia', 'Gold : 2\nSilver : 8\nBronze : 8\nTotal : 18'),
      const Model('Australia', 'Gold : 164\nSilver : 173\nBronze : 210\nTotal : 547'),
      const Model('Austria', 'Gold : 20\nSilver : 35\nBronze : 41\nTotal : 96'),
      const Model('Azerbaijan', 'Gold : 7\nSilver : 14\nBronze : 28\nTotal : 49'),
      const Model('Bahamas', 'Gold : 8\nSilver : 2\nBronze : 6\nTotal : 16'),
      const Model('Belarus', 'Gold : 13\nSilver : 30\nBronze : 42\nTotal : 85'),
      const Model('Belgium', 'Gold : 44\nSilver : 56\nBronze : 57\nTotal : 157'),
      const Model('Botswana', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Brazil', 'Gold : 37\nSilver : 42\nBronze : 71\nTotal : 150'),
      const Model('Bulgaria', 'Gold : 54\nSilver : 88\nBronze : 82\nTotal : 224'),
      const Model('Burkina Faso', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Burundi', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 1'),
      const Model('Cameroon','Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6'),
      const Model('Canada','Gold : 71\nSilver : 110\nBronze : 145\nTotal : 326'),
      const Model('Chile','Gold : 2\nSilver : 7\nBronze : 4\nTotal : 13'),
      const Model('China','Gold : 263\nSilver : 199\nBronze : 174\nTotal : 636'),
      const Model('Colombia','Gold : 5 \nSilver : 13\nBronze : 16\nTotal : 34'),
      const Model('Costa Rica','Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Ivory Coast','Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Croatia','Gold : 14\nSilver : 13\nBronze : 14\nTotal : 41'),
      const Model('Cuba','Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Cyprus','Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Czech Republic','Gold : 19\nSilver : 22\nBronze : 26\nTotal : 67'),
      const Model('Denmark','Gold : 48\nSilver : 78\nBronze : 79\nTotal : 205'),
    ];
    _shapeSource = MapShapeSource.asset(
      'assets/world-map.json',
      shapeDataField: "name",
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].country,
    );
    super.initState();
    _zoomPanBehavior = MapZoomPanBehavior();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFF4A2545),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                //margin: const EdgeInsets.all(20.0),
                padding: const EdgeInsets.all(10.0),
                child: PhysicalModel(
                  color: const Color(0xFFDCCCA3),
                  borderRadius: BorderRadius.circular(20.0), // Rayon des coins
                  elevation: 8,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(10.0),
                    child: SfMaps(
                      layers: [
                        MapShapeLayer(
                          source: _shapeSource,
                          zoomPanBehavior: _zoomPanBehavior,
                          shapeTooltipBuilder:
                              (BuildContext context, int index) {
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
                                              color: const Color(0xFFD34E24),
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
                                        color: const Color(0xFFD34E24),
                                        decoration: TextDecoration.none,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .fontSize),
                                  ),
                                ],
                              ),
                            );
                          },
                          tooltipSettings: const MapTooltipSettings(
                            color: Colors.transparent,
                            strokeColor: Color(0xFFD34E24),
                            strokeWidth: 0.5,
                          ),
                        )
                      ],
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
                  color: const Color(0xFFDCCCA3),
                  borderRadius: BorderRadius.circular(20.0), // Rayon des coins
                  elevation: 8,
                  child: Container(
                    margin: const EdgeInsets.all(20.0),
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class Model {
  const Model(this.country, this.palmares);

  final String country;
  final String palmares;
}
