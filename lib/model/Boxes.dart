import 'package:cardspace/Cards/cCard.dart';
import 'package:hive/hive.dart';

import 'card.dart';


class Boxes{
  static Box<card>getCards()=>
      Hive.box<card>('cards');
}