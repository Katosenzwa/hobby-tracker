import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'progress_tracker.dart';
import 'calendar_screen.dart';
import 'notification_center.dart';
import 'hobby_management.dart';
import 'list_hobbies.dart';
import 'login_screen.dart';
import 'edit_profile.dart';
import 'globals.dart';

class Relaxing_hf extends StatefulWidget {
  @override
  _Relaxing_hfState createState() => _Relaxing_hfState();
}

class _Relaxing_hfState extends State<Relaxing_hf> {
  String? selectedHobby;
  String? selectedFrequency;
  String? selectedDuration;
  bool isFormValid = false;

  void _checkFormValidity() {
    if (selectedHobby != null && selectedFrequency != null && selectedDuration != null) {
      setState(() {
        isFormValid = true;
      });
    } else {
      setState(() {
        isFormValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relaxing Hobby'),
        backgroundColor: const Color(0xFF00AFDF),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('User'),
              accountEmail: null,
              currentAccountPicture: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50.0,
                  color: Colors.blue,
                ),
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF00AFDF),
              ),
            ),
            ListTile(
              title: Text('Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const edit_profile()),
                );
              },
            ),
            ListTile(
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const edit_profile()),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF00AFDF),
              Colors.white,
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hobby Categories Header
              Container(
                width: MediaQuery.of(context).size.width * 0.8, // Extend the width
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: const Text(
                  'Relaxing Hobby Form',
                  textAlign: TextAlign.center, // Center align the text
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24), // Add spacing after the header
              const Text(
                'Hobby:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedHobby,
                hint: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Select a hobby', style: TextStyle(fontSize: 14)),
                ),
                items: <String>['Reading', 'Gardening', 'Meditation', 'Cooking']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(value, style: const TextStyle(fontSize: 14)),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedHobby = newValue;
                    _checkFormValidity();
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Frequency:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedFrequency,
                hint: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Select Frequency', style: TextStyle(fontSize: 14)),
                ),
                items: <String>['Daily', 'Weekly', 'Monthly'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(value, style: const TextStyle(fontSize: 14)),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFrequency = newValue;
                    _checkFormValidity();
                  });
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Duration:',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                isExpanded: true,
                value: selectedDuration,
                hint: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('Select Duration', style: TextStyle(fontSize: 14)),
                ),
                items: <String>['30 minutes', '1 hour', '2 hours'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(value, style: const TextStyle(fontSize: 14)),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDuration = newValue;
                    _checkFormValidity();
                  });
                },
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HobbyManagement()),
                      );
                    },
                    child: const Text('Back'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: isFormValid
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const list_hobbies()),
                      );
                    }
                        : null,
                    child: const Text('Save'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        isFormValid ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (!isFormValid)
                const Text(
                  'Please fill out all fields to enable the save button.',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.bar_chart, color: Colors.grey),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.music_note, color: Colors.blue),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.notifications),
            label: '',
          ),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => progress_tracker()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => home_screen(username: globalUsername), // Use the global variable
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const calendar_screen()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationCenter()),
              );
              break;
          }
        },
      ),
    );
  }
}
