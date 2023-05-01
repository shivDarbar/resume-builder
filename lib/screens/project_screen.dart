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
    final mediaQuery = MediaQuery.of(context);
    var isLandScape = mediaQuery.orientation == Orientation.landscape;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ADD YOUR PROJECTS'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: resumeProvider.projectList.length,
                itemBuilder: (context, index) {
                  return ProjectForm(index: index);
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
                    onPressed: () => resumeProvider.addProject(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: const Text('Next'),
                    onPressed: () {
                      var anyFieldEmpty =
                          resumeProvider.checkIfProjectFieldIsEmpty();
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
