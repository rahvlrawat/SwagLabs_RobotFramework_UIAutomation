*** Settings ***
Library         Browser
Library         CSVLibrary
Library         BuiltIn
Library         Collections
Library         String


Resource        ${EXECDIR}/resources/SwagLabs/Keywords/LoginPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/LoginPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/InventoryPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/ProductPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/SidebarPageLocators.robot

*** Keywords ***
Setup for Login
    [Arguments]     ${username}=standard_user   ${password}=secret_sauce
    Setup the Browser and Open SwagLabs Login Page
    Login SwagLabs      ${username}   ${password}

Teardown for Logout
    Logout from application
    Close Browser

Go to inventory page
    Click    ${sidebar_menu_button}
    Click    ${inventory}

Get random item index for inventory
    ${index}=  Generate Random String  1    123456
    ${index}=   Convert To Integer  ${index}
    ${index_element}    Create List     ${index}
    Set Test Variable    ${index}
    Set Test Variable    ${index_element}

Add a random item to cart
    [Arguments]     ${index_element}
    Create item property locators   ${index_element}
    Scroll To Element   ${add_item_to_cart}
    Click    ${add_item_to_cart}
    Get Text    ${item_remove_button}


Add all items to cart   
    Get all items in inventory to add
    FOR    ${counter}    IN RANGE    1    ${total_items+1}
        Add a random item to cart       [${counter}]
    END
    
Remove an item from cart
    Click    ${item_remove_button}

Create item property locators
    [Arguments]     ${index_element}
    ${item_path}        Catenate        ${items}${index_element}
    ${item_image}       Catenate        ${item_path}${image_path}
    ${item_name}        Catenate        ${item_path}${name_path}
    ${item_description}     Catenate        ${item_path}${description_path}
    ${item_price}     Catenate        ${item_path}${price_path}
    ${add_item_to_cart}      Catenate     ${item_path}${add_to_cart_button}
    ${item_remove_button}       Catenate   ${item_path}${remove_button}

    Set Test Variable    ${item_path}
    Set Test Variable    ${item_image}
    Set Test Variable    ${item_name}
    Set Test Variable    ${item_description}
    Set Test Variable    ${item_price}
    Set Test Variable    ${add_item_to_cart}
    Set Test Variable    ${item_remove_button}

Item is added to cart
    [Arguments]     ${remove_button}=${item_remove_button}
    Get Element     ${item_remove_button}

Validate item is added through shopping_cart_badge
    [Arguments]     ${no_of_items_added}
    ${string}=  Convert To String   ${no_of_items_added}
    Get Text    ${shopping_cart_badge}  ==  ${string}

Validate item is added through cart
    [Arguments]     ${no_of_items_added}
    Click    ${cart_link}
    Get Text    ${page_title}   ==  Your Cart
    Get Element Count    ${cart_items}  ==  ${no_of_items_added}

Validate item is added
    [Arguments]     ${no_of_items_added}
    Validate item is added through shopping_cart_badge     ${no_of_items_added}
    Validate item is added through cart     ${no_of_items_added}

Logout from application
    Click    ${sidebar_menu_button}
    Click    ${logout}

Get all items in inventory to add
    ${total_items}=     Get Element Count       ${items}
    Set Test Variable    ${total_items}

Get all item name link count in inventory
    ${item_images}        Catenate        ${items}${image_path}
    ${total_item_name_links}=     Get Element Count      ${item_images}
    Set Test Variable    ${total_item_name_links}

Open Product Page
    [Arguments]     ${item_name_locator}
    Click    ${item_name_locator}
    Get Element    ${back_to_inventory_button}


Get all item image count link in inventory
    ${item_names}        Catenate        ${items}${name_path}
    ${total_item_images}=     Get Element Count     ${item_names}
    Set Test Variable    ${total_item_name_links}


Validate inventory item have corresponding name and image with links
    [Arguments]     ${total_items}=${total_items}
    ...   ${total_item_name_links}=${total_item_name_links}
    ...   ${total_item_name_links}=${total_item_name_links}
    Should be equal       ${total_items}    ${total_item_name_links}
    Should be equal       ${total_items}    ${total_item_name_links}

Sort inventory
    [Arguments]     ${value}
    Select Options By      ${sort_select_dropdown}      value       ${value}

Validate selected sort
    [Arguments]     ${option}
    ${selected_option}=    Get Selected Options      ${sort_select_dropdown}
    Should be equal     ${selected_option}[0]      ${option}

Validate alphabetical sorting is applied correctly
    [Arguments]     ${option}
    Get all items in inventory to add
    Create item property locators   [1]
    ${item_name_first}=     Get text    ${item_name}
    Create item property locators   [${total_items}]
    ${item_name_last}=      Get text    ${item_name}
    IF  '${option}'=='za'
         Should Be True     '${item_name_first}' > '${item_name_last}'
    ELSE
         Should Be True     '${item_name_first}' < '${item_name_last}'
    END


Validate price sorting is applied correctly
    [Arguments]     ${option}
    Get all items in inventory to add
    Create item property locators   [1]
    ${item_price_first}=     Get text    ${item_price}
    Create item property locators   [${total_items}]
    ${item_price_last}=      Get text    ${item_price}
    ${item_price_first}=    Evaluate    float('${item_price_first}'.replace('$', ''))
    ${item_price_last}=    Evaluate    float('${item_price_last}'.replace('$', ''))
    IF  '${option}'=='lohi'
        Should Be True      ${item_price_first} < ${item_price_last}
    ELSE
        Should Be True      ${item_price_first} > ${item_price_last}
    END

Open Sauce Labs twitter page through footer link
    Scroll To Element     ${twitter_link}
    Click    ${twitter_link}

Open sauce labs facebook page through footer link
    Scroll To Element       ${facebook_link}
    Click   ${facebook_link}

Open sauce labs linkedin page through footer link
    Scroll To Element       ${linkedin_link}
    Click   ${linkedin_link}

Validate the newly opened page url
    [Arguments]     ${url}
    ${previous_page}=    Switch Page    NEW
    Take Screenshot
    Get Url     ==  ${url}
    Close Page