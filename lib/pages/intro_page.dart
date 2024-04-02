import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart' as sliders;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


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
  late sliders.SfRangeValues _yearValues;
  late List<ChartData> _chartData;


  @override
  void initState() {
    _data = <Model>[
      const Model('United States',
          'Gold : 1061\nSilver : 830\nBronze : 738\nTotal : 2629'),
      const Model('Afghanistan', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2'),
      const Model('Algeria', 'Gold : 5\nSilver : 4\nBronze : 8\nTotal : 17'),
      const Model(
          'Argentina', 'Gold : 21\nSilver : 26\nBronze : 30\nTotal : 77'),
      const Model('Armenia', 'Gold : 2\nSilver : 8\nBronze : 8\nTotal : 18'),
      const Model(
          'Australia', 'Gold : 164\nSilver : 173\nBronze : 210\nTotal : 547'),
      const Model('Austria', 'Gold : 20\nSilver : 35\nBronze : 41\nTotal : 96'),
      const Model(
          'Azerbaijan', 'Gold : 7\nSilver : 14\nBronze : 28\nTotal : 49'),
      const Model('Bahamas', 'Gold : 8\nSilver : 2\nBronze : 6\nTotal : 16'),
      const Model('Belarus', 'Gold : 13\nSilver : 30\nBronze : 42\nTotal : 85'),
      const Model(
          'Belgium', 'Gold : 44\nSilver : 56\nBronze : 57\nTotal : 157'),
      const Model('Botswana', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Brazil', 'Gold : 37\nSilver : 42\nBronze : 71\nTotal : 150'),
      const Model(
          'Bulgaria', 'Gold : 54\nSilver : 88\nBronze : 82\nTotal : 224'),
      const Model(
          'Burkina Faso', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Burundi', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 1'),
      const Model('Cameroon', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6'),
      const Model(
          'Canada', 'Gold : 71\nSilver : 110\nBronze : 145\nTotal : 326'),
      const Model('Chile', 'Gold : 2\nSilver : 7\nBronze : 4\nTotal : 13'),
      const Model(
          'China', 'Gold : 263\nSilver : 199\nBronze : 174\nTotal : 636'),
      const Model(
          'Colombia', 'Gold : 5 \nSilver : 13\nBronze : 16\nTotal : 34'),
      const Model('Costa Rica', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Ivory Coast', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Croatia', 'Gold : 14\nSilver : 13\nBronze : 14\nTotal : 41'),
      const Model('Cuba', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Cyprus', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model(
          'Czech Republic', 'Gold : 19\nSilver : 22\nBronze : 26\nTotal : 67'),
      const Model(
          'Denmark', 'Gold : 48\nSilver : 78\nBronze : 79\nTotal : 205'),
      const Model('Djibouti', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model(
          'Dominican Republic', 'Gold : 3\nSilver : 5\nBronze : 4\nTotal : 12'),
      const Model('Ecuador', 'Gold : 3\nSilver : 2\nBronze : 0\nTotal : 5'),
      const Model('Egypt', 'Gold : 8\nSilver : 11\nBronze : 19\nTotal : 38'),
      const Model('Eritrea', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model(
          'Ethiopia', 'Gold : 23\nSilver : 12\nBronze : 23\nTotal : 58'),
      const Model('Fiji', 'Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3'),
      const Model(
          'Finland', 'Gold : 101\nSilver : 85\nBronze : 119\nTotal : 305'),
      const Model(
          'France', 'Gold : 223\nSilver : 251\nBronze : 277\nTotal : 751'),
      const Model('Gabon', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Georgia', 'Gold : 10\nSilver : 12\nBronze : 18\nTotal : 40'),
      const Model(
          'Germany', 'Gold : 201\nSilver : 207\nBronze : 247\nTotal : 655'),
      const Model('Ghana', 'Gold : 0\nSilver : 1\nBronze : 4\nTotal : 5'),
      const Model('United Kingdom',
          'Gold : 284\nSilver : 318\nBronze : 314\nTotal : 916'),
      const Model('Greece', 'Gold : 35\nSilver : 45\nBronze : 41\nTotal : 121'),
      const Model('Guatemala', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Guyana', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Haiti', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model(
          'Hungary', 'Gold : 181\nSilver : 154\nBronze : 176\nTotal : 511'),
      const Model('Iceland', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4'),
      const Model('India', 'Gold : 10\nSilver : 9\nBronze : 16\nTotal : 35'),
      const Model(
          'Indonesia', 'Gold : 8\nSilver : 14\nBronze : 15\nTotal : 37'),
      const Model('Iran', 'Gold : 24\nSilver : 23\nBronze : 29\nTotal : 76'),
      const Model('Iraq', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Ireland', 'Gold : 11\nSilver : 10\nBronze : 14\nTotal : 35'),
      const Model('Israel', 'Gold : 3\nSilver : 1\nBronze : 9\nTotal : 13'),
      const Model(
          'Italy', 'Gold : 217\nSilver : 188\nBronze : 213\nTotal : 618'),
      const Model('Jamaica', 'Gold : 26\nSilver : 36\nBronze : 26\nTotal : 88'),
      const Model(
          'Japan', 'Gold : 169\nSilver : 150\nBronze : 178\nTotal : 497'),
      const Model('Jordan', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3'),
      const Model(
          'Kazakhstan', 'Gold : 14\nSilver : 22\nBronze : 35\nTotal : 71'),
      const Model('Kenya', 'Gold : 35\nSilver : 42\nBronze : 36\nTotal : 113'),
      const Model('Kosovo', 'Gold : 3\nSilver : 0\nBronze : 0\nTotal : 3'),
      const Model(
          'North Korea', 'Gold : 16\nSilver : 16\nBronze : 23\nTotal : 55'),
      const Model(
          'South Korea', 'Gold : 96\nSilver : 91\nBronze : 100\nTotal : 287'),
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
      const Model(
          'Netherlands', 'Gold : 95\nSilver : 105\nBronze : 122\nTotal : 322'),
      const Model(
          'New Zealand', 'Gold : 53\nSilver : 33\nBronze : 51\nTotal : 137'),
      const Model('Niger', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Nigeria', 'Gold : 3\nSilver : 11\nBronze : 13\nTotal : 27'),
      const Model('Norway', 'Gold : 61\nSilver : 52\nBronze : 50\nTotal : 163'),
      const Model('Pakistan', 'Gold : 3\nSilver : 3\nBronze : 4\nTotal : 10'),
      const Model('Panama', 'Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3'),
      const Model('Paraguay', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Peru', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4'),
      const Model(
          'Philippines', 'Gold : 1\nSilver : 5\nBronze : 8\nTotal : 14'),
      const Model(
          'Poland', 'Gold : 72\nSilver : 89\nBronze : 137\nTotal : 298'),
      const Model('Portugal', 'Gold : 5\nSilver : 9\nBronze : 14\nTotal : 28'),
      const Model(
          'Puerto Rico', 'Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10'),
      const Model('Qatar', 'Gold : 2\nSilver : 2\nBronze : 4\nTotal : 8'),
      const Model(
          'Romania', 'Gold : 90\nSilver : 97\nBronze : 121\nTotal : 308'),
      const Model(
          'Russia', 'Gold : 147\nSilver : 126\nBronze : 151\nTotal : 424'),
      const Model(
          'Saudi Arabia', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4'),
      const Model('Senegal', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Serbia', 'Gold : 6\nSilver : 7\nBronze : 11\nTotal : 24'),
      const Model('Slovakia', 'Gold : 10\nSilver : 14\nBronze : 8\nTotal : 32'),
      const Model('Slovenia', 'Gold : 8\nSilver : 9\nBronze : 11\nTotal : 28'),
      const Model(
          'South Africa', 'Gold : 27\nSilver : 33\nBronze : 29\nTotal : 89'),
      const Model('Spain', 'Gold : 48\nSilver : 72\nBronze : 49\nTotal : 169'),
      const Model('Sri Lanka', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2'),
      const Model('Sudan', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Suriname', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2'),
      const Model(
          'Sweden', 'Gold : 147\nSilver : 177\nBronze : 179\nTotal : 503'),
      const Model(
          'Switzerland', 'Gold : 53\nSilver : 79\nBronze : 74\nTotal : 206'),
      const Model('Syria', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Tajikistan', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4'),
      const Model('Tanzania', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2'),
      const Model('Thailand', 'Gold : 10\nSilver : 8\nBronze : 17\nTotal : 35'),
      const Model('Togo', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1'),
      const Model('Tonga', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Trinidad and Tobago',
          'Gold : 3\nSilver : 5\nBronze : 11\nTotal : 19'),
      const Model('Tunisia', 'Gold : 5\nSilver : 3\nBronze : 7\nTotal : 15'),
      const Model('Turkey', 'Gold : 41\nSilver : 26\nBronze : 36\nTotal : 103'),
      const Model(
          'Turkmenistan', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1'),
      const Model('Uganda', 'Gold : 4\nSilver : 4\nBronze : 3\nTotal : 11'),
      const Model(
          'Ukraine', 'Gold : 35\nSilver : 36\nBronze : 68\nTotal : 139'),
      const Model('United Arab Emirates',
          'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2'),
      const Model('Uruguay', 'Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10'),
      const Model(
          'Uzbekistan', 'Gold : 10\nSilver : 6\nBronze : 20\nTotal : 36'),
      const Model('Venezuela', 'Gold : 3\nSilver : 7\nBronze : 9\nTotal : 19'),
      const Model('Vietnam', 'Gold : 1\nSilver : 3\nBronze : 1\nTotal : 5'),
      const Model('Zambia', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2'),
      const Model('Zimbabwe', 'Gold : 3\nSilver : 4\nBronze : 1\nTotal : 8'),
    ];

    _shapeSource = MapShapeSource.asset(
      "assets/world-map.json",
      shapeDataField: "name",
      dataCount: _data.length,
      primaryValueMapper: (int index) => _data[index].country,
      shapeColorValueMapper: (int index) => _data[index].total,
      shapeColorMappers: [
        MapColorMapper(from: 0, to: 1, color: Colors.yellow),
        MapColorMapper(from: 2, to: 60, color: Colors.amber),
        MapColorMapper(from: 61, to: 150, color: Colors.orangeAccent),
        MapColorMapper(from: 151, to: 450, color: Colors.deepOrangeAccent),
        MapColorMapper(from: 451, to: 900, color: Colors.redAccent),
        MapColorMapper(from: 901, to: 99999, color: Colors.red),
        // Ajoutez d'autres plages de valeurs si nécessaire
      ],
    );

    super.initState();
// Tri et sélection des 10 premiers pays
    var tempList = _data
        .map((data) => ChartData(data.country, data.total))
        .toList()
      ..sort((a, b) => b.totalMedals.compareTo(a.totalMedals));
// Prendre les 10 premiers et inverser la liste
    _chartData = tempList.take(10).toList().reversed.toList();

    _zoomPanBehavior = MapZoomPanBehavior();
    super.initState();
  }

  void showCountryInfo(String countryName) {
    print("Recherche du pays : $countryName"); // Ajout pour débogage
    Model? countryData;

    // Boucle pour trouver le pays correspondant, insensible à la casse.
    for (Model data in _data) {
      if (data.country.toLowerCase() == countryName.toLowerCase()) {
        countryData = data;
        break; // Sortir de la boucle si le pays est trouvé.
      }
    }

    // Vérifier si le pays a été trouvé et agir en conséquence.
    if (countryData != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 5,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              constraints: BoxConstraints(maxHeight: 400),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Assurez-vous que le nom de l'image du drapeau correspond au `countryCode` de `countryData`
                      // Exemple : "us.png" pour United States
                      Image.asset(
                          'assets/images/flags/${countryData!.countryCode}.png',
                          width: 100, height: 60),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          countryData!.country,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.blue,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    countryData!.palmares,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.nunito(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Fermer",
                        style: GoogleFonts.nunito(
                            fontSize: 16, color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius
                            .circular(20)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      // Si countryData est null, afficher le dialogue indiquant que le pays n'est pas trouvé.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Non Trouvé"),
            content: Text("Aucune donnée pour le pays saisi."),
            actions: <Widget>[
              TextButton(
                child: Text("Fermer"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }


// carte + graphchart
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF4A2545), // Couleur de fond globale
      child: Column( // Utilisation d'une Column pour disposer les widgets verticalement
        children: [
          SearchSection(onSearch: showCountryInfo),
          // appel de la classe SearchSection (barre de recherche)

          Expanded(
            child: Row( // Encapsulation dans une Row pour ajouter le rectangle à droite
              children: [
                Expanded( // Carte prenant tout l'espace horizontal disponible sauf pour le rectangle
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PhysicalModel(
                      color: const Color(0xFFDCCCA3),
                      // Couleur de la carte
                      borderRadius: BorderRadius.circular(20.0),
                      // Rayon des coins
                      elevation: 8,
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5.0),
                        child: SfMaps(
                          layers: [
                            MapShapeLayer(
                              source: _shapeSource,
                              zoomPanBehavior: MapZoomPanBehavior(    // Configurez ici le zoomPanBehavior avec un zoomLevel initial plus élevé.
                                  enableDoubleTapZooming: true,
                                  enablePanning: true,
                                  zoomLevel: 1.1, // Ajustez ce niveau de zoom selon vos besoins pour agrandir la carte
                              ),
                              shapeTooltipBuilder: (BuildContext context,
                                  int index) {
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
                                                  color: const Color(0xFF6d5da7),
                                                  decoration: TextDecoration
                                                      .none,
                                                  fontSize: Theme
                                                      .of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .fontSize),
                                            ),
                                          ),
                                          const Icon( // Icon de sifflet dans le tooltip
                                            Icons.sports,
                                            color: Color(0xFF6d5da7),
                                            size: 26,
                                          ),
                                        ],
                                      ),
                                      const Divider(
                                        color: Color(0xFF6d5da7),
                                        height: 10,
                                        thickness: 0.5,
                                      ),
                                      Text( // texte gold medal etc
                                        _data[index].palmares,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: const Color(0xFF6d5da7),
                                            decoration: TextDecoration.none,
                                            fontSize: Theme
                                                .of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .fontSize),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              tooltipSettings: const MapTooltipSettings(
                                color: Color(0x80DCCCA3),
                                strokeColor: Color(0xFF6d5da7),
                                strokeWidth: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCCCA3), // Couleur pour correspondre au fond de la carte
                      borderRadius: BorderRadius.circular(20), // Bords arrondis de 20
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: SfCartesianChart(
                        title: ChartTitle(
                          text: 'Top Olympic Medal Countries',
                          textStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w800),
                        ),
                        primaryXAxis: CategoryAxis(
                          labelStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w800), // Style de police pour les labels de l'axe X
                        ),
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          maximum: 3200, // Limite l'axe Y entre 0 et 3000
                          interval: 500,
                          labelStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w800), // Style de police pour les labels de l'axe Y
                        ),
                        series: <CartesianSeries<ChartData, String>>[
                          BarSeries<ChartData, String>(
                            dataSource: _chartData,
                            xValueMapper: (ChartData data, _) => data.country,
                            yValueMapper: (ChartData data, _) => data.totalMedals,
                            dataLabelSettings: DataLabelSettings(
                              isVisible: true,
                              textStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w500),
                            ),
                            color: Color(0xFF6d5da7), // Couleur des barres du graphique
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



class Model {
  final String country;
  final String palmares;

  const Model(this.country, this.palmares);

  // Méthode pour obtenir le total des médailles
  int get total {
    // Extrait la partie 'Total' de la chaîne 'palmares' et convertit en entier
    final totalString = palmares.split('\n').last.split(': ').last;
    return int.tryParse(totalString) ?? 0; // Renvoie 0 si la conversion échoue
  }

  get countryCode => null;
}


class SearchSection extends StatefulWidget {
  final Function(String) onSearch;

  SearchSection({required this.onSearch});


  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  TextEditingController searchController = TextEditingController();
  sliders.SfRangeValues _yearValues = sliders.SfRangeValues(DateTime(1896), DateTime(2024));

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
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(1, 5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                        hintText: "Entrez un pays...",
                        prefixIcon: Icon(Icons.search),
                      ),
                      onSubmitted: (value) {
                        print("Soumission de la recherche : $value"); // Pour le débogage
                        widget.onSearch(value.trim());
                      },
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
                        offset: Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      widget.onSearch(searchController.text.trim());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                "Sélectionnez une plage d'années",
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            _yearRangeSlider(),
          ],
        ),
      ),
    );
  }

  Widget _yearRangeSlider() {
    return SfRangeSliderTheme(
      data: SfRangeSliderThemeData(tooltipBackgroundColor: Colors.blue),
      child: sliders.SfRangeSlider(
        min: DateTime(1896),
        max: DateTime(2024),
        values: _yearValues,
        onChanged: (sliders.SfRangeValues values) {
          setState(() {
            _yearValues = values;
          });
        },
        showLabels: true,
        interval: 4,
        dateFormat: DateFormat.y(),
        labelPlacement: sliders.LabelPlacement.onTicks,
        dateIntervalType: sliders.DateIntervalType.years,
        showTicks: true,
        enableTooltip: true,
        tooltipTextFormatterCallback: (dynamic actualValue, String formattedText) {
          return DateFormat.y().format(actualValue);
        },
      ),
    );
  }
}

class ChartData {
  final String country;
  final int totalMedals;

  ChartData(this.country, this.totalMedals);
}

