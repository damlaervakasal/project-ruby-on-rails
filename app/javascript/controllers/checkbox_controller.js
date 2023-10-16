import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["checkbox", "textField"]

  toggleCheckbox(event) {
    console.log("sdkfhs");
    const checkbox = event.currentTarget
    const li = checkbox.closest("li")

    checkbox.checked = true;

    if (checkbox.checked) {
      const text = li.textContent.trim()
      this.textFieldTarget.value = text
    } else {
      this.textFieldTarget.value = ""
    }
  }
}