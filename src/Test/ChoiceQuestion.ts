import {Question} from "./Test";

export default class ChoiceQuestion implements Question<string>{
    private readonly id: string;
    private readonly text: string;
    private readonly options: string[];
    private readonly correctAnswer: string;
    private providedAnswer: string = '';

    constructor(id: string, question: string, options: string[], correctAnswer: string) {
        this.id = id;
        this.text = question;
        this.options = options;
        this.correctAnswer = correctAnswer;
    }

    public answer(answer: string): boolean {
        if (this.isAnswered()) {
            throw new Error('Can not answer twice on the same question');
        }

        this.providedAnswer = answer;

        return answer === this.correctAnswer;
    }

    public recallAnswer() {
        this.providedAnswer = '';
    }

    public isAnswered(): boolean {
        return this.providedAnswer !== '';
    }

    public render(onAnswer: (answer: string) => void): HTMLElement {
        if (this.isAnswered()) {
            return this.renderSummary();
        }

        const block = document.createElement("div");

        let content = '';
        content += '<p class="test-question">' + this.id + '. ' + this.text + '</p>';
        for (const availableAnswer of this.options) {
            // TODO I'm pretty sure something is wrong with labeling and unification
            content += '<div class="answer-option" data-option="' + availableAnswer + '">' + availableAnswer + '</div>';
        }

        block.innerHTML = content;

        const choiceButtons = block.querySelectorAll('div[class="answer-option"]');
        choiceButtons.forEach((choiceButton: Element) => {
            const elem: HTMLSelectElement = choiceButton as HTMLSelectElement;
            elem.addEventListener('click', () => onAnswer(elem.dataset.option as string));
        });

        return block;
    }

    private renderSummary(): HTMLElement {
        const block = document.createElement("div");
        let content = '';

        content += '<p>' + this.id + '. ' + this.text + '</p>';

        if (this.providedAnswer === this.correctAnswer) {
            content += '<p>✅ ' + this.providedAnswer + '</p>';
        } else {
            content += '<p>⚠️ ' + this.providedAnswer + ' (правильно: ' + this.correctAnswer + ')</p>';
        }

        block.innerHTML = content;

        return block;
    }
}