import 'package:hive/hive.dart';

import 'card.dart';

class Boxes {
  static Box<card> getCreditCards() => Hive.box<card>('CreditCards');
  static Box<card> getDebitCards() => Hive.box<card>('DebitCards');
}
