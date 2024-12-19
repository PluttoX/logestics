class UserEntity {
  final String uid;
  final String email;
  final String? name;
  final String? photoUrl;

  UserEntity({
    required this.uid,
    required this.email,
    this.name,
    this.photoUrl,
  });

  // Factory constructor to create UserEntity from Firestore data
  factory UserEntity.fromFireStore(Map<String, dynamic> data, String uid, String email) {
    return UserEntity(
      uid: uid,
      email: email,
      name: data['name'] ?? '',
      photoUrl: data['photoUrl'] ?? '',
    );
  }
    @override
    bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UserEntity) return false;
    return uid == other.uid && name == other.name && email == other.email;
    }

    @override
    int get hashCode => uid.hashCode ^ name.hashCode ^ email.hashCode;
  }

