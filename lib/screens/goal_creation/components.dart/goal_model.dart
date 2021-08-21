
class Goal{
  int id;
  String name;
  int initAmount;
  int targetAmount;
  double monthlyAmount;
  int currentAmount;
  String targetDate;
  String status;

  Goal({
    this.id,
    this.name,
    this.initAmount,
    this.targetAmount,
    this.monthlyAmount,
    this.currentAmount,
    this.targetDate,
    this.status
  });

  @override
  String toString(){
    return "id = $id, name = $name, Initial Amount = $initAmount, Target Amount = $targetAmount, Monthly Amount = $monthlyAmount, Current Amount = $currentAmount, Target Date = $targetDate, Status = $status";
  }
}