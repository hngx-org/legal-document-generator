class SignUpModel {
  final String name;
  final String email;
  final String id;

  SignUpModel({
    required this.name,
    required this.email,
    required this.id,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      name: json['name'],
      email: json['email'],
      id: json['id'],
    );
  }
}
