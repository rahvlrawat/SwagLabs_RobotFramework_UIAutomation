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
Resource        ${EXECDIR}/resources/SwagLabs/Locators/InventoryPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/SidebarPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/ProductPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/InventoryPageKeywords.robot


Test Setup          Setup for Login
Test Teardown       Teardown for Logout


*** Variables ***

*** Test Cases ***
TC#1_Item details should be consistent across inventory and product page
    Get random item index for inventory
    Create item property locators   ${index_element}
    ${name}=    Get Text      ${item_name}
    ${description}=     Get Text     ${item_description}
    ${price}=   Get Text   ${item_price}
    Click   ${item_name}
    ${name_product}=    Get Text    ${product_name}
    ${description_product}=     Get Text     ${product_description}
    ${price_product}=   Get Text   ${product_price}
    Should Be Equal As Strings    ${name}    ${name_product}
    Should Be Equal As Strings    ${description}    ${description_product}
    Should Be Equal As Strings    ${price}      ${price_product}

TC#2_Should be able to add items to cart from product page
     Get random item index for inventory
     Create item property locators   ${index_element}
     Click   ${item_name}
     Click    ${add_item_product_button}
     Validate item is added     1

TC#3_Should be able to remove items in cart from product page
     Get random item index for inventory
     Create item property locators   ${index_element}
     Click   ${item_name}
     Click    ${add_item_product_button}
     Validate item is added     1
     Go Back
     Click    ${remove_item_product_button}
     Validate item is added through cart      0

TC#4_Multiple items can be added to cart and removed through Product page
     Get all items in inventory to add
     Set Global Variable    ${total_items}
     FOR    ${counter}    IN RANGE    1    ${total_items+1}
        Create item property locators   [${counter}]
        Open Product Page   ${item_name}
        Click    ${add_item_product_button}
        Go Back
     END
    Validate item is added through cart      ${total_items}
    Go Back
    FOR    ${counter}    IN RANGE    1    ${total_items+1}
        Create item property locators   [${counter}]
        Open Product Page   ${item_name}
        Click    ${remove_item_product_button}
        Go Back
    END
    Validate item is added through cart      0



