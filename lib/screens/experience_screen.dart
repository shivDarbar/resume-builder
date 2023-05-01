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
    final mediaQuery = MediaQuery.of(context);
    var isLandScape = mediaQuery.orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ADD YOUR EXPERIENCE'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: resumeProvider.experienceList.length,
                itemBuilder: (context, index) {
                  return ExperienceForm(index: index);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Add Another Form'),
                    onPressed: () => resumeProvider.addExperience(context),
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
