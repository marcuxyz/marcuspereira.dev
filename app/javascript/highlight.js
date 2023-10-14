import hljs from "highlight.js"

const languages = [
  'ruby',
  'erb',
  'elixir',
  'bash',
  'yaml',
  'json',
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
