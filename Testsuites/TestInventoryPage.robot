*** Settings ***
Library         Browser     timeout=0:01:00
Library         CSVLibrary
Library         BuiltIn
Library         Collections
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/LoginPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/LoginPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/InventoryPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/InventoryPageLocators.robot

Test Setup          Setup for Login
Test Teardown       Teardown for Logout

*** Variables ***

*** Test Cases ***
TC#1_Should be able to select random item and go to cart page as a standard_user
    When Get random item index for inventory
    And Add a random item to cart       ${index_element}
    Then Validate item is added      1

TC#2_Should be able to add all items to the cart as a standard_user
    When Add all items to cart
    Then Validate item is added      ${total_items}


TC#3_Should be able to remove selected item from cart as a standard_user
    When Get random item index for inventory
    And Add a random item to cart       ${index_element}
    And Validate item is added      1
    And Go to inventory page
    And Remove an item from cart
    Then Validate item is added through cart      0


TC#4_On logging back in post logout added item should persist
    When Get random item index for inventory
    And Add a random item to cart       ${index_element}
    And Validate item is added      1
    And Logout from application
    And Login SwagLabs
    Then Item is added to cart

TC#5_All items in inventory should have link for respective product page
    Get all items in inventory to add
    Get all item name link count in inventory
    Get all item image count link in inventory
    Validate inventory item have corresponding name and image with links

TC#6_Using dropdown sort inventory based on Name Ascending
    Sort inventory  az
    Validate selected sort    Name (A to Z)
    Validate alphabetical sorting is applied correctly      az

TC#7_Using dropdown sort inventory based on Name Descending
    Sort inventory  za
    Validate selected sort    Name (Z to A)
    Validate alphabetical sorting is applied correctly      za

TC#8_Using dropdown sort inventory based on Price Ascending
    Sort inventory  lohi
    Validate selected sort    Price (low to high)
    Validate price sorting is applied correctly      lohi

TC#9_Using dropdown sort inventory based on Price Descending
    Sort inventory  hilo
    Validate selected sort    Price (high to low)
    Validate price sorting is applied correctly      hilo


TC#10_Should be able to open sauce labs twitter page in a new window through footer link
    Open Sauce Labs twitter page through footer link
    Validate the newly opened page title        https://twitter.com/saucelabs

TC#11_Should be able to open sauce labs facebook page in a new window through footer link
    Open sauce labs facebook page through footer link
    Validate the newly opened page title        https://www.facebook.com/saucelabs

TC#12_Should be able to open sauce labs linkedin page in a new window through footer link
    Open sauce labs linkedin page through footer link
    Validate the newly opened page title        https://www.linkedin.com/company/sauce-labs/