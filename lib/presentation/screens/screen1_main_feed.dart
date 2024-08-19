import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/appimages.dart';

class screen1_main_feed extends StatefulWidget {
  const screen1_main_feed({super.key});

  @override
  State<screen1_main_feed> createState() => _screen1_main_feedState();
}

class _screen1_main_feedState extends State<screen1_main_feed> {
  // Track which section is selected
  bool isPublicFeedSelected = true;
  int _selectedIndex = 0;
  String selectedTopic = "Topic 1"; // Initially selected topic

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showTopicSelectionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.circle, color: Colors.white),
                title: Text(
                  'Topic 1',
                  style: TextStyle(
                      color: selectedTopic == 'Topic 1' ? Colors.white : Colors.black),
                ),
                tileColor: selectedTopic == 'Topic 1' ? Colors.green : null,
                onTap: () {
                  setState(() {
                    selectedTopic = "Topic 1";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.circle_outlined),
                title: Text(
                  'Topic 2',
                ),
                onTap: () {
                  setState(() {
                    selectedTopic = "Topic 2";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.circle_outlined),
                title: Text(
                  'Topic 3',
                ),
                onTap: () {
                  setState(() {
                    selectedTopic = "Topic 3";
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.circle_outlined),
                title: Text(
                  'Topic 4',
                ),
                onTap: () {
                  setState(() {
                    selectedTopic = "Topic 4";
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "CHANCE *",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 170),
            IconButton(
              icon: Icon(Icons.notifications_none),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: Colors.white12,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPublicFeedSelected = true;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      'Public Feed',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isPublicFeedSelected ? Colors.green : Colors.grey,
                      ),
                    ),
                    if (isPublicFeedSelected)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        height: 2,
                        width: 100,
                        color: Colors.green,
                      ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isPublicFeedSelected = false;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      'Business Feed',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: !isPublicFeedSelected ? Colors.green : Colors.grey,
                      ),
                    ),
                    if (!isPublicFeedSelected)
                      Container(
                        margin: EdgeInsets.only(top: 4),
                        height: 2,
                        width: 100,
                        color: Colors.green,
                      ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Text(
                'Feeds',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 250),
              GestureDetector(
                onTap: () => _showTopicSelectionSheet(context),
                child: Icon(Icons.filter_alt_outlined),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Card(
                    color: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(AppImages.image1),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'James',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 20,),
                                      Text("1 hour ago", style: TextStyle(fontWeight: FontWeight.w300),)
                                    ],
                                  ),
                                  Text(
                                    'Topic name',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Icon(CupertinoIcons.ellipsis)
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Lorem ipsum dolor sit amet consectetur. '
                                'Sagittis diam auctor convallis justo '
                                'pellentesque in eu amet sapien. Arcu '
                                'pellentesque...',
                          ),
                          SizedBox(height: 10),
                          if (index == 1) ...[  // Check if it's the second item (index 1)
                            SizedBox(height: 10),
                            Image(image: AssetImage(AppImages.image1)),
                          ],
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.favorite_border),
                              SizedBox(width: 20),
                              Icon(Icons.comment),
                              SizedBox(width: 20),
                              Icon(Icons.share),
                              SizedBox(width: 180,),
                              Icon(Icons.save)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
