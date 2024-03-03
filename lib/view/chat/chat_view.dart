import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/chat_message.dart';

// This is the type used by the popup menu below.
enum SampleItem { itemOne, itemTwo, itemThree }

class UserChat extends StatefulWidget {
  final String userName;
  final String userImage;

  const UserChat({Key? key, required this.userName, required this.userImage})
      : super(key: key);

  @override
  _UserChatState createState() => _UserChatState();
}

class _UserChatState extends State<UserChat> {
  final TextEditingController _messageController = TextEditingController();
  List<Message> _messages = []; // List to store chat messages

  XFile? image;
  @override
  void initState() {
    super.initState();
    _loadMessages(); // Load messages when the widget is initialized
  }

  //==============================
  // Method to load messages from a JSON file
  //==============================
  void _loadMessages() async {
    try {
      String jsonString =
      await rootBundle.loadString('assets/json/messages_data.json');
      print('Loaded JSON: $jsonString'); // Print loaded JSON for debugging
      List<dynamic> jsonList = json.decode(jsonString);
      setState(() {
        // Convert JSON to Message objects and update the state
        _messages = jsonList.map((json) => Message.fromJson(json)).toList();
      });
    } catch (e) {
      print('Error loading messages: $e');
    }
  }

  //==============================
  // Method to send a message
  //==============================

  void _sendMessage(String message) {
    setState(() {
      // Add a new Message object to the list with the current timestamp
      _messages.add(Message(
        sender: 'Me',
        text: message,
        timestamp: DateTime.now(),
      ));
      _messageController.clear(); // Clear the message input field
    });
  }

  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, // Change app back button color
        ),
        title: Row(
          children: [
            /*CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(widget.userImage),
            ),*/

            //==============================
            // User name and status
            //==============================

            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.userName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.call),color: Colors.black,
          ),

          //==============================
          // Menu Button
          //==============================

          PopupMenuButton<SampleItem>(
            iconColor: Colors.black,
            initialValue: selectedItem,
            onSelected: (SampleItem item) {
              setState(() {
                selectedItem = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Text('Notification'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Text('Remove'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemThree,
                child: Text('Block'),
              ),
            ],
          ),
        ],

      ),
      backgroundColor: const Color(0xFFfef1ee),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: _messages[index].sender == 'User1'
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: _messages[index].sender == 'User1'
                              ? Colors.grey
                              : Colors.blue,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          _messages[index].text,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(

                        // Displaying timestamp below the message

                        DateFormat('HH:mm')
                            .format(_messages[index].timestamp),
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),

                  //==============================
                  // for image picking
                  //==============================

                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () async {
                      final ImagePicker _picker = ImagePicker();
                      final img =
                      await _picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        image = img;
                      });
                    },
                  ),

                  //==============================
                  // for camera open
                  //==============================

                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    onPressed: () async {
                      final ImagePicker _picker = ImagePicker();
                      final img =
                      await _picker.pickImage(source: ImageSource.camera);
                      setState(() {
                        image = img;
                      });
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      if (_messageController.text.isNotEmpty) {

                        // Call method to send a message
                        _sendMessage('Me: ${_messageController.text}');
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}