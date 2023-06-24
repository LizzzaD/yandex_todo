import 'package:flutter/material.dart';

import '../../../core/ui_kit/scaffolds/safe_scaffold.dart';
import '../../../init.dart';
import '../todos/todos_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initAfter(context);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const TodosPage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeScaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
