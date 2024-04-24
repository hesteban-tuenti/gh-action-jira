# -*- coding: utf-8 -*-
@jira.QANOV-126305
Feature: Splash Screen no connectivity

  Actions Before each Scenario:
    Given terminates the app
      And launches the app
      And user is logged out


  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.relates_to.NOV-29424 @mobile
  Scenario Outline: A non-logged <product> user without data connectivity can see the no connectivity warning instead of the terms and conditions
     When terminates the app
      And turns on the Airplane mode
      And launches the app
     Then the "Splash Screen" page is displayed
      And the "terms_and_conditions_footer" textfield is not displayed
      And the "no_connectivity_warning.text" textfield with "[LANG:launch_app.splash_screen.no_connectivity_warning]" text is displayed

    @automatic @cert2 @live @next @sanity
    Examples:
          | product | cv    | jira_id    |
          | moves   | 13.10 | QANOV-2912 |

    @automatic @cert0 @cert1 @live @next @sanity
    Examples:
          | product | cv    | jira_id    |
          | o2uk    | 13.10 | QANOV-2911 |

    @manual @smoke
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-453648 |

  @jira.QANOV-290446 @android @har @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-472060
  @jira.link.relates_to.NOV-29424 @manual @mobile @sanity @vivobr
  Scenario: A non-logged vivobr user without data connectivity can see the no connectivity warning instead of the terms and conditions and the non_clients button
     When terminates the app
      And turns on the Airplane mode
      And launches the app
     Then the "Splash Screen" page is displayed
      And the "non_clients" button is not displayed
      And the "terms_and_conditions_footer" textfield is not displayed
      And the "no_connectivity_warning" warning is displayed
      And the "no_connectivity_warning_text" textfield with "[LANG:launch_app.splash_screen.no_connectivity_warning]" text is displayed
      And waits "6" seconds
      And the "no_connectivity_warning" warning is not displayed

  @jira.<jira_id> @<execution_mode> @<product> @android @cert3 @har @ios @jira.cv.<cv> @jira.link.detects.IOS-9071
  @jira.link.detects.LOC-1146 @live @mobile @next @qa @smoke
  Scenario Outline: A non-logged <product> user without data connectivity can see a non-connectivity warning instead of the legal links
    The warning will be displayed for 10 seconds and then it will disappear.
    Given user has set the cookies preferences
      And turns on the Airplane mode
     When terminates the app
      And launches the app
     Then the "Splash Screen" page is displayed
      And the "no_connectivity_warning.text" textfield with "[LANG:launch_app.splash_screen.no_connectivity_warning]" text is displayed
      And the "become_customer_link" link is not displayed
      And the "cookies_link" link is not displayed
      And the "data_protection_link" link is not displayed
      And the "imprint_link" link is not displayed

    Examples:
          | product | cv   | execution_mode | jira_id      |
          | blaude  | 13.9 | automatic      | QANOV-230122 |
          | o2de    | 14.2 | manual         | QANOV-49045  |

  @jira.<jira_id> @<product> @android @automatic @har @ios @jira.cv.<cv> @mobile @regression
  Scenario Outline: A non-logged <product> user can see the Terms and Conditions after recover connectivity
     When terminates the app
      And turns on the Airplane mode
      And launches the app
      And the "Splash Screen" page is displayed
      And turns off the Airplane mode
      And waits "5" seconds
     Then the "terms_and_conditions_footer" textfield is displayed

    @automatic @cert2 @live @next
    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.9 | QANOV-285227 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 13.9 | QANOV-285228 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-453649 |

  @jira.QANOV-290448 @android @ios @jira.cv.13.9 @jira.link.parent_test_plan.QANOV-472060 @manual @mobile @regression
  @vivobr
  Scenario: A non-logged vivobr user can see the Terms and Conditions and non_clients button after recover connectivity
     When terminates the app
      And turns on the Airplane mode
      And launches the app
      And the "Splash Screen" page is displayed
      And turns off the Airplane mode
      And waits "5" seconds
     Then the "terms_and_conditions_footer" textfield is displayed
      And the "non_clients" button is displayed

  @jira.<jira_id> @<execution_mode> @<product> @android @cert3 @har @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @live @mobile @next @qa @sanity
  Scenario Outline: A <product> user taps log in button without data connectivity: a warning message is displayed
    The warning will be displayed for 10 seconds and then it will disappear.
    Given user has set the cookies preferences
      And user turns on the Airplane mode
      And the "Splash Screen" page is displayed
     When clicks on the "start_now" button
     Then the "no_connectivity_warning.text" textfield with "[LANG:launch_app.splash_screen.no_connectivity_warning]" text is displayed

    Examples:
          | product | cv    | depends_on   | execution_mode | jira_id      |
          | blaude  | 13.10 | QANOV-230122 | automatic      | QANOV-290451 |
          | o2de    | 14.2  | QANOV-49045  | manual         | QANOV-290452 |

  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @mobile @sanity
  Scenario Outline: A <product> user taps log in button without data connectivity: a warning message is displayed
    The warning will be displayed for 10 seconds and then it will disappear.
    Given user turns on the Airplane mode
      And the "Splash Screen" page is displayed
     When clicks on the "start_now" button
      And the "no_connectivity_warning.text" textfield with "[LANG:launch_app.splash_screen.no_connectivity_warning]" text is displayed

    @automatic @cert2 @live @next
    Examples:
          | product | cv    | jira_id      |
          | moves   | 13.10 | QANOV-290393 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | cv    | jira_id      |
          | o2uk    | 13.10 | QANOV-290394 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-453650 |

  @jira.<jira_id> @android @har @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-472060 @manual @mobile @sanity
  @vivobr
  Scenario Outline: A non-logged vivobr user sees the no connectivity warning after tapping on <button> button when enables airplane mode with the app opened
    Given user is in the "Splash Screen" page
     When turns on the Airplane mode
      And clicks on the "<button>" button
     Then the "no_connectivity_warning" warning is displayed
      And the "no_connectivity_warning_text" textfield with "[LANG:launch_app.splash_screen.no_connectivity_warning]" text is displayed

    Examples:
          | button      | jira_id      |
          | start_now   | QANOV-290395 |
          | non_clients | QANOV-290396 |
