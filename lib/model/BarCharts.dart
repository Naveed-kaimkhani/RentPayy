import 'package:charts_flutter/flutter.dart' as charts ;
class BarCharts{
  String label;
  int value;
  final charts.Color color;

BarCharts({
  required this.label,
  required this.value,
  required this.color,
});
}