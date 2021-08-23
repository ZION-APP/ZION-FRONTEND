class Goal {
  int id;
  String name;
  num initAmount;
  num targetAmount;
  num monthlyAmount;
  num currentAmount;
  String targetDate;
  String status;
  String tipoFondo;

  Goal(
      {this.id,
      this.name,
      this.initAmount,
      this.targetAmount,
      this.monthlyAmount,
      this.currentAmount,
      this.targetDate,
      this.status});

  void setTipoFondo(int id) {
    if (id == 1) {
      tipoFondo = 'Omega';
    } else {
      tipoFondo = 'Alpha';
    }
  }

  @override
  String toString() {
    return "id = $id, name = $name, Initial Amount = $initAmount, Target Amount = $targetAmount, Monthly Amount = $monthlyAmount, Current Amount = $currentAmount, Target Date = $targetDate, Status = $status";
  }
}
