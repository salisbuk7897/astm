import 'package:flutter/material.dart';
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:draw_graph/models/feature.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  final List<Feature> features = [
    Feature(
      title: "Swift",
      color: Colors.green,
      data: [0.5, 0.6, 100, 0.5, 0.8, 1,4],
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: LineGraph(
            features: features,
            size: Size(420, 450),
            labelX: ['Day 1', 'Day 2', 'Day 3', 'Day 4', 'Day 5', 'Day 6'],
            labelY: ['2.5%', '5.0%', '7.5%', '10.0%'],
            showDescription: true,
            graphColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}
