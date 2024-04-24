# -*- coding: utf-8 -*-
@jira.QANOV-3672
Feature: Access to Profile Webview Content

  Actions Before each Scenario:
    Given user is in the "Profile" page


  @jira.QANOV-205493 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.13.3 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-203801 @live @mobile @moves @next @regression
  Scenario: Moves user can access to 'Mis incidencias' option in Profile screen and check the header is right
    Given user has a "telco" account type
      And user has a "any_admin" role
     When clicks on the "my_tickets_entrypoint" entrypoint
     Then the internal webview with "Mis incidencias" header is displayed

  @jira.QANOV-205494 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.13.3 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-203801 @live @mobile @moves @next @regression
  Scenario: Moves user can access to 'Mis pedidos' option in Profile screen and check the header is right
    Given user has a "telco" account type
      And user has a "any_admin" role
     When clicks on the "my_orders_entrypoint" entrypoint
     Then the "My Orders" page is displayed
      And the "[LANG:profile.dashboard.my_information.my_orders]" header is displayed

  @jira.QANOV-205495 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.13.3 @jira.dv.Future
  @jira.link.detects.CHECKOUT-3528 @jira.link.parent_test_plan.QANOV-203801 @live @mobile @moves @next @regression
  Scenario: Moves user can access to the My Payment Methods webview from the entrypoints in the "Facturación" page and check the header is right
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Invoicing Profile" page
     When clicks on the "payment_methods_entrypoint" entrypoint
     Then the internal webview is displayed
      And the header that contains the "[LANG:profile.dashboard.invoicing.my_payment_methods]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

  @jira.<jira_id> @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.13.3 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-203801 @live @mobile @moves @next @regression
  Scenario Outline: Moves user can access to the <page_name> webview from the entrypoints in the "Facturación" page and check the header is right
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user is in the "Invoicing Profile" page
     When clicks on the "<option>" entrypoint
     Then the internal webview is displayed
      And the header that contains the "Área privada Movistar" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Invoicing Profile" page is displayed

    Examples:
          | option                     | page_name               | jira_id      |
          | billing_address_entrypoint | Dirección Facturación   | QANOV-205496 |
          | invoice_claim_entrypoint   | Reclamación de facturas | QANOV-205497 |
          | digital_invoice_entrypoint | Factura sin papel       | QANOV-205498 |

  @jira.<jira_id> @<mode> @android @cert0 @cert1 @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @live
  @mobile @next @o2uk @sanity
  Scenario Outline: A SIM-free O2uk user can access to the "Contact Preferences" webview from the entrypoints in Profile and check the header is right
    The webview opened should be https://accounts.o2.co.uk/consent
    other_affected_versions="2021-07"
    Given user has a "<account_type>" account type
      And user has "0" mobile lines
     When clicks on the "contact_preferences_entrypoint" entrypoint
     Then the internal webview with "Contact preferences" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | account_type | header_name                                                 | mode      | cv   | parent_test_plan        | jira_id     |
          | AO2 device   | [LANG:profile.dashboard.my_information.contact_preferences] | automatic | 13.1 | QANOV-77438:QANOV-35253 | QANOV-37515 |
          | device       | [LANG:profile.dashboard.my_information.contact_preferences] | automatic | 12.0 | QANOV-24141:QANOV-35253 | QANOV-37516 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-100486 @mobile @regression @vivobr
  Scenario Outline: <account_type> Vivo user can access to the <page_name> webview from the entrypoints in Profile and check the header is right
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has "<plans>" plans
     When clicks on the "<option>" entrypoint
      And waits until the "fatura" string in internal webview is displayed
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    @automatic @live @next
    Examples:
          | cv    | account_type | option                          | header_name                                              | page_name            | ber | plans | parent_test_plan | jira_id     |
          | 11.7  | beatrix      | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | Personal Information | ber | any   |                  | QANOV-5939  |
          | 11.13 | multivivo    | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | Personal Information |     | any   |                  | QANOV-22222 |

    @impeded_env @manual
    Examples:
          | cv   | account_type | option                          | header_name                                                 | page_name            | ber | plans   | parent_test_plan | jira_id      |
          | 13.5 | jeri         | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details]    | Personal Information | ber | several | QANOV-200803     | QANOV-204098 |
          | 13.5 | control_n    | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details]    | Personal Information | ber | several | QANOV-200803     | QANOV-204101 |

  @jira.QANOV-60003 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user logged by CPF can access to the Change Password webview from the entrypoints in Profile and check the header is right
    Given user has logged by "usr/pwd"
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And the "Security And Privacy" page is displayed
      And clicks on the "change_password_entrypoint" entrypoint
     Then the "Change Password" internal webview is displayed
      And the "[LANG:profile.dashboard.my_information.change_password.header]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Security And Privacy" page is displayed

  @jira.QANOV-500539 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @sanity
  @vivobr
  Scenario: Vivo user logged by usr/pwd can access to the Change Password webview from the entrypoints in Security And Privacy and check the header is right
    Given user has logged by "usr/pwd"
      And user is in the "Security And Privacy" page
     When clicks on the "change_password_entrypoint" entrypoint
     Then the "Change Password" internal webview is displayed
      And the "[LANG:profile.dashboard.my_information.change_password.header]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Security And Privacy" page is displayed

  @jira.<jira_id> @android @<ber> @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke @vivobr
  Scenario Outline: <account_type> Vivo users can access to the biometric entrypoint webview from the entrypoints in Profile and check the header is right
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
     When clicks on the "identity_confirmation" entrypoint
      And waits until the "IMPORTANTES" string in internal webview is displayed
     Then the "Identity Confirmation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Cancel Biometric Flow" popup is displayed
      And clicks on the "popup.accept" button
      And the "Profile" page is displayed

    @automatic @live @next @old_app
    Examples:
          | account_type | parent_test_plan | cv    | jira_id      | ber |
          | beatrix      | QANOV-132965     | 13.10 | QANOV-129650 | ber |
          | convergente  | QANOV-132965     | 13.10 | QANOV-129651 |     |
          | multivivo    | QANOV-132965     | 13.10 | QANOV-129652 |     |
          | legacy       | QANOV-228584     | 13.10 | QANOV-228589 | ber |

    @impeded_webview_env @manual @old_app
    Examples:
          | account_type | parent_test_plan | cv    | jira_id      | ber |
          | jeri         | QANOV-228584     | 13.10 | QANOV-228588 |     |
          | control_n    | QANOV-228584     | 13.10 | QANOV-228590 | ber |

    @manual
    Examples:
          | account_type | parent_test_plan | cv   | jira_id      | ber |
          | any          | QANOV-437387     | 24.3 | QANOV-453438 | ber |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.detects.VIVO-2873 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @regression @vivobr @har
  Scenario Outline: <account_type> Vivo users can see camera permission popup in the biometric entrypoint webview
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has not granted "camera" permission to the app
     When clicks on the "identity_confirmation" entrypoint
      And the "Identity Confirmation" internal webview is displayed
      And clicks on the "ok_continue" button
      And the "Identity Confirmation Take Picture" internal webview is displayed
     Then the "Camera Permissions Popup" popup is displayed

    Examples:
          | account_type | parent_test_plan | cv   | jira_id      |
          | any          | QANOV-437387     | 24.3 | QANOV-453439 |

    @old_app
    Examples:
          | account_type | parent_test_plan | cv     | jira_id      |
          | beatrix      | QANOV-132965     | 13.10  | QANOV-129653 |
          | convergente  | QANOV-132965     | 13.10  | QANOV-129654 |
          | multivivo    | QANOV-132965     | 13.10  | QANOV-129655 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  @vivobr
  Scenario Outline: <account_type> Vivo users cannot see camera permission popup in the biometric entrypoint webview
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has granted "camera" permission to the app
     When clicks on the "identity_confirmation" entrypoint
      And the "Identity Confirmation" internal webview is displayed
      And clicks on the "ok_continue" button
      And the "Identity Confirmation Take Picture" internal webview is displayed
     Then the "Camera Permissions Popup" popup is not displayed

    Examples:
          | account_type | parent_test_plan | cv   | jira_id      |
          | any          | QANOV-437387     | 24.3 | QANOV-453440 |

    @old_app
    Examples:
          | account_type | parent_test_plan | cv     | jira_id      |
          | beatrix      | QANOV-132965     | 13.10  | QANOV-129656 |
          | convergente  | QANOV-132965     | 13.10  | QANOV-129657 |
          | multivivo    | QANOV-132965     | 13.10  | QANOV-129658 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> Vivo users can see Identity Confirmation screen when taps on accept button in the Camera Permissions Popup
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has not granted "camera" permission to the app
     When clicks on the "identity_confirmation" entrypoint
      And the "Identity Confirmation" internal webview is displayed
      And clicks on the "ok_continue" button
      And the "Identity Confirmation Take Picture" internal webview is displayed
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Identity Confirmation Biometric" internal webview is displayed

    Examples:
          | account_type | parent_test_plan | cv   | jira_id      |
          | any          | QANOV-437387     | 24.3 | QANOV-453441 |

    @old_app
    Examples:
          | account_type | parent_test_plan | cv     | jira_id      |
          | beatrix      | QANOV-132965     | 13.10  | QANOV-129659 |
          | convergente  | QANOV-132965     | 13.10  | QANOV-129660 |
          | multivivo    | QANOV-132965     | 13.10  | QANOV-129661 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-537945 @manual @mobile @regression @vivobr
  Scenario Outline: <account_type> Vivo users can see Identity Confirmation screen when taps on cancel button in the Camera Permissions Popup
    Given user has a "<account_type>" account type
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has not granted "camera" permission to the app
     When clicks on the "identity_confirmation" entrypoint
      And the "Identity Confirmation" internal webview is displayed
      And clicks on the "ok_continue" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Identity Confirmation Take Picture" internal webview is displayed

    Examples:
          | account_type | parent_test_plan | cv   | jira_id      |
          | any          | QANOV-437387     | 24.3 | QANOV-453442 |

    @old_app
    Examples:
          | account_type | parent_test_plan | cv     | jira_id      |
          | beatrix      | QANOV-132965     | 13.10  | QANOV-129662 |
          | convergente  | QANOV-132965     | 13.10  | QANOV-129663 |
          | multivivo    | QANOV-132965     | 13.10  | QANOV-129664 |

  @jira.<jira_id> @android @automatic @ber @ios @jira.cv.12.0 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.parent_test_plan.QANOV-56585 @jira.link.parent_test_plan.QANOV-66163
  @live @mobile @next @regression @vivobr
  Scenario Outline: Vivo Convergente users can access to the <page_name> webview from the entrypoints in Profile and check the header is right
    Given user has a "convergente" account type
      And user has a "beatrix" mobile line
      And user has a "any" plan in "active" status
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | option                          | header_name                                              | page_name            | page    | detects   | jira_id     |
          | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | Personal Information | Profile | VIVO-2309 | QANOV-22225 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-360171 @manual @mobile @regression
  @vivobr
  Scenario Outline: Monoplan siebel users logged by CPF can access to the <option> webview from the entrypoints in Profile and check the header is right
    Given user has a "convergente" account type
      And user has "1" plans
      And user has a "siebel" plan
      And user has logged by "usr/pwd"
     When clicks on the "<option>" entrypoint
     Then the internal webview is displayed
      And the "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | option                          | header_name                                              | jira_id      |
          | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | QANOV-360368 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-360171 @manual @mobile @regression
  @vivobr
  Scenario Outline: Multiplan siebel without a beatrix plan associated users logged by CPF can access to the <option> webview from the entrypoints in Profile and check the header is right
    Given user has a "convergente" account type
      And user has "several" plans
      And user has a "siebel" plan
      And user does not have a "beatrix" mobile line
      And user has logged by "usr/pwd"
     When clicks on the "<option>" entrypoint
     Then the internal webview is displayed
      And the "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | option                          | header_name                                              | jira_id      |
          | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | QANOV-360370 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr
  Scenario Outline: Multiplan Vivo soft Convergente with a beatrix plan associated users logged by CPF can access to the <page_name> webview from the entrypoints in Profile and check the header is right
    Given user has a "convergente" account type
      And user has "several" plans
      And user has a "soft convergente" plan in "active" status
      And user has a "beatrix" mobile line
      And user has logged by "usr/pwd"
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | option                          | header_name                                              | page_name            | jira_id     |
          | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | Personal Information | QANOV-60007 |

  @jira.<jira_id> @android @automatic @ber @impeded_env @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @mobile
  @regression @vivobr
  Scenario Outline: Vivo Convergente users logged by OTP can access to the <page_name> webview from the entrypoints in Profile and check the header is right
    Given user has a "convergente" account type
      And user has a "full convergente" plan
      And user has a "any" plan in "active" status
      And user has logged by "otp"
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | option                          | header_name                                              | page_name            | jira_id     |
          | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | Personal Information | QANOV-22229 |

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile
  @regression @vivobr
  Scenario Outline: Vivo Dependent Convergente logged by CPF users can access to the <page_name> webview from the entrypoints in Profile and check the header is right
    Given user has "several" mobile lines
      And user has a "any" plan in "active" status
      And user has a "dependent" role
      And user has logged by "usr/pwd"
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | option                          | header_name                                              | page_name            | jira_id     |
          | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | Personal Information | QANOV-60012 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr
  Scenario Outline: Vivo Dependent Convergente users logged by OTP can access to the <page_name> webview from the entrypoints in Profile and check the header is right
    Given user has "several" mobile lines
      And user has a "any" plan in "active" status
      And user has a "dependent" role
      And user has logged by "otp"
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | option                          | header_name                                              | page_name            | jira_id     |
          | personal_information_entrypoint | [LANG:profile.dashboard.my_information.personal_details] | Personal Information | QANOV-60015 |

  @jira.<jira_id> @<priority> @<product> @android @deprecate_profile_moves @ios @jira.cv.<cv> @jira.dv.Future
  @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-100486 @mobile
  Scenario Outline: <account_type> <product> user can access to the "<page_name>" webview from the "Security And Privacy" screen
    All webviews opens in internal flow mode in Moves
    Moves Ask and Download page cannot only be checked with a real telco user
    Given user has a "<account_type>" account type
      And user has a "<role_type>" role
      And user is in the "Security And Privacy" page
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "<button>" button
      And the "Security And Privacy" page is displayed

    @automatic @cert2 @jira.link.detects.MOVES-5942
    @jira.link.parent_test_plan.QANOV-203801 @live @next
    Examples:
          | product | cv   | account_type | role_type | option                    | page_name        | header_name                | button                         | priority | jira_id      |
          | moves   | 13.3 | telco        | any_admin | contact_method_entrypoint | Recover password | Recuperación de contraseña | navigation_top_bar.back_button | sanity   | QANOV-205499 |

    @jira.link.parent_test_plan.QANOV-203801 @manual
    Examples:
          | product | cv   | account_type | role_type | option                          | page_name            | header_name                      | button                          | priority   | jira_id      |
          | moves   | 13.3 | telco        | any       | wifi_password_change_entrypoint | Change WiFi password | Configuración de router Movistar | navigation_top_bar.close_button | regression | QANOV-205500 |

    @impeded_legacy @jira.link.parent_test_plan.QANOV-203801 @no_automatable
    Examples:
          | product | cv   | account_type | role_type | option                          | page_name            | header_name                      | button                          | priority   | jira_id      |
          | moves   | 13.3 | legado       | any       | wifi_password_change_entrypoint | Change WiFi password | Configuración de router Movistar | navigation_top_bar.close_button | regression | QANOV-205502 |

  @jira.<jira_id> @<priority> @<product> @android @deprecate_profile_moves @ios @jira.dv.Future
  @jira.link.relates_to.NOV-100486
  Scenario Outline: <account_type> <product> user can access to the <page_name> webview from the entrypoints in Profile screen and check the header is right
    Given user has a "<account_type>" account type
      And user has a "<role_type>" role
      And user has a "tv" product
      And user is in the "Profile" page
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "<button>" button
      And the "Profile" page is displayed

    @automatic @cert2 @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-203801 @live
    @next @qa
    Examples:
          | product | account_type | role_type | option                               | page_name       | header_name           | button                         | priority | jira_id      |
          | moves   | telco        | admin     | movistarplus_email_change_entrypoint | Change M+ email | Área privada Movistar | navigation_top_bar.back_button | sanity   | QANOV-205501 |

    @impeded_legacy @jira.cv.13.4 @jira.link.parent_test_plan.QANOV-203801
    @no_automatable
    Examples:
          | product | account_type | role_type | option                               | page_name       | header_name          | button                          | priority   | jira_id      |
          | moves   | legado       | any       | movistarplus_email_change_entrypoint | Change M+ email | Comparte en WhatsApp | navigation_top_bar.close_button | regression | QANOV-205503 |

  @jira.<jira_id> @<priority> @android @deprecate_profile_moves @ios @jira.cv.13.3 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-203801 @mobile @moves
  Scenario Outline: A moves user with <account_type> account type and <role_type> role can access to the <page_name> webview from the entrypoints in Transparency Center screen and check the header is right
    Given user has a "<account_type>" account type
      And user has a "<role_type>" role
      And user is in the "Transparency Center" page
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "<button>" button
      And the "Transparency Center" page is displayed

    @automatic @cert2 @live @next
    Examples:
          | account_type | role_type | option                          | page_name             | header_name                                     | button                         | priority   | jira_id      |
          | telco        | any       | terms_and_conditions_entrypoint | Terms And Conditions  | [LANG:profile.terms_and_conditions.page_header] | navigation_top_bar.back_button | sanity     | QANOV-205504 |
          | telco        | any       | ask_and_download_entrypoint     | Ask And Download Data | Consulta y descarga de datos                    | navigation_top_bar.back_button | regression | QANOV-205508 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | role_type | option                          | page_name            | header_name                                     | button                         | priority   | jira_id      |
          | legado       | any       | terms_and_conditions_entrypoint | Terms And Conditions | [LANG:profile.terms_and_conditions.page_header] | navigation_top_bar.back_button | regression | QANOV-205505 |

  @jira.<jira_id> @<priority> @android @deprecate_profile_moves @ios @jira.cv.14.4 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-203801 @mobile
  Scenario Outline: A moves user with <account_type> account type can access to the <page_name> webview from the entrypoints in Privacy Preferences screen and check the header is right
    Given user has a "<account_type>" account type
      And user has a "any" role
      And user is in the "Privacy Preferences" page
     When clicks on the "<option>" entrypoint
     Then the internal webview with "Preferencias de privacidad" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Privacy Preferences" page is displayed

    @automatic @cert2 @live @next
    Examples:
          | account_type | option                                  | page_name                    | priority   | jira_id      |
          | telco        | privacy_preferences_movistar_entrypoint | Movistar Privacy Preferences | smoke      | QANOV-205506 |
          | telco        | others_privacy_preferences_entrypoint   | Other Privacy Preferences    | regression | QANOV-367867 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | option                                  | page_name                    | priority   | jira_id      |
          | legado       | privacy_preferences_movistar_entrypoint | Movistar Privacy Preferences | regression | QANOV-205507 |
          | legado       | others_privacy_preferences_entrypoint   | Other Privacy Preferences    | regression | QANOV-367868 |

  @jira.<jira_id> @<ber> @<priority> @android @automatic @cert0 @cert1 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-100486
  @live @mobile @next @o2uk
  Scenario Outline: A <account_type> MyO2 user with msisdn products can access to the <page_name> internal webview from the entrypoints in Security And Privacy screen and check the header is right
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user is in the "Security And Privacy" page
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

    Examples:
          | account_type | option                            | header_name                                          | priority   | page_name              | ber | jira_id     |
          | any          | terms_and_conditions_entrypoint   | [LANG:profile.terms_and_conditions.page_header]      | sanity     | Terms And Conditions   | ber | QANOV-5992  |
          | any          | delete_account_entrypoint         | [LANG:profile.delete_account.page_header]            | smoke      | Delete Account         | ber | QANOV-5994  |
          | legacy       | forgotten_sign_details_entrypoint | [LANG:profile.forgotten_sign_in_details.page_header] | regression | Forgotten Sing Details |     | QANOV-6016  |
          | AO2          | forgotten_sign_details_entrypoint | [LANG:profile.forgotten_sign_in_details.page_header] | regression | Forgotten Sing Details | ber | QANOV-12507 |

  @jira.<jira_id> @<ber> @<priority> @android @automatic @cert0 @cert1 @ios @jira.cv.11.7 @jira.link.relates_to.NOV-100486
  @live @mobile @next @o2uk
  Scenario Outline: A <account_type> MyO2 user with msisdn products can access to the <page_name> browser webview from the entrypoints in Security And Privacy screen and check the header is right
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has "<lines>" mobile lines
      And user is in the "Security And Privacy" page
     When clicks on the "<option>" entrypoint
     Then the browser webview with "<header_name>" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

    Examples:
          | account_type   | lines | option                              | header_name                                                      | priority   | ber | page_name                | jira_id     |
          | legacy         | any   | change_security_question_entrypoint | [LANG:profile.change_security_question.page_header]              | regression |     | Change Security Question | QANOV-6013  |
          | legacy postpay | 1     | age_verification_entrypoint         | [LANG:profile.security_and_privacy.age_verification.page_header] | regression |     | Age Verification         | QANOV-26141 |
          | AO2            | any   | change_security_question_entrypoint | [LANG:profile.change_security_question.page_header]              | regression | ber | Change Security Question | QANOV-12506 |

  @jira.QANOV-67139 @android @automatic @cert0 @cert1 @cv.10.3 @ios @jira.link.is_tested_in.QANOV-24141
  @jira.link.relates_to.NOV-47211 @live @next @o2uk @regression
  Scenario: A multiMSISDN legacy user can access to the Age Verification browser webview from the entrypoints in Security And Privacy screen after selecting a mobile line
    other_affected_versions="2021-15"
    Given user has "several" mobile lines
      And user has a "legacy postpay" account type
      And user is in the "Security And Privacy" page
     When clicks on the "age_verification_entrypoint" entrypoint
      And the "Line Disambiguation" page is displayed
      And clicks on the "chevron" field of "lines.list" list with "any" index
     Then the browser webview with "[LANG:profile.security_and_privacy.age_verification.page_header]" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.<jira_id> @<ber> @android @automatic @cert0 @cert1 @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-178803
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-35253 @jira.link.parent_test_plan.QANOV-77438
  @mobile @next @o2uk @regression
  Scenario Outline: A MyO2 user without msisdn products can access to the <page_name> internal webview from the entrypoints in Security And Privacy screen and check the header is right
    other_affected_versions="2021-07, 2022-23"
    Given user has a "device" account type
      And user has "0" mobile lines
      And user is in the "Security And Privacy" page
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

    Examples:
          | option                          | page_name            | header_name                                     | ber | jira_id     |
          | terms_and_conditions_entrypoint | Terms And Conditions | [LANG:profile.terms_and_conditions.page_header] |     | QANOV-37519 |
          | delete_account_entrypoint       | Delete Account       | [LANG:profile.delete_account.page_header]       | ber | QANOV-37520 |

  @jira.QANOV-37521 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-35253 @manual @mobile @o2uk @regression
  Scenario: A MyO2 user without msisdn products can access to the Forgotten Sign Details webview from the entrypoints in Security And Privacy screen and check the header is right
    other_affected_versions="2021-07"
    Given user has a "legacy device" account type
      And user does not have a "mobile_line" product
      And user is in the "Security And Privacy" page
     When clicks on the "forgotten_sign_details_entrypoint" entrypoint
     Then the "Forgotten Sign Details" page is displayed
      And the "[LANG:profile.forgotten_sign_in_details.page_header]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Security And Privacy" page is displayed

  @jira.QANOV-37522 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.13.1 @jira.link.parent_test_plan.QANOV-178803
  @jira.link.parent_test_plan.QANOV-35253 @jira.link.parent_test_plan.QANOV-77438 @mobile @o2uk @regression
  Scenario: A user with a SIM-free product can access to all options in Security And Privacy screen and check the header is right
    other_affected_versions="2021-07, 2022-23"
    Given user has a "AO2 device" account type
      And user does not have "mobile_line" product
      And user is in the "Security And Privacy" page
     When clicks on the "forgotten_sign_details_entrypoint" entrypoint
     Then the "Forgotten Sign Details" internal webview is displayed
      And the "Forgotten sign in details" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.<jira_id> @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.12.1 @jira.dv.Future
  @jira.link.detects.IOS-7406 @jira.link.parent_test_plan.QANOV-56957 @live @mobile @moves @next @regression
  Scenario Outline: TELCO user can access to the <page_name> webview from the entrypoint in the Personal Data screen
    internal_checkpoint="All webviews openend in internal flow mode"
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user is in the "Personal Data" page
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed

    Examples:
          | option                   | header_name                                          | page_name     | jira_id     |
          | email_address_entrypoint | [LANG:profile.dashboard.personal_data.email_address] | Contact Email | QANOV-59910 |
          | phone_number_entrypoint  | [LANG:profile.dashboard.personal_data.phone_number]  | Contact Phone | QANOV-59911 |

  @jira.QANOV-205509 @android @cert2 @deprecate_profile_moves @ios @jira.cv.13.3 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-203801 @live @manual @mobile @moves @next @regression
  Scenario: Moves user can access to 'Identificación personal en tiendas' option in Profile screen and check the header is right
    Given user has a "any" account type
      And user has a "any_admin" role
      And user is in the "Personal Data" page
     When clicks on the "shop_identifier_entrypoint" entrypoint
     Then the "Shop Identifier" page is displayed
      And the "[LANG:profile.dashboard.personal_data.shop_identifier]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-215691 @manual @mobile @smoke @vivobr
  @old_app
  Scenario Outline: <account_type> Vivo user logged by CPF can access to the Token webview from the entrypoints in Profile and check the header is right
    Given user has a "<account_type>" account type
     When clicks on the "token_entrypoint" entrypoint
     Then the internal webview with "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | account_type | jira_id      |
          | legacy       | QANOV-223465 |
          | convergente  | QANOV-223467 |
          | beatrix      | QANOV-223468 |
          | multivivo    | QANOV-223469 |
          | jeri         | QANOV-223471 |
          | control_n    | QANOV-223472 |

  @jira.QANOV-244206 @android @automatic @ber @blaude @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-217358
  @jira.link.detects.O2DE-2785 @jira.link.parent_test_plan.QANOV-402198 @jira.link.relates_to.NOV-100486 @live @mobile
  @next @raitt_drop1 @sanity
  Scenario: A BOX7 blaude user can access to the "Consents" webview from the "Security And Privacy" screen
    Given user has a "box7" account type
      And user has a "any" product in "active" status
      And user is in the "Security And Privacy" page
     When clicks on the "consent_management_data_processing_entrypoint" entrypoint
     Then the browser webview with "Einwilligungen und Erlaubnisse" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.QANOV-244208 @android @automatic @ber @ios @jira.cv.14.3 @jira.link.depends_on.QANOV-217359
  @jira.link.detects.O2DE-3057 @jira.link.relates_to.NOV-100486 @live @mobile @next @o2de @sanity
  Scenario: A o2de user can access to the "Consents" webview from the "Security And Privacy" screen
    Given user has a "any" product in "active" status
      And user is in the "Security And Privacy" page
     When clicks on the "consent_management_data_processing_entrypoint" entrypoint
     Then the internal webview with "Einwilligungen und Erlaubnisse" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.QANOV-420237 @android @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-217358
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @sanity
  Scenario: A RAITT blaude user can access to the "Consents" webview from the "Security And Privacy" screen
    OB webview: prod-raitt-b2c-blau-coms-novum-raitt
    Given user has a "raitt" account type
      And user has a "any" product in "active" status
      And user is in the "Security And Privacy" page
     When clicks on the "consent_management_data_processing_entrypoint" entrypoint
     Then the browser webview with "Einwilligungen & Erlaubnisse" text in the header is displayed
      And the "TBD" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.<jira_id> @<ber> @<product> @<test_priority> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @mobile
  Scenario Outline: A BOX7 <product> user can open the "<document>" document from the "Legal Documents" screen on Android devices
    For automate the scenario
    Given user has a "box7" account type
      And user has installed the "Google Drive" app
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
      And user is in the "Legal Documents" page
     When clicks on the "<entrypoint>" entrypoint
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Legal Documents" page is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | document           | entrypoint                              | test_priority | ber | depends_on   | detects    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | Terms & Conditions | terms_and_conditions_entrypoint.chevron | smoke         | ber | QANOV-217360 | OBO2DE-410 |                  | QANOV-230359 |

    @manual @raitt_drop1
    Examples:
          | product | cv   | document                  | entrypoint                           | test_priority | ber | depends_on   | detects    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | Price lists               | price_lists_entrypoint               | regression    |     | QANOV-217360 |            |                  | QANOV-230362 |
          | blaude  | 13.9 | Declaration of revocation | declaration_of_revocation_entrypoint | regression    |     | QANOV-217360 | OBO2DE-145 |                  | QANOV-230361 |
          | blaude  | 13.9 | Service descriptions      | service_descriptions_entrypoint      | regression    |     | QANOV-217360 |            |                  | QANOV-230360 |

    @automatic @live @next
    Examples:
          | product | cv   | document           | entrypoint                      | test_priority | ber | depends_on   | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | Terms & Conditions | terms_and_conditions_entrypoint | smoke         | ber | QANOV-217361 |         | QANOV-437471     | QANOV-230364 |

    @manual
    Examples:
          | product | cv   | document                  | entrypoint                           | test_priority | ber | depends_on   | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | Price lists               | price_lists_entrypoint               | regression    |     | QANOV-217361 |         | QANOV-437471     | QANOV-230367 |
          | o2de    | 14.2 | Declaration of revocation | declaration_of_revocation_entrypoint | regression    |     | QANOV-217361 |         | QANOV-437471     | QANOV-230366 |
          | o2de    | 14.2 | Service descriptions      | service_descriptions_entrypoint      | regression    |     | QANOV-217361 |         | QANOV-437471     | QANOV-230365 |

  @jira.<jira_id> @<ber> @<product> @<test_priority> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @mobile
  Scenario Outline: A BOX7 <product> user can open the "<document>" document from the "Legal Documents" screen on iOS devices
    Given user has a "box7" account type
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
      And user is in the "Legal Documents" page
     When clicks on the "<entrypoint>" entrypoint
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Legal Documents" page is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | document           | entrypoint                              | test_priority | ber | depends_on                                          | detects    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | Terms & Conditions | terms_and_conditions_entrypoint.chevron | smoke         | ber | QANOV-217360:QANOV-318883:QANOV-310986:QANOV-318885 | OBO2DE-410 |                  | QANOV-311043 |

    @manual @raitt_drop1
    Examples:
          | product | cv   | document                  | entrypoint                           | test_priority | ber | depends_on                                          | detects    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | Price lists               | price_lists_entrypoint               | regression    |     | QANOV-217360:QANOV-318883:QANOV-310986:QANOV-318885 |            |                  | QANOV-311044 |
          | blaude  | 13.9 | Declaration of revocation | declaration_of_revocation_entrypoint | regression    |     | QANOV-217360:QANOV-318883:QANOV-310986:QANOV-318885 | OBO2DE-146 |                  | QANOV-311045 |
          | blaude  | 13.9 | Service descriptions      | service_descriptions_entrypoint      | regression    |     | QANOV-217360:QANOV-318883:QANOV-310986:QANOV-318885 |            |                  | QANOV-478866 |

    @automatic @live @next
    Examples:
          | product | cv   | document           | entrypoint                      | test_priority | ber | depends_on                                          | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | Terms & Conditions | terms_and_conditions_entrypoint | smoke         | ber | QANOV-217361:QANOV-318884:QANOV-310989:QANOV-318886 |         | QANOV-437471     | QANOV-311046 |

    @manual
    Examples:
          | product | cv   | document                  | entrypoint                           | test_priority | ber | depends_on                                          | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | Price lists               | price_lists_entrypoint               | regression    |     | QANOV-217361:QANOV-318884:QANOV-310989:QANOV-318886 |         | QANOV-437471     | QANOV-311047 |
          | o2de    | 14.2 | Declaration of revocation | declaration_of_revocation_entrypoint | regression    |     | QANOV-217361:QANOV-318884:QANOV-310989:QANOV-318886 |         | QANOV-437471     | QANOV-311048 |
          | o2de    | 14.2 | Service descriptions      | service_descriptions_entrypoint      | regression    |     | QANOV-217361:QANOV-318884:QANOV-310989:QANOV-318886 |         | QANOV-437471     | QANOV-478867 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A <stack> <product> user can access to the "<webview>" webview from the "Legal Documents" screen
    Given user has a "<stack>" account type
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
      And user is in the "Legal Documents" page
     When clicks on the "<entrypoint>" entrypoint
     Then the browser webview with "<header>" text in the header is displayed
      And the "Vorvertragliche Informationen" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Legal Documents" page is displayed
      And the "Rechtliche Dokumente" header is displayed

    @raitt_drop1
    Examples:
          | product | stack | cv   | webview                   | entrypoint                              | header                                              | string                              | depends_on   | parent_test_plan | jira_id      |
          | blaude  | box7  | 13.9 | Product information sheet | product_information_sheet_entrypoint    | Aktuelle Produktinformationsblätter auf einen Blick | Aktuelle Produktinformationsblätter | QANOV-217360 |                  | QANOV-230363 |
          | blaude  | raitt | 13.9 | Product information sheet | product_information_sheet_entrypoint    | Postfach                                            | Vorvertragliche Informationen       | QANOV-217360 |                  | QANOV-478861 |
          | blaude  | raitt | 13.9 | Service descriptions      | service_descriptions_entrypoint         | Postfach                                            | Vorvertragliche Informationen       | QANOV-217360 |                  | QANOV-478862 |
          | blaude  | raitt | 13.9 | Terms & Conditions        | terms_and_conditions_entrypoint.chevron | Postfach                                            | Vorvertragliche Informationen       | QANOV-217360 |                  | QANOV-478863 |
          | blaude  | raitt | 13.9 | Price lists               | price_lists_entrypoint                  | Postfach                                            | Vorvertragliche Informationen       | QANOV-217360 |                  | QANOV-478864 |
          | blaude  | raitt | 13.9 | Declaration of revocation | declaration_of_revocation_entrypoint    | Postfach                                            | Vorvertragliche Informationen       | QANOV-217360 |                  | QANOV-478865 |

    Examples:
          | product | stack | cv   | webview                   | entrypoint                           | header                     | string                      | depends_on   | parent_test_plan | jira_id      |
          | o2de    | box7  | 14.2 | Product information sheet | product_information_sheet_entrypoint | Produktinformationsblätter | Produktinformationsblättern | QANOV-217361 | QANOV-437471     | QANOV-230368 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A BOX7 <product> prepay user with history purchase can access to the "Term of contract" screen from the "Legal Documents" screen
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has a history purchase
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
      And user has the "Term Of Contract" module configured in CMS for "Term Of Contract" page
      And user is in the "Legal Documents" page
     When clicks on the "term_of_contract_entrypoint" entrypoint
     Then the "Term Of Contract" page is displayed
      And the "Deine Vertragsunterlagen" header is displayed
      And the "title" textfield with "Historie Vertragsunterlagen" text is displayed
      And the "description" textfield with "Hier findest du die gesetzlichen Pflichtinformationen der letzten 12 Monate." text is displayed
      And the "purchase_history_list" list is displayed
      And each element in the "purchase_history_list" list has the "date" textfield with the "\d{2}. (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format
      And each element in the "purchase_history_list" list has the "name" field
      And each element in the "purchase_history_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Legal Documents" page is displayed
      And the "Rechtliche Dokumente" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                | parent_test_plan | jira_id      |
          | blaude  | 14.1 | QANOV-318883:QANOV-318885 | QANOV-402198     | QANOV-319000 |

    Examples:
          | product | cv   | depends_on                | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-318884:QANOV-318886 |                  | QANOV-319001 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A BOX7 <product> prepay user with no history purchase can access to the "Term of contract" screen from the "Legal Documents" screen
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has no history purchase
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
      And user has the "Term Of Contract" module configured in CMS for "Term Of Contract" page
      And user is in the "Legal Documents" page
     When clicks on the "term_of_contract_entrypoint" entrypoint
     Then the "Term Of Contract" page is displayed
      And the "Deine Vertragsunterlagen" header is displayed
      And the "title" textfield with "Historie Vertragsunterlagen" text is displayed
      And the "description" textfield with "Hier findest du die gesetzlichen Pflichtinformationen der letzten 12 Monate." text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Legal Documents" page is displayed
      And the "Rechtliche Dokumente" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                | parent_test_plan | jira_id      |
          | blaude  | 14.1 | QANOV-318883:QANOV-318885 | QANOV-402198     | QANOV-521807 |

    Examples:
          | product | cv   | depends_on                | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-318884:QANOV-318886 |                  | QANOV-521808 |

  @jira.QANOV-420238 @TBD @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-318883
  @jira.link.depends_on.QANOV-318885 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @smoke
  Scenario: A RAITT blaude prepay user can access to the "Term of contract" OB webview from the "Legal Documents" screen
    OB webview: prod-raitt-b2c-blau-eecc-postbox
    Given user has a "raitt" account type
      And user has a "prepay" account type
      And user has the "Legal Documents" module configured in CMS for "Legal Documents" page
      And user is in the "Legal Documents" page
     When clicks on the "term_of_contract_entrypoint" entrypoint
     Then the browser webview with "Postfach" text in the header is displayed
      And the "Vorvertragliche Informationen" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Legal Documents" page is displayed
      And the "Rechtliche Dokumente" header is displayed

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 <product> prepay user taps on a "Term of contract" document with only a PDF inside: the document is opened in android devices
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has a history purchase
      And user has installed the "Google Drive" app
      And user has the "Term Of Contract" module configured in CMS for "Term Of Contract" page
      And user is in the "Term Of Contract" page
     When clicks on any element in the "purchase_history_list" list that has "1" pdf inside
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Term Of Contract" page is displayed
      And the "Deine Vertragsunterlagen" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.1 | QANOV-319000 | QANOV-319002 |

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-319001 | QANOV-319003 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 <product> prepay user taps on a "Term of contract" document with only a PDF inside: the document is opened in iOS devices
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has a history purchase
      And user has the "Term Of Contract" module configured in CMS for "Term Of Contract" page
      And user is in the "Term Of Contract" page
     When clicks on any element in the "purchase_history_list" list that has "1" pdf inside
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Term Of Contract" page is displayed
      And the "Deine Vertragsunterlagen" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.1 | QANOV-319000 | QANOV-319004 |

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-319001 | QANOV-319005 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 <product> prepay user taps on a "Term of contract" document with several PDF inside: the "Select one document" screen is displayed
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has a history purchase
      And user has the "Term Of Contract" module configured in CMS for "Term Of Contract" page
      And user has the "Select One Document" module configured in CMS for "Select One Document" page
      And user is in the "Term Of Contract" page
     When clicks on any element in the "purchase_history_list" list that has "several" pdf inside
     Then the "Select One Document" page is displayed
      And the "Deine Vertragsunterlagen" header is displayed
      And the "title" textfield with "Select one document" text is displayed
      And the "description" textfield with "Your selected document have more than one, select which one you want to open:" text is displayed
      And the "document_title" textfield with "[CONTEXT:selected_document]" text is displayed
      And the "document_list" list is displayed
      And each element in the "document_list" list has the "name" field
      And each element in the "document_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Term Of Contract" page is displayed
      And the "Deine Vertragsunterlagen" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.1 | QANOV-319000 | QANOV-319006 |
          | o2de    | 14.2 | QANOV-319001 | QANOV-319007 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 <product> prepay user selects a PDF in the "Select one document" screen: the document is opened in Android devices
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has installed the "Google Drive" app
      And user has the "Term Of Contract" module configured in CMS for "Term Of Contract" page
      And user has the "Select One Document" module configured in CMS for "Select One Document" page
      And user is in the "Term Of Contract" page
     When clicks on any element in the "past_purchase_list" list that has "several" pdf inside
      And the "Select One Document" page is displayed
      And clicks on any element in the "document_list" list
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Select One Document" page is displayed
      And the "Deine Vertragsunterlagen" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.1 | QANOV-319006 | QANOV-319008 |
          | o2de    | 14.2 | QANOV-319007 | QANOV-319009 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 <product> prepay user selects a PDF in the "Select one document" screen: the document is opened in iOS devices
    Given user has a "box7" account type
      And user has a "prepay" account type
      And user has the "Term Of Contract" module configured in CMS for "Term Of Contract" page
      And user has the "Select One Document" module configured in CMS for "Select One Document" page
      And user is in the "Term Of Contract" page
     When clicks on any element in the "past_purchase_list" list that has "several" pdf inside
      And the "Select One Document" page is displayed
      And clicks on any element in the "document_list" list
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Select One Document" page is displayed
      And the "Deine Vertragsunterlagen" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.1 | QANOV-319006 | QANOV-319010 |
          | o2de    | 14.2 | QANOV-319007 | QANOV-319011 |

  @jira.<jira_id> @<ber> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile
  Scenario Outline: A <product> user can access to the "<screen>" webview from the "Profile" screen
    Given user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user is in the "Profile" page
     When clicks on the "<entrypoint>" entrypoint
     Then the browser webview with "<header>" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed
      And the "Profil" header is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | screen          | entrypoint                 | header                                           | test_priority | ber | depends_on                                                                    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | Data Protection | data_protection_entrypoint | [LANG:profile.dashboard.support.data_protection] | smoke         | ber | QANOV-217320:QANOV-217321:QANOV-240222:QANOV-386057:QANOV-386059:QANOV-386061 |                  | QANOV-244209 |

    @manual @raitt_drop1
    Examples:
          | product | cv   | screen  | entrypoint         | header             | test_priority | ber | depends_on                                                                    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | Imprint | imprint_entrypoint | Impressum von Blau | regression    |     | QANOV-217320:QANOV-217321:QANOV-240222:QANOV-386057:QANOV-386059:QANOV-386061 |                  | QANOV-244210 |

  @jira.<jira_id> @<ber> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile
  Scenario Outline: A <product> user can access to the "<screen>" webview from the "Profile" screen
    Given user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user is in the "Profile" page
     When clicks on the "<entrypoint>" entrypoint
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed
      And the "Profil" header is displayed

    @automatic @live @next
    Examples:
          | product | cv   | screen          | entrypoint                 | header                           | test_priority | ber | depends_on                                                                    | parent_test_plan | jira_id      |
          | o2de    | 14.2 | Data Protection | data_protection_entrypoint | Datenschutzerklärung Mein o2 App | smoke         | ber | QANOV-259695:QANOV-259696:QANOV-240223:QANOV-386058:QANOV-386060:QANOV-386062 | QANOV-437471     | QANOV-244211 |

    @manual
    Examples:
          | product | cv   | screen  | entrypoint         | header    | test_priority | ber | depends_on                                                                    | parent_test_plan | jira_id      |
          | o2de    | 14.2 | Imprint | imprint_entrypoint | Impressum | regression    |     | QANOV-259695:QANOV-259696:QANOV-240223:QANOV-386058:QANOV-386060:QANOV-386062 | QANOV-437471     | QANOV-244212 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A <product> user can access to the "Cookies Management" webview from the "Profile" screen
    Given user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user is in the "Profile" page
     When clicks on the "cookies_management_entrypoint" entrypoint
     Then the "Cookies Management" popup is displayed
      And clicks on the "refuse_button" button
      And the "Profile" page is displayed
      And the "Profil" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on                                                                    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | QANOV-217320:QANOV-217321:QANOV-240222:QANOV-386057:QANOV-386059:QANOV-386061 |                  | QANOV-243164 |

    Examples:
          | product | cv   | depends_on                                                                    | parent_test_plan | jira_id      |
          | o2de    | 14.2 | QANOV-259695:QANOV-259696:QANOV-240223:QANOV-386058:QANOV-386060:QANOV-386062 | QANOV-437471     | QANOV-243165 |

  @jira.QANOV-244213 @android @automatic @ber @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-217356
  @jira.link.detects.O2DE-2805 @jira.link.detects.OBO2DE-408 @live @mobile @next @raitt_drop1 @smoke
  Scenario: A bluade postpay user can access to the "Contract owner" webview from the "My Contracts" screen
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user is in the "My Contracts" page
     When clicks on the "change_contract_owner_entrypoint" entrypoint
     Then the external webview is displayed
      And the "Vertragsinhaberwechsel" string is displayed
      And clicks on the native "back" button
      And the "My Contracts" page is displayed

  @jira.QANOV-244214 @android @automatic @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312322
  @jira.link.depends_on.QANOV-376011 @jira.link.detects.O2DE-2922 @jira.link.detects.O2DE-3106
  @jira.link.parent_test_plan.QANOV-437471 @live @mobile @next @o2de @smoke
  Scenario: A o2de postpay user can access to the "Contract owner" webview from the "My Contracts" screen
    Given user has a "postpay" account type
      And user has a "any" product in "active" status
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user is in the "My Contracts" page
     When clicks on the "change_contract_owner_entrypoint" entrypoint
     Then the internal webview with "Mein o2" header is displayed
      And the "Vertragsinhaberwechsel" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @jira.link.parent_test_plan.<parent_test_plan> @live @mobile @next @smoke
  Scenario Outline: A BOX7 user can access to the "Manage my login" webview from the "Personal Data" screen
    For Blau:
    - PREPAID: prod-b2c-blau-manage-login-prepaid
    - POSTPAID: prod-b2c-blau-manage-login
    Given user has a "box7" account type
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user is in the "Personal Data" page
     When clicks on the "change_login_credentials_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "<string>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Data" page is displayed
      And the "Meine Daten" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | string          | depends_on   | parent_test_plan | detects              | jira_id      |
          | blaude  | 13.9 | Kennwort ändern | QANOV-217322 | QANOV-402198     | OBO2DE-402:O2DE-2806 | QANOV-228057 |

    Examples:
          | product | cv   | string          | depends_on   | parent_test_plan | detects   | jira_id      |
          | o2de    | 14.2 | Login verwalten | QANOV-217323 |                  | O2DE-4263 | QANOV-228061 |

  @jira.QANOV-420239 @android @ber @blaude @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-416190
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop1 @smoke
  Scenario: A RAITT user can access to the "Change password" webview from the "Personal Data" screen
    OB webview: prod-raitt-b2c-blau-change-password
    Given user has a "raitt" account type
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user is in the "Personal Data" page
     When clicks on the "change_password_entrypoint" entrypoint
     Then the browser webview with "Change Password" text in the header is displayed
      And the "Kennwort ändern" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Data" page is displayed
      And the "Meine Daten" header is displayed

  @jira.QANOV-324731 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-132965 @manual @mobile @sanity @vivobr
  Scenario: Vivo users monoplan can see close biometric flow popup in the biometric entrypoint webview
    Given user has any "convergente;multivivo;legacy;beatrix;control_n;jeri" account types
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has granted "camera" permission to the app
     When clicks on the "identity_confirmation" entrypoint
      And the "Identity Confirmation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Cancel Biometric Flow" popup is displayed
      And the "popup.text" textfield with "Quer sair da biometria? Você ainda não terminou de confirmar sua identidade e suas informações ainda não estão salvas" text is displayed
      And the "popup.accept" button with "SAIR" text is displayed
      And the "popup.cancel" button with "VOLTAR" text is displayed
      And the "Identity Confirmation" internal webview is displayed

  @jira.QANOV-324732 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-132965 @manual @mobile @regression
  @vivobr
  Scenario: Vivo users monoplan can see Profile screen when taps on accept button in the Cancel Biometric Flow Popup
    Given user has any "convergente;multivivo;legacy;beatrix;control_n;jeri " account types
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has granted "camera" permission to the app
     When clicks on the "identity_confirmation" entrypoint
      And the "Identity Confirmation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Cancel Biometric Flow" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Profile" page is displayed

  @jira.QANOV-324733 @android @ios @jira.cv.13.10 @jira.link.parent_test_plan.QANOV-132965 @manual @mobile @regression
  @vivobr
  Scenario: Vivo users monoplan can see Identity Confirmation screen when taps on cancel button in the Cancel Biometric Flow Popup
    Given user has any "convergente;multivivo;legacy;beatrix;control_n;jeri" account types
      And user has a "any" plan in "active" status
      And user has a "admin" role
      And user has granted "camera" permission to the app
     When clicks on the "identity_confirmation" entrypoint
      And the "Identity Confirmation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Cancel Biometric Flow" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Identity Confirmation" internal webview is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario Outline: User can access to the <page_name> webview from the entrypoint in the Personal Data screen
    Given user is in the "Personal Data" page
     When clicks on the "<option>" entrypoint
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed

    Examples:
          | option                   | header_name              | page_name     | jira_id      |
          | email_address_entrypoint | Direción de email        | Contact Email | QANOV-410712 |
          | phone_number_entrypoint  | Añadir móvil de contacto | Contact Phone | QANOV-410713 |

  @jira.QANOV-410714 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Admin user can access to the Bank Account webview from the entrypoint in the Personal Data screen
    Given user has a "admin" role
      And user is in the "Personal Data" page
     When clicks on the "bank_account" entrypoint
     Then the internal webview with "Cuenta bancaria" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed

  @jira.QANOV-410715 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: Admin light user can not access to the Bank Account webview from the entrypoint in the Personal Data screen: Login escalation screen is displayed
    Given user has a "admin-light" role
      And user is in the "Personal Data" page
     When clicks on the "bank_account" entrypoint
     Then the "Login Escalation Required" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-410716 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Admin user can access to the Change Password webview from the entrypoint in Profile screen
    Given user has a "admin" role
     When clicks on the "change_password" entrypoint
     Then the internal webview with "Cambiar contraseña" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed

  @jira.QANOV-410717 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: Admin light user can not access to the Change Password webview from the entrypoint in Profile screen: Login escalation screen is displayed
    Given user has a "admin-light" role
     When clicks on the "change_password" entrypoint
     Then the "Login Escalation Required" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-410718 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User can access to 'Mis pedidos' option in Profile screen
     When clicks on the "my_orders_entrypoint" entrypoint
     Then the "My Orders" page is displayed
      And the "Pedidos" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-556376 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @sanity
  Scenario: A moves admin user can access to the "consulta y descarga de datos" webview from the entrypoints in Privacy Management
    Given user has a "admin" role
      And user is in the "Privacy Preferences" page
     When clicks on the "data_download_entrypoint" entrypoint
     Then the internal webview with "Consulta y descarga de datos" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Privacy Preferences" page is displayed

  @jira.QANOV-358963 @android @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-309088
  @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves @smoke
  Scenario: User can access to the "Otras preferencias de privacidad" internal webview
    Given user is in the "Privacy Preferences" page
     When clicks on the "third_party_consents_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Preferencias de privacidad" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Privacy Preferences" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @live @manual @mobile @next @sanity
  Scenario Outline: User with any active product can access to the "Transparency Center" screen
    Given user has a "any" account type
      And And user is in the "Security And Privacy" page
     When clicks on the "transparency_center_entrypoint" entrypoint
     Then the internal webview with "Datenschutz-Einstellungen" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-558967 |
          | o2de    | QANOV-558968 |

  @jira.QANOV-578762 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @smoke
  Scenario: Moves admin user with landline product can access the tokens entrypoint
    Given user has a "admin" role
      And user has a "landline" product
     When clicks on the "tokens_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "tokens" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-578763 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @smoke @tbd
  Scenario: Moves admin user can access the advanced verification entrypoint
    Given user has a "admin" role
     When clicks on the "advanced_verification_entrypoint" entrypoint
     Then the "tbd" string is displayed

  @jira.QANOV-578764 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @smoke
  Scenario: Moves user with 1 tv can access the movistar plus entrypoint
    Given user has a "admin" role
      And user has "1" products of "tv" type
     When clicks on the "movistar_plus_entrypoint" entrypoint
     Then the browser webview is displayed
      And the "Usuario" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed

  @jira.QANOV-578765 @android @e2e @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression @tbd
  Scenario: Moves user with >1 tv can access the movistar plus entrypoint
    Given user has a "admin" role
      And user has ">1" products of "tv" type
     When clicks on the "movistar_plus_entrypoint" entrypoint
     Then the "TV Disambiguation" page is displayed
