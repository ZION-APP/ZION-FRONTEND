class BankAccount {
  int id;
  String ownerName;
  String identityNumber;
  String numberAccount;
  String status;
  String bankType;
  String accountType;

  BankAccount(
      {this.id,
      this.ownerName,
      this.identityNumber,
      this.numberAccount,
      this.status});

  void setTypes(int financialEntityId, int bankAccountTypeId) {
    switch (financialEntityId) {
      case 3:
        bankType = 'Banco del Pacífico';
        break;
      case 2:
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

  int getBankTypeId() {
    // ignore: unnecessary_this
    switch (this.bankType) {
      case 'Banco del Pacífico':
        return 3;
      case 'Banco de Guayaquil':
        return 2;
      case 'Produbanco':
        return 5;
      default:
        return null;
    }
  }

  int getAccountTypeId() {
    // ignore: unnecessary_this
    switch (this.accountType) {
      case 'Cuenta de Ahorro':
        return 1;
      case 'Cuenta Corriente':
        return 2;
      default:
        return null;
    }
  }

  @override
  String toString() {
    return "id = $id, name = $ownerName, Id number = $identityNumber, Account number = $numberAccount, Status = $status, Bank Type = $bankType, Account Type = $accountType";
  }
}
