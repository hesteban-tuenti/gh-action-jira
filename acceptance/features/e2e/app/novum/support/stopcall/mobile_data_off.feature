# -*- coding: utf-8 -*-
@jira.QANOV-1881
Feature: Mobile data OFF


  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53784 @mobile @smoke @har
  Scenario Outline: A user who opens the app with connectivity cannot see a warning banner
    Given user has the app in "killed" status
      And user turns off the Airplane mode
      And turns <wifi_connectivity> the Wi-Fi
      And turns <data_connectivity> the mobile data
     When launches the app
     Then the "[CONF:landing_tab]" page is displayed
      And the "warning" warning is not displayed

    @manual
    Examples:
          | product | cv   | wifi_connectivity | data_connectivity | jira_id    |
          | vivobr  | 10.4 | on                | off               | QANOV-1882 |
          | o2uk    | 11.9 | on                | off               | QANOV-1884 |
          | moves   | 11.9 | on                | off               | QANOV-1886 |

    @no_automatable
    Examples:
          | product | cv   | wifi_connectivity | data_connectivity | jira_id    |
          | o2uk    | 11.9 | off               | on                | QANOV-1885 |
          | vivobr  | 10.4 | off               | on                | QANOV-1883 |
          | moves   | 11.9 | off               | on                | QANOV-1887 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65723 @mobile @no_automatable @smoke
  Scenario Outline: A user who opens the app with a Telefonica brand SIM and without data or WiFi connection can see the warning banner displayed
    Given user has a "single" SIM device
      And user has the Telefonica brand SIM in the device
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And <data_connectivity> the mobile data
     When launches the app
     Then the "warning" warning in "red" color is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.no_connection]" text is displayed
      And the "warning.button" button with "[LANG:pageelements.stop_call_banner.settings_button]" text is displayed

    Examples:
          | product | cv   | data_connectivity | jira_id    |
          | vivobr  | 10.5 | user turns off    | QANOV-1888 |
          | o2uk    | 11.9 | user turns off    | QANOV-1891 |
          | moves   | 11.9 | user turns off    | QANOV-1893 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91848 @mobile @no_automatable @regression
  Scenario Outline: The no connectivity warning disappears after tapping the banner and returning to the app in less than 15 seconds
    commented_tags="@depends_on.NOV-203287 @depends_on.NOV-203288 @depends_on.NOV-203289"
    Given user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And user has a SIM in the device
      And the "warning" warning is displayed
     When clicks on the "warning.button" button
      And waits "14" seconds or less
      And clicks on the native "back" button
     Then the app is opened
      And the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1895 |
          | o2uk    | 11.9 | QANOV-1897 |
          | moves   | 11.9 | QANOV-1900 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91847 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203287 @depends_on.NOV-203288 @depends_on.NOV-203289"
    internal_checkpoint="Note that to make the banner appear again, changing taps is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be more than 15 seconds"
    Given user is in the "Account" page
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "15" seconds or more
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1902 |
          | o2uk    | 11.9 | QANOV-1904 |
          | moves   | 11.9 | QANOV-1906 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91844 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner does not appear again after waiting less than 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203287 @depends_on.NOV-203288 @depends_on.NOV-203289"
    internal_checkpoint="Note that to make the banner appear again, changing taps is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be less than 15 seconds"
    Given user is in the "Account" page
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "14" seconds or less
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1908 |
          | o2uk    | 11.9 | QANOV-1911 |
          | moves   | 11.9 | QANOV-1913 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91842 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner is not shown again after waiting less than 15 seconds before opening the app again
    commented_tags="@depends_on.NOV-203287 @depends_on.NOV-203288 @depends_on.NOV-203289"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be less than 15 seconds"
    Given user turns on the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "14" seconds
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1915 |
          | o2uk    | 11.9 | QANOV-1917 |
          | moves   | 11.9 | QANOV-1919 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91838 @mobile @no_automatable @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before opening the app again
    commented_tags="@depends_on.NOV-203287 @depends_on.NOV-203288 @depends_on.NOV-203289"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be at least 15 seconds"
    Given user turns on the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "15" seconds
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1922 |
          | o2uk    | 11.9 | QANOV-1924 |
          | moves   | 11.9 | QANOV-1926 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65729 @mobile @no_automatable @regression
  Scenario Outline: A user who opens the app with a SIM and without connectivity can see the alert removed when connection is recovered
    commented_tags="@depends_on.NOV-203287 @depends_on.NOV-203288 @depends_on.NOV-203289"
    Given user has a Telefonica SIM in the device
      And user turns off the Airplane mode
      And user turns off the Wi-Fi
      And user turns off the mobile data
     When launches the app
      And the "warning" warning is displayed
      And clicks on the "warning.button" button
      And I turn on the mobile data
      And user has the app in "foreground" status
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1929 |
          | o2uk    | 11.9 | QANOV-1930 |
          | moves   | 11.9 | QANOV-1931 |
