import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class ProjectPreviewWidget extends StatelessWidget {
  const ProjectPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final projectList = resumeProvider.myResume.projectList;

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
            'PROJECTS :',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: projectList
                .map(
                  (project) => Container(
                    margin: const EdgeInsets.only(left: 5),
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
                        ),
                        Text(
                          'Link: ${project.projectLink}',
                        ),
                        if (project != projectList.last)
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
