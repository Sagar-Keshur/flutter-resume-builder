import 'package:flutter/material.dart';
import 'package:flutter_resume_builder/core/data/constants.dart';
import 'package:flutter_resume_builder/core/enums/gender.dart';
import 'package:flutter_resume_builder/models/resume.dart';
import 'package:flutter_resume_builder/provider/providers.dart';
import 'package:flutter_resume_builder/repositories/resume_repo.dart';

class FormProvider extends DefaultChangeNotifier {
  final ResumeRepository _repository = ResumeRepository();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController summary = TextEditingController();

  DateTime? dob;
  Gender selectedGender = Gender.male;

  String? id;

  List<Resume> resumes = [];

  Future<void> fetch() async {
    loading = true;

    resumes = await _repository.fetch();
    notify();

    loading = false;
  }

  void updateIndex({
    required int oldIndex,
    required int newIndex,
  }) {
    final Resume item = resumes.removeAt(oldIndex);

    resumes.insert(newIndex, item);
    notify();
  }

  Future<void> onSave() async {
    loading = true;

    Resume resume = Resume(
      id: id,
      uid: preferences.uid,
      name: name.text,
      email: email.text,
      contactNumber: contactNumber.text,
      jobTitle: jobTitle.text,
      experience: experience.text,
      skills: skills.text,
      summary: summary.text,
      dob: dob,
      gender: selectedGender,
      createdAt: DateTime.now(),
    );

    if (id != null) {
      await _repository.update(resume);
      int index = resumes.indexWhere((element) => element.id == resume.id);
      resumes[index] = resume;
      notify();

      clear();
    } else {
      String id = await _repository.add(resume);
      resume = resume.copyWith(id: id);
      resumes.add(resume);
      notify();
    }

    loading = false;
  }

  void onEdit(Resume value) {
    id = value.id;

    if (value.name != null) {
      name.text = value.name!;
    }
    if (value.email != null) {
      email.text = value.email!;
    }
    if (value.contactNumber != null) {
      contactNumber.text = value.contactNumber!;
    }
    if (value.jobTitle != null) {
      jobTitle.text = value.jobTitle!;
    }
    if (value.experience != null) {
      experience.text = value.experience!;
    }
    if (value.skills != null) {
      skills.text = value.skills!;
    }
    if (value.summary != null) {
      summary.text = value.summary!;
    }
    if (value.dob != null) {
      dob = value.dob!;
    }
    if (value.gender != null) {
      selectedGender = value.gender!;
    }
    notify();
  }

  void onDelete(String id) {
    loading = true;
    _repository.delete(id);
    int index = resumes.indexWhere((element) => element.id == id);
    resumes.removeAt(index);
    loading = false;
  }

  void setDob(DateTime value) {
    dob = value;
    notify();
  }

  void setGender(Gender? value) {
    selectedGender = value!;
    notify();
  }

  void clear() {
    id = null;
    name.clear();
    email.clear();
    contactNumber.clear();
    jobTitle.clear();
    experience.clear();
    skills.clear();
    summary.clear();
    dob = null;
    selectedGender = Gender.male;
    notify();
  }
}
