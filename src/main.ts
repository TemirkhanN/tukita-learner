// @ts-nocheck
import TestFactory from './Component/TestFactory';
import Tooltip from "./Component/Tooltip";
import Wordbook, {Chapter} from "./Component/Wordbook";

let isLoading = true;
let content;

document.addEventListener('DOMContentLoaded', function () {
    isLoading = false;
    const descriptiveWords = document.querySelectorAll("[data-description]");
    const tooltip = new Tooltip();
    for (let i = 0; i < descriptiveWords.length; i++) {
        descriptiveWords[i].addEventListener("mouseover", (e) => {
            const elem = e.target as HTMLElement;
            tooltip.show(elem.dataset.description, elem);
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

globalScope.showWordbookChapter = (chapterName: string) => {
    if (isLoading) {
        setTimeout(() => {
            globalScope.showWordbookChapter(chapterName);
        }, 100);

        return;
    }

    const content = document.getElementById("content");
    content.innerHTML = ""; // TODO hacky-whacky flusher

    // TODO remove reinit
    const book = new Wordbook(content);
    book.render(chapterName);
}