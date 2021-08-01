Description: My Scenatios for Vividus mentoring

Meta:
    @layout desktop

Scenario: Task 1 - Find info on learn.epam.com using Examples table
Given I am on the main application page
When I initialize the SCENARIO variable `SecondRequestText` with value `Testing` 
When I wait until element located `By.xpath(//input[@class="uui-input"])` appears
When I click on element located `By.xpath(//input[@class="uui-input"])`
When I enter `<TextForSearch>` in field located `By.xpath(//input[@class="uui-input"])`
When I execute sequence of actions:
|type          |argument                                |
|PRESS_KEYS    |ENTER |
When I wait until element located `By.xpath(//div[contains(text(),'<ResultText>')])` appears
Then number of elements found by `By.xpath(//div[contains(text(),'<ResultText>')])` is greater than `0`
Examples:
|TextForSearch | ResultText|
|${FirstRequestText}  |Java |
|${SecondRequestText}  |Testing  |


Scenario: Task 1 - SecondPart Work with API
When I issue a HTTP GET request for a resource with the URL 'https://catfact.ninja/fact'
Then `${responseCode}` is equal to `200`
Then the number of JSON elements by the JSON path '$.fact' is greater than 0

Scenario: Task 1 - ThirdPart Work with API
Given request body: {
"name":"TesterAliona",
"gender":"female",
"email":"te2stu4ser1@mail.com",
"status":"active"
}
When I set request headers:
|name         |value          |
|Authorization|Bearer d422e242a4beb1edb54a104dd1e873b9e71f3acd1c0163383c488cc5463b2c37|
|Accept|*/*|
|Content-Type|application/json|
|Connection|keep-alive|
When I issue a HTTP POST request for a resource with the URL 'https://gorest.co.in/public/v1/users'
Then `${responseCode}`  matches `20\d+`

Scenario: Task 2 
GivenStories: /story/web/preconditions/Precondition.story#{id:search},
When I initialize the SCENARIO variable `counter` with value `0`
When I execute steps while counter is not equal to `5` with increment `1` starting from `0`:
|step|
|When I wait until element located `By.xpath((//a[starts-with(@href,"/detailsPage")])[#{eval(${counter} + 1)}])` appears|
|When I click on element located `By.xpath((//a[starts-with(@href,"/detailsPage")])[#{eval(${counter} + 1)}])`| 
|When I change context to element located `By.xpath(//div[contains(text(),'Summary')])`|
|When I compare against baseline with `Summary`|
|When I navigate back|
|When I initialize the SCENARIO variable `counter` with value `#{eval(${counter} + 1)}`| 

Scenario: Task 3
GivenStories: /story/web/preconditions/Precondition.story#{id:search},
When I check 5 Summary blocks
When I save number of elements located `By.xpath(//div[contains(text(),'Java. Strings')])` to SCENARIO variable `JavaStringLesson`
When the condition '#{eval("${JavaStringLesson}"=="1")}' is true I do
|step|
|When I change context to element located `By.xpath((//div[contains(text(),'Java. Strings')]//parent::div/parent::div/parent::div)[1])`|
|When I compare against baseline with `JavaStrings`|

When I change context to element located `By.xpath((//div[contains(text(),'Java. Strings')]//parent::div/parent::div/parent::div)[1])`
When I compare against baseline with `JavaStrings2` ignoring:
|ELEMENT|
|By.xpath(((//div[starts-with(@class,"SmallCard_content")]))[1]/div[5])|


!-- Scenario: TRELO
!-- Given I am on the main application page
!-- When I click on element located `By.xpath(//a[contains(text(),'Sign up')])`
!-- When I enter `<ImagesRowLocator>` in field located `By.xpath(//input[@id="email"])`
!-- Examples:
!-- |CreatedUserEmail |
!-- |aliona_test1@epam.com    |
!-- |aliona_test2@epam.com    |
!-- When I click on element located `By.xpath(//input[@id="signup-submit"])`
!-- When I wait until element located `By.xpath(//input[@id="displayName"])` appears
!-- When I enter `TestName` in field located `By.xpath(//input[@id="displayName"])`
!-- When I click on element located `By.xpath(//button[@id="signup-submit"])`
!-- When I click on element located `By.xpath(//button[@data-test-id="moonshot-continue-button"])`

