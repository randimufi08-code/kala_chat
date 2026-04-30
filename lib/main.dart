import 'package:flutter/material.dart';

void main() => runApp(const KalaChatApp());

class KalaChatApp extends StatelessWidget {
  const KalaChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kala Chat',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF008069),
      ),
      // Aplikasi akan mulai dari Halaman Daftar Kontak
      home: const ContactPage(),
    );
  }
}

// --- HALAMAN DAFTAR KONTAK ---
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  final List<Map<String, String>> contacts = const [
    {"name": "Teman Kuliah", "status": "Online"},
    {"name": "Grup UAS TI/D24", "status": "H-2 Minggu!"},
    {"name": "Dosen Pemrograman", "status": "Tersedia"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kala Chat", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF008069),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(contacts[index]['name']!),
            subtitle: Text(contacts[index]['status']!),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatPage()),
              );
            },
          );
        },
      ),
    );
  }
}

// --- HALAMAN CHAT ---
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<String> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Room Chat", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF008069),
      ),
      body: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? const Center(child: Text("Belum ada pesan"))
                : ListView.builder(
                    padding: const EdgeInsets.all(15),
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      return Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE7FFDB),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(_messages[index]),
                        ),
                      );
                    },
                  ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Ketik pesan...",
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: const Color(0xFF008069),
            child: IconButton(onPressed: _sendMessage, icon: const Icon(Icons.send, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}