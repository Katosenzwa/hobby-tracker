import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the home_screen
import 'login_screen.dart'; // Import the login_screen
import 'progress_tracker.dart';
import 'hobby_management.dart';
import 'calendar_screen.dart';
import 'notification_center.dart';
import 'globals.dart';


class edit_profile extends StatefulWidget {
  const edit_profile({super.key});

  @override
  State<edit_profile> createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _hobbyController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00AFDF),
        title: Text('Profile Page'),
        // Adding a menu icon that will open the Drawer
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Open the drawer
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 50.0,
                  color: Colors.blue,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF00AFDF),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                // Navigate to Home screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => home_screen(username: globalUsername), // Use the global variable
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Navigate to Login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
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
            children: <Widget>[
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
                  'Profile',
                  textAlign: TextAlign.center, // Center align the text
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                    ),
                    TextField(
                      controller: _surnameController,
                      decoration: InputDecoration(labelText: 'Surname'),
                    ),
                    TextField(
                      controller: _genderController,
                      decoration: InputDecoration(labelText: 'Gender'),
                    ),
                    TextField(
                      controller: _hobbyController,
                      decoration: InputDecoration(labelText: 'Hobby Interest'),
                    ),
                    SizedBox(height: 20),
                    if (_errorMessage != null)
                      Text(
                        _errorMessage!,
                        style: TextStyle(color: Colors.red),
                      ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => home_screen(username: globalUsername), // Use the global variable
                              ),
                            );
                          },
                          child: Text('Back'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (_firstNameController.text.isEmpty ||
                                _surnameController.text.isEmpty ||
                                _genderController.text.isEmpty ||
                                _hobbyController.text.isEmpty) {
                              setState(() {
                                _errorMessage = "Please fill out all fields!";
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => home_screen(username: globalUsername), // Use the global variable
                                ),
                              );
                            }
                          },
                          child: Text('Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart, color: Colors.grey), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.group, color: Colors.grey), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.blue), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today, color: Colors.grey), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications, color: Colors.grey), label: ''),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => progress_tracker(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HobbyManagement(),
                ),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const calendar_screen(),
                ),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NotificationCenter(),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
