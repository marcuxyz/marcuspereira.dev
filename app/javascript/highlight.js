import hljs from "highlight.js"

const languages = [
  'ruby',
  'erb',
  'bash',
  'javascript',
  'python'
]

hljs.configure({ languages: languages })

document.addEventListener('DOMContentLoaded', (event) => {
  document.querySelectorAll('pre').forEach((block) => {
    hljs.highlightBlock(block);
  });
});
