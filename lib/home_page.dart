import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:supabase_presentation/features/steps/presentation/step1.dart';
import 'package:supabase_presentation/features/step2/presentation/step2.dart';
import 'package:supabase_presentation/features/steps/presentation/step3.dart';
import 'package:supabase_presentation/features/steps/presentation/step4.dart';
import 'package:supabase_presentation/features/steps/presentation/step5.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step $_currentStep'),
      ),
      body: Steps(currentStep: _currentStep),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Colors.blue,
        activeColor: Colors.blue,
        style: TabStyle.react,
        items: [
          numberTabItem(1),
          numberTabItem(2),
          numberTabItem(3),
          numberTabItem(4),
          numberTabItem(5),
        ],
        initialActiveIndex: 0,
        onTap: (int i) => setState(() {
          _currentStep = i + 1;
        }),
      ),
    );
  }
}

TabItem numberTabItem(int number) {
  return TabItem(
      icon: Center(
    child: Text(number.toString(),
        style: const TextStyle(
          fontSize: 24,
          color: Colors.white,
        )),
  ));
}

class Steps extends StatelessWidget {
  final int currentStep;
  const Steps({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    switch (currentStep) {
      case 1:
        return const Step1();
      case 2:
        return const Step2();
      case 3:
        return const Step3();
      case 4:
        return const Step4();
      case 5:
        return const Step5();
      default:
        return const Step1();
    }
  }
}
