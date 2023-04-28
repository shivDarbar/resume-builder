import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';
import 'package:resume_builder_app/screens/skills_screen.dart';
import 'package:resume_builder_app/widgets/project_form.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: resumeProvider.educationList.length,
              itemBuilder: (context, index) {
                return ProjectForm(index: index);
              },
            ),
          ),
          ElevatedButton(
            child: const Text('Add Form'),
            onPressed: () => resumeProvider.addProject(),
          ),
          ElevatedButton(
            child: const Text('Next'),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SkillsScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
