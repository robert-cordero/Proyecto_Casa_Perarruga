const roomCarousel = document.querySelector(".room-photo-carousel");

if (roomCarousel) {
  const track = roomCarousel.querySelector(".room-photo-carousel__track");
  const slides = track.querySelectorAll("img");
  const previousButton = roomCarousel.querySelector(
    ".room-photo-carousel__control--previous",
  );
  const nextButton = roomCarousel.querySelector(
    ".room-photo-carousel__control--next",
  );

  function moveRoomCarousel(direction) {
    const currentSlide = Math.round(track.scrollLeft / track.clientWidth);
    const nextSlide = Math.min(
      Math.max(currentSlide + direction, 0),
      slides.length - 1,
    );

    track.scrollTo({
      left: nextSlide * track.clientWidth,
      behavior: "smooth",
    });
  }

  previousButton.addEventListener("click", () => moveRoomCarousel(-1));
  nextButton.addEventListener("click", () => moveRoomCarousel(1));
}
