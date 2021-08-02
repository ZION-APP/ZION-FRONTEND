import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

class GraficoInversores extends StatelessWidget {
  final String tipo;
  GraficoInversores(this.tipo, {Key key}) : super(key: key);
  final List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', -28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: getProportionateScreenWidth(4), color: kSecondaryColor)),
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.08,
            decoration: const BoxDecoration(color: kSecondaryColor),
            child: Center(
              child: Text(
                "Rendimiento fondo inversiones Omega",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: getProportionateScreenHeight(15),
                    color: kPrimaryLightColor),
              ),
            ),
          ),
          SfSparkBarChart.custom(
            axisCrossesAt: 10,
            xValueMapper: (int index) => data[index].year,
            yValueMapper: (int index) => data[index].sales,
            dataCount: 5,
            color: kPrimaryColor,
            labelDisplayMode: SparkChartLabelDisplayMode.all,
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
