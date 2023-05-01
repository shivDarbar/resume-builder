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
    final mediaQuery = MediaQuery.of(context);
    var isLandScape = mediaQuery.orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ADD YOUR EDUCATION'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Add another Form'),
                    onPressed: () => resumeProvider.addEducation(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
