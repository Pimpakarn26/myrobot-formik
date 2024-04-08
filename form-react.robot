*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem

*** Variables ***
${BROWSER}    Chrome
${URL}        http://localhost:5173/

*** Test Cases ***
Fill Registration Form
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input TH Information
    Input EN Information
    Input Birthday
    Input ID Card
    Input Password
    Input Phone Number
    Input Email
    Click Checkbox
    Click Submit Button
    Wait Until Page Contains    Successfully submitted!
    Close Browser

Check Invalid Name TH
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Invalid TH Information
    Click Submit Button
    Wait Until Page Contains    Must be in Thai only
    Close Browser

Check Invalid Name EN
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Invalid EN Information
    Click Submit Button
    Wait Until Page Contains    Must be in English only
    Close Browser

Check Invalid ID Card
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Invalid ID Card
    Click Submit Button
    Wait Until Page Contains    number only
    Close Browser

*** Keywords ***
Input TH Information
    Select From List by Value    id=nameTitleTha    นางสาว
    Input Text      id=firstnameTha                 พิมพกานต์
    Input Text      id=lastnameTha                 คูเจริญศรีจันทร์

Input EN Information
    Select From List by Value    id=nameTitleEng    Ms.
    Input Text      id=firstnameEng                 Pimpakarn
    Input Text      id=lastnameEng                 Kucharoensrichan

Input Birthday
    Select From List by Value    id=birthDate    26
    Select From List by Label    id=birthMonth    มิถุนายน
    Select From List by Label    id=birthYear    2546

Input ID Card
    Input Text      id=idCard                 1234567891234

Input Password
    Input Text      id=password                 Password123

Input Phone Number
    Input Text      id=mobile                 0624201938

Input Email
    Input Text      id=email                 654259009@webmail.npru.ac.th

Click Checkbox
    Click Element    id=accept

Click Submit Button
    Click Element    id=submitbtn

Input Invalid TH Information
    Input Text      id=firstnameTha                 pimpakarn
    Input Text      id=lastnameTha                 คูเจริญศรีจันทร์

Input Invalid EN Information
    Input Text      id=firstnameEng                 Pimpakarn
    Input Text      id=lastnameEng                 kucharoensrichan

Input Invalid ID Card
    Input Text      id=idCard                 A234567891234
