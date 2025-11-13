import 'package:flutter/material.dart';
import '../model/poli.dart';
import '../model/pegawai.dart';
import '../model/pasien.dart';
import 'form_pegawai.dart';
import 'form_pasien.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;

  const PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {
  // list pegawai dan pasien
  List<Pegawai> pegawaiList = [];
  List<Pasien> pasienList = [];

  void _tambahPegawai() async {
    final Pegawai? newPegawai = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormPegawai()),
    );

    if (newPegawai != null) {
      setState(() {
        pegawaiList.add(newPegawai);
      });
    }
  }

  void _tambahPasien() async {
    final Pasien? newPasien = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormPasien()),
    );

    if (newPasien != null) {
      setState(() {
        pasienList.add(newPasien);
      });
    }
  }

  void _updatePegawai(int index) async {
    final Pegawai? updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPegawai(data: pegawaiList[index]),
      ),
    );

    if (updated != null) {
      setState(() {
        pegawaiList[index] = updated;
      });
    }
  }

  void _updatePasien(int index) async {
    final Pasien? updated = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormPasien(data: pasienList[index]),
      ),
    );

    if (updated != null) {
      setState(() {
        pasienList[index] = updated;
      });
    }
  }

  Widget _buildPegawaiCard(Pegawai p, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: ListTile(
        title: Text(p.nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${p.id}"),
            Text("NIP: ${p.nip}"),
            Text("Tanggal Lahir: ${p.tanggalLahir}"),
            Text("Nomor Telepon: ${p.nomorTelepon}"),
            Text("Email: ${p.email}"),
            Text("Password: ${p.password}"),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.blue),
          onPressed: () => _updatePegawai(index),
        ),
      ),
    );
  }

  Widget _buildPasienCard(Pasien p, int index) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: ListTile(
        title: Text(p.nama),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("ID: ${p.id}"),
            Text("Nomor RM: ${p.nomorRM}"),
            Text("Tanggal Lahir: ${p.tanggalLahir}"),
            Text("Nomor Telepon: ${p.nomorTelepon}"),
            Text("Alamat: ${p.alamat}"),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.edit, color: Colors.green),
          onPressed: () => _updatePasien(index),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Poli: ${widget.poli.namaPoli}",
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === Data Pegawai ===
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Data Pegawai",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: _tambahPegawai,
                ),
              ],
            ),
            pegawaiList.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Belum ada data pegawai"),
                  )
                : Column(
                    children: pegawaiList
                        .asMap()
                        .entries
                        .map((e) => _buildPegawaiCard(e.value, e.key))
                        .toList(),
                  ),

            const SizedBox(height: 20),
            const Divider(thickness: 2),
            const SizedBox(height: 10),

            // === Data Pasien ===
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Data Pasien",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.blue),
                  onPressed: _tambahPasien,
                ),
              ],
            ),
            pasienList.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Belum ada data pasien"),
                  )
                : Column(
                    children: pasienList
                        .asMap()
                        .entries
                        .map((e) => _buildPasienCard(e.value, e.key))
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
