import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class SummaryPreviewWidget extends StatelessWidget {
  const SummaryPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var summary =
        Provider.of<ResumeProvider>(context).myResume.otherInfo.summary;
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
              'SUMMARY :',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Text(
            summary,
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
