import 'package:flutter/material.dart';
import '../model/pegawai_pasien.dart';
import 'pegawai_pasien_detail.dart';

class PegawaiPasienForm extends StatefulWidget {
  final PegawaiPasien? data; // optional data untuk mode edit

  const PegawaiPasienForm({Key? key, this.data}) : super(key: key);

  @override
  _PegawaiPasienFormState createState() => _PegawaiPasienFormState();
}

class _PegawaiPasienFormState extends State<PegawaiPasienForm> {
  // Controller untuk semua field
  final TextEditingController idPegawaiController = TextEditingController();
  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaPegawaiController = TextEditingController();
  final TextEditingController tanggalLahirPegawaiController =
      TextEditingController();
  final TextEditingController nomorTeleponPegawaiController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController idPasienController = TextEditingController();
  final TextEditingController namaPasienController = TextEditingController();
  final TextEditingController tanggalLahirPasienController =
      TextEditingController();
  final TextEditingController nomorTeleponPasienController =
      TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Jika ada data (mode edit), isi semua field dengan nilai lama
    if (widget.data != null) {
      idPegawaiController.text = widget.data!.idPegawai?.toString() ?? '';
      nipController.text = widget.data!.nip ?? '';
      namaPegawaiController.text = widget.data!.namaPegawai ?? '';
      tanggalLahirPegawaiController.text =
          widget.data!.tanggalLahirPegawai ?? '';
      nomorTeleponPegawaiController.text =
          widget.data!.nomorTeleponPegawai ?? '';
      emailController.text = widget.data!.email ?? '';
      passwordController.text = widget.data!.password ?? '';
      idPasienController.text = widget.data!.idPasien?.toString() ?? '';
      namaPasienController.text = widget.data!.namaPasien ?? '';
      tanggalLahirPasienController.text = widget.data!.tanggalLahirPasien ?? '';
      nomorTeleponPasienController.text = widget.data!.nomorTeleponPasien ?? '';
      alamatController.text = widget.data!.alamat ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.data == null
              ? "Form Pegawai & Pasien"
              : "Edit Pegawai & Pasien",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Bagian Data Pegawai
            const Text(
              "Data Pegawai",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: idPegawaiController,
              decoration: const InputDecoration(labelText: "ID Pegawai"),
            ),
            TextField(
              controller: nipController,
              decoration: const InputDecoration(labelText: "NIP"),
            ),
            TextField(
              controller: namaPegawaiController,
              decoration: const InputDecoration(labelText: "Nama Pegawai"),
            ),
            TextField(
              controller: tanggalLahirPegawaiController,
              decoration: const InputDecoration(
                labelText: "Tanggal Lahir Pegawai",
              ),
            ),
            TextField(
              controller: nomorTeleponPegawaiController,
              decoration: const InputDecoration(
                labelText: "Nomor Telepon Pegawai",
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),

            const SizedBox(height: 25),
            const Divider(thickness: 2),
            const SizedBox(height: 10),

            // Bagian Data Pasien
            const Text(
              "Data Pasien",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: idPasienController,
              decoration: const InputDecoration(labelText: "ID Pasien"),
            ),
            TextField(
              controller: namaPasienController,
              decoration: const InputDecoration(labelText: "Nama Pasien"),
            ),
            TextField(
              controller: tanggalLahirPasienController,
              decoration: const InputDecoration(
                labelText: "Tanggal Lahir Pasien",
              ),
            ),
            TextField(
              controller: nomorTeleponPasienController,
              decoration: const InputDecoration(
                labelText: "Nomor Telepon Pasien",
              ),
            ),
            TextField(
              controller: alamatController,
              decoration: const InputDecoration(labelText: "Alamat"),
            ),

            const SizedBox(height: 30),

            // Tombol Simpan
            ElevatedButton(
              onPressed: () {
                PegawaiPasien newData = PegawaiPasien(
                  idPegawai: int.tryParse(idPegawaiController.text),
                  nip: nipController.text,
                  namaPegawai: namaPegawaiController.text,
                  tanggalLahirPegawai: tanggalLahirPegawaiController.text,
                  nomorTeleponPegawai: nomorTeleponPegawaiController.text,
                  email: emailController.text,
                  password: passwordController.text,
                  idPasien: int.tryParse(idPasienController.text),
                  namaPasien: namaPasienController.text,
                  tanggalLahirPasien: tanggalLahirPasienController.text,
                  nomorTeleponPasien: nomorTeleponPasienController.text,
                  alamat: alamatController.text,
                );

                if (widget.data == null) {
                  // Tambah data baru → ke detail
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PegawaiPasienDetail(data: newData),
                    ),
                  );
                } else {
                  // Edit data → kembali ke detail
                  Navigator.pop(context, newData);
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Simpan",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
