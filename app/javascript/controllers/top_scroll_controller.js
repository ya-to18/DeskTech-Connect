import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="top-scroll"
export default class extends Controller {
  static targets = [ "btn" ]
  connect() {
  }

  scroll(event) {
    event.preventDefault();
    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    });
  }
}
