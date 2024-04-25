*** Settings ***
Library    SeleniumLibrary
Variables    var.py
 
*** Keywords ***
Login Account
    Open Browser    ${url_saucedemo}    chrome
    Sleep    4s
    Input Text    ${userName}    standard_user
    Sleep    4s
    Input Text    ${pw}    secret_sauce
    Sleep    4s
    Click Button    ${loginButton}   

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
    Sleep    5s
    Maximize Browser Window

    #login with invalid password
    Input Text    ${userName}    standard_user
    Sleep    5s
    Input Text    ${pw}    asdasd
    Sleep    5s
    Click Button    ${loginButton}   
    Sleep    5s
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    
    #login with valid password
    Input Text    ${userName}    standard_user
    Sleep    5s
    Input Text    ${pw}    secret_sauce
    Sleep    5s
    Click Button    ${loginButton}   
    Sleep    5s
    
    #filtering product
    Select From List By Label    ${dropdown2}    Price (low to high)
    Sleep    5s
    Select From List By Label    ${dropdown2}    Name (Z to A)
    Sleep    5s
    Select From List By Label    ${dropdown2}    Price (high to low)
    Sleep    5s

    #do scrolling down and up
    Execute Javascript    window.scrollTo(0,document.body.scrollHeight)
    Execute Javascript    window.scrollTo(document.body.scrollHeight,0)
    
    #pick an items and adding it into cart
    Click Button    ${saucelabsonesie}
    Sleep    5s
    Click Button    ${saucelabsbikelight}
    Sleep    5s
    Click Element    ${doCheckout}
    Sleep    5s

    #remove item in cart
    Click Element    ${removeSaucelabsbikeLight}
    Sleep    5s
    
    #back to homepage and do shopping
    Click Button    ${contShopping}
    Sleep    5s
    Click Button    ${allTheThings}
    Sleep    5s
    Click Element    ${doCheckout}
    Sleep    5s
    
    #go to fill up the form
    Click Button    ${filltheForm}
    Sleep    5s

    #back to cart page and do shopping
    Click Button    ${cancelButton}
    Sleep    5s
    Click Button    ${contShopping}
    Sleep    5s
    Click Button    ${saucelabsbikelight}
    Sleep    5s
    Click Element    ${doCheckout}
    Sleep    5s

    #filling up the form
    Click Button    ${filltheForm}
    Sleep    5s
    Page Should Contain Textfield    ${firstname}
    Sleep    5s
    Page Should Contain Textfield    ${lastname}
    Sleep    5s
    Page Should Contain Textfield    ${postalcode}
    Sleep    5s
    Page Should Contain Button    ${continuebutton}
    Sleep    5s
    
    #triggering error FirstName is empty
    Click Button    ${continuebutton}
    Sleep    5s
    Page Should Contain    Error: First Name is required
    
    #triggering error LastName is empty
    Input Text    ${firstname}    Kevin
    Sleep    5s
    Click Button    ${continuebutton}
    Sleep    5s
    Page Should Contain    Error: Last Name is required
    
    #triggering error LastName is empty
    Input Text    ${lastname}    Nakamura
    Sleep    5s
    Click Button    ${continuebutton}
    Sleep    5s
    Page Should Contain    Error: Postal Code is required

    #input all form
    Input Text    ${postalcode}    12345
    Sleep    5s
    Click Button    ${continueButton}
    Sleep    5s

    #checkout overview
    Page Should Contain Element    ${nameitem}  
    Sleep    3s
    Page Should Contain Element    ${descitem}
    Sleep    3s
    Page Should Contain Element    ${priceitem}
    Sleep    3s  
    Page Should Contain Element    ${infolabel}
    Sleep    3s
    Page Should Contain Element    ${valuelabel}
    Sleep    3s
    Page Should Contain Element    ${subtotallabel}
    Sleep    3s
    Page Should Contain Element    ${taxlabel}
    Sleep    3s
    Page Should Contain Element    ${totallabel}
    Sleep    3s
    Click Button    ${cancelButton}
    Sleep    5s
    Click Element    ${doCheckout}
    Sleep    5s
    Click Button    ${filltheForm}
    Sleep    5s
    Input Text    ${firstname}    Kevin
    Sleep    5s
    Input Text    ${lastname}    Nakamura
    Sleep    5s
    Input Text    ${postalcode}    12345
    Sleep    5s
    Click Button    ${continueButton}
    Sleep    5s
    Click Button    ${finish}
    Sleep    5s
    Page Should Contain    Thank you for your order!
    Sleep    3s
    Page Should Contain    Your order has been dispatched, and will arrive just as fast as the pony can get there!
    Sleep    3s
    Page Should Contain Image    ${checkimg}
    Sleep    3s
    Click Button    ${backhomebutton}
    Sleep    5s