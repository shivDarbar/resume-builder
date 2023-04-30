import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/resume_provider.dart';

class EducationPreviewWidget extends StatelessWidget {
  const EducationPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final educationList = resumeProvider.myResume.educationList;
    return SizedBox(
      height: (mediaQuery.size.height * 0.18) * educationList.length,
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
              'EDUCATION :',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: (mediaQuery.size.height * 0.1) * educationList.length,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: educationList
                  .map(
                    (education) => Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: mediaQuery.size.height * 0.08,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'College Name: ${education.collegeName}',
                            // style: const TextStyle(
                            //   fontSize: 15,
                            // ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Course: ${education.course}',
                            // style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'When: ${education.startDate!.year} to ${education.endDate!.year}',
                            // style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
