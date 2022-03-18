class UserModel {
  String uid;
  String name;
  String email;
  String userType;

  UserModel(
      {required this.uid,
      required this.email,
      required this.name,
      required this.userType});

  factory UserModel.fromFirestore(Map<String, dynamic> json) => UserModel(
        uid: json["uid"],
        email: json["email"],
        name: json["name"],
        userType: json["userType"],
      );

  Map<String, dynamic> toFirestore() => {
        "uid": uid,
        "email": email,
        "name": name,
        "userType": userType,
      };
}
