import Tooltip from "./Tooltip";

type Word = {
    origin: string;
    translation: string;
    picture: string;
}

const i18n = {
    family: "семья"
};

const chapters: { [key: string]: Word[] } = {
    family: [
        {
            origin: "Ила",
            translation: "Мама",
            picture: "https://cdn-icons-png.freepik.com/256/4478/4478085.png"
        },
        {
            origin: "Илабаба",
            translation: "Бабушка",
            picture: "https://cdn-icons-png.freepik.com/256/1155/1155223.png"
        },
        {
            origin: "Имадада",
            translation: "Дедушка",
            picture: "https://cdn-icons-png.freepik.com/256/5596/5596914.png"
        },
        {
            origin: "Дада",
            translation: "Папа",
            picture: "https://cdn-icons-png.freepik.com/256/2202/2202112.png"
        },
        {
            origin: "Яци",
            translation: "Сестра",
            picture: "https://cdn-icons-png.freepik.com/256/8348/8348186.png"
        },
        {
            origin: "Йехьи",
            translation: "Дочь",
            picture: "https://cdn-icons-png.freepik.com/256/2465/2465392.png"
        },
        {
            origin: "Вохьа",
            translation: "Сын",
            picture: "https://cdn-icons-png.freepik.com/256/7088/7088431.png"
        },
        {
            origin: "Ваци",
            translation: "Брат",
            picture: "https://cdn-icons-png.freepik.com/256/4333/4333609.png"
        },
        {
            origin: "Хъизан",
            translation: "Семья",
            picture: "https://cdn-icons-png.freepik.com/256/15371/15371705.png"
        },
    ]
};

export enum Chapter {
    FAMILY = 'family'
}

export default class Wordbook {
    private readonly UI: HTMLElement;
    private readonly tooltip: Tooltip;

    constructor(UI: HTMLElement) {
        this.tooltip = new Tooltip();

        this.UI = document.createElement("div");
        this.UI.className = "wordbook";
        UI.appendChild(this.UI);
    }

    public render(chapter: Chapter | string) {
        const blocks: HTMLElement[] = [];

        chapter = chapter as Chapter;
        for (const word of chapters[chapter]) {

            blocks.push(this.renderEntry(word));
        }

        this.UI.replaceChildren(...blocks);
        // TODO well, this does not belong here. Not like this at least
        // @ts-ignore
        document.getElementsByTagName("h1").item(0).innerText = i18n[chapter as string];
    }

    private renderEntry(word: Word): HTMLElement {
        const block = document.createElement("div");
        const img = document.createElement("img");
        const description = document.createElement("p");
        img.src = word.picture;
        img.title = word.translation;
        description.innerText = word.origin;

        block.append(img, description);

        block.addEventListener("mouseover", () => {
            this.tooltip.show(word.translation, img);
        });
        block.addEventListener("mouseout", () => this.tooltip.hide());

        return block;
    }
}