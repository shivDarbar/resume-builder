import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class CareerObjectivePreviewWidget extends StatelessWidget {
  const CareerObjectivePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resumeProvider = Provider.of<ResumeProvider>(context);
    return Container(
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
              'CAREER OBJECTIVE :',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Text(
            resumeProvider.myResume.otherInfo.careerObjective,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
