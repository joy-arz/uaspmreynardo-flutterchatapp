import 'package:flutter/material.dart';
import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> chats = [
    {
      'name': 'Bayu Angga Wijaya',
      'lastMessage': 'okee',
      'time': 'Januari',
      'isRead': true,
      'initial': 'B',
    },
    {
      'name': 'Juliansyah Putra Tanjung',
      'lastMessage': 'otw',
      'time': 'Februari',
      'isRead': true,
      'initial': 'J',
    },
    {
      'name': 'Chrisnatalis',
      'lastMessage': 'Besok meeting',
      'time': 'Maret',
      'isRead': true,
      'initial': 'C',
    },
    {
      'name': 'Yennimar',
      'lastMessage': 'Besok UAS',
      'time': 'April',
      'isRead': true,
      'initial': 'Y',
    },
      {
      'name': 'Jericho',
      'lastMessage': 'Bagi Contekan dong, boi',
      'time': 'April',
      'isRead': true,
      'initial': 'J',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Chat'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ChatItem(
            name: chat['name'],
            lastMessage: chat['lastMessage'],
            time: chat['time'],
            isRead: chat['isRead'],
            initial: chat['initial'],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(name: chat['name']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final bool isRead;
  final String initial;
  final VoidCallback onTap;

  const ChatItem({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.isRead,
    required this.initial,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFCCE6FF),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.blue, width: 2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: Text(
                initial,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            // Konten utama
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama (bold)
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                
                  Row(
                    children: [
                      Text(
                        lastMessage,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.black54,
                            ),
                      ),
                      if (isRead)
                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(
                            Icons.check,
                            size: 14,
                            color: Colors.green,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                time,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}