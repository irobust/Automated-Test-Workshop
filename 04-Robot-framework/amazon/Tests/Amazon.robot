*** Settings ***
Documentation  This is some basic info about the whole suite
Library  SeleniumLibrary
Library  Collections

# use the below line (without the # sign) to run the script
# robot -d results tests

*** Variables ***


*** Test Cases ***
User can search for products
    [Documentation]  This is some basic info about the test
    [Tags]  Demo
    Open Browser  http://www.codinggun.com  chrome
    Wait Until Page Contains  Microservices
    Click Element    xpath:/html/body/header/ul/li[4]/span
    Input Text  xpath=/html/body/div/div/input  docker
    Press Keys  xpath:/html/body/header/ul/li[4]/span   RETURN
    Wait Until Page Contains  Docker Image
    Close Browser

User can view a product
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.codinggun.com  chrome
    Wait Until Page Contains  Coding Gun
    Click Button xpath=/html/body/header/ul/li[4]/span/svg
    Input Text  xpath=/html/body/div/div/input  docker
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  Docker Image
    Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Back to search results
    Close Browser

User can add product to cart
    [Documentation]  This is some basic info about the test
    [Tags]  Smoke
    Open Browser  http://www.codinggun.com  ie
    Wait Until Page Contains  Coding Gun
    Click Button xpath=/html/body/header/ul/li[4]/span/svg
    Input Text  xpath=/html/body/div/div/input  docker
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  Docker Image
    Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Back to search results
    Click Button  id=add-to-cart-button
    Wait Until Page Contains  Added to Cart  # it's case sensitive!
    Close Browser

User must sign in to check out
    [Documentation]  This is some basic info about the test
    [Tags]  sign-in
    Open Browser  http://www.amazon.com  ie
    Wait Until Page Contains  Shop by
    Input Text  id=twotabsearchtextbox  Ferrari 458
    Click Button  xpath=//*[@id="nav-search"]/form/div[2]/div/input
    Wait Until Page Contains  results for "Ferrari 458"
    Click Link  css=#result_0 a.s-access-detail-page
    Wait Until Page Contains  Back to search results
    Click Button  id=add-to-cart-button
    Sleep  3
    Wait Until Page Contains  Your Account
    #Wait Until Page Contains  cart subtotal
    Click Link  id=hlb-ptc-btn-native
    Wait Until Page Contains Element  id=signInSubmit
    Close Browser

*** Keywords ***
