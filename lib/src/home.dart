import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/detail_page.dart';

class Coba extends StatelessWidget {
  const Coba({super.key});

  @override
  Widget build(BuildContext context) {
    // data list
    final List<String> names = [
      'Poli Umum',
      'Poli Gigi',
      'Poli Kandungan',
      'Poli Mata',
      'Poli Jantung',
      'Poli Paru',
      'Poli THT',
      'Poli Bedah',
      'Poli Kedokteran Anak',
      'Poli Kedokteran Gigi',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Poli',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),

      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final name = names[index];

          return SizedBox(
            height: 100,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(name: name),
                  ),
                );
              },
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),

                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
