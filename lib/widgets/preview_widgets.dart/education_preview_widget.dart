import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/resume_provider.dart';

class EducationPreviewWidget extends StatelessWidget {
  const EducationPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final educationList = resumeProvider.myResume.educationList;

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
            'EDUCATION :',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: educationList
                .map(
                  (education) => Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'College Name: ${education.collegeName}',
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Course: ${education.course}',
                        ),
                        Text(
                          'When: ${education.startDate!.year} to ${education.endDate!.year}',
                        ),
                        if (education != educationList.last)
                          const Divider(
                            color: Colors.black38,
                          ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
