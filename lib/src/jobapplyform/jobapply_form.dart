import 'package:flutter/material.dart';

class JobApplicationPage extends StatefulWidget {
  final String jobTitle;
  final String companyName;

  const JobApplicationPage({
    Key? key,
    required this.jobTitle,
    required this.companyName,
  }) : super(key: key);

  @override
  _JobApplicationPageState createState() => _JobApplicationPageState();
}

class _JobApplicationPageState extends State<JobApplicationPage> {
  // Add TextEditingController for each form field
  final TextEditingController resumeController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController educationController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController expInJavaController = TextEditingController();
  final TextEditingController expInJspController = TextEditingController();
  final TextEditingController interviewDateController = TextEditingController();
  final TextEditingController javaValidationController = TextEditingController();
  final TextEditingController lastSalaryController = TextEditingController();
  final TextEditingController expectedSalaryController = TextEditingController();

  // You can add more controllers based on your needs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply for ${widget.jobTitle} at ${widget.companyName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Job Title: ${widget.jobTitle}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Company Name: ${widget.companyName}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: resumeController,
                decoration: InputDecoration(labelText: 'Resume'),
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Location'),
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                controller: educationController,
                decoration: InputDecoration(labelText: 'Education'),
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                controller: experienceController,
                decoration: InputDecoration(labelText: 'Experience'),
                // Add necessary validators and onSave functions
              ),
              // Add more form fields based on your requirements
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Handle the form submission here
                  submitApplication();
                },
                child: Text('Submit Application'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void submitApplication() {
    // Implement the logic to submit the application
    // Retrieve data from controllers and create an application object
    // You can use the data to update the model or send it to a backend server
  }
}
