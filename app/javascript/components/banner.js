import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["To Work", "To Share", "To Validate"],
    smartBackspace: true,
    typeSpeed: 120,
    loop: true
  });
}

export { loadDynamicBannerText };