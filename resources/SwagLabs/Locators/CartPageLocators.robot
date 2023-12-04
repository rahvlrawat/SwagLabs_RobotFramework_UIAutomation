*** Variables ***
#   Item locators
${cart_items}                 xpath=//div[@class="cart_item"]
${cart_item_name}             //div[@class="inventory_item_name"]
${cart_item_description}      //div[@class="inventory_item_desc"]
${cart_item_price}            //div[@class="inventory_item_price"]
${cart_item_remove_buttton}   //button[@class="btn btn_secondary btn_small cart_button"]
##############
${continue_shopping_button}     xpath=//button[@id="continue-shopping"]
${checkout_button}              xpath=//button[@id="checkout"]

####  Checkout Information
${input_first_name}     xpath=//input[@id="first-name"]
${input_last_name}     xpath=//input[@id="last-name"]
${input_postal_code}    xpath=//input[@id="postal-code"]
${checkout_error_message}   xpath=//h3[@data-test="error"]

${cancel_checkout_button}   xpath=//button[@id="cancel"]
${continue_checkout_button}     xpath=//input[@id="continue"]

${checkout_title}       xpath=//span[@class="title"]


######## Chckout Overview
${overview_items}       xpath=//div[@class="cart_item"]
${overview_item_name}       //div[@class="inventory_item_name"]
${overview_item_description}       //div[@class="inventory_item_desc"]
${overview_item_price}       //div[@class="inventory_item_price"]
${item_subtotal}       xpath=//div[@class="summary_subtotal_label"]
${item_tax}     xpath=//div[@class="summary_tax_label"]
${item_total}       xpath=//div[@class="summary_info_label summary_total_label"]
${finish_checkout_button}       //button[@id="finish"]
######## Checkout Complete
${back_to_home_button}      xpath=//button[@id="back-to-products"]
${confirmation_message}     xpath=//h2[@class="complete-header"]
${complete_confirmation_message}        xpath=//div[@class="complete-text"]
