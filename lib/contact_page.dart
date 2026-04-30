import 'package:flutter/material.dart';
import 'chat_page.dart'; // Memanggil file chat_page.dart di folder yang sama

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pilih Kontak", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF008069),
      ),
      body: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.person)),
        title: const Text("Teman Akmal"),
        subtitle: const Text("Online"),
        onTap: () {
          // Navigasi ke ChatPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ChatPage()),
          );
        },
      ),
    );
  }
}