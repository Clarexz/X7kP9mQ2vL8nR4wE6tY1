import 'package:equatable/equatable.dart';

enum WeightUnit { kg, lb }
enum DistanceUnit { meters, kilometers, feet, miles }

class UserProfile extends Equatable {
  final String id;
  final String name;
  final String? email;
  final String? photoUrl;
  final WeightUnit weightUnit;
  final DistanceUnit distanceUnit;
  final DateTime joinDate;
  final DateTime lastActiveDate;
  final bool isPremium;
  final DateTime? premiumExpiryDate;

  const UserProfile({
    required this.id,
    required this.name,
    this.email,
    this.photoUrl,
    this.weightUnit = WeightUnit.kg,
    this.distanceUnit = DistanceUnit.meters,
    required this.joinDate,
    required this.lastActiveDate,
    this.isPremium = false,
    this.premiumExpiryDate,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        photoUrl,
        weightUnit,
        distanceUnit,
        joinDate,
        lastActiveDate,
        isPremium,
        premiumExpiryDate,
      ];

  UserProfile copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    WeightUnit? weightUnit,
    DistanceUnit? distanceUnit,
    DateTime? joinDate,
    DateTime? lastActiveDate,
    bool? isPremium,
    DateTime? premiumExpiryDate,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      weightUnit: weightUnit ?? this.weightUnit,
      distanceUnit: distanceUnit ?? this.distanceUnit,
      joinDate: joinDate ?? this.joinDate,
      lastActiveDate: lastActiveDate ?? this.lastActiveDate,
      isPremium: isPremium ?? this.isPremium,
      premiumExpiryDate: premiumExpiryDate ?? this.premiumExpiryDate,
    );
  }
}