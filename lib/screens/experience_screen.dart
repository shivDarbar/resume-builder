import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';
import 'package:resume_builder_app/screens/project_screen.dart';
import 'package:resume_builder_app/widgets/experience_form.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Experience'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: resumeProvider.educationList.length,
              itemBuilder: (context, index) {
                return ExperienceForm(index: index);
              },
            ),
          ),
          ElevatedButton(
            child: const Text('Add Form'),
            onPressed: () => resumeProvider.addExperience(),
          ),
          ElevatedButton(
            child: const Text('Next'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProjectScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
