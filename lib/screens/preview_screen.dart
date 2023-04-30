import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:resume_builder_app/widgets/preview_widgets.dart/experience_preview_widget.dart';
import 'package:resume_builder_app/widgets/preview_widgets.dart/name_header_widget.dart';
import 'package:resume_builder_app/widgets/preview_widgets.dart/career_objective_preview_widget.dart.dart';
import 'package:resume_builder_app/widgets/preview_widgets.dart/project_preview_widget.dart';
import 'package:resume_builder_app/widgets/preview_widgets.dart/skills_preview_widget.dart';
import 'package:resume_builder_app/widgets/preview_widgets.dart/summary_preview_widget.dart';

import '../widgets/preview_widgets.dart/education_preview_widget.dart';

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  late List<Widget> _tiles;

  @override
  void initState() {
    super.initState();
    _tiles = <Widget>[
      const NameHeaderWidget(),
      const SkillsPreviewWidget(),
      const ProjectPreviewWidget(),
      const EducationPreviewWidget(),
      const ExperiencePreviewWidget(),
      const CareerObjectivePreviewWidget(),
      const SummaryPreviewWidget(),
    ];
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      Widget row = _tiles.removeAt(oldIndex);
      _tiles.insert(newIndex, row);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var wrap = ReorderableWrap(
      spacing: 8.0,
      runSpacing: 4.0,
      padding: const EdgeInsets.all(8),
      onReorder: _onReorder,
      children: _tiles,
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin:
                EdgeInsets.symmetric(horizontal: mediaQuery.size.width * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'RESUME',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                wrap,
                const Divider(
                  thickness: 5,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'DECLARATION :',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const Text(
                    'I hereby declare that the above mentioned information is correct up to my knowledge and i bear the responsibility for the correctness of the above mentioned particulars.'),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Yours Sincerely,',
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            '[SHIVRAJ VARU]',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
