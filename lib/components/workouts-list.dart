import 'package:flutter/material.dart';
import 'package:fitness_app/domain/workout.dart';

class WorkoutsList extends StatefulWidget {

  @override
  _WorkoutsListState createState() => _WorkoutsListState();
}

class _WorkoutsListState extends State<WorkoutsList> {

  @override
  void initState() {
    clearFilter();
    super.initState();
  }

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

  var filterOnlyMyWorkouts = false;
  var filterTitle = '';
  var filterTitleController = TextEditingController();
  var filterLevel = 'Any level';

  var filterText = '';
  var filterHeight = 0.0;

  List<Workout> filter() {
    setState(() {
      filterText = filterOnlyMyWorkouts ? 'My workouts' : 'All workouts';
      filterText += '/' + filterLevel;
      if (filterTitle.isNotEmpty) {
        filterText += '/' + filterTitle;
        filterHeight = 0;
      }
    });

    var list = workouts;
    return list;
  }

  List<Workout> clearFilter() {
    setState(() {
      filterText = 'All workouts/Any level';
      filterOnlyMyWorkouts = false;
      filterTitle = '';
      filterLevel = 'Any level';
      filterTitleController.clear();
      filterHeight = 0;
    });

    var list = workouts;
    return list;
  }

  @override
  Widget build(BuildContext context) {
    var workoutsList = Expanded(
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

    var filterInfo = Container(
      margin: EdgeInsets.only(top: 3, left: 7, right: 7, bottom: 5),
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.5)),
      height: 40,
      child: RaisedButton(
        child: Row(
          children: <Widget>[
            Icon(Icons.filter_list),
            Text(
              filterText,
              style: TextStyle(),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        onPressed: () {
          setState(() {
            filterHeight = (filterHeight == 0.0 ? 280.0 : 0.0);
          });
        },
      ),
    );

    var levelMenuItems = <String>[
      'Any level',
      "Beginner",
      'Intermediate',
      'Advanced'
    ].map((String value) {
      return new DropdownMenuItem<String>(
        value: value,
          child: new Text(value)
      );
    }).toList();

    var filterForm = AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 7),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SwitchListTile(
                title: const Text('Only my workouts'),
                value: filterOnlyMyWorkouts,
                onChanged: (bool val) => setState(() => filterOnlyMyWorkouts = val)),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Level'),
                items: levelMenuItems,
                value: filterLevel,
                onChanged: (String val) => setState(() => filterLevel = val),
              ),
              TextFormField(
                controller: filterTitleController,
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (String val) => setState(() => filterTitle = val),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        filter();
                      },
                      child: Text("Apply", style: TextStyle(color: Colors.white)),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {
                        clearFilter();
                      },
                      child: Text("Clear", style: TextStyle(color: Colors.white)),
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      height: filterHeight,
    );

    return Column(
      children: <Widget>[
        filterInfo,
        filterForm,
        workoutsList
      ],
    );
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
}