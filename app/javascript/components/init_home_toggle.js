const initHelloToggle = () => {
  const homeToggle = document.querySelector('.toggle')
  const showcase = document.querySelector('.showcase')

  homeToggle.addEventListener('click', () => {
    homeToggle.classList.toggle('active')
    showcase.classList.toggle('active')
  })
};

export { initHelloToggle }