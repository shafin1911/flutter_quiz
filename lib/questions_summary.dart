import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const successColor = Color.fromARGB(255, 100, 225, 69);
const errorColor = Color.fromARGB(255, 148, 31, 31);

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              final bool isCorrectAnswer =
                  data['user_answer'] == data['correct_answer'];

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.only(right: 18),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: isCorrectAnswer ? successColor : errorColor,
                        borderRadius: BorderRadius.circular(
                          100,
                        )),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          'Your Answer: ${data['user_answer'] as String}',
                          style: GoogleFonts.lato(
                            color: isCorrectAnswer ? successColor : errorColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Correct Answer: ${data['correct_answer'] as String}',
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 255, 252, 64),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
