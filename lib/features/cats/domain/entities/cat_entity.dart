import 'package:equatable/equatable.dart';

class CatEntity extends Equatable {
  final String? length; // Basically cat size
  final String? origin; // Where cat breed is from
  final String? imageLink; // Cat image
  final int?
      familyFriendly; // How affectionate the cat is to family. Possible values: 1, 2, 3, 4, 5, where 1 indicates minimal affection and 5 indicates maximum affection.
  final int?
      shedding; //  How much hair the cat sheds. Possible values: 1, 2, 3, 4, 5, where 1 indicates no shedding and 5 indicates maximum shedding.
  final int?
      generalHealth; // Health condition from 1 to 5, where 1 - poor health, 5 - best
  final int?
      playfulness; // How playful the cat is. Possible values: 1, 2, 3, 4, 5, where 1 indicates serious and stern and 5 indicates maximum playfulness.
  final int?
      childrenFriendly; //  How well the cat gets along with children. Possible values: 1, 2, 3, 4, 5, where 1 indicates the cat does not get along well with kids and 5 indicates the cat is very kid-friendly.
  final int?
      grooming; //  How much work is required to properly groom the cat. Possible values: 1, 2, 3, 4, 5, where 1 indicates maximum grooming effort and 5 indicates minimum grooming effort.
  final int?
      intelligence; // How inteliggent this breed is from 1 to 5, where 1 - silly, 5 - Albert Einshtein
  final int?
      otherPetsFriendly; // How well the cat gets along with other pets in the household (for example, dogs). Possible values: 1, 2, 3, 4, 5, where 1 indicates the cat isn't very friendly to other pets and 5 indicates the cat gets along very well with other pets
  final double? minWeight; // minimum weight in pounds.
  final double? maxWeight; // maximum weight in pounds.
  final double? minLifeExpectancy; //  minimum life expectancy in years.
  final double? maxLifeExpectancy; // maximum life expectancy in years.
  final String? name; //  the name of cat breed.

  const CatEntity(
      {this.length,
      this.origin,
      this.imageLink,
      this.familyFriendly,
      this.shedding,
      this.generalHealth,
      this.playfulness,
      this.childrenFriendly,
      this.grooming,
      this.intelligence,
      this.otherPetsFriendly,
      this.minWeight,
      this.maxWeight,
      this.minLifeExpectancy,
      this.maxLifeExpectancy,
      this.name});

  @override
  List<Object?> get props {
    return [
      length,
      origin,
      imageLink,
      familyFriendly,
      shedding,
      generalHealth,
      playfulness,
      childrenFriendly,
      grooming,
      intelligence,
      otherPetsFriendly,
      minWeight,
      maxWeight,
      minLifeExpectancy,
      maxLifeExpectancy,
      name
    ];
  }
}
