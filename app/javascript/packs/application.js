// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import "bootstrap";

import WaveSurfer from "wavesurfer.js";

// IMPORT SORTABLE FUNCTION
import { initSortable } from '../components/sortable';
import { scrollHome } from '../components/init_scroll_home';

// CALL SORTABLE FUNCTION

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  // [...]
  const audioDiv = document.querySelector('#waveform')
  if (audioDiv) {
    const waveform = WaveSurfer.create({
      container: audioDiv,
      mediaControls: true,
      waveColor: '#BBE1FA',
      // backgroundColor: "rgba(15, 76, 117, 0.7)",
      progressColor: '#3282B8',
      cursorColor: '#3282B8',
      hideScrollbar: true,
      barWidth: 7,
      barRadius: 2,
      cursorWidth: 1,
      height: 150,
      barGap: 2
    })
    waveform.load(audioDiv.dataset.audio);
    clickPlay = document.querySelector('#waveform-play')
    clickPlay.addEventListener('click', () => {
      waveform.play();
    });

    document.querySelector('.fa-pause-circle').addEventListener('click', () => {
      waveform.pause();
    })

  // clickPlay = document.querySelector('#waveform-play');
  // clickPlay.addEventListener("click", (event) => {
  //   clickPlay.classList.toggle('fa-play-circle');
  //   clickPlay.classList.toggle('click');
  //   setTimeout(function() {
  //     clickPlay.classList.toggle('click');
  //   }, 200)
  //   clickPlay.classList.toggle('fa-pause-circle');
  // });


  }

  $('.carousel').carousel({
    interval: false
  });

  initSortable();

  scrollHome();
});

