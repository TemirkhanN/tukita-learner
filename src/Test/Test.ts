import type ChoiceQuestion from "ChoiceQuestion";

export interface Question<T> {
    answer(answer: T): void;
    render(onAnswer: (answer: T) => void): HTMLElement;
    recallAnswer(): void;
}

export default class Test {
    private readonly questions: ChoiceQuestion[];
    private currentQuestionNumber: number;
    private result: ChoiceQuestion[];

    constructor(questionList: ChoiceQuestion[]) {
        this.questions = questionList;
        this.currentQuestionNumber = 0;
        this.result = [];
    };

    public getCurrentQuestion(): ChoiceQuestion | null {
        return this.questions[this.currentQuestionNumber] ?? null;
    }

    public answer(answer: any): void {
        const currentQuestion = this.getCurrentQuestion();
        if (currentQuestion === null) {
            console.error('Runtime error: there are no questions left');

            return;
        }

        currentQuestion.answer(answer);
        this.result[this.currentQuestionNumber] = currentQuestion;

        this.currentQuestionNumber += 1;
    }

    public getResult(): ChoiceQuestion[] {
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
