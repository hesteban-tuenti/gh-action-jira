@jira.QANOV-34027 @not_hardening
Feature: Magic link marketplace

  Actions Before each Scenario:
    Given user has a "telco postpay" account type
    And user has a Movistar+ Deco 4K
    And user has a "HGU router" resource


  @jira.<jira_id> @no_automatable @android @ios @jira.cv.12.0 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-37175 @moves @<test_priority> @mobile
  Scenario Outline: A user receives a LA Marketplace payment notification
    Given user is logged in
      And user has the app in "<status>" status
      And user has a "admin" role
     When purchases in Marketplace living app
     Then the "marketplace_purchase" notification is received
      And the "notification_title" textfield with "Continúa desde la app" text is displayed
      And the "notification_body" textfield with "Finaliza el pago de tus compras en la TV desde aquí" text is displayed

    Examples:
          | status     | detects             | jira_id     | test_priority |
          | background | APPS-7514:APPS-7519 | QANOV-34028 | smoke         |
          | killed     |                     | QANOV-34029 | regression    |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.12.0
  @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-37175 @moves @<test_priority> @mobile
  Scenario Outline: A user who receives a LA Marketplace payment notification can access to Marketplace Purchase Summary page
    Given user is logged in
      And user has a "admin" role
      And user has the app in "<status>" status
      And has received a "marketplace_purchase" notification
     When clicks on the notification
     Then the "Marketplace Purchase Summary" page is displayed
      And the "Pago seguro" header is displayed
      And the "summary_section_title" textfield with "Resumen de tu compra" text is displayed
      And the "purchase_name" textfield is displayed
      And the "purchase_amount" textfield with the "X,XX€" format is displayed
      And the "shipping_costs_name" textfield with "Gastos de envío" text is displayed
      And the "shipping_costs_amount" textfield with the "X,XX€" format is displayed
      And the "total_purchase_title" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_purchase_amount" textfield with the "X,XX €" format is displayed
      And the "purchase_button" button with "Pagar" text is displayed

    Examples:
          | status     | depends_on  | jira_id     | test_priority |
          | background | QANOV-34028 | QANOV-34030 | regression    |
          | killed     | QANOV-34029 | QANOV-34031 | smoke         |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.12.0
  @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-37175 @moves @regression @mobile
  Scenario Outline: A user who receives a LA Marketplace payment notification with app closed and doesn't tap on it will see the Inbox updated
    Given user has the app in "<status>" status
      And user has a "admin" role
     When user receives a "marketplace_purchase" notifications
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "profile_inbox_list" list is displayed
      And the "profile_inbox_notification[0]" textfield with "marketplace_purchase" notification is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | status     | depends_on  | jira_id     |
          | background | QANOV-34028 | QANOV-34032 |
          | killed     | QANOV-34029 | QANOV-34033 |

  @jira.QANOV-34034 @no_automatable @android @ios @jira.cv.12.0
  @jira.link.depends_on.QANOV-34028 @jira.link.depends_on.QANOV-34029 @jira.link.parent_test_plan.QANOV-37175 @moves
  @regression @mobile
  Scenario: A user who is in Notification Inbox and receives a LA Marketplace payment notification will see the list of notifications updated with the unseen notification
    Given user is in the "Notification Inbox" page
      And user has a "admin" role
     When user receives a "marketplace_purchase" notifications
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0].title" textfield with "Continúa desde la app" text is displayed
      And the "profile_inbox_notification[0].subtitle" textfield with "Finaliza el pago de tus compras en la TV desde aquí" text is displayed
      And a "numeric" red badge is displayed in the "profile_inbox_notification[0]" item

  @jira.QANOV-34035 @no_automatable @android @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-37175 @moves @regression @mobile
  Scenario: A user can access to the Marketplace Purchase Summary page from the notifications inbox
    Given user is in the "Notification Inbox" page
      And user has a "admin" role
      And user has received a "marketplace_purchase" notifications
     When clicks on "marketplace_notification" element in the "profile_inbox_list" list
     Then the "Marketplace Purchase Summary" page is displayed
      And the "Pago seguro" header is displayed
      And the "summary_section_title" textfield with "Resumen de tu compra" text is displayed
      And the "purchase_name" textfield is displayed
      And the "purchase_amount" textfield with the "X,XX€" format is displayed
      And the "shipping_costs_name" textfield with "Gastos de envío" text is displayed
      And the "shipping_costs_amount" textfield with the "X,XX€" format is displayed
      And the "total_purchase_row_title" textfield with "[LANG:payments.debt_amount_label]" text is displayed
      And the "total_purchase_row_amount" textfield with the "X,XX €" format is displayed
      And the "purchase_button" button with "Pagar" text is displayed
      And clicks on the "navigation_top_bar.back_button" entrypoint
      And the "Notification Inbox" page is displayed

  @jira.QANOV-34036 @no_automatable @android @ios @jira.cv.12.0
  @jira.link.depends_on.QANOV-34035 @jira.link.parent_test_plan.QANOV-37175 @moves @regression @mobile
  Scenario: While Marketplace Payment is loading, user will see a skeleton animation
    Given user is in the "Marketplace Buy Summary" page
      And user has a "admin" role
     When clicks on the "purchase_button" button
     Then skeleton animation is displayed while the content is loading

  @jira.QANOV-34037 @no_automatable @android @ios @jira.cv.12.0
  @jira.link.depends_on.QANOV-34035 @jira.link.parent_test_plan.QANOV-37175 @moves @regression @mobile
  Scenario: User can not access to a Marketplace Purchase Summary page without connectivity
    Given user is in the "Notification Inbox" page
      And user has a "admin" role
      And user has received a "marketplace_purchase" notifications
      And user turns on the Airplane mode
     When clicks on "marketplace_notification" element in the "profile_inbox_list" list
     Then the "Marketplace No Connectvity" page is displayed
      And the "no_connectivity_title" textfield with "Parece que no tienes conexión" text is displayed
      And the "no_connectivity_body" textfield with "Para continuar, comprueba tu conexión e inténtalo de nuevo." text is displayed
      And the "retry_button" button with "Reintentar" text is displayed

  @jira.QANOV-34038 @TBD @no_automatable @android @ios @jira.cv.12.0
  @jira.link.depends_on.QANOV-34035 @jira.link.parent_test_plan.QANOV-37175 @moves @regression @mobile
  Scenario: User access to a Marketplace Purchase Summary page and a error occurs
    Given user is in the "Notification Inbox" page
      And user has a "admin" role
      And user has received a "marketplace_purchase" notifications
     When clicks on "marketplace_notification" element in the "profile_inbox_list" list
      And there is an error
     Then the "Marketplace Error" page is displayed
      And the "marketplace_error_title" textfield with "TBD" text is displayed
      And the "marketplace_error_text" textfield with "TBD" text is displayed

  @jira.QANOV-34040 @no_automatable @android @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-37175 @moves @regression @mobile
  Scenario: A admin-light cannot receive a LA Marketplace payment notification
    Given user is logged in
      And user has a "admin-light" role
     When purchases in Marketplace living app
     Then the "marketplace_purchase" notification is not displayed
