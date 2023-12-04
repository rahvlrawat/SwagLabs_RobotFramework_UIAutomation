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
Resource        ${EXECDIR}/resources/SwagLabs/Locators/CartPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/InventoryPageKeywords.robot

*** Keywords ***

Create cart item property locators
    [Arguments]     ${index_element}
    ${cart_item_path}        Catenate        ${cart_items}${index_element}
    ${cart_item_name}        Catenate        ${cart_item_path}${cart_item_name}
    ${cart_item_description}     Catenate        ${cart_item_path}${cart_item_description}
    ${cart_item_price}     Catenate        ${cart_item_path}${cart_item_price}
    ${cart_item_remove_button}       Catenate   ${cart_item_path}${cart_item_remove_buttton}

    Set Test Variable    ${cart_item_path}
    Set Test Variable    ${cart_item_name}
    Set Test Variable    ${cart_item_description}
    Set Test Variable    ${cart_item_price}
    Set Test Variable    ${cart_item_remove_button}