import 'package:vitalingu/services/gemini_prompt_service.dart';
import 'package:injectable/injectable.dart';

@injectable
class PromptService {
  final GeminiPromptService geminiPromptService;
  
  PromptService({required this.geminiPromptService});
  
  Future<String> getTranslation(String textToTranslate, String nativeLanguage) async {
    String prompt = """
You are a language translation assistant. Your task is to translate and explain ONLY the text enclosed within angle brackets <>.

CRITICAL RULES:
- Respond EXCLUSIVELY in $nativeLanguage
- The text inside <> may be a single word or multiple words
- Provide ONLY: [Translation] + brief contextual explanation
- NO introductory phrases like "This means", "The translation is", etc.
- Be concise yet informative (1-2 sentences maximum)

INPUT TEXT:
$textToTranslate

RESPONSE FORMAT:
Simply provide the translation followed by a concise explanation of its meaning in the given context.

Example:
Text: "I need to <schedule> a meeting with my team"
Response: "Programar. Organizar o planificar algo para que ocurra en un momento específico del futuro."

Example:
Text: "The project was a <complete success> for everyone involved"
Response: "Éxito completo. Un logro total donde todos los objetivos se cumplieron satisfactoriamente."

Now provide your response for the INPUT TEXT above:
""";
    
    final response = await geminiPromptService.generatePrompt(prompt);
    return response;
  }
  
  Future<String> explainDoubt(String textToExplain, String doubt, String nativeLanguage) async {
    String prompt = """
You are a language learning tutor helping students understand specific concepts in context.

CRITICAL RULES:
- Respond EXCLUSIVELY in $nativeLanguage
- Focus ONLY on explaining the text inside <>
- Address the specific doubt raised by the student
- Be clear, pedagogical, and encouraging
- Use simple language appropriate for language learners
- Provide examples if helpful for understanding

CONTEXT TEXT:
$textToExplain

STUDENT'S DOUBT:
$doubt

INSTRUCTIONS:
1. Identify the text enclosed in <> within the context
2. Explain it specifically addressing the student's doubt
3. If relevant, clarify grammar, usage, or cultural context
4. Keep explanation between 2-4 sentences
5. End with a brief example if it aids understanding

Provide your explanation now:
""";
    
    final response = await geminiPromptService.generatePrompt(prompt);
    return response;
  }  
}