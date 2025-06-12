class Penukaran {
  final String poin;
  final String jenis;
  final String tanggal;

  Penukaran({
    required this.poin,
    required this.jenis,
    required this.tanggal,
  });

  // Fungsi untuk membuat objek Penukaran dari JSON
  factory Penukaran.fromJson(Map<String, dynamic> json) {
    return Penukaran(
      poin: json['poin'] ?? '',
      jenis: json['jenis'] ?? '',
      tanggal: json['tanggal'] ?? '',
    );
  }

  // Fungsi untuk mengonversi objek Penukaran ke dalam bentuk JSON
  Map<String, dynamic> toJson() {
    return {
      'poin': poin,
      'jenis': jenis,
      'tanggal': tanggal,
    };
  }
}
