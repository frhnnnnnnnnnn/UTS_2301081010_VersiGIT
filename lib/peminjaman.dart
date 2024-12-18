class Peminjaman {
  String kode;
  String nama;
  String kodePeminjaman;
  DateTime tanggal;
  String kodeNasabah;
  String namaNasabah;
  double jumlahPinjaman;
  int lamaPinjaman;
  double bunga;

  Peminjaman({
    required this.kode,
    required this.nama,
    required this.kodePeminjaman,
    required this.tanggal,
    required this.kodeNasabah,
    required this.namaNasabah,
    required this.jumlahPinjaman,
    required this.lamaPinjaman,
    required this.bunga,
  });

  double get angsuranPokok => jumlahPinjaman / lamaPinjaman;

  double get bungaPerBulan => (bunga / 100) * jumlahPinjaman;

  double get angsuranPerBulan => bungaPerBulan + angsuranPokok;

  double get totalHutang => jumlahPinjaman + bungaPerBulan * lamaPinjaman;
}
