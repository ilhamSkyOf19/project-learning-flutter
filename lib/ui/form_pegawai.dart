import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class FormPegawai extends StatefulWidget {
  final Pegawai? data; // opsional, bisa null

  const FormPegawai({super.key, this.data});

  @override
  State<FormPegawai> createState() => _FormPegawaiState();
}

class _FormPegawaiState extends State<FormPegawai> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController idController = TextEditingController();
  final TextEditingController nipController = TextEditingController();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      idController.text = widget.data!.id?.toString() ?? '';
      nipController.text = widget.data!.nip;
      namaController.text = widget.data!.nama;
      tanggalController.text = widget.data!.tanggalLahir;
      telpController.text = widget.data!.nomorTelepon;
      emailController.text = widget.data!.email;
      passwordController.text = widget.data!.password;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data == null ? "Tambah Pegawai" : "Edit Pegawai"),
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
                controller: nipController,
                decoration: const InputDecoration(
                  labelText: "NIP",
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
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final pegawai = Pegawai(
                    id: int.parse(idController.text),
                    nip: nipController.text,
                    nama: namaController.text,
                    tanggalLahir: tanggalController.text,
                    nomorTelepon: telpController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  Navigator.pop(context, pegawai);
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
