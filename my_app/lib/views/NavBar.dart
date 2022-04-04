import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'Progress.dart';
import 'main.dart';
import 'sos.dart';
import 'Steps.dart';
import 'views/dashboard.dart';

class SettingsRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
    );
  }
}

class PoliciesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Policies')),
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Dashboard()),
                );
              }),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Progress'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgressRoute()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('10 Steps'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StepsRoute()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('SOS'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SOSRoute()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsRoute()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PoliciesRoute()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => null, //launch('https://www.google.com/'),
          ),
        ],
      ),
    );
  }
}
