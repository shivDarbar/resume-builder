import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class SkillsPreviewWidget extends StatelessWidget {
  const SkillsPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var skillList = Provider.of<ResumeProvider>(context).myResume.skillList;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 5,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'SKILLS :',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: skillList
                .map((skill) => Container(
                      margin: const EdgeInsets.only(left: 5),
                      child: Row(
                        children: [
                          const Text('•'),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            skill,
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
