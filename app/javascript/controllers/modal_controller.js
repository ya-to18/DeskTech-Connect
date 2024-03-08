import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["itemId",
                    "name",
                    "brand",
                    "price",
                    "imageUrl",
                    "genre",
                    "modal",
                    "makerName",
                    "makerCode",
                    "productUrl",
                    "productId",
                    "dialog",
                    "genreSelectBox"]

  connect() {
    this.gadgetIndex = 0;
    this.selectedGenreItemValue = '';
    this.selectedGenreItemId = '';
  }

  toggleModal(show = true) {
    const action = show ? 'remove' : 'add';
    this.modalTarget.classList[action]("hidden");
    if(show) {
      this.dialogTarget.showModal();
    } else {
      this.dialogTarget.close();
    }
  }

  showModal() {
    const turboFrame = document.getElementById('search_results');
    const selectedGenreKey = document.getElementById('selectedGenreKey')
    const keyword = document.getElementById('search_keyword')

    this.toggleModal(true)
    event.preventDefault();
    turboFrame.src = '/posts/rakuten_search?keyword='; // 検索キーワードなしの場合のページのsrc属性を代入
    selectedGenreKey.innerText = ''; //選択中のジャンルを初期化
    keyword.value = ''; //検索キーワードの初期化
  };

  closeModal() {
    this.toggleModal(false)
  }

  selectedGenre(event) {
    const clickedElement = event.target.closest('a');
    const pElements = clickedElement.querySelectorAll('p')

    this.selectedGenreItemValue = pElements[0].innerText;
    this.selectedGenreItemId = pElements[1].innerText;
    this.dialogTarget.close();
    document.querySelector('#selectedGenreKey').innerText = this.selectedGenreItemValue;
  }

  gadgetSelect(event) {
    const clickedElement = event.target.closest('button')
    // 選択したアイテムの情報を取得
    let price = clickedElement.querySelector('[data-modal-target=price]').innerText;
    const data = {
      name: clickedElement.querySelector('[data-modal-target=name]').innerText,
      imageUrl: clickedElement.querySelector('[data-modal-target=imageUrl]').src,
      price: price,
      noCommaPrice: price.replace(/,/g, ''),
      brand: clickedElement.querySelector('[data-modal-target=brand]').innerText,
      makerName: clickedElement.querySelector('[data-modal-target=makerName]').innerText,
      makerCode: clickedElement.querySelector('[data-modal-target=makerCode]').innerText,
      productId: clickedElement.querySelector('[data-modal-target=productId]').innerText,
      productUrl: clickedElement.querySelector('[data-modal-target=productUrl]').innerText
    };

    this.gadgetIndex++;
    this.insertTemplate('gadget-display-template', 'gadget-display-container');
    this.insertTemplate('gadget-hidden-template', 'gadget-hidden-container');
    this.insertElements(data);

    this.toggleModal(false);
  };

  insertTemplate(templateId, containerId) {
    const Template = document.getElementById(templateId).content.cloneNode(true);
    const templateHtml = Template.querySelector('div').outerHTML;
    const newForm = templateHtml.replace(/index/g, this.gadgetIndex);
    // templateのHTMLをフォームに挿入
    document.getElementById(containerId).insertAdjacentHTML('beforeend', newForm);
  }

  insertElements(data) {
    //表示用の要素に代入
    document.querySelector(`#display_name_${this.gadgetIndex}`).innerText = data.name;
    document.querySelector(`#display_brand_${this.gadgetIndex}`).innerText = data.brand;
    document.querySelector(`#display_price_${this.gadgetIndex}`).innerText = '¥' + data.price;
    document.querySelector(`#display_imageUrl_${this.gadgetIndex}`).src = data.imageUrl;
    document.querySelector(`#display_genre_${this.gadgetIndex}`).innerText = this.selectedGenreItemValue;
    // 非表示用のフォームに代入
    document.querySelector(`#hidden_name_${this.gadgetIndex}`).value = data.name;
    document.querySelector(`#hidden_brand_${this.gadgetIndex}`).value = data.brand;
    document.querySelector(`#hidden_price_${this.gadgetIndex}`).value = data.noCommaPrice;
    document.querySelector(`#hidden_imageUrl_${this.gadgetIndex}`).value = data.imageUrl;
    document.querySelector(`#hidden_genre_${this.gadgetIndex}`).value = this.selectedGenreItemId;
    document.querySelector(`#hidden_productUrl_${this.gadgetIndex}`).value = data.productUrl;
    document.querySelector(`#hidden_productId_${this.gadgetIndex}`).value = data.productId;
    document.querySelector(`#hidden_makerName_${this.gadgetIndex}`).value = data.makerName;
    document.querySelector(`#hidden_makerCode_${this.gadgetIndex}`).value = data.makerCode;
  }
};
