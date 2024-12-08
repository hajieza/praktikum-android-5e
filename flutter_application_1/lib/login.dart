import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Tampilkan dialog konfirmasi
        bool shouldExit = await _showExitConfirmation(context);
        return shouldExit;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "LOGIN APLIKASI PEGAWAI",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'data:image/png;base64,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',
                height: 100,
                width: 100,
              ),
              const SizedBox(height: 32),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username == 'admin' && password == '1234') {
                    Get.toNamed('/dashboard');
                  } else {
                    Get.snackbar(
                      "Login Gagal",
                      "Username atau Password salah!",
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0),
                  ),
                ),
                child: const Text("LOGIN"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmation(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Konfirmasi Keluar'),
            content:
                const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false); // Jangan keluar
                },
                child: const Text('Tidak'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true); // Keluar
                },
                child: const Text('Ya'),
              ),
            ],
          ),
        ) ??
        false; // Default: Jangan keluar
  }
}
