import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="link-activator"
export default class extends Controller {
  static targets = [ "link" ]
  connect() {
    this.linkTargets[0].classList.add("link-active")
  }

  activate(event) {
    this.linkTargets.forEach((link) => {
      link.classList.remove("link-active")
    })
    event.currentTarget.classList.add("link-active")
  }
}
