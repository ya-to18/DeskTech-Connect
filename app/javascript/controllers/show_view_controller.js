import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-modal"
export default class extends Controller {
  static targets = ['detailNav']
  connect() {
  }

  textDisplay() {
    this.detailNavTarget.classList.toggle("hidden");
  }

  textHidden() {
    this.detailNavTarget.classList.toggle("hidden");
  }
}
