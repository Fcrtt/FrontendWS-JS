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
      const Model('Djibouti','Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Dominican Republic','Gold : 3\nSilver : 5\nBronze : 4\nTotal : 12'),
      const Model('Ecuador','Gold : 3\nSilver : 2\nBronze : 0\nTotal : 5'),
      const Model('Egypt','Gold : 8\nSilver : 11\nBronze : 19\nTotal : 38'),
      const Model('Eritrea','Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Ethiopia','Gold : 23\nSilver : 12\nBronze : 23\nTotal : 58'),
      const Model('Fiji','Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3'),
      const Model('Finland','Gold : 101\nSilver : 85\nBronze : 119\nTotal : 305'),
      const Model('France','Gold : 223\nSilver : 251\nBronze : 277\nTotal : 751'),
      const Model('Gabon','Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Georgia','Gold : 10\nSilver : 12\nBronze : 18\nTotal : 40'),
      const Model('Germany','Gold : 201\nSilver : 207\nBronze : 247\nTotal : 655'),
      const Model('Ghana','Gold : 0\nSilver : 1\nBronze : 4\nTotal : 5'),
      const Model('United Kingdom','Gold : 284\nSilver : 318\nBronze : 314\nTotal : 916'),
      const Model('Greece','Gold : 35\nSilver : 45\nBronze : 41\nTotal : 121'),
      const Model('Guatemala','Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Guyana','Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Haiti','Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Hungary','Gold : 181\nSilver : 154\nBronze : 176\nTotal : 511'),
      const Model('Iceland','Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4'),
      const Model('India','Gold : 10\nSilver : 9\nBronze : 16\nTotal : 35'),
      const Model('Indonesia','Gold : 8\nSilver : 14\nBronze : 15\nTotal : 37'),
      const Model('Iran','Gold : 24\nSilver : 23\nBronze : 29\nTotal : 76'),
      const Model('Iraq','Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Ireland','Gold : 11\nSilver : 10\nBronze : 14\nTotal : 35'),
      const Model('Israel','Gold : 3\nSilver : 1\nBronze : 9\nTotal : 13'),
      const Model('Italy','Gold : 217\nSilver : 188\nBronze : 213\nTotal : 618'),
      const Model('Jamaica','Gold : 26\nSilver : 36\nBronze : 26\nTotal : 88'),
      const Model('Japan','Gold : 169\nSilver : 150\nBronze : 178\nTotal : 497'),
      const Model('Jordan','Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3'),
      const Model('Kazakhstan','Gold : 14\nSilver : 22\nBronze : 35\nTotal : 71'),
      const Model('Kenya','Gold : 35\nSilver : 42\nBronze : 36\nTotal : 113'),
      const Model('Kosovo','Gold : 3\nSilver : 0\nBronze : 0\nTotal : 3'),
      const Model('North Korea','Gold : 16\nSilver : 16\nBronze : 23\nTotal : 55'),
      const Model('South Korea','Gold : 96\nSilver : 91\nBronze : 100\nTotal : 287'),
      const Model('Kuwait','Gold : 0\nSilver : 0\nBronze : 3\nTotal : 3'),
      const Model('Kyrgyzstan','Gold : 0\nSilver : 3\nBronze : 4\nTotal : 7'),
      const Model('Latvia','Gold : 4\nSilver : 11\nBronze : 6\nTotal : 21'),
      const Model('Lebanon','Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4'),
      const Model('Lithuania','Gold : 6\nSilver : 7\nBronze : 13\nTotal : 26'),
      const Model('Luxembourg','Gold : 2\nSilver : 1\nBronze : 0\nTotal : 3'),
      const Model('Malaysia','Gold : 0\nSilver : 8\nBronze : 5\nTotal : 13'),
      const Model('Mexico','Gold : 13\nSilver : 24\nBronze : 35\nTotal : 72'),
      const Model('Moldova','Gold : 0\nSilver : 2\nBronze : 4\nTotal : 6'),
      const Model('Mongolia','Gold : 2\nSilver : 11\nBronze : 17\nTotal : 30'),
      const Model('Montenegro','Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Morocco','Gold : 7\nSilver : 5\nBronze : 12\nTotal : 24'),
      const Model('Mozambique','Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2'),
      const Model('Namibia','Gold : 0\nSilver : 5\nBronze : 0\nTotal : 5'),
      const Model('Netherlands','Gold : 95\nSilver : 105\nBronze : 122\nTotal : 322'),
      const Model('New Zealand','Gold : 53\nSilver : 33\nBronze : 51\nTotal : 137'),
      const Model('Niger','Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Nigeria','Gold : 3\nSilver : 11\nBronze : 13\nTotal : 27'),
      const Model('Norway','Gold : 61\nSilver : 52\nBronze : 50\nTotal : 163'),
      const Model('Pakistan','Gold : 3\nSilver : 3\nBronze : 4\nTotal : 10'),
      const Model('Panama','Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3'),
      const Model('Paraguay','Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Peru','Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4'),
      const Model('Philippines','Gold : 1\nSilver : 5\nBronze : 8\nTotal : 14'),
      const Model('Poland','Gold : 72\nSilver : 89\nBronze : 137\nTotal : 298'),
      const Model('Portugal','Gold : 5\nSilver : 9\nBronze : 14\nTotal : 28'),
      const Model('Puerto Rico','Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10'),
      const Model('Qatar','Gold : 2\nSilver : 2\nBronze : 4\nTotal : 8'),
      const Model('Romania','Gold : 90\nSilver : 97\nBronze : 121\nTotal : 308'),
      const Model('Russia','Gold : 147\nSilver : 126\nBronze : 151\nTotal : 424'),
      const Model('Saudi Arabia','Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4'),
      const Model('Senegal','Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Serbia','Gold : 6\nSilver : 7\nBronze : 11\nTotal : 24'),
      const Model('Slovakia','Gold : 10\nSilver : 14\nBronze : 8\nTotal : 32'),


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
