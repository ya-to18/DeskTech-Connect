import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["name", "brand", "price", "imageUrl", "genre", "modal", "subitems"]

  updateMainForm() {
    // ターゲットの値を取得
    const name = this.nameTarget.value;
    const brand = this.brandTarget.value;
    const price = this.priceTarget.value;
    const imageUrl = this.imageUrlTarget.value;
    const genre = this.genreTarget.value;

    // 非表示
    document.querySelector('#main_form_name').value = name;
    document.querySelector('#main_form_brand').value = brand;
    document.querySelector('#main_form_price').value = price;
    document.querySelector('#main_form_imageUrl').value = imageUrl;
    document.querySelector('#main_form_genre').value = genre;

    //表示
    document.querySelector('#main_form_name_display').innerText = name;
    document.querySelector('#main_form_brand_display').innerText = brand;
    document.querySelector('#main_form_price_display').innerText = price;
    document.querySelector('#main_form_imageUrl_display').innerText = imageUrl;
    document.querySelector('#main_form_genre_display').innerText = genre;

    // モーダルをトグルする
    this.toggleModal();

    // サブアイテムを表示する
    document.querySelector('#subitems').classList.remove("hidden")
  }

  toggleModal() {
    event.preventDefault();
    this.modalTarget.classList.toggle("hidden");
  }
}
