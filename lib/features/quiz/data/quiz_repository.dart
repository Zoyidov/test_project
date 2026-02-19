import 'quiz_models.dart';

class QuizRepository {
  Future<List<QuizQuestion>> fetchQuestions() async {
    await Future.delayed(const Duration(milliseconds: 250));

    return const [
      QuizQuestion(
        id: 'q1',
        text: "2^5 nechiga teng?",
        correctIndex: 1,
        options: [
          QuizOption(label: 'A', text: "16"),
          QuizOption(label: 'B', text: "32"),
          QuizOption(label: 'C', text: "64"),
          QuizOption(label: 'D', text: "25"),
        ],
      ),
      QuizQuestion(
        id: 'q2',
        text: "12 va 18 ning EKUBi (GCD) nechiga teng?",
        correctIndex: 2,
        options: [
          QuizOption(label: 'A', text: "2"),
          QuizOption(label: 'B', text: "3"),
          QuizOption(label: 'C', text: "6"),
          QuizOption(label: 'D', text: "12"),
        ],
      ),
      QuizQuestion(
        id: 'q3',
        text: "Flutterda UI qurish uchun asosiy widget qaysi?",
        correctIndex: 0,
        options: [
          QuizOption(label: 'A', text: "MaterialApp"),
          QuizOption(label: 'B', text: "String"),
          QuizOption(label: 'C', text: "Future"),
          QuizOption(label: 'D', text: "HTTP"),
        ],
      ),
      QuizQuestion(
        id: 'q4',
        text: "for sikli qachon ishlatiladi?",
        correctIndex: 1,
        options: [
          QuizOption(label: 'A', text: "Faqat 1 marta ishlash uchun"),
          QuizOption(label: 'B', text: "Takrorlanuvchi amallar uchun"),
          QuizOption(label: 'C', text: "Internet chaqirish uchun"),
          QuizOption(label: 'D', text: "UI rangini o‘zgartirish uchun"),
        ],
      ),
      QuizQuestion(
        id: 'q5',
        text: "Binary search qaysi holatda samarali?",
        correctIndex: 2,
        options: [
          QuizOption(label: 'A', text: "Aralash massivda"),
          QuizOption(label: 'B', text: "Faqat 2 element bo‘lsa"),
          QuizOption(label: 'C', text: "Saralangan massivda"),
          QuizOption(label: 'D', text: "Stringda"),
        ],
      ),
      QuizQuestion(
        id: 'q6',
        text: "Stack qaysi prinsip asosida ishlaydi?",
        correctIndex: 0,
        options: [
          QuizOption(label: 'A', text: "LIFO"),
          QuizOption(label: 'B', text: "FIFO"),
          QuizOption(label: 'C', text: "HTTP"),
          QuizOption(label: 'D', text: "JSON"),
        ],
      ),
      QuizQuestion(
        id: 'q7',
        text: "10! (10 faktorial) nechiga teng?",
        correctIndex: 3,
        options: [
          QuizOption(label: 'A', text: "120"),
          QuizOption(label: 'B', text: "720"),
          QuizOption(label: 'C', text: "5040"),
          QuizOption(label: 'D', text: "3628800"),
        ],
      ),
      QuizQuestion(
        id: 'q8',
        text: "Flutterda state boshqarish uchun qaysi pattern mashhur?",
        correctIndex: 1,
        options: [
          QuizOption(label: 'A', text: "HTML"),
          QuizOption(label: 'B', text: "BLoC"),
          QuizOption(label: 'C', text: "SQL"),
          QuizOption(label: 'D', text: "FTP"),
        ],
      ),
      QuizQuestion(
        id: 'q9',
        text: "O(n log n) murakkablikka ega algoritm qaysi?",
        correctIndex: 2,
        options: [
          QuizOption(label: 'A', text: "Bubble Sort"),
          QuizOption(label: 'B', text: "Linear Search"),
          QuizOption(label: 'C', text: "Merge Sort"),
          QuizOption(label: 'D', text: "Nested loop O(n^2)"),
        ],
      ),
      QuizQuestion(
        id: 'q10',
        text: "Dartda null safety nimani ta'minlaydi?",
        correctIndex: 0,
        options: [
          QuizOption(label: 'A', text: "Null xatolarni oldini olish"),
          QuizOption(label: 'B', text: "Internet tezligini oshirish"),
          QuizOption(label: 'C', text: "UI rangini o‘zgartirish"),
          QuizOption(label: 'D', text: "Server yaratish"),
        ],
      ),
      QuizQuestion(
        id: 'q11',
        text: "Queue qanday ishlaydi?",
        correctIndex: 1,
        options: [
          QuizOption(label: 'A', text: "LIFO"),
          QuizOption(label: 'B', text: "FIFO"),
          QuizOption(label: 'C', text: "Random"),
          QuizOption(label: 'D', text: "Binary"),
        ],
      ),
      QuizQuestion(
        id: 'q12',
        text: "Fibonacci ketma-ketligida 6-chi son nechiga teng?",
        correctIndex: 2,
        options: [
          QuizOption(label: 'A', text: "5"),
          QuizOption(label: 'B', text: "6"),
          QuizOption(label: 'C', text: "8"),
          QuizOption(label: 'D', text: "13"),
        ],
      ),
      QuizQuestion(
        id: 'q13',
        text: "Flutterda async operatsiya uchun qaysi kalit so‘z ishlatiladi?",
        correctIndex: 3,
        options: [
          QuizOption(label: 'A', text: "loop"),
          QuizOption(label: 'B', text: "widget"),
          QuizOption(label: 'C', text: "build"),
          QuizOption(label: 'D', text: "async"),
        ],
      ),
      QuizQuestion(
        id: 'q14',
        text: "HashMap ning o‘rtacha qidirish murakkabligi?",
        correctIndex: 0,
        options: [
          QuizOption(label: 'A', text: "O(1)"),
          QuizOption(label: 'B', text: "O(n)"),
          QuizOption(label: 'C', text: "O(n^2)"),
          QuizOption(label: 'D', text: "O(log n)"),
        ],
      ),
      QuizQuestion(
        id: 'q15',
        text: "StatelessWidget qachon ishlatiladi?",
        correctIndex: 1,
        options: [
          QuizOption(label: 'A', text: "State o‘zgaradigan joyda"),
          QuizOption(label: 'B', text: "O‘zgarmas UI uchun"),
          QuizOption(label: 'C', text: "Database uchun"),
          QuizOption(label: 'D', text: "API uchun"),
        ],
      ),
      QuizQuestion(
        id: 'q16',
        text: "Bubble sort eng yomon holatda qanday murakkablikka ega?",
        correctIndex: 2,
        options: [
          QuizOption(label: 'A', text: "O(log n)"),
          QuizOption(label: 'B', text: "O(n)"),
          QuizOption(label: 'C', text: "O(n^2)"),
          QuizOption(label: 'D', text: "O(1)"),
        ],
      ),
      QuizQuestion(
        id: 'q17',
        text: "Dartda List qaysi ma'lumot turi?",
        correctIndex: 0,
        options: [
          QuizOption(label: 'A', text: "Collection"),
          QuizOption(label: 'B', text: "Primitive"),
          QuizOption(label: 'C', text: "Loop"),
          QuizOption(label: 'D', text: "Operator"),
        ],
      ),
      QuizQuestion(
        id: 'q18',
        text: "Recursion nima?",
        correctIndex: 1,
        options: [
          QuizOption(label: 'A', text: "Takrorlanuvchi UI"),
          QuizOption(label: 'B', text: "Funksiya o‘zini chaqirishi"),
          QuizOption(label: 'C', text: "Database ulanish"),
          QuizOption(label: 'D', text: "API so‘rovi"),
        ],
      ),
      QuizQuestion(
        id: 'q19',
        text: "MaterialApp ichida navigation uchun nima ishlatiladi?",
        correctIndex: 2,
        options: [
          QuizOption(label: 'A', text: "Container"),
          QuizOption(label: 'B', text: "Text"),
          QuizOption(label: 'C', text: "Navigator"),
          QuizOption(label: 'D', text: "Row"),
        ],
      ),
      QuizQuestion(
        id: 'q20',
        text: "Time complexity nima?",
        correctIndex: 3,
        options: [
          QuizOption(label: 'A', text: "Internet tezligi"),
          QuizOption(label: 'B', text: "UI tezligi"),
          QuizOption(label: 'C', text: "RAM hajmi"),
          QuizOption(label: 'D', text: "Algoritm bajarilish tezligi o‘lchovi"),
        ],
      ),
    ];
  }
}
