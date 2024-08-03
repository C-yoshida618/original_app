const shippingCost = () => {
  var prefectureSelect = document.getElementById('prefecture_id');
  var shippingCostDisplay = document.getElementById('shipping-cost');
  var totalPriceDisplay = document.getElementById('total-price');
  var productPrice = parseInt(document.getElementById('product-price').textContent.replace('¥', '').replace(',', '')) || 0;
  prefectureSelect.addEventListener('change', updateShippingAndTotal);
  // 初期状態を設定
  updateShippingAndTotal();
  function updateShippingAndTotal() {
    var selectedOption = prefectureSelect.options[prefectureSelect.selectedIndex];
    var selectedPrefecture = selectedOption ? selectedOption.text : '';
    // 配送料の計算
    var shippingCost = (['北海道', '沖縄県'].includes(selectedPrefecture)) ? 1500 : 800;
    shippingCostDisplay.innerText = shippingCost + '円';
    // 合計金額の計算
    var totalPrice = productPrice + shippingCost;
    totalPriceDisplay.innerText = totalPrice + '円';
  }
};

window.addEventListener("turbo:load", shippingCost);
window.addEventListener("turbo:render", shippingCost);