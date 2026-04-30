import 'package:flutter/material.dart';

void main() => runApp(const KalaChatApp());

class KalaChatApp extends StatelessWidget {
  const KalaChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: const Color(0xFF008069)),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kala Chat", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFF008069),
      ),
      body: Column(
        children: [
          const Expanded(child: Center(child: Text("Mulai percakapan elegan kamu..."))),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Ketik pesan...",
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const CircleAvatar(backgroundColor: Color(0xFF008069), child: Icon(Icons.send, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}