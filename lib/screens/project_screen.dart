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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'ADD YOUR PROJECTS',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: resumeProvider.projectList.length,
                itemBuilder: (context, index) {
                  return ProjectForm(index: index);
                },
              ),
            ),
            ElevatedButton(
              child: const Text('Add Another Form'),
              onPressed: () => resumeProvider.addProject(context),
            ),
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {
                var anyFieldEmpty = resumeProvider.checkIfProjectFieldIsEmpty();
                if (!anyFieldEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SkillsScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Please fill all the Details to continue.',
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
