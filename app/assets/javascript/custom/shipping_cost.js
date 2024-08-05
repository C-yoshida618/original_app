// モジュールのインポート
import { someFunction } from "./some_other_file.js";

document.addEventListener("DOMContentLoaded", () => {
  const shippingCost = () => {
    const prefectureSelect = document.getElementById('prefecture_id');
    const shippingCostDisplay = document.getElementById('shipping-cost');
    const totalPriceDisplay = document.getElementById('total-price');
    const productPrice = parseInt(document.getElementById('product-price').textContent.replace('¥', '').replace(',', '')) || 0;

    prefectureSelect.addEventListener('change', updateShippingAndTotal);
    updateShippingAndTotal();

    function updateShippingAndTotal() {
      const selectedOption = prefectureSelect.options[prefectureSelect.selectedIndex];
      const selectedPrefecture = selectedOption ? selectedOption.text : '';
      const shippingCost = (['北海道', '沖縄県'].includes(selectedPrefecture)) ? 1500 : 800;
      shippingCostDisplay.innerText = shippingCost + '円';
      const totalPrice = productPrice + shippingCost;
      totalPriceDisplay.innerText = totalPrice + '円';
    }

    // モジュールの使用
    someFunction();
  };

  shippingCost();
});
