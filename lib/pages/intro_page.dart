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
      const Model('United States', 'Gold : 1061\nSilver : 830\nBronze : 738\nTotal : 2629', 2629, 'Michael Phelps\nSwimming\nGold : 23\nSilver : 3\nBronze : 2', 'Grant Holloway (Athletics)\nRyan Murphy (Swimming)\nKatie Ledecky (Swimming)\nNoah Lyles (Athletics)\nRegan Smith (Swimming)'),
      const Model('Afghanistan', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2, 'Rohullah Nikpai\nTaekwondo\nGold : 0\nSilver : 0\nBronze : 2', 'None'),
      const Model('Algeria', 'Gold : 5\nSilver : 4\nBronze : 8\nTotal : 17', 17, 'Taoufik Makhloufi\nAthletics\nGold : 1\nSilver : 2\nBronze : 0', 'None'),
      const Model('Argentina', 'Gold : 21\nSilver : 26\nBronze : 30\nTotal : 77', 77, 'Emanuel Ginobili\nBasketball\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Armenia', 'Gold : 2\nSilver : 8\nBronze : 8\nTotal : 18', 18, 'Artur Aleksanyan\nWrestling\nGold : 1\nSilver : 1\nBronze : 1', 'Artur Aleksanyan (Wrestling)'),
      const Model('Australia', 'Gold : 164\nSilver : 173\nBronze : 210\nTotal : 547', 547, 'Ian Thorpe\nSwimming\nGold : 5\nSilver : 3\nBronze : 1', "Mollie O'Callaghan (Swimming)\nAriarne Titmus (Swimming)\nKaylee McKeown (Swimming)\nEmma McKeon (Swimming)"),
      const Model('Austria', 'Gold : 20\nSilver : 35\nBronze : 41\nTotal : 96', 96, 'Peter Seisenbacher\nJudo\nGold : 2\nSilver : 0\nBronze : 0', 'Anna-Maria Alexandri (Synchronized Swimming)'),
      const Model('Azerbaijan', 'Gold : 7\nSilver : 14\nBronze : 28\nTotal : 49', 49, 'Toğrul Əsgərov\nWrestling\nGold : 1\nSilver : 1\nBronze : 0', 'Hanna Skydan (Athletics)'),
      const Model('Bahamas', 'Gold : 8\nSilver : 2\nBronze : 6\nTotal : 16', 16, 'Chris Brown\nAthletics\nGold : 1\nSilver : 1\nBronze : 2', 'Steven Gardiner (Athletics)\nShaunae Miller-Uibo (Athletics)'),
      const Model('Belarus', 'Gold : 13\nSilver : 30\nBronze : 42\nTotal : 85', 85, 'Ekaterina Karsten\nRowing\nGold : 2\nSilver : 1\nBronze : 1', 'None'),
      const Model('Belgium', 'Gold : 44\nSilver : 56\nBronze : 57\nTotal : 157', 157, 'Hubert Van Innis\nArchery\nGold : 6\nSilver : 3\nBronze : 0', 'Nafissatou Thiam (Athletics)'),
      const Model('Botswana', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2, 'Nijel Amos\nWrestling\nGold : 0\nSilver : 1\nBronze : 0', 'Letsile Tebogo (Athletics)'),
      const Model('Brazil', 'Gold : 37\nSilver : 42\nBronze : 71\nTotal : 150', 150, 'Torben Grael\nSailing\nGold : 2\nSilver : 1\nBronze : 2', 'Volleyball Men Team\nVolleyball Women Team\nIsaquias Queiroz (Canoeing)'),
      const Model('Bulgaria', 'Gold : 54\nSilver : 88\nBronze : 82\nTotal : 224', 224, 'Tanyu Kiryakov\nShooting\nGold : 2\nSilver : 0\nBronze : 1', 'None'),
      const Model('Burkina Faso', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Hugues Fabrice Zango\nAthletics\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Burundi', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2, 'Vénuste Niyongabo\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Cameroon', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6', 6, 'Françoise Mbango Etone\nAthletics\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('Canada', 'Gold : 71\nSilver : 110\nBronze : 145\nTotal : 326', 326, 'Rosannagh MacLennan\nGymnastics\nGold : 2\nSilver : 0\nBronze : 0', 'Summer McIntosh (Swimming)\nMargaret MacNeil (Swimming)\nCamryn Rogers (Athletics)'),
      const Model('Chile', 'Gold : 2\nSilver : 7\nBronze : 4\nTotal : 13', 13, 'Nicolás Massú\nTennis\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('China', 'Gold : 263\nSilver : 199\nBronze : 174\nTotal : 636', 636, 'Wu Minxia\nDiving\nGold : 5\nSilver : 1\nBronze : 1', 'Sun Yang (Swimming)\nMa Long (Table Tennis)\nWang Chuqin (Table Tennis)\nFan Zhendong (Table Tennis)'),
      const Model('Colombia', 'Gold : 5 \nSilver : 13\nBronze : 16\nTotal : 34', 34, 'Caterine Ibargüen\nAthletics\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Costa Rica', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4, 'Claudia Poll\nSwimming\nGold : 1\nSilver : 0\nBronze : 2', 'None'),
      const Model('Ivory Coast', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4, 'Cheick Cissé\nTaekwondo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Croatia', 'Gold : 14\nSilver : 13\nBronze : 14\nTotal : 41', 41, 'Venio Losert\nHandball\nGold : 2\nSilver : 0\nBronze : 1', 'Handball Men Team'),
      const Model('Cuba', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Ramón Fonst\nFencing\nGold : 4\nSilver : 1\nBronze : 0', 'Lazaro Martinez (Athletics)'),
      const Model('Cyprus', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Pávlos Kontídis\nSailing\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Czech Republic', 'Gold : 19\nSilver : 22\nBronze : 26\nTotal : 67', 67, 'Věra Čáslavská\nGymnastics\nGold : 7\nSilver : 4\nBronze : 0', 'None'),
      const Model('Denmark', 'Gold : 48\nSilver : 78\nBronze : 79\nTotal : 205', 205, 'Paul Bert Elvstrøm\nSailing\nGold : 4\nSilver : 0\nBronze : 0', 'None'),
      const Model('Djibouti', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Hussein Ahmed Salah\nMarathon\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Dominican Republic', 'Gold : 3\nSilver : 5\nBronze : 4\nTotal : 12', 12, 'Félix Sánchez\nAthletics\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('Ecuador', 'Gold : 3\nSilver : 2\nBronze : 0\nTotal : 5', 5, 'Jefferson Pérez\nAthletics\nGold : 1\nSilver : 1\nBronze : 0', 'Brian Pintado (Athletics)'),
      const Model('Egypt', 'Gold : 8\nSilver : 11\nBronze : 19\nTotal : 38', 38, 'Karam Gaber\nWrestling\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Eritrea', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Zersenay Tadesse\nAthletics\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Ethiopia', 'Gold : 23\nSilver : 12\nBronze : 23\nTotal : 58', 58, 'Kenenisa Bekele\nAthletics\nGold : 3\nSilver : 1\nBronze : 0', 'Gudaf Tsegay (Athletics)\nAmane Beriso (Athletics)'),
      const Model('Fiji', 'Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3', 3, 'Semisi Naevo\nRugby sevens\nGold : 2\nSilver : 0\nBronze : 0', 'Rugby Sevens Men Team'),
      const Model('Finland', 'Gold : 101\nSilver : 85\nBronze : 119\nTotal : 305', 305, 'Paavo Nurmi\nAthletics\nGold : 9\nSilver : 3\nBronze : 0', 'None'),
      const Model('France', 'Gold : 223\nSilver : 251\nBronze : 277\nTotal : 751', 751, "Christian d'Oriola\nFencing\nGold : 4\nSilver : 2\nBronze : 0", 'Léon Marchand (Swimming)\nMaxime Grousset (Swimming)\nTeddy Riner (Judo)\nClarisse Agbegnenou (Judo)'),
      const Model('Gabon', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Anthony Obame\nTaekwondo\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Georgia', 'Gold : 10\nSilver : 12\nBronze : 18\nTotal : 40', 40, 'Lasha Talakhadze\nWeightlifting\nGold : 2\nSilver : 0\nBronze : 0', 'Lasha Talakhadze (Weightlifting)'),
      const Model('Germany', 'Gold : 201\nSilver : 207\nBronze : 247\nTotal : 655', 655, 'Isabell Werth\nEquestrian Sports\nGold : 7\nSilver : 5\nBronze : 0', 'Florian Wellbrock (Swimming)\nLeonie Beck (Swimming)'),
      const Model('Ghana', 'Gold : 0\nSilver : 1\nBronze : 4\nTotal : 5', 5, 'Clement Quartey\nBoxing\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('United Kingdom', 'Gold : 284\nSilver : 318\nBronze : 314\nTotal : 916', 916, 'Jason Kenny\nCycling\nGold : 7\nSilver : 2\nBronze : 0', 'Matthew Richards (Swimming)\nJosh Kerr (Athletics)\nAdam Peaty (Swimming)'),
      const Model('Greece', 'Gold : 35\nSilver : 45\nBronze : 41\nTotal : 121', 121, 'Pýrros Dímas\nWeightlifting\nGold : 3\nSilver : 0\nBronze : 1', 'None'),
      const Model('Guatemala', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Erick Barrondo\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Guyana', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Michael Anthony\nBoxing\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Haiti', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2, 'Silvio Cator\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Hungary', 'Gold : 181\nSilver : 154\nBronze : 176\nTotal : 511', 511, 'Aladar Gerevich\nFencing\nGold : 7\nSilver : 1\nBronze : 2', 'Water-polo Men Team'),
      const Model('Iceland', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4, 'Vilhjálmur Einarsson\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('India', 'Gold : 10\nSilver : 9\nBronze : 16\nTotal : 35', 32, 'Leslie Claudius\nField Hockey\nGold : 3\nSilver : 1\nBronze : 0', 'None'),
      const Model('Indonesia', 'Gold : 8\nSilver : 14\nBronze : 15\nTotal : 37', 37, 'Liliyana Natsir\nBadminton\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Iran', 'Gold : 24\nSilver : 23\nBronze : 29\nTotal : 76', 76, 'Hadi Saei\nTaekwondo\nGold : 2\nSilver : 1\nBronze : 0', 'None'),
      const Model('Iraq', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Abdul Wahid Aziz\nWeightlifting\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Ireland', 'Gold : 11\nSilver : 10\nBronze : 14\nTotal : 35', 35, 'Michelle Smith\nSwimming\nGold : 3\nSilver : 0\nBronze : 1', 'None'),
      const Model('Israel', 'Gold : 3\nSilver : 1\nBronze : 9\nTotal : 13', 13, 'Gal Fridman\nSailing\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Italy', 'Gold : 217\nSilver : 188\nBronze : 213\nTotal : 618', 618, 'Edoardo Mangiarotti\nFencing\nGold : 6\nSilver : 5\nBronze : 2', 'Daniele Garozzo (Fencing)\nGianmarco Tamberi (Athletics)'),
      const Model('Jamaica', 'Gold : 26\nSilver : 36\nBronze : 26\nTotal : 88', 88, 'Usain Bolt\nAthletics\nGold : 8\nSilver : 0\nBronze : 0', 'Danielle Williams (Athletics)\nShericka Jackson (Athletics)\nAntonio Watson (Athletics)'),
      const Model('Japan', 'Gold : 169\nSilver : 150\nBronze : 178\nTotal : 497', 497, 'Sawao Kato\nGymnastics\nGold : 8\nSilver : 3\nBronze : 1', 'Shohei Ono (Judo)\nAbe Uta (Judo)\n Haruka Kitaguchi (Athletics)\nYukiko Inui (Swimming)'),
      const Model('Jordan', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3', 3, 'Ahmad Abughaush\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Kazakhstan', 'Gold : 14\nSilver : 22\nBronze : 35\nTotal : 71', 71, 'Yermakhan Ibraimov\nBoxing\nGold : 1\nSilver : 0\nBronze : 1', 'Yeldos Smetov (Judo)'),
      const Model('Kenya', 'Gold : 35\nSilver : 42\nBronze : 36\nTotal : 113', 113, 'Kipchoge Keino\nAthletics\nGold : 2\nSilver : 2\nBronze : 0', 'Faith Kipyegon (Athletics)\nMary Moraa (Athletics)'),
      const Model('Kosovo', 'Gold : 3\nSilver : 0\nBronze : 0\nTotal : 3', 3, 'Nora Gjakova\nJudo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('North Korea', 'Gold : 16\nSilver : 16\nBronze : 23\nTotal : 55', 55, 'Rim Jong-sim\nWeightlifting\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('South Korea', 'Gold : 96\nSilver : 91\nBronze : 100\nTotal : 287', 287, 'Jin Jong-oh\nShooting\nGold : 4\nSilver : 2\nBronze : 0', 'An San (Archery)\nOh Sang-uk (Fencing)'),
      const Model('Kuwait', 'Gold : 0\nSilver : 0\nBronze : 3\nTotal : 3', 3, 'Fehaid al-Deehani\nAthletics\nGold : 0\nSilver : 0\nBronze : 3', 'None'),
      const Model('Kyrgyzstan', 'Gold : 0\nSilver : 3\nBronze : 4\nTotal : 7', 7, 'Akzhol Makhmudov\nWrestling\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Latvia', 'Gold : 4\nSilver : 11\nBronze : 6\nTotal : 21', 21, 'Maris Strombergs\nBMX\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('Lebanon', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4, 'Mohamed Traboulsi\nWeightlifting\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Lithuania', 'Gold : 6\nSilver : 7\nBronze : 13\nTotal : 26', 26, 'Virgilijus Alekna\nAthletics\nGold : 2\nSilver : 0\nBronze : 1', 'None'),
      const Model('Luxembourg', 'Gold : 2\nSilver : 1\nBronze : 0\nTotal : 3', 3, 'Josy Barthel\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Malaysia', 'Gold : 0\nSilver : 8\nBronze : 5\nTotal : 13', 13, 'Lee Chong Wei\nBadminton\nGold : 0\nSilver : 3\nBronze : 0', 'None'),
      const Model('Mexico', 'Gold : 13\nSilver : 24\nBronze : 35\nTotal : 72', 72, 'Humberto Mariles\nEquestrian Sports\nGold : 2\nSilver : 0\nBronze : 1', 'None'),
      const Model('Moldova', 'Gold : 0\nSilver : 2\nBronze : 4\nTotal : 6', 6, 'Nicolae Juravschi\nCanoeing\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Mongolia', 'Gold : 2\nSilver : 11\nBronze : 17\nTotal : 30', 30, 'Naidangiin Tüvshinbayar\nJudo\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Montenegro', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Ana Dokic\nHandball\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Morocco', 'Gold : 7\nSilver : 5\nBronze : 12\nTotal : 24', 24, 'Hicham El Guerrouj\nAthletics\nGold : 2\nSilver : 1\nBronze : 0', 'Soufiane el-Bakkali (Athletics)'),
      const Model('Mozambique', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2, 'Maria de Lurdes Mutola\nAthletics\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Namibia', 'Gold : 0\nSilver : 5\nBronze : 0\nTotal : 5', 5, 'Frankie Fredericks\nAthletics\nGold : 0\nSilver : 4\nBronze : 0', 'None'),
      const Model('Netherlands', 'Gold : 95\nSilver : 105\nBronze : 122\nTotal : 322', 322, 'Inge de Brujin\nSwimming\nGold : 4\nSilver : 2\nBronze : 2', 'Femke Bol (Athletics)'),
      const Model('New Zealand', 'Gold : 53\nSilver : 33\nBronze : 51\nTotal : 137', 137, 'Lisa Carrington\nCanoeing\nGold : 5\nSilver : 0\nBronze : 1', 'None'),
      const Model('Niger', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2, 'Abdoul Razak Issoufou\nTaekwondo\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Nigeria', 'Gold : 3\nSilver : 11\nBronze : 13\nTotal : 27', 27, 'Chioma Ajunwa\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Norway', 'Gold : 61\nSilver : 52\nBronze : 50\nTotal : 163', 163, 'Ole Lilloe-Olsen\nShooting\nGold : 5\nSilver : 1\nBronze : 0', 'Karsten Warholm (Athletics)'),
      const Model('Pakistan', 'Gold : 3\nSilver : 3\nBronze : 4\nTotal : 10', 10, 'Munir Dar\nField Hockey\nGold : 1\nSilver : 2\nBronze : 0', 'None'),
      const Model('Panama', 'Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3', 3, 'Irving Saladino\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Paraguay', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Rodrigo Romero\nFootball\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Peru', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4', 4, 'Edwin Vasquez\nShooting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Philippines', 'Gold : 1\nSilver : 5\nBronze : 8\nTotal : 14', 14, 'Hidilyn Diaz\nWeightlifting\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Poland', 'Gold : 72\nSilver : 89\nBronze : 137\nTotal : 298', 298, 'Robert Korzeniowski\nAthletics\nGold : 4\nSilver : 0\nBronze : 0', 'Anita Włodarczyk (Athletics)'),
      const Model('Portugal', 'Gold : 5\nSilver : 9\nBronze : 14\nTotal : 28', 28, 'Carlos Lopes\nAthletics\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Puerto Rico', 'Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10', 10, 'Monica Puig\nTennis\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Qatar', 'Gold : 2\nSilver : 2\nBronze : 4\nTotal : 8', 8, 'Mutaz Essa Barshim\nAthletics\nGold : 1\nSilver : 2\nBronze : 0', 'None'),
      const Model('Romania', 'Gold : 90\nSilver : 97\nBronze : 121\nTotal : 308', 308, 'Nadia Comaneci\nGymnastics\nGold : 5\nSilver : 3\nBronze : 1', 'None'),
      const Model('Russia', 'Gold : 147\nSilver : 126\nBronze : 151\nTotal : 424', 424, 'Anastasia Davydova\nSynchronized Swimming\nGold : 5\nSilver : 0\nBronze : 0', 'None'),
      const Model('Saudi Arabia', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4, 'Tareg Hamedi\nKarate\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Senegal', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Amadou Dia Ba\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Serbia', 'Gold : 6\nSilver : 7\nBronze : 11\nTotal : 24', 24, 'Milica Mandic\nTaekwondo\nGold : 2\nSilver : 0\nBronze : 0', 'Water-polo Mens Team'),
      const Model('Slovakia', 'Gold : 10\nSilver : 14\nBronze : 8\nTotal : 32', 32, 'Pavol Hochschorner\nCanoeing\nGold : 3\nSilver : 0\nBronze : 1', 'None'),
      const Model('Slovenia', 'Gold : 8\nSilver : 9\nBronze : 11\nTotal : 28', 28, 'Iztok Cop\nRowing\nGold : 1\nSilver : 1\nBronze : 2', 'None'),
      const Model('South Africa', 'Gold : 27\nSilver : 33\nBronze : 29\nTotal : 89', 89, 'Chad le Clos\nSwimming\nGold : 1\nSilver : 3\nBronze : 0', 'Tatjana Schoenmaker (Swimming)'),
      const Model('Spain', 'Gold : 48\nSilver : 72\nBronze : 49\nTotal : 169', 169, 'Joan Llaneras\nCycling\nGold : 2\nSilver : 2\nBronze : 0', 'None'),
      const Model('Sri Lanka', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2', 2, 'Susanthika Jayasinghe\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Sudan', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Ismail Ahmed Ismail\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Suriname', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2, 'Anthony Nesty\nSwimming\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Sweden', 'Gold : 147\nSilver : 177\nBronze : 179\nTotal : 503', 503, 'Gert Fredriksson\nCanoeing\nGold : 6\nSilver : 1\nBronze : 1', 'Sarah Sjöström (Swimming)\nArmand Duplantis (Athletics)\nDaniel Stahl (Athletics)'),
      const Model('Switzerland', 'Gold : 53\nSilver : 79\nBronze : 74\nTotal : 206', 206, 'Georges Miez\nGymnastics\nGold : 4\nSilver : 3\nBronze : 1', 'None'),
      const Model('Syria', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4, 'Ghada Shouaa\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Tajikistan', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4, 'Dilshod Nazarov\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Tanzania', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2', 2, 'Filbert Bayi\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Thailand', 'Gold : 10\nSilver : 8\nBronze : 17\nTotal : 35', 35, 'Manus Boonjumnong\nBoxing\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Togo', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Benjamin Boukpeti\nCanoeing\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Tonga', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Paea Wolfgramm\nBoxing\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Trinidad and Tobago', 'Gold : 3\nSilver : 5\nBronze : 11\nTotal : 19', 19, 'Marc Burns\nAthletics\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Tunisia', 'Gold : 5\nSilver : 3\nBronze : 7\nTotal : 15', 15, 'Oussama Mellouli\nSwimming\nGold : 2\nSilver : 0\nBronze : 1', 'None'),
      const Model('Turkey', 'Gold : 41\nSilver : 26\nBronze : 36\nTotal : 103', 103, 'Halil Mutlu\nWeightlifting\nGold : 3\nSilver : 0\nBronze : 0', 'None'),
      const Model('Turkmenistan', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Polina Guryeva\nWheightlifting\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Uganda', 'Gold : 4\nSilver : 4\nBronze : 3\nTotal : 11', 11, 'Joshua Cheptegei\nAthletics\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Ukraine', 'Gold : 35\nSilver : 36\nBronze : 68\nTotal : 139', 139, 'Yana Klochkova\nSwimming\nGold : 4\nSilver : 1\nBronze : 0', 'None'),
      const Model('United Arab Emirates', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2, 'Ahmed Al Maktoum\nShooting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Uruguay', 'Gold : 2\nSilver : 2\nBronze : 6\nTotal : 10', 10, 'José Andrade\nFootball\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('Uzbekistan', 'Gold : 10\nSilver : 6\nBronze : 20\nTotal : 36', 36, 'Artur Taymazov\nWrestling\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Venezuela', 'Gold : 3\nSilver : 7\nBronze : 9\nTotal : 19', 19, 'Yulimar Rojas\nAthletics\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Vietnam', 'Gold : 1\nSilver : 3\nBronze : 1\nTotal : 5', 5, 'Hoàng Xuân Vinh\nShooting\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Zambia', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2, 'Samuel Matete\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Zimbabwe', 'Gold : 3\nSilver : 4\nBronze : 1\nTotal : 8', 8, 'Kirsty Coventry\nSwimming\nGold : 2\nSilver : 4\nBronze : 1', 'None'),
    ];
    _data2008 = <Model>[
      const Model('China', 'Gold : 48\nSilver : 22\nBronze : 30\nTotal : 100', 100, 'Zou Kai\nGymnastics\nGold : 3\nSilver : 0\nBronze : 0', 'Sun Yang (Swimming)\nMa Long (Table Tennis)\nWang Chuqin (Table Tennis)\nFan Zhendong (Table Tennis)'),
      const Model('United States', 'Gold : 36\nSilver : 39\nBronze : 37\nTotal : 112', 112, 'Michael Phelps\nSwimming\nGold : 8\nSilver : 0\nBronze : 0', 'Grant Holloway (Athletics)\nRyan Murphy (Swimming)\nKatie Ledecky (Swimming)\nNoah Lyles (Athletics)\nRegan Smith (Swimming)'),
      const Model('Russia', 'Gold : 24\nSilver : 13\nBronze : 23\nTotal : 60', 60, 'Anastasia Davydova\nSynchronized Swimming\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('United Kingdom', 'Gold : 19\nSilver : 13\nBronze : 19\nTotal : 51', 51, 'Chris Hoy\nCycling\nGold : 3\nSilver : 0\nBronze : 0', 'Matthew Richards (Swimming)\nJosh Kerr (Athletics)\nAdam Peaty (Swimming)'),
      const Model('Germany', 'Gold : 16\nSilver : 11\nBronze : 14\nTotal : 41', 41, 'Britta Steffen\nSwimming\nGold : 2\nSilver : 0\nBronze : 0', 'Florian Wellbrock (Swimming)\nLeonie Beck (Swimming)'),
      const Model('Australia', 'Gold : 14\nSilver : 15\nBronze : 17\nTotal : 46', 46, 'Stephanie Rice\nSwimming\nGold : 3\nSilver : \nBronze : 0', "Mollie O'Callaghan (Swimming)\nAriarne Titmus (Swimming)\nKaylee McKeown (Swimming)\nEmma McKeon (Swimming)"),
      const Model('South Korea', 'Gold : 13\nSilver : 11\nBronze : 8\nTotal : 32', 32, 'Hyojung Lee\nBadminton\nGold : 1\nSilver : 1\nBronze : 0', 'An San (Archery)\nOh Sang-uk (Fencing)'),
      const Model('Japan', 'Gold : 9\nSilver : 8\nBronze : 8\nTotal : 25', 25, 'Hyojung Lee\nBadminton\nGold : 1\nSilver : 1\nBronze : 0', 'Shohei Ono (Judo)\nAbe Uta (Judo)\n Haruka Kitaguchi (Athletics)\nYukiko Inui (Swimming)'),
      const Model('Italy', 'Gold : 8\nSilver : 9\nBronze : 10\nTotal : 27', 27, 'Matteo Tagliariol\nFencing\nGold : 1\nSilver : 0\nBronze : 1', 'Daniele Garozzo (Fencing)\nGianmarco Tamberi (Athletics)'),
      const Model('France', 'Gold : 7\nSilver : 16\nBronze : 20\nTotal : 43', 43, 'Alain Bernard\nSwimming\nGold : 1\nSilver : 1\nBronze : 1', 'Léon Marchand (Swimming)\nMaxime Grousset (Swimming)\nTeddy Riner (Judo)\nClarisse Agbegnenou (Judo)'),
      const Model('Netherlands', 'Gold : 7\nSilver : 5\nBronze : 4\nTotal : 16', 16, 'Danielle De Bruijn\nWater-polo\nGold : 1\nSilver : 0\nBronze : 0', 'Femke Bol (Athletics)'),
      const Model('Ukraine', 'Gold : 7\nSilver : 4\nBronze : 11\nTotal : 22', 22, 'Viktor Ruban\nArchery\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Kenya', 'Gold : 6\nSilver : 4\nBronze : 6\nTotal : 16', 16, 'Samuel Wanjiru\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Faith Kipyegon (Athletics)\nMary Moraa (Athletics)'),
      const Model('Spain', 'Gold : 5\nSilver : 11\nBronze : 3\nTotal : 19', 19, 'Joan Llaneras\nCycling\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Jamaica', 'Gold : 5\nSilver : 4\nBronze : 2\nTotal : 11', 11, 'Usain Bolt\nAthletics\nGold : 2\nSilver : 0\nBronze : 0', 'Danielle Williams (Athletics)\nShericka Jackson (Athletics)\nAntonio Watson (Athletics)'),
      const Model('Poland', 'Gold : 4\nSilver : 5\nBronze : 2\nTotal : 11', 11, 'Adam Korol\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'Anita Włodarczyk (Athletics)'),
      const Model('Ethiopia', 'Gold : 4\nSilver : 2\nBronze : 1\nTotal : 7', 7, 'Kenenisa Bekele\nAthletics\nGold : 2\nSilver : 0\nBronze : 0', 'Gudaf Tsegay (Athletics)\nAmane Beriso (Athletics)'),
      const Model('Romania', 'Gold : 4\nSilver : 1\nBronze : 4\nTotal : 9', 9, 'Georgeta Andrunache\nRowing\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Cuba', 'Gold : 3\nSilver : 10\nBronze : 17\nTotal : 30', 30, 'Yipsi Moreno\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Lazaro Martinez (Athletics)'),
      const Model('Canada', 'Gold : 3\nSilver : 9\nBronze : 8\nTotal : 20', 20, 'Eric Lamaze\nEquestrian Sports\nGold : 1\nSilver : 0\nBronze : 0', 'Summer McIntosh (Swimming)\nMargaret MacNeil (Swimming)\nCamryn Rogers (Athletics)'),
      const Model('Hungary', 'Gold : 3\nSilver : 5\nBronze : 2\nTotal : 10', 10, 'Natasa Douchev-Janic\nCanoeing\nGold : 1\nSilver : 1\nBronze : 0', 'Water-polo Men Team'),
      const Model('Norway', 'Gold : 3\nSilver : 5\nBronze : 1\nTotal : 9', 9, 'Tonje Larsen\nHandball\nGold : 1\nSilver : 0\nBronze : 0', 'Karsten Warholm (Athletics)'),
      const Model('Brazil', 'Gold : 3\nSilver : 4\nBronze : 10\nTotal : 17', 17, 'Cesar Cielo\nSwimming\nGold : 1\nSilver : 0\nBronze : 1', 'Volleyball Men Team\nVolleyball Women Team\nIsaquias Queiroz (Canoeing)'),
      const Model('Belarus', 'Gold : 3\nSilver : 4\nBronze : 7\nTotal : 14', 14, 'Raman Piatrushenka\nCanoe\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Czech Republic', 'Gold : 3\nSilver : 3\nBronze : 1\nTotal : 7', 7, 'Katerina Emmons\nShooting\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Slovakia', 'Gold : 3\nSilver : 3\nBronze : 0\nTotal : 6', 6, 'Michal Martikan\nCanoe\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('New Zealand', 'Gold : 3\nSilver : 2\nBronze : 4\nTotal : 9', 9, 'Valerie Adams\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Georgia', 'Gold : 3\nSilver : 2\nBronze : 2\nTotal : 7', 7, 'Revazi Mindorashvili\nWrestling\nGold : 1\nSilver : 0\nBronze : 0', 'Lasha Talakhadze (Weightlifting)'),
      const Model('Kazakhstan', 'Gold : 2\nSilver : 3\nBronze : 4\nTotal : 9', 9, 'Bakhyt Sarsekbayev\nBoxing\nGold : 1\nSilver : 0\nBronze : 0', 'Yeldos Smetov (Judo)'),
      const Model('Denmark', 'Gold : 2\nSilver : 2\nBronze : 3\nTotal : 7', 7, 'Eskild Ebbesen\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('North Korea', 'Gold : 2\nSilver : 2\nBronze : 2\nTotal : 6', 6, 'Un-Jong Hong\nGymnastics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Mongolia', 'Gold : 2\nSilver : 2\nBronze : 0\nTotal : 4', 4, 'Tuvshinbayar Naidan\nJudo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Switzerland', 'Gold : 2\nSilver : 1\nBronze : 4\nTotal : 7', 7, 'Fabian Cancellara\nCycling\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Argentina', 'Gold : 2\nSilver : 0\nBronze : 4\nTotal : 6', 6, 'Angel Di Maria\nFootball\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Mexico', 'Gold : 2\nSilver : 0\nBronze : 2\nTotal : 4', 4, 'Guillermo Perez\nTaekwondo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Belgium', 'Gold : 2\nSilver : 0\nBronze : 0\nTotal : 2', 2, 'Elodie Ouedraogo\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Nafissatou Thiam (Athletics)'),
      const Model('Zimbabwe', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4', 4, 'Kirsty Coventry\nSwimming\nGold : 1\nSilver : 3\nBronze : 0', 'None'),
      const Model('Slovenia', 'Gold : 1\nSilver : 2\nBronze : 2\nTotal : 5', 5, 'Primoz Kozmus\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Azerbaijan', 'Gold : 1\nSilver : 1\nBronze : 4\nTotal : 6', 6, 'Elnur Mammadli\nJudo\nGold : 1\nSilver : 0\nBronze : 0', 'Hanna Skydan (Athletics)'),
      const Model('Bulgaria', 'Gold : 1\nSilver : 1\nBronze : 3\nTotal : 5', 5, 'Rumyana Neykova\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Chinese Taipei', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4, 'Wei-Ling Chen\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Latvia', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3', 3, 'Maris Strombergs\nBMX\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Dominican Republic', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2, 'Felix Diaz\nBoxing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('India', 'Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3', 3, 'Abhinav Bindra\nShooting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Iran', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2, 'Hadi Saeibonehkohal\nTaekwondo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Cameroon', 'Gold : 1\nSilver : 0\nBronze : 0\nTotal : 1', 1, 'Françoise Mbango Etone\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Sweden', 'Gold : 0\nSilver : 4\nBronze : 1\nTotal : 5', 5, 'Thomas Johansson\nTennis\nGold : 0\nSilver : 1\nBronze : 0', 'Sarah Sjöström (Swimming)\nArmand Duplantis (Athletics)\nDaniel Stahl (Athletics)'),
      const Model('Lithuania', 'Gold : 0\nSilver : 3\nBronze : 2\nTotal : 5', 5, 'Edvinas Krungolcas\nModern Pentathlon\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Croatia', 'Gold : 0\nSilver : 2\nBronze : 3\nTotal : 5', 5, 'Blanka Vlasic\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'Handball Men Team'),
      const Model('Colombia', 'Gold : 0\nSilver : 2\nBronze : 1\nTotal : 3', 3, 'Diego Fernando Salazar\nWeightlifting\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Armenia', 'Gold : 0\nSilver : 1\nBronze : 4\nTotal : 5', 5, 'Tigran Varban Martirosyan\nWeightlifting\nGold : 0\nSilver : 1\nBronze : 0', 'Artur Aleksanyan (Wrestling)'),
      const Model('Uzbekistan', 'Gold : 0\nSilver : 1\nBronze : 3\nTotal : 4', 4, 'Abdullo Tangriev\nJudo\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Austria', 'Gold : 0\nSilver : 1\nBronze : 2\nTotal : 3', 3, 'Ludwig paischer\nJudo\nGold : 0\nSilver : 1\nBronze : 0', 'Anna-Maria Alexandri (Synchronized Swimming)'),
      const Model('Algeria', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2, 'Amar Benikhlef\nJudo\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Chile', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Fernando Gonzalez\nTennis\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Egypt', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2, 'Abir Khalil\nWeightlifting\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Afghanistan', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Rohullah Nikpai\nTaekwondo\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
    ];
    _data2012 = <Model>[
      const Model('United States', 'Gold : 48\nSilver : 26\nBronze : 30\nTotal : 104', 104, 'Michael Phelps\nSwimming\nGold : 4\nSilver : 2\nBronze : 0', 'Grant Holloway (Athletics)\nRyan Murphy (Swimming)\nKatie Ledecky (Swimming)\nNoah Lyles (Athletics)\nRegan Smith (Swimming)'),
      const Model('China', 'Gold : 39\nSilver : 31\nBronze : 22\nTotal : 92', 92, 'Yang Sun\nSwimming\nGold : 2\nSilver : 1\nBronze : 1', 'Sun Yang (Swimming)\nMa Long (Table Tennis)\nWang Chuqin (Table Tennis)\nFan Zhendong (Table Tennis)'),
      const Model('United Kingdom', 'Gold : 29\nSilver : 18\nBronze : 18\nTotal : 65', 65, 'Laura Kenny\nCycling\nGold : 2\nSilver : 0\nBronze : 0', 'Matthew Richards (Swimming)\nJosh Kerr (Athletics)\nAdam Peaty (Swimming)'),
      const Model('Russia', 'Gold : 18\nSilver : 21\nBronze : 26\nTotal : 65', 65, 'Svetlana Romashina\nSynchronized Swimming\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('South Korea', 'Gold : 13\nSilver : 9\nBronze : 9\nTotal : 31', 31, 'Bobae Ki\nArchery\nGold : 2\nSilver : 0\nBronze : 0', 'An San (Archery)\nOh Sang-uk (Fencing)'),
      const Model('Germany', 'Gold : 11\nSilver : 20\nBronze : 13\nTotal : 44', 44, 'Michael Jung\nEquestrian Sports\nGold : 2\nSilver : 0\nBronze : 0', 'Florian Wellbrock (Swimming)\nLeonie Beck (Swimming)'),
      const Model('France', 'Gold : 11\nSilver : 11\nBronze : 13\nTotal : 35', 35, 'Yannick Agnel\nSwimming\nGold : 2\nSilver : 1\nBronze : 0', 'Léon Marchand (Swimming)\nMaxime Grousset (Swimming)\nTeddy Riner (Judo)\nClarisse Agbegnenou (Judo)'),
      const Model('Australia', 'Gold : 8\nSilver : 15\nBronze : 12\nTotal : 35', 35, 'Alicia Coutts\nSwimming\nGold : 1\nSilver : 3\nBronze : 1', "Mollie O'Callaghan (Swimming)\nAriarne Titmus (Swimming)\nKaylee McKeown (Swimming)\nEmma McKeon (Swimming)"),
      const Model('Italy', 'Gold : 8\nSilver : 9\nBronze : 11\nTotal : 28', 28, 'Elisa Di Francisca\nFencing\nGold : 2\nSilver : 0\nBronze : 0', 'Daniele Garozzo (Fencing)\nGianmarco Tamberi (Athletics)'),
      const Model('Hungary', 'Gold : 8\nSilver : 4\nBronze : 6\nTotal : 18', 18, 'Danuta Kozak\nCanoeing\nGold : 2\nSilver : 0\nBronze : 0', 'Water-polo Men Team'),
      const Model('Japan', 'Gold : 7\nSilver : 14\nBronze : 17\nTotal : 38', 38, 'Kohei Uchimura\nGymnastics\nGold : 1\nSilver : 2\nBronze : 0', 'Shohei Ono (Judo)\nAbe Uta (Judo)\n Haruka Kitaguchi (Athletics)\nYukiko Inui (Swimming)'),
      const Model('Iran', 'Gold : 7\nSilver : 5\nBronze : 1\nTotal : 13', 13, 'Behdad Salimikordasiabi\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Netherlands', 'Gold : 6\nSilver : 6\nBronze : 8\nTotal : 20', 20, 'Ranomi Kromowidjojo\nSwimming\nGold : 2\nSilver : 1\nBronze : 0', 'Femke Bol (Athletics)'),
      const Model('New Zealand', 'Gold : 6\nSilver : 2\nBronze : 5\nTotal : 13', 13, 'Polly Powrie\nSailing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Ukraine', 'Gold : 5\nSilver : 4\nBronze : 10\nTotal : 19', 19, 'Yana Shemyakina\nFencing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Cuba', 'Gold : 5\nSilver : 3\nBronze : 7\nTotal : 15', 15, 'Robeisy Ramirez Carrazana\nBoxing\nGold : 1\nSilver : 0\nBronze : 0', 'Lazaro Martinez (Athletics)'),
      const Model('Spain', 'Gold : 4\nSilver : 10\nBronze : 6\nTotal : 20', 20, 'Sofia Toro Prieto Puga\nSailing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Jamaica', 'Gold : 4\nSilver : 5\nBronze : 4\nTotal : 13', 13, 'Usain Bolt\nAthletics\nGold : 3\nSilver : 0\nBronze : 0', 'Danielle Williams (Athletics)\nShericka Jackson (Athletics)\nAntonio Watson (Athletics)'),
      const Model('Czech Republic', 'Gold : 4\nSilver : 4\nBronze : 3\nTotal : 11', 11, 'Barbora Spotakova\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('South Africa', 'Gold : 4\nSilver : 1\nBronze : 1\nTotal : 6', 6, 'Chad Le Clos\nSwimming\nGold : 1\nSilver : 1\nBronze : 0', 'Tatjana Schoenmaker (Swimming)'),
      const Model('North Korea', 'Gold : 4\nSilver : 0\nBronze : 3\nTotal : 7', 7, 'Kum Ae An\nJudo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Brazil', 'Gold : 3\nSilver : 5\nBronze : 9\nTotal : 17', 17, 'Arthur Zanetti\nGymnastics\nGold : 1\nSilver : 0\nBronze : 0', 'Volleyball Men Team\nVolleyball Women Team\nIsaquias Queiroz (Canoeing)'),
      const Model('Kazakhstan', 'Gold : 3\nSilver : 2\nBronze : 6\nTotal : 11', 11, 'Alexandr Vinokurov\nCycling\nGold : 1\nSilver : 0\nBronze : 0', 'Yeldos Smetov (Judo)'),
      const Model('Ethiopia', 'Gold : 3\nSilver : 2\nBronze : 3\nTotal : 8', 8, 'Tirunesh Dibaba\nAthletics\nGold : 1\nSilver : 0\nBronze : 1', 'Gudaf Tsegay (Athletics)\nAmane Beriso (Athletics)'),
      const Model('Croatia', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6', 6, 'Frano Vican\nWater-polo\nGold : 1\nSilver : 0\nBronze : 0', 'Handball Men Team'),
      const Model('Canada', 'Gold : 2\nSilver : 6\nBronze : 10\nTotal : 18', 18, 'Rosannagh Maclennan\nGymnastics\nGold : 1\nSilver : 0\nBronze : 0', 'Summer McIntosh (Swimming)\nMargaret MacNeil (Swimming)\nCamryn Rogers (Athletics)'),
      const Model('Belarus', 'Gold : 2\nSilver : 5\nBronze : 3\nTotal : 10', 10, 'Victoria Azarenka\nTennis\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Kenya', 'Gold : 2\nSilver : 4\nBronze : 7\nTotal : 13', 13, 'Ezekiel Kemboi\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Faith Kipyegon (Athletics)\nMary Moraa (Athletics)'),
      const Model('Denmark', 'Gold : 2\nSilver : 4\nBronze : 3\nTotal : 9', 9, 'Rasmus Nicholai Quist Hansen\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Romania', 'Gold : 2\nSilver : 4\nBronze : 1\nTotal : 7', 7, 'Sandra Raluca Izbasa\nGymnastics\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Azerbaijan', 'Gold : 2\nSilver : 2\nBronze : 5\nTotal : 9', 9, 'Sharif Sharifov\nWrestling\nGold : 1\nSilver : 0\nBronze : 0', 'Hanna Skydan (Athletics)'),
      const Model('Switzerland', 'Gold : 2\nSilver : 2\nBronze : 0\nTotal : 4', 4, 'Nicola Spirig\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Norway', 'Gold : 2\nSilver : 1\nBronze : 1\nTotal : 4', 4, 'Tonje Noestvold\nHandball\nGold : 1\nSilver : 0\nBronze : 0', 'Karsten Warholm (Athletics)'),
      const Model('Lithuania', 'Gold : 2\nSilver : 0\nBronze : 3\nTotal : 5', 5, 'Ruta Meilutyte\nSwimming\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Tunisia', 'Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3', 3, 'Habiba Ghribi\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Sweden', 'Gold : 1\nSilver : 4\nBronze : 3\nTotal : 8', 8, 'Frederik Loof\nSailing\nGold : 1\nSilver : 0\nBronze : 0', 'Sarah Sjöström (Swimming)\nArmand Duplantis (Athletics)\nDaniel Stahl (Athletics)'),
      const Model('Colombia', 'Gold : 1\nSilver : 3\nBronze : 5\nTotal : 9', 9, 'Mariana Pajon\nBMX\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Mexico', 'Gold : 1\nSilver : 3\nBronze : 4\nTotal : 8', 8, 'Giovani Dos Santos\nFootball\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Georgia', 'Gold : 1\nSilver : 2\nBronze : 3\nTotal : 6', 6, 'Lasha Shavdatuashvili\nJudo\nGold : 1\nSilver : 0\nBronze : 0', 'Lasha Talakhadze (Weightlifting)'),
      const Model('Ireland', 'Gold : 1\nSilver : 1\nBronze : 4\nTotal : 6', 6, 'Katie Taylor\nBoxing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Argentina', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4, 'Sebastian Eduardo Crismanich\nTaekwondo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Turkey', 'Gold : 1\nSilver : 1\nBronze : 1\nTotal : 3', 3, 'Servet Tazegul\nTaekwondo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Dominican Republic', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2, 'Felix Sanchez\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Chinese Taipei', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2, 'Shu-Ching Hsu\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Algeria', 'Gold : 1\nSilver : 0\nBronze : 0\nTotal : 1', 1, 'Taoufik Makhloufi\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Egypt', 'Gold : 0\nSilver : 3\nBronze : 1\nTotal : 4', 4, 'Alaaeldin Abouelkassem\nFencing\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('India', 'Gold : 0\nSilver : 2\nBronze : 4\nTotal : 6', 6, 'Sushil Kumar\nWrestling\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Mongolia', 'Gold : 0\nSilver : 2\nBronze : 3\nTotal : 5', 5, 'Tögstsogt Nyambayaryn\nBoxing\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Thailand', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4, 'Pimsiri Sirikaew\nWeightlifting\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Bulgaria', 'Gold : 0\nSilver : 2\nBronze : 1\nTotal : 3', 3, 'Stanka Zlateva\nWrestling\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Slovakia', 'Gold : 0\nSilver : 1\nBronze : 3\nTotal : 4', 4, 'Zuzana Stefecekova\nShooting\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Belgium', 'Gold : 0\nSilver : 1\nBronze : 2\nTotal : 3', 3, 'Lionel Cox\nShooting\nGold : 0\nSilver : 1\nBronze : 0', 'Nafissatou Thiam (Athletics)'),
      const Model('Armenia', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2, 'Arsen Julfalakyan\nWrestling\nGold : 0\nSilver : 1\nBronze : 0', 'Artur Aleksanyan (Wrestling)'),
      const Model('Botswana', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Nijel Amos\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Uzbekistan', 'Gold : 0\nSilver : 0\nBronze : 3\nTotal : 3', 3, 'Ivan Efremov\nWeightlifting\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Greece', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2, 'Alexandra Tsiavou\nRowing\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Afghanistan', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Rohullah Nikpai\nTaekwondo\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
    ];
    _data2016 = <Model>[
      const Model('United States', 'Gold : 46\nSilver : 37\nBronze : 38\nTotal : 121', 121, 'Michael Phelps\nSwimming\nGold : 5\nSilver : 1\nBronze : 0', 'Grant Holloway (Athletics)\nRyan Murphy (Swimming)\nKatie Ledecky (Swimming)\nNoah Lyles (Athletics)\nRegan Smith (Swimming)'),
      const Model('United Kingdom', 'Gold : 27\nSilver : 23\nBronze : 17\nTotal : 67', 67, 'Jason Kenny\nCycling\nGold : 3\nSilver : 0\nBronze : 0', 'Matthew Richards (Swimming)\nJosh Kerr (Athletics)\nAdam Peaty (Swimming)'),
      const Model('China', 'Gold : 26\nSilver : 18\nBronze : 26\nTotal : 70', 70, 'Long Ma\nTable Tennis\nGold : 2\nSilver : 0\nBronze : 0', 'Sun Yang (Swimming)\nMa Long (Table Tennis)\nWang Chuqin (Table Tennis)\nFan Zhendong (Table Tennis)'),
      const Model('Russia', 'Gold : 19\nSilver : 17\nBronze : 20\nTotal : 56', 56, 'Yana Egorian\nFencing\nGold : 2\nSilver : 0\nBronze : 0', 'None'),
      const Model('Germany', 'Gold : 17\nSilver : 10\nBronze : 15\nTotal : 42', 42, 'Sebastian Brendel\nCanoe\nGold : 2\nSilver : 0\nBronze : 0', 'Florian Wellbrock (Swimming)\nLeonie Beck (Swimming)'),
      const Model('Japan', 'Gold : 12\nSilver : 8\nBronze : 21\nTotal : 41', 41, 'Kohei Uchimura\nGymnastics\nGold : 2\nSilver : 0\nBronze : 0', 'Shohei Ono (Judo)\nAbe Uta (Judo)\n Haruka Kitaguchi (Athletics)\nYukiko Inui (Swimming)'),
      const Model('France', 'Gold : 10\nSilver : 18\nBronze : 14\nTotal : 42', 42, 'Astier Nicolas\nEquestrian Sports\nGold : 1\nSilver : 1\nBronze : 0', 'Léon Marchand (Swimming)\nMaxime Grousset (Swimming)\nTeddy Riner (Judo)\nClarisse Agbegnenou (Judo)'),
      const Model('South Korea', 'Gold : 9\nSilver : 3\nBronze : 9\nTotal : 21', 21, 'Hyejin Chang\nArchery\nGold : 2\nSilver : 0\nBronze : 0', 'An San (Archery)\nOh Sang-uk (Fencing)'),
      const Model('Italy', 'Gold : 8\nSilver : 12\nBronze : 8\nTotal : 28', 28, 'Niccolo Campriani\nShooting\nGold : 2\nSilver : 0\nBronze : 0', 'Daniele Garozzo (Fencing)\nGianmarco Tamberi (Athletics)'),
      const Model('Australia', 'Gold : 8\nSilver : 11\nBronze : 10\nTotal : 29', 29, 'Emma Mckeon\nSwimming\nGold : 1\nSilver : 2\nBronze : 1', "Mollie O'Callaghan (Swimming)\nAriarne Titmus (Swimming)\nKaylee McKeown (Swimming)\nEmma McKeon (Swimming)"),
      const Model('Netherlands', 'Gold : 8\nSilver : 7\nBronze : 4\nTotal : 19', 19, 'Anna Van Der Breggen\nCycling\nGold : 1\nSilver : 0\nBronze : 1', 'Femke Bol (Athletics)'),
      const Model('Hungary', 'Gold : 8\nSilver : 3\nBronze : 4\nTotal : 15', 15, 'Katinka Hosszu\nSwimming\nGold : 3\nSilver : 1\nBronze : 0', 'Water-polo Men Team'),
      const Model('Brazil', 'Gold : 7\nSilver : 6\nBronze : 6\nTotal : 19', 19, 'Kahena Kunze\nSailing\nGold : 1\nSilver : 0\nBronze : 0', 'Volleyball Men Team\nVolleyball Women Team\nIsaquias Queiroz (Canoeing)'),
      const Model('Spain', 'Gold : 7\nSilver : 4\nBronze : 6\nTotal : 17', 17, 'Saul Craviotto\nCanoeing\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Kenya', 'Gold : 6\nSilver : 6\nBronze : 1\nTotal : 13', 13, 'Vivian Jepkemoi Cheruiyot\nAthletics\nGold : 1\nSilver : 1\nBronze : 0', 'Faith Kipyegon (Athletics)\nMary Moraa (Athletics)'),
      const Model('Jamaica', 'Gold : 6\nSilver : 3\nBronze : 2\nTotal : 11', 11, 'Usain Bolt\nAthletics\nGold : 3\nSilver : 0\nBronze : 0', 'Danielle Williams (Athletics)\nShericka Jackson (Athletics)\nAntonio Watson (Athletics)'),
      const Model('Croatia', 'Gold : 5\nSilver : 3\nBronze : 2\nTotal : 10', 10, 'Martin Sinkovic\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'Handball Men Team'),
      const Model('Cuba', 'Gold : 5\nSilver : 2\nBronze : 4\nTotal : 11', 11, 'Mijain Lopez\nWrestling\nGold : 1\nSilver : 0\nBronze : 0', 'Lazaro Martinez (Athletics)'),
      const Model('New Zealand', 'Gold : 4\nSilver : 9\nBronze : 5\nTotal : 18', 18, 'Lisa Carrington\nCanoeing\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Canada', 'Gold : 4\nSilver : 3\nBronze : 15\nTotal : 22', 22, 'Penny Oleksiak\nSwimming\nGold : 1\nSilver : 1\nBronze : 2', 'Summer McIntosh (Swimming)\nMargaret MacNeil (Swimming)\nCamryn Rogers (Athletics)'),
      const Model('Uzbekistan', 'Gold : 4\nSilver : 2\nBronze : 7\nTotal : 13', 13, 'Shakhobidin Zoirov\nBoxing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Colombia', 'Gold : 3\nSilver : 2\nBronze : 3\nTotal : 8', 8, 'Caterine Ibarguen\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Switzerland', 'Gold : 3\nSilver : 2\nBronze : 2\nTotal : 7', 7, 'Nino Schurter\nCycling\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Iran', 'Gold : 3\nSilver : 1\nBronze : 4\nTotal : 8', 8, 'Sohrab Moradi\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Greece', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6', 6, 'Anna Korakaki\nShooting\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Argentina', 'Gold : 3\nSilver : 1\nBronze : 0\nTotal : 4', 4, 'Juan Lopez\nField Hockey\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Denmark', 'Gold : 2\nSilver : 6\nBronze : 7\nTotal : 15', 15, 'Pernille Blume\nSwimming\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Sweden', 'Gold : 2\nSilver : 6\nBronze : 3\nTotal : 11', 11, 'Sarah Sjoestroem\nSwimming\nGold : 1\nSilver : 1\nBronze : 1', 'Sarah Sjöström (Swimming)\nArmand Duplantis (Athletics)\nDaniel Stahl (Athletics)'),
      const Model('South Africa', 'Gold : 2\nSilver : 6\nBronze : 2\nTotal : 10', 10, 'Wayde Van Niekerk\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Tatjana Schoenmaker (Swimming)'),
      const Model('Kazakhstan', 'Gold : 2\nSilver : 5\nBronze : 10\nTotal : 17', 17, 'Dmitriy Balandin\nSwimming\nGold : 1\nSilver : 0\nBronze : 0', 'Gudaf Tsegay (Athletics)\nAmane Beriso (Athletics)'),
      const Model('Ukraine', 'Gold : 2\nSilver : 5\nBronze : 4\nTotal : 11', 11, 'Oleg Verniaiev\nGymnastics\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Serbia', 'Gold : 2\nSilver : 4\nBronze : 2\nTotal : 8', 8, 'Dusko Pijetlovic\nWater-polo\nGold : 1\nSilver : 0\nBronze : 0', 'Water-polo Mens Team'),
      const Model('Poland', 'Gold : 2\nSilver : 3\nBronze : 6\nTotal : 11', 11, 'Natalia Madaj\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'Anita Włodarczyk (Athletics)'),
      const Model('North Korea', 'Gold : 2\nSilver : 3\nBronze : 2\nTotal : 7', 7, 'Se-Gwang Ri\nGymnastics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Belgium', 'Gold : 2\nSilver : 2\nBronze : 2\nTotal : 6', 6, 'Nafissatou Thiam\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Nafissatou Thiam (Athletics)'),
      const Model('Slovakia', 'Gold : 2\nSilver : 2\nBronze : 0\nTotal : 4', 4, 'Peter Skantar\nCanoe\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Georgia', 'Gold : 2\nSilver : 1\nBronze : 4\nTotal : 7', 7, 'Vladimer Khinchegashvili\nWrestling\nGold : 1\nSilver : 0\nBronze : 0', 'Lasha Talakhadze (Weightlifting)'),
      const Model('Azerbaijan', 'Gold : 1\nSilver : 7\nBronze : 10\nTotal : 18', 18, 'Radik Isaev\nTaekwondo\nGold : 1\nSilver : 0\nBronze : 0', 'Hanna Skydan (Athletics)'),
      const Model('Belarus', 'Gold : 1\nSilver : 4\nBronze : 4\nTotal : 9', 9, 'Uladzislau Hancharou\nGymnastics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Turkey', 'Gold : 1\nSilver : 3\nBronze : 4\nTotal : 8', 8, 'Taha Akgul\nWrestling\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Armenia', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4', 4, 'Artur Aleksanyan\nWrestling\nGold : 1\nSilver : 0\nBronze : 0', 'Artur Aleksanyan (Wrestling)'),
      const Model('Czech Republic', 'Gold : 1\nSilver : 2\nBronze : 7\nTotal : 10', 10, 'Lukas Krpalek\nJudo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Ethiopia', 'Gold : 1\nSilver : 2\nBronze : 5\nTotal : 8', 8, 'Almaz Ayana\nAthletics\nGold : 1\nSilver : 0\nBronze : 1', 'Gudaf Tsegay (Athletics)\nAmane Beriso (Athletics)'),
      const Model('Slovenia', 'Gold : 1\nSilver : 2\nBronze : 1\nTotal : 4', 4, 'Tina Trstenjak\nJudo\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Indonesia', 'Gold : 1\nSilver : 2\nBronze : 0\nTotal : 3', 3, 'Liliyana Natsir\nBadminton\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Romania', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4, 'Ana Maria Popescu\nFencing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Bahrain', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2, 'Ruth Jebet\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Chinese Taipei', 'Gold : 1\nSilver : 0\nBronze : 2\nTotal : 3', 3, 'Shu-Ching Hsu\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Bahamas', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2, 'Shaunae Miller-Uibo\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Steven Gardiner (Athletics)\nShaunae Miller-Uibo (Athletics)'),
      const Model('Fiji', 'Gold : 1\nSilver : 0\nBronze : 0\nTotal : 1', 1, 'Jerry Tuwai\nRugby\nGold : 1\nSilver : 0\nBronze : 0', 'Rugby Sevens Men Team'),
      const Model('Malaysia', 'Gold : 0\nSilver : 4\nBronze : 1\nTotal : 5', 5, 'Peng Soon Chan\nBadminton\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Mexico', 'Gold : 0\nSilver : 3\nBronze : 2\nTotal : 5', 5, 'Maria Guadalupe Gonzalez\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Venezuela', 'Gold : 0\nSilver : 2\nBronze : 1\nTotal : 3', 3, 'Yoel Segundo Finol\nBoxing\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Algeria', 'Gold : 0\nSilver : 2\nBronze : 0\nTotal : 2', 2, 'Taoufik Makhloufi\nAthletics\nGold : 0\nSilver : 2\nBronze : 0', 'None'),
      const Model('Lithuania', 'Gold : 0\nSilver : 1\nBronze : 3\nTotal : 4', 4, 'Mindaugas Griskonis\nRowing\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Bulgaria', 'Gold : 0\nSilver : 1\nBronze : 2\nTotal : 3', 3, 'Mirela Demireva\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('India', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2, 'Pusarla Venkata Sindhu\nBadminton\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Burundi', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Francine Niyonsaba\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Norway', 'Gold : 0\nSilver : 0\nBronze : 4\nTotal : 4', 4, 'Olaf Tufte\nRowing\nGold : 0\nSilver : 0\nBronze : 1', 'Karsten Warholm (Athletics)'),
      const Model('Egypt', 'Gold : 0\nSilver : 0\nBronze : 3\nTotal : 3', 3, 'Mohamed Ihab\nWeightlifting\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Israel', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2, 'yarden Gerbi\nJudo\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Austria', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Tanja Frank\nSailing\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
    ];
    _data2020 = <Model>[
      const Model('United States', 'Gold : 39\nSilver : 41\nBronze : 33\nTotal : 113', 113, 'Caleb Dressel\nSwimming\nGold : 5\nSilver : 0\nBronze : 0', 'Grant Holloway (Athletics)\nRyan Murphy (Swimming)\nKatie Ledecky (Swimming)\nNoah Lyles (Athletics)\nRegan Smith (Swimming)'),
      const Model('China', 'Gold : 38\nSilver : 32\nBronze : 19\nTotal : 89', 89, 'Yufei Zhang\nSwimming\nGold : 2\nSilver : 2\nBronze : 0', 'Sun Yang (Swimming)\nMa Long (Table Tennis)\nWang Chuqin (Table Tennis)\nFan Zhendong (Table Tennis)'),
      const Model('Japan', 'Gold : 27\nSilver : 14\nBronze : 17\nTotal : 58', 58, 'Daiki Hashimoto\nGymnastics\nGold : 2\nSilver : 1\nBronze : 0', 'Shohei Ono (Judo)\nAbe Uta (Judo)\n Haruka Kitaguchi (Athletics)\nYukiko Inui (Swimming)'),
      const Model('United Kingdom', 'Gold : 22\nSilver : 20\nBronze : 22\nTotal : 64', 64, 'James Guy\nSwimming\nGold : 2\nSilver : 1\nBronze : 0', 'Matthew Richards (Swimming)\nJosh Kerr (Athletics)\nAdam Peaty (Swimming)'),
      const Model('ROC', 'Gold : 20\nSilver : 28\nBronze : 23\nTotal : 71', 71, 'Vitalina Batsarashkina\nShooting\nGold : 2\nSilver : 1\nBronze : 0', 'None'),
      const Model('Australia', 'Gold : 17\nSilver : 7\nBronze : 22\nTotal : 46', 46, 'Emma Mckeon\nSwimming\nGold : 4\nSilver : 0\nBronze : 3', "Mollie O'Callaghan (Swimming)\nAriarne Titmus (Swimming)\nKaylee McKeown (Swimming)\nEmma McKeon (Swimming)"),
      const Model('Netherlands', 'Gold : 10\nSilver : 12\nBronze : 14\nTotal : 36', 36, 'Sifan Hassan\nAthletics\nGold : 2\nSilver : 0\nBronze : 1', 'Femke Bol (Athletics)'),
      const Model('France', 'Gold : 10\nSilver : 12\nBronze : 11\nTotal : 33', 33, 'Clarisse Agbegnenou\nJudo\nGold : 2\nSilver : 0\nBronze : 0', 'Léon Marchand (Swimming)\nMaxime Grousset (Swimming)\nTeddy Riner (Judo)\nClarisse Agbegnenou (Judo)'),
      const Model('Germany', 'Gold : 10\nSilver : 11\nBronze : 16\nTotal : 37', 37, 'Jessica Von Bredow-Werndl\nEquestrian Sports\nGold : 2\nSilver : 0\nBronze : 0', 'Florian Wellbrock (Swimming)\nLeonie Beck (Swimming)'),
      const Model('Italy', 'Gold : 10\nSilver : 10\nBronze : 20\nTotal : 40', 40, 'Lamont Marcell Jacobs\nAthletics\nGold : 2\nSilver : 0\nBronze : 0', 'Daniele Garozzo (Fencing)\nGianmarco Tamberi (Athletics)'),
      const Model('Canada', 'Gold : 7\nSilver : 7\nBronze : 10\nTotal : 24', 24, 'Andre De Grasse\nAthletics\nGold : 1\nSilver : 1\nBronze : 1', 'Summer McIntosh (Swimming)\nMargaret MacNeil (Swimming)\nCamryn Rogers (Athletics)'),
      const Model('Brazil', 'Gold : 7\nSilver : 6\nBronze : 8\nTotal : 21', 21, 'Rebeca Andrade\nGymnastics\nGold : 1\nSilver : 1\nBronze : 0', 'Volleyball Men Team\nVolleyball Women Team\nIsaquias Queiroz (Canoeing)'),
      const Model('New Zealand', 'Gold : 7\nSilver : 6\nBronze : 7\nTotal : 20', 20, 'Lisa Carrington\nCanoeing\nGold : 3\nSilver : 0\nBronze : 0', 'None'),
      const Model('Cuba', 'Gold : 7\nSilver : 3\nBronze : 5\nTotal : 15', 15, 'Serguey Torres\nCanoeing\nGold : 1\nSilver : 0\nBronze : 0', 'Lazaro Martinez (Athletics)'),
      const Model('Hungary', 'Gold : 6\nSilver : 7\nBronze : 7\nTotal : 20', 20, 'Tamara Csipes\nCanoeing\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('South Korea', 'Gold : 6\nSilver : 4\nBronze : 10\nTotal : 20', 20, 'San An\nArchery\nGold : 3\nSilver : 0\nBronze : 0', 'An San (Archery)\nOh Sang-uk (Fencing)'),
      const Model('Poland', 'Gold : 4\nSilver : 5\nBronze : 5\nTotal : 14', 14, 'Natalia Kaczmarek\nAthletics\nGold : 1\nSilver : 1\nBronze : 0', 'Anita Włodarczyk (Athletics)'),
      const Model('Czech Republic', 'Gold : 4\nSilver : 4\nBronze : 3\nTotal : 11', 11, 'Katerina Siniakova\nTennis\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Kenya', 'Gold : 4\nSilver : 4\nBronze : 2\nTotal : 10', 10, 'Emmanuel Kipkurui Korir\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Faith Kipyegon (Athletics)\nMary Moraa (Athletics)'),
      const Model('Norway', 'Gold : 4\nSilver : 2\nBronze : 2\nTotal : 8', 8, 'Anders Berntsen\nBeach Volleyball\nGold : 1\nSilver : 0\nBronze : 0', 'Karsten Warholm (Athletics)'),
      const Model('Jamaica', 'Gold : 4\nSilver : 1\nBronze : 4\nTotal : 9', 9, 'Elaine Thompson-Herah\nathletics\nGold : 3\nSilver : 0\nBronze : 0', 'Danielle Williams (Athletics)\nShericka Jackson (Athletics)\nAntonio Watson (Athletics)'),
      const Model('Spain', 'Gold : 3\nSilver : 8\nBronze : 6\nTotal : 17', 17, 'Fatima Galvez\nShooting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Sweden', 'Gold : 3\nSilver : 6\nBronze : 0\nTotal : 9', 9, 'Peder Fredricson\nEquestrian Sports\nGold : 1\nSilver : 1\nBronze : 0', 'Sarah Sjöström (Swimming)\nArmand Duplantis (Athletics)\nDaniel Stahl (Athletics)'),
      const Model('Switzerland', 'Gold : 3\nSilver : 4\nBronze : 6\nTotal : 13', 13, 'Belinda Bencic\nTennis\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Denmark', 'Gold : 3\nSilver : 4\nBronze : 4\nTotal : 11', 11, 'Lasse Norman Hansen\nCycling\nGold : 1\nSilver : 1\nBronze : 0', 'None'),
      const Model('Croatia', 'Gold : 3\nSilver : 3\nBronze : 2\nTotal : 8', 8, 'Matea Jelic\nTaekwondo\nGold : 1\nSilver : 0\nBronze : 0', 'Handball Men Team'),
      const Model('Iran', 'Gold : 3\nSilver : 2\nBronze : 2\nTotal : 7', 7, 'Sajad Ganjzadeh\nKarate\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Serbia', 'Gold : 3\nSilver : 1\nBronze : 5\nTotal : 9', 9, 'Dusan Mandic\nWater-polo\nGold : 1\nSilver : 0\nBronze : 0', 'Water-polo Mens Team'),
      const Model('Belgium', 'Gold : 3\nSilver : 1\nBronze : 3\nTotal : 7', 7, 'Simon Gougnard\nField Hockey\nGold : 1\nSilver : 0\nBronze : 0', 'Nafissatou Thiam (Athletics)'),
      const Model('Bulgaria', 'Gold : 3\nSilver : 1\nBronze : 2\nTotal : 6', 6, 'Ivet Goranova\nKarate\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Slovenia', 'Gold : 3\nSilver : 1\nBronze : 1\nTotal : 5', 5, 'Benjamin Savsek\nCanoeing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Uzbekistan', 'Gold : 3\nSilver : 0\nBronze : 2\nTotal : 5', 5, 'Bakhodir Jalolov\nBoxing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Georgia', 'Gold : 2\nSilver : 5\nBronze : 1\nTotal : 8', 8, 'Lasha Talakhadze\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'Lasha Talakhadze (Weightlifting)'),
      const Model('Chinese Taipei', 'Gold : 2\nSilver : 4\nBronze : 6\nTotal : 12', 12, 'Hsing-Chun Kuo\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Turkey', 'Gold : 2\nSilver : 2\nBronze : 9\nTotal : 13', 13, 'Mete Gazoz\nArchery\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Greece', 'Gold : 2\nSilver : 1\nBronze : 1\nTotal : 4', 4, 'Stefanos Ntouskos\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Ecuador', 'Gold : 2\nSilver : 1\nBronze : 0\nTotal : 3', 3, 'Neisi Patricia Dajomes Barrera\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'Brian Pintado (Athletics)'),
      const Model('Ireland', 'Gold : 2\nSilver : 0\nBronze : 2\nTotal : 4', 4, 'Paul Odonovan\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Qatar', 'Gold : 2\nSilver : 0\nBronze : 1\nTotal : 3', 3, 'Mutaz Essa Barshim\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Bahamas', 'Gold : 2\nSilver : 0\nBronze : 0\nTotal : 2', 2, 'Steven Gardiner\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Steven Gardiner (Athletics)\nShaunae Miller-Uibo (Athletics)'),
      const Model('Ukraine', 'Gold : 1\nSilver : 6\nBronze : 12\nTotal : 19', 19, 'Zhan Beleniuk\nWrestling\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Belarus', 'Gold : 1\nSilver : 3\nBronze : 3\nTotal : 7', 7, 'Ivan Litvinovich\nGymnastics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Romania', 'Gold : 1\nSilver : 3\nBronze : 0\nTotal : 4', 4, 'Ancuta Bodnar\nRowing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('India', 'Gold : 1\nSilver : 2\nBronze : 4\nTotal : 7', 7, 'Neeraj Chopra\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Hong Kong', 'Gold : 1\nSilver : 2\nBronze : 3\nTotal : 6', 6, 'Ka Long Cheung\nFencing\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Philippines', 'Gold : 1\nSilver : 2\nBronze : 1\nTotal : 4', 4, 'Hidilyn Diaz\nWeightlifting\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('South Africa', 'Gold : 1\nSilver : 2\nBronze : 0\nTotal : 3', 3, 'Tatjana Schoenmaker\nSwimming\nGold : 1\nSilver : 1\nBronze : 0', 'Tatjana Schoenmaker (Swimming)'),
      const Model('Austria', 'Gold : 1\nSilver : 1\nBronze : 5\nTotal : 7', 7, 'Anna Kiesenhofer\nCycling\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Egypt', 'Gold : 1\nSilver : 1\nBronze : 4\nTotal : 6', 6, 'Feryal Abdelaziz\nKarate\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Indonesia', 'Gold : 1\nSilver : 1\nBronze : 3\nTotal : 5', 5, 'Greysia Polii\nBadminton\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Ethiopia', 'Gold : 1\nSilver : 1\nBronze : 2\nTotal : 4', 4, 'Selemon Barega\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'Gudaf Tsegay (Athletics)\nAmane Beriso (Athletics)'),
      const Model('Tunisia', 'Gold : 1\nSilver : 1\nBronze : 0\nTotal : 2', 2, 'Ahmed Hafnaoui\nSwimming\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Estonia', 'Gold : 1\nSilver : 0\nBronze : 1\nTotal : 2', 2, 'Katrina Lehis\nFencing\nGold : 1\nSilver : 0\nBronze : 1', 'None'),
      const Model('Bermuda', 'Gold : 1\nSilver : 0\nBronze : 0\nTotal : 1', 1, 'Flora Duffy\nAthletics\nGold : 1\nSilver : 0\nBronze : 0', 'None'),
      const Model('Colombia', 'Gold : 0\nSilver : 4\nBronze : 1\nTotal : 5', 5, 'Anthony Zambrano\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Azerbaijan', 'Gold : 0\nSilver : 3\nBronze : 4\nTotal : 7', 7, 'Rafael Aghayev\nKarate\nGold : 0\nSilver : 1\nBronze : 0', 'Hanna Skydan (Athletics)'),
      const Model('Dominican Republic', 'Gold : 0\nSilver : 3\nBronze : 2\nTotal : 5', 5, 'Marileidy Paulino\nAthletics\nGold : 0\nSilver : 2\nBronze : 0', 'None'),
      const Model('Armenia', 'Gold : 0\nSilver : 2\nBronze : 2\nTotal : 4', 4, 'Simon Martirosyan\nWeightlifting\nGold : 0\nSilver : 1\nBronze : 0', 'Artur Aleksanyan (Wrestling)'),
      const Model('Kyrgyzstan', 'Gold : 0\nSilver : 2\nBronze : 1\nTotal : 3', 3, 'Aisuluu Tynybekova\nWrestling\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Mongolia', 'Gold : 0\nSilver : 1\nBronze : 3\nTotal : 4', 4, 'Saeid Mollaei\nJudo\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Argentina', 'Gold : 0\nSilver : 1\nBronze : 2\nTotal : 3', 3, 'Maria Victoria Granatto\nField Hockey\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Jordan', 'Gold : 0\nSilver : 1\nBronze : 1\nTotal : 2', 2, 'Saleh Elsharabaty\nTaekwondo\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Bahrain', 'Gold : 0\nSilver : 1\nBronze : 0\nTotal : 1', 1, 'Kalkidan Gezahegne\nAthletics\nGold : 0\nSilver : 1\nBronze : 0', 'None'),
      const Model('Kazakhstan', 'Gold : 0\nSilver : 0\nBronze : 8\nTotal : 8', 8, 'Darkhan Assadilov\nKarate\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Mexico', 'Gold : 0\nSilver : 0\nBronze : 4\nTotal : 4', 4, 'Gabriela Belem Agundez Garcia\nDiving\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Finland', 'Gold : 0\nSilver : 0\nBronze : 2\nTotal : 2', 2, 'Mira Potkonen\nBoxing\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
      const Model('Botswana', 'Gold : 0\nSilver : 0\nBronze : 1\nTotal : 1', 1, 'Zibane Ngozi\nAthletics\nGold : 0\nSilver : 0\nBronze : 1', 'None'),
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
        .map<ChartData>((data) => ChartData(data.country, data.palmares, data.totalMedals, data.bestAthlete, data.candidat)) // Modification ici
        .toList()
      ..sort((a, b) => b.totalMedals.compareTo(a.totalMedals));

    setState(() {
      _chartData = tempList.take(25).toList().reversed.toList();
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
                            fontSize: 32,
                            color: Color(0xFF4A2545),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF4A2545)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "Palmares\n${countryData!.palmares}",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF4A2545)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF4A2545)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(children: [
                        Text(
                          "   Most Decorated Athlete   ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF4A2545),
                          ),
                        ),
                        Text(
                          countryData!.bestAthlete,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF4A2545)),
                        ),
                      ]),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF4A2545)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(children: [
                        Text(
                          "   Medal Chances   ",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF4A2545),
                          ),
                        ),
                        Text(
                          countryData!.candidat,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF4A2545)),
                        ),
                      ]),
                    ),
                  ]),
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
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: PhysicalModel(
                      color: const Color(0xFFDCCCA3),
                      borderRadius: BorderRadius.circular(20.0),
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
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                              ),
                              Expanded(
                                flex: 6,
                                child: Container(
                                  alignment: Alignment.center,
                                  child: SfCartesianChart(
                                    title: ChartTitle(
                                      text: 'Top Olympic Medal Countries',
                                      textStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w800),
                                      alignment: ChartAlignment.center,
                                    ),
                                    primaryXAxis: CategoryAxis(
                                      labelStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w800),
                                    ),
                                    primaryYAxis: NumericAxis(
                                      minimum: 0,
                                      maximum: 2700,
                                      interval: 500,
                                      labelStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w800),
                                    ),
                                    series: <CartesianSeries<ChartData, String>>[
                                      BarSeries<ChartData, String>(
                                        dataSource: _chartData,
                                        xValueMapper: (ChartData data, _) => data.country,
                                        yValueMapper: (ChartData data, _) => data.totalMedals,
                                        dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                          labelAlignment: ChartDataLabelAlignment.outer,
                                          textStyle: GoogleFonts.nunito(color: Colors.grey[800], fontWeight: FontWeight.w300),
                                        ),
                                        color: Color(0xFF6d5da7),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(flex: 1, child: Container())
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
  final String bestAthlete;
  final String candidat;

  const Model(this.country, this.palmares, this.totalMedals, this.bestAthlete, this.candidat);

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
  final int totalMedals;
  final String bestAthlete;
  final String candidat;

  ChartData(this.country, this.palmares, this.totalMedals, this.bestAthlete, this.candidat) : super(country, palmares, totalMedals, bestAthlete, candidat);

  @override
  int get total {
    // Extrait la partie 'Total' de la chaîne 'palmares' et convertit en entier
    final totalString = palmares.split('\n').last.split(': ').last;
    return int.tryParse(totalString) ?? 0; // Renvoie 0 si la conversion échoue
  }
}
