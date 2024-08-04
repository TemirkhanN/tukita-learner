import {default as TestModel} from "../Test/Test";

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
        this.testUI.style.display = 'block';

        const currentQuestion = this.test.getCurrentQuestion();
        let content: HTMLElement;
        if (currentQuestion !== null) {
            content = currentQuestion.render((answer: string): void => {
                this.test.answer(answer);
                this.render();
            });
        } else {
            content = this.renderResult();
        }

        this.testUI.replaceChildren(content);
    }

    private renderResult(): HTMLElement {
        const div = document.createElement("div");

        for (const question of this.test.getResult()) {
            div.appendChild(question.render(() => {}));
        }

        const retryButton = document.createElement("button");
        retryButton.innerText = 'Начать тест заново';
        retryButton.addEventListener('click', () => {
            this.test.reset();
            this.render();
        });

        div.appendChild(retryButton);

        return div;
    }
}