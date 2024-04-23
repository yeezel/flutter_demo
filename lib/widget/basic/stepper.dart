import 'package:flutter/material.dart';

import '../../main.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetPage(list:[
      Demo1()..init(),
    ]);
  }

}
class Demo1 extends Data{
  @override
  void init() {
    title="default";
    code = '''
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
          title: const Text('Step 1 title'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1'),
          ),
        ),
        const Step(
          title: Text('Step 2 title'),
          content: Text('Content for Step 2'),
        ),
      ],
    );
  }
}
''';
    ui = PageView(
      // scrollDirection: Axis.vertical, // 滑动方向为垂直方向
      children: const <Widget>[
        StepperExample()
      ],
    );
  }
}

class StepperExample extends StatefulWidget {
  const StepperExample({super.key});

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
          title: const Text('Step 1 title'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: const Text('Content for Step 1'),
          ),
        ),
        const Step(
          title: Text('Step 2 title'),
          content: Text('Content for Step 2'),
        ),
      ],
    );
  }
}
