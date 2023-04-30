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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'ADD YOUR EXPERIENCE',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: resumeProvider.experienceList.length,
                itemBuilder: (context, index) {
                  return ExperienceForm(index: index);
                },
              ),
            ),
            ElevatedButton(
              child: const Text('Add Another Form'),
              onPressed: () => resumeProvider.addExperience(context),
            ),
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () {
                var anyFieldEmpty =
                    resumeProvider.checkIfEducationFieldIsEmpty();
                if (!anyFieldEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProjectScreen(),
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
