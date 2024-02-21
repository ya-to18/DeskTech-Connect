import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-btn"
export default class extends Controller {
  static targets = ["deleteBtn"]
  connect() {
  }
  delete() {
    const index = this.deleteBtnTarget.id.split("_")[2];
    const displayTemplate = document.getElementById('gadget-display-' + index);
    const template = document.getElementById('gadget-hidden-' + index);
    const delete_field = document.getElementById('delete-flag-' + index);

    if (index >= 10000) {
      displayTemplate.remove();
      delete_field.value = '1'
    } else {
      displayTemplate.remove();
      template.remove();
    }
  }
}
