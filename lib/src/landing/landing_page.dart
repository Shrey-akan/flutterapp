import 'package:flutter/material.dart';
import 'package:jobmobapp/src/chat/chat.dart';
import 'package:jobmobapp/src/jobapplication/jobapplication.dart';
import 'package:jobmobapp/src/postjobform/postjob.dart';
import 'package:jobmobapp/src/question_paper/question_paper_page.dart';
import 'package:jobmobapp/src/resume/resume.dart';
import 'package:jobmobapp/src/settings/cookies_page.dart';
import 'package:jobmobapp/src/settings/help_center_page.dart';
import 'package:jobmobapp/src/settings/setting.dart';
import 'package:jobmobapp/src/settings/terms_page.dart';
import '../job_list/job_list_page.dart';
import '../login/login.dart';
import '../profile/profile.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool isUserLoggedIn = false;
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if ((_selectedIndex == 1 || _selectedIndex == 2) && !isUserLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      } else if (_selectedIndex == 1 && isUserLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const JobListPage()),
        );
      } else if (_selectedIndex == 2 && isUserLoggedIn) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProfilePage()),
        );
      }
    });
  }










  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('job4jobless'),
        actions: [
          IconButton(
            icon: Icon(isUserLoggedIn ? Icons.logout : Icons.login),
            onPressed: () {
              setState(() {
                isUserLoggedIn = !isUserLoggedIn;
              });
              if (!isUserLoggedIn) {
                // Sign out logic
              }
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome to job4jobless!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/icon/white icon@4x-8.png',
                    height: 80,
                    width: 80,
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Explore Jobs'),
              onTap: () {
                if (!isUserLoggedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JobListPage()),
                  );
                }
              },
            ),
            if (isUserLoggedIn)
              ListTile(
                title: const Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
              )
            else
              ListTile(
                title: const Text('Sign In'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                },
              ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Terms'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermsPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Cookies'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CookiesPage()),
                );
              },
            ),
            if (isUserLoggedIn)
              ListTile(
                title: const Text('Job Applications'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobApplications()),
                  );
                },
              ),
            if (isUserLoggedIn)
              ListTile(
                title: const Text('Resume Builder'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ResumeBuilder()),
                  );
                },
              ),
            ListTile(
              title: const Text('Help Center'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HelpCenterPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Question Paper'),
              onTap: () {
                if (isUserLoggedIn) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const QuestionPaperPage()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                  );
                }
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/iindeed_image.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Your content goes here.',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
      floatingActionButton: isUserLoggedIn
          ? FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
              },
              tooltip: 'Chat',
              child: Icon(Icons.chat),
            )
          : null,
    );
  }
}
