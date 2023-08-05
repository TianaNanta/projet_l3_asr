import 'package:flutter/material.dart';
import 'package:project/controllers/account_controller.dart';
import 'package:project/views/chat/widgets.dart';
import 'package:project/views/member/member_details.dart';
import 'package:project/views/member/member_item.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      this.members = const [
        MemberItem("ANDRIANJAKA FENOSOA Tiana Nantenaina", "2311",
            "assets/images/TianaNanta.jpg"),
        MemberItem("ANDRITOAVINA Aro Iorenantsoa Mykaia", "2284",
            "assets/images/Mykaia.png"),
        MemberItem("RAZAKAMAMPIANINA Hermann Williams", "2314",
            "assets/images/Hermann.png"),
        MemberItem(
            "TSANGASOA Falinirina Adriano", "2297", "assets/images/Adriano.png")
      ]});

  final List<MemberItem> members;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Functions.updateAvailability();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projet Android L3 ASR'),
      ),
      drawer: ChatWidgets.drawer(context),
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: widget.members.length,
        itemBuilder: (BuildContext context, int index) {
          final member = widget.members[index];

          return ListTile(
              title: Text(member.name),
              subtitle: Text('Numéro: ${member.matricule}'),
              leading: CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage(member.photoUrl),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  MemberItemDetailsView.routeName,
                );
              });
        },
      ),
    );
  }
}
