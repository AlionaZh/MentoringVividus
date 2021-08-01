Scenario: Add movie to watchlist

Given I am on a page with the URL 'https://www.imdb.com/'
When I click on element located `By.xpath(//div[text()="Sign In"])`
When I click on element located `By.xpath(//span[text()="Sign in with IMDb"])`
When I enter `alena.voitukevich@gmail.com` in field located `By.xpath(//input[@id="ap_email"])`
When I enter `Password1*` in field located `By.xpath(//input[@id="ap_password"])`
When I click on element located `By.xpath(//input[@id="signInSubmit"])`
When I click on element located `By.xpath(//input[@id="suggestion-search"])`
When I enter `fox` in field located `By.xpath(//input[@id="suggestion-search"])`
When I click on element located `By.xpath(//button[@id="suggestion-search-button"])` 
When I click on element located `By.xpath((//td[@class="result_text"])[2]/a)`
When I wait until element located `By.xpath(//*[starts-with(@class,"WatchBox__WatchParent")]/div/button/div[contains(text(),'Watchlist')])` appears
When I save `innerText` attribute value of element located `By.xpath(//*[starts-with(@class,"WatchBox__WatchParent")]/div/button/div)` to SCENARIO variable `CompareVariable`
When the condition '#{eval("${CompareVariable}"!="Add to Watchlist")}' is true I do
|step|
|When I click on element located `By.xpath(//button[@data-testid="tm-box-wl-button"])` |
|When I wait until element located `By.xpath(//div[text()="Add to Watchlist"])` appears |
When I click on element located `By.xpath(//button[@data-testid="tm-box-wl-button"])` 
When I wait until element located `By.xpath(//button[@data-testid="tm-box-wl-button"])` appears
Then an element by the xpath '(//div[text()="In Watchlist"])' exists

