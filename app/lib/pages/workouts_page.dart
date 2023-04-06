import 'package:flutter/material.dart';

class WorkoutsPage extends StatefulWidget {
  const WorkoutsPage({Key? key}) : super(key: key);

  @override
  _WorkoutsPageState createState() => _WorkoutsPageState();
}

class _WorkoutsPageState extends State<WorkoutsPage> {
  List<Workout> _workouts = [    Workout('Push-ups', 10, 'images/pushups.jpg'),    Workout('Sit-ups', 15, 'images/situps.jpg'),    Workout('Squats', 20, 'images/squats.jpg'),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
      ),
      body: ListView.builder(
        itemCount: _workouts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkoutDetailsPage(workout: _workouts[index]),
                ),
              );
            },
            child: Card(
              child: Row(
                children: [
                  Image.asset(
                    _workouts[index].imagePath,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _workouts[index].name,
                          style: TextStyle(fontSize: 24),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '${_workouts[index].experienceValue} xp',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddWorkoutPage(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Workout {
  final String name;
  final int experienceValue;
  final String imagePath;

  Workout(this.name, this.experienceValue, this.imagePath);
}

class WorkoutDetailsPage extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailsPage({Key? key, required this.workout}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            workout.imagePath,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            '${workout.experienceValue} xp',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}

class AddWorkoutPage extends StatefulWidget {
  const AddWorkoutPage({Key? key}) : super(key: key);

  @override
  _AddWorkoutPageState createState() => _AddWorkoutPageState();
}

class _AddWorkoutPageState extends State<AddWorkoutPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _experienceValueController = TextEditingController();
  TextEditingController _imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Workout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Workouts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to the screen for adding a new workout
              },
              child: Text('Add Workout'),
            ),
            SizedBox(height: 16),
            Text(
              'Select an existing workout:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedWorkout,
              items: [
                DropdownMenuItem(
                  child: Text('Workout 1'),
                  value: 'Workout 1',
                ),
                DropdownMenuItem(
                  child: Text('Workout 2'),
                  value: 'Workout 2',
                ),
                DropdownMenuItem(
                  child: Text('Workout 3'),
                  value: 'Workout 3',
                ),
              ],
              onChanged: (value) {
                setState(() {
                  selectedWorkout = value!;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'Experience Points: 250',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'Level: 5',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
