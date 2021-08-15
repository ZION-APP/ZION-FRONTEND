import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/routes/router.gr.dart';
import 'package:zionapp/size_config.dart';

// ignore: must_be_immutable
class GoalBox extends StatefulWidget {
  int idMeta;
  String nombreMeta;
  double montoActual;
  double metaTotal;

  GoalBox(
      {@required this.idMeta,
      @required this.nombreMeta,
      @required this.montoActual,
      @required this.metaTotal});

  @override
  _GoalBoxState createState() => _GoalBoxState();
}

class _GoalBoxState extends State<GoalBox> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor, width: 3),
        borderRadius: BorderRadius.circular(10)
      ),
      child: SizedBox(
        width: getProportionateScreenWidth(320),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[300])
                )
              ),
              child: SizedBox(
                width: getProportionateScreenWidth(280),
                child: Column(
                  children: [
                    SizedBox(height: getProportionateScreenHeight(25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Expanded(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              'Meta',
                              style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              widget.nombreMeta,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 25,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(15))
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: getProportionateScreenWidth(20)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getProportionateScreenHeight(25)),
                      const FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          'Recaudado',
                          style: TextStyle(
                            color: kSecondaryColor,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ]
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10)),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: getProportionateScreenHeight(25)),
                       FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '${widget.montoActual} de ${widget.metaTotal}',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 19,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                SizedBox(width: getProportionateScreenWidth(50)),
                SizedBox(
                  height: getProportionateScreenHeight(40),
                  width: getProportionateScreenWidth(150),
                  child: CustomPaint(
                    foregroundPainter: GoalProgressPainter(
                      total: widget.metaTotal,
                      actual: widget.montoActual
                    ),
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(50)),
                Text(
                  // ignore: prefer_interpolation_to_compose_strings
                  ((widget.montoActual/widget.metaTotal)*100).toString() + '%',
                  style: const TextStyle(
                    color: kSecondaryColor,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(30)),
              child: DefaultButton(
                func: () => {AutoRouter.of(context).push(GoalSimulationRoute(goalId: widget.idMeta))},
                label: "Más Información",
                colorFondo: kPrimaryColor,
                colorTexto: kSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GoalProgressPainter extends CustomPainter{
  double total;
  double actual;

  GoalProgressPainter(
    {
      this.total,
      this.actual
    }
  );

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..strokeWidth=3..strokeCap=StrokeCap.round;
    paint.color = Colors.blueGrey;

    canvas.drawLine(
      Offset(size.width * (1/total), size.height * 1/2),
      Offset(size.width * (actual/total), size.height * 1/2),
      paint
    );

    paint.color = Colors.grey[300];

    canvas.drawLine(
      Offset(size.width * (actual/total), size.height * 1/2),
      Offset(size.width , size.height * 1/2),
      paint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}