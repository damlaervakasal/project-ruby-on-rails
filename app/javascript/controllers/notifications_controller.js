import { Controller } from "@hotwired/stimulus";
import { enter, leave } from "el-transition";
 
let TIMEOUT_MILLISECONDS = 2000;
 
export default class extends Controller {
  connect() {
    enter(this.element).then(() => {
      setTimeout(() => {
        this.close();
      }, TIMEOUT_MILLISECONDS);
    });
  }
 
  close() {
    leave(this.element).then(() => {
      this.element.remove();
    });
  }
}