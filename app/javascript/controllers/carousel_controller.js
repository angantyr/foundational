import { Controller } from "@hotwired/stimulus"
import Swiper from "https://esm.sh/swiper@12/bundle?standalone"

export default class extends Controller {
  static targets = [ "container" ]

  connect() {
    this.swiper = new Swiper(this.containerTarget, {
      on: {
        slideChange: () => {
          this.updatePaginationButtons()
        }
      }
    })

    this.updatePaginationButtons()
  }

  prev() {
    if (this.swiper) {
      this.swiper.slidePrev()
    }
  }

  next() {
    if (this.swiper) {
      this.swiper.slideNext()
    }
  }

  disconnect() {
    if (this.swiper) {
      this.swiper.destroy()
    }
  }

  updatePaginationButtons() {
    const customPaginationButtons = this.element.querySelectorAll('[data-carousel-target="pagination"]')
    if (customPaginationButtons.length > 0) {
      customPaginationButtons.forEach((button, index) => {
        if (index === this.swiper.activeIndex) {
          button.setAttribute('aria-current', 'true')
          button.classList.add('active')
        } else {
          button.removeAttribute('aria-current')
          button.classList.remove('active')
        }
      })
    }
  }

  goToSlide(event) {
    const index = parseInt(event.currentTarget.dataset.index)
    if (this.swiper) {
      this.swiper.slideTo(index)
    }
  }
}
