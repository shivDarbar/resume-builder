// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:resume_builder_app/models/education.dart';
import 'package:resume_builder_app/models/experience.dart';
import 'package:resume_builder_app/models/other_info.dart';
import 'package:resume_builder_app/models/personalInfo.dart';
import 'package:resume_builder_app/models/resume.dart';

import '../models/project.dart';

class ResumeProvider with ChangeNotifier {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var mobileNoController = TextEditingController();
  var linkedInController = TextEditingController();
  var skillController = TextEditingController();
  var summaryController = TextEditingController();
  var careerObjectiveController = TextEditingController();

  var personalInfo = PersonalInfo(
      firstName: '', lastName: '', email: '', linkedIn: '', mobileNo: '');

  List<Education> educationList = [Education()];
  List<Experience> experienceList = [Experience()];
  List<Project> projectList = [Project()];
  List<String> skillList = [];

  OtherInfo otherInfo = OtherInfo(
    careerObjective: '',
    summary: '',
  );

  Resume myResume = Resume(
    personalInfo: PersonalInfo(
      firstName: '',
      lastName: '',
      email: '',
      linkedIn: '',
      mobileNo: '',
    ),
    otherInfo: OtherInfo(
      careerObjective: '',
      summary: '',
    ),
    educationList: [],
    experienceList: [],
    projectList: [],
    skillList: [],
  );

  getResumeDetails() {
    myResume = Resume(
      personalInfo: personalInfo,
      educationList: educationList,
      experienceList: experienceList,
      projectList: projectList,
      skillList: skillList,
      otherInfo: otherInfo,
    );
    notifyListeners();
  }

  getOtherInfo(BuildContext context) {
    if (careerObjectiveController.text.isNotEmpty &&
        summaryController.text.isNotEmpty) {
      otherInfo = OtherInfo(
        careerObjective: careerObjectiveController.text,
        summary: summaryController.text,
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the details first.'),
        ),
      );
      return false;
    }
  }

  addSkill() {
    if (skillController.text.isNotEmpty) {
      skillList.add(skillController.text);
    }
    skillController.clear();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  removeSkill(String skill) {
    skillList.remove(skill);
    notifyListeners();
  }

  getPersonalInfo(BuildContext context) {
    if (firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        linkedInController.text.isNotEmpty &&
        mobileNoController.text.isNotEmpty) {
      personalInfo = PersonalInfo(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        linkedIn: linkedInController.text,
        mobileNo: mobileNoController.text,
      );
      return true;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the details first.'),
        ),
      );
      return false;
    }
  }

  updateProjectName(String projectName, int index) {
    projectList[index].projectName = projectName;
    notifyListeners();
  }

  updateProjectLink(String link, int index) {
    projectList[index].projectLink = link;
    notifyListeners();
  }

  updateProjectSummary(String summary, int index) {
    projectList[index].summary = summary;
    notifyListeners();
  }

  addProject(BuildContext context) {
    if (projectList.last.projectName.isNotEmpty ||
        projectList.last.projectLink.isNotEmpty ||
        projectList.last.summary.isNotEmpty) {
      projectList.add(Project());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the details first.'),
        ),
      );
    }
    notifyListeners();
  }

  removeProject(int index) {
    projectList.removeAt(index);
    notifyListeners();
  }

  updateCompanyName(String companyName, int index) {
    experienceList[index].companyName = companyName;
    notifyListeners();
  }

  updateDesignation(String designation, int index) {
    experienceList[index].designation = designation;
    notifyListeners();
  }

  updateExperienceStartDate(DateTime startDate, int index) {
    experienceList[index].startDate = startDate;
    notifyListeners();
  }

  updateExperienceEndDate(DateTime endDate, int index) {
    experienceList[index].endDate = endDate;
    notifyListeners();
  }

  addExperience(BuildContext context) {
    if (experienceList.last.companyName.isNotEmpty ||
        experienceList.last.designation.isNotEmpty ||
        experienceList.last.startDate != null ||
        experienceList.last.endDate != null) {
      experienceList.add(Experience());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all the details first.'),
        ),
      );
    }
    notifyListeners();
  }

  removeExperience(int index) {
    experienceList.remove(Experience());
    notifyListeners();
  }

  updateCollegeName(String clgName, int index) {
    educationList[index].collegeName = clgName;
    notifyListeners();
  }

  updateCourse(String course, int index) {
    educationList[index].course = course;
    notifyListeners();
  }

  updateEducationStartDate(DateTime startDate, int index) {
    educationList[index].startDate = startDate;
    notifyListeners();
  }

  updateEducationEndDate(DateTime endDate, int index) {
    endDate = educationList[index].endDate = endDate;
    notifyListeners();
  }

  addEducation(BuildContext context) {
    if (educationList.last.collegeName.isNotEmpty ||
        educationList.last.course.isNotEmpty ||
        educationList.last.startDate != null ||
        educationList.last.endDate != null) {
      educationList.add(Education());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all the details first.')));
    }
    notifyListeners();
  }

  checkIfEducationFieldIsEmpty() {
    if (educationList.last.collegeName.isNotEmpty ||
        educationList.last.course.isNotEmpty ||
        educationList.last.startDate != null ||
        educationList.last.endDate != null) {
      return false;
    } else {
      return true;
    }
  }

  checkIfExperienceFieldIsEmpty() {
    if (experienceList.last.companyName.isNotEmpty ||
        experienceList.last.designation.isNotEmpty ||
        experienceList.last.startDate != null ||
        experienceList.last.endDate != null) {
      return false;
    } else {
      return true;
    }
  }

  checkIfProjectFieldIsEmpty() {
    if (projectList.last.projectName.isNotEmpty ||
        projectList.last.projectLink.isNotEmpty ||
        projectList.last.summary.isNotEmpty) {
      return false;
    } else {
      return true;
    }
  }

  removeEducation(int index) {
    educationList.removeAt(index);
    notifyListeners();
  }
}
