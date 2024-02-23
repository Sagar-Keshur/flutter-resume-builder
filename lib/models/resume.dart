// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_resume_builder/core/enums/gender.dart';

class Resume {
  String? id;
  String? uid;
  String? name;
  String? email;
  String? contactNumber;
  String? jobTitle;
  String? experience;
  String? skills;
  String? summary;
  DateTime? dob;
  Gender? gender;
  DateTime createdAt;

  Resume({
    this.id,
    this.uid,
    this.name,
    this.email,
    this.contactNumber,
    this.jobTitle,
    this.experience,
    this.skills,
    this.summary,
    this.dob,
    this.gender,
    required this.createdAt,
  });

  Resume copyWith({
    String? id,
    String? uid,
    String? name,
    String? email,
    String? contactNumber,
    String? jobTitle,
    String? experience,
    String? skills,
    String? summary,
    DateTime? dob,
    Gender? gender,
    DateTime? createdAt,
  }) {
    return Resume(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      jobTitle: jobTitle ?? this.jobTitle,
      experience: experience ?? this.experience,
      skills: skills ?? this.skills,
      summary: summary ?? this.summary,
      dob: dob ?? this.dob,
      gender: gender ?? this.gender,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'uid': uid,
      'name': name,
      'email': email,
      'contactNumber': contactNumber,
      'jobTitle': jobTitle,
      'experience': experience,
      'skills': skills,
      'summary': summary,
      'dob': dob?.millisecondsSinceEpoch,
      'gender': gender?.name,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Resume.fromMap(Map<String, dynamic> map) {
    return Resume(
      id: map['id'] != null ? map['id'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      contactNumber:
          map['contactNumber'] != null ? map['contactNumber'] as String : null,
      jobTitle: map['jobTitle'] != null ? map['jobTitle'] as String : null,
      experience:
          map['experience'] != null ? map['experience'] as String : null,
      skills: map['skills'] != null ? map['skills'] as String : null,
      summary: map['summary'] != null ? map['summary'] as String : null,
      dob: map['dob'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dob'] as int)
          : null,
      gender: map['gender'] != null ? Gender.fromString(map['gender']) : null,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Resume.fromJson(String source) =>
      Resume.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Resume(id: $id, uid: $uid, name: $name, email: $email, contactNumber: $contactNumber, jobTitle: $jobTitle, experience: $experience, skills: $skills, summary: $summary, dob: $dob, gender: $gender, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Resume other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.uid == uid &&
        other.name == name &&
        other.email == email &&
        other.contactNumber == contactNumber &&
        other.jobTitle == jobTitle &&
        other.experience == experience &&
        other.skills == skills &&
        other.summary == summary &&
        other.dob == dob &&
        other.gender == gender &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        uid.hashCode ^
        name.hashCode ^
        email.hashCode ^
        contactNumber.hashCode ^
        jobTitle.hashCode ^
        experience.hashCode ^
        skills.hashCode ^
        summary.hashCode ^
        dob.hashCode ^
        gender.hashCode ^
        createdAt.hashCode;
  }
}
