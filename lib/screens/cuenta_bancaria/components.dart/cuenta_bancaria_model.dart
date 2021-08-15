import 'package:zionapp/models/tipo_banco.dart';
import 'package:zionapp/models/tipo_cuenta.dart';

class BankAccount{
  int id;
  String ownerName;
  String identityNumber;
  String numberAccount;
  String status;
  String bankType;
  String accountType;

  BankAccount({
    this.id,
    this.ownerName,
    this.identityNumber,
    this.numberAccount,
    this.status
  });

  void setTypes(int financialEntityId, int bankAccountTypeId){
    switch (financialEntityId) {
      case 1:
        bankType = 'Banco del Pacífico';
        break;
      case 3:
        bankType = 'Banco de Guayaquil';
        break;
      case 5:
        bankType = 'Produbanco';
        break;
      default:
        bankType = null;
    }
    switch (bankAccountTypeId) {
      case 1:
        accountType = 'Cuenta de Ahorro';
        break;
      case 2:
        accountType = 'Cuenta Corriente';
        break;
      default:
        accountType = null;
    }
  }

  @override
  String toString(){
    return "id = $id, name = $ownerName, Id number = $identityNumber, Account number = $numberAccount, Status = $status, Bank Type = $bankType, Account Type = $accountType";
  }
}