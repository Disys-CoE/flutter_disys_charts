import 'package:flutter/material.dart';

typedef MissingValueBuilder = double Function(DateTime value);

///This Disys line is used to display your data
class DisysLine {
  ///Line color for each data point
  final Color lineColor;

  ///Color for the dot fill on each data point
  final Color dataPointFillColor;

  ///Color for the dot stroke on each data point
  final Color dataPointStrokeColor;

  ///`width` of the disys line
  final double lineStrokeWidth;

  ///List of data points used to build the disys line
  final List<DataPoint>? data;

  ///This builder is only valid for `disysChartScale` of date types
  ///It uses the double value returned by the function based on the current `DateTime` received as parameter
  final MissingValueBuilder? onMissingValue;

  ///Label used in the bubble info indicator
  final String label;

  const DisysLine({
    this.lineColor = Colors.white,
    this.lineStrokeWidth = 3.0,
    this.label = "",
    this.onMissingValue,
    Color? dataPointFillColor,
    Color? dataPointStrokeColor,
    this.data,
  })  : this.dataPointFillColor = dataPointFillColor ?? lineColor,
        this.dataPointStrokeColor = dataPointStrokeColor ?? lineColor;

  factory DisysLine.copy({required DisysLine disysLine}) {
    return DisysLine(
      lineColor: disysLine.lineColor,
      lineStrokeWidth: disysLine.lineStrokeWidth,
      label: disysLine.label,
      dataPointFillColor: disysLine.dataPointFillColor,
      dataPointStrokeColor: disysLine.dataPointStrokeColor,
      onMissingValue: disysLine.onMissingValue,
      data: disysLine.data,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisysLine &&
          runtimeType == other.runtimeType &&
          label == other.label &&
          lineColor == other.lineColor &&
          lineStrokeWidth == other.lineStrokeWidth &&
          dataPointFillColor == other.dataPointFillColor &&
          dataPointStrokeColor == other.dataPointStrokeColor &&
          hashCode == other.hashCode;

  @override
  int get hashCode => data!
      .map((val) => val.value.toString())
      .reduce((val1, val2) => "$val1$val2")
      .hashCode;
}

///This class represent each value `Y` per `X` axis
class DataPoint<T> {
  ///The value `Y`
  final double value;

  ///The `X` Axis value, it supports `double` and `DateTime` for now
  final T xAxis;

  const DataPoint({
    required this.value,
    required this.xAxis,
  });

  String toString() => "value: $value, xAxis: $xAxis";
}
