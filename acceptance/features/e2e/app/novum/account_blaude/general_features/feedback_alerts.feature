# -*- coding: utf-8 -*-
@jira.QANOV-171454
Feature: Feedback alerts


  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @raitt_drop1 @regression
  Scenario Outline: Postpay user surfing in low-speed mode will see an alert
    This alert will be displayed when data consumption is higher than 100%.
    It will be an Informative alert with an Informative icon, a title, a description and a close button.
    If the user taps on the "close" button, the alert will disappear for 24 hours. User will see the alert 24 hours
    later or after logging in the app again.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user is surfing in "<surfing_mode>" mode
      And user has not closed the "throttling_alert" alert in "24 hours"
      And user has the matching subscription selected in the account
      And user has the "Alerts" module configured in CMS for "Account" page
      And the "Alerts" module configured in CMS for "Account" page has a "low-speed-mode" preconfigured provider
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Langsame Internetverbindung" text is displayed
      And the "alert.description" textfield with the "Surfgeschwindigkeit aktuell niedrig" format is displayed
      And the "alert.close_button" button is displayed

    Examples:
          | surfing_mode             | depends_on                | detects   | jira_id      |
          | Domestic Throttling      | QANOV-203238:QANOV-203269 | OBO2DE-87 | QANOV-203564 |
          | International Throttling | QANOV-203248              |           | QANOV-203566 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.detects.OBO2DE-77 @manual @mobile @raitt_drop1
  @regression
  Scenario Outline: Postpay user with <num_invoices> overdue invoice/s will see an alert
    The alert icon is a red exclamation sign.
    The "view invoices" button will redirect to the Bills screen.
    If the user taps on the "close" button, the alert will disappear for 24 hours. User will see the alert 24 hours
    later or after logging in the app again.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "<num_invoices>" bills in "overdue" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.alert_icon" icon is displayed
      And the "alert.title" textfield with "Zahlungen überprüfen" text is displayed
      And the "alert.description" textfield with "<description>" text is displayed
      And the "alert.view_invoices_button" button with "Rechnung anzeigen" text is displayed
      And the "alert.close_button" button is displayed

    Examples:
          | num_invoices | description                      | jira_id      |
          | 1            | Du hast eine unbezahlte Rechnung | QANOV-203569 |
          | several      | Du hast unbezahlte Rechnungen    | QANOV-310935 |

  @jira.QANOV-203571 @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario: Postpay user with a "pending activation" mobile line will see an alert
    If a user has not a bank account saved, it could happen that the product tariff is not paid when needed, so the tariff
    will be updated to "pending_activation" status.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "pending_activation" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Zahlung überfällig" text is displayed
      And the "alert.description" textfield with "Nach der Zahlung ist das Konto wieder normal nutzbar" text is displayed
      And the "alert.close_button" button is not displayed

  @jira.QANOV-295133 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-171312
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-171455 @manual @mobile @raitt_drop1 @regression
  Scenario: Prepay user with a bundle in grace period (pending activation) can see an alert in the account dashboard
    It will be an Informative alert with an Informative icon, a title, a description, a "topup" button and a close button.
    The topup button will redirect to the Topup screen.
    If the user taps on the "close" button, the alert disappears until the account tab is refreshed.
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "any" allowances in the "mobile_line" product
      And user has a "any" bundle in "pending_activation" status
      And user has the "Alerts" module configured in CMS for "Account" page
      And the alert configured in CMS has the "bundle-in-grace-period" preconfiguration
      And user is in the "Account" page
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Guthaben aufladen" text is displayed
      And the "alert.description" textfield with the "Lade dein Guthhaben auf, um deine Option zu aktivieren." format is displayed
      And the "alert.close_button" button is displayed
      And the "alert.topup_button" button with "Aufladen" text is displayed

  @jira.QANOV-295134 @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.relates_to.QANOV-189967 @manual @mobile @raitt_drop1 @regression
  Scenario: Prepay user with a tariff in grace period can see an alert in the account dashboard
    It will be an Informative alert with an Informative icon, a title, a description, a "topup" button and a close button.
    The topup button will redirect to the Topup screen.
    If the user taps on the "close" button, the alert disappears until the account tab is refreshed.
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "pending_activation" status
      And user has the "Alerts" module configured in CMS for "Account" page
      And the alert configured in CMS has the "tariff-in-grace-period" preconfiguration
      And user is in the "Account" page
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Guthaben aufladen" text is displayed
      And the "alert.description" textfield with the "Lade dein Guthhaben auf, um deinen Tarif zu aktivieren" format is displayed
      And the "alert.close_button" button is displayed
      And the "alert.topup_button" button with "Aufladen" text is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile
  @raitt_drop1 @regression
  Scenario Outline: A <account_type> user with a "cancelled" mobile line product will see an alert
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.warning_icon" icon is displayed
      And the "alert.title" textfield with "Vertrag gekündigt" text is displayed
      And the "alert.description" textfield with "Dein Vertrag wurde gekündigt, nur einige Funktionen sind für die nächsten 90 Tage verfügbar, danach wird dein Konto gelöscht." text is displayed
      And the "alert.close_button" button is not displayed

    Examples:
          | account_type | jira_id      |
          | postpay      | QANOV-283477 |
          | prepay       | QANOV-307981 |

  @jira.QANOV-595141 @android @blaude @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-606554 @manual @mobile
  @smoke
  Scenario: A postpay user with with a bill higher than last month will see an alert if the high bill flag is active
    The alert will be displayed if the bill is at least 1€ higher than the previous month.
    The alert icon is a yelow warning sign.
    The alert will not be dismissible.
    The alert will last for 15 days.
    The "learn more" button will redirect to an OB webview.
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the matching subscription selected in the account
      And the "Alerts" module configured in CMS for "Account" page has a "TBD" preconfigured provider
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.alert_icon" icon is displayed
      And the "alert.title" textfield with "Why is my bill higher than last month?" text is displayed
      And the "alert.description" textfield with "Learn why it has increased and how to avoid future extra spendings" text is displayed
      And the "alert.learn_more_button" button with "Learn more" text is displayed
      And the "alert.close_button" button is not displayed

  @jira.QANOV-600329 @android @blaude @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-606554 @manual @mobile
  @regression
  Scenario: A postpay user with with a bill higher than last month cannot see the alert if the high bill flag is deactivated
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a bill higher than last month
      And the high bill flag is inactive in the explore personalization api
      And user has the matching subscription selected in the account
      And the "Alerts" module configured in CMS for "Account" page has a "TBD" preconfigured provider
      And user is in the "Account" page
     Then the "alert" element is not on display
