import 'dart:ui';
import 'package:cardspace/Cards/cCard.dart';
import 'package:hive/hive.dart';

part 'card.g.dart';
@HiveType(typeId: 9)
class card extends HiveObject {
  @HiveField(0)
  int bgType;
  @HiveField(1)
  String cardNetworkType;
  @HiveField(2)
  String company;
  @HiveField(3)
  String cardHolderName;
  @HiveField(4)
  String cardNumber;
  @HiveField(5)
  int validityToMonth;
  @HiveField(6)
  int validityToYear;
  @HiveField(7)
  int validityFromMonth;
  @HiveField(8)
  int validityFromYear;
  @HiveField(9)
  String cvvCode;
  @HiveField(10)
  String solid;
  @HiveField(11)
  List<String> gradient;
  @HiveField(12)
  String path;
  card({
    this.bgType,
    this.solid,
    this.gradient,
    this.path,
    this.cardNetworkType,
    this.company,
    this.cardHolderName,
    this.cardNumber,
    this.validityFromMonth,
    this.validityFromYear,
    this.validityToMonth,
    this.validityToYear,
    this.cvvCode,
  });
}
