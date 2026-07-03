import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/paper_list_screen.dart';
import 'screens/paper_viewer_screen.dart';
import 'models/paper_model.dart';

void main() {
  runApp(const MPPSCApp());
}

class MPPSCApp extends StatelessWidget {
  const MPPSCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MPPSC Papers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
        cardTheme: const CardTheme(
          elevation: 2,
          margin: EdgeInsets.zero,
        ),
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
        
        if (settings.name == '/papers') {
          final category = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (_) => PaperListScreen(category: category ?? 'Prelims'),
          );
        }
        
        if (settings.name == '/viewer') {
          final paper = settings.arguments as Paper?;
          if (paper == null) return null; // Handle error gracefully if needed
          return MaterialPageRoute(
            builder: (_) => PaperViewerScreen(paper: paper),
          );
        }
        
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      },
    );
  }
}
