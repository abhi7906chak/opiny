import 'package:flutter/material.dart';
import 'package:opiny/custom_text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(text: 'Settings'),
        leading: const Icon(Icons.arrow_back),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SettingItem(
              icon: Icons.person,
              title: 'Update Profile',
              onTap: () {
                // Add navigation or action
              },
            ),
            SettingItem(
              icon: Icons.videogame_asset,
              title: 'Game Management',
              onTap: () {
                // Add navigation or action
              },
            ),
            SettingItem(
              icon: Icons.delete,
              title: 'Delete Account',
              onTap: () {
                // Add navigation or action
              },
            ),
            SettingItem(
              icon: Icons.logout,
              title: 'Logout',
              onTap: () {
                // Add navigation or action
              },
            ),
            SettingItem(icon: Icons.phone, title:'Helpline Number', onTap: (){

            })

          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon),
        title: CustomText(text: title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}