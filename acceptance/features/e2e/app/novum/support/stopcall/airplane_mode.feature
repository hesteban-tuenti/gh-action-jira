# -*- coding: utf-8 -*-
@jira.QANOV-1822
Feature: Airplane mode


  @jira.<jira_id> @<product> @android @automatic @har @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-53480 @mobile @sanity
  Scenario Outline: A user who opens the app without connectivity can see a warning banner
    internal_checkpoint="warning color will be red"
    Given user terminates the app
      And user turns on the Airplane mode
     When launches the app
     Then the "No Connectivity Warning" warning is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.airplane_mode_message]" text is displayed
      And the "warning.button" button with "[LANG:pageelements.stop_call_banner.settings_button]" text is displayed

    @live @next
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1823 |

    @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1825 |

  @jira.QANOV-1824 @android @automatic @cert0 @cert1 @har @jira.cv.11.9 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-53480 @live @mobile @next @o2uk @sanity
  Scenario: A My O2 user who opens the app without connectivity can see a warning banner
    internal_checkpoint="warning color will be red"
    Given user terminates the app
      And user turns on the Airplane mode
     When launches the app
      And the "AppPinCode" page is displayed
      And inserts the current pin
     Then the "No Connectivity Warning" warning is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.airplane_mode_message]" text is displayed
      And the "warning.button" button with "[LANG:pageelements.stop_call_banner.settings_button]" text is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53481 @mobile @regression
  Scenario Outline: A user with the app in foreground who activates airplane mode can see a warning message
    internal_checkpoint="warning color will be red. The wait is to avoid automation issues with warnings from the previous scenarios"
    Given user waits "15" seconds
      And user launches the app
     When turns on the Airplane mode
     Then the "No Connectivity Warning" warning is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.airplane_mode_message]" text is displayed
      And the "warning.button" button with "[LANG:pageelements.stop_call_banner.settings_button]" text is displayed

    @automatic @live @next
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1826 |

    @manual
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1828 |

  @jira.QANOV-1827 @android @automatic @cert0 @cert1 @jira.cv.11.9 @jira.link.relates_to.NOV-53481 @live @mobile @next
  @o2uk @regression
  Scenario: A user with the app in foreground who activates airplane mode can see a warning message
    internal_checkpoint="warning color will be red. The wait is to avoid automation issues with warnings while recovering connectivity from the previous scenarios"
    Given user terminates the app
      And user launches the app
      And the "AppPinCode" page is displayed
      And inserts the current pin
     When turns on the Airplane mode
     Then the "No Connectivity Warning" warning is displayed
      And the "warning.text" textfield with "[LANG:pageelements.stop_call_banner.airplane_mode_message]" text is displayed
      And the "warning.button" button with "[LANG:pageelements.stop_call_banner.settings_button]" text is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53482 @mobile @regression
  Scenario Outline: A user with airplane mode active with the warning banner displayed can tap on the warning button
    internal_checkpoint="The wait is to avoid automation issues with warnings while recovering connectivity from the previous scenarios"
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    Given user waits "15" seconds
      And user launches the app
     When turns on the Airplane mode
      And the "No Connectivity Warning" warning is displayed
      And clicks on the "warning.button" button
     Then the "Native Airplane Mode Settings" page is displayed

    @automatic @live @next
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1829 |

    @manual
    Examples:
          | product | cv   | jira_id    |
          | moves   | 11.9 | QANOV-1832 |

  @jira.QANOV-1831 @android @automatic @cert0 @cert1 @jira.cv.11.9 @jira.link.relates_to.NOV-53482 @live @mobile @next
  @o2uk @regression
  Scenario: A My O2 user with airplane mode active with the warning banner displayed can tap on the warning button
    internal_checkpoint="The wait is to avoid automation issues with warnings while recovering connectivity from the previous scenarios"
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    Given user terminates the app
      And user launches the app
      And the "AppPinCode" page is displayed
      And inserts the current pin
     When turns on the Airplane mode
      And the "No Connectivity Warning" warning is displayed
      And clicks on the "warning.button" button
     Then the "Native Airplane Mode Settings" page is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-53483 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner disappears after 10 seconds of inactivity
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    Given user turns on the Airplane mode
      And the "warning" warning is displayed
     When waits "10" seconds
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1833 |
          | o2uk    | 11.9 | QANOV-1834 |
          | moves   | 11.9 | QANOV-1835 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91848 @manual @mobile @regression
  Scenario Outline: The no connectivity warning disappears after tapping the banner and returning to the app in less than 15 seconds
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    Given user turns on the Airplane mode
      And the "warning" warning is displayed
     When clicks on the "warning.button" button
      And waits "<=14" seconds
      And clicks on native "back" button
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1836 |
          | o2uk    | 11.9 | QANOV-1837 |
          | moves   | 11.9 | QANOV-1839 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91847 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    internal_checkpoint="Note that to make the banner appear again, changing taps is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be more than 15 seconds"
    Given user is in the "Account" page
      And user turns on the Airplane mode
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits ">=15" seconds
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1840 |
          | o2uk    | 11.9 | QANOV-1841 |
          | moves   | 11.9 | QANOV-1842 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91844 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner does not appear again after waiting less than 15 seconds before changing to a new screen
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    internal_checkpoint="Note that to make the banner appear again, changing taps is not enough
    since it's not considered a different screen. Also, the time between the no-connectivity banner is shown and
    the moment the user navigates to another screen has to be less than 15 seconds"
    Given user is in the "Account" page
      And user turns on the Airplane mode
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And waits "<=14" seconds
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.4 | QANOV-1843 |
          | o2uk    | 11.9 | QANOV-1844 |
          | moves   | 11.9 | QANOV-1845 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91842 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner is not shown again after waiting less than 15 seconds before closing and opening the app again
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be less than 15 seconds"
    Given user turns on the Airplane mode
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "<15" seconds
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1847 |
          | o2uk    | 11.9 | QANOV-1848 |
          | moves   | 11.9 | QANOV-1849 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-91838 @manual @mobile @regression
  Scenario Outline: The no-connectivity banner appears again after waiting for 15 seconds before opening the app again
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    internal_checkpoint="Note that the time between the moment the no-connectivity banner is dismissed and
    the moment the user opens the app again has to be at least 15 seconds"
    Given user turns on the Airplane mode
      And the "warning" warning is displayed
     When waits "10" seconds
      And the "warning" warning is not displayed
      And runs the app in the background for "15" seconds
     Then the "warning" warning is displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1850 |
          | o2uk    | 11.9 | QANOV-1851 |
          | moves   | 11.9 | QANOV-1852 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-65729 @mobile @no_automatable @regression
  Scenario Outline: A user who opens the app with a SIM and without connectivity can see the alert removed when connection is recovered
    commented_tags="@depends_on.NOV-203214 @depends_on.NOV-203215 @depends_on.NOV-203216 @depends_on.NOV-203217
    /@depends_on.NOV-203218 @depends_on.NOV-203219"
    Given user has a Telefonica SIM in the device
      And user turns on the Airplane mode
     When launches the app
      And the "warning" warning is displayed
      And clicks on the "warning.button" button
      And turns off the Airplane mode
      And clicks on native "back" button
     Then the "warning" warning is not displayed

    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.8 | QANOV-1853 |
          | o2uk    | 11.9 | QANOV-1854 |
          | moves   | 11.9 | QANOV-1856 |
