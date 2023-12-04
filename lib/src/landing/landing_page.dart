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
  bool isUserLoggedIn = false; // Example login status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('job4jobless Job Search'),
        actions: [
          IconButton(
            icon: Icon(isUserLoggedIn ? Icons.logout : Icons.login),
            onPressed: () {
              // Toggle login status and update UI
              setState(() {
                isUserLoggedIn = !isUserLoggedIn;
              });

              // Perform additional actions if needed, like sign out logic
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
                children: [
                  const Text(
                    'Welcome to job4jobless!',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/job4jobless logo@4x-8.png',
                    height: 80,
                    width: 80,
                  ),
                ],
              ),
            ),
            // Drawer items based on login status
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Explore Jobs'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JobListPage()),
                );
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
            ListTile(
              title: const Text('Chat'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Question Paper'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuestionPaperPage()),
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
              title: const Text('Resume Builder'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => isUserLoggedIn ? const ResumeBuilder() : const LoginScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Job Applications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => isUserLoggedIn ? JobApplications() : const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Find Your Dream Job with job4jobless',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/iindeed_image.png',
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JobListPage()),
                );
              },
              child: const Text('Explore Jobs'),
            ),
            if (!isUserLoggedIn)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
                child: const Text('View Profile'),
              ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StepperExampleApp()),
                );
              },
              child: const Text('PostJob'),
            ),
          ],
        ),
      ),
    );
  }
}
