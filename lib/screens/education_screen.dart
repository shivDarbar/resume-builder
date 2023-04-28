import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';
import 'package:resume_builder_app/screens/skills_screen.dart';
import 'package:resume_builder_app/widgets/education_form.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var resumeProvider = Provider.of<ResumeProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Education'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: resumeProvider.educationList.length,
                itemBuilder: (context, index) {
                  return EducationForm(index: index);
                },
              ),
            ),
            ElevatedButton(
              child: const Text('Add Form'),
              onPressed: () => resumeProvider.addEducation(),
            ),
            ElevatedButton(
              child: const Text('Next'),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SkillsScreen())),
            ),
          ],
        )
        // },
        // ),
        );
  }
}
