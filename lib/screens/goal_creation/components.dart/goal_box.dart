import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

// ignore: must_be_immutable
class GoalBox extends StatefulWidget {
  int idMeta;
  String nombreMeta;
  num montoActual;
  num metaTotal;
  String tipoFondo;

  GoalBox(
      {@required this.idMeta,
      @required this.nombreMeta,
      @required this.montoActual,
      @required this.metaTotal,
      @required this.tipoFondo});

  @override
  _GoalBoxState createState() => _GoalBoxState();
}

class _GoalBoxState extends State<GoalBox> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: const Color(0xFFF3CF7A),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(25)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.nombreMeta,
                    style: const TextStyle(
                      color: kSecondaryColor,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(15))
            ],
          ),
        ),
        entryCard(
            "Recaudado:", '\$${widget.montoActual} de \$${widget.metaTotal}'),
        entryCard("Tipo de fondo:", widget.tipoFondo),
        SizedBox(height: getProportionateScreenHeight(30)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // ignore: prefer_interpolation_to_compose_strings
                ((widget.montoActual / widget.metaTotal) * 100)
                        .toInt()
                        .toString() +
                    '%',
                style: const TextStyle(
                  color: kSecondaryColor,
                  fontSize: 19,
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(40),
                width: getProportionateScreenWidth(250),
                child: CustomPaint(
                  foregroundPainter: GoalProgressPainter(
                      total: widget.metaTotal.toInt(),
                      actual: widget.montoActual.toInt()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding entryCard(String titulo, String descripcion) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(10),
          horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: kSecondaryColor,
              fontSize: 19,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  descripcion,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 19,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class GoalProgressPainter extends CustomPainter {
  int total;
  int actual;

  GoalProgressPainter({this.total, this.actual});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    paint.color = Colors.blueGrey;

    canvas.drawLine(Offset(size.width * (1 / total), size.height * 1 / 2),
        Offset(size.width * (actual / total), size.height * 1 / 2), paint);

    paint.color = Colors.grey[300];

    canvas.drawLine(Offset(size.width * (actual / total), size.height * 1 / 2),
        Offset(size.width, size.height * 1 / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
