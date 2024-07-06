
function TestQuestion(question, options, correctAnswer) {
    return {question: question, options: options, correct: correctAnswer};
}

function createTranslationTest(dictionary) {
    const pseudoShuffle = (a, b) => 0.5 - Math.random();

    const prepareOptions = (forWord, amount) => {
        // Pseudo shuffling
        const tuWords = Object.values(dictionary).sort(pseudoShuffle);
        if (tuWords.length - 1 < amount) {
            console.error("Requested more translations than we can provide");
        }

        const result = [forWord];
        while (result.length < amount + 1) {
            const candidate = tuWords.shift();
            if (candidate !== forWord) {
                result.push(candidate);
            }
        }

        return result.sort(pseudoShuffle);
    }

    const questions = [];
    for(const word in dictionary) {
        questions.push(new TestQuestion('Как сказать "'+ word +'"?', prepareOptions(dictionary[word], 3), dictionary[word]));
    }

    return new Test(questions);
}

function Test(questionList) {
    let currentQuestionNumber;
    let questions;
    let result;

    const construct = (questionList) => {
        questions = questionList;
        currentQuestionNumber = 0;
        result = [];
    };

    this.start = () => {

    };

    this.getCurrentQuestion = () => questions[currentQuestionNumber] ?? null;

    this.answer = (answer) => {
        const currentQuestion = this.getCurrentQuestion();
        if (currentQuestion === null) {
            console.error('Runtime error: there are no questions left');

            return;
        }

        result[currentQuestionNumber] = {
            question: currentQuestion.question,
            correct: currentQuestion.correct,
            given: answer,
        };

        ++currentQuestionNumber;
    };

    this.getResult = () => {
        return result;
    };

    construct(questionList);
}
