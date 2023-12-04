import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ApplyJob {
  String juname;
  String jumail;
  String jucompny;
  String jutitle;
  String juresume;
  String jurelocation;
  String jueducation;
  String juexperience;
  String juexpinjava;
  String juexpjsp;
  String juinterviewdate;
  String jujavavalid;
  String jujobtitle;
  String jucompanyname;
  String description;
  String juphone;
  String julastsal;
  String juexpecsalary;
  String empid;
  String uid;
  String profileupdate;

  ApplyJob({
    required this.juname,
    required this.jumail,
    required this.jucompny,
    required this.jutitle,
    required this.juresume,
    required this.jurelocation,
    required this.jueducation,
    required this.juexperience,
    required this.juexpinjava,
    required this.juexpjsp,
    required this.juinterviewdate,
    required this.jujavavalid,
    required this.jujobtitle,
    required this.jucompanyname,
    required this.description,
    required this.juphone,
    required this.julastsal,
    required this.juexpecsalary,
    required this.empid,
    required this.uid,
    required this.profileupdate,
  });
}

class JobApplications extends StatefulWidget {
  @override
  _JobApplicationsState createState() => _JobApplicationsState();
}

class _JobApplicationsState extends State<JobApplications> {
  String selectedStatus = 'All';

  List<String> statusOptions = ['All', 'Selected', 'Reviewed', 'Waiting', 'Rejected'];

  List<ApplyJob> jobApplications = [
    ApplyJob(
      juname: 'John Doe',
      jumail: 'john.doe@example.com',
      jucompny: 'ABC Inc.',
      jutitle: 'Software Developer',
      juresume: 'Link to Resume',
      jurelocation: 'City XYZ',
      jueducation: 'Bachelor\'s in Computer Science',
      juexperience: '3 years',
      juexpinjava: '2 years',
      juexpjsp: '1 year',
      juinterviewdate: '2023-12-02',
      jujavavalid: 'Yes',
      jujobtitle: 'Web Developer',
      jucompanyname: 'ABC Corporation',
      description: 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      juphone: '9876543210',
      julastsal: '80000',
      juexpecsalary: '90000',
      empid: 'EMP001',
      uid: 'UID001',
      profileupdate: 'Selected',
    ),
    ApplyJob(
      juname: 'Jane Smith',
      jumail: 'jane.smith@example.com',
      jucompny: 'XYZ Ltd.',
      jutitle: 'Mobile App Developer',
      juresume: 'Link to Resume',
      jurelocation: 'City ABC',
      jueducation: 'Master\'s in Computer Science',
      juexperience: '2 years',
      juexpinjava: '1 year',
      juexpjsp: '1 year',
      juinterviewdate: '2023-12-03',
      jujavavalid: 'Yes',
      jujobtitle: 'Mobile App Developer',
      jucompanyname: 'XYZ Ltd.',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      juphone: '9876543211',
      julastsal: '90000',
      juexpecsalary: '100000',
      empid: 'EMP002',
      uid: 'UID002',
      profileupdate: 'Reviewed',
    ),
    ApplyJob(
      juname: 'Bob Johnson',
      jumail: 'bob.johnson@example.com',
      jucompny: 'PQR Corporation',
      jutitle: 'Database Administrator',
      juresume: 'Link to Resume',
      jurelocation: 'City PQR',
      jueducation: 'Bachelor\'s in Information Technology',
      juexperience: '4 years',
      juexpinjava: '2 years',
      juexpjsp: '1 year',
      juinterviewdate: '2023-12-04',
      jujavavalid: 'Yes',
      jujobtitle: 'Database Administrator',
      jucompanyname: 'PQR Corporation',
      description: 'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.',
      juphone: '9876543212',
      julastsal: '95000',
      juexpecsalary: '110000',
      empid: 'EMP003',
      uid: 'UID003',
      profileupdate: 'Waiting',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Applications'),
      ),
      body: Column(
        children: [
          // Segmented control for filtering applications
          Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(
              width: 500, // Increase the width as needed
              child: CupertinoSlidingSegmentedControl(
                groupValue: selectedStatus,
                onValueChanged: (value) {
                  setState(() {
                    selectedStatus = value.toString();
                  });
                },
                children: {
                  'All': Text('All'),
                  'Selected': Text('Selected'),
                  'Reviewed': Text('Reviewed'),
                  'Waiting': Text('Waiting'),
                  'Rejected': Text('Rejected'),
                },
              ),
            ),
          ),
          // Display Job Applications in Cards
          Expanded(
            child: ListView.builder(
              itemCount: jobApplications.length,
              itemBuilder: (context, index) {
                final application = jobApplications[index];

                // Check if the application matches the selected status
                if (application.profileupdate == selectedStatus || selectedStatus == 'All') {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text('Name: ${application.juname}'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email: ${application.jumail}'),
                              Text('Company: ${application.jucompny}'),
                              Text('Profile Update: ${application.profileupdate}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Location: ${application.jurelocation}'),
                              Text('Education: ${application.jueducation}'),
                              Text('Job Title: ${application.jujobtitle}'),
                              Text('Phone: ${application.juphone}'),
                              Text('Last Salary: ${application.julastsal}'),
                              Text('Expected Salary: ${application.juexpecsalary}'),
                              // Add more details as needed
                            ],
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Implement any action for Button 1
                              },
                              child: Text('Button 1'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Implement any action for Button 2
                              },
                              child: Text('Button 2'),
                            ),
                            // Dropdown to change the application status
                            DropdownButton<String>(
                              value: application.profileupdate,
                              onChanged: (String? newValue) {
                                setState(() {
                                  application.profileupdate = newValue!;
                                });
                              },
                              items: <String>['Selected', 'Reviewed', 'Waiting', 'Rejected']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  // If the application does not match the selected status, return an empty container
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: JobApplications(),
  ));
}
