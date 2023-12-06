import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  List<ChatMessage> _messages = [
    ChatMessage(text: 'Hello!', isSender: false, time: '12:30 PM'),
    ChatMessage(text: 'Hi there!', isSender: true, time: '12:35 PM'),
    ChatMessage(text: 'How are you?', isSender: false, time: '12:40 PM'),
    ChatMessage(
        text: 'I\'m fine, thank you!', isSender: true, time: '12:45 PM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.videocam), // Video call icon
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VideoCallPage()),
              );
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

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ),
          SizedBox(width: 8.0),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    String text = _textController.text.trim();
    if (text.isNotEmpty) {
      ChatMessage message = ChatMessage(
        text: text,
        isSender: true,
        time: _getCurrentTime(),
      );
      setState(() {
        _messages.add(message);
        _textController.clear();
      });
      // You can implement any additional logic here, e.g., send the message to a server.
    }
  }

  String _getCurrentTime() {
    // You can implement logic to get the current time in the desired format.
    return DateTime.now().toLocal().toIso8601String();
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

class VideoCallPage extends StatefulWidget {
  @override
  _VideoCallPageState createState() => _VideoCallPageState();
}

class _VideoCallPageState extends State<VideoCallPage> {
  bool _isCameraOn = true;
  bool _isVoiceOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Call'),
        actions: [
          IconButton(
            icon: Icon(Icons.call_end),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Video Call UI Here'),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(_isCameraOn ? Icons.videocam : Icons.videocam_off),
                  onPressed: () {
                    setState(() {
                      _isCameraOn = !_isCameraOn;
                    });
                  },
                ),
                SizedBox(width: 20.0),
                IconButton(
                  icon: Icon(_isVoiceOn ? Icons.mic : Icons.mic_off),
                  onPressed: () {
                    setState(() {
                      _isVoiceOn = !_isVoiceOn;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
