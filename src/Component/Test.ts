import {default as TestModel} from "../Test/Test";
import ChoiceQuestion from "../Test/ChoiceQuestion";

export default class Test {
    private testUI: HTMLElement;
    private test: TestModel;

    constructor(test: TestModel) {
        // @ts-ignore
        this.testUI = document.getElementById('test');
        this.test = test;

        // TODO has to happen on upper layer
        // @ts-ignore
        document.getElementById('content').style.display = 'none';
    }

    public render() {
        const currentQuestion = this.test.getCurrentQuestion();
        if (currentQuestion !== null) {
            this.renderInput(currentQuestion);

            return;
        }

        this.renderResult();
    }

    private renderResult(): void {
        let content = '';
        const result = this.test.getResult();
        for (const questionNumber in result) {
            const pos = parseInt(questionNumber) + 1;
            const question = result[questionNumber];
            content += '<p>' + pos + '. ' + question.getText() + '</p>';

            const givenAnswer = question.getProvidedAnswer();
            const correctAnswer = question.getCorrectAnswer();
            if (givenAnswer === correctAnswer) {
                content += '<p>✅ ' + givenAnswer + '</p>';
            } else {
                content += '<p>⚠️ ' + givenAnswer + ' (правильно: ' + correctAnswer + ')</p>';
            }
        }

        this.testUI.innerHTML = content;
    }

    private renderInput(question: ChoiceQuestion): void {
        let content = '';
        content += '<p class="test-question">' + question.getText() + '</p>';
        const availableOptions = question.getOptions();
        for (const availableAnswer of availableOptions) {
            // TODO I'm pretty sure something is wrong with labeling and unification
            content += '<div class="answer-option">' +
                '   <input type="radio" name="answer" value="' + availableAnswer + '"/>' +
                '   <label for="answer">' + availableAnswer + '</label>' +
                '</div>';
        }

        this.testUI.innerHTML = content;
        this.testUI.style.display = 'block';

        const radioButtons = this.testUI.querySelectorAll('input[type="radio"]');
        radioButtons.forEach((radio: Element) => {
            const elem: HTMLSelectElement = radio as HTMLSelectElement;
            elem.addEventListener('click', () => {
                this.test.answer(elem.value);
                this.render();
            });
        });
    }
}