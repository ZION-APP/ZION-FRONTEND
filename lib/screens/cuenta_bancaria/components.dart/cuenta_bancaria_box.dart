import 'package:flutter/material.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/size_config.dart';

// ignore: must_be_immutable
class BankAccountBox extends StatefulWidget {
  String numberAccount;
  String bankType;
  String accountType;

  BankAccountBox({
      @required this.numberAccount,
      @required this.bankType,
      @required this.accountType});

  @override
  _BankAccountBoxState createState() => _BankAccountBoxState();
}

class _BankAccountBoxState extends State<BankAccountBox> {

  @override
  Widget build(BuildContext context) {
    return Column(
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
                          'Cuenta',
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
                          widget.numberAccount.substring(0,3) + '*'*(widget.numberAccount.length - 4) + widget.numberAccount.substring(widget.numberAccount.length - 1),
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
                      'Tipo de banco',
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
                      widget.bankType,
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
                      'Tipo de cuenta',
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
                      widget.accountType,
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
        SizedBox(height: getProportionateScreenHeight(10)),
      ],
    );
  }
}