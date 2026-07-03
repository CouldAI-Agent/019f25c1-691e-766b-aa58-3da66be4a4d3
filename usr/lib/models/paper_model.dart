class Question {
  final String text;
  final List<String> options;
  final int correctOptionIndex;
  final String? explanation;

  const Question({
    required this.text,
    required this.options,
    required this.correctOptionIndex,
    this.explanation,
  });
}

class Paper {
  final String id;
  final String title;
  final String year;
  final String type; // e.g., 'Prelims', 'Mains'
  final String subject; // e.g., 'General Studies I', 'CSAT'
  final List<Question> questions;

  const Paper({
    required this.id,
    required this.title,
    required this.year,
    required this.type,
    required this.subject,
    required this.questions,
  });
}

// Mock Data
final List<Paper> mockPapers = [
  Paper(
    id: 'p_2023_gs1',
    title: 'MPPSC Prelims 2023 - GS Paper 1',
    year: '2023',
    type: 'Prelims',
    subject: 'General Studies I',
    questions: [
      const Question(
        text: 'Who was the founder of the Parmar dynasty?',
        options: ['Upendra', 'Munj', 'Bhoj', 'Udayaditya'],
        correctOptionIndex: 0,
        explanation: 'Upendra (also known as Krishnaraja) was the founder of the Parmar dynasty in Malwa region.',
      ),
      const Question(
        text: 'In which district of Madhya Pradesh is the "Sanchi Stupa" located?',
        options: ['Vidisha', 'Raisen', 'Bhopal', 'Sehore'],
        correctOptionIndex: 1,
        explanation: 'Sanchi Stupa is located in the Raisen district of Madhya Pradesh.',
      ),
      const Question(
        text: 'Which is the longest river in Madhya Pradesh?',
        options: ['Chambal', 'Son', 'Tapti', 'Narmada'],
        correctOptionIndex: 3,
        explanation: 'Narmada is the longest river in Madhya Pradesh and the 5th longest in India.',
      ),
    ],
  ),
  Paper(
    id: 'p_2022_gs1',
    title: 'MPPSC Prelims 2022 - GS Paper 1',
    year: '2022',
    type: 'Prelims',
    subject: 'General Studies I',
    questions: [
      const Question(
        text: 'When was the state of Madhya Pradesh formed?',
        options: ['1 Nov 1956', '1 Nov 2000', '15 Aug 1947', '26 Jan 1950'],
        correctOptionIndex: 0,
        explanation: 'Madhya Pradesh was formed on November 1, 1956, following the reorganization of states.',
      ),
      const Question(
        text: 'Which national park in MP is famous for White Tigers?',
        options: ['Kanha', 'Bandhavgarh', 'Pench', 'Panna'],
        correctOptionIndex: 1,
        explanation: 'Bandhavgarh National Park is famous for having the highest density of Royal Bengal Tigers and is historically associated with white tigers.',
      ),
    ],
  ),
  Paper(
    id: 'p_2023_csat',
    title: 'MPPSC Prelims 2023 - CSAT Paper 2',
    year: '2023',
    type: 'Prelims',
    subject: 'CSAT',
    questions: [
      const Question(
        text: 'If A is the brother of B; B is the sister of C; and C is the father of D, how D is related to A?',
        options: ['Brother', 'Sister', 'Nephew/Niece', 'Cannot be determined'],
        correctOptionIndex: 3,
        explanation: 'The gender of D is not specified, so it cannot be determined whether D is a nephew or niece.',
      ),
    ],
  ),
];
