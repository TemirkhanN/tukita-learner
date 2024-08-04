// @ts-nocheck
import TestFactory from './Component/TestFactory';

function getElementOffset(el) {
    const rect = el.getBoundingClientRect();
    return {
        left: rect.left + window.scrollX,
        top: rect.top + window.scrollY
    };
}

document.addEventListener('DOMContentLoaded', function () {
    const descriptiveWords = document.querySelectorAll("[data-description]");
    const tooltip = document.createElement("span");
    tooltip.className = 'tooltip';
    tooltip.style.visibility = 'hidden';
    document.body.appendChild(tooltip);
    const showTooltip = (e) => {
        if (tooltip.style.visibility === 'visible') {
            return;
        }
        const rect = getElementOffset(e.target);

        tooltip.style.visibility = 'visible';
        tooltip.innerText = e.target.dataset.description;
        tooltip.style.left = rect.left + "px";
        tooltip.style.top = (rect.top - 20) + "px";
    }

    const hideTooltip = () => {
        tooltip.style.visibility = 'hidden';
        tooltip.innerText = '';
    }
    for (let i = 0; i < descriptiveWords.length; i++) {
        descriptiveWords[i].addEventListener("mouseover", showTooltip);
        descriptiveWords[i].addEventListener("mouseout", hideTooltip);
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
