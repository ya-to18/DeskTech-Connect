import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["itemId", "name", "brand", "price", "imageUrl", "genre", "modal","makerName","makerCode","productUrl","productId", "subitems", "dialog", "genreSelectBox"]
  connect() {
    this.gadgetIndex = 0;
    this.selectedGenreItemKey = '';
    this.selectedGenreItemValue = '';
  }

  showModal() {
    const dialog = this.dialogTarget;
    const turboFrame = document.getElementById('search_results');
    const selectedGenreKey = document.getElementById('selectedGenreKey')
    const keyword = document.getElementById('search_keyword')

    event.preventDefault();
    turboFrame.src = '/rakuten_search?keyword='; // 検索キーワードなしの場合のページのsrc属性を代入
    selectedGenreKey.innerText = ''; //選択中のジャンルを初期化
    keyword.value = ''; //検索キーワードの初期化
    dialog.showModal();
    this.modalTarget.classList.remove("hidden");
  };

  closeModal() {
    this.modalTarget.classList.add("hidden");
    this.dialogTarget.close();
  }

  dialogClose() {
    this.dialogTarget.close();
    this.modalTarget.classList.add("hidden");
  }

  selectedGenre(event) {
    const clickedElement = event.target.closest('a');
    const pElements = clickedElement.querySelectorAll('p')

    this.selectedGenreItemKey = pElements[0].innerText;
    this.selectedGenreItemValue = pElements[1].innerText;
    this.dialogTarget.close();
    document.querySelector('#selectedGenreKey').innerText = this.selectedGenreItemKey;
  }

  itemSelect(event) {
    const clickedElement = event.target.closest('button')
    const imageUrl = clickedElement.querySelector('[data-modal-target=imageUrl]').src;
    const name = clickedElement.querySelector('[data-modal-target=name]').innerText;
    const price = clickedElement.querySelector('[data-modal-target=price]').innerText;
    const noCommaPrice = price.replace(/,/g, '')
    const brand = clickedElement.querySelector('[data-modal-target=brand]').innerText;
    const makerName = clickedElement.querySelector('[data-modal-target=makerName]').innerText;
    const makerCode = clickedElement.querySelector('[data-modal-target=makerCode]').innerText;
    const productUrl = clickedElement.querySelector('[data-modal-target=productUrl]').innerText;
    const productId = clickedElement.querySelector('[data-modal-target=productId]').innerText;

    this.gadgetIndex++;

    const template = document.getElementById('gadget-form-template').content.cloneNode(true);
    const templateHtml = template.querySelector('div').outerHTML;
    const newForm = templateHtml.replace(/NEW_RECORD/g, this.gadgetIndex);

    document.getElementById('gadget-hidden-display-item-container').insertAdjacentHTML('beforeend', newForm);

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
    document.querySelector(`#main_form_price_${this.gadgetIndex}`).value = noCommaPrice;
    document.querySelector(`#main_form_imageUrl_${this.gadgetIndex}`).value = imageUrl;
    document.querySelector(`#main_form_genre_${this.gadgetIndex}`).value = this.selectedGenreItemValue;
    document.querySelector(`#main_form_makerName_${this.gadgetIndex}`).value = makerName;
    document.querySelector(`#main_form_makerCode_${this.gadgetIndex}`).value = makerCode;
    document.querySelector(`#main_form_productUrl_${this.gadgetIndex}`).value = productUrl;
    document.querySelector(`#main_form_productId_${this.gadgetIndex}`).value = productId;

    //表示用の要素に代入
    document.querySelector(`#main_form_name_display_${this.gadgetIndex}`).innerText = name;
    document.querySelector(`#main_form_brand_display_${this.gadgetIndex}`).innerText = brand;
    document.querySelector(`#main_form_price_display_${this.gadgetIndex}`).innerText = '¥' + price;
    document.querySelector(`#main_form_imageUrl_display_${this.gadgetIndex}`).src = imageUrl;
    document.querySelector(`#main_form_genre_display_${this.gadgetIndex}`).innerText = this.selectedGenreItemKey;

    // モーダルをトグルする
    this.closeModal();
    this.dialogTarget.close();

    // サブアイテムを表示する
    document.querySelector(`#subitem_${this.gadgetIndex}`).classList.remove("hidden");
  };
};
