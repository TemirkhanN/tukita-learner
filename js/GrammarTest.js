function startGrammarTest() {
    const task = "Дини {1} йаци эгу. Гьабсагlатлълъи минди хlанква {2} эгу.";
    const answers = {
        1: "дуй",
        2: "мунчида"
    };

    const options = ["дуй", "мунчида"];
    const taskContainer = document.getElementById("test");

    const userAnswers = {};

    function initialize() {
        const parts = task.split(/({\d})/);
        parts.forEach(part => {
            if (/{\d}/.test(part)) {
                const index = part.match(/\d/)[0];
                const span = document.createElement("span");
                span.className = "blank";
                span.id = getId(index);
                span.innerHTML = "<span style='color:gray'>______</span>";
                span.addEventListener("click", () => showOptions(span, index));
                taskContainer.appendChild(span);
            } else {
                taskContainer.appendChild(document.createTextNode(part));
            }
        });

        taskContainer.style.display = "block";
    }

    function showOptions(blank, index) {
        const optionsDiv = document.createElement("div");
        optionsDiv.className = "options show";
        options.forEach(option => {
            const optionDiv = document.createElement("div");
            optionDiv.className = "option";
            optionDiv.textContent = option;
            optionDiv.addEventListener("click", () => selectOption(blank, index, option, optionsDiv));
            optionsDiv.appendChild(optionDiv);
        });
        taskContainer.appendChild(optionsDiv);
    }

    const getId = (option) => "answer-" + option;

    function selectOption(blank, index, option, optionsDiv) {
        blank.textContent = option;
        userAnswers[index] = option;
        optionsDiv.remove();

        // Checking
        if (Object.keys(userAnswers).length === Object.keys(answers).length) {
            checkAnswers();
        }
    }

    function checkAnswers() {
        let correct = true;
        for (const [key, value] of Object.entries(answers)) {
            const element = document.getElementById(getId(key));
            if (userAnswers[key] === value) {
                element.style.color = "green";
            } else {
                element.style.color = "red";
            }
        }
    }

    initialize();
}