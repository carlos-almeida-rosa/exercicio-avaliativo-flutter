class User {
  final String firstName;
  final String lastName;
  final String email;
  final String username;
  final String password;
  final String accessToken;

  const User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.password,
    required this.accessToken,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json['firstName'],
    lastName: json['lastName'],
    email: json['email'],
    username: json['username'],
    password: json['password'],
    accessToken: json['accessToken'],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "username": username,
    "password": password,
    "accessToken": accessToken,
  };
}
