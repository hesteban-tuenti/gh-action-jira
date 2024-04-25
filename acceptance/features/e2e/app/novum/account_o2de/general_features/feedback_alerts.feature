# -*- coding: utf-8 -*-
@jira.QANOV-49066
Feature: Feedback alerts


  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Postpay user surfing with a mobile line in low-speed mode will see an alert
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
      And the "alert.description" textfield with the "<description>" format is displayed
      And the "alert.close_button" button is displayed

    Examples:
          | surfing_mode             | description                         | depends_on              | jira_id     |
          | O2-free                  | Sie surfen jetzt im O2-freien Modus | QANOV-38279:QANOV-38284 | QANOV-44459 |
          | Domestic Throttling      | Surfgeschwindigkeit aktuell niedrig | QANOV-38279:QANOV-38284 | QANOV-49067 |
          | International Throttling | Surfgeschwindigkeit aktuell niedrig | QANOV-44465             | QANOV-49069 |

  @jira.QANOV-498452 @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @regression
  Scenario: Postpay HomeSpot/DataSpot user with a limited tariff and without data left will see an alert
    This alert will be displayed when data consumption is higher than 100%.
    It will be an Informative alert with an Informative icon, a title and a description.
    Given user has a "postpay" account type
      And user has any "home_spot;data_spot" product in "active" status
      And user has consumed "100%" of the "data" allowance in the "internet_at_home" product
      And user has the matching subscription selected in the account
      And user has the "Alerts" module configured in CMS for "Account" page
      And the "Alerts" module configured in CMS for "Account" page has a "low-speed-mode" preconfigured provider
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Slow navigation" text is displayed
      And the "alert.description" textfield with the "Surfgeschwindigkeit aktuell niedrig" format is displayed
      And the "alert.close_button" button is not displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @manual @mobile @o2de @smoke
  Scenario Outline: Postpay user with <num_invoices> overdue invoice/s will see an alert
    The alert icon is a red exclamation sign.
    The "view invoices" button will redirect to the Bills screen.
    If the user taps on the "close" button, the alert will disappear for 24 hours. User will see the alert 24 hours
    later or after logging in the app again.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status
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
          | 1            | Du hast eine unbezahlte Rechnung | QANOV-203557 |
          | several      | Du hast unbezahlte Rechnungen    | QANOV-310936 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  @regression
  Scenario Outline: Postpay user with a "pending activation" <pending_product> will see an alert
    If a user has not a bank account saved, it could happen that the product tariff is not paid when needed, so the tariff
    will be updated to "pending_activation" status.
    Given user has a "postpay" account type
      And user has a "<pending_product>" product in "pending_activation" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Zahlung überfällig" text is displayed
      And the "alert.description" textfield with "Nach der Zahlung ist das Konto wieder normal nutzbar" text is displayed
      And the "alert.close_button" button is not displayed

    Examples:
          | cv    | pending_product  | parent_test_plan | jira_id     |
          | 14.2  | mobile_line      |                  | QANOV-49078 |
          | 14.11 | internet_at_home | QANOV-437471     | QANOV-49080 |

  @jira.QANOV-295152 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47785
  @jira.link.parent_test_plan.QANOV-293817 @jira.link.relates_to.QANOV-47842 @manual @mobile @o2de @regression
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
      And the "Alerts" module configured in CMS for "Account" page has a "bundle-in-grace-period" preconfigured provider
      And user is in the "Account" page
     When pulls down the page to refresh
     Then the "Account" page is displayed
      And the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Guthaben aufladen" text is displayed
      And the "alert.description" textfield with the "Lade dein Guthhaben auf, um deine Option zu aktivieren." format is displayed
      And the "alert.close_button" button is displayed
      And the "alert.topup_button" button with "Aufladen" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  @regression
  Scenario Outline: A <account_type> user with a "cancelled" product will see an alert
    Given user has a "<account_type>" account type
      And user has any "<user_product>" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.warning_icon" icon is displayed
      And the "alert.title" textfield with "Vertrag gekündigt" text is displayed
      And the "alert.description" textfield with "Dein Vertrag wurde gekündigt, nur einige Funktionen sind für die nächsten 90 Tage verfügbar, danach wird dein Konto gelöscht." text is displayed
      And the "alert.close_button" button is not displayed

    Examples:
          | account_type | user_product                 | parent_test_plan          | jira_id      |
          | postpay      | mobile_line;internet_at_home | QANOV-306250:QANOV-437471 | QANOV-283574 |
          | prepay       | mobile line                  | QANOV-306250              | QANOV-283575 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.dv.Future @jira.link.parent_test_plan.QANOV-421952 @manual @mobile
  @o2de @regression
  Scenario Outline: Postpay user with "fair use policy" (FUP) will see an alert when consuming data outside the FUP limit
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    The alert link will redirect to an OB webview.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user is consuming data outside the FUP limit
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Datennutzung in der EU" text is displayed
      And the "alert.description" textfield with "Für die aktuelle Datennutzung fallen in diesem Tarif beim Roaming eventuell zusätzliche Kosten an" text is displayed
      And the "alert.link" textfield with "Infos zur Fair Use Policy" text is displayed
      And the "alert.close_button" button is not displayed

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | jira_id      |
          | unlimited   | with            | has not                  | QANOV-424659 |
          | limited     | without         | has                      | QANOV-424660 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-421952
  @jira.link.parent_test_plan.QANOV-620950 @manual @mobile @o2de @regression
  Scenario Outline: Postpay user with "fair use policy" (FUP) will see an alert when consuming data outside the FUP limit
    Postpay users have FUP if:
    - the user has a unlimited tariff contracted after the FUP law.
    - the user has a limited tariff but has contracted a "24h unlimited bundle" pack.
    The alert link will redirect to an OB webview.
    Given user has a "postpay" account type
      And the "inland_eu_data" allowance is <tariff_type> in the "mobile_line" product
      And user has a tariff <tariff_with_fup> fair use policy
      And user <has_24h_unlimited_bundle> a "24h_unlimited_data" bundle in "active" status
      And user is consuming data outside the FUP limit
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield with "Your usage of data in EU is causing an extra charge of \d+(\,\d{1,2})? €" text is displayed
      And the "alert.description" textfield with "You're exceeding the established data limits for roaming usage explained in our Fair usage policy." text is displayed
      And the "alert.link" textfield with "Infos zur Fair Use Policy" text is displayed
      And the "alert.close_button" button is not displayed

    Examples:
          | tariff_type | tariff_with_fup | has_24h_unlimited_bundle | jira_id      |
          | unlimited   | with            | has not                  | QANOV-621111 |
          | limited     | without         | has                      | QANOV-621112 |

  @jira.QANOV-574848 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de
  @regression
  Scenario: A postpay user with a tariff/pack eligible for 5G but with a SIM that does not support it will see an alert
    Dismissible alert, it will not appear again once it is closed.
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user has a SIM that does not support 5g
      And user has the matching subscription selected in the account
      And user has the "Alerts" module configured in CMS for "Account" page
      And the "Alerts" module configured in CMS for "Account" page has a "TBD" preconfigured provider
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.5g_icon" icon is displayed
      And the "alert.title" textfield with "Note on 5G SA" text is displayed
      And the "alert.description" textfield with the "Some of your products are 5G SA capable but one or more of your SIM cards are too old to use 5G SA and need to be replaced. You can exchange them without any costs." format is displayed
      And the "alert.order_sim_button" button with "Order SIM" text is displayed
      And the "alert.5g_info_button" button with "What is 5G SA" text is displayed
      And the "alert.close_button" button is displayed

  @jira.QANOV-574849 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-574848
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a tariff/pack eligible for 5G but with a SIM that does not support it can access to "Swap SIM" screen from the alert
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user has a SIM that does not support 5g
      And user has the "Alerts" module configured in CMS for "Account" page
      And the "Alerts" module configured in CMS for "Account" page has a "TBD" preconfigured provider
      And user is in the "Account" page
     When clicks on the "alert.5g_info_button" button
     Then the "Swap SIM Choose Type" page is displayed
      And the "Ersatz SIM-Karte" header is displayed

  @jira.QANOV-574850 @TBD @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-574848
  @jira.link.parent_test_plan.QANOV-555760 @manual @mobile @o2de @regression
  Scenario: A postpay user with a tariff/pack eligible for 5G but with a SIM that does not support it can access to "What is 5G SA" webview from the alert
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a tariff or pack eligible for 5g
      And user has a SIM that does not support 5g
      And user has the "Alerts" module configured in CMS for "Account" page
      And the "Alerts" module configured in CMS for "Account" page has a "TBD" preconfigured provider
      And user is in the "Account" page
     When clicks on the "alert.5g_info_button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-595146 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @o2de
  @smoke
  Scenario: A postpay user with with a bill higher than last month will see an alert
    The alert will be displayed if the bill is at least 1€ higher than the previous month.
    The alert icon is a yelow warning sign.
    The alert will not be dismissible.
    The alert will last for 15 days.
    The "learn more" button will redirect to an OB webview.
    NOTE: the alert will not be displayed if the high bill flag = false in the Explore Personalization API.
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has a bill higher than last month
      And the high bill flag is active in the explore personalization api
      And user has the matching subscription selected in the account
      And the "Alerts" module configured in CMS for "Account" page has a "TBD" preconfigured provider
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.alert_icon" icon is displayed
      And the "alert.title" textfield with "Warum ist meine Rechnung höher als letzten Monat?" text is displayed
      And the "alert.description" textfield with "Erfahre den Grund für den Anstieg und wie du Zusatzkosten vermeidest" text is displayed
      And the "alert.learn_more_button" button with "Mehr erfahren" text is displayed
      And the "alert.close_button" button is not displayed

  @jira.QANOV-600336 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-606554 @manual @mobile @o2de
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
