import 'package:flutter/material.dart';
import '../widgets/AppButton.dart';
import '../widgets/MessageBubble.dart';
import '../models/HelpRequest.dart';

class ChatScreen extends StatefulWidget {
  final HelpRequest request;

  const ChatScreen({super.key, required this.request});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> messages = []; // {'sender': 'user/peer/AI', 'text': '...'}

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'text': text});
      _controller.clear();
    });

    // Simulate AI/peer response after a delay (replace with real backend)
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        messages.add({'sender': 'AI', 'text': 'Here’s a resource that might help: https://example.com'});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.request.studentName} - ${widget.request.subject}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg['sender'] == 'user';
                return MessageBubble(
                  text: msg['text']!,
                  isMe: isUser,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                AppButton(
                  text: 'Send',
                  onPressed: _sendMessage,
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
