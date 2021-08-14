import 'dart:ffi';

class Goal{
  String name;
  Float initAmount;
  Float targetAmount;
  Float monthlyAmount;
  Float currentAmount;
  String targetDate;
  String status;

  Goal({
    this.name,
    this.initAmount,
    this.targetAmount,
    this.monthlyAmount,
    this.currentAmount,
    this.targetDate,
    this.status
  });
}