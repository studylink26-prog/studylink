import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe; // true if the message is from the current user

  const MessageBubble({
    super.key,
    required this.text,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isMe ? Colors.blue : Colors.grey[300];
    final textColor = isMe ? Colors.white : Colors.black87;
    final align = isMe ? Alignment.centerRight : Alignment.centerLeft;
    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(12),
      topRight: const Radius.circular(12),
      bottomLeft: isMe ? const Radius.circular(12) : const Radius.circular(0),
      bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(12),
    );

    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 16),
        ),
      ),
    );
  }
}
