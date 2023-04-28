import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder_app/providers/resume_provider.dart';

class EducationForm extends StatefulWidget {
  final int index;
  const EducationForm({Key? key, required this.index}) : super(key: key);

  @override
  State<EducationForm> createState() => _EducationFormState();
}

TextEditingController startDateController = TextEditingController();
TextEditingController endDateController = TextEditingController();

class _EducationFormState extends State<EducationForm> {
  @override
  void initState() {
    startDateController = TextEditingController();
    endDateController = TextEditingController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var resumeProvider = Provider.of<ResumeProvider>(context);
    return Container(
      margin: const EdgeInsets.all(10),
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
            decoration: const InputDecoration(labelText: 'Collage Name'),
            onChanged: ((value) =>
                resumeProvider.updateCollageName(value, widget.index)),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Course Name'),
            onChanged: ((value) =>
                resumeProvider.updateCourse(value, widget.index)),
          ),
          TextFormField(
            readOnly: true,
            controller: startDateController,
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2030),
              ).then(
                (startDate) {
                  var format = DateFormat('dd-MM-yyyy');
                  setState(() {
                    startDateController.text = format.format(startDate!);
                  });

                  resumeProvider.updateEducationStartDate(
                    startDate!,
                    widget.index,
                  );
                },
              );
            },
            decoration: const InputDecoration(labelText: 'Start Date'),
            onChanged: ((value) =>
                resumeProvider.updateCourse(value, widget.index)),
          ),
          TextFormField(
            readOnly: true,
            controller: endDateController,
            onTap: () async {
              await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1990),
                lastDate: DateTime(2030),
              ).then(
                (endDate) {
                  var format = DateFormat('dd-MM-yyyy');
                  setState(() {
                    endDateController.text = format.format(endDate!);
                  });

                  resumeProvider.updateEducationEndDate(
                    endDate!,
                    widget.index,
                  );
                },
              );
            },
            decoration: const InputDecoration(labelText: 'End Date'),
            onChanged: ((value) =>
                resumeProvider.updateCourse(value, widget.index)),
          ),
          ElevatedButton(
            child: const Text('Remove Form'),
            onPressed: () => resumeProvider.removeEducation(widget.index),
          ),
        ],
      ),
    );
  }
}
