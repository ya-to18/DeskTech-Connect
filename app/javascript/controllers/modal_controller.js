import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  // static targets = ["name", "brand", "price", "imageUrl", "genre", "modal", "subitems"]
  static targets = ["itemId", "name", "maker", "price", "imageUrl", "genre", "modal", "subitems", "dialog", "genreSelectBox"]
  connect() {
    this.gadgetIndex = 0;
    this.selectedGenreItem = '';
  }

  showModal() {
    const dialog = this.dialogTarget;

    event.preventDefault();
    dialog.showModal();
    this.modalTarget.classList.toggle("hidden");
  };

  closeModal() {
    this.modalTarget.classList.toggle("hidden");
    this.dialogTarget.close();
  }

  dialogClose() {
    this.dialogTarget.close();
    this.modalTarget.classList.toggle("hidden");
  }

  selectedGenre(event) {
    const clickedElement = event.target.closest('a')

    this.selectedGenreItem = clickedElement.innerText;
    this.dialogTarget.close();
    document.querySelector('#selectedGenreText').innerText = this.selectedGenreItem;
  }

  itemSelect(event) {
    const clickedElement = event.target.closest('button')
    const imageUrl = clickedElement.querySelector('[data-modal-target=imageUrl]').src;
    const name = clickedElement.querySelector('[data-modal-target=name]').innerText;
    const price = clickedElement.querySelector('[data-modal-target=price]').innerText;
    const noCommaPrice = price.replace(/,/g, '')
    const maker = clickedElement.querySelector('[data-modal-target=maker]').innerText;

    this.gadgetIndex++;

    const template = document.getElementById('gadget-form-template').content.cloneNode(true);
    const templateHtml = template.querySelector('div').outerHTML;
    const newForm = templateHtml.replace(/NEW_RECORD/g, this.gadgetIndex);

    document.getElementById('gadget-hidden-display-item-container').insertAdjacentHTML('beforeend', newForm);

    const displayItem = document.getElementById('gadget-display-template').content.cloneNode(true);
    displayItem.querySelector('#main_form_genre_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_imageUrl_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_name_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_maker_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_price_display').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#main_form_delete_btn').id += `_${this.gadgetIndex}`;
    displayItem.querySelector('#subitem').id += `_${this.gadgetIndex}`;

    const displayItemHtml = displayItem.querySelector('div').outerHTML;
    document.getElementById('gadget-display-item-container').insertAdjacentHTML('beforeend', displayItemHtml);

    // 非表示用のフォームに代入
    document.querySelector(`#main_form_name_${this.gadgetIndex}`).value = name;
    document.querySelector(`#main_form_maker_${this.gadgetIndex}`).value = maker;
    document.querySelector(`#main_form_price_${this.gadgetIndex}`).value = noCommaPrice;
    document.querySelector(`#main_form_imageUrl_${this.gadgetIndex}`).value = imageUrl;
    document.querySelector(`#main_form_genre_${this.gadgetIndex}`).value = this.selectedGenreItem;

    //表示用の要素に代入
    document.querySelector(`#main_form_name_display_${this.gadgetIndex}`).innerText = name;
    document.querySelector(`#main_form_maker_display_${this.gadgetIndex}`).innerText = maker;
    document.querySelector(`#main_form_price_display_${this.gadgetIndex}`).innerText = price;
    document.querySelector(`#main_form_imageUrl_display_${this.gadgetIndex}`).src = imageUrl;
    document.querySelector(`#main_form_genre_display_${this.gadgetIndex}`).innerText = this.selectedGenreItem;

    // モーダルをトグルする
    this.closeModal();
    this.dialogTarget.close();

    // サブアイテムを表示する
    document.querySelector(`#subitem_${this.gadgetIndex}`).classList.remove("hidden");
  };
};
