import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static CONTAINER_SELECTOR = ".js-admin-form-select-container"
  static TOGGLE_SELECTOR = ".js-admin-form-select-toggle"

  static loadDefaultState() {
    document.querySelectorAll(this.CONTAINER_SELECTOR).forEach((container) => {
      const selected = container.querySelector("input[type=radio]:checked")

      this.updateCurrentState({ container, selected })

      document.addEventListener("click", (event) => {
        if (!container.contains(event.target)) {
          this.resetToggle({ container })
        }
      })
    })
  }

  static updateCurrentState({ container, selected }) {
    const copyTarget = container.querySelector(".js-admin-form-select-button-selected")

    const listItemContainer = selected.closest(".js-admin-form-select-list-item-container")
    const listItem = listItemContainer.querySelector(".js-admin-form-select-list-item")

    copyTarget.innerHTML = listItem.innerHTML
  }

  static resetToggle({ container }) {
    const toggle = container.querySelector(this.TOGGLE_SELECTOR)
    toggle.checked = false
  }

  static afterLoad() {
    // called as soon as registered so DOM may not have loaded yet
    // refs: https://stimulus.hotwired.dev/reference/controllers
    if (document.readyState == "loading") {
      document.addEventListener("DOMContentLoaded", () => {
        this.loadDefaultState()
      })
    } else {
      this.loadDefaultState()
    }
  }

  select(event) {
    const selected = event.target
    const container = selected.closest(this.constructor.CONTAINER_SELECTOR)
    const toggle = container.querySelector(this.constructor.TOGGLE_SELECTOR)

    this.constructor.updateCurrentState({ container, selected })
    this.constructor.resetToggle({ container })
  }
}
