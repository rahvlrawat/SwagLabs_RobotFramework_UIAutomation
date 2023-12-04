*** Settings ***
Library         Browser     timeout=0:01:00
Library         CSVLibrary
Library         BuiltIn
Library         Collections
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/LoginPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/SidebarPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/LoginPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/InventoryPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/InventoryPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/SidebarPageLocators.robot


Test Setup          Setup for Login
Test Teardown       Teardown for Logout


*** Variables ***

*** Test Cases ***
TC#1_Should be able to navigate back to inventory page from sidebar option when on cart page
    When Get random item index for inventory
    And Add a random item to cart       ${index_element}
    And Validate item is added through cart     1
    And Go to inventory page
    Then Get Element    ${Logo}

TC#2_Should be able to navigate back to inventory page from sidebar option when on product page
    When Get random item index for inventory
    And Create item property locators   ${index_element}
    And Open Product Page   ${item_name}
    And Go to inventory page
    Then Get Element      ${Logo}

TC#3_Should be able to open Saucelabs website from sidebar option
    When Open Saucelabs website from about in sidebar
    Then Get Url    ==  https://saucelabs.com/
    And Go Back


TC#4_Should be able to open and close the sidebar
    When Open sidebar
    And Close sidebar
    Then Get Element    ${sidebar_menu_button}

TC#5_Should be able to reset app state from sidebar option
    Given Add all items to cart
    And Validate item is added      ${total_items}
    When Open sidebar
    And Click   ${reset_app}
    Then Validate item is added through cart      0
    And Close sidebar