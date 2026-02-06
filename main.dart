import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentApp(),
    );
  }
}

// Student Model
class Student {
  final String name;
  final String rollNo;

  Student({required this.name, required this.rollNo});
}

class StudentApp extends StatefulWidget {
  const StudentApp({super.key});

  @override
  State<StudentApp> createState() => _StudentAppState();
}

class _StudentAppState extends State<StudentApp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollController = TextEditingController();

  List<Student> students = [];

  void addStudent() {
    if (nameController.text.isEmpty || rollController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    setState(() {
      students.add(
        Student(
          name: nameController.text,
          rollNo: rollController.text,
        ),
      );
    });

    nameController.clear();
    rollController.clear();
  }

  void deleteStudent(int index) {
    setState(() {
      students.removeAt(index);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    rollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 98, 192, 240),
      appBar: AppBar(
        title: const Text("Student Management System"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: rollController,
              decoration: const InputDecoration(
                labelText: "Roll Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addStudent,
              child: const Text("Add Student"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: students.isEmpty
                  ? const Center(child: Text("No students added"))
                  : ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(students[index].name),
                            subtitle:
                                Text("Roll No: ${students[index].rollNo}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteStudent(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
