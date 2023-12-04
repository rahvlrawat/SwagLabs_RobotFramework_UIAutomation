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
Open Saucelabs website from about in sidebar
    Click    ${sidebar_menu_button}
    Click    ${about}

Open sidebar
    Click    ${sidebar_menu_button}
Close sidebar
    Click    ${sidebar_close}