import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('#search_location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
