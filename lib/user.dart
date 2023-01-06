class UserModel {
  static List<User> users = [];
}

class User {
  final int id;
  final String first_name, last_name, email, gender;

  User(
      {required this.id,
      required this.first_name,
      required this.last_name,
      required this.email,
      required this.gender});
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map["id"],
      first_name: map["first_name"],
      last_name: map["last_name"],
      gender: map["gender"],
      email: map["email"],
    );
  }
  toMap() => {
        "id": id,
        "first_name": first_name,
        "last_name": last_name,
        "gender": gender,
        "email": email,
      };
}
