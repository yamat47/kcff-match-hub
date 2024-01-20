import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  show(event) {
    const DEFAULT_MESSAGE = "本当によろしいですか？"

    let message = event.target.dataset.confirmButtonMessage || DEFAULT_MESSAGE;

    if (window.confirm(message) == false) {
      event.preventDefault()
      return
    }
  }
}
