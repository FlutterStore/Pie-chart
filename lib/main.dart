// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math' as math;

enum LegendShape { circle, rectangle }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Pie_charts(),
    );
  }
}

class Pie_charts extends StatefulWidget {
  const Pie_charts({super.key});

  @override
  State<Pie_charts> createState() => _Pie_chartsState();
}

class _Pie_chartsState extends State<Pie_charts> {


  final dataMap = <String, double>{
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  final legendLabels = <String, String>{
    "Flutter": "Flutter legend",
    "React": "React legend",
    "Xamarin": "Xamarin legend",
    "Ionic": "Ionic legend",
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  bool _showGradientColors = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Pie Chart",style: TextStyle(fontSize: 15),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: PieChart(
                  dataMap: dataMap,
                  animationDuration: const Duration(milliseconds: 800),
                  colorList: colorList,
                  initialAngleInDegree: 0,
                  chartRadius: 150,
                  legendLabels: legendLabels,
                  chartType: ChartType.ring,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValues: false,
                  ),
                  ringStrokeWidth: 40,
                  emptyColor: Colors.grey,
                  gradientList: _showGradientColors ? gradientList : null,
                  emptyColorGradient: const [
                    Color(0xff6c5ce7),
                    Colors.blue,
                  ],
                  baseChartColor: Colors.transparent,
                ),
              ),
              const SizedBox(height: 15,),
              SwitchListTile(
                activeColor: Colors.green,
                value: _showGradientColors,
                title: const Text("Show Gradient Colors"),
                onChanged: (val) {
                  setState(() {
                    _showGradientColors = val;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}