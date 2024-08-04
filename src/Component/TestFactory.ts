import ChoiceQuestion from "../Test/ChoiceQuestion";
import {default as TestModel} from "../Test/Test";
import Test from "./Test";
import MultiChoiceQuestion from "../Test/MultiChoiceQuestion";

export type Dictionary = {[key: string]: string};

export type ChoiceTest = {
    text: string;
    choices: string[];
    answer: string;
}[];

export default class TestFactory {
    public static createTranslationTest(dictionary: Dictionary): Test {
        const pseudoShuffle = () => 0.5 - Math.random();

        const prepareOptions = (forWord: string, amount: number): string[] => {
            // Pseudo shuffling
            const tuWords = Object.values(dictionary).sort(pseudoShuffle);
            if (tuWords.length - 1 < amount) {
                throw new Error('Requested more translations than we can provide');
            }

            const result: string[] = [forWord];
            while (result.length < amount + 1) {
                const candidate: string = tuWords.shift() as string;
                if (candidate !== forWord) {
                    result.push(candidate);
                }
            }

            return result.sort(pseudoShuffle);
        }

        const questions = [];
        let questionNumber = 1;
        for (const word in dictionary) {
            questions.push(new ChoiceQuestion((questionNumber++).toString(), 'Как сказать "' + word + '"?', prepareOptions(dictionary[word], 3), dictionary[word]));
        }

        return new Test(new TestModel(questions));
    }

    public static createChoiceTest(test: ChoiceTest) {
        const questions = [];
        let questionNumber = 1;
        for (const question of test) {
            questions.push(new ChoiceQuestion((questionNumber++).toString(), question.text, question.choices, question.answer));
        }

        return new Test(new TestModel(questions));
    }

    public static createMultiChoiceTest(test: ChoiceTest) {
        const questions = [];
        let questionNumber = 1;
        for (const question of test) {
            questions.push(new MultiChoiceQuestion((questionNumber++).toString(), question.text, question.choices));
        }

        return new Test(new TestModel(questions));
    }
}