function startTest(test) {
    document.getElementById('content').style.display = 'none';
    const testUI = document.getElementById('test');

    const render = () => {
        let content = '';
        const currentQuestion = test.getCurrentQuestion();
        if (currentQuestion === null) {
            const result = test.getResult();
            for (const questionNumber in result) {
                const pos = parseInt(questionNumber) + 1;
                content +=  '<p>'+ pos +'. '+result[questionNumber].question+'</p>';

                const givenAnswer = result[questionNumber].given;
                const correctAnswer = result[questionNumber].correct;
                if (givenAnswer === correctAnswer) {
                    content += '<p>✅ '+givenAnswer+'</p>';
                } else {
                    content += '<p>⚠️ '+givenAnswer+' (правильно: '+correctAnswer+')</p>';
                }
            }

            testUI.innerHTML = content;

            return;
        }

        content += '<p class="test-question">'+currentQuestion.question+'</p>';
        for (const option in currentQuestion.options) {
            const answer = currentQuestion.options[option];
            content += '<div class="answer-option">' +
                '   <input type="radio" name="answer" value="'+answer+'"/>' +
                '   <label for="'+answer+'">'+answer+'</label>' +
                '</div>';
        }

        testUI.innerHTML = content;
        testUI.style.display = 'block';

        const radioButtons = testUI.querySelectorAll('input[type="radio"]');
        radioButtons.forEach(radio => {
            radio.addEventListener('click', () => {
                test.answer(radio.value);
                render();
            });
        });
    }

    render();
}