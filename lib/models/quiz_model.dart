
class Quiz {
    Quiz({
        this.results,
    });

    List<Result>? results;

    factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

   
}

class Result {
    Result({
        this.category,
        this.type,
        this.difficulty,
        this.question,
        this.correctAnswer,
        this.incorrectAnswers,
    });

    String? category;
    String? type;
    String? difficulty;
    String? question;
    String? correctAnswer;
    List<String>? incorrectAnswers;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        category: json["category"],
        type: json["type"],
        difficulty: json["difficulty"],
        question: json["question"],
        correctAnswer: json["correct_answer"],
        incorrectAnswers: List<String>.from(json["incorrect_answers"].map((x) => x)),
    );

    
}
