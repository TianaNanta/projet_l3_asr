import 'package:flutter/material.dart';

/// Displays detailed information about a MemberItem.
class MemberItemDetailsView extends StatelessWidget {
  const MemberItemDetailsView({super.key});

  static const routeName = '/member_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Member Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
