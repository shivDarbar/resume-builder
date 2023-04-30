import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class SkillsPreviewWidget extends StatelessWidget {
  const SkillsPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var skillList = Provider.of<ResumeProvider>(context).myResume.skillList;
    return SizedBox(
      height: (mediaQuery.size.height * 0.046) * skillList.length,
      width: double.infinity,
      child: Column(
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
          SizedBox(
            height: (mediaQuery.size.height * 0.03) * skillList.length,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: skillList
                  .map((skill) => Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: mediaQuery.size.height * 0.03,
                        child: Row(
                          children: [
                            const Text('•'),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              skill,
                              // style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
