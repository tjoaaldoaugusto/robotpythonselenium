*** Settings ***
Library    SeleniumLibrary
Variables    var.py
 
*** Keywords ***
#Login Account
    #Open Browser    ${url_saucedemo}    chrome
    #Sleep    4s
    #Input Text    ${userName}    standard_user
    #Sleep    4s
    #Input Text    ${pw}    secret_sauce
    #Sleep    4s
    #Click Button    ${loginButton}   

#Doing fiter product
    #Open Browser    ${url_saucedemo}    chrome
    #Sleep    4s
    #Input Text    ${username}    standard_user
    #Sleep    4s
    #Input Text    ${pw}    secret_sauce
    #Sleep    4s
    #Click Button    ${loginbutton}   
    #Sleep    4s
    #Select From List By Label    ${dropdown2}    Price (low to high)
    #Sleep    4s
    #Select From List By Label    ${dropdown2}    Name (Z to A)
    #Sleep    4s
    #Select From List By Label    ${dropdown2}    Price (high to low)
    #Sleep    4s
    

Buying an item and checking Cart
    #open url and maximize the browser
    Open Browser    ${url_saucedemo}    chrome   
    Sleep    4s
    Maximize Browser Window
    
    #login with valid password
    Input Text    ${userName}    standard_user
    Sleep    4s
    Input Text    ${pw}    secret_sauce
    Sleep    4s
    Click Button    ${loginButton}   
    Sleep    4s
    
    #filtering product
    Select From List By Label    ${dropdown2}    Price (low to high)
    Sleep    4s
    Select From List By Label    ${dropdown2}    Name (Z to A)
    Sleep    4s
    Select From List By Label    ${dropdown2}    Price (high to low)
    Sleep    4s

    #do scrolling down and up
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    Execute Javascript    window.scrollTo(document.body.scrollHeight,0)
    
    #pick an items and adding it into cart
    Click Button    ${saucelabsonesie}
    Sleep    4s
    Click Button    ${saucelabsbikelight}
    Sleep    4s
    Click Element    ${doCheckout}
    Sleep    4s

    #remove item in cart
    Click Element    ${removeSaucelabsbikeLight}
    Sleep    5s
    
    #back to homepage and do shopping
    Click Button    ${contShopping}
    Sleep    5s
    Click Button    ${allTheThings}
    Sleep    5s
    Click Element    ${doCheckout}
    Sleep    4s
    
    #fill up the form
    Click Button    ${filltheForm}
    Sleep    5s