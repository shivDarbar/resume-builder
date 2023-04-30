import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class ProjectPreviewWidget extends StatelessWidget {
  const ProjectPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final projectList = resumeProvider.myResume.projectList;
    return SizedBox(
      height: (mediaQuery.size.height * 0.18) * projectList.length,
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
              'PROJECTS :',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          SizedBox(
            height: (mediaQuery.size.height * 0.1) * projectList.length,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: projectList
                  .map(
                    (project) => Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: mediaQuery.size.height * 0.09,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name: ${project.projectName}',
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Summary: ${project.summary}',
                            // style: Theme.of(context).textTheme.bodyText1,
                          ),
                          Text(
                            'Link: ${project.projectLink}',
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
