import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  moveTo(event) {
    event.preventDefault()

    const href = event.currentTarget.dataset.href

    window.location.href = href
  }
}
