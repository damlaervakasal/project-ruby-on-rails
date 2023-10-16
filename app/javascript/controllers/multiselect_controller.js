import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets=['checkbox'];

  connect() {
    this.selectedOptions = [];
  }

  toggleOption(event){
    const button = event.currentTarget;
    const listItem = button.parentElement;
    const checkbox = listItem.querySelector("[data-multiselect-target= 'checkbox']");
    const optionName = checkbox.value;

    if (checkbox.checked) {
      this.selectedOptions.push(optionName);
    } else {
      this.selectedOptions.push(optionName) = this.selectedOptions.filter(name => name !== optionName); 
    }
    this.updateTextField();
  }
    
  updateTextField() {
    const textField = this.element.querySelector("#form-text-field");
    textField.value = this.selectedOptions.join(", ");


  }

}