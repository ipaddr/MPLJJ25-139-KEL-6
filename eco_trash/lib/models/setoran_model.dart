class SetoranModel {
  final int id;
  final String namaNasabah;
  final double jumlahSampah;
  final String kategori;
  final int poin;

  SetoranModel({
    required this.id,
    required this.namaNasabah,
    required this.jumlahSampah,
    required this.kategori,
    required this.poin,
  });

  factory SetoranModel.fromJson(Map<String, dynamic> json) {
    return SetoranModel(
      id: json['id'],
      namaNasabah: json['nama_nasabah'],
      jumlahSampah: json['jumlah_sampah']?.toDouble() ?? 0.0,
      kategori: json['kategori'],
      poin: json['poin'],
    );
  }
}
