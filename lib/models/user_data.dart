class User {
  final String name;
  final int age;
  final String email;
  final String password;
  final String phoneNumber;
  final String profilePic;

  const User({
    required this.name,
    required this.age,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.profilePic,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'profilePic': profilePic
    };
  }

  @override
  String toString() {
    return 'User{name: $name, age: $age, email: $email, password: $password, phoneNumber: $phoneNumber, profilePic: $profilePic';
  }
}
