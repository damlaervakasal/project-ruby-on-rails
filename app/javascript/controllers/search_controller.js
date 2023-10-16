import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['formInput', 'formSubmit', 'checkbox', 'textField'];

  connect() {
    console.log("hello")
  }

    search_field(event) {
      console.log(event.currentTarget.value)
      this.formInputTarget.value = event.currentTarget.value
      this.formSubmitTarget.click()

    }
  
    copyCheckbox(event) {
      const text = event.currentTarget.textContent.trim();
      const spanElement = document.createElement("span");
      const template = document.getElementById("user_" + event.currentTarget.dataset['userIdValue']);
      console.log(template);

      const templateClone = template.cloneNode(true);
      
      const newCheckbox = templateClone.querySelector('input[type="checkbox"]');
      newCheckbox.name = `card[user_ids][]`;

      spanElement.textContent = text;
      newCheckbox.setAttribute('value', 'user_id'); // value özelliğini "user_id" olarak ayarla
      //newCheckbox.name = `card[user_ids][${text}]`; // name özelliğini belirli bir değere göre ayarla (örneğin metin)
  
    
      
      newCheckbox.type = 'checkbox'
      newCheckbox.checked = true
      console.log("again")
      
      this.textFieldTarget.insertAdjacentElement("beforebegin", spanElement);
      const checkElement = document.getElementById("check");
      checkElement.appendChild(templateClone);      

  }

}