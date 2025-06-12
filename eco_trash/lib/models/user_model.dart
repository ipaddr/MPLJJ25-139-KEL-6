class UserModel {
  final String username;
  final String email;
  final String phone;
  final String address;
  final String role;

  UserModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.address,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['no_hp'] ?? '',
      address: json['alamat'] ?? '',
      role: json['role'] ?? 'nasabah',
    );
  }
}
