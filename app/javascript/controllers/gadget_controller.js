import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="gadget"
export default class extends Controller {
  static targets = [ "btn" ]
  connect() {
    this.btnTargets[0].classList.remove("bg-white")
    this.btnTargets[0].classList.add("bg-slate-200")
  }

  activate(event) {
    this.btnTargets.forEach((btn) => {
      btn.classList.remove("bg-white")
      btn.classList.remove("bg-slate-200")
    })
    event.currentTarget.classList.add("bg-slate-200")
  }
}
