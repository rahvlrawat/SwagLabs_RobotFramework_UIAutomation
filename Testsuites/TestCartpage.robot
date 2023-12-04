*** Settings ***
Library         Browser     timeout=0:01:00
Library         CSVLibrary
Library         BuiltIn
Library         Collections
Library         DependencyLibrary
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/LoginPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/SidebarPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/LoginPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/InventoryPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/CartPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/InventoryPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/SidebarPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/ProductPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/CartPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/InventoryPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/OverviewPageKeywords.robot

Test Setup          Setup for Login
Test Teardown       Teardown for Logout


*** Variables ***

*** Test Cases ***
TC#1_Item details should be consistent across inventory and cart page
    Get random item index for inventory
    Add a random item to cart       ${index_element}
    ${inventory_name}=    Get Text      ${item_name}
    ${inventory_description}=     Get Text     ${item_description}
    ${inventory_price}=   Get Text   ${item_price}
    Validate item is added      1
    Create cart item property locators      [1]
    ${cart_name}=   Get Text    ${cart_item_name}
    ${cart_description}=    Get Text    ${cart_item_description}
    ${cart_price}=  Get Text    ${cart_item_price}
    Should Be Equal    ${inventory_name}    ${cart_name}
    Should Be Equal    ${inventory_description}    ${cart_description}
    Should Be Equal    ${inventory_price}    ${cart_price}

TC#2_Should be able to remove items from cart
    Get random item index for inventory
    Add a random item to cart       ${index_element}
    Validate item is added      1
    Create cart item property locators  [1]
    Click     ${cart_item_remove_button}
    Get Element Count    ${cart_items}      ==      0



TC#3_Should be able to go back to inventory using "Continue Shopping" button
    Get random item index for inventory
    Add a random item to cart       ${index_element}
    Validate item is added      1
    Click   ${continue_shopping_button}
    Get Text    ${page_title}    ==      Products

TC#4_Should not be able to checkout the items in cart with empty details
    When Get random item index for inventory
    And Add a random item to cart       ${index_element}
    And Validate item is added      1
    Click    ${checkout_button}
    Get Text    ${checkout_title}   ==  Checkout: Your Information
    Click    ${continue_checkout_button}
    Get Text    ${checkout_error_message}   ==  Error: First Name is required
    Type Text    ${input_first_name}    Test
    Click    ${continue_checkout_button}
    Get Text    ${checkout_error_message}   ==  Error: Last Name is required
    Type Text    ${input_last_name}    User
    Click    ${continue_checkout_button}
    Get Text    ${checkout_error_message}   ==  Error: Postal Code is required

TC#5_Should not be able to checkout the items in cart with invalid details
    When Get random item index for inventory
    And Add a random item to cart       ${index_element}
    And Validate item is added      1
    Click    ${checkout_button}
    Get Text    ${checkout_title}   ==  Checkout: Your Information
    Type Text    ${input_first_name}    1234
    Type Text    ${input_last_name}    213
    Type Text    ${input_postal_code}    1sd3
    Click    ${continue_checkout_button}
    Get Element    ${checkout_error_message}

TC#6_Should be able to checkout the items in cart with valid details
    Get random item index for inventory
    Add a random item to cart       ${index_element}
    Validate item is added      1
    Click    ${checkout_button}
    Get Text    ${checkout_title}   ==  Checkout: Your Information
    Type Text    ${input_first_name}    Test
    Type Text    ${input_last_name}    User
    Type Text    ${input_postal_code}    411028
    Click    ${continue_checkout_button}
    Get Text    ${checkout_title}   ==  Checkout: Overview
    Get Element Count    ${overview_items}  ==  1
    Click    ${finish_checkout_button}
    Get Text    ${confirmation_message}     ==  Thank you for your order!

TC#7_Should be able to fetch correct details on Checkout overview page
    Get random item index for inventory
    Add a random item to cart       ${index_element}
    ${inventory_name}=    Get Text      ${item_name}
    ${inventory_description}=     Get Text     ${item_description}
    ${inventory_price}=   Get Text   ${item_price}
    Validate item is added      1
    Click    ${checkout_button}
    Get Text    ${checkout_title}   ==  Checkout: Your Information
    Type Text    ${input_first_name}    Test
    Type Text    ${input_last_name}    User
    Type Text    ${input_postal_code}    411028
    Click    ${continue_checkout_button}
    Get Text    ${checkout_title}   ==  Checkout: Overview
    Create overview item property locators  [1]
    Get Text    ${overview_item_name}   ==      ${inventory_name}
    Get Text    ${overview_item_description}    ==      ${inventory_description}
    Get Text    ${overview_item_price}      ==     ${inventory_price}
    Get Text    ${item_subtotal}    ==     Item total: ${inventory_price}

TC#8_Should be able to cancel the checkout from the Checkout overview page
    Get random item index for inventory
    Add a random item to cart       ${index_element}
    ${inventory_name}=    Get Text      ${item_name}
    ${inventory_description}=     Get Text     ${item_description}
    ${inventory_price}=   Get Text   ${item_price}
    Validate item is added      1
    Click    ${checkout_button}
    Get Text    ${checkout_title}   ==  Checkout: Your Information
    Type Text    ${input_first_name}    Test
    Type Text    ${input_last_name}    User
    Type Text    ${input_postal_code}    411028
    Click    ${continue_checkout_button}
    Get Text    ${checkout_title}   ==  Checkout: Overview
    Click    ${cancel_checkout_button}
    Get Text    ${page_title}   ==  Products