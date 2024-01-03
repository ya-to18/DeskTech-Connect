import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-btn"
export default class extends Controller {
  static targets = ["deleteBtn"]
  connect() {
  }
  delete() {
    const index = this.deleteBtnTarget.id.split("_")[4];
    const template = document.getElementById('gadget-fields_' + index);
    const displayTemplate = document.getElementById('subitem_' + index);

    template.remove();
    displayTemplate.remove();
  }
}
