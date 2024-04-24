# -*- coding: utf-8 -*-
@jira.QANOV-109055 @not_hardening
Feature: Medallia Triggers


  @jira.QANOV-109056 @android @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-7436 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO user changes it contact email: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    App flow
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Contact Method" page
      And user has an email stored in the contact method
     When clicks on the "other" radio button
      And fills the "input_text" inputtext with the "email" contact method
      And clicks on the "save" button
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109057 @android @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-98836 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO admin accesses to my tokens page: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    NT flow
    Given user has a "telco" account type
      And user has a "fusion" plan
      And user has a "any_admin" role
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "fusion_services.tokenization" entrypoint
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109065 @android @impeded_mock @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-9387 @mobile @moves
  @no_automatable @regression
  Scenario: TELCO postpay user buy a extra data bundle from the Data Managenment page: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has not the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the data bundle in the desired status
      And the "Bundle Details" page is displayed
      And clicks on the "manage_button" button
     Then the "Medallia Survey" popup is displayed

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.12.5 @jira.link.relates_to.<relates_to> @mobile @moves
  @no_automatable @regression
  Scenario Outline: TELCO postpay user with pay per use in <actual_status> status <confirm_button> the service: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    NOTE: The Medallia pop-up will be shown just if the Success page is displayed
    Given user has a "telco postpay" account type
      And user has a "Movistar Plus+ Lite; Tarifa 0" tariff
      And user has "pay_per_use" service in "<actual_status>" status
      And user has the matching subscription selected in the account
      And user is in the "Data Management" page
     When clicks on the "<management_button>" button
      And the "<management_pop_up>" popup is displayed
      And clicks on the "<confirm_button>" button
      And the "Feedback Success" page is displayed
      And the "positive_feedback_icon" icon is displayed
     Then the "Medallia Survey" popup is displayed

    Examples:
          | actual_status | management_button | management_pop_up      | confirm_button | relates_to | jira_id      |
          | activated     | deactivate_ppu    | Deactivate Pay Per Use | deactivate     | QANOV-8737 | QANOV-109066 |
          | deactivated   | activate_ppu      | Activate Pay Per Use   | activate       | QANOV-8727 | QANOV-109067 |

  @jira.QANOV-109068 @android @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-26994 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO postpay user activates data sharing: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    NOTE: The Medallia pop-up will be shown just if the Success page is displayed
    Given user has a "telco postpay" account type
      And user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And the "Feedback Success" page is displayed
      And the "positive_feedback_icon" icon is displayed
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109069 @android @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-26999 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO postpay user deactivates data sharing: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "deactivate_button" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "accept" button
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-126703 @android @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression @relates_to.QANOV-35016
  Scenario: TELCO postpay admin activates the Movistar Salud service: "Medallia Survey" is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    OB flow
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "movistar_health" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Health Tab" page
     When clicks on the card with "Movistar Salud" text on the "title" of the "health_non_contracted_services" carousel
      And activates the Movistar Salud service on the authenticated webview
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-126704 @android @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression @relates_to.QANOV-67288
  Scenario: TELCO postpay admin with FUSION plan with a non chosen renting device contracts the new terminal: "Medallia Survey" is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    OB flow
    Given user has a "postpay" account type
      And user has a "admin" role
      And user has a "fusion" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "device.icon" button
      And the "Select Device" page is displayed
      And clicks on the "informative_button" button
      And contracts the rented terminal on the authenticated webview
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109084 @android @impeded_mock @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-8416 @mobile @moves
  @no_automatable @regression
  Scenario: TELCO postpay admin change the wifi password: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a internet product with "Fibra" connectivity
      And user has the "smart_wifi" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "WiFi" page
     When fills the "wifi_name" inputtext with the "testtesttest" text
      And clicks on the "save" button
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109098 @android @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-8660 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO postpay admin activates Conexion Segura service: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "conexion_segura" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Security Tab" page
     When clicks on the card with "Conexión Segura" text on the "title" of the "security_not_contracted_services" carousel
      And the "Secure Connection" page is displayed
      And clicks on the "activate_button" button
      And the "Secure Connection Terms And Conditions" page is displayed
      And clicks on the "accept_button" button
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109099 @android @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-8668 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO postpay admin clicks on the 'manage_button' in the Conexion Segura page: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "conexion_segura" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "Security Tab" page
     When clicks on the "manage_service" link of the card with "Conexión Segura" text on the "title" field of the "security_contracted_services" carousel
      And the "Secure Connection" page is displayed
      And clicks on the "manage_button" button
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109100 @android @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-8667 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO postpay admin deactivates Conexion Segura service: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "conexion_segura" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "Security Tab" page
     When clicks on the "manage_service" link of the card with "Conexión Segura" text on the "title" field of the "security_contracted_services" carousel
      And the "Secure Connection" page is displayed
      And clicks on the "deactivate_button" button
      And the "Secure Connection Deactivation" page is displayed
      And clicks on the "deactivate_button" button
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109106 @android @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-8680 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO postpay admin clicks on any option in the Movistar Cloud page: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "movistar_cloud" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "Security Tab" page
     When clicks on the "manage_service" link of the card with "Movistar Cloud Ilimitado" text on the "title" field of the "security_contracted_services" carousel
      And the "Movistar Cloud" page is displayed
      And clicks on the "go_to_movistar_cloud" entrypoint
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-260705 @android @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-256037 @jira.link.relates_to.QANOV-6878
  @mobile @moves @no_automatable @regression
  Scenario: TELCO postpay admin accesses to the Bill details page from the Invoices Tab: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has bills for "any" months
      And the interactive bill is available
      And user has the matching subscription selected in the account
      And user has the communications and leisure content displayed
      And user is in the "Invoices" page
     When clicks on the eligible month in the bills graph
      And clicks on the "bills_summary.see_bill_details_link" button
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109108 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-256037
  @jira.link.relates_to.QANOV-84595 @mobile @moves @no_automatable @regression
  Scenario: TELCO postpay admin downloads a bill in pdf: the "Medallia Survey" pop-up is displayed
    PROD- user: FIC75437
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    Given user has a "telco postpay" account type
      And user has bills for "some" months
      And the interactive bill is not available
      And user has a "admin" role
      And user has the "Factura" bill document in any bill
      And user has the matching subscription selected in the account
      And user is in the "Bill Details" page
     When selects the "Factura" option in the "bill_download" select
     Then the "Medallia Survey" popup is displayed

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.12.7 @jira.link.relates_to.QANOV-2068 @mobile @moves
  @no_automatable @regression
  Scenario Outline: TELCO postpay admin creates a ticket and the result is that the problem is solved by the diagnosis flow: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    other_affected_versions="2021-42"
    Given user has a "telco postpay" account type
      And user has a "telco postpay" account type
      And user is in the last step of the diagnosis flow
      And user is in the "Troubleshoot Start Diagnosis Step Flow" page
     When clicks on the "<button_element>" field in the "<node_type>" step
      And the result is that the problem is solved by the diagnosis flow
     Then the "Feedback Autodiagnosis Success" page is displayed
      And the "success_title" textfield with "Hemos solucionado tu avería" text is displayed
      And the "Medallia Survey" popup is displayed

    Examples:
          | button_element | node_type | jira_id      |
          | answer_button  | Question  | QANOV-146306 |
          | answer_button  | Text      | QANOV-146307 |
          | next_button    | Info      | QANOV-146308 |

  @jira.QANOV-224785 @android @ios @jira.cv.13.4 @jira.link.relates_to.QANOV-26943 @mobile @moves @no_automatable
  @regression
  Scenario: TELCO postpay finish the Debt payment flow: the "Medallia Survey" pop-up is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    app flow
    other_affected_versions="2022-22"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And has "0" valid cards saved in the payment methods area
      And user is in the "Debt Payment Summary" page
      And the selected bills only support "credit card" payment
     When clicks on the "continue" button
      And the "Add New Card" page is displayed
      And fills the "card_number.input" inputtext with the "4444333322221111" text
      And fills the "expiration_date.input" inputtext with the "1225" text
      And fills the "cvv.input" inputtext with the "123" text
      And fills the "card_name.input" inputtext with the "QA Novum Card" text
      And clicks on the "pay" button
      And the "3d_secure" module is displayed
      And accepts the transaction
      And debt payment is completed successfully
     Then the "Medallia Survey" popup is displayed

  @jira.QANOV-109112 @android @impeded_mock @ios @jira.cv.12.5 @jira.link.relates_to.QANOV-26943 @mobile @moves
  @no_automatable @regression
  Scenario: TELCO user who triggered a Medallia event wont see the pop-up when accessing again
    Keep in mind that this surveys just will be displayed one time in PROD environments
    Given user has a "telco postpay" account type
      And user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "close" button
      And makes again the action that triggers the medallia survey
     Then the "Medallia Survey" popup is not displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @smoke
  Scenario Outline: A user accesses the account dashboard for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user is in the "Support" page
     When clicks on the "navigation_tab_bar.account_tab" tab
      And the "Account" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271555 |
          | o2de    | Future | QANOV-271556 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A postpay user accesses the "Bills" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user has a "postpay" account type
      And user is in the "Account" page
     When clicks on the "bills.link" link
      And the "Bills" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271557 |
          | o2de    | Future | QANOV-271558 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses the "Bundle Management" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user has any "<product_type>" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "manage_bundle_button" button
      And the "Bundle Management" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | product_type                | jira_id      |
          | blaude  | 14.3   | mobile_line                 | QANOV-271559 |
          | o2de    | Future | mobile_line;dsl;cable;fiber | QANOV-271560 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user with only one SIM accesses the "Sim Details" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user has a "mobile_line" product
      And user has "1" SIMs
      And user has a SIM in any of "ordered;activating;active;suspended" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "highlighted_services.sim_management_entrypoint" entrypoint
      And the "Sim Details" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271561 |
          | o2de    | Future | QANOV-271562 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user with several SIMs accesses the "Sim Details" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user has a "mobile_line" product
      And user has "several" SIMs
      And user has a SIM in any of "ordered;activating;active;suspended" status
      And user has the matching subscription selected in the account
      And user is in the "Sim Management" page
     When clicks on any element in the "sims_list" list with the "status" field that contains any of the "Bestellt;Activating;Aktiv;Suspended" texts
      And the "Sim Details" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271563 |
          | o2de    | Future | QANOV-271564 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses the "My Tariff" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user has a "postpay" account type
      And user has any "<product_type>" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "tariff_card.details_link" link
      And the "My Tariff" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | product_type                 | jira_id      |
          | blaude  | 14.3   | mobile_line                  | QANOV-271583 |
          | o2de    | Future | mobile_line;internet_at_home | QANOV-271584 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses the "Extra International Data Usage" screen from the account dashboard for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user has a "postpay" account type
      And user has a "mobile_line" product with "international_data" extra charges
      And user has the matching subscription selected in the account
     When clicks on the "international_extra_data" module
      And the "Extra International Data Usage" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271585 |
          | o2de    | Future | QANOV-271586 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses the "Extra International Data Usage" screen from the "Consumption" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user has a "postpay" account type
      And user has "international_data" allowances in the "mobile_line" product
      And user is in the "Mobile Line Consumption" page
     When clicks on the "outside_eu" tab
      And clicks on the "extra_consumption" module
      And the "Extra International Data Usage" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271587 |
          | o2de    | Future | QANOV-271588 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses the "Explore" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user is in the "Account" page
     When clicks on the "navigation_tab_bar.explore_tab" button
      And the "Explore" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271589 |
          | o2de    | Future | QANOV-271590 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses the "Support" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user is in the "Account" page
     When clicks on the "navigation_tab_bar.support_tab" button
      And the "Support" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271593 |
          | o2de    | Future | QANOV-271594 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses the "Profile" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user is in the "<initial_screen>" page
     When clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | initial_screen | jira_id      |
          | blaude  | 14.3   | Account        | QANOV-271605 |
          | blaude  | 14.3   | Explore        | QANOV-271606 |
          | blaude  | 14.3   | Support        | QANOV-271607 |
          | blaude  | 14.3   | Start          | QANOV-271608 |
          | o2de    | Future | Account        | QANOV-271609 |
          | o2de    | Future | Explore        | QANOV-271610 |
          | o2de    | Future | Support        | QANOV-271611 |
          | o2de    | Future | Start          | QANOV-271612 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user requests to change the billing address successfully: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user is in the "Change Billing Address Confirmation" popup
     When clicks on the "popup.accept" button
      And the "Billing Address Success Feedback" page is displayed
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-312396 |
          | o2de    | Future | QANOV-312397 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user requests to change the billing address unsuccessfully: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user is in the "Change Billing Address Confirmation" popup
     When clicks on the "popup.accept" button
      And there is an error changing the billing address
      And the "Billing Address Error Feedback" page is displayed
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-311701 |
          | o2de    | Future | QANOV-311702 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses to the "App Notification" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user is in the "Profile" page
     When clicks on the "app_notifications_entrypoint" entrypoint
      And the "Notifications Management" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | Future | QANOV-272259 |
          | o2de    | Future | QANOV-272260 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses to the "Your Orders" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user has a "postpay" account type
      And user is in the "Profile" page
     When clicks on the "my_orders_entrypoint" entrypoint
      And the "Your Orders" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271649 |
          | o2de    | Future | QANOV-271650 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user accesses to the "Start tab" screen for 5 seconds: the "Medallia Survey" pop-up is displayed
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user is in the "Profile" page
     When clicks on the "navigation_tab_bar.start_tab" tab
      And the "Start" page is displayed
      And waits "5" seconds
     Then the "Medallia Survey" popup is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-343627 |
          | o2de    | Future | QANOV-343628 |

  @jira.<jira_id> @<product> @android @impeded_mock @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user who triggered a Medallia event will not see the pop-up when accessing again
    The OB can configure that the survey is displayed always or just one time every X months.
    Given user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "close" button
      And makes again the action that triggers the medallia survey
     Then the "Medallia Survey" popup is not displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271651 |
          | o2de    | Future | QANOV-272266 |
