const textarea = document.getElementsByTagName("textarea");
for (const textareaElement of textarea) {
    textareaElement.addEventListener('input', autoResize, false);
}

function autoResize() {
    this.style.height = 'auto';
    this.style.height = this.scrollHeight + 'px';
}
