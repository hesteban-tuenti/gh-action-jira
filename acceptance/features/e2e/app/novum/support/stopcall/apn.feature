# -*- coding: utf-8 -*-
@jira.QANOV-1803
Feature: APN

  Actions Before each Scenario:
    Given user has a Telefonica SIM in the device
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns on the mobile data
      And the device is in the coverage area and registered to the Telefonica network


  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-78488 @mobile @no_automatable @regression
  Scenario Outline: A user without internet connection and with a possible APN issue can see an APN warning banner
    internal_checkpoint="We can simulate the APN error issue by deleting the existing APNs in Settings->Connections->Mobile Networks->Access points.
    If you tap on the APN configuration warning button, it won't be shown for long.
    To re-trigger, you can log out and log in again.
    NOTE: Some devices will not show this pop-up. Check compatible devices here https://telefonicacorp.sharepoint.com/:x:/s/ColaboraTID/qacdo/EVNmzvMwj-JMvo14ngcZF6oBa920FT0ub6blAH-LuryN6g?e=9WO7cc."
    Given has no connectivity due an APN issue
      And the APN warning banner has not been shown since the user logged in
     When launches the app
     Then the "warning" warning is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.apn_configuration]" text is displayed
      And the "warning.button" button with "[LANG:pageelements.stop_call_banner.send_sms]" text is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.6 | QANOV-1804 |
          | o2uk    | 11.9 | QANOV-1805 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-80881 @mobile @no_automatable @regression
  Scenario Outline: A user without internet connection and with a possible APN issue sees how banner disappears in 10 seconds
    commented_tags="@depends_on.NOV-203247 @depends_on.NOV-203248"
    internal_checkpoint="If you tap on the APN configuration warning button, it won't be shown for long.
    To re-trigger, you can log out and log in again.
    NOTE: Some devices will not show this pop-up. Check compatible devices here https://telefonicacorp.sharepoint.com/:x:/s/ColaboraTID/qacdo/EVNmzvMwj-JMvo14ngcZF6oBa920FT0ub6blAH-LuryN6g?e=9WO7cc."
    Given the user is in the "Account" page
      And has no connectivity due an APN issue
     When launches the app
      And the "warning" warning is displayed
      And waits "10" seconds
     Then the "warning" warning is not displayed
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.6 | QANOV-1806 |
          | o2uk    | 11.9 | QANOV-1807 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-78489 @mobile @no_automatable @regression
  Scenario Outline: A user without internet connection and with a possible APN issue taps on the APN warning banner button: the user will be taken to the device's default messaging app
    commented_tags="@depends_on.NOV-203247 @depends_on.NOV-203248"
    internal_checkpoint="If you tap on the APN configuration warning button, it won't be shown for long.
    To re-trigger, you can log out and log in again.
    NOTE: Some devices will not show this pop-up. Check compatible devices here https://telefonicacorp.sharepoint.com/:x:/s/ColaboraTID/qacdo/EVNmzvMwj-JMvo14ngcZF6oBa920FT0ub6blAH-LuryN6g?e=9WO7cc."
    Given has no connectivity due an APN issue
      And the "warning" warning is displayed
     When clicks on the "warning_send_button" button
     Then the "warning" warning is not displayed
      And the "Messaging" app is displayed
      And the "sms_input_field" textfield with "<expected_text>" text is displayed
      And the "sms_destination" textfield with "<destination>" text is displayed

    Examples:
          | product | cv   | expected_text | destination | jira_id    |
          | vivobr  | 10.6 | Vivo          | 8090        | QANOV-1808 |
          | o2uk    | 11.9 | ACTIVE        | 2020        | QANOV-1809 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-78490 @mobile @no_automatable @regression
  Scenario Outline: A user who already pressed the APN warning banner button will not see that APN banner again
    commented_tags="@depends_on.NOV-203247 @depends_on.NOV-203248"
    internal_checkpoint="If you tap on the APN configuration warning button, it won't be shown for long.
    To re-trigger, you can log out and log in again.
    NOTE: Some devices will not show this pop-up. Check compatible devices here https://telefonicacorp.sharepoint.com/:x:/s/ColaboraTID/qacdo/EVNmzvMwj-JMvo14ngcZF6oBa920FT0ub6blAH-LuryN6g?e=9WO7cc."
    Given has no connectivity due an APN issue
      And user has previously pressed the APN warning button
     When launches the app
     Then the "warning" warning is not shown

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.6 | QANOV-1810 |
          | o2uk    | 11.9 | QANOV-1812 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91847 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203247 @depends_on.NOV-203248"
    internal_checkpoint="Note that to make the banner appear again, changing taps is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be more than 15 seconds.
    If you tap on the APN configuration warning button, it won't be shown for long.
    To re-trigger, you can log out and log in again.
    NOTE: Some devices will not show this pop-up. Check compatible devices here https://telefonicacorp.sharepoint.com/:x:/s/ColaboraTID/qacdo/EVNmzvMwj-JMvo14ngcZF6oBa920FT0ub6blAH-LuryN6g?e=9WO7cc."
    Given user is in the "Account" page
      And has no connectivity due an APN issue
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "15" seconds or more
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1813 |
          | o2uk    | 11.9 | QANOV-1814 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91844 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner does not appear again after waiting less than 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203247 @depends_on.NOV-203248"
    internal_checkpoint="Note that to make the banner appear again, changing taps is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be less than 15 seconds.
    If you tap on the APN configuration warning button, it won't be shown for long.
    To re-trigger, you can log out and log in again.
    NOTE: Some devices will not show this pop-up. Check compatible devices here https://telefonicacorp.sharepoint.com/:x:/s/ColaboraTID/qacdo/EVNmzvMwj-JMvo14ngcZF6oBa920FT0ub6blAH-LuryN6g?e=9WO7cc."
    Given user is in the "Account" page
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "14" seconds or less
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1815 |
          | o2uk    | 11.9 | QANOV-1816 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91842 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner is not shown again after waiting less than 15 seconds before closing and opening the app again
    commented_tags="@depends_on.NOV-203247 @depends_on.NOV-203248"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be less than 15 seconds.
    If you tap on the APN configuration warning button, it won't be shown for long.
    To re-trigger, you can log out and log in again.
    NOTE: Some devices will not show this pop-up. Check compatible devices here https://telefonicacorp.sharepoint.com/:x:/s/ColaboraTID/qacdo/EVNmzvMwj-JMvo14ngcZF6oBa920FT0ub6blAH-LuryN6g?e=9WO7cc."
    Given the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "7" seconds
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1817 |
          | o2uk    | 11.9 | QANOV-1818 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91838 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before opening the app again
    commented_tags="@depends_on.NOV-203247 @depends_on.NOV-203248"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be at least 15 seconds.
    If you tap on the APN configuration warning button, it won't be shown for long.
    To re-trigger, you can log out and log in again.
    NOTE: Some devices will not show this pop-up. Check compatible devices here https://telefonicacorp.sharepoint.com/:x:/s/ColaboraTID/qacdo/EVNmzvMwj-JMvo14ngcZF6oBa920FT0ub6blAH-LuryN6g?e=9WO7cc."
    Given the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "15" seconds
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1819 |
          | o2uk    | 11.9 | QANOV-1821 |
