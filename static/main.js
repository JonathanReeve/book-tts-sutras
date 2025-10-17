document.addEventListener('DOMContentLoaded', function() {
  const sutraDataElement = document.getElementById('sutra-data');
  if (!sutraDataElement) return;

  const sutraData = JSON.parse(sutraDataElement.textContent);
  const sutraContainer = document.getElementById('heart-sutra-container');

  sutraData.forEach(line => {
    const lineDiv = document.createElement('div');
    lineDiv.classList.add('sutra-line');

    const rubyDiv = document.createElement('div');
    line.characters.forEach(char => {
      const ruby = document.createElement('ruby');
      const rb = document.createElement('rb');
      const rt = document.createElement('rt');
      const chineseSpan = document.createElement('span');
      chineseSpan.classList.add('chinese');
      chineseSpan.style.display = 'none';
      chineseSpan.textContent = char[0];
      const pronunciationSpan = document.createElement('span');
      pronunciationSpan.classList.add('pronunciation');
      pronunciationSpan.textContent = char[1] + ' ';

      rb.appendChild(chineseSpan);
      rt.appendChild(pronunciationSpan);
      ruby.appendChild(rb);
      ruby.appendChild(rt);
      rubyDiv.appendChild(ruby);
    });

    const englishDiv = document.createElement('div');
    englishDiv.classList.add('english');
    englishDiv.textContent = line.english;

    lineDiv.appendChild(rubyDiv);
    lineDiv.appendChild(englishDiv);
    sutraContainer.appendChild(lineDiv);
  });

  const togglePronunciation = document.getElementById('toggle-pronunciation');
  const toggleChinese = document.getElementById('toggle-chinese');
  const toggleEnglish = document.getElementById('toggle-english');

  const pronunciationElements = document.querySelectorAll('.pronunciation');
  const chineseElements = document.querySelectorAll('.chinese');
  const englishElements = document.querySelectorAll('.english');

  function updateVisibility() {
    pronunciationElements.forEach(el => el.style.display = togglePronunciation.checked ? 'inline' : 'none');
    chineseElements.forEach(el => el.style.display = toggleChinese.checked ? 'inline' : 'none');
    englishElements.forEach(el => el.style.display = toggleEnglish.checked ? 'block' : 'none');
  }

  togglePronunciation.addEventListener('change', updateVisibility);
  toggleChinese.addEventListener('change', updateVisibility);
  toggleEnglish.addEventListener('change', updateVisibility);

  updateVisibility();
});
