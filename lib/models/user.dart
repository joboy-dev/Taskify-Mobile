class User {
  String firstName;
  String lastName;
  String email;
  String password;
  String profilePicture;
  bool emailVerified;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.emailVerified,
  });
}