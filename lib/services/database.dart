import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/domain/workout.dart';

class DatabaseService {

  final CollectionReference _workoutCollection = Firestore.instance.collection('workouts');
  final CollectionReference _workoutSchedulesCollection = Firestore.instance.collection('workoutSchedules');

  Future addOrUpdateWorkout(WorkoutSchedule schedule) async {
    DocumentReference workoutRef = _workoutCollection.document(schedule.uid);
    return workoutRef.setData(schedule.toWorkoutMap()).then((_) async {
      var docId = workoutRef.documentID;
      await _workoutSchedulesCollection.document(docId).setData(schedule.toMap());
    });
  }

  Stream <List<Workout>> getWorkouts({ String level, String author }) {

    Query query;

    if (author != null) {
      query = _workoutCollection.where('author', isEqualTo: author);
    }
    else {
      query = _workoutCollection.where('isOnline', isEqualTo: true);
    }

    if (level != null) {
      query = query.where('level', isEqualTo: level);
    }

    return query.snapshots().map((QuerySnapshot data) =>
      data.documents.map((DocumentSnapshot document) => Workout.fromJson(document.documentID, document.data)).toList()
    );
  }
}