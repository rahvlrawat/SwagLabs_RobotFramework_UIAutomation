*** Variables ***
${Logo}                  xpath=//div[@class="app_logo"]
${cart_link}              xpath=//a[@class="shopping_cart_link"]
${sort_select_dropdown}     xpath=//select[@class="product_sort_container"]
${shopping_cart_badge}      xpath=//span[@class="shopping_cart_badge"]
${page_title}               xpath=//span[@class="title"]



######################               ITEM BOX                 ####################

${items}                    xpath=//*[@class="inventory_item"]
${image_path}               //a/img
${name_path}                //div[@class='inventory_item_description']//a/div
${description path}         //div[@class='inventory_item_desc']
${price_path}               //div[@class='pricebar']/div
${add_to_cart_button}       //button[@class='btn btn_primary btn_small btn_inventory ']
${remove_button}            //button[@class='btn btn_secondary btn_small btn_inventory ']




######################               FOOTER                 ####################

${twitter_link}           xpath=//a[normalize-space()="Twitter"]
${facebook_link}          xpath=//a[normalize-space()="Facebook"]
${linkedin_link}          xpath=//a[normalize-space()="LinkedIn"]
${footer}                   xpath=//footer[@class="footer"]
${footer_copyright}         xpath=//div[@class="footer_copy"]


#############################        CART TIEM     ###########################
${cart_items}                xpath=//div[@class='cart_item']