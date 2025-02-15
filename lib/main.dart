import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
    );
  }
}

@immutable
class Person {
  final String name;
  final int age;
  final String emoji;

  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

const List<Person> people = [
  Person(name: 'John', age: 25, emoji: '👨'),
  Person(name: 'Jane', age: 30, emoji: '👩'),
  Person(name: 'Bob', age: 35, emoji: '👨'),
];

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PersonDetails(
                person: people[index],
              ),
            ),
          ),
          title: Text(people[index].name),
          subtitle: Text('${people[index].age} years old'),
          leading: Text(
            people[index].emoji,
            style: TextStyle(fontSize: 40),
          ),
          trailing: Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}

class PersonDetails extends StatelessWidget {
  const PersonDetails({super.key, required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          person.emoji,
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Center(
        child: Column(
          spacing: 16.0,
          children: [
            Text(person.name),
            Text('${person.age} years old'),
          ],
        ),
      ),
    );
  }
}
