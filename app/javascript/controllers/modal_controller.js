import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "brand", "price", "imageUrl", "genre", "modal", "subitems"]
  connect() {
    this.gadgetIndex = 0;
  }
  updateMainForm() {

    // ターゲットの値を取得
    const name = this.nameTarget.value;
    const brand = this.brandTarget.value;
    const price = this.priceTarget.value;
    const imageUrl = this.imageUrlTarget.value;
    const genre = this.genreTarget.value;

    this.gadgetIndex++;

    const template = document.getElementById('gadget-form-template').content.cloneNode(true);
    const templateHtml = template.querySelector('div').outerHTML;
    const newForm = templateHtml.replace(/NEW_RECORD/g, this.gadgetIndex);

    document.getElementById('gadget-container').insertAdjacentHTML('beforeend', newForm);

    const displayItem = document.getElementById('gadget-display-template').content.cloneNode(true);
    displayItem.querySelector('#main_form_genre_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_imageUrl_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_name_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_brand_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_price_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_delete_btn').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#subitem').id += `_${this.gadgetIndex}`;

    const displayItemHtml = displayItem.querySelector('div').outerHTML;
    document.getElementById('gadget-display-item-container').insertAdjacentHTML('beforeend', displayItemHtml);

    // 非表示用のフォームに代入
    document.querySelector(`#main_form_name_${this.gadgetIndex}`).value = name;
    document.querySelector(`#main_form_brand_${this.gadgetIndex}`).value = brand;
    document.querySelector(`#main_form_price_${this.gadgetIndex}`).value = price;
    document.querySelector(`#main_form_imageUrl_${this.gadgetIndex}`).value = imageUrl;
    document.querySelector(`#main_form_genre_${this.gadgetIndex}`).value = genre;

    //表示用の要素に代入
    document.querySelector(`#main_form_name_display_${this.gadgetIndex}`).innerText = name;
    document.querySelector(`#main_form_brand_display_${this.gadgetIndex}`).innerText = brand;
    document.querySelector(`#main_form_price_display_${this.gadgetIndex}`).innerText = price;
    document.querySelector(`#main_form_imageUrl_display_${this.gadgetIndex}`).innerText = imageUrl;
    document.querySelector(`#main_form_genre_display_${this.gadgetIndex}`).innerText = genre;

    // モーダルをトグルする
    this.toggleModal();

    // サブアイテムを表示する
    document.querySelector(`#subitem_${this.gadgetIndex}`).classList.remove("hidden")
  }

  toggleModal() {

    event.preventDefault();
    this.nameTarget.value = "";
    this.brandTarget.value = "";
    this.priceTarget.value = "";
    this.imageUrlTarget.value = "";
    this.genreTarget.value = "";
    this.modalTarget.classList.toggle("hidden");
  }
}
