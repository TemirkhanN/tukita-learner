import {Question} from "./Test";
import Tooltip from "../Component/Tooltip";

type Answer = {
    part: number;
    text: string;
}

export default class MultiChoiceQuestion implements Question<Answer> {
    private readonly id: string;
    private readonly text: string;
    private readonly answers: { [key: number]: string };
    private providedAnswers: { [key: number]: string };

    constructor(id: string, text: string, answers: { [key: number]: string }) {
        this.id = id;
        this.text = text;
        this.answers = answers;
        this.providedAnswers = [];
    }

    public answer(answer: Answer): void {
        this.providedAnswers[answer.part] = answer.text;
    }

    public recallAnswer(): void {
        this.providedAnswers = [];
    }

    public render(onAnswer: (answer: Answer) => void): HTMLElement {
        if (this.isAnswered()) {
            return this.renderSummary();
        }

        const div = document.createElement("div");
        div.appendChild(document.createTextNode(this.id + '. '));

        const parts = this.text.split(/({\d})/);
        parts.forEach((part: string) => {
            const isQuestionPlaceholder = /^{\d}$/.test(part);
            if (!isQuestionPlaceholder) {
                div.appendChild(document.createTextNode(part))

                return;
            }

            // @ts-ignore
            const index = part.match(/\d/).shift() as number;
            let placeHolder = '______';

            if (this.providedAnswers.hasOwnProperty(index)) {
                placeHolder = this.providedAnswers[index];
            }

            const span = document.createElement("span");
            span.id = this.getOptionId(index);
            span.innerHTML = '<span style="color:gray;">' + placeHolder + '</span>';
            span.addEventListener("click", () => {
                // Don't show options if question is already answered
                if (this.isAnswered()) {
                    return;
                }

                const optionsDiv = document.createElement("div");
                optionsDiv.className = "options show";
                Object.values(this.answers).forEach((option: string) => {
                    const optionDiv = document.createElement("div");
                    optionDiv.className = "option";
                    optionDiv.textContent = option;
                    optionDiv.addEventListener("click", () => {
                        div.removeChild(optionsDiv);
                        onAnswer({part: index, text: option});
                    });
                    optionsDiv.appendChild(optionDiv);
                });
                div.appendChild(optionsDiv);
            });
            div.appendChild(span);
        });

        return div;
    }

    public isAnswered(): boolean {
        return Object.keys(this.providedAnswers).length === Object.keys(this.answers).length;
    }

    private getOptionId(option: number): string {
        return "answer-" + option;
    }

    private renderSummary(): HTMLElement {
        if (!this.isAnswered()) {
            throw new Error('Can not show summary for unanswered question');
        }

        const tooltip = new Tooltip();
        const div = document.createElement("div");

        div.appendChild(document.createTextNode(this.id + '. '));

        const parts = this.text.split(/({\d})/);
        parts.forEach((part: string) => {
            const isQuestionPlaceholder = /^{\d}$/.test(part);
            if (!isQuestionPlaceholder) {
                div.appendChild(document.createTextNode(part))

                return;
            }

            // @ts-ignore
            const index = part.match(/\d/).shift() as number;
            const providedAnswer = this.providedAnswers[index];
            const correctAnswer = this.answers[index];

            const span = document.createElement("span");
            span.innerText = providedAnswer;
            span.style.color = 'green';
            if (providedAnswer !== correctAnswer) {
                span.style.color = 'yellow';
                span.addEventListener("mouseover", (e) => {
                    const elem = e.target as HTMLElement;
                    tooltip.show('Правильно: ' + correctAnswer, elem)
                });
                span.addEventListener("mouseout", () => tooltip.hide());
            }

            div.appendChild(span);
        });

        return div;
    }
}