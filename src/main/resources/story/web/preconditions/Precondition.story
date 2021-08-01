
Scenario: Search on the site
Meta:
    @id search
Given I am on a page with the URL 'https://learn.epam.com/'
When I wait until element located `By.xpath(//input[@class="uui-input"])` appears
When I click on element located `By.xpath(//input[@class="uui-input"])`
When I enter `${FirstRequestText}` in field located `By.xpath(//input[@class="uui-input"])`
When I execute sequence of actions:
|type          |argument                                |
|PRESS_KEYS    |ENTER |
