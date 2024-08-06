export default class Tooltip {
    private readonly element: HTMLElement;

    constructor() {
        let element: HTMLElement | null = document.getElementById('tooltip');
        if (element == null) {
            element = document.createElement('span');
            element.className = 'tooltip';
            element.id = 'tooltip';
            element.style.visibility = 'hidden';
            document.body.appendChild(element);
        }

        this.element = element;
    }

    public show(text: string, over: HTMLElement) {
        if (this.element.style.visibility === 'visible') {
            return;
        }

        const rect = this.getElementOffset(over);

        this.element.style.visibility = 'visible';
        this.element.innerText = text;
        this.element.style.left = rect.left + "px";
        this.element.style.top = (rect.top - 20) + "px";
    }

    public hide() {
        this.element.style.visibility = 'hidden';
        this.element.innerText = '';
    }

    private getElementOffset(el: HTMLElement) {
        const rect = el.getBoundingClientRect();

        return {
            left: rect.left + window.scrollX,
            top: rect.top + window.scrollY
        }
    }
}