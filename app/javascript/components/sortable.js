import Sortable from 'sortablejs';

const initSortable = () => {
  const dashboard = document.getElementById('dashboard-cards');
  // Sortable.create(dashboard);
  if (dashboard) {
    Sortable.create(dashboard, {
      handle: '.dash-card',
      animation: 150
    });
  }
};

export { initSortable };
