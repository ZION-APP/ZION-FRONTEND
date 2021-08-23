import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:zionapp/components/button_default.dart';
import 'package:zionapp/components/cargando.dart';
import 'package:zionapp/constants_config.dart';
import 'package:zionapp/screens/cuenta_bancaria/components.dart/cuenta_bancaria_model.dart';
import 'package:zionapp/screens/cuenta_bancaria/cuenta_bancaria.dart';
import 'package:zionapp/size_config.dart';

import 'components.dart/cuenta_bancaria_box.dart';

class BankAccountList extends StatefulWidget {
  const BankAccountList({Key key}) : super(key: key);

  @override
  _BankAccountListState createState() => _BankAccountListState();
}

class _BankAccountListState extends State<BankAccountList> {
  bool loading = true;
  List<BankAccount> bankAccounts = [];

  Future<void> getBankAccountList() async {
    try {
      final String token = await storage.read(key: 'token');
      final Response response = await dioClient.get('$kapiUrl/bank_accounts/me',
          options: Options(headers: {'Authorization': token}));
      debugPrint(response.data.toString());
      for (final res in response.data) {
        final BankAccount bankAccount = BankAccount(
          id: res['id'] as int,
          ownerName: res['owner_name'].toString(),
          identityNumber: res['identity_number'] as String,
          numberAccount: res['number_account'] as String,
          status: res['status'] as String,
        );
        bankAccount.setTypes(res['financial_entity_id'] as int,
            res['bank_account_type_id'] as int);
        setState(() {
          if (res['status'] == 'active') {
            bankAccounts.add(bankAccount);
          }
        });
      }
      debugPrint(bankAccounts.toString());
      setState(() {
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getAccountByID(int accountId) async {
    try {
      final Response res = await dioClient.get(
        '$kapiUrl/bank_accounts/me/$accountId',
      );
      debugPrint(res.data.toString());
      final BankAccount bankAccount = BankAccount(
        id: res.data['id'] as int,
        ownerName: res.data['owner_name'].toString(),
        identityNumber: res.data['identity_number'] as String,
        numberAccount: res.data['number_account'] as String,
        status: res.data['status'] as String,
      );
      bankAccount.setTypes(res.data['financial_entity_id'] as int,
          res.data['bank_account_type_id'] as int);
      setState(() {
        bankAccounts.add(bankAccount);
      });
      setState(() {
        loading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    getBankAccountList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: kPrimaryLightColor,
          ),
          title: const Text(
            'Cuenta Bancaria',
            style: TextStyle(color: kPrimaryLightColor),
          ),
          centerTitle: true,
          backgroundColor: kSecondaryColor,
        ),
        body: SizedBox(
            child: !loading
                ? CustomScrollView(slivers: [
                    SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          children: generateBankAccountList(),
                        ))
                  ])
                : Cargando()));
  }

  List<Widget> generateBankAccountList() {
    final List<Widget> result = [];
    for (final bankAccount in bankAccounts) {
      result.add(SizedBox(height: getProportionateScreenHeight(30)));
      result.add(Container(
          decoration: BoxDecoration(
              border: Border.all(color: kSecondaryColor, width: 3),
              borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
              width: getProportionateScreenWidth(320),
              child: Column(
                children: [
                  BankAccountBox(
                      numberAccount: bankAccount.numberAccount,
                      bankType: bankAccount.bankType,
                      accountType: bankAccount.accountType),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(20)),
                    child: DefaultButton(
                      func: () async {
                        final int result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CuentaBancaria(
                                      isUpdateForm: true,
                                      bankAccountId: bankAccount.id,
                                    )));
                        debugPrint(result.toString());
                        try {
                          setState(() {
                            bankAccounts = [];
                          });
                          await getBankAccountList();
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      label: "Actualizar Cuenta",
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(20)),
                    child: DefaultButton(
                      func: () async {
                        await removeBankAccount(bankAccount);
                        try {
                          setState(() {
                            bankAccounts = [];
                          });
                          await getBankAccountList();
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      colorFondo: Colors.red,
                      label: "Eliminar Cuenta",
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                ],
              ))));
    }
    result.add(SizedBox(height: getProportionateScreenHeight(50)));
    result.add(
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: getProportionateScreenHeight(30)),
        child: DefaultButton(
          func: () async {
            final int result = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CuentaBancaria(
                          isUpdateForm: false,
                        )));
            debugPrint(result.toString());
            try {
              await getAccountByID(result);
            } catch (e) {
              debugPrint(e.toString());
            }
          },
          label: "Registrar nueva cuenta",
        ),
      ),
    );
    return result;
  }

  Future<void> removeBankAccount(BankAccount bankAccount) async {
    final String token = await storage.read(key: 'token');
    try {
      // ignore: unused_local_variable
      final response = await dioClient.put(
          '$kapiUrl/bank_accounts/me/${bankAccount.id}',
          options: Options(headers: {'Authorization': token}),
          data: {
            'owner_name': bankAccount.ownerName,
            'identity_number': bankAccount.identityNumber,
            'number_account': bankAccount.numberAccount,
            'financial_entity_id': bankAccount.getBankTypeId(),
            'bank_account_type_id': bankAccount.getAccountTypeId(),
            'status': 'inactive'
          });
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
