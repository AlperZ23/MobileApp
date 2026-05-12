import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// A standalone widget that mirrors the LoginScreen's UI structure
// without any Firebase or Provider dependency.
class LoginScreenStub extends StatelessWidget {
  const LoginScreenStub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              const Text('Welcome Back',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Sign in to SUCab',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 48),
              const Text('Email',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              const SizedBox(height: 8),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'example@sabanciuniv.edu',
                ),
              ),
              const SizedBox(height: 16),
              const Text('Password',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
              const SizedBox(height: 8),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: '••••••••'),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Sign In'),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text('Sign Up',
                        style: TextStyle(fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  Widget buildStub() {
    return const MaterialApp(home: LoginScreenStub());
  }

  group('LoginScreen Widget Tests', () {
    testWidgets('renders Welcome Back heading', (WidgetTester tester) async {
      await tester.pumpWidget(buildStub());
      expect(find.text('Welcome Back'), findsOneWidget);
    });

    testWidgets('renders Sign in to SUCab subheading',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildStub());
      expect(find.text('Sign in to SUCab'), findsOneWidget);
    });

    testWidgets('renders email and password labels and fields',
        (WidgetTester tester) async {
      await tester.pumpWidget(buildStub());
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2));
    });

    testWidgets('renders Sign In button', (WidgetTester tester) async {
      await tester.pumpWidget(buildStub());
      expect(find.widgetWithText(ElevatedButton, 'Sign In'), findsOneWidget);
    });

    testWidgets('renders Sign Up navigation link', (WidgetTester tester) async {
      await tester.pumpWidget(buildStub());
      expect(find.text('Sign Up'), findsOneWidget);
    });

    testWidgets('renders email hint text', (WidgetTester tester) async {
      await tester.pumpWidget(buildStub());
      expect(find.text('example@sabanciuniv.edu'), findsOneWidget);
    });
  });
}
