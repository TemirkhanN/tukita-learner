export default class ChoiceQuestion {
    private readonly question: string;
    private readonly options: string[];
    private readonly correctAnswer: string;
    private providedAnswer: string = '';

    constructor(question: string, options: string[], correctAnswer: string) {
        this.question = question;
        this.options = options;
        this.correctAnswer = correctAnswer;
    }

    answer(answer: string): boolean {
        if (this.providedAnswer !== "") {
            throw new Error('Can not answer twice on the same question');
        }

        this.providedAnswer = answer;

        return answer === this.correctAnswer;
    }

    public getText(): string {
        return this.question;
    }

    public getOptions(): string[] {
        return this.options;
    }

    public getProvidedAnswer(): string {
        return this.providedAnswer;
    }

    public getCorrectAnswer() {
        return this.correctAnswer;
    }
}