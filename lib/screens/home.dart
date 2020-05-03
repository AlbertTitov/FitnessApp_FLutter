import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness_app/components/active-workouts.dart';
import 'package:fitness_app/components/workouts-list.dart';
import 'package:fitness_app/services/auth.dart';
import 'package:flutter/material.dart';
import 'add-workout.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int sectionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var navigationBar = CurvedNavigationBar(
      items: const <Widget>[Icon(Icons.fitness_center), Icon(Icons.search)],
      index: 0,
      height: 50,
      color: Colors.white.withOpacity(0.5),
      buttonBackgroundColor: Colors.white,
      backgroundColor: Colors.white.withOpacity(0.5),
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 500),
      onTap: (int index) {
        setState(() => sectionIndex = index);
      },
    );

    return Container(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(50, 65, 80, 0.5),
            appBar: AppBar(
              title: Text('FitnessApp //' +
                  (sectionIndex == 0 ? 'Active workouts' : 'Find workouts')),
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
            body: sectionIndex == 0 ? ActiveWorkouts() : WorkoutsList(),
            bottomNavigationBar: navigationBar,
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.white,
              foregroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => AddWorkout()));
              },
            )));
  }
}
