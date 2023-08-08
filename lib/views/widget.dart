import 'package:flutter/material.dart';

class CustomWidget {
  static drawer(context) {
    return Drawer(
      backgroundColor: Colors.teal.shade400,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
          child: Theme(
            data: ThemeData.dark(),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    size: 60,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  color: Colors.white,
                ),
                ListTile(
                  title: const Text("Message"),
                  leading: const Icon(Icons.chat_bubble_outline),
                  onTap: () => Navigator.restorablePushNamed(context, '/chat'),
                ),
                ListTile(
                    title: const Text("Météo"),
                    leading: const Icon(Icons.cloud_queue_outlined),
                    onTap: () =>
                        Navigator.restorablePushNamed(context, "/weather")),
                ListTile(
                  title: const Text("Recherche"),
                  leading: const Icon(Icons.search),
                  onTap: () =>
                      Navigator.restorablePushNamed(context, "/search"),
                ),
                ListTile(
                  title: const Text("Paramètres"),
                  leading: const Icon(Icons.settings),
                  onTap: () =>
                      Navigator.restorablePushNamed(context, "/settings"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
