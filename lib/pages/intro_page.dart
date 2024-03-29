import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:flutter_svg/svg.dart';


import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart';





const Color violet = Color(0xFF4A2545);
const Color beige = Color(0xFFDCCCA3);

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
      const Model('Cameroon', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6'),
      const Model('Canada', 'Gold : 71\nSilver : 110\nBronze : 145\nTotal : 326'),
      const Model('Chile', 'Gold : 2\nSilver : 7\nBronze : 4\nTotal : 13'),
      const Model('China', 'Gold : 263\nSilver : 199\nBronze : 174\nTotal : 636'),
      const Model('Colombia', 'Gold : 5 \nSilver : 13\nBronze : 16\nTotal : 34'),
      const Model('Costa Rica', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Ivory Coast', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Croatia', 'Gold : 14\nSilver : 13\nBronze : 14\nTotal : 41'),
      const Model('Cuba', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Cyprus', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Czech Republic', 'Gold : 19\nSilver : 22\nBronze : 26\nTotal : 67'),
      const Model('Denmark', 'Gold : 48\nSilver : 78\nBronze : 79\nTotal : 205'),
      const Model('Djibouti', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Dominican Republic', 'Gold : 3\nSilver : 5\nBronze : 4\nTotal : 12'),
      const Model('Ecuador', 'Gold : 3\nSilver : 2\nBronze : 0\nTotal : 5'),
      const Model('Egypt', 'Gold : 8\nSilver : 11\nBronze : 19\nTotal : 38'),
      const Model('Eritrea', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Ethiopia', 'Gold : 23\nSilver : 12\nBronze : 23\nTotal : 58'),
      const Model('Fiji', 'Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3'),
      const Model('Finland', 'Gold : 101\nSilver : 85\nBronze : 119\nTotal : 305'),
      const Model('France', 'Gold : 223\nSilver : 251\nBronze : 277\nTotal : 751'),
      const Model('Gabon', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Georgia', 'Gold : 10\nSilver : 12\nBronze : 18\nTotal : 40'),
      const Model('Germany', 'Gold : 201\nSilver : 207\nBronze : 247\nTotal : 655'),
      const Model('Ghana', 'Gold : 0\nSilver : 1\nBronze : 4\nTotal : 5'),
      const Model('United Kingdom', 'Gold : 284\nSilver : 318\nBronze : 314\nTotal : 916'),
      const Model('Greece', 'Gold : 35\nSilver : 45\nBronze : 41\nTotal : 121'),
      const Model('Guatemala', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Guyana', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Haiti', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Hungary', 'Gold : 181\nSilver : 154\nBronze : 176\nTotal : 511'),
      const Model('Iceland', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4'),
      const Model('India', 'Gold : 10\nSilver : 9\nBronze : 16\nTotal : 35'),
      const Model('Indonesia', 'Gold : 8\nSilver : 14\nBronze : 15\nTotal : 37'),
      const Model('Iran', 'Gold : 24\nSilver : 23\nBronze : 29\nTotal : 76'),
      const Model('Iraq', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Ireland', 'Gold : 11\nSilver : 10\nBronze : 14\nTotal : 35'),
      const Model('Israel', 'Gold : 3\nSilver : 1\nBronze : 9\nTotal : 13'),
      const Model('Italy', 'Gold : 217\nSilver : 188\nBronze : 213\nTotal : 618'),
      const Model('Jamaica', 'Gold : 26\nSilver : 36\nBronze : 26\nTotal : 88'),
      const Model('Japan', 'Gold : 169\nSilver : 150\nBronze : 178\nTotal : 497'),
      const Model('Jordan', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3'),
      const Model('Kazakhstan', 'Gold : 14\nSilver : 22\nBronze : 35\nTotal : 71'),
      const Model('Kenya', 'Gold : 35\nSilver : 42\nBronze : 36\nTotal : 113'),
      const Model('Kosovo', 'Gold : 3\nSilver : 0\nBronze : 0\nTotal : 3'),
      const Model('North Korea', 'Gold : 16\nSilver : 16\nBronze : 23\nTotal : 55'),
      const Model('South Korea', 'Gold : 96\nSilver : 91\nBronze : 100\nTotal : 287'),
      const Model('Kuwait', 'Gold : 0\nSilver : 0\nBronze : 3\nTotal : 3'),
      const Model('Kyrgyzstan', 'Gold : 0\nSilver : 3\nBronze : 4\nTotal : 7'),
      const Model('Latvia', 'Gold : 4\nSilver : 11\nBronze : 6\nTotal : 21'),
      const Model('Lebanon', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4'),
      const Model('Lithuania', 'Gold : 6\nSilver : 7\nBronze : 13\nTotal : 26'),
      const Model('Luxembourg', 'Gold : 2\nSilver : 1\nBronze : 0\nTotal : 3'),
      const Model('Malaysia', 'Gold : 0\nSilver : 8\nBronze : 5\nTotal : 13'),
      const Model('Mexico', 'Gold : 13\nSilver : 24\nBronze : 35\nTotal : 72'),
      const Model('Moldova', 'Gold : 0\nSilver : 2\nBronze : 4\nTotal : 6'),
      const Model('Mongolia', 'Gold : 2\nSilver : 11\nBronze : 17\nTotal : 30'),
      const Model('Montenegro', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Morocco', 'Gold : 7\nSilver : 5\nBronze : 12\nTotal : 24'),
      const Model('Mozambique', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2'),
      const Model('Namibia', 'Gold : 0\nSilver : 5\nBronze : 0\nTotal : 5'),
      const Model('Netherlands', 'Gold : 95\nSilver : 105\nBronze : 122\nTotal : 322'),
      const Model('New Zealand', 'Gold : 53\nSilver : 33\nBronze : 51\nTotal : 137'),
      const Model('Niger', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Nigeria', 'Gold : 3\nSilver : 11\nBronze : 13\nTotal : 27'),
      const Model('Norway', 'Gold : 61\nSilver : 52\nBronze : 50\nTotal : 163'),
      const Model('Pakistan', 'Gold : 3\nSilver : 3\nBronze : 4\nTotal : 10'),
      const Model('Panama', 'Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3'),
      const Model('Paraguay', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Peru', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4'),
      const Model('Philippines', 'Gold : 1\nSilver : 5\nBronze : 8\nTotal : 14'),
      const Model('Poland', 'Gold : 72\nSilver : 89\nBronze : 137\nTotal : 298'),
      const Model('Portugal', 'Gold : 5\nSilver : 9\nBronze : 14\nTotal : 28'),
      const Model('Puerto Rico', 'Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10'),
      const Model('Qatar', 'Gold : 2\nSilver : 2\nBronze : 4\nTotal : 8'),
      const Model('Romania', 'Gold : 90\nSilver : 97\nBronze : 121\nTotal : 308'),
      const Model('Russia', 'Gold : 147\nSilver : 126\nBronze : 151\nTotal : 424'),
      const Model('Saudi Arabia', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4'),
      const Model('Senegal', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Serbia', 'Gold : 6\nSilver : 7\nBronze : 11\nTotal : 24'),
      const Model('Slovakia', 'Gold : 10\nSilver : 14\nBronze : 8\nTotal : 32'),
      const Model('Slovenia', 'Gold : 8\nSilver : 9\nBronze : 11\nTotal : 28'),
      const Model('South Africa', 'Gold : 27\nSilver : 33\nBronze : 29\nTotal : 89'),
      const Model('Spain', 'Gold : 48\nSilver : 72\nBronze : 49\nTotal : 169'),
      const Model('Sri Lanka', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2'),
      const Model('Sudan', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Suriname', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2'),
      const Model('Sweden', 'Gold : 147\nSilver : 177\nBronze : 179\nTotal : 503'),
      const Model('Switzerland', 'Gold : 53\nSilver : 79\nBronze : 74\nTotal : 206'),
      const Model('Syria', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Tajikistan', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Tanzania', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2'),
      const Model('Thailand', 'Gold : 10\nSilver : 8\nBronze : 17\nTotal : 35'),
      const Model('Togo', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Tonga', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Trinidad and Tobago', 'Gold : 3\nSilver : 5\nBronze : 11\nTotal : 19'),
      const Model('Tunisia', 'Gold : 5\nSilver : 3\nBronze : 7\nTotal : 15'),
      const Model('Turkey', 'Gold : 41\nSilver : 26\nBronze : 36\nTotal : 103'),
      const Model('Turkmenistan', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Uganda', 'Gold : 4\nSilver : 4\nBronze : 3\nTotal : 11'),
      const Model('Ukraine', 'Gold : 35\nSilver : 36\nBronze : 68\nTotal : 139'),
      const Model('United Arab Emirates', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2'),
      const Model('Uruguay', 'Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10'),
      const Model('Uzbekistan', 'Gold : 10\nSilver : 6\nBronze : 20\nTotal : 36'),
      const Model('Venezuela', 'Gold : 3\nSilver : 7\nBronze : 9\nTotal : 19'),
      const Model('Vietnam', 'Gold : 1\nSilver : 3\nBronze : 1\nTotal : 5'),
      const Model('Zambia', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Zimbabwe', 'Gold : 3\nSilver : 4\nBronze : 1\nTotal : 8'),
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
      color: const Color(0xFF4A2545), // Couleur de fond globale
      child: Column( // Utilisation d'une Column pour disposer les widgets verticalement
        children: [
        SearchSection(), // appel de la classe SearchSection
          Expanded(
            child: Padding(
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
                                      const Icon(  // Icon de sifflet dans le tooltip
                                        Icons.sports,
                                        color: Color(0xFFD34E24),
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Color(0xFFD34E24),
                                    height: 10,
                                    thickness: 0.5,
                                  ),
                                  Text(     // texte gold medal ect
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
          ],
        ));
  }
}



class Model {
  const Model(this.country, this.palmares);

  final String country;
  final String palmares;
}

class SearchSection extends StatefulWidget {
  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  SfRangeValues _yearValues = SfRangeValues(DateTime(1896), DateTime(2024));


  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20.0),

      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 25, 10, 25),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(1, 5), // changes position of shadow
                        ),
                      ],
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Enter a country...",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(25), // Faire un rond
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Icon(Icons.search, size: 26),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10),
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Select a year range",
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            //
            _yearRangeSlider(),
          ],
        ),
      ),
    );
  }


  Widget _yearRangeSlider() {
    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(tooltipBackgroundColor: Colors.blue),
      child: SfRangeSlider(
        min: DateTime(1896),
        max: DateTime(2024),
        showLabels: true,
        interval: 4,
        dateFormat: DateFormat.y(),
        labelPlacement: LabelPlacement.onTicks,
        dateIntervalType: DateIntervalType.years,
        showTicks: true,
        values: _yearValues,
        onChanged: (SfRangeValues values) {
          setState(() {
            _yearValues = values;
          });
        },
        enableTooltip: true,
        tooltipTextFormatterCallback: (dynamic actualLabel, String formattedText) {
          return DateFormat.y().format(actualLabel);
        },
      ),
    );
  }
}


// j'ai pas reussi à l'integrer dans le code ... je vouais juste mettre un titre à la page
class Titre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Olympic Games Explorer'),
        backgroundColor: const Color(0xFF4A2545),
      ),
    );
  }
}
