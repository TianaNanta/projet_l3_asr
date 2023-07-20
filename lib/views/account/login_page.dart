import 'package:flutter/material.dart';
import 'package:supabase_auth_ui/supabase_auth_ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authentication Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SupaEmailAuth(
              redirectTo: "mg.tianananta.project://login-callback/",
              onSignInComplete: (response) {
                Navigator.of(context).pushReplacementNamed('/home');
              },
              onSignUpComplete: (response) {
                Navigator.of(context).pushReplacementNamed('/account');
              },
              metadataFields: [
                MetaDataField(
                  prefixIcon: const Icon(Icons.person),
                  label: 'Username',
                  key: 'username',
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter something';
                    }
                    return null;
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
