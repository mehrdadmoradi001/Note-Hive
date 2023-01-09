
import 'package:hive/hive.dart';

part 'animals.g.dart';

@HiveType(typeId: 3)
class Animals {
  Animals(
      {required this.numSpecies,
      required this.numAnySpecies,
      required this.nameSpecies});

  @HiveField(0)
  String nameSpecies;

  @HiveField(1)
  int numSpecies;

  @HiveField(2)
  double numAnySpecies;
}
