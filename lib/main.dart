import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// ---------- Student data ----------
// Plain data class: every field is final, so a Student never changes.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}


const List<Student> students = [
  Student(
    name: 'Ronel Silvosa',
    course: 'BSIT',
    yearLevel: 2,
    email: 'Ronel.silvosa@csucc.edu.ph',
  ),
  Student(
    name: 'John Doe',
    course: 'BSCS',
    yearLevel: 3,
    email: 'john.doe@csucc.edu.ph',
  ),
  Student(
    name: 'Jane Smith',
    course: 'BSIS',
    yearLevel: 1,
    email: 'jane.smith@csucc.edu.ph',
  ),
  Student(
    name: 'Bob Johnson',
    course: 'BSECE',
    yearLevel: 4,
    email: 'bob.johnson@csucc.edu.ph',
  ),
    Student(
    name: 'Your Own Name Here',
    course: 'BSIT',
    yearLevel: 2,
    email: 'name@csucc.edu.ph',
  ),
];

// ---------- App ----------
// Stateless because it only builds the app from fixed settings.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.teal, // customization 1: theme seed color
        useMaterial3: true,
      ),
      home: const DirectoryScreen(),
    );
  }
}


// ---------- Screen ----------
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Directory')),
      body: ListView(
        children: [
          const SectionHeader(title: 'Students'),
          ...students.map((s) => StudentCard(student: s)),
        ],
      ),
    );
  }
}

// ---------- Section header ----------
// Stateless because it only displays the title it receives.
// ---------- Section header ----------
// Stateless because it only displays the title it receives.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}

// ---------- Info row ----------
// Stateless because it only displays the icon and text it receives.
// ---------- Info row ----------
// Stateless because it only displays the icon and text it receives.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 8), // small gap between icon and text
        Text(text),
      ],
    );
  }
}

// ---------- Student card ----------
// Stateless because it only displays the Student it receives.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
      return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            CircleAvatar(child: Text(student.name[0])),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( 
                    student.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(student.course),
                  InfoRow(icon: Icons.school, text: 'Year ${student.yearLevel}'),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
