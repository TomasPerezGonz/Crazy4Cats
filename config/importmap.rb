# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin "rails-ujs", to: "rails-ujs.js"  
pin "jquery", to: "jquery/dist/jquery.js"
pin_all_from "app/javascript/controllers", under: "controllers"

