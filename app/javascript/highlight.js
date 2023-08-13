import hljs from "highlight.js"

const languages = [
  'ruby',
  'erb',
  'bash',
  'sql',
  'javascript',
  'python'
]

hljs.configure({ languages: languages })

document.addEventListener('turbo:load', (event) => {
  document.querySelectorAll('pre').forEach((block) => {
    hljs.highlightBlock(block);
  });
});
