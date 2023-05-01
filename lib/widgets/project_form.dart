import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/resume_provider.dart';

class ProjectForm extends StatelessWidget {
  final int index;
  const ProjectForm({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    final mediaQuery = MediaQuery.of(context);

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: mediaQuery.size.shortestSide * 0.1, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            // Shadow for top-left corner
            BoxShadow(
              color: Colors.grey,
              offset: Offset(10, 10),
              blurRadius: 6,
              spreadRadius: 1,
            ),
            // Shadow for bottom-right corner
            BoxShadow(
              color: Colors.white12,
              offset: Offset(-10, -10),
              blurRadius: 6,
              spreadRadius: 1,
            ),
          ]),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Project Name'),
            onChanged: ((value) =>
                resumeProvider.updateProjectName(value, index)),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Summary'),
            onChanged: ((value) =>
                resumeProvider.updateProjectSummary(value, index)),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Project Link'),
            onChanged: ((value) =>
                resumeProvider.updateProjectLink(value, index)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: const Text('Remove Form'),
              onPressed: () {
                if (resumeProvider.projectList.isNotEmpty) {
                  resumeProvider.removeProject(index);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
