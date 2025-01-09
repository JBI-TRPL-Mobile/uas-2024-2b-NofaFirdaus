import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:template_project/providers/user_providers.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
final userProvider = Provider.of<UserProviders>(context);
final authenticatedUsers = userProvider.authenticatedUsers;
   return ListView.builder(
  itemCount: authenticatedUsers.length,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text(authenticatedUsers[index].toString()), 
    );
  },
);
  }
}