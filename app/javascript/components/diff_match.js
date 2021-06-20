import { diff_match_patch } from '../components/diff_match_patch_uncompressed';

const diff_match = () => {
  const original = document.getElementById('original').dataset.text;
  const other = document.getElementById('other').dataset.text;
  const display = document.getElementById('display');
  const dmp = new diff_match_patch();
        const diff = dmp.diff_main(original, other);
        // Result: [(-1, "Hell"), (1, "G"), (0, "o"), (1, "odbye"), (0, " World.")]
        // dmp.diff_cleanupEfficiency(diff);
        dmp.diff_cleanupSemantic(diff);
        const ds = dmp.diff_prettyHtml(diff);
        // Result: [(-1, "Hello"), (1, "Goodbye"), (0, " World.")]
        // alert(diff);
        display.innerHTML = ds;
};

export { diff_match };
