import 'package:flutter/material.dart';
import 'package:pertemuankedua/dashboard.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Colors.amber,Colors.blue])
          ),
        ),
        backgroundColor: Colors.blueGrey,
        title: const Text("LOGIN"),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Menu")));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Cari")));
            },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: (){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Setting")));
              })
          ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/295/295128.png',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Username", prefixIcon: Icon(Icons.person)
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: "Password", prefixIcon: Icon(Icons.lock)
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: (){
                Get.offAll(const Dashboard());
              }, 
              child: const Text("LOGIN") 
            ),
          ],
        ),
      ),
    );
  }
}