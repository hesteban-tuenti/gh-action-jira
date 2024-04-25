@jira.QANOV-27192
Feature: Native Deeplinks


  @jira.<jira_id> @web @jira.cv.10.3 @manual @<product> @relates_to.NOV-47188
  @regression
  Scenario Outline: User with a desktop device taps on a deeplink (the OB hasn't a webapp): the user will be redirected to the OB’s landing screen
     When opens the "Native.Account" deeplink with the app in "killed" status
     Then the external webview is displayed
      And thep app is advertised in the web page

    Examples:
      | product | jira_id    |
      | moves   | QANOV-8351 |
      | vivobr  | QANOV-8352 |
      | o2uk    | QANOV-8353 |
