# -*- coding: utf-8 -*-
@jira.QANOV-2425
Feature: Dashboard


  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-21949
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-63964 @jira.link.relates_to.NOV-91949 @live @mobile
  @next @qa @vivobr @old_app
  Scenario Outline: Beatrix user can see all modules in Account tab associated to their mobile line
    internal_checkpoint="A 'my_apps' module can also be displayed if the user has apps associated to the tariff"
    User in QA: qavivo-02
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "consumption-counters-mobile" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "mobile_allowances.list" carousel is displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

    Examples:
          | cv    | account_type    | ber | test_priority | jira_id      |
          | 11.12 | beatrix control |     | smoke         | QANOV-340260 |
          | 11.12 | beatrix postpay | ber | sanity        | QANOV-2450   |

  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-200803
  @mobile @qa @vivobr @old_app
  Scenario Outline: <account_type> user can see all modules in Account tab associated to their mobile line
    A 'explore' module can also be displayed
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "jeri-simple-deeplink" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "mobile_allowances.list" carousel is displayed
      And the "gerenciar_pagamentos_entrypoint" entrypoint with "Gerenciar pagamentos" text is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

    Examples:
          | account_type | ber | test_priority | jira_id      |
          | jeri control | ber | sanity        | QANOV-202378 |

    @jira.link.detects.ACCOUNT-19890
    Examples:
          | account_type | ber | test_priority | jira_id      |
          | control_n    |     | smoke         | QANOV-340261 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @mobile
  @vivobr @old_app
  Scenario Outline: Convergente user with active status and with mobile lines can see all modules in Account tab associated to his/her plan
    internal_checkpoint="- A 'my_apps' module can also be displayed if the user has apps associated to the tariff"
    User in QA: qavivo-02
    Given user has a "convergente" account type
      And user has a "<user_plan>" plan in "active" status
      And user has a "admin" role
      And user has the "<plan_products>" products
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is displayed
      And the "<wired_products>" icons are displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

    @automatic @qa
    Examples:
          | user_plan        | plan_products                    | wired_products                      | ber | test_priority | jira_id    |
          | full convergente | mobile_line;internet;tv;landline | internet_icon;tv.icon;landline_icon | ber | sanity        | QANOV-2451 |

    @manual
    Examples:
          | user_plan | plan_products                 | wired_products              | ber | test_priority | jira_id     |
          | trio      | mobile_line;internet;tv       | internet_icon;tv.icon       |     | regression    | QANOV-22272 |
          | trio      | mobile_line;internet;landline | internet_icon;landline_icon |     | regression    | QANOV-22273 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @live @manual @mobile @next
  @regression @vivobr @old_app
  Scenario Outline: Convergente <user_plan> user with active status and without mobile lines can see all modules in Account tab associated to his/her plan
    A 'my_apps' module can also be displayed if the user has apps associated to the tariff.
    Duo Internet + TV (Live): CPF 38388655884
    Given user has a "convergente" account type
      And user has a "<user_plan>" plan in "active" status
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has the "<plan_products>" products
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is not displayed
      And the "<wired_products>" icons are displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

    Examples:
          | user_plan | plan_products        | wired_products                      | jira_id     |
          | trio      | internet;tv;landline | internet_icon;tv.icon;landline_icon | QANOV-22274 |
          | duo       | internet;tv          | internet_icon;tv.icon               | QANOV-22275 |
          | duo       | internet;landline    | internet_icon;landline_icon         | QANOV-22276 |

  @jira.QANOV-22278 @android @ios @jira.cv.12.0 @jira.link.detects.VIVO-2268 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @smoke @vivobr @old_app
  Scenario: Standalone internet user with active status can see all modules in Account tab associated to his/her plan
    internal_checkpoint="- A 'my_apps' module can also be displayed if the user has apps associated to the tariff
    - Lanline module will contain the landline number
    - Internet module will contain the upload/download speed info
    - TV module will contain the TV info"
    Given user has a "convergente" account type
      And user has a "internet" plan in "active" status
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is not displayed
      And the "internet_products" module is displayed
      And the "internet_products.plan_name" textfield is displayed
      And the "internet_products.internet_upload" textfield with the "\d+ Mbps" format is displayed
      And the "internet_products.internet_download" textfield with the "\d+ Mbps" format is displayed
      And the "internet_products.upload_information" textfield with "Upload até" text is displayed
      And the "internet_products.download_information" textfield with "Download até" text is displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

  @jira.QANOV-22277 @android @ios @jira.cv.12.0 @jira.link.detects.VIVO-2268 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @smoke @vivobr @old_app
  Scenario: Standalone landline user with active status can see all modules in Account tab associated to his/her plan
    internal_checkpoint="- A 'my_apps' module can also be displayed if the user has apps associated to the tariff
    - Lanline module will contain the landline number
    - Internet module will contain the upload/download speed info
    - TV module will contain the TV info"
    Given user has a "convergente" account type
      And user has a "landline" plan in "active" status
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is not displayed
      And the "landline" module is displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

  @jira.QANOV-22279 @android @ios @jira.cv.12.0 @jira.link.detects.VIVO-2268 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @smoke @vivobr @old_app
  Scenario: Standalone tv user with active status can see all modules in Account tab associated to his/her plan
    internal_checkpoint="- A 'my_apps' module can also be displayed if the user has apps associated to the tariff
    - Lanline module will contain the landline number
    - Internet module will contain the upload/download speed info
    - TV module will contain the TV info"
    Given user has a "convergente" account type
      And user has a "tv" plan in "active" status
      And user does not have a "siebel" plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is not displayed
      And the "tv_products" module is displayed
      And the "tv_products.plan_name" textfield is displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.12.0 @jira.link.detects.VIVO-2447
  @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @qa @vivobr @old_app
  Scenario Outline: Multiplan user can see all modules in Account tab associated to his/her <account_type> plan
    User in QA: qavivo-02, qavivo-04
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "services-summary-4" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "support" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "highlighted_services_legacy" module is displayed
      And the "diagnostics_module.module_title" textfield is displayed
      And the "diagnostics_module.title" textfield is displayed
      And the "diagnostics_module.description" textfield is displayed
      And the "diagnostics_module.button" button is displayed

    Examples:
          | account_type   | test_priority | ber | jira_id     |
          | legacy control | sanity        |     | QANOV-25539 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.detects.VIVO-2447
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke @vivobr @old_app
  Scenario Outline: Multiplan user can see all modules in Account tab associated to his/her <account_type> plan
    User in QA: qavivo-02
    Given user has "several" plans
      And user has a "admin" role
      And user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary-4" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "support" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "highlighted_services_legacy" module is displayed
      And the "diagnostics_module.module_title" textfield is displayed
      And the "diagnostics_module.title" textfield is displayed
      And the "diagnostics_module.description" textfield is displayed
      And the "diagnostics_module.button" button is displayed

    @automatic @live @next @qa
    Examples:
          | account_type   | ber | parent_test_plan | cv   | jira_id      |
          | legacy postpay | ber | QANOV-21791      | 12.0 | QANOV-340263 |
          | legacy control |     | QANOV-21791      | 12.0 | QANOV-25539  |

    @manual
    Examples:
          | account_type | ber | parent_test_plan | cv   | jira_id      |
          | jeri postpay |     | QANOV-226748     | 13.6 | QANOV-228675 |

  @jira.QANOV-133821 @android @ber @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-132105 @manual @mobile @sanity
  @vivobr @old_app
  Scenario: Prepay user can see all modules in Account tab
    A 'promo' banner can also be displayed if there are cards configured in the CMS for the account.
    Given user has a "prepay" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

  @jira.QANOV-287451 @android @ber @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-272041 @manual @mobile @sanity
  @vivobr @old_app
  Scenario: Prepay user can see all modules in Account tab
    A 'promo' banner can also be displayed if there are cards configured in the CMS for the account.
    Given user has a "prepay" account type
      And user has the matching subscription selected in the account
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is displayed
      And the "balance_module" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

  @jira.QANOV-340264 @android @automatic @ber @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-66163 @live @mobile
  @next @qa @smoke @vivobr @old_app
  Scenario: Siebel user with several products can see all modules in Account tab associated to his/her plan
    - A 'my_apps' module can also be displayed if the user has apps associated to the tariff
    User in QA: qavivo-05
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has "several" products in plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is not displayed
      And the "products" module is displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.7
  @jira.link.parent_test_plan.QANOV-66163 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: Siebel user with only 1 product can see all modules in Account tab associated to his/her plan
    internal_checkpoint="- A 'my_apps' module can also be displayed if the user has apps associated to the tariff
    - Lanline module will contain the landline number
    - Internet module will contain the upload/download speed info
    - TV module will contain the TV info"
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a "<user_plan>" plan in "active" status
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "<user_plan>" module is displayed
      And the "mobile_lines" carousel is not displayed
      And the "products" module is not displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

    Examples:
          | user_plan | jira_id     |
          | landline  | QANOV-98405 |
          | internet  | QANOV-98406 |
          | tv        | QANOV-98407 |

  @jira.<jira_id> @<impeded> @<test_priority> @android @automation.pending_mock @ios @jira.cv.12.4
  @jira.link.detects.<detects> @jira.link.parent_test_plan.QANOV-56585 @manual @mobile @vivobr @old_app
  Scenario Outline: Convergente with pending installation status can see all modules in Account tab associated to his/her plan
    - If user do not have mobile line product then mobile lines roundel shouldn't appear
    - A 'my_apps' module can also be displayed if the user has apps associated to the tariff
    - If user has closed the alert less than 24h ago user shouldn't see the alert
    Standalone Landline (Live): CPF 02216780936
    Given user has a "convergente" account type
      And user has a "admin" role
      And user has a "<user_plan>" plan in "pending" status
      And user has the "<plan_products>" products
      And user has not closed the "visit_scheduled_alert" alert
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "dashboard" page for the plan selected
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page for the plan selected
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" are displayed as roundels
      And the "visit_scheduled_alert" alert is displayed
      And the "<wired_products>" icons are displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is not displayed

    Examples:
          | user_plan        | plan_products                    | wired_products                      | detects   | impeded      | test_priority | jira_id     |
          | full convergente | mobile_line;internet;tv;landline | internet_icon;tv_icon;landline_icon |           | impeded_mock | smoke         | QANOV-56924 |
          | trio             | mobile_line;internet;tv          | internet_icon;tv_icon               |           | impeded_mock | regression    | QANOV-56925 |
          | trio             | mobile_line;internet;landline    | internet_icon;landline_icon         |           | impeded_mock | regression    | QANOV-56926 |
          | trio             | internet;tv;landline             | internet_icon;tv_icon;landline_icon |           | impeded_mock | regression    | QANOV-56927 |
          | duo              | internet;tv                      | internet_icon;tv_icon               |           | impeded_mock | regression    | QANOV-56928 |
          | duo              | internet;landline                | internet_icon;landline_icon         |           | impeded_mock | regression    | QANOV-56929 |
          | landline         | landline                         | landline_info                       | VIVO-2555 | impeded_mock | smoke         | QANOV-56930 |
          | internet         | internet                         | internet_info                       |           | impeded_mock | regression    | QANOV-56931 |
          | tv               | tv                               | tv_info                             |           | impeded_mock | regression    | QANOV-56932 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: <account_type> with cancelled status can see all modules in Account tab associated to his/her plan
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "any" plan in "cancelled" status
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "cancelled_alert" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed
      And the "bills" module is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403063 |
          | beatrix      | QANOV-403064 |
          | multivivo    | QANOV-403065 |

  @jira.QANOV-340265 @android @automatic @ber @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @live @mobile
  @next @qa @smoke @vivobr @old_app
  Scenario: Multivivo admin user can see all modules in Account tab associated to his/her plan
    A 'my_apps' module can also be displayed if the user has apps associated to the tariff
    User in QA: qavivo-05
    Given user has a "multivivo" account type
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is displayed
      And the "landline_icon;tv;internet_icon" icons are not displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.<cv> @jira.link.detects.NOV-224881
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> dependent user can see all modules in Account tab associated to his/her plan
    internal_checkpoint="A 'my_apps' module can also be displayed if the user has apps associated to the tariff"
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has a "dependent" role
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "services-summary-2" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_allowances" carousel is displayed
      And the "bills" module is displayed
      And the "highlighted_services_carousel_cards" carousel is displayed

    Examples:
          | cv    | account_type | parent_test_plan | impeded      | automation              | jira_id     |
          | 12.0  | convergente  | QANOV-21791      | impeded_mock | automation.pending_mock | QANOV-22281 |
          | 11.12 | multivivo    | QANOV-21949      |              |                         | QANOV-2455  |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-164092 @mobile @vivobr @old_app
  Scenario Outline: A <account_type> admin user can access to the "Mobile line Dashboard" screen of the admin line
    If user has several mobile lines then user can see a distribute internet entrypoint
    User in QA: qavivo-04
    Given user has a "<account_type>" account type
      And user has a "any" plan in "<status>" status
      And user has a "mobile_line" product
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user has the "consumption-counters-mobile" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the mobile line with role "admin"
     Then the "Mobile Line Dashboard" page is displayed
      And the "Celular" header is displayed
      And the "mobile_line_icon" icon is displayed
      And the "mobile_line_text" textfield with the "\(\d{2}\) \d{5}-\d{4}" format is displayed
      And the "mobile_allowances.list" carousel is displayed

    @automatic @live @next @qa
    Examples:
          | account_type | status | ber | cv   | parent_test_plan | test_priority | detects | jira_id      |
          | multivivo    | active |     | 12.0 | QANOV-21791      | smoke         |         | QANOV-340266 |

    @automatic @qa
    Examples:
          | account_type | status | ber | cv   | parent_test_plan | test_priority | detects | jira_id     |
          | convergente  | active | ber | 12.0 | QANOV-21791      | sanity        |         | QANOV-22282 |

    @manual
    Examples:
          | account_type | status  | ber | cv   | parent_test_plan | test_priority | detects   | jira_id     |
          | convergente  | pending |     | 12.4 | QANOV-56585      | regression    | VIVO-2319 | QANOV-56933 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.relates_to.NOV-164092 @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> admin user can access to the "Mobile line dashboard" screen of the dependent line
    User in QA: qavivo-04
    Given user has a "<account_type>" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the mobile line with role "dependent"
     Then the "Mobile Line Dashboard" page is displayed
      And the "Celular" header is displayed
      And the "mobile_line_icon" icon is displayed
      And the "mobile_line_text" textfield with the "\(\d{2}\) \d{5}-\d{4}" format is displayed
      And the "mobile_allowances.list" carousel is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    @live @next @qa
    Examples:
          | account_type | ber | jira_id      |
          | multivivo    | ber | QANOV-340267 |

    @qa
    Examples:
          | account_type | ber | jira_id      |
          | convergente  |     | QANOV-340268 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-39
  @mobile @no_automatable @regression @vivobr @old_app
  Scenario Outline: Legacy user can see the expiration date for their main tariff
    commented_tags="@depends_on.NOV-30"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "data;minutes;sms" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
     When clicks on the "consumption" tab
     Then the "ConsumptionV1" page is displayed
      And the "remaining_expiration_date" textfield is displayed

    Examples:
          | account_type   | parent_test_plan | cv   | jira_id      |
          | legacy control | QANOV-21950      | 9.12 | QANOV-2539   |
          | legacy postpay | QANOV-21950      | 9.12 | QANOV-390239 |
          | jeri postpay   | QANOV-226748     | 13.6 | QANOV-228677 |

  @jira.<jira_id> @<impeded> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-716 @mobile @no_automatable @sanity @vivobr @old_app
  Scenario Outline: User can see the internet information of their plan
    internal_checkpoint="If the user hasn't purchased additional packages the additional packages purchased won't appear"
    commented_tags="@depends_on.NOV-30"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "data;minutes;sms" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
     When clicks on the "consumption" tab
     Then the "ConsumptionV1" page is displayed
      And the "plan_details" module is displayed
      And the "data_limited_allowance" module is displayed
      And the "data_limited_allowance.progress_bar" progression bar is displayed
      And the "data_limited_allowance.consumption" module with "Consumo" text is displayed
      And the "data_limited_allowance.available" module with "Disponível" text is displayed
      And the "<features>" link is displayed
      And the "buy_bundles" button with "Contrate um Pacote Adicional" text is displayed

    Examples:
          | account_type   | features                                                                                                                                                                            | impeded        | parent_test_plan | cv   | jira_id      |
          | legacy control | Apps Ilimitados;Detalhes do consumo de minha internet;Vivo Controle com condição especial;Envie sua internet disponível;Histórico de Compartilhamento;Peça internet aos seus amigos | impeded_legacy | QANOV-21950      | 9.8  | QANOV-2542   |
          | legacy postpay | Apps Ilimitados;Detalhes do consumo de minha internet;Dispositivos Vivo Sync                                                                                                        | impeded_legacy | QANOV-21950      | 9.8  | QANOV-2543   |
          | jeri postpay   | Apps Ilimitados;Detalhes do consumo de minha internet;Dispositivos Vivo Sync                                                                                                        |                | QANOV-226748     | 13.6 | QANOV-228679 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-24993 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User can see all the account in the app language regardless of the language configured in the device
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And the device language is "<language>"
      And user is in the "Account" page
     Then the texts are displayed in "Portuguese"

    Examples:
          | cv    | account_type | language   | parent_test_plan | jira_id      |
          | 11.12 | beatrix      | Portuguese | QANOV-21949      | QANOV-2595   |
          | 11.12 | beatrix      | English    | QANOV-21949      | QANOV-2596   |
          | 12.0  | convergente  | Portuguese | QANOV-21791      | QANOV-2597   |
          | 12.0  | convergente  | English    | QANOV-21791      | QANOV-2598   |
          | 11.12 | multivivo    | Portuguese | QANOV-21949      | QANOV-2601   |
          | 11.12 | multivivo    | English    | QANOV-21949      | QANOV-2602   |
          | 14.5  | legacy       | Portuguese | QANOV-132105     | QANOV-133822 |
          | 14.5  | legacy       | English    | QANOV-132105     | QANOV-133823 |
          | 13.5  | jeri         | Portuguese | QANOV-200803     | QANOV-202382 |
          | 13.5  | jeri         | English    | QANOV-200803     | QANOV-202383 |
          | 13.5  | control_n    | Portuguese | QANOV-200803     | QANOV-202384 |
          | 13.5  | control_n    | English    | QANOV-200803     | QANOV-202385 |

  @jira.<jira_id> @android @ios @jira.cv.9.16 @jira.link.parent_test_plan.QANOV-21950 @old_app
  @jira.link.parent_test_plan.QANOV-226748 @jira.link.relates_to.NOV-24993 @manual @mobile @regression @vivobr
  Scenario Outline: Legacy user can see all the account in the app language regardless of the language configured in the device
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
      And the device language is "<language>"
     When clicks on the "consumption" tab
     Then the "ConsumptionV1" page is displayed
      And the texts are displayed in "Portuguese"

    Examples:
          | language   | jira_id    |
          | Portuguese | QANOV-2603 |
          | English    | QANOV-2604 |

  @jira.QANOV-2656 @android @ios @jira.cv.9.7 @jira.link.parent_test_plan.QANOV-21950 @old_app
  @jira.link.parent_test_plan.QANOV-226748 @jira.link.relates_to.NOV-782 @mobile @no_automatable @regression @vivobr
  Scenario: Legacy user can see his/her additional packages
    commented_tags="@depends_on.NOV-30"
    Given user has any "legacy control;legacy postpay;jeri postpay" account types
      And user has "1" plans
      And user has "data;minutes;sms" allowances in the "mobile_line" product
      And user has the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
     When clicks on the "consumption" tab
     Then the "ConsumptionV1" page is displayed
      And the "data_bundle_allowance" module is displayed
      And the "data_bundle_allowance.progress_bar" progression bar is displayed

  @jira.QANOV-340269 @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @mobile @qa
  @regression @vivobr @old_app
  Scenario: Convergente user with only a mobile line can see the mobile line in the dashboard
    User in QA: qavivo-03
    Given user has a "convergente" account type
      And user has a "mobile_line" product
      And user has a "admin" role
      And user has "1" mobile lines in plan
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines_carousel" roundel is displayed
      And the "mobile_line_module.mobile_line_icon" icon is displayed
      And the "mobile_line_module.mobile_line_name" textfield is displayed
      And the "mobile_line_module.mobile_line_phonenumber" textfield is displayed

  @jira.QANOV-340270 @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @mobile @qa
  @regression @vivobr @old_app
  Scenario: Convergente user with several lines can see a carousel of mobile lines in the dashboard
    User in QA: qavivo-04
    Given user has a "convergente" account type
      And user has "several" mobile lines in plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is displayed
      And each element in the "mobile_lines" carousel has the "icon" field
      And each element in the "mobile_lines" carousel has the "name" field
      And each element in the "mobile_lines" carousel has the "phonenumber" field

  @jira.<jira_id> @android @ios @jira.cv.12.3 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: <account_type> admin user with several lines will see the admin line in first position of the mobile line carousel
    other_affected_versions=2021-20
    Given user has a "<account_type>" account type
      And user has "several" mobile lines
      And user has a "admin" role
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel is displayed
      And the "admin_mobile_line" is in the "0" position of "mobile_lines" carousel

    Examples:
          | account_type | jira_id     |
          | convergente  | QANOV-84599 |
          | multivivo    | QANOV-84600 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @qa
  @regression @vivobr @old_app
  Scenario Outline: Convergente user can see the <convergente_product> product in the dashboard
    User in QA: qavivo-03
    Given user has a "convergente" account type
      And user has a "<convergente_product>" product
      And user does not have a "<convergente_product>" plan
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "<convergente_icon>" icon is displayed
      And the "<product_name>" textfield is displayed

    Examples:
          | convergente_product | convergente_icon | product_name   | jira_id      |
          | internet            | internet_icon    | internet_label | QANOV-340271 |
          | landline            | landline_icon    | landline_label | QANOV-340272 |
          | tv                  | tv.icon          | tv.label       | QANOV-340273 |

  @jira.QANOV-22319 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Convergente user can swipe all mobile lines in dashboard
    Given user has a "convergente" account type
      And user has "several" mobile lines
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_lines" carousel can be swiped in "left" direction
      And the "mobile_lines" carousel can be swiped in "right" direction

  @jira.QANOV-22321 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Convergente user who has consumed 100% of his/her allowance will see the mobile line roundel in pink color
    internal_checkpoint="In the mobile roundel user will see the sum of all data allowances (como quiser and uso exclusivo"
    Given user has a "convergente" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_line" product roundel is displayed in "pink" color

  @jira.QANOV-22322 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Convergente user who has consumed 80% of his/her allowance or less, can see the roundel in green
    internal_checkpoint="In the mobile roundel user will see the sum of all data allowances (como quiser and uso exclusivo"
    Given user has a "convergente" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed "<=80%" of the "data" allowance in the "mobile_line" product
      And user has consumed ">0%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_line" product roundel is displayed in "green" color

  @jira.QANOV-22323 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Convergente user who has consumed more than 80% of his/her allowance but less than 100%, can see the roundel in amber
    internal_checkpoint="In the mobile roundel user will see the sum of all data allowances (como quiser and uso exclusivo"
    Given user has a "convergente" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has consumed ">80%" of the "data" allowance in the "mobile_line" product
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_line" product roundel is displayed in "amber" color

  @jira.QANOV-22324 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Convergente user who has unlimited allowance can see the mobile line roundel in blue color
    internal_checkpoint="In the mobile roundel user will see the sum of all data allowances (como quiser and uso exclusivo"
    Given user has a "convergente" account type
      And user has "data" allowances in the "mobile_line" product
      And user has a "mobile_line" product
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "mobile_line" product roundel is displayed in "blue" color

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke @vivobr
  @old_app
  Scenario Outline: Multiplan user with a <account_type> plan selected can access to the Support tab from the account dashboard
    User in QA: qavivo-02, qavivo-04
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "support" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "diagnostics_module.button" entrypoint
     Then the internal webview with "Verificando conexão" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    @automatic @impeded_env
    Examples:
          | account_type   | cv   | parent_test_plan | jira_id     |
          | legacy postpay | 12.0 | QANOV-21791      | QANOV-25536 |
          | legacy control | 12.0 | QANOV-21791      | QANOV-25537 |

    @manual
    Examples:
          | account_type | cv   | parent_test_plan | jira_id      |
          | jeri postpay | 13.6 | QANOV-226748     | QANOV-228681 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-200803 @mobile @qa @sanity
  @vivobr @old_app
  Scenario Outline: A <account_type> user can see the "Gerenciar pagamento" module
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "jeri-simple-deeplink" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "gerenciar_pagamentos_entrypoint" entrypoint with "Gerenciar pagamentos" text is displayed

    Examples:
          | account_type | jira_id      |
          | jeri control | QANOV-202389 |
          | control_n    | QANOV-202390 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.13.5 @jira.link.parent_test_plan.QANOV-200803 @manual @mobile @smoke
  @old_app @vivobr
  Scenario Outline: A <account_type> user can access to the "Gerenciar pagamento" screen
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user has the "jeri-simple-deeplink" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on the "gerenciar_pagamento" entrypoint
     Then the internal webview with "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | account_type | jira_id      |
          | jeri control | QANOV-202391 |
          | control_n    | QANOV-202392 |

  @jira.<jira_id> @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A user with the <offer> CRM offer will see the button to access it in the dashboard header
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has a internet product with "<internet_type>" connectivity
      And user has a "<offer>" offer
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "offer_button" button with "<button_text>" text is displayed

    Examples:
          | offer            | button_text           | internet_type | jira_id      |
          | upgrade_to_fiber | Mudar para Vivo Fibra | Cobre         | QANOV-223615 |
          | upgrade_speed    | Aumentar velocidade   | Fibra         | QANOV-223616 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: A user with a upgrade to fiber CRM offer can open the offer button
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has any "upgrade_to_fiber" offer
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "<button>" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | button       | jira_id      |
          | offer_button | QANOV-223619 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: A user with a upgrade speed CRM offer can open the offer button
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has any "upgrade_speed" offer
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "<button>" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | button       | jira_id      |
          | offer_button | QANOV-223621 |

  @jira.<jira_id> @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A <account_type> user with the mobile plan change CRM offer will see the button to access it in the dashboard header
    Given user has a "<account_type>" account type
      And user has a "mobile_plan_change" offer
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "offer_button" button with "Trocar de plano" text is displayed

    Examples:
          | account_type    | jira_id      |
          | beatrix control | QANOV-223623 |
          | beatrix postpay | QANOV-223624 |

  @jira.QANOV-223625 @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A multivivo user with the mobile plan change CRM offer will see the button to access it in the dashboard header
    Given user has a "multivivo" account type
      And user has a "admin" role
      And user has a "mobile_plan_change" offer
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "offer_button" button with "Trocar de plano" text is displayed

  @jira.<jira_id> @TBD @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: A user with the mobile plan change CRM offer can open the offer button
    Given user has any "beatrix;multivivo" account types
      And user has a "admin" role
      And user has a "mobile_plan_change" offer
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "<button>" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | button       | jira_id      |
          | offer_button | QANOV-223629 |

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile
  @vivobr @old_app
  Scenario Outline: <account_type> user can see the account screen during a maintenance window
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Account" page
     Then the "maintenance_information" card is displayed
      And the "bills" module is displayed

    Examples:
          | account_type | ber | priority   | jira_id      |
          | beatrix      | ber | sanity     | QANOV-323116 |
          | multivivo    |     | sanity     | QANOV-323117 |
          | convergente  |     | regression | QANOV-323118 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @smoke
  @vivobr @old_app
  Scenario Outline: <account_type> user can see the account screen during a maintenance window
    Given user has a "<account_type>" account type
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Account" page
     Then the "maintenance_information" card is displayed

    Examples:
          | account_type  | ber | plan   | jira_id      |
          | legacy prepay | ber | any    | QANOV-323119 |
          | jeri prepay   |     | any    | QANOV-323120 |
          | control_n     |     | any    | QANOV-323121 |
          | convergente   |     | siebel | QANOV-323122 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @smoke @vivobr
  @old_app
  Scenario Outline: <account_type> user can see the account screen during a maintenance window
    Given user has a "<account_type>" account type
      And user has "several" plans
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Account" page
     Then the "maintenance_information" card is displayed

    Examples:
          | account_type   | jira_id      |
          | legacy postpay | QANOV-345143 |
          | legacy control | QANOV-345144 |
          | jeri postpay   | QANOV-345145 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-355372 @manual @mobile @smoke
  @vivobr @old_app
  Scenario Outline: <account_type> user with beatrix mobile line in pre active status can see all modules in Account tab associated to their mobile line
    Given user has a "<account_type>" account type
      And user has a "beatrix" mobile line in "pre active" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "pre_active_alert" module is displayed
      And the "mobile_allowances" carousel is displayed
      And the "highlighted_services_carousel_cards" carousel is not displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-356564 |
          | convergente  | QANOV-356565 |
          | multivivo    | QANOV-356566 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario Outline: <account_type> user can see all modules in Assinatura tab
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "quick_actions" carousel is displayed
      And the "plans" card is displayed
      And the "sva_no_included" module is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-377321 |
          | convergente  |     | QANOV-377322 |
          | multivivo    |     | QANOV-377324 |
          | jeri         |     | QANOV-377325 |
          | legacy       |     | QANOV-377326 |
          | control_n    |     | QANOV-377327 |

  @jira.QANOV-377328 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-359861 @manual @mobile @sanity
  @vivobr
  Scenario: User can access to "Plan Details" screen
    Given user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed

  @jira.QANOV-388276 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr
  Scenario: User can access to the FAQ webview
    Given user is in the "Assinatura" page
     When clicks on the "navigation_top_bar.question_icon" tab
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "TBD" button
      And the "Assinatura" page is displayed

  @jira.QANOV-517424 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @sanity
  @vivobr
  Scenario: User will see a warning about the maintenance windows during a maintenance window
    Given there is a maintenance window
      And user is in the "Assinatura" page
     Then the "maintenance_information" card is displayed

  @jira.QANOV-517425 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke @vivobr
  Scenario: User will not see the "quick actions" and "sva not included" modules in Assinatura tab during a maintenance window
    Given there is a maintenance window
      And user is in the "Assinatura" page
     Then the "quick_actions" carousel is not displayed
      And the "sva_no_included" module is not displayed

  @jira.QANOV-517426 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke @vivobr
  Scenario: User will not see the travel module in Assinatura tab during a maintenance window
    Given there is a maintenance window
      And user has any "convergente;multivivo;jeri postpay;legacy postpay;beatrix postpay" account types
      And user has "1" plans
      And user has "1" vivo travel package in the plans
      And user is in the "Assinatura" page
     Then the "travel" card is not displayed

  @jira.QANOV-517427 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario: User with any app included in the tariff will not see the sva module in Assinatura tab during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;convergente;multivivo;jeri;legacy;control_n" account types
      And user has "any" apps included in the tariff
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     Then the "sva_included" module is not displayed
