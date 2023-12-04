import 'package:flutter/material.dart';



class StepperExampleApp extends StatelessWidget {
  const StepperExampleApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('PostJob')),
        body: const Center(
          child: StepperExample(),
        ),
      ),
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({Key? key});

  @override
  State<StepperExample> createState() => _StepperExampleState();
}

class _StepperExampleState extends State<StepperExample> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: const Text('Job Details'),
          content: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Job Title*'),
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Company Name*'),
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Number of Openings*'),
                keyboardType: TextInputType.number,
                // Add necessary validators and onSave functions
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Location and Type'),
          content: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Location'),
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Job Type'),
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Schedule'),
                // Add necessary validators and onSave functions
              ),
            ],
          ),
        ),
        Step(
          title: const Text('Payment and Description'),
          content: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Pay*'),
                keyboardType: TextInputType.number,
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Supplemental Pay*'),
                keyboardType: TextInputType.number,
                // Add necessary validators and onSave functions
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Description*'),
                // Add necessary validators and onSave functions
              ),
            ],
          ),
        ),
      ],
    );
  }
}
