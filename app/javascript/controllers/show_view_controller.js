import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="show-modal"
export default class extends Controller {
  static targets = ['detailNav', 'modal']
  connect() {
  }

  textDisplay() {
    this.detailNavTarget.classList.toggle("hidden");
  }

  textHidden() {
    this.detailNavTarget.classList.toggle("hidden");
  }

  showModal() {
    event.preventDefault();
    this.modalTarget.classList.toggle("hidden");
  }

  closeModal() {
    this.modalTarget.classList.toggle("hidden")
  }
}
