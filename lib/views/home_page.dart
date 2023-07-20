import 'package:flutter/material.dart';
import 'package:project/constants.dart';
import 'package:project/views/member/member_details.dart';
import 'package:project/views/member/member_item.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {super.key,
      this.members = const [
        MemberItem("ANDRIANJAKA FENOSOA Tiana Nantenaina", "2311",
            "assets/images/TianaNanta.png"),
        MemberItem("ANDRITOAVINA Aro Iorenantsoa Mykaia", "2284",
            "assets/images/Mykaia.png"),
        MemberItem("RAZAKAMAMPIANINA Hermann Williams", "2314",
            "assets/images/Hermann.png"),
        MemberItem(
            "TSANGASOA Falinirina Adriano", "2297", "assets/images/Adriano.png")
      ]});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => const HomePage(),
    );
  }

  final List<MemberItem> members;

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountEmail: Text(user?.email ?? "No email"),
      accountName: Text(user?.userMetadata?['username'] ?? "No username"),
      currentAccountPicture: const CircleAvatar(
          foregroundImage: AssetImage('assets/images/TianaNanta.png')),
    );
    final drawerItems = ListView(
      children: <Widget>[
        drawerHeader,
        ListTile(
          title: const Text("Account"),
          leading: const Icon(Icons.account_circle_outlined),
          onTap: () => Navigator.of(context).pushNamed('/account'),
        ),
        ListTile(
          title: const Text("Chat"),
          leading: const Icon(Icons.chat_bubble_outline),
          onTap: () => Navigator.restorablePushNamed(context, '/chat'),
        ),
        ListTile(
            title: const Text("Weather"),
            leading: const Icon(Icons.cloud_queue_outlined),
            onTap: () => Navigator.restorablePushNamed(context, "/weather")),
        ListTile(
          title: const Text("Search"),
          leading: const Icon(Icons.search),
          onTap: () => Navigator.restorablePushNamed(context, "/search"),
        ),
        ListTile(
          title: const Text("Settings"),
          leading: const Icon(Icons.settings),
          onTap: () => Navigator.restorablePushNamed(context, "/settings"),
        ),
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projet Android L3 ASR'),
      ),
      drawer: Drawer(
        child: drawerItems,
      ),
      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'sampleItemListView',
        itemCount: members.length,
        itemBuilder: (BuildContext context, int index) {
          final member = members[index];

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
