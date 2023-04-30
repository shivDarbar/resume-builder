import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class NameHeaderWidget extends StatelessWidget {
  const NameHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final resumeProvider = Provider.of<ResumeProvider>(context);
    var personalInfo = resumeProvider.myResume.personalInfo;
    return SizedBox(
      height: mediaQuery.size.height * 0.17,
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
              'PERSONAL INFO :',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Text(
            'Name: ${personalInfo.firstName} ${personalInfo.lastName}',
            // style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Mo: ${personalInfo.mobileNo}',
            // style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Email: ${personalInfo.email}',
            // style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'LinkedIn: ${personalInfo.linkedIn}',
            // style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
