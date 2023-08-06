import 'package:flutter/material.dart';

/// Displays detailed information about a MemberItem.
class MemberItemDetailsView extends StatelessWidget {
  const MemberItemDetailsView({super.key});

  static const routeName = '/member_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails des membres'),
        backgroundColor: Colors.teal.shade400,
        elevation: 0,
      ),
      body: const Center(
        child: Text('Plus d\'informations ici'),
      ),
    );
  }
}
