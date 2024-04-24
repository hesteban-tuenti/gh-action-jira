# -*- coding: utf-8 -*-
@jira.QABP-102
Feature: Hard-Soft Update


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A logged <product> user is suggested to update the app to a newer version after login
    Given user is logged in
      And Soft Update is enabled
     When terminates the app
      And launches the app
     Then the "Soft Update" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.soft_update.title]" text is displayed
      And the "popup.message" textfield with "[LANG:launch_app.soft_update.subtitle]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.soft_update.accept]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.soft_update.cancel]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-103 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A non-logged <product> user is suggested to update the app to a newer version after login
    Given user is logged out
      And Soft Update is enabled
     When terminates the app
      And launches the app
     Then the "Soft Update" popup is displayed
      And the "popup.title" textfield with "[LANG:launch_app.soft_update.title]" text is displayed
      And the "popup.message" textfield with "[LANG:launch_app.soft_update.subtitle]" text is displayed
      And the "popup.accept" button with "[LANG:launch_app.soft_update.accept]" text is displayed
      And the "popup.cancel" button with "[LANG:launch_app.soft_update.cancel]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-104 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A <product> user reaches the <store> from the "Soft Update" popup
    Given Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
     When clicks on the "popup.accept" button
     Then the "<store>" app is displayed
      And the "<app_name>" page is displayed in the "<store>" store

    Examples:
          | product | client  | app_name     | store      | cv     | depends_on        | jira_id  |
          | was     | android | Whastapp SIM | Play Store | Future | QABP-103:QABP-104 | QABP-105 |
          | was     | ios     | Whastapp SIM | App Store  | Future | QABP-103:QABP-104 | QABP-106 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A logged <product> user is suggested to update the app to a newer version and declines it
    Given user is logged in
      And Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
      And clicks on the "popup.cancel" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | depends_on | jira_id  |
          | was     | Future | QABP-103   | QABP-107 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A non-logged <product> user is suggested to update the app to a newer version and declines it
    Given user is logged out
      And Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | depends_on | jira_id  |
          | was     | Future | QABP-104   | QABP-108 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A logged <product> user is not suggested to update the app to a newer version less than 24h after the last time he was warned (without having closed the app)
    Given user is logged in
      And Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
      And clicks on the "popup.cancel" button
      And the landing tab page is displayed
      And runs the app in the background for "<86399" seconds
     Then the landing tab page is displayed

    Examples:
          | product | cv     | depends_on | jira_id  |
          | was     | Future | QABP-107   | QABP-109 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A non-logged <product> user is not suggested to update the app to a newer version less than 24h after the last time he was warned (without having closed the app)
    Given user is logged out
      And Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
      And clicks on the "popup.cancel" button
      And the "Splash Screen" page is displayed
      And runs the app in the background for "<86399" seconds
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | depends_on | jira_id  |
          | was     | Future | QABP-108   | QABP-110 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A logged <product> user is not suggested to update the app to a newer version less than 24h after the last time he was warned (having closed the app)
    Given user is logged in
      And Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
      And clicks on the "popup.cancel" button
      And the landing tab page is displayed
      And terminates the app
      And waits "<86399" seconds
      And launches the app
     Then the landing tab page is displayed

    Examples:
          | product | cv     | depends_on | jira_id  |
          | was     | Future | QABP-107   | QABP-111 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A non-logged <product> user is not suggested to update the app to a newer version less than 24h after the last time he was warned (having closed the app)
    Given user is logged out
      And Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
      And clicks on the "popup.cancel" button
      And the "Splash Screen" page is displayed
      And terminates the app
      And waits "<86399" seconds
      And launches the app
     Then the "Splash Screen" page is displayed

    Examples:
          | product | cv     | depends_on | jira_id  |
          | was     | Future | QABP-108   | QABP-112 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A logged <product> user is suggested to update the app to a newer version after 24h of the last offering
    Given user is logged in
      And Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
      And clicks on the "popup.cancel" button
      And terminates the app
      And waits "86401" seconds
      And launches the app
     Then the "Soft Update" popup is displayed

    Examples:
          | product | cv     | depends_on | jira_id  |
          | was     | Future | QABP-107   | QABP-113 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A non-logged <product> user is suggested to update the app to a newer version after 24h of the last offering
    Given user is logged out
      And Soft Update is enabled
     When terminates the app
      And launches the app
      And the "Soft Update" popup is displayed
      And clicks on the "popup.cancel" button
      And terminates the app
      And waits "86401" seconds
      And launches the app
     Then the "Soft Update" popup is displayed

    Examples:
          | product | cv     | depends_on | jira_id  |
          | was     | Future | QABP-108   | QABP-114 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A logged <product> user is forced to update the app to a newer version
    Given user is logged in
      And Hard Update is enabled
     When terminates the app
      And launches the app
     Then the "Hard Update" page is displayed
      And the "force_update" icon is displayed
      And the "force_update_title" textfield with "[LANG:launch_app.hard_update.title]" text is displayed
      And the "force_update_subtitle" textfield with "[LANG:launch_app.hard_update.subtitle]" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "update_button" button with "[LANG:launch_app.hard_update.button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-115 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A non-logged <product> user is forced to update the app to a newer version
    Given user is logged out
      And Hard Update is enabled
     When terminates the app
      And launches the app
     Then the "Hard Update" page is displayed
      And the "force_update" icon is displayed
      And the "force_update_title" textfield with "[LANG:launch_app.hard_update.title]" text is displayed
      And the "force_update_subtitle" textfield with "[LANG:launch_app.hard_update.subtitle]" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "update_button" button with "[LANG:launch_app.hard_update.button]" text is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-116 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A <product> user reaches the <store> from the "Hard Update" page
    Given Hard Update is enabled
      And launches the app
      And the "Hard Update" page is displayed
     When clicks on the "update_button" button
     Then the "<app_name>" page is displayed in the "<store>" store

    Examples:
          | product | client  | app_name     | store      | cv     | depends_on        | jira_id  |
          | was     | android | Whastapp SIM | Play Store | Future | QABP-115:QABP-116 | QABP-117 |
          | was     | ios     | Whastapp SIM | App Store  | Future | QABP-115:QABP-116 | QABP-118 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user forced to update the app to a newer version cannot dismiss update screen tapping on the native back button
    Given Hard Update is enabled
     When launches the app
      And the "Hard Update" page is displayed
      And clicks on the native "back" button
     Then the app is running in background
      And launches the app
      And the "Hard Update" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-119 |
