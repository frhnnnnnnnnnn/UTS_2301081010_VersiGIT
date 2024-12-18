import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'peminjaman.dart';
import 'result_screen.dart';

class LoanFormScreen extends StatefulWidget {
  @override
  _LoanFormScreenState createState() => _LoanFormScreenState();
}

class _LoanFormScreenState extends State<LoanFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _kodeController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kodeNasabahController = TextEditingController();
  final TextEditingController _namaNasabahController = TextEditingController();
  final TextEditingController _jumlahPinjamanController = TextEditingController();
  final TextEditingController _lamaPinjamanController = TextEditingController();
  final TextEditingController _tanggalController = TextEditingController();

  double _bunga = 12.0;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _tanggalController.text = DateFormat('dd-MM-yyyy').format(_selectedDate);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _tanggalController.text = DateFormat('dd-MM-yyyy').format(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Peminjaman'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _kodeController,
                decoration: InputDecoration(labelText: 'Kode Peminjaman'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter Kode Peminjaman';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(labelText: 'Nama Admin'),
              ),
              TextFormField(
                controller: _kodeNasabahController,
                decoration: InputDecoration(labelText: 'Kode Nasabah'),
              ),
              TextFormField(
                controller: _namaNasabahController,
                decoration: InputDecoration(labelText: 'Nama Nasabah'),
              ),
              TextFormField(
                controller: _jumlahPinjamanController,
                decoration: InputDecoration(labelText: 'Jumlah Pinjaman'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _lamaPinjamanController,
                decoration: InputDecoration(labelText: 'Lama Pinjaman (bulan)'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _tanggalController,
                decoration: InputDecoration(
                  labelText: 'Tanggal Peminjaman',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context),
                  ),
                ),
                readOnly: true,
                onTap: () => _selectDate(context),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Peminjaman peminjaman = Peminjaman(
                      kode: _kodeController.text,
                      nama: _namaController.text,
                      kodePeminjaman: _kodeController.text,
                      tanggal: _selectedDate,
                      kodeNasabah: _kodeNasabahController.text,
                      namaNasabah: _namaNasabahController.text,
                      jumlahPinjaman: double.parse(_jumlahPinjamanController.text),
                      lamaPinjaman: int.parse(_lamaPinjamanController.text),
                      bunga: _bunga,
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(peminjaman: peminjaman),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
