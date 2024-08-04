// @ts-nocheck
import TestFactory from './Component/TestFactory';
import Tooltip from "./Component/Tooltip";

document.addEventListener('DOMContentLoaded', function () {
    const descriptiveWords = document.querySelectorAll("[data-description]");
    const tooltip = new Tooltip();
    for (let i = 0; i < descriptiveWords.length; i++) {
        descriptiveWords[i].addEventListener("mouseover", (e) => {
            const elem = e.target as HTMLElement;
            tooltip.show(elem.dataset.description, elem)
        });
        descriptiveWords[i].addEventListener("mouseout", () => tooltip.hide());
    }
});

const globalScope = window as any;

globalScope.registerTranslationTest = (dictionary) => {
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("start-test").addEventListener('click', () => {
            const test = TestFactory.createTranslationTest(dictionary);
            test.render();
        })
    });
}

globalScope.registerChoiceTest = (data) => {
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("start-test").addEventListener('click', () => {
            const test = TestFactory.createChoiceTest(data);
            test.render();
        })
    });
}

globalScope.registerMultiChoiceTest = (data) => {
    document.addEventListener('DOMContentLoaded', function () {
        document.getElementById("start-test").addEventListener('click', () => {
            const test = TestFactory.createMultiChoiceTest(data);
            test.render();
        })
    });
}