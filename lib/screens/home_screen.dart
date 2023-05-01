import 'package:flutter/material.dart';
import 'package:resume_builder_app/screens/personal_info_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RESUME BUILDER')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Start'),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const PersonalInfoScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
