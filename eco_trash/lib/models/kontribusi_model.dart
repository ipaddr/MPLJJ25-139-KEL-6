class Kontribusi {
  final String jenis;
  final int berat;

  Kontribusi({
    required this.jenis,
    required this.berat,
  });

  // Fungsi untuk membuat objek Kontribusi dari JSON
  factory Kontribusi.fromJson(Map<String, dynamic> json) {
    return Kontribusi(
      jenis: json['jenis'] ?? '',
      berat: json['berat'] ?? 0,
    );
  }

  // Fungsi untuk mengonversi objek Kontribusi ke dalam bentuk JSON
  Map<String, dynamic> toJson() {
    return {
      'jenis': jenis,
      'berat': berat,
    };
  }
}
