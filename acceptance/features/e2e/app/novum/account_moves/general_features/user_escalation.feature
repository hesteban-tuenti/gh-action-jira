# -*- coding: utf-8 -*-
@jira.QANOV-8135
Feature: User escalation


  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-64294 @mobile @moves @regression
  Scenario Outline: An ADMIN LIGHT user taps back after reaching the "Login escalation required" screen
    commented_tags="@depends_on.NOV-47799 @depends_on.NOV-47976 @depends_on.NOV-47802 @depends_on.NOV-47873 @depends_on.NOV-47874 @depends_on.NOV-47974 @depends_on.NOV-48084 @depends_on.NOV-53568 @depends_on.NOV-194450"
    Given user has a "admin-light" role
      And user has a "<plan>" plan
      And user has a "<product>" product
      And user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user reaches the "Login Escalation Required" page after clicking on "<screen_item>" in "<initial_screen>" page
     When clicks on the "navigation_top_bar.<navigation_button>" button
     Then the "<initial_screen>" page is displayed

    @manual
    Examples:
          | cv   | account_type | plan     | product     | initial_screen              | screen_item                                    | navigation_button | parent_test_plan | detects               | jira_id      |
          | 10.5 | any          | fusion   | any         | Mobile Dashboard Other Line | allowance_counter                              | back_button       |                  |                       | QANOV-8138   |
          | 10.5 | any          | fusion   | any         | Mobile Dashboard Other Line | extra_charges_entrypoint                       | back_button       |                  |                       | QANOV-8144   |
          | 10.5 | any          | fusion   | any         | Extra Charges               | product_different_than_mobile_line_logged_link | back_button       |                  |                       | QANOV-8152   |
          | 13.3 | any          | pikolin  | any         | Mobile Dashboard Other Line | allowance_counter                              | back_button       | QANOV-189597     |                       | QANOV-194544 |
          | 13.3 | any          | pikolin  | any         | Mobile Dashboard Other Line | extra_charges_entrypoint                       | back_button       | QANOV-189597     |                       | QANOV-194545 |
          | 13.3 | any          | pikolin  | any         | Extra Charges               | product_different_than_mobile_line_logged_link | back_button       | QANOV-189597     |                       | QANOV-194546 |
          | 10.5 | any          | any      | landline    | Landline                    | extra_charges_entrypoint                       | back_button       |                  |                       | QANOV-8162   |
          | 10.5 | any          | any      | landline    | Landline                    | allowance_counter                              | back_button       |                  |                       | QANOV-8164   |
          | 10.5 | any          | any      | tv          | Television                  | extra_charges_entrypoint                       | back_button       |                  |                       | QANOV-8166   |
          | 10.5 | any          | any      | tv          | Television                  | disney_plus_activation_button                  | close_button      |                  | MOVES-4894            | QANOV-8168   |
          | 10.5 | any          | any      | any         | Profile                     | shop_identification_link                       | back_button       |                  |                       | QANOV-8170   |
          | 10.5 | any          | any      | mobile_line | Secure Connection           | deactivate_button                              | back_button       |                  |                       | QANOV-8172   |
          | 12.1 | telco        | any      | any         | Email Modification          | email_save                                     | back_button       |                  | IOS-6658:ANDROID-9182 | QANOV-59905  |
          | 12.1 | telco        | any      | any         | Phone Modification          | phone_save                                     | back_button       |                  | IOS-6658:ANDROID-9182 | QANOV-59906  |
          | 12.3 | postpay      | fusion   | any         | Select Device               | informative_button                             | back_button       | QANOV-67288      |                       | QANOV-68954  |
          | 12.3 | postpay      | fusion   | any         | Account                     | tariff_details.button_change                   | back_button       |                  |                       | QANOV-75189  |
          | 13.3 | postpay      | pikolin  | any         | Select Device               | informative_button                             | back_button       | QANOV-189597     |                       | QANOV-194547 |
          | 13.3 | postpay      | pikolin  | any         | Account                     | tariff_details.button_change                   | back_button       | QANOV-189597     |                       | QANOV-194548 |
          | 12.4 | postpay      | monoline | any         | Account                     | tariff_details.button_change                   | back_button       | QANOV-106563     |                       | QANOV-106757 |
          | 12.3 | postpay      | fusion   | any         | Television                  | manage_tv                                      | back_button       |                  |                       | QANOV-99232  |
          | 12.3 | postpay      | fusion   | any         | DAZN details                | button                                         | close_button      | QANOV-98837      |                       | QANOV-99234  |
          | 13.3 | postpay      | pikolin  | any         | Television                  | manage_tv                                      | back_button       | QANOV-189597     |                       | QANOV-194550 |
          | 13.3 | postpay      | pikolin  | any         | Television                  | buy_button                                     | back_button       | QANOV-189597     |                       | QANOV-194551 |
          | 13.3 | postpay      | pikolin  | any         | DAZN details                | button                                         | close_button      | QANOV-189597     |                       | QANOV-194552 |
          | 13.4 | telco        | any      | any         | Profile                     | movistarplus_email_change_entrypoint           | back_button       |                  |                       | QANOV-226658 |
          | 13.4 | telco        | any      | any         | Profile                     | movistarplus_email_change_entrypoint           | back_button       |                  |                       | QANOV-226658 |

    @no_automatable
    Examples:
          | cv   | account_type   | plan | product | initial_screen | screen_item                                  | navigation_button | parent_test_plan          | detects | jira_id      |
          | 12.7 | legado postpay | any  | any     | Bills          | billing_configuration.payment_methods        | back_button       | QANOV-125017              |         | QANOV-260699 |
          | 10.5 | legado postpay | any  | any     | Bills          | see_bill_detail_link                         | back_button       |                           |         | QANOV-260700 |
          | 12.7 | legado postpay | any  | any     | Bills          | invoice_consultation                         | back_button       | QANOV-125017:QANOV-142598 |         | QANOV-260701 |
          | 12.7 | legado postpay | any  | any     | Bills          | billing_configuration.change_billing_address | back_button       | QANOV-125017              |         | QANOV-260702 |
          | 12.5 | legado prepay  | any  | any     | Account        | diagnostics_module.button                    | back_button       |                           |         | QANOV-129587 |
          | 12.5 | legado prepay  | any  | any     | Support        | diagnostics_module.button                    | back_button       |                           |         | QANOV-129588 |

    @jira.link.parent_test_plan.QANOV-256037
    Examples:
          | cv   | account_type  | plan | product | initial_screen | screen_item                                  | navigation_button | parent_test_plan          | detects | jira_id      |
          | 10.5 | telco postpay | any  | any     | Invoices       | see_bill_detail_link                         | back_button       |                           |         | QANOV-8157   |
          | 13.0 | telco postpay | any  | any     | Invoices       | invoice_claim_entrypoint                     | back_button       | QANOV-125017              |         | QANOV-185209 |
          | 12.7 | telco postpay | any  | any     | Invoices       | invoice_consultation                         | back_button       | QANOV-125017:QANOV-142598 |         | QANOV-142596 |
          | 12.7 | telco postpay | any  | any     | Invoices       | billing_configuration.change_billing_address | back_button       | QANOV-125017              |         | QANOV-145137 |
          | 12.7 | telco postpay | any  | any     | Invoices       | billing_configuration.payment_methods        | back_button       | QANOV-125017              |         | QANOV-145138 |
          | 12.8 | telco postpay | any  | any     | Invoices       | billing_configuration.pending_invoices       | back_button       | QANOV-125017              |         | QANOV-146385 |

    @impeded_mock
    Examples:
          | cv   | account_type | plan    | product | initial_screen              | screen_item            | navigation_button | parent_test_plan | detects | jira_id      |
          | 10.5 | any          | fusion  | any     | Mobile Dashboard Other Line | pay_per_use_entrypoint | back_button       |                  |         | QANOV-8148   |
          | 13.3 | any          | pikolin | any     | Mobile Dashboard Other Line | pay_per_use_entrypoint | back_button       | QANOV-189597     |         | QANOV-194553 |

  @jira.QANOV-8347 @android @ios @jira.cv.10.5 @jira.link.depends_on.QANOV-8246 @jira.link.relates_to.NOV-64301 @manual
  @mobile @moves @regression
  Scenario: User access to Profile after successful user escalation with already used credentials
    Given user has a "admin" role
      And user has the matching subscription selected in the account
      And user has performed the user escalation
     When clicks on the "notification_top_bar.profile_icon" button
     Then the "Profile" page is displayed
      And the "owner" textfield with "Titular" text is displayed
      And the current user name is displayed

  @jira.QANOV-59907 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario: An admin-light user performs login escalation with ADMIN credentials already used to change the contact email
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user reaches the "Moves Password Login" page after clicking on "email_save" in "Email Modification" page
     When fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the "Email Modification" page is displayed
      And the "email_save" button is displayed
      And the "back_to_account" button with "Volver a mi perfil" text is displayed

  @jira.QANOV-59908 @android @ios @jira.cv.12.1 @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario: An admin-light user performs login escalation with ADMIN credentials already used to change the contact phone number
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user reaches the "Moves Password Login" page after clicking on "phone_save" in "Phone Modification" page
     When fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the "Phone Modification" page is displayed
      And the "phone_save" button is displayed

  @jira.QANOV-75190 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: An admin-light user performs login escalation with ADMIN credentials already used to Select the R2R device
    Given user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user reaches the "Moves Password Login" page after clicking on "informative_button" in "Select Device" page
     When fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "TBD" string is displayed

  @jira.QANOV-75191 @android @impeded_legacy @ios @jira.cv.12.3 @manual @mobile @moves @regression
  Scenario: An admin-light FUSION user performs login escalation with ADMIN credentials already used to Change the tariff
    Given user has a "legado" account type
      And user has a "admin-light" role
      And user has a "fusion" plan
      And user has the matching subscription selected in the account
      And user has the "agreement-details-telco" module configured in CMS for "dashboard" page
      And user reaches the "Moves Password Login" page after clicking on "tariff_details.button_change" in "Account" page
     When fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the browser webview is displayed
      And the "Particulares" header is displayed
      And the "Cambia de producto según tus preferencias" string is displayed

  @jira.QANOV-106760 @android @impeded_legacy @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-106563 @manual @mobile
  @moves @regression
  Scenario: An admin-light MONOLINE user performs login escalation with ADMIN credentials already used to Change the tariff from the Plan details
    Given user has a "legado" account type
      And user has a "admin-light" role
      And user has a "monoline" plan
      And user has the matching subscription selected in the account
      And user has the "agreement-details-telco" module configured in CMS for "dashboard" page
      And user reaches the "Moves Password Login" page after clicking on "tariff_details.button_change" in "Account" page
     When fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the browser webview with "Tarifas móvil" text in the header is displayed
      And the "Tarifas encontradas" string is displayed

  @jira.QANOV-98609 @android @ios @jira.cv.12.3 @manual @mobile @moves @regression
  Scenario: An admin-light user performs login escalation with ADMIN credentials already used to access to the 'Alta y baja de contenidos' screen
    commented_tags="@depends_on.NOV-52861"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has a "fusion;pikolin" plan
      And user has TV offers available
      And user does not have TV packages/channels available
      And user has the "smart-actions-telco" module configured in CMS for "tv" page
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "manage_tv" button
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the browser webview is displayed
      And the "Alta y baja de contenidos" header is displayed

  @jira.QANOV-99235 @android @automation.hard @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-98837 @manual @mobile
  @moves @regression
  Scenario: ADMIN-LIGHT user performs login escalation with ADMIN credentials already used to access to the "DAZN OB webview"
    TV channel in tariff hard to automate cause the MOVES team is harcoding this info in this repo and is hard to check: https://github.com/Telefonica/tv-catalogue
    Given user has a "admin-light" role
      And user has the "DAZN" TV channel in tariff
      And user has the matching subscription selected in the account
      And user is in the "DAZN details" page
     When clicks on the "button" button
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the browser webview is displayed
      And the "DAZN" string is displayed

  @jira.QANOV-185210 @android @ios @jira.cv.13.0 @jira.link.parent_test_plan.QANOV-125017 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT user performs login escalation with ADMIN credentials already used to access to the "Reclamaciones OB webview"
    other_affected_versions="2022-07-B"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has bills for "any" months
      And user has the matching subscription selected in the account
      And user is in the "Invoices" page
     When clicks on the "invoice_claim_entrypoint" entrypoint
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the "Invoices" page is displayed
      And the "Facturas" header is displayed

  @jira.QANOV-142597 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-125017
  @jira.link.parent_test_plan.QANOV-142598 @manual @mobile @moves @regression
  Scenario: Telco postpay ADMIN-LIGHT user performs login escalation with ADMIN credentials already used to access to the "Consultas sobre facturas" page
    other_affected_versions="2021-31-B"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has bills for "any" months
      And user is logged in the "What's App" app
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the "invoice_consultation" module
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the "What's App" app is displayed
      And the Mi Movistar conversation will be displayed on the What's App app

  @jira.QANOV-265128 @android @impeded_legacy @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-125017
  @jira.link.parent_test_plan.QANOV-142598 @mobile @moves @no_automatable @regression
  Scenario: Legado postpay ADMIN-LIGHT user performs login escalation with ADMIN credentials already used to access to the "Consultas sobre facturas" page
    other_affected_versions="2021-31-B"
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user has bills for "any" months
      And user is logged in the "What's App" app
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Bills" page
     When clicks on the "invoice_consultation" module
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the "What's App" app is displayed
      And the Mi Movistar conversation will be displayed on the What's App app

  @jira.QANOV-145139 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-125017 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT user performs login escalation with ADMIN credentials already used to access to the "Cambiar dirección de facturación" OB webview
    other_affected_versions="2021-39"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has bills for "any" months
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the "billing_configuration.change_billing_address" entrypoint
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the "Invoices" page is displayed
      And the "Facturas" header is displayed

  @jira.QANOV-145140 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-125017 @manual @mobile @moves
  @regression
  Scenario: ADMIN-LIGHT user performs login escalation with ADMIN credentials already used to access to the 'Mis métodos de pago' page
    other_affected_versions="2021-39"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has bills for "any" months
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "invoices" page
      And user is in the "Invoices" page
     When clicks on the "billing_configuration.payment_methods" entrypoint
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the "My Payment Methods" page is displayed
      And the "[LANG:profile.dashboard.my_information.my_payment_methods]" header is displayed

  @jira.QANOV-129589 @android @impeded_legacy @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression
  Scenario: ADMIN-LIGHT user performs login escalation with ADMIN credentials already used to access to the "Solucionar avería" webview from Account
    other_affected_versions="2021-34-B"
    Given user has a "legado prepay" account type
      And user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user has the "support-card" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     When clicks on the "diagnostics_module.button" button
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the internal webview is displayed
      And the "Solucionar avería" header is displayed

  @jira.QANOV-129590 @android @impeded_legacy @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression
  Scenario: ADMIN-LIGHT user performs login escalation with ADMIN credentials already used to access to the "Solucionar avería" webview from Support
    other_affected_versions="2021-34-B"
    Given user has a "legado prepay" account type
      And user has a "admin-light" role
      And user has the matching subscription selected in the account
      And user is in the "Support" page
     When clicks on the "diagnostics_module.button" button
      And the "Login Escalation Required" page is displayed
      And fills the "identifier_inputtext" inputtext with the user identity
      And clicks on the "continue_button" button
      And the "Moves Password Login" page is displayed
      And fills the "password_field" inputtext with the user password
      And clicks on the "continue_button" button
     Then the browser webview is displayed
      And the header that contains the "Solucionar avería" text is displayed

  @jira.QANOV-143104 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @not_hardening @smoke
  Scenario: A telco postpay admin-light with debt can see the Bill Selection screen after completing the escalation flow
    other_affected_versions="2021-38"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has "pending" debt
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
      And the "Login Escalation Required" page is displayed
      And clicks on the "access_with_password" button
      And the "Moves Login For Escalation" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And I hide the keyboard
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirm_button" button
     Then the "Bill Selection" page is displayed

  @jira.QANOV-287331 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @not_hardening @regression
  Scenario: A legado admin-light with debt cannot pay it through app after completing the escalation flow
    other_affected_versions="2022-46"
    Given user has a "legado" account type
      And user has a "admin-light" role
      And user has "legado" debt
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
      And the "Login Escalation Required" page is displayed
      And clicks on the "access_with_password" button
      And the "Moves Login For Escalation" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And I hide the keyboard
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirm_button" button
     Then the "Unpayable Debt Info" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "info_icon" icon is displayed
      And the "unpayable_debt_text" textfield with "Lo sentimos, tus facturas no se pueden pagar a través de la app o la web. Por favor, llama al 1004 para realizar el pago." text is displayed
      And the "back" button with "Volver" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And clicks on the "back" button
      And the "Native Messages" page is displayed

  @jira.QANOV-143108 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves
  @not_hardening @regression
  Scenario: A admin-light without debt sees an empty case after completing the escalation flow
    other_affected_versions="2021-38"
    Given user does not have "any" debt
      And user has a "admin-light" role
     When user opens the "Payments.Debt Payment" deeplink with the app in "killed" status
      And the "Login Escalation Required" page is displayed
      And clicks on the "access_with_password" button
      And the "Moves Login For Escalation" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And I hide the keyboard
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirm_button" button
     Then the "Informative No Debt" page is displayed
      And the "informative_title" textfield with "Sin facturas pendientes" text is displayed
      And the "informative_title" textfield with "Cuando tengas alguna factura pendiente podrás verla aquí." text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Native Messages" page is displayed

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.8 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-152294 @manual @mobile @moves @regression
  Scenario Outline: TELCO ADMIN-LIGHT user can access to the 'Contact Email Change In Contract Conditions' page after completing the escalation flow
    For telco users you can access the page through the Seguridad vertical
    other_affected_versions="2022-06-B 2022-05"
    Given user has a "admin-light" role
      And user has a "telco postpay" account type
      And user <prencondition>
      And user has the matching subscription selected in the account
      And user is in the "<initial_page>" page
     When clicks on the "<action_button>" button
      And the "Login Escalation Required" page is displayed
      And clicks on the "access_with_password" button
      And the "Moves Login For Escalation" page is displayed
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Password Login" page is displayed
      And fills the "password_field" inputtext with the "[CONTEXT:user.password]" text
      And I hide the keyboard
      And clicks on the "continue_button" button
      And the "Login Confirmation" page is displayed
      And clicks on the "confirm_button" button
     Then the "Contact Email Change In Contract Conditions" page is displayed
      And the "Email de contacto" header is displayed
      And the "description" textfield with "Necesitamos enviarte las condiciones de contratación por email antes de continuar con la contratación." text is displayed
      And the "more_information" link with "Así tratamos tus datos" text is displayed
      And the "email_save" button with "Continuar" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

    Examples:
          | prencondition                                             | initial_page                           | action_button | depends_on             | jira_id      |
          | has the "conexion_segura" service in "deactivated" status | Secure Connection Terms And Conditions | accept_button | QANOV-8658             | QANOV-164869 |
          | user has not the "any" data bundle purchased              | Bundle Details                         | manage_button | QANOV-9372:QANOV-77577 | QANOV-164870 |
          | has the "any" data bundle purchased                       | Replace Data Bundle                    | accept        | QANOV-9400:QANOV-9402  | QANOV-164871 |
          | has "data_sharing" service in "deactivated" status        | Activate Data Sharing                  | accept        | QANOV-26991            | QANOV-164872 |
