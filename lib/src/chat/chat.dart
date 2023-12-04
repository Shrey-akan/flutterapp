import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam), // Video call icon
            onPressed: () {
              // Implement video call functionality
              // You can navigate to a new screen for video call or perform any other action.
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return ChatBubble(message: message);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }
}

class ChatMessage {
  final String text;
  final bool isSender;
  final String time;

  ChatMessage({
    required this.text,
    required this.isSender,
    required this.time,
  });
}

List<ChatMessage> _messages = [
  ChatMessage(text: 'Hello!', isSender: false, time: '12:30 PM'),
  ChatMessage(text: 'Hi there!', isSender: true, time: '12:35 PM'),
  ChatMessage(text: 'How are you?', isSender: false, time: '12:40 PM'),
  ChatMessage(
      text: 'I\'m fine, thank you!', isSender: true, time: '12:45 PM'),
];

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Row(
        mainAxisAlignment: message.isSender
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isSender)
            CircleAvatar(
              child: Text('R'), // Display 'R' for receiver
            ),
          const SizedBox(width: 8.0),
          Flexible(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: message.isSender
                    ? Colors.blueAccent
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    message.text,
                    style: TextStyle(fontSize: 16.0, color: Colors.black),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    message.time,
                    style: TextStyle(fontSize: 12.0, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          if (message.isSender)
            CircleAvatar(
              child: Text('S'), // Display 'S' for sender
            ),
        ],
      ),
    );
  }
}

Widget _buildInputField() {
  return Container(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Type a message...',
            ),
          ),
        ),
        SizedBox(width: 8.0),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {
            // Implement sending message functionality
          },
        ),
      ],
    ),
  );
}
