import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart' as sliders;
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const Color violet = Color(0xFF4A2545);
const Color beige = Color(0xFFDCCCA3);


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
  //late MapShapeSource _shapeSource;
  late MapZoomPanBehavior _zoomPanBehavior;
  late List<Model> _data;
  late List<Model> _data2008;
  late List<Model> _data2012;
  late List<Model> _data2016;
  late List<Model> _data2020;
  late List<Athlete> _dataprospects;
  late sliders.SfRangeValues _yearValues;
  late List<ChartData> _chartData;
  bool useData2008 = false;
  bool useData2012 = false;
  bool useData2016 = false;
  bool useData2020 = false;

  @override
  void initState() {
    _data = <Model>[
      const Model('United States', 'Gold : 1061\nSilver : 830\nBronze : 738\nTotal : 2629', 2629),
      const Model('Afghanistan', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2),
      const Model('Algeria', 'Gold : 5\nSilver : 4\nBronze : 8\nTotal : 17', 17),
      const Model('Argentina', 'Gold : 21\nSilver : 26\nBronze : 30\nTotal : 77', 77),
      const Model('Armenia', 'Gold : 2\nSilver : 8\nBronze : 8\nTotal : 18', 18),
      const Model('Australia', 'Gold : 164\nSilver : 173\nBronze : 210\nTotal : 547', 547),
      const Model('Austria', 'Gold : 20\nSilver : 35\nBronze : 41\nTotal : 96', 96),
      const Model('Azerbaijan', 'Gold : 7\nSilver : 14\nBronze : 28\nTotal : 49', 49),
      const Model('Bahamas', 'Gold : 8\nSilver : 2\nBronze : 6\nTotal : 16', 16),
      const Model('Belarus', 'Gold : 13\nSilver : 30\nBronze : 42\nTotal : 85', 85),
      const Model('Belgium', 'Gold : 44\nSilver : 56\nBronze : 57\nTotal : 157', 157),
      const Model('Botswana', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2),
      const Model('Brazil', 'Gold : 37\nSilver : 42\nBronze : 71\nTotal : 150', 150),
      const Model('Bulgaria', 'Gold : 54\nSilver : 88\nBronze : 82\nTotal : 224', 224),
      const Model('Burkina Faso', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
      const Model('Burundi', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 1', 1),
      const Model('Cameroon', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6', 6),
      const Model('Canada', 'Gold : 71\nSilver : 110\nBronze : 145\nTotal : 326', 326),
      const Model('Chile', 'Gold : 2\nSilver : 7\nBronze : 4\nTotal : 13', 13),
      const Model('China', 'Gold : 263\nSilver : 199\nBronze : 174\nTotal : 636', 636),
      const Model('Colombia', 'Gold : 5 \nSilver : 13\nBronze : 16\nTotal : 34', 34),
      const Model('Costa Rica', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4),
      const Model('Ivory Coast', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4),
      const Model('Croatia', 'Gold : 14\nSilver : 13\nBronze : 14\nTotal : 41', 41),
      const Model('Cuba', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Cyprus', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Czech Republic', 'Gold : 19\nSilver : 22\nBronze : 26\nTotal : 67', 67),
      const Model('Denmark', 'Gold : 48\nSilver : 78\nBronze : 79\nTotal : 205', 67),
      const Model('Djibouti', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
      const Model('Dominican Republic', 'Gold : 3\nSilver : 5\nBronze : 4\nTotal : 12', 12),
      const Model('Ecuador', 'Gold : 3\nSilver : 2\nBronze : 0\nTotal : 5', 5),
      const Model('Egypt', 'Gold : 8\nSilver : 11\nBronze : 19\nTotal : 38', 38),
      const Model('Eritrea', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
      const Model('Ethiopia', 'Gold : 23\nSilver : 12\nBronze : 23\nTotal : 58', 58),
      const Model('Fiji', 'Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3', 3),
      const Model('Finland', 'Gold : 101\nSilver : 85\nBronze : 119\nTotal : 305', 305),
      const Model('France', 'Gold : 223\nSilver : 251\nBronze : 277\nTotal : 751', 751),
      const Model('Gabon', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Georgia', 'Gold : 10\nSilver : 12\nBronze : 18\nTotal : 40', 40),
      const Model('Germany', 'Gold : 201\nSilver : 207\nBronze : 247\nTotal : 655', 655),
      const Model('Ghana', 'Gold : 0\nSilver : 1\nBronze : 4\nTotal : 5', 5),
      const Model('United Kingdom', 'Gold : 284\nSilver : 318\nBronze : 314\nTotal : 916', 916),
      const Model('Greece', 'Gold : 35\nSilver : 45\nBronze : 41\nTotal : 121', 121),
      const Model('Guatemala', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Guyana', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
      const Model('Haiti', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2),
      const Model('Hungary', 'Gold : 181\nSilver : 154\nBronze : 176\nTotal : 511', 511),
      const Model('Iceland', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4),
      const Model('India', 'Gold : 10\nSilver : 9\nBronze : 16\nTotal : 35', 32),
      const Model('Indonesia', 'Gold : 8\nSilver : 14\nBronze : 15\nTotal : 37', 37),
      const Model('Iran', 'Gold : 24\nSilver : 23\nBronze : 29\nTotal : 76', 76),
      const Model('Iraq', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
      const Model('Ireland', 'Gold : 11\nSilver : 10\nBronze : 14\nTotal : 35', 35),
      const Model('Israel', 'Gold : 3\nSilver : 1\nBronze : 9\nTotal : 13', 13),
      const Model('Italy', 'Gold : 217\nSilver : 188\nBronze : 213\nTotal : 618', 618),
      const Model('Jamaica', 'Gold : 26\nSilver : 36\nBronze : 26\nTotal : 88', 88),
      const Model('Japan', 'Gold : 169\nSilver : 150\nBronze : 178\nTotal : 497', 497),
      const Model('Jordan', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3', 3),
      const Model('Kazakhstan', 'Gold : 14\nSilver : 22\nBronze : 35\nTotal : 71', 71),
      const Model('Kenya', 'Gold : 35\nSilver : 42\nBronze : 36\nTotal : 113', 113),
      const Model('Kosovo', 'Gold : 3\nSilver : 0\nBronze : 0\nTotal : 3', 3),
      const Model('North Korea', 'Gold : 16\nSilver : 16\nBronze : 23\nTotal : 55', 55),
      const Model('South Korea', 'Gold : 96\nSilver : 91\nBronze : 100\nTotal : 287', 287),
      const Model('Kuwait', 'Gold : 0\nSilver : 0\nBronze : 3\nTotal : 3', 3),
      const Model('Kyrgyzstan', 'Gold : 0\nSilver : 3\nBronze : 4\nTotal : 7', 7),
      const Model('Latvia', 'Gold : 4\nSilver : 11\nBronze : 6\nTotal : 21', 21),
      const Model('Lebanon', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4),
      const Model('Lithuania', 'Gold : 6\nSilver : 7\nBronze : 13\nTotal : 26', 26),
      const Model('Luxembourg', 'Gold : 2\nSilver : 1\nBronze : 0\nTotal : 3', 3),
      const Model('Malaysia', 'Gold : 0\nSilver : 8\nBronze : 5\nTotal : 13', 13),
      const Model('Mexico', 'Gold : 13\nSilver : 24\nBronze : 35\nTotal : 72', 72),
      const Model('Moldova', 'Gold : 0\nSilver : 2\nBronze : 4\nTotal : 6', 6),
      const Model('Mongolia', 'Gold : 2\nSilver : 11\nBronze : 17\nTotal : 30', 30),
      const Model('Montenegro', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Morocco', 'Gold : 7\nSilver : 5\nBronze : 12\nTotal : 24', 24),
      const Model('Mozambique', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2),
      const Model('Namibia', 'Gold : 0\nSilver : 5\nBronze : 0\nTotal : 5', 5),
      const Model('Netherlands', 'Gold : 95\nSilver : 105\nBronze : 122\nTotal : 322', 322),
      const Model('New Zealand', 'Gold : 53\nSilver : 33\nBronze : 51\nTotal : 137', 137),
      const Model('Niger', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2),
      const Model('Nigeria', 'Gold : 3\nSilver : 11\nBronze : 13\nTotal : 27', 27),
      const Model('Norway', 'Gold : 61\nSilver : 52\nBronze : 50\nTotal : 163', 163),
      const Model('Pakistan', 'Gold : 3\nSilver : 3\nBronze : 4\nTotal : 10', 10),
      const Model('Panama', 'Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3', 3),
      const Model('Paraguay', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Peru', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4', 4),
      const Model('Philippines', 'Gold : 1\nSilver : 5\nBronze : 8\nTotal : 14', 14),
      const Model('Poland', 'Gold : 72\nSilver : 89\nBronze : 137\nTotal : 298', 298),
      const Model('Portugal', 'Gold : 5\nSilver : 9\nBronze : 14\nTotal : 28', 28),
      const Model('Puerto Rico', 'Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10', 10),
      const Model('Qatar', 'Gold : 2\nSilver : 2\nBronze : 4\nTotal : 8', 8),
      const Model('Romania', 'Gold : 90\nSilver : 97\nBronze : 121\nTotal : 308', 308),
      const Model('Russia', 'Gold : 147\nSilver : 126\nBronze : 151\nTotal : 424', 424),
      const Model('Saudi Arabia', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4),
      const Model('Senegal', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Serbia', 'Gold : 6\nSilver : 7\nBronze : 11\nTotal : 24', 24),
      const Model('Slovakia', 'Gold : 10\nSilver : 14\nBronze : 8\nTotal : 32', 32),
      const Model('Slovenia', 'Gold : 8\nSilver : 9\nBronze : 11\nTotal : 28', 28),
      const Model('South Africa', 'Gold : 27\nSilver : 33\nBronze : 29\nTotal : 89', 89),
      const Model('Spain', 'Gold : 48\nSilver : 72\nBronze : 49\nTotal : 169', 169),
      const Model('Sri Lanka', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2', 2),
      const Model('Sudan', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Suriname', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2),
      const Model('Sweden', 'Gold : 147\nSilver : 177\nBronze : 179\nTotal : 503', 503),
      const Model('Switzerland', 'Gold : 53\nSilver : 79\nBronze : 74\nTotal : 206', 206),
      const Model('Syria', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4),
      const Model('Tajikistan', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4),
      const Model('Tanzania', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2', 2),
      const Model('Thailand', 'Gold : 10\nSilver : 8\nBronze : 17\nTotal : 35', 35),
      const Model('Togo', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
      const Model('Tonga', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Trinidad and Tobago', 'Gold : 3\nSilver : 5\nBronze : 11\nTotal : 19', 19),
      const Model('Tunisia', 'Gold : 5\nSilver : 3\nBronze : 7\nTotal : 15', 15),
      const Model('Turkey', 'Gold : 41\nSilver : 26\nBronze : 36\nTotal : 103', 103),
      const Model('Turkmenistan', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Uganda', 'Gold : 4\nSilver : 4\nBronze : 3\nTotal : 11', 11),
      const Model('Ukraine', 'Gold : 35\nSilver : 36\nBronze : 68\nTotal : 139', 139),
      const Model('United Arab Emirates', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2),
      const Model('Uruguay', 'Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10', 10),
      const Model('Uzbekistan', 'Gold : 10\nSilver : 6\nBronze : 20\nTotal : 36', 36),
      const Model('Venezuela', 'Gold : 3\nSilver : 7\nBronze : 9\nTotal : 19', 19),
      const Model('Vietnam', 'Gold : 1\nSilver : 3\nBronze : 1\nTotal : 5', 5),
      const Model('Zambia', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2),
      const Model('Zimbabwe', 'Gold : 3\nSilver : 4\nBronze : 1\nTotal : 8', 8),
    ];
    _data2008 = <Model>[
      const Model('China', 'Gold : 48\nSilver : 22\nBronze : 30\nTotal : 100', 100),
      const Model('United States', 'Gold : 36\nSilver : 39\nBronze : 37\nTotal : 112', 112),
      const Model('Russia', 'Gold : 24\nSilver : 13\nBronze : 23\nTotal : 60', 60),
      const Model('United Kingdom', 'Gold : 19\nSilver : 13\nBronze : 19\nTotal : 51', 51),
      const Model('Germany', 'Gold : 16\nSilver : 11\nBronze : 14\nTotal : 41', 41),
      const Model('Australia', 'Gold : 14\nSilver : 15\nBronze : 17\nTotal : 46', 46),
      const Model('South Korea', 'Gold : 13\nSilver : 11\nBronze : 8\nTotal : 32', 32),
      const Model('Japan', 'Gold : 9\nSilver : 8\nBronze : 8\nTotal : 25', 25),
      const Model('Italy', 'Gold : 8\nSilver : 9\nBronze : 10\nTotal : 27', 27),
      const Model('France', 'Gold : 7\nSilver : 16\nBronze : 20\nTotal : 43', 43),
      const Model('Netherlands', 'Gold : 7\nSilver : 5\nBronze : 4\nTotal : 16', 16),
      const Model('Ukraine', 'Gold : 7\nSilver : 4\nBronze : 11\nTotal : 22', 22),
      const Model('Kenya', 'Gold : 6\nSilver : 4\nBronze : 6\nTotal : 16', 16),
      const Model('Spain', 'Gold : 5\nSilver : 11\nBronze : 3\nTotal : 19', 19),
      const Model('Jamaica', 'Gold : 5\nSilver : 4\nBronze : 2\nTotal : 11', 11),
      const Model('Poland', 'Gold : 4\nSilver : 5\nBronze : 2\nTotal : 11', 11),
      const Model('Ethiopia', 'Gold : 4\nSilver : 2\nBronze : 1\nTotal : 7', 7),
      const Model('Romania', 'Gold : 4\nSilver : 1\nBronze : 4\nTotal : 9', 9),
      const Model('Cuba', 'Gold : 3\nSilver : 10\nBronze : 17\nTotal : 30', 30),
      const Model('Canada', 'Gold : 3\nSilver : 9\nBronze : 8\nTotal : 20', 20),
      const Model('Hungary', 'Gold : 3\nSilver : 5\nBronze : 2\nTotal : 10', 10),
      const Model('Norway', 'Gold : 3\nSilver : 5\nBronze : 1\nTotal : 9', 9),
      const Model('Brazil', 'Gold : 3\nSilver : 4\nBronze : 10\nTotal : 17', 17),
      const Model('Belarus', 'Gold : 3\nSilver : 4\nBronze : 7\nTotal : 14', 14),
      const Model('Czech Republic', 'Gold : 3\nSilver : 3\nBronze : 1\nTotal : 7', 7),
      const Model('Slovakia', 'Gold : 3\nSilver : 3\nBronze : 0\nTotal : 6', 6),
      const Model('New Zealand', 'Gold : 3\nSilver : 2\nBronze : 4\nTotal : 9', 9),
      const Model('Georgia', 'Gold : 3\nSilver : 2\nBronze : 2\nTotal : 7', 7),
      const Model('Kazakhstan', 'Gold : 2\nSilver : 3\nBronze : 4\nTotal : 9', 9),
      const Model('Denmark', 'Gold : 2\nSilver : 2\nBronze : 3\nTotal : 7', 7),
      const Model('North Korea', 'Gold : 2\nSilver : 2\nBronze : 2\nTotal : 6', 6),
      const Model('Mongolia', 'Gold : 2\nSilver : 2\nBronze : 0\nTotal : 4', 4),
      const Model('Switzerland', 'Gold : 2\nSilver : 1\nBronze : 4\nTotal : 7', 7),
      const Model('Argentina', 'Gold : 2\nSilver : 0\nBronze : 4\nTotal : 6', 6),
      const Model('Mexico', 'Gold : 2\nSilver : 0\nBronze : 2\nTotal : 4', 4),
      const Model('Belgium', 'Gold : 2\nSilver : 0\nBronze : 0\nTotal : 2', 2),
      const Model('Zimbabwe', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4', 4),
      const Model('Slovenia', 'Gold : 1\nSilver : 2\nBronze : 2\nTotal : 5', 5),
      const Model('Azerbaijan', 'Gold : 1\nSilver : 1\nBronze : 4\nTotal : 6', 6),
      const Model('Bulgaria', 'Gold : 1\nSilver : 1\nBronze : 3\nTotal : 5', 5),
      const Model('Chinese Taipei', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4),
      const Model('Latvia', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3', 3),
      const Model('Dominican Republic', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2),
      const Model('India', 'Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3', 3),
      const Model('Iran', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2),
      const Model('Cameroon', 'Gold : 1\nSilver : 0\nBronze : 0\nTotal : 1', 1),
      const Model('Sweden', 'Gold : 0\nSilver : 4\nBronze : 1\nTotal : 5', 5),
      const Model('Lithuania', 'Gold : 0\nSilver : 3\nBronze : 2\nTotal : 5', 5),
      const Model('Croatia', 'Gold : 0\nSilver : 2\nBronze : 3\nTotal : 5', 5),
      const Model('Colombia', 'Gold : 0\nSilver : 2\nBronze : 1\nTotal : 3', 3),
      const Model('Armenia', 'Gold : 0\nSilver : 1\nBronze : 4\nTotal : 5', 5),
      const Model('Uzbekistan', 'Gold : 0\nSilver : 1\nBronze : 3\nTotal : 4', 4),
      const Model('Austria', 'Gold : 0\nSilver : 1\nBronze : 2\nTotal : 3', 3),
      const Model('Algeria', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2),
      const Model('Chile', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Egypt', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2),
      const Model('Afghanistan', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
    ];
    _data2012 = <Model>[
      const Model('United States', 'Gold : 48\nSilver : 26\nBronze : 30\nTotal : 104', 104),
      const Model('China', 'Gold : 39\nSilver : 31\nBronze : 22\nTotal : 92', 92),
      const Model('United Kingdom', 'Gold : 29\nSilver : 18\nBronze : 18\nTotal : 65', 65),
      const Model('Russia', 'Gold : 18\nSilver : 21\nBronze : 26\nTotal : 65', 65),
      const Model('South Korea', 'Gold : 13\nSilver : 9\nBronze : 9\nTotal : 31', 31),
      const Model('Germany', 'Gold : 11\nSilver : 20\nBronze : 13\nTotal : 44', 44),
      const Model('France', 'Gold : 11\nSilver : 11\nBronze : 13\nTotal : 35', 35),
      const Model('Australia', 'Gold : 8\nSilver : 15\nBronze : 12\nTotal : 35', 35),
      const Model('Italy', 'Gold : 8\nSilver : 9\nBronze : 11\nTotal : 28', 28),
      const Model('Hungary', 'Gold : 8\nSilver : 4\nBronze : 6\nTotal : 18', 18),
      const Model('Japan', 'Gold : 7\nSilver : 14\nBronze : 17\nTotal : 38', 38),
      const Model('Iran', 'Gold : 7\nSilver : 5\nBronze : 1\nTotal : 13', 13),
      const Model('Netherlands', 'Gold : 6\nSilver : 6\nBronze : 8\nTotal : 20', 20),
      const Model('New Zealand', 'Gold : 6\nSilver : 2\nBronze : 5\nTotal : 13', 13),
      const Model('Ukraine', 'Gold : 5\nSilver : 4\nBronze : 10\nTotal : 19', 19),
      const Model('Cuba', 'Gold : 5\nSilver : 3\nBronze : 7\nTotal : 15', 15),
      const Model('Spain', 'Gold : 4\nSilver : 10\nBronze : 6\nTotal : 20', 20),
      const Model('Jamaica', 'Gold : 4\nSilver : 5\nBronze : 4\nTotal : 13', 13),
      const Model('Czech Republic', 'Gold : 4\nSilver : 4\nBronze : 3\nTotal : 11', 11),
      const Model('South Africa', 'Gold : 4\nSilver : 1\nBronze : 1\nTotal : 6', 6),
      const Model('North Korea', 'Gold : 4\nSilver : 0\nBronze : 3\nTotal : 7', 7),
      const Model('Brazil', 'Gold : 3\nSilver : 5\nBronze : 9\nTotal : 17', 17),
      const Model('Kazakhstan', 'Gold : 3\nSilver : 2\nBronze : 6\nTotal : 11', 11),
      const Model('Ethiopia', 'Gold : 3\nSilver : 2\nBronze : 3\nTotal : 8', 8),
      const Model('Croatia', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6', 6),
      const Model('Canada', 'Gold : 2\nSilver : 6\nBronze : 10\nTotal : 18', 18),
      const Model('Belarus', 'Gold : 2\nSilver : 5\nBronze : 3\nTotal : 10', 10),
      const Model('Kenya', 'Gold : 2\nSilver : 4\nBronze : 7\nTotal : 13', 13),
      const Model('Denmark', 'Gold : 2\nSilver : 4\nBronze : 3\nTotal : 9', 9),
      const Model('Romania', 'Gold : 2\nSilver : 4\nBronze : 1\nTotal : 7', 7),
      const Model('Azerbaijan', 'Gold : 2\nSilver : 2\nBronze : 5\nTotal : 9', 9),
      const Model('Switzerland', 'Gold : 2\nSilver : 2\nBronze : 0\nTotal : 4', 4),
      const Model('Norway', 'Gold : 2\nSilver : 1\nBronze : 1\nTotal : 4', 4),
      const Model('Lithuania', 'Gold : 2\nSilver : 0\nBronze : 3\nTotal : 5', 5),
      const Model('Tunisia', 'Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3', 3),
      const Model('Sweden', 'Gold : 1\nSilver : 4\nBronze : 3\nTotal : 8', 8),
      const Model('Colombia', 'Gold : 1\nSilver : 3\nBronze : 5\nTotal : 9', 9),
      const Model('Mexico', 'Gold : 1\nSilver : 3\nBronze : 4\nTotal : 8', 8),
      const Model('Georgia', 'Gold : 1\nSilver : 2\nBronze : 3\nTotal : 6', 6),
      const Model('Ireland', 'Gold : 1\nSilver : 1\nBronze : 4\nTotal : 6', 6),
      const Model('Argentina', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4),
      const Model('Turkey', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3', 3),
      const Model('Dominican Republic', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2),
      const Model('Chinese Taipei', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2),
      const Model('Algeria', 'Gold : 1\nSilver : 0\nBronze : 0\nTotal : 1', 1),
      const Model('Egypt', 'Gold : 0\nSilver : 3\nBronze : 1\nTotal : 4', 4),
      const Model('India', 'Gold : 0\nSilver : 2\nBronze : 4\nTotal : 6', 6),
      const Model('Mongolia', 'Gold : 0\nSilver : 2\nBronze : 3\nTotal : 5', 5),
      const Model('Thailand', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4),
      const Model('Bulgaria', 'Gold : 0\nSilver : 2\nBronze : 1\nTotal : 3', 3),
      const Model('Slovakia', 'Gold : 0\nSilver : 1\nBronze : 3\nTotal : 4', 4),
      const Model('Belgium', 'Gold : 0\nSilver : 1\nBronze : 2\nTotal : 3', 3),
      const Model('Armenia', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2),
      const Model('Botswana', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Uzbekistan', 'Gold : 0\nSilver : 0\nBronze : 3\nTotal : 3', 3),
      const Model('Greece', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2),
      const Model('Afghanistan', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
    ];
    _data2016 = <Model>[
      const Model('United States', 'Gold : 46\nSilver : 37\nBronze : 38\nTotal : 121', 121),
      const Model('United Kingdom', 'Gold : 27\nSilver : 23\nBronze : 17\nTotal : 67', 67),
      const Model('China', 'Gold : 26\nSilver : 18\nBronze : 26\nTotal : 70', 70),
      const Model('Russia', 'Gold : 19\nSilver : 17\nBronze : 20\nTotal : 56', 56),
      const Model('Germany', 'Gold : 17\nSilver : 10\nBronze : 15\nTotal : 42', 42),
      const Model('Japan', 'Gold : 12\nSilver : 8\nBronze : 21\nTotal : 41', 41),
      const Model('France', 'Gold : 10\nSilver : 18\nBronze : 14\nTotal : 42', 42),
      const Model('South Korea', 'Gold : 9\nSilver : 3\nBronze : 9\nTotal : 21', 21),
      const Model('Italy', 'Gold : 8\nSilver : 12\nBronze : 8\nTotal : 28', 28),
      const Model('Australia', 'Gold : 8\nSilver : 11\nBronze : 10\nTotal : 29', 29),
      const Model('Netherlands', 'Gold : 8\nSilver : 7\nBronze : 4\nTotal : 19', 19),
      const Model('Hungary', 'Gold : 8\nSilver : 3\nBronze : 4\nTotal : 15', 15),
      const Model('Brazil*', 'Gold : 7\nSilver : 6\nBronze : 6\nTotal : 19', 19),
      const Model('Spain', 'Gold : 7\nSilver : 4\nBronze : 6\nTotal : 17', 17),
      const Model('Kenya', 'Gold : 6\nSilver : 6\nBronze : 1\nTotal : 13', 13),
      const Model('Jamaica', 'Gold : 6\nSilver : 3\nBronze : 2\nTotal : 11', 11),
      const Model('Croatia', 'Gold : 5\nSilver : 3\nBronze : 2\nTotal : 10', 10),
      const Model('Cuba', 'Gold : 5\nSilver : 2\nBronze : 4\nTotal : 11', 11),
      const Model('New Zealand', 'Gold : 4\nSilver : 9\nBronze : 5\nTotal : 18', 18),
      const Model('Canada', 'Gold : 4\nSilver : 3\nBronze : 15\nTotal : 22', 22),
      const Model('Uzbekistan', 'Gold : 4\nSilver : 2\nBronze : 7\nTotal : 13', 13),
      const Model('Colombia', 'Gold : 3\nSilver : 2\nBronze : 3\nTotal : 8', 8),
      const Model('Switzerland', 'Gold : 3\nSilver : 2\nBronze : 2\nTotal : 7', 7),
      const Model('Iran', 'Gold : 3\nSilver : 1\nBronze : 4\nTotal : 8', 8),
      const Model('Greece', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6', 6),
      const Model('Argentina', 'Gold : 3\nSilver : 1\nBronze : 0\nTotal : 4', 4),
      const Model('Denmark', 'Gold : 2\nSilver : 6\nBronze : 7\nTotal : 15', 15),
      const Model('Sweden', 'Gold : 2\nSilver : 6\nBronze : 3\nTotal : 11', 11),
      const Model('South Africa', 'Gold : 2\nSilver : 6\nBronze : 2\nTotal : 10', 10),
      const Model('Kazakhstan', 'Gold : 2\nSilver : 5\nBronze : 10\nTotal : 17', 17),
      const Model('Ukraine', 'Gold : 2\nSilver : 5\nBronze : 4\nTotal : 11', 11),
      const Model('Serbia', 'Gold : 2\nSilver : 4\nBronze : 2\nTotal : 8', 8),
      const Model('Poland', 'Gold : 2\nSilver : 3\nBronze : 6\nTotal : 11', 11),
      const Model('North Korea', 'Gold : 2\nSilver : 3\nBronze : 2\nTotal : 7', 7),
      const Model('Belgium', 'Gold : 2\nSilver : 2\nBronze : 2\nTotal : 6', 6),
      const Model('Slovakia', 'Gold : 2\nSilver : 2\nBronze : 0\nTotal : 4', 4),
      const Model('Georgia', 'Gold : 2\nSilver : 1\nBronze : 4\nTotal : 7', 7),
      const Model('Azerbaijan', 'Gold : 1\nSilver : 7\nBronze : 10\nTotal : 18', 18),
      const Model('Belarus', 'Gold : 1\nSilver : 4\nBronze : 4\nTotal : 9', 9),
      const Model('Turkey', 'Gold : 1\nSilver : 3\nBronze : 4\nTotal : 8', 8),
      const Model('Armenia', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4', 4),
      const Model('Czech Republic', 'Gold : 1\nSilver : 2\nBronze : 7\nTotal : 10', 10),
      const Model('Ethiopia', 'Gold : 1\nSilver : 2\nBronze : 5\nTotal : 8', 8),
      const Model('Slovenia', 'Gold : 1\nSilver : 2\nBronze : 1\nTotal : 4', 4),
      const Model('Indonesia', 'Gold : 1\nSilver : 2\nBronze : 0\nTotal : 3', 3),
      const Model('Romania', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4),
      const Model('Bahrain', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2),
      const Model('Chinese Taipei', 'Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3', 3),
      const Model('Bahamas', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2),
      const Model('Fiji', 'Gold : 1\nSilver : 0\nBronze : 0\nTotal : 1', 1),
      const Model('Malaysia', 'Gold : 0\nSilver : 4\nBronze : 1\nTotal : 5', 5),
      const Model('Mexico', 'Gold : 0\nSilver : 3\nBronze : 2\nTotal : 5', 5),
      const Model('Venezuela', 'Gold : 0\nSilver : 2\nBronze : 1\nTotal : 3', 3),
      const Model('Algeria', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2', 2),
      const Model('Lithuania', 'Gold : 0\nSilver : 1\nBronze : 3\nTotal : 4', 4),
      const Model('Bulgaria', 'Gold : 0\nSilver : 1\nBronze : 2\nTotal : 3', 3),
      const Model('India', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2),
      const Model('Burundi', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Norway', 'Gold : 0\nSilver : 0\nBronze : 4\nTotal : 4', 4),
      const Model('Egypt', 'Gold : 0\nSilver : 0\nBronze : 3\nTotal : 3', 3),
      const Model('Israel', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2),
      const Model('Austria', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
    ];
    _data2020 = <Model>[
      const Model('United States', 'Gold : 39\nSilver : 41\nBronze : 33\nTotal : 113', 113),
      const Model('China', 'Gold : 38\nSilver : 32\nBronze : 19\nTotal : 89', 89),
      const Model('Japan', 'Gold : 27\nSilver : 14\nBronze : 17\nTotal : 58', 58),
      const Model('United Kingdom', 'Gold : 22\nSilver : 20\nBronze : 22\nTotal : 64', 64),
      const Model('ROC', 'Gold : 20\nSilver : 28\nBronze : 23\nTotal : 71', 71),
      const Model('Australia', 'Gold : 17\nSilver : 7\nBronze : 22\nTotal : 46', 46),
      const Model('Netherlands', 'Gold : 10\nSilver : 12\nBronze : 14\nTotal : 36', 36),
      const Model('France', 'Gold : 10\nSilver : 12\nBronze : 11\nTotal : 33', 33),
      const Model('Germany', 'Gold : 10\nSilver : 11\nBronze : 16\nTotal : 37', 37),
      const Model('Italy', 'Gold : 10\nSilver : 10\nBronze : 20\nTotal : 40', 40),
      const Model('Canada', 'Gold : 7\nSilver : 7\nBronze : 10\nTotal : 24', 24),
      const Model('Brazil', 'Gold : 7\nSilver : 6\nBronze : 8\nTotal : 21', 21),
      const Model('New Zealand', 'Gold : 7\nSilver : 6\nBronze : 7\nTotal : 20', 20),
      const Model('Cuba', 'Gold : 7\nSilver : 3\nBronze : 5\nTotal : 15', 15),
      const Model('Hungary', 'Gold : 6\nSilver : 7\nBronze : 7\nTotal : 20', 20),
      const Model('South Korea', 'Gold : 6\nSilver : 4\nBronze : 10\nTotal : 20', 20),
      const Model('Poland', 'Gold : 4\nSilver : 5\nBronze : 5\nTotal : 14', 14),
      const Model('Czech Republic', 'Gold : 4\nSilver : 4\nBronze : 3\nTotal : 11', 11),
      const Model('Kenya', 'Gold : 4\nSilver : 4\nBronze : 2\nTotal : 10', 10),
      const Model('Norway', 'Gold : 4\nSilver : 2\nBronze : 2\nTotal : 8', 8),
      const Model('Jamaica', 'Gold : 4\nSilver : 1\nBronze : 4\nTotal : 9', 9),
      const Model('Spain', 'Gold : 3\nSilver : 8\nBronze : 6\nTotal : 17', 17),
      const Model('Sweden', 'Gold : 3\nSilver : 6\nBronze : 0\nTotal : 9', 9),
      const Model('Switzerland', 'Gold : 3\nSilver : 4\nBronze : 6\nTotal : 13', 13),
      const Model('Denmark', 'Gold : 3\nSilver : 4\nBronze : 4\nTotal : 11', 11),
      const Model('Croatia', 'Gold : 3\nSilver : 3\nBronze : 2\nTotal : 8', 8),
      const Model('Iran', 'Gold : 3\nSilver : 2\nBronze : 2\nTotal : 7', 7),
      const Model('Serbia', 'Gold : 3\nSilver : 1\nBronze : 5\nTotal : 9', 9),
      const Model('Belgium', 'Gold : 3\nSilver : 1\nBronze : 3\nTotal : 7', 7),
      const Model('Bulgaria', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6', 6),
      const Model('Slovenia', 'Gold : 3\nSilver : 1\nBronze : 1\nTotal : 5', 5),
      const Model('Uzbekistan', 'Gold : 3\nSilver : 0\nBronze : 2\nTotal : 5', 5),
      const Model('Georgia', 'Gold : 2\nSilver : 5\nBronze : 1\nTotal : 8', 8),
      const Model('Chinese Taipei', 'Gold : 2\nSilver : 4\nBronze : 6\nTotal : 12', 12),
      const Model('Turkey', 'Gold : 2\nSilver : 2\nBronze : 9\nTotal : 13', 13),
      const Model('Greece', 'Gold : 2\nSilver : 1\nBronze : 1\nTotal : 4', 4),
      const Model('Ecuador', 'Gold : 2\nSilver : 1\nBronze : 0\nTotal : 3', 3),
      const Model('Ireland', 'Gold : 2\nSilver : 0\nBronze : 2\nTotal : 4', 4),
      const Model('Qatar', 'Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3', 3),
      const Model('Bahamas', 'Gold : 2\nSilver : 0\nBronze : 0\nTotal : 2', 2),
      const Model('Ukraine', 'Gold : 1\nSilver : 6\nBronze : 12\nTotal : 19', 19),
      const Model('Belarus', 'Gold : 1\nSilver : 3\nBronze : 3\nTotal : 7', 7),
      const Model('Romania', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4', 4),
      const Model('India', 'Gold : 1\nSilver : 2\nBronze : 4\nTotal : 7', 7),
      const Model('Hong Kong', 'Gold : 1\nSilver : 2\nBronze : 3\nTotal : 6', 6),
      const Model('Philippines', 'Gold : 1\nSilver : 2\nBronze : 1\nTotal : 4', 4),
      const Model('South Africa', 'Gold : 1\nSilver : 2\nBronze : 0\nTotal : 3', 3),
      const Model('Austria', 'Gold : 1\nSilver : 1\nBronze : 5\nTotal : 7', 7),
      const Model('Egypt', 'Gold : 1\nSilver : 1\nBronze : 4\nTotal : 6', 6),
      const Model('Indonesia', 'Gold : 1\nSilver : 1\nBronze : 3\nTotal : 5', 5),
      const Model('Ethiopia', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4),
      const Model('Tunisia', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2),
      const Model('Estonia', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2),
      const Model('Bermuda', 'Gold : 1\nSilver : 0\nBronze : 0\nTotal : 1', 1),
      const Model('Colombia', 'Gold : 0\nSilver : 4\nBronze : 1\nTotal : 5', 5),
      const Model('Azerbaijan', 'Gold : 0\nSilver : 3\nBronze : 4\nTotal : 7', 7),
      const Model('Dominican Republic', 'Gold : 0\nSilver : 3\nBronze : 2\nTotal : 5', 5),
      const Model('Armenia', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4),
      const Model('Kyrgyzstan', 'Gold : 0\nSilver : 2\nBronze : 1\nTotal : 3', 3),
      const Model('Mongolia', 'Gold : 0\nSilver : 1\nBronze : 3\nTotal : 4', 4),
      const Model('Argentina', 'Gold : 0\nSilver : 1\nBronze : 2\nTotal : 3', 3),
      const Model('Jordan', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2),
      const Model('Bahrain', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1),
      const Model('Kazakhstan', 'Gold : 0\nSilver : 0\nBronze : 8\nTotal : 8', 8),
      const Model('Mexico', 'Gold : 0\nSilver : 0\nBronze : 4\nTotal : 4', 4),
      const Model('Finland', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2),
      const Model('Botswana', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1),
    ];
    _dataprospects = <Athlete>[
      const Athlete('Marchand', 'Léon', 21, 'France', '5 world championship gold medals\n 1 world championship silver medal', 'Swimming'),
    ];
    _zoomPanBehavior = MapZoomPanBehavior();
    updateChartData();
    _shapeSource();
    super.initState();
  }

  void updateChartData() {
    var tempList = (useData2012 ? _data2012 : (useData2016 ? _data2016 : (useData2020 ? _data2020 : (useData2008 ? _data2008 : _data))))
        .map<ChartData>((data) => ChartData(data.country, data.palmares, data.totalMedals)) // Modification ici
        .toList()
      ..sort((a, b) => b.totalMedals.compareTo(a.totalMedals));

    setState(() {
      _chartData = tempList.take(10).toList().reversed.toList();
    });
  }

  Future<MapShapeSource> _shapeSource() async {
    List<Model> selectedData = useData2012 ? _data2012 : (useData2016 ? _data2016 : (useData2020 ? _data2020 : (useData2008 ? _data2008 : _data)));

    return MapShapeSource.asset(
      "assets/world-map.json",
      shapeDataField: "name",
      dataCount: selectedData.length,
      primaryValueMapper: (int index) => selectedData[index].country,
      shapeColorValueMapper: (int index) => selectedData[index].total,
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
  }

  void showCountryInfo(String countryName) {
    List<Model> _getData() {
      if (useData2012) {
        return _data2012;
      } else if (useData2008) {
        return _data2008;
      } else if (useData2016) {
        return _data2016;
      } else if (useData2020) {
        return _data2020;
      } else {
        return _data;
      }
    }

    Model? countryData;

    // Boucle pour trouver le pays correspondant, insensible à la casse.
    for (Model data in _getData()) {
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            backgroundColor: Color(0xFFDCCCA3),
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
                      Expanded(
                        child: Text(
                          countryData!.country,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF4A2545),
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
                    style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF4A2545)),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        "Close",
                        style: GoogleFonts.nunito(fontSize: 16, color: Color(0xFFDCCCA3)),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFF4A2545),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
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
            title: Text("No data"),
            content: Text("No data for this country"),
            actions: <Widget>[
              TextButton(
                child: Text("Close"),
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

  Widget _buildMap() {
    List<Model> _getData() {
      if (useData2012) {
        return _data2012;
      } else if (useData2008) {
        return _data2008;
      } else if (useData2016) {
        return _data2016;
      } else if (useData2020) {
        return _data2020;
      } else {
        return _data;
      }
    }

    return FutureBuilder<MapShapeSource>(
      future: _shapeSource(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SfMaps(
            layers: [
              MapShapeLayer(
                source: snapshot.data!,
                zoomPanBehavior: MapZoomPanBehavior(
                  // Configurez ici le zoomPanBehavior avec un zoomLevel initial plus élevé.
                  enableDoubleTapZooming: true,
                  enablePanning: true,
                  zoomLevel: 1.0, // Ajustez ce niveau de zoom selon vos besoins pour agrandir la carte
                ),
                shapeTooltipBuilder: (BuildContext context, int index) {
                  final data = _getData();
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
                                data[index].country,
                                style: TextStyle(color: const Color(0xFF6d5da7), decoration: TextDecoration.none, fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize),
                              ),
                            ),
                            const Icon(
                              // Icon de sifflet dans le tooltip
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
                        Text(
                          // texte gold medal etc
                          data[index].palmares,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: const Color(0xFF6d5da7), decoration: TextDecoration.none, fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize),
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
          );
        } else if (snapshot.hasError) {
          return Text("Erreur: ${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }

// carte + graphchart
  @override
  Widget build(BuildContext context) {

    return Container(
      color: const Color(0xFF4A2545), // Couleur de fond globale

      child: Column(
        // Utilisation d'une Column pour disposer les widgets verticalement
        children: [
          SearchSection(onSearch: showCountryInfo),
          // appel de la classe SearchSection (barre de recherche)

          Expanded(
            child: Row(
              // Encapsulation dans une Row pour ajouter le rectangle à droite
              children: [
                Expanded(
                  // Carte prenant tout l'espace horizontal disponible sauf pour le rectangle
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PhysicalModel(
                      color: const Color(0xFFDCCCA3),
                      // Couleur de la carte
                      borderRadius: BorderRadius.circular(20.0),
                      // Rayon des coins
                      elevation: 8,
                      child: Container(margin: const EdgeInsets.all(5.0), padding: const EdgeInsets.all(5.0), child: _buildMap()),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCCCA3),
                      // Couleur pour correspondre au fond de la carte
                      borderRadius: BorderRadius.circular(20), // Bords arrondis de 20
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        useData2008 = true;
                                        useData2012 = false;
                                        useData2016 = false;
                                        useData2020 = false;
                                        updateChartData();
                                      });
                                    },
                                    child: Text('2008'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        useData2008 = false;
                                        useData2012 = true;
                                        useData2016 = false;
                                        useData2020 = false;
                                        updateChartData();
                                      });
                                    },
                                    child: Text('2012'),

                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        useData2008 = false;
                                        useData2012 = false;
                                        useData2016 = false;
                                        useData2020 = false;
                                        updateChartData();
                                      });
                                    },
                                    child: Text('All time'),
                                  ),

                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        useData2008 = false;
                                        useData2012 = false;
                                        useData2016 = true;
                                        useData2020 = false;
                                        updateChartData();
                                      });
                                    },
                                    child: Text('2016'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        useData2008 = false;
                                        useData2012 = false;
                                        useData2016 = false;
                                        useData2020 = true;
                                        updateChartData();
                                      });
                                    },
                                    child: Text('2020'),

                                  ),
                                ],
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
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
                                    maximum: 2700,
                                    // Limite l'axe Y entre 0 et 3000
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
                                        labelAlignment: ChartDataLabelAlignment.outer,
                                        textStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w500),
                                      ),
                                      color: Color(0xFF6d5da7), // Couleur des barres du graphique
                                    )
                                  ],
                                ),
                              ),
                              //MyListView(),
                            ],
                          ),
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

class Palma {
  final String country;
  final String sport;
  final String gold;
  final String silver;
  final String bronze;
  final String total;

  const Palma(this.country, this.sport, this.gold, this.silver, this.bronze, this.total);
}

class Model {
  final String country;
  final String palmares;
  final int totalMedals;

  const Model(this.country, this.palmares, this.totalMedals);

  // Méthode pour obtenir le total des médailles
  int get total {
    // Extrait la partie 'Total' de la chaîne 'palmares' et convertit en entier
    final totalString = palmares.split('\n').last.split(': ').last;
    return int.tryParse(totalString) ?? 0; // Renvoie 0 si la conversion échoue
  }

  get countryCode => null;
}

class Athlete {
  final String nom;
  final String prenom;
  final int age;
  final String nationalite;
  final String palmares;
  final String sport;

  const Athlete(this.nom, this.prenom, this.age, this.nationalite, this.palmares, this.sport);
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

      color: Color(0xFFDCCCA3),
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
                        hintText: "Select a country...",
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

                    color: Color(0xFF6d5da7),

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
                    color: Colors.white,
                    onPressed: () {
                      widget.onSearch(searchController.text.trim());
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ChartData extends Model {
  final String country;
  final String palmares;
  final int totalMedals; // Nouvelle propriété pour stocker le total des médailles

  ChartData(this.country, this.palmares, this.totalMedals) : super(country, palmares, totalMedals);

  @override
  int get total {
    // Extrait la partie 'Total' de la chaîne 'palmares' et convertit en entier
    final totalString = palmares.split('\n').last.split(': ').last;
    return int.tryParse(totalString) ?? 0; // Renvoie 0 si la conversion échoue

  }
}


class MyListView extends StatelessWidget {
  // Créer une liste d'athlètes fictive
  final List<Athlete> athletes = [
    const Athlete('Marchand', 'Léon', 21, 'France', '5 world championship gold medals\n 1 world championship silver medal', 'Swimming'),
    const Athlete('tfgvy', 'Léon', 21, 'France', '5 world championship gold medals\n 1 world championship silver medal', 'Swimming'),
    const Athlete('dfghgf', 'Léon', 21, 'France', '5 world championship gold medals\n 1 world championship silver medal', 'Swimming'),
    // Ajoutez d'autres athlètes ici
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Autres widgets à afficher avant la ListView
        Text(
          'Top Prospects',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey[800],
            fontWeight: FontWeight.w800,
            fontSize: 24,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: athletes.length, // Nombre d'athlètes dans la liste
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${athletes[index].prenom} ${athletes[index].nom}'),
              );
            },
          ),
        ),
        // Autres widgets à afficher après la ListView
      ],
    );
  }
}
