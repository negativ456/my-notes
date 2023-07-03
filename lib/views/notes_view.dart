import 'package:flutter/material.dart';
import 'package:mynotes/const/routes.dart';
import 'package:mynotes/services/auth/auth_service.dart';

import '../enums/menu_actions.dart';
import '../main.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
          PopupMenuButton(onSelected: (value) async {
            switch (value) {
              case MenuActions.logout:
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout) {
                  await AuthService.firebase().logOut();
                  if (!context.mounted) return;
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
                }
                break;
            }
          }, itemBuilder: (context) {
            return const [
              PopupMenuItem<MenuActions>(
                value: MenuActions.logout,
                child: Text('Log out'),
              )
            ];
          })
        ],
      ),
      body: const Text('Hello world'),
    );
  }
}
