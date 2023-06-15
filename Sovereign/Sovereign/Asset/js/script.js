const next = document.querySelector('.next')
const prev = document.querySelector('.prev')
const comment = document.querySelector('#list-comment')
const commentItem = document.querySelectorAll('#list-comment .item')
var translateY = 0
var count = commentItem.length


const sliderImages = document.querySelectorAll('.slider img');

    let currentSlide = 0;

    function showSlide(slideIndex) {
      sliderImages.forEach((image, index) => {
        if (index === slideIndex) {
          image.classList.add('active');
        } else {
          image.classList.remove('active');
        }
      });
    }

    function nextSlide() {
      currentSlide++;
      if (currentSlide >= sliderImages.length) {
        currentSlide = 0;
      }
      showSlide(currentSlide);
    }

    setInterval(nextSlide, 3000);
