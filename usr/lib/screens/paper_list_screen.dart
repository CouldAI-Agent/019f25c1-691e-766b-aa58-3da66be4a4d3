import 'package:flutter/material.dart';
import '../models/paper_model.dart';

class PaperListScreen extends StatelessWidget {
  final String category;

  const PaperListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter mock papers by category
    final papers = mockPapers.where((p) => p.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Papers'),
      ),
      body: papers.isEmpty
          ? const Center(
              child: Text(
                'No papers available yet.',
                style: TextStyle(fontSize: 16),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: papers.length,
              itemBuilder: (context, index) {
                final paper = papers[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12.0),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      paper.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text('Year: ${paper.year} • ${paper.questions.length} Questions'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/viewer',
                        arguments: paper,
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
