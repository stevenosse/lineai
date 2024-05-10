export function getPromptForTone(tone: string | null): string | null {
    if (tone == null) {
        return null;
    }

    return `Improve with a ${tone} tone. `
}

export function getPromptForStyle(style: string | null): string | null {
    switch (style) {
        case "bulleted":
            return "Bulletize with asterisk";
        case "expanded":
            return "Rewrite with more details";
        case "sentence":
            return "Summarize with only one sentence";
        default:
            return null;
    }
}