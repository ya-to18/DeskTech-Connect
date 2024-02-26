import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="flash-message"
export default class extends Controller {
  static targets = [ "message" ]
  connect() {
    setTimeout(() => {
      if (this.messageTarget) {
        this.fadeOutAndRemove(this.messageTarget);
      }
    }, 3000);
  }

  fadeOutAndRemove(element) {
    element.classList.add("fade-out");
    element.addEventListener("transitionend", () => {
      element.remove();
    })
  }
}
