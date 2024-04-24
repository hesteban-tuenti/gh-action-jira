# -*- coding: utf-8 -*-
@jira.QANOV-1932
Feature: No SIM


  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65726 @mobile @no_automatable @regression
  Scenario Outline: A user who open the app with data connectivity provided by the Telefonica brand SIM in the device cannot see the warning banner displayed
    Given user has a "single" SIM device
      And user has a Telefonica SIM in the device
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns on the mobile data
     When launches the app
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.5 | QANOV-1933 |
          | o2uk    | 11.9 | QANOV-1934 |
          | moves   | 11.9 | QANOV-1935 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65719 @manual @mobile @regression
  Scenario Outline: A user who open the app without connectivity and without any SIM in the device can see the warning banner displayed
    Given user has the app in "killed" status
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user has not a SIM in the device
     When launches the app
     Then the "warning" warning in "red" color is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.no_sim]" text is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.5 | QANOV-1936 |
          | o2uk    | 11.9 | QANOV-1938 |
          | moves   | 11.9 | QANOV-1941 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91847 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203311 @depends_on.NOV-203312 @depends_on.NOV-203313"
    internal_checkpoint="Note that to make the banner appear again, changing tabs is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be more than 15 seconds"
    Given user is in the "Account" page
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And user has not a SIM in the device
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "15" seconds or more
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1943 |
          | o2uk    | 11.9 | QANOV-1944 |
          | moves   | 11.9 | QANOV-1945 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91844 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner does not appear again after waiting less than 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203311 @depends_on.NOV-203312 @depends_on.NOV-203313"
    internal_checkpoint="Note that to make the banner appear again, changing tabs is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be less than 15 seconds"
    Given user is in the "Account" page
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And user has not a SIM in the device
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "14" seconds or less
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1946 |
          | o2uk    | 11.9 | QANOV-1947 |
          | moves   | 11.9 | QANOV-1948 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91842 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner is not shown again after waiting less than 15 seconds before closing and opening the app again
    commented_tags="@depends_on.NOV-203311 @depends_on.NOV-203312 @depends_on.NOV-203313"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be less than 15 seconds"
    Given user turns on the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And user has not a SIM in the device
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "14" seconds
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1949 |
          | o2uk    | 11.9 | QANOV-1950 |
          | moves   | 11.9 | QANOV-1952 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91838 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before opening the app again
    commented_tags="@depends_on.NOV-203311 @depends_on.NOV-203312 @depends_on.NOV-203313"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be at least 15 seconds"
    Given user turns on the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And user has not a SIM in the device
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "15" seconds
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1953 |
          | o2uk    | 11.9 | QANOV-1954 |
          | moves   | 11.9 | QANOV-1955 |
