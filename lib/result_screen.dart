import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'peminjaman.dart';

class ResultScreen extends StatelessWidget {
  final Peminjaman peminjaman;

  ResultScreen({required this.peminjaman});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil Pinjaman'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Pinjaman',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey),
                SizedBox(height: 10),
                _buildResultRow('Kode Peminjaman', peminjaman.kodePeminjaman),
                _buildResultRow('Nama Nasabah', peminjaman.namaNasabah),
                _buildResultRow('Tanggal Peminjaman', DateFormat('dd-MM-yyyy').format(peminjaman.tanggal)),
                _buildResultRow('Jumlah Pinjaman', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(peminjaman.jumlahPinjaman)),
                _buildResultRow('Lama Pinjaman', '${peminjaman.lamaPinjaman} bulan'),
                _buildResultRow('Bunga per Bulan', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(peminjaman.bungaPerBulan)),
                _buildResultRow('Angsuran Pokok', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(peminjaman.angsuranPokok)),
                _buildResultRow('Angsuran per Bulan', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(peminjaman.angsuranPerBulan)),
                _buildResultRow('Total Hutang', NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0).format(peminjaman.totalHutang)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
