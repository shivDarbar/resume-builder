import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/resume_provider.dart';

class ExperiencePreviewWidget extends StatelessWidget {
  const ExperiencePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final experienceList = resumeProvider.myResume.experienceList;
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
            'EXPERIENCE :',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: experienceList
                .map(
                  (experience) => Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Company Name: ${experience.companyName}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Role: ${experience.designation}',
                        ),
                        Text(
                          'When: ${experience.startDate!.month}-${experience.startDate!.year} to ${experience.endDate!.month}-${experience.endDate!.year}',
                        ),
                        if (experience != experienceList.last)
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
