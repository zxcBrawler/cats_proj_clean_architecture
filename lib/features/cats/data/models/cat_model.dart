import 'package:cats_ca/features/cats/domain/entities/cat_entity.dart';

class CatModel extends CatEntity {
  const CatModel(
      {String? length,
      String? origin,
      String? imageLink,
      int? familyFriendly,
      int? shedding,
      int? generalHealth,
      int? playfulness,
      int? childrenFriendly,
      int? grooming,
      int? intelligence,
      int? otherPetsFriendly,
      int? minWeight,
      int? maxWeight,
      int? minLifeExpectancy,
      int? maxLifeExpectancy,
      String? name})
      : super(
          length: length,
          origin: origin,
          imageLink: imageLink,
          familyFriendly: familyFriendly,
          shedding: shedding,
          generalHealth: generalHealth,
          playfulness: playfulness,
          childrenFriendly: childrenFriendly,
          grooming: grooming,
          intelligence: intelligence,
          otherPetsFriendly: otherPetsFriendly,
          minWeight: minWeight,
          maxWeight: maxWeight,
          minLifeExpectancy: minLifeExpectancy,
          maxLifeExpectancy: maxLifeExpectancy,
          name: name,
        );

  factory CatModel.fromJson(Map<String, dynamic> map) {
    return CatModel(
      length: map["length"] ?? "",
      origin: map["origin"] ?? "",
      imageLink: map['image_link'] != null && map['image_link'] != ""
          ? map['image_link']
          : null,
      familyFriendly: map["family_friendly"] ?? -1,
      shedding: map["shedding"] ?? -1,
      generalHealth: map["general_health"] ?? -1,
      playfulness: map["playfulness"] ?? -1,
      childrenFriendly: map["children_friendly"] ?? -1,
      grooming: map["grooming"] ?? -1,
      intelligence: map["intelligence"] ?? -1,
      otherPetsFriendly: map["other_pets_friendly"] ?? -1,
      minWeight: map["min_weight"] ?? -1,
      maxWeight: map["max_weight"] ?? -1,
      minLifeExpectancy: map["min_life_expectancy"] ?? -1,
      maxLifeExpectancy: map["max_life_expectancy"] ?? -1,
      name: map["name"] ?? "",
    );
  }

  factory CatModel.fromEntity(CatEntity catEntity) {
    return CatModel(
      length: catEntity.length,
      origin: catEntity.origin,
      imageLink: catEntity.imageLink,
      familyFriendly: catEntity.familyFriendly,
      shedding: catEntity.shedding,
      generalHealth: catEntity.generalHealth,
      playfulness: catEntity.playfulness,
      childrenFriendly: catEntity.childrenFriendly,
      grooming: catEntity.grooming,
      intelligence: catEntity.intelligence,
      otherPetsFriendly: catEntity.otherPetsFriendly,
      minWeight: catEntity.minWeight,
      maxWeight: catEntity.maxWeight,
      minLifeExpectancy: catEntity.minLifeExpectancy,
      maxLifeExpectancy: catEntity.maxLifeExpectancy,
      name: catEntity.name,
    );
  }
}
