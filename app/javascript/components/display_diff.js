
import 'diff';

const Diff = require('diff');

const one = document.getElementById('original');
const other = document.getElementById('other');

const color = '';

let span = null;

const diff = Diff.diffChars(one, other),
    display = document.getElementById('display'),
    fragment = document.createDocumentFragment();

diff.forEach((part) => {
  // green for additions, red for deletions
  // grey for common parts
  const color = part.added ? 'green' :
    part.removed ? 'red' : 'grey';
  span = document.createElement('span');
  span.style.color = color;
  span.appendChild(document
    .createTextNode(part.value));
  fragment.appendChild(span);
});

const displayDiff = () => {
  display.appendChild(fragment);
}

export { displayDiff };
