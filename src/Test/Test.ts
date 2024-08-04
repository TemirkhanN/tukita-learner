export interface Question<T> {
    answer(answer: T): void;
    render(onAnswer: (answer: T) => void): HTMLElement;
    recallAnswer(): void;
    isAnswered(): boolean;
}

export default class Test {
    private readonly questions: Question<any>[];
    private currentQuestionNumber: number;
    private result: Question<any>[];

    constructor(questionList: Question<any>[]) {
        this.questions = questionList;
        this.currentQuestionNumber = 0;
        this.result = [];
    };

    public getCurrentQuestion(): Question<any> | null {
        return this.questions[this.currentQuestionNumber] ?? null;
    }

    public answer(answer: any): void {
        const currentQuestion = this.getCurrentQuestion();
        if (currentQuestion === null) {
            console.error('Runtime error: there are no questions left');

            return;
        }

        currentQuestion.answer(answer);
        if (currentQuestion.isAnswered()) {
            this.result[this.currentQuestionNumber] = currentQuestion;
            this.currentQuestionNumber += 1;
        }
    }

    public getResult(): Question<any>[] {
        return this.result;
    }

    public reset(): void {
        this.result = [];
        this.currentQuestionNumber = 0;
        for (const question of this.questions) {
            question.recallAnswer();
        }
    }
}
