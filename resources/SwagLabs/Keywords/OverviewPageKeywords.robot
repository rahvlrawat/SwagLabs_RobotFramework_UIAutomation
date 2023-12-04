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

Create overview item property locators
    [Arguments]     ${index_element}
    ${overview_item_path}        Catenate        ${overview_items}${index_element}
    ${overview_item_name}        Catenate        ${overview_item_path}${overview_item_name}
    ${overview_item_description}     Catenate        ${overview_item_path}${overview_item_description}
    ${overview_item_price}     Catenate        ${overview_item_path}${overview_item_price}

    Set Test Variable    ${overview_item_path}
    Set Test Variable    ${overview_item_name}
    Set Test Variable    ${overview_item_description}
    Set Test Variable    ${overview_item_price}
