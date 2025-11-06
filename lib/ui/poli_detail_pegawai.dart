import 'package:flutter/material.dart';
import '../model/pegawai_pasien.dart';
import 'pegawai_pasien_form.dart';

class PegawaiPasienDetail extends StatefulWidget {
  final PegawaiPasien data;

  const PegawaiPasienDetail({super.key, required this.data});

  @override
  State<PegawaiPasienDetail> createState() => _PegawaiPasienDetailState();
}

class _PegawaiPasienDetailState extends State<PegawaiPasienDetail> {
  late PegawaiPasien currentData;

  @override
  void initState() {
    super.initState();
    currentData = widget.data; // simpan data awal
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail Pegawai & Pasien",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              "Data Pegawai",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text("ID Pegawai: ${currentData.idPegawai ?? '-'}"),
            Text("NIP: ${currentData.nip ?? '-'}"),
            Text("Nama Pegawai: ${currentData.namaPegawai ?? '-'}"),
            Text("Tanggal Lahir: ${currentData.tanggalLahirPegawai ?? '-'}"),
            Text("Nomor Telepon: ${currentData.nomorTeleponPegawai ?? '-'}"),
            Text("Email: ${currentData.email ?? '-'}"),
            Text("Password: ${currentData.password ?? '-'}"),

            const SizedBox(height: 25),
            const Divider(thickness: 2),
            const SizedBox(height: 10),

            const Text(
              "Data Pasien",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text("ID Pasien: ${currentData.idPasien ?? '-'}"),
            Text("Nama Pasien: ${currentData.namaPasien ?? '-'}"),
            Text("Tanggal Lahir: ${currentData.tanggalLahirPasien ?? '-'}"),
            Text("Nomor Telepon: ${currentData.nomorTeleponPasien ?? '-'}"),
            Text("Alamat: ${currentData.alamat ?? '-'}"),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 🔹 Tombol Ubah
                ElevatedButton.icon(
                  onPressed: () async {
                    // Buka form dan tunggu hasilnya
                    final updatedData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PegawaiPasienForm(data: currentData),
                      ),
                    );

                    // Jika ada data hasil edit, perbarui tampilan
                    if (updatedData != null && updatedData is PegawaiPasien) {
                      setState(() {
                        currentData = updatedData;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Data berhasil diperbarui'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: const Icon(Icons.edit, color: Colors.white),
                  label: const Text(
                    "Ubah",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                // 🔹 Tombol Hapus
                ElevatedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tombol Hapus ditekan')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
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
