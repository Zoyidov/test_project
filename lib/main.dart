import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/theme.dart';
import 'features/quiz/cubit/quiz_cubit.dart';
import 'features/quiz/cubit/quiz_state.dart';
import 'features/quiz/data/quiz_repository.dart';
import 'features/quiz/ui/pages/quiz_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => QuizCubit(QuizRepository())..load(),
      child: BlocBuilder<QuizCubit, QuizState>(
        buildWhen: (p, c) => p.isDark != c.isDark,
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme(),
            darkTheme: darkTheme(),
            themeMode: state.isDark ? ThemeMode.dark : ThemeMode.light,
            home: Scaffold(body: const QuizPage()),
          );
        },
      ),
    );
  }
}
