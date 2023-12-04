import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';

import 'package:pdf/widgets.dart' as pw;

class ResumeBuilder extends StatefulWidget {
  const ResumeBuilder({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResumeBuilderState createState() => _ResumeBuilderState();
}

class _ResumeBuilderState extends State<ResumeBuilder> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController skillsController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resume Builder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personal Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Professional Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Skills',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: skillsController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Skills'),
              ),
              const SizedBox(height: 20),
              const Text(
                'Work Experience',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: experienceController,
                maxLines: 3,
                decoration: const InputDecoration(labelText: 'Experience'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: generateResumePDF,
                child: const Text('Generate PDF'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> generateResumePDF() async {
    final pdf = pw.Document();

    // Access the entered data using the controllers
    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String description = descriptionController.text;
    String skills = skillsController.text;
    String experience = experienceController.text;

    // Create a resume widget tree
    final resume = pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Header(
          level: 1,
          text: 'Resume',
        ),
        pw.Divider(),
        pw.Paragraph(
          text: 'Name: $name',
        ),
        pw.Paragraph(
          text: 'Email: $email',
        ),
        pw.Paragraph(
          text: 'Phone: $phone',
        ),
        pw.Divider(),
        pw.Header(
          level: 2,
          text: 'Professional Summary',
        ),
        pw.Paragraph(
          text: description,
        ),
        pw.Divider(),
        pw.Header(
          level: 2,
          text: 'Skills',
        ),
        pw.Paragraph(
          text: skills,
        ),
        pw.Divider(),
        pw.Header(
          level: 2,
          text: 'Work Experience',
        ),
        pw.Paragraph(
          text: experience,
        ),
      ],
    );
    // Add the resume widget tree to the PDF
    pdf.addPage(pw.Page(
      build: (pw.Context context) => pw.Center(
        child: resume,
      ),
    ));

    // Save the PDF to a file
    final file = File('${name}_resume.pdf');
    await file.writeAsBytes(await pdf.save());

    // Show a dialog to inform the user that the PDF is saved
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Resume PDF Generated'),
          content: Text('Your resume PDF has been saved to ${file.path}'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
