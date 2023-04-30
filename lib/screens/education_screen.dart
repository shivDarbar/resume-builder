import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';
import 'package:resume_builder_app/screens/experience_screen.dart';
import 'package:resume_builder_app/widgets/education_form.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var resumeProvider = Provider.of<ResumeProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'ADD YOUR EDUCATION',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: resumeProvider.educationList.length,
                itemBuilder: (context, index) {
                  return EducationForm(index: index);
                },
              ),
            ),
            ElevatedButton(
              child: const Text('Add another Form'),
              onPressed: () => resumeProvider.addEducation(context),
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
                      builder: (context) => const ExperienceScreen(),
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
