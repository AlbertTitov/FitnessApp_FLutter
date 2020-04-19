import 'package:fitness_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/domain/workout.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Color.fromRGBO(50, 65, 80, 0.5),
      appBar: AppBar(
        title: Text('FitnessApp'),
        leading: Icon(Icons.fitness_center),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                AuthService().logOut();
              },
              icon: Icon(
                Icons.supervised_user_circle,
                color: Colors.white,
              ),
              label: SizedBox.shrink())
        ],
      ),
      body: WorkoutsList(),
    ));
  }
}

class WorkoutsList extends StatelessWidget {
  final workouts = <Workout>[
    Workout(
        title: 'GoldGym',
        author: 'Arnold Swarchenegger',
        description: 'Very cool place to go to',
        level: 'The highest'),
    Workout(
        title: 'The Middle Earth Gym',
        author: 'Arnold Swarchenegger',
        description: 'Very cool place to go to',
        level: 'Medium'),
    Workout(
        title: 'The Middle Earth Gym',
        author: 'Arnold Swarchenegger',
        description: 'Very cool place to go to',
        level: 'Begiiner'),
    Workout(
        title: 'The Middle Earth Gym',
        author: 'Arnold Swarchenegger',
        description: 'Very cool place to go to',
        level: 'Medium'),
    Workout(
        title: 'The Middle Earth Gym',
        author: 'Arnold Swarchenegger',
        description: 'Very cool place to go to',
        level: 'The highest'),
    Workout(
        title: 'The Middle Earth Gym',
        author: 'Arnold Swarchenegger',
        description: 'Very cool place to go to',
        level: 'Begiiner'),
    Workout(
        title: 'The Middle Earth Gym',
        author: 'Arnold Swarchenegger',
        description: 'Very cool place to go to',
        level: 'The highest'),
    Workout(
        title: 'IronGym',
        author: 'Jean Claude Van Damm',
        description: 'Not so cool place to go',
        level: 'Begiiner')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, i) {
            return Card(
              elevation: 2,
              margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                decoration:
                    BoxDecoration(color: Color.fromRGBO(50, 65, 85, 0.8)),
                child: ListTile(
                  leading: Container(
                    padding: EdgeInsets.only(right: 6),
                    child: Icon(Icons.adb,
                        color: Theme.of(context).textTheme.title.color),
                    decoration: BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.white24)),
                    ),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  title: Text(
                    workouts[i].title,
                    style: TextStyle(
                        color: Theme.of(context).textTheme.title.color,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right,
                      color: Theme.of(context).textTheme.title.color),
                  subtitle: subtitle(context, workouts[i]),
                ),
              ),
            );
          }),
    );
  }
}

Widget subtitle(BuildContext context, Workout workout) {
  var color = Colors.grey;
  double indicatorLevel = 0;
  switch (workout.level) {
    case 'Begiiner':
      color = Colors.green;
      indicatorLevel = 0.33;
      break;
    case 'Medium':
      color = Colors.amber;
      indicatorLevel = 0.66;
      break;
    case 'The highest':
      color = Colors.deepOrange;
      indicatorLevel = 1;
      break;
  }
  return Row(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: LinearProgressIndicator(
          backgroundColor: Theme.of(context).textTheme.title.color,
          value: indicatorLevel,
          valueColor: AlwaysStoppedAnimation(color),
        ),
      ),
      SizedBox(width: 10),
      Expanded(
          flex: 3,
          child: Text(workout.level,
              style: TextStyle(color: Theme.of(context).textTheme.title.color)))
    ],
  );
}
