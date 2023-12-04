*** Settings ***
Library         Browser     timeout=0:01:00
Library         CSVLibrary
Resource        ${EXECDIR}/resources/SwagLabs/Keywords/LoginPageKeywords.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/LoginPageLocators.robot
Resource        ${EXECDIR}/resources/SwagLabs/Locators/InventoryPageLocators.robot
Test Setup          Setup the Browser and Open SwagLabs Login Page
Test Teardown       Close Browser
Test Template       Run Login Cases
Library     DataDriver      file=${EXECDIR}/resources/SwagLabs/Testdata/login_data.csv     dialect=excel     encoding=UTF-8

*** Variables ***


*** Test Cases ***

Positive and Negative Login Scenarios

*** Keywords ***
Run Login Cases
    [Arguments]     ${state}    ${username}     ${password}     ${error_message}
        Login SwagLabs    ${username}       ${password}
        IF      '${state}' == 'negative'
             Get Error Message      ${error_message}
        ELSE
             Get Element      ${Logo}
        END

