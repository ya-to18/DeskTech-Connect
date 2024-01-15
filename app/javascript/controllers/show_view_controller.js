import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-modal"
export default class extends Controller {
  static targets = ['detailNav']
  connect() {
    this.detailNavTarget.classList.add("hidden");
  }

  textDisplay() {
    this.detailNavTarget.classList.remove("hidden");
  }

  textHidden() {
    this.detailNavTarget.classList.add("hidden");
  }
}
