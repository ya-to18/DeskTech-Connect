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
    const delete_field = document.getElementById('delete_flag_' + index);

    if (index >= 10000) {
      displayTemplate.remove();
      delete_field.value = '1'
    } else {
      template.remove();
      displayTemplate.remove();
    }
  }
}
