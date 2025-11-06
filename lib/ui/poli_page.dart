import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import 'pegawai_pasien_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PegawaiPasienForm(),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          GestureDetector(
            child: const Card(child: ListTile(title: Text("Poli Anak"))),
            onTap: () {
              Poli poliAnak = Poli(namaPoli: "Poli Anak");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliAnak),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(child: ListTile(title: Text("Poli Gigi"))),
            onTap: () {
              Poli poliGigi = Poli(namaPoli: "Poli Gigi");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliGigi),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(child: ListTile(title: Text("Poli Mata"))),
            onTap: () {
              Poli poliMata = Poli(namaPoli: "Poli Mata");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliMata),
                ),
              );
            },
          ),
          GestureDetector(
            child: const Card(child: ListTile(title: Text("Poli Paru"))),
            onTap: () {
              Poli poliParu = Poli(namaPoli: "Poli Paru");
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PoliDetail(poli: poliParu),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
