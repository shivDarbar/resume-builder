import 'package:resume_builder_app/models/education.dart';
import 'package:resume_builder_app/models/experience.dart';
import 'package:resume_builder_app/models/other_info.dart';
import 'package:resume_builder_app/models/personalInfo.dart';
import 'package:resume_builder_app/models/project.dart';

class Resume {
  PersonalInfo personalInfo;
  List<Education> educationList;
  List<Experience> experienceList;
  List<Project> projectList;
  List<String> skillList;
  OtherInfo otherInfo;

  Resume({
    required this.personalInfo,
    required this.educationList,
    required this.experienceList,
    required this.projectList,
    required this.skillList,
    required this.otherInfo,
  });
}
