import 'package:flutter/material.dart';
import '../model/pegawai_pasien.dart';
import 'pegawai_pasien_form.dart';

// Halaman ini digunakan untuk menampilkan data detail dari Pegawai & Pasien
class PegawaiPasienDetail extends StatelessWidget {
  final PegawaiPasien data;

  // Konstruktor wajib menerima data PegawaiPasien yang dikirim dari halaman form
  const PegawaiPasienDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bagian atas halaman (AppBar)
      appBar: AppBar(
        title: const Text(
          "Detail Pegawai & Pasien",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // Bagian isi halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),

        // Menggunakan ListView agar bisa di-scroll jika konten panjang
        child: ListView(
          children: [
            // ======== BAGIAN DATA PEGAWAI ========
            const Text(
              "Data Pegawai",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Menampilkan masing-masing field pegawai
            // Operator "?? '-'" artinya jika null, tampilkan tanda "-"
            Text("ID Pegawai: ${data.idPegawai ?? '-'}"),
            Text("NIP: ${data.nip ?? '-'}"),
            Text("Nama Pegawai: ${data.namaPegawai ?? '-'}"),
            Text("Tanggal Lahir: ${data.tanggalLahirPegawai ?? '-'}"),
            Text("Nomor Telepon: ${data.nomorTeleponPegawai ?? '-'}"),
            Text("Email: ${data.email ?? '-'}"),
            Text("Password: ${data.password ?? '-'}"),

            const SizedBox(height: 25),
            const Divider(thickness: 2),
            const SizedBox(height: 10),

            // ======== BAGIAN DATA PASIEN ========
            const Text(
              "Data Pasien",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Menampilkan masing-masing field pasien
            Text("ID Pasien: ${data.idPasien ?? '-'}"),
            Text("Nama Pasien: ${data.namaPasien ?? '-'}"),
            Text("Tanggal Lahir: ${data.tanggalLahirPasien ?? '-'}"),
            Text("Nomor Telepon: ${data.nomorTeleponPasien ?? '-'}"),
            Text("Alamat: ${data.alamat ?? '-'}"),

            const SizedBox(height: 30),

            // ======== BAGIAN TOMBOL AKSI ========
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Tombol UBAH
                ElevatedButton.icon(
                  onPressed: () async {
                    // Navigasi ke halaman form dan kirim data yang ada
                    final updatedData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PegawaiPasienForm(data: data),
                      ),
                    );

                    // Jika form mengembalikan data baru (sudah diubah)
                    if (updatedData != null && context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PegawaiPasienDetail(data: updatedData),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text(
                    "Ubah",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // Tombol HAPUS
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tombol Hapus ditekan')),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  icon: const Icon(Icons.delete, color: Colors.white),
                  label: const Text(
                    "Hapus",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
