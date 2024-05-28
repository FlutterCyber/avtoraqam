class AuthModel {
  String? username;
  String? password;
  String? phoneModel;

  AuthModel({
    required this.username,
    required this.password,
    required this.phoneModel,
  });

  AuthModel.fromJson(Map<String, dynamic> map)
      : username = map['username'],
        password = map['password'],
        phoneModel = map['phoneModel'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'password': password,
        'phoneModel': phoneModel,
      };
}
