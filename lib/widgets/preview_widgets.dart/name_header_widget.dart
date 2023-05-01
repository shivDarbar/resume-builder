import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class NameHeaderWidget extends StatelessWidget {
  const NameHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    var personalInfo = resumeProvider.myResume.personalInfo;
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
            'PERSONAL INFO :',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Text(
          'Name: ${personalInfo.firstName} ${personalInfo.lastName}',
        ),
        Text(
          'Mo: ${personalInfo.mobileNo}',
        ),
        Text(
          'Email: ${personalInfo.email}',
        ),
        Text(
          'LinkedIn: ${personalInfo.linkedIn}',
        )
      ],
    );
  }
}
