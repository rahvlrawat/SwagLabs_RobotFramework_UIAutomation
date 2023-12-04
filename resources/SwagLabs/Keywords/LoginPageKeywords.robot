*** Settings ***
Library             Browser


*** Keywords ***
Go to Site
    [Arguments]    ${url}
    New Page       ${url}

Setup the Browser and Open SwagLabs Login Page
    New Browser    chromium     args=["--start-maximized"]      #headless=true
    New Context    viewport=${None}
    Go to Site      ${URL}

Login SwagLabs
    [Arguments]     ${username}=standard_user   ${password}=secret_sauce
    Enter Credentials    ${username}    ${password}
    Click    ${login_button}


Enter Credentials
    [Documentation]    keyword to enter credentials on login screen
    [Arguments]    	${username}=${EMPTY}   ${password}=${EMPTY}

    Type Text      ${username_field}      ${username}
    Type Secret    ${password_field}      $password
Get Error Message
    [Arguments]     ${expected_error_message}
    Get Text    ${Error_message_block}  ==   ${expected_error_message}


