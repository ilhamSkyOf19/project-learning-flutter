import 'package:flutter/material.dart';
import '../model/pasien.dart';

class FormPasien extends StatefulWidget {
  final Pasien? data; // opsional, bisa null

  const FormPasien({super.key, this.data});

  @override
  State<FormPasien> createState() => _FormPasienState();
}

class _FormPasienState extends State<FormPasien> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nomorRmController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      idController.text = widget.data!.id?.toString() ?? '';
      nomorRmController.text = widget.data!.nomorRM;
      namaController.text = widget.data!.nama;
      tanggalController.text = widget.data!.tanggalLahir;
      telpController.text = widget.data!.nomorTelepon;
      alamatController.text = widget.data!.alamat;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data == null ? "Tambah Pasien" : "Edit Pasien"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: idController,
                decoration: const InputDecoration(
                  labelText: "ID",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: nomorRmController,
                decoration: const InputDecoration(
                  labelText: "Nomor RM",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: tanggalController,
                decoration: const InputDecoration(
                  labelText: "Tanggal Lahir",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: telpController,
                decoration: const InputDecoration(
                  labelText: "Nomor Telepon",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: alamatController,
                decoration: const InputDecoration(
                  labelText: "Alamat",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final pasien = Pasien(
                    id: int.tryParse(idController.text), // ✅ perbaikan di sini
                    nomorRM: nomorRmController.text,
                    nama: namaController.text,
                    tanggalLahir: tanggalController.text,
                    nomorTelepon: telpController.text,
                    alamat: alamatController.text,
                  );
                  Navigator.pop(context, pasien);
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
