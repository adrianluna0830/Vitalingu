String unitExplanationPrompt({
  required String topicLanguage,
  required String explanationLanguage,
  required String topic,
}) {
  return '''
Topic language: $topicLanguage
Explanation language: $explanationLanguage
Explain the language topic: $topic.

CONTEXT AND PURPOSE
This content will be read directly by students who are learning the language. The explanation must allow a complete beginner to understand the topic and start using it correctly in practice, without needing to consult additional resources.

FUNDAMENTAL OBJECTIVE
Provide a clear and well-developed explanation that covers the essential aspects of the topic, so that the student can understand and apply it with confidence.

OUTPUT FORMAT
Generate ONLY the content in markdown format.
Do not include introductions, farewells, prior explanations, or additional comments.
The output must begin directly with the markdown explanation and end with the last markdown element.
NO additions AFTER the educational content: no questions, no invitations to practice, no farewells, no additional comments of any kind.

Markdown usage:
Use markdown only to represent structures that cannot be clearly expressed in plain text (lists, columns, tables, hierarchies, etc.)
The markdown should be as flat and simple as possible, without specific design or style
Avoid using markdown for visual emphasis (bold, italics) unless strictly necessary to distinguish structural elements
The purpose of markdown is solely to organize information clearly, not to create an attractive design

STRICT CLOSING RESTRICTIONS
DO NOT include follow-up questions at the end
DO NOT invite the student to practice
DO NOT add calls to action
DO NOT include farewells or final comments
The content must end exactly where the last relevant markdown section ends
The last line of the output must be the last informational element of the explanation

EXPLANATION STRUCTURE

GENERAL EXPLANATION
Content within this section:
Describe what the topic is and what its main function is within the language
Use clear and simple language, oriented to someone who has never studied this topic
Explain when and why a speaker would use this language resource
Include 2 to 3 concrete, everyday examples that illustrate its basic use

MAIN IDEAS EXPRESSED BY THIS TOPIC
Content within this section:
Present a numbered list with the main communicative situations or intentions that this topic allows to express
For each point describe a specific communicative meaning or purpose
Include 2 concrete examples in the target language
Focus on the "what for" it is used, not on grammatical explanations

GRAMMATICAL FORMS AND THEIR STRUCTURE
Content within this section:
Describe the different forms this topic can take
For each relevant form include the name of the form, its function (what this specific form is used for), its structure (how it is constructed using appropriate generic terms), a visual pattern or simple diagram of the structure if it facilitates understanding
Explain the usage rules that determine how this form behaves, covering what happens in a given situation, when it applies, what transformation or adjustment occurs, and provide 2 to 3 concrete examples with translation along with relevant exceptions if they exist
Provide 3 varied general examples in the target language, each immediately followed by its translation
Include observations about irregularities or special cases if applicable

ASSOCIATED PATTERNS AND ELEMENTS
Content within this section:
The examples mentioned in this section function only as guiding references
It is not mandatory to include all types of elements or combinations in each topic
You can add, modify, or omit examples and sub-elements freely according to what is natural and relevant for the topic being explained
Include associated key elements which are linguistic elements that are typically used with this topic if applicable
Include frequent combinations which are typical structures or sequences in which this topic appears, with concrete examples and translations if applicable

QUALITY CRITERIA
Examples must be concrete, everyday, and realistic using simple and accessible vocabulary
Each example in the target language must be immediately followed by its translation
Cover the fundamental aspects of the topic
Adapt each section to what is relevant and omit subsections that do not apply to the topic
Balance technical precision with pedagogical clarity
  ''';
}

String unitExplanationDesignPrompt({
  required String content,
}) {
  return '''
You are an expert in instructional design and educational content formatting. Your task is to reformat language learning material to improve its readability and retention.

You will receive educational content about a topic in a language. You must transform it by applying these principles:

SPACING AND DENSITY:
- Add strategic vertical spaces between sections without exaggerating
- Separate main concepts with appropriate blank lines
- Avoid dense text blocks by dividing information into digestible segments

VISUAL HIERARCHY:
- Use different heading sizes to hierarchize information
- Apply bold and italics strategically to highlight key elements
- Use line breaks to improve scannability

ORGANIZATION:
- Group related information logically
- Clearly distinguish between different types of content (explanations, examples, notes)
- Maintain a consistent and predictable structure

FORMATTING:
- Use standard markdown for all formatting
- Apply text styles (bold, italics, headings) to create visual distinction
- Include visual separators when appropriate

ABSOLUTE RESTRICTIONS:
- DO NOT use emojis under any circumstances
- DO NOT add new content that is not in the original material
- DO NOT remove information from the original material
- DO NOT modify the meaning or content of any explanation, example, or concept
- DO NOT paraphrase or reword the content, only reorganize and format
- Preserve ALL original content complete and intact
- Your response must be ONLY the formatted markdown, with no additional text before or after

Process the content while maintaining its educational essence while optimizing its visual presentation to facilitate learning.

CONTENT TO REFORMAT:
$content
  ''';
}