# NOTE: readme.txt contains important information you need to take into account
# before running this suite.

*** Settings ***
Library              QForce
Resource             ../resources/common.robot
Suite Setup          Setup Browser
Suite Teardown       End suite


*** Variables ***
${username}          swapna.vellanki@creative-bear-dkwss7.com
${password}          Niharika@2012
${login_url}         https://login.salesforce.com
${jwt_client_id}     # SHOULD BE GIVEN IN CRT SENSITIVE VARIABLES SECTION
${private_key}       # SHOULD BE GIVEN IN CRT SENSITIVE VARIABLES SECTION
${secret}            ${NONE}                     # SHOULD BE GIVEN IN CRT SENSITIVE VARIABLES SECTION IF NON-ADMIN (OTP) MFA IS NEEDED


*** Test Cases ***
Entering A Lead
    [tags]           Lead
    Setup Browser
    GoTo             ${login_url}
    ClickText        Log In with Username
    TypeText         Username                    ${username}
    ClickText        Log In
    ClickText        Use Custom Domain
    TypeText         Custom Domain               creative-bear-dkwss7-dev-ed.trailblaze.my.salesforce.com
    ClickText        Continue
    TypeText         Username                    ${username}
    #                PressKey                    //body                      ENTER
    ClickText        Log In
    
    TypeText         Password                    ${password}                 timeout=5s
    ClickText        Log In
    # ClickText        Remind Me Later
    LaunchApp        Sales

    ClickText        Accounts
    ClickText        New
    UseModal         On
    TypeText         *Account Name               tett
    ClickText        Save                        partial_match=False
    UseModal         Off
    VerifyText       tett
