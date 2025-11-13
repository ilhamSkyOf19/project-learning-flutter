import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  // Awalnya kosong (belum ada data)
  final List<Poli> daftarPoli = [];

  // Fungsi tambah poli
  void _tambahPoli() async {
    final Poli? hasil = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PoliForm()),
    );

    // Jika user menekan "Simpan" dan mengirim data balik
    if (hasil != null) {
      setState(() {
        daftarPoli.add(hasil);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Poli", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.add, color: Colors.white),
            ),
            onTap: _tambahPoli,
          ),
        ],
      ),

      // Cek apakah ada data
      body: daftarPoli.isEmpty
          ? const Center(
              child: Text(
                "Belum ada data poli.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: daftarPoli.length,
              itemBuilder: (context, index) {
                final poli = daftarPoli[index];
                return GestureDetector(
                  child: Card(child: ListTile(title: Text(poli.namaPoli))),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PoliDetail(poli: poli),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
