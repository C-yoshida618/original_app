# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "product_price", to: "product_price.js"

pin_all_from  "app/javascript/custom", under: "custom"
pin "card", to: "card.js"

pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true

pin "custom/shipping_cost", to: "custom/shipping_cost.js", preload: true
pin "custom/kanamakihira_app_fnc", to: "custom/kanamakihira_app_fnc.js", preload: true