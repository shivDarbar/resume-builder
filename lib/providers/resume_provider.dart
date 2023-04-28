import 'package:flutter/cupertino.dart';
import 'package:resume_builder_app/models/education.dart';
import 'package:resume_builder_app/models/experience.dart';
import 'package:resume_builder_app/models/personalInfo.dart';

import '../models/project.dart';

class ResumeProvider with ChangeNotifier {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  var addressController = TextEditingController();
  var linkedInController = TextEditingController();
  var skillController = TextEditingController();

  var personalInfo = PersonalInfo(
      firstName: '',
      lastName: '',
      email: '',
      address: '',
      linkedIn: '',
      dateOfBirth: '');

  List<Education> educationList = [Education()];
  List<Experience> experienceList = [Experience()];
  List<Project> projectList = [Project()];
  List<String> skillList = [];

  addSkill() {
    skillList.add(skillController.text);
    skillController.clear();
    notifyListeners();
  }

  getPersonalInfo() {
    personalInfo = PersonalInfo(
      firstName: firstNameController.text,
      lastName: lastNameController.text,
      email: emailController.text,
      address: addressController.text,
      linkedIn: linkedInController.text,
      dateOfBirth: dateOfBirthController.text,
    );
    notifyListeners();
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

  addProject() {
    projectList.add(Project());
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

  addExperience() {
    experienceList.add(Experience());
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

  addEducation() {
    educationList.add(Education());
    notifyListeners();
  }

  removeEducation(int index) {
    educationList.removeAt(index);
    notifyListeners();
  }
}
