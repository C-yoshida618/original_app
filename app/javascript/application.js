// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import "product_price"

import "./custom/kanamakihira_app_fnc"

document.addEventListener("DOMContentLoaded", function() {
  var prefectureSelect = document.getElementById("prefecture-select");
  
  prefectureSelect.addEventListener("change", function() {
    var prefectureId = this.value;
    if (prefectureId) {
      fetch(`/shipping_costs?prefecture_id=${prefectureId}`)
        .then(response => response.json())
        .then(data => {
          var shippingCostElement = document.getElementById("shipping-cost");
          if (data.cost) {
            shippingCostElement.innerText = `送料: ¥${data.cost}`;
          } else {
            shippingCostElement.innerText = "送料: 情報なし";
          }
        })
        .catch(error => {
          console.error('Error fetching shipping cost:', error);
          document.getElementById("shipping-cost").innerText = "送料: エラー";
        });
    } else {
      document.getElementById("shipping-cost").innerText = "送料: 情報なし";
    }
  });
});
