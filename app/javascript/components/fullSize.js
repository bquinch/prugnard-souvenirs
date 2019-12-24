const fullSize = () => {
  const card = document.querySelector('.index-souvenir-card__top__photo-big');
  card.addEventListener('click', (event) => {
    card.classList.toggle('active');
  })
}

export { fullSize }
