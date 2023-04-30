import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/resume_provider.dart';

class ExperiencePreviewWidget extends StatelessWidget {
  const ExperiencePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final experienceList = resumeProvider.myResume.experienceList;
    return SizedBox(
      height: (mediaQuery.size.height * 0.18) * experienceList.length,
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
              'EXPERIENCE :',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: (mediaQuery.size.height * 0.1) * experienceList.length,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: experienceList
                  .map(
                    (experience) => Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: mediaQuery.size.height * 0.09,
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
                            // style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'When: ${experience.startDate!.month}-${experience.startDate!.year} to ${experience.endDate!.month}-${experience.endDate!.year}',
                            // style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            height: 10,
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
