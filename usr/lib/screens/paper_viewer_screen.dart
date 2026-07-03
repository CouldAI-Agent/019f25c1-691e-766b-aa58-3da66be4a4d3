import 'package:flutter/material.dart';
import '../models/paper_model.dart';

class PaperViewerScreen extends StatefulWidget {
  final Paper paper;

  const PaperViewerScreen({super.key, required this.paper});

  @override
  State<PaperViewerScreen> createState() => _PaperViewerScreenState();
}

class _PaperViewerScreenState extends State<PaperViewerScreen> {
  // Keep track of which questions have their answers revealed
  final Set<String> _revealedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.paper.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: widget.paper.questions.length,
        itemBuilder: (context, index) {
          final question = widget.paper.questions[index];
          final isRevealed = _revealedAnswers.contains(question.id);

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Q${index + 1}. ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          question.text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (question.options != null) ...[
                    ...question.options!.asMap().entries.map((entry) {
                      final optionIndex = entry.key;
                      final optionText = entry.value;
                      final optionLabel = String.fromCharCode(65 + optionIndex); // A, B, C, D
                      
                      bool isCorrect = isRevealed && optionLabel == question.correctAnswer;
                      
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 8.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: isCorrect ? Colors.green.shade50 : Colors.grey.shade50,
                          border: Border.all(
                            color: isCorrect ? Colors.green : Colors.grey.shade300,
                            width: isCorrect ? 2 : 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '$optionLabel) $optionText',
                          style: TextStyle(
                            color: isCorrect ? Colors.green.shade800 : Colors.black87,
                            fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                  if (!isRevealed)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          setState(() {
                            _revealedAnswers.add(question.id);
                          });
                        },
                        child: const Text('Show Answer'),
                      ),
                    )
                  else
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Answer: ${question.correctAnswer}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                            ),
                          ),
                          if (question.explanation != null) ...[
                            const SizedBox(height: 8),
                            Text(
                              question.explanation!,
                              style: TextStyle(color: Colors.blue.shade900),
                            ),
                          ],
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
