import { Controller } from "@hotwired/stimulus"
import { computePosition, flip, shift, offset, autoUpdate } from "https://esm.sh/@floating-ui/dom@1.7.4?standalone"

export default class extends Controller {
  static targets = [ "trigger", "content" ]
  static values  = { placement: { type: String, default: "bottom" } }

  #showTimer
  #hideTimer

  initialize() {
    this.orient = this.orient.bind(this)
  }

  connect() {
    this.cleanup = autoUpdate(this.triggerTarget, this.contentTarget, this.orient)
  }

  disconnect() {
    this.cleanup()
  }

  show() {
    this.contentTarget.showPopover({ source: this.triggerTarget })
  }

  hide() {
    // Allow fade-out transition to complete before hiding
    // Get computed transition duration
    const duration = parseFloat(getComputedStyle(this.contentTarget).transitionDuration) * 1000 || 0

    if (duration > 0) {
      // Trigger fade-out by removing the open state class
      this.contentTarget.classList.add('popover--closing')

      // Wait for transition to complete, then actually hide
      setTimeout(() => {
        this.contentTarget.classList.remove('popover--closing')
        this.contentTarget.hidePopover()
      }, duration)
    } else {
      this.contentTarget.hidePopover()
    }
  }

  toggle() {
    this.contentTarget.togglePopover({ source: this.triggerTarget })
  }

  debouncedShow() {
    clearTimeout(this.#hideTimer)
    this.#showTimer = setTimeout(() => this.show(), 150)
  }

  debouncedHide() {
    clearTimeout(this.#showTimer)
    this.#hideTimer = setTimeout(() => this.hide(), 150)
  }

  orient() {
    computePosition(this.triggerTarget, this.contentTarget, this.#options).then(({x, y}) => {
      this.contentTarget.style.insetInlineStart = `${x}px`
      this.contentTarget.style.insetBlockStart  = `${y}px`
    })
  }

  get #options() {
    return { placement: this.placementValue, middleware: [offset(4), flip(), shift({padding: 4})] }
  }
}
