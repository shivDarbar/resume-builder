import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';
import 'package:resume_builder_app/screens/other_info_screen.dart';
import 'package:resume_builder_app/widgets/my_text_field.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Skills'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MyTextField(
            controller: resumeProvider.skillController,
            // onSubmitted: resumeProvider.addSkill(),

            hintText: 'Skill',
            // onChanged: resumeProvider.addSkill(),
          ),
          if (resumeProvider.skillList.isNotEmpty)
            // SizedBox(
            //   height: 100,
            //   child: ListView.builder(
            //       itemBuilder: ((context, index) => ListTile(
            //             title: Text(resumeProvider.skillList[index]),
            //           ))),
            // )
            chipList(resumeProvider),
          ElevatedButton(
            onPressed: () {
              resumeProvider.addSkill();
            },
            child: const Text(
              'Add Skill',
            ),
          ),
          ElevatedButton(
            child: const Text('Next'),
            onPressed: () {
              if (resumeProvider.skillList.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const OtherInfoScreen(),
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
    );
  }

  chipList(ResumeProvider resumeProvider) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: resumeProvider.skillList
          .map(
            (skill) => _buildChip(
              skill,
              Colors.green,
              resumeProvider,
            ),
          )
          .toList(),
    );
  }

  Widget _buildChip(String label, Color color, ResumeProvider resumeProvider) {
    return Chip(
      labelPadding: const EdgeInsets.all(2.0),
      avatar: CircleAvatar(
        backgroundColor: Colors.white70,
        child: Text(label[0].toUpperCase()),
      ),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      onDeleted: () {
        resumeProvider.removeSkill(label);
      },
      deleteIcon: const Icon(Icons.close),
      backgroundColor: color,
      elevation: 6.0,
      shadowColor: Colors.grey[60],
      padding: const EdgeInsets.all(8.0),
    );
  }
}
