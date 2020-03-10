const scrollHome = () => {
  if (document.getElementById('home')) {
    if (localStorage.getItem('scrollable')) {
      window.scroll({ top: localStorage.getItem('scrollable') });
    }
    window.addEventListener('scroll', () => {
      localStorage.setItem('scrollable', window.scrollY);
    });
  }
}

export { scrollHome };
