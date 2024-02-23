import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_resume_builder/core/data/constants.dart';
import 'package:flutter_resume_builder/models/resume.dart';

class ResumeRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String _collection = 'Resumes';

  Future<String> add(Resume value) async {
    String id = _firestore.collection(_collection).doc().id;
    value = value.copyWith(
      id: id,
      uid: preferences.uid,
    );
    await _firestore.collection(_collection).doc(id).set(value.toMap());
    return id;
  }

  Future<void> update(Resume value) {
    return _firestore
        .collection(_collection)
        .doc(value.id)
        .update(value.toMap());
  }

  Future<void> delete(String id) {
    return _firestore.collection(_collection).doc(id).delete();
  }

  Future<List<Resume>> fetch() {
    return _firestore
        .collection(_collection)
        .where('uid', isEqualTo: preferences.uid)
        .orderBy('createdAt', descending: true)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return Resume.fromMap(snapshot.data() ?? {});
          },
          toFirestore: (value, options) => value.toMap(),
        )
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());
  }
}
