# -*- coding: utf-8 -*-
@jira.QANOV-4152
Feature: Plan details


  @jira.QANOV-4164 @android @ios @jira.cv.12.0 @jira.link.depends_on.QANOV-4163 @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-76707 @live @manual @mobile @next @qa @smoke @vivobr @old_app
  Scenario: Full convergente user with apps associated to the tariff can access to "Detalhe do plano" screen
    Given user has a "full convergente" plan
      And user has apps included in the tariff
      And user has the matching subscription selected in the account
      And user has the "detalhe-do-plano" entrypoint configured in CMS for the "services-summary-2" list
      And user has the "tariff-header" module configured in CMS for "tariff-details" page for the plan selected
      And user has the "tariffs-list" module configured in CMS for "tariff-details" page for the plan selected
      And user is in the "Account" page
     When clicks on the "plan_details_entrypoint" card
     Then the "Plan Details" page is displayed
      And the "Detalhe do plano" header is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_section_title" textfield with "PRODUTOS INCLUSOS" text is displayed
      And the "plan_product_list" list with "Celular;Internet;TV;Fixo;Apps inclusos no plano" textfields is displayed
      And each element in the "plan_product_list_service" list has the "icon" field
      And each element in the "plan_product_list_service" list has the "entrypoint_name" field
      And each element in the "plan_product_list_service" list has the "description" field

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.depends_on.QANOV-4163 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: Trio user can access to "Detalhe do plano" screen
    Given user has a "trio" plan
      And user has a "internet" product
      And user has a "<mobile_landline_product>" product
      And user has a "<landline_tv_product>" product
      And user has apps included in the tariff
      And user has the matching subscription selected in the account
      And user has the "detalhe-do-plano" entrypoint configured in CMS for the "services-summary-2" list
      And user has the "tariff-header" module configured in CMS for "tariff-details" page for the plan selected
      And user has the "tariffs-list" module configured in CMS for "tariff-details" page for the plan selected
      And user is in the "Account" page
     When clicks on the "plan_details_entrypoint" card
     Then the "Plan Details" page is displayed
      And the "Detalhe do plano" header is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_section_title" textfield with "PRODUTOS INCLUSOS" text is displayed
      And the "plan_product_list" list with "<plan_product_names>" textfields is displayed
      And each element in the "plan_product_list" list has the "icon" field
      And each element in the "plan_product_list" list has the "entrypoint_name" field
      And each element in the "plan_product_list" list has the "description" field

    Examples:
          | mobile_landline_product | landline_tv_product | plan_product_names                           | jira_id    |
          | mobile_line             | landline            | Celular;Internet;Fixo;Apps inclusos no plano | QANOV-4165 |
          | mobile_line             | tv                  | Celular;Internet;TV;Apps inclusos no plano   | QANOV-4166 |
          | landline                | tv                  | Internet;TV;Fixo;Apps inclusos no plano      | QANOV-4167 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.depends_on.QANOV-4163 @jira.link.parent_test_plan.QANOV-21791
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: Duo user can access to "Detalhe do plano" screen
    Given user has a "duo" plan
      And user has a "internet" product
      And user has a "<landline_tv_product>" product
      And user has apps included in the tariff
      And user has the matching subscription selected in the account
      And user has the "detalhe-do-plano" entrypoint configured in CMS for the "services-summary-2" list
      And user has the "tariff-header" module configured in CMS for "tariff-details" page for the plan selected
      And user has the "tariffs-list" module configured in CMS for "tariff-details" page for the plan selected
      And user is in the "Account" page
     When clicks on the "plan_details_entrypoint" card
     Then the "Plan Details" page is displayed
      And the "Detalhe do plano" header is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_section_title" textfield with "PRODUTOS INCLUSOS" text is displayed
      And the "plan_product_list" list with "<plan_product_names>" textfields is displayed
      And each element in the "plan_product_list" list has the "icon" field
      And each element in the "plan_product_list" list has the "entrypoint_name" field
      And each element in the "plan_product_list" list has the "description" field

    Examples:
          | landline_tv_product | plan_product_names                   | jira_id    |
          | landline            | Internet;Fixo;Apps inclusos no plano | QANOV-4168 |
          | tv                  | Internet;TV;Apps inclusos no plano   | QANOV-4169 |

  @jira.<jira_id> @<automation> @<ber> @<execution_mode> @<impeded> @android @ios @jira.cv.<cv>
  @jira.link.depends_on.<depends_on> @jira.link.detects.<detects> @jira.link.detects.VIVO-3294
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user with only one product in plan can access to "Detalhe do plano" screen
    Given user has a "<account_type>" account type
      And user has a "<product_plan>" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "plan_details_entrypoint" card
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    @live @next
    Examples:
          | cv   | account_type  | product_plan | ber | depends_on            | parent_test_plan | detects             | execution_mode | impeded      | automation              | jira_id      |
          | 13.9 | beatrix       | monoline     | ber | QANOV-4162:QANOV-4163 | QANOV-21949      | VIVO-2266           | automatic      |              |                         | QANOV-4170   |
          | 13.9 | multivivo     | any          |     | QANOV-22271           | QANOV-21949      | VIVO-2266           | automatic      |              |                         | QANOV-4175   |
          | 13.9 | convergente   | internet     |     | QANOV-4160            | QANOV-21791      | VIVO-2103:VIVO-2266 | manual         |              |                         | QANOV-4171   |
          | 13.9 | convergente   | landline     |     | QANOV-4159            | QANOV-21791      | VIVO-2103:VIVO-2266 | manual         | impeded_mock | automation.pending_mock | QANOV-4172   |
          | 13.9 | convergente   | tv           |     | QANOV-4161            | QANOV-21791      | VIVO-2103:VIVO-2266 | manual         | impeded_mock | automation.pending_mock | QANOV-4173   |
          | 13.9 | legacy prepay | monoline     | ber | QANOV-133825          | QANOV-132105     |                     | automatic      |              |                         | QANOV-133826 |
          | 13.5 | jeri control  | monoline     | ber |                       | QANOV-200803     |                     | automatic      |              |                         | QANOV-202393 |

    @impeded_env
    Examples:
          | cv   | account_type | product_plan | ber | depends_on   | parent_test_plan | detects | execution_mode | impeded | automation | jira_id      |
          | 13.9 | jeri prepay  | monoline     |     | QANOV-133825 | QANOV-132105     |         | automatic      |         |            | QANOV-272647 |
          | 13.5 | control_n    | monoline     |     |              | QANOV-200803     |         | automatic      |         |            | QANOV-202394 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-4164
  @jira.link.detects.VIVO-2103 @jira.link.detects.VIVO-2266 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @smoke
  @vivobr @old_app
  Scenario Outline: Full convergente user can access to the different products details screen
    Given user has a "full convergente" plan
      And user has the matching subscription selected in the account
      And user has the "Detalhe do plano" entrypoint configured in CMS for the "service-list-snapcard" list
      And user has the "tariffs-list" module configured in CMS for "tariff-details" page for the plan selected
      And user is in the "Plan Details" page
     When clicks on the "<product_type>" entrypoint
     Then the internal webview is displayed
      And the "Detalhe do produto" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

    Examples:
          | product_type        | jira_id    |
          | mobile_line_product | QANOV-4179 |
          | internet_product    | QANOV-4180 |
          | landline_product    | QANOV-4181 |
          | tv_product          | QANOV-4182 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0 @jira.link.depends_on.QANOV-4167
  @jira.link.detects.VIVO-2103 @jira.link.detects.VIVO-2266 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile
  @regression @vivobr @old_app
  Scenario Outline: Trio user can access to the different products details screen
    Given user has a "trio" plan
      And user has a "<plan_product>" product
      And user has the matching subscription selected in the account
      And user has the "Detalhe do plano" entrypoint configured in CMS for the "service-list-snapcard" list
      And user has the "tariffs-list" module configured in CMS for "tariff-details" page for the plan selected
      And user is in the "Plan Details" page
     When clicks on the "<product_type>" entrypoint
     Then the internal webview is displayed
      And the "Detalhe do produto" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

    Examples:
          | plan_product | product_type        | jira_id    |
          | mobile_line  | mobile_line_product | QANOV-4183 |
          | internet     | internet_product    | QANOV-4184 |
          | landline     | landline_product    | QANOV-4185 |
          | tv           | tv_product          | QANOV-4186 |

  @jira.<jira_id> @<automation> @<impeded> @android @ios @jira.cv.12.0 @jira.link.depends_on.QANOV-4169
  @jira.link.detects.VIVO-2103 @jira.link.detects.VIVO-2266 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile
  @regression @vivobr @old_app
  Scenario Outline: Duo user can access to the different products details screen
    Given user has a "duo" plan
      And user has a "<plan_product>" product
      And user has the matching subscription selected in the account
      And user has the "Detalhe do plano" entrypoint configured in CMS for the "service-list-snapcard" list
      And user has the "tariffs-list" module configured in CMS for "tariff-details" page for the plan selected
      And user is in the "Plan Details" page
     When clicks on the "<product_type>" entrypoint
     Then the internal webview is displayed
      And the "Detalhe do produto" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

    Examples:
          | plan_product | product_type     | impeded      | automation              | jira_id    |
          | internet     | internet_product | impeded_mock | automation.pending_mock | QANOV-4187 |
          | landline     | landline_product | impeded_mock | automation.pending_mock | QANOV-4188 |
          | tv           | tv_product       | impeded_mock | automation.pending_mock | QANOV-4189 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.13.0 @manual @mobile @vivobr @old_app
  Scenario Outline: A user can see the extra when there is an extra with <product_tags> product tags configured in CMS
    We are assuming that the list is published in the Account page, but the page depends on the publishing status in CMS.
    Extras with product tags take their info from external APIs
    Given user has a list of extras configured in CMS for "Account" page
      And the extra configured in CMS has the "product_tags" provider with tags "<product_tags>"
      And user has the "<name>" extra service
      And user has the "extras" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then any element in the "extras_list" list has the "name" textfield with the "<name>" text
      And each element in the "extras_list" list has the "icon" field

    Examples:
          | product_tags    | name    | priority   | jira_id      |
          | spotify;incluso | Spotify | smoke      | QANOV-156112 |
          | netflix;incluso | Netflix | regression | QANOV-184300 |
          | moovit;incluso  | Moovit  | regression | QANOV-184301 |
          | nba;incluso     | NBA     | regression | QANOV-184302 |
          | bitfit;incluso  | Bit fit | regression | QANOV-184303 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-203120 @mobile @smoke @vivobr @old_app
  Scenario Outline: User can see the unlimited apps module in the data consumption screen
    internal_checkpoint="Unlimited Apps could be: Cabify, Moovit, Waze, Whatsapp"
    commented_tags="@depends_on.NOV-174884"
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has unlimited apps included in the tariff
      And user has the matching subscription selected in the account
      And user has the "extras" module configured in CMS for "consumption-details-data" page
      And user is in the "<current_page>" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Mobile Line Consumption" page is displayed
      And the "unlimited_apps" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "<current_page>" page is displayed

    @automatic @qa
    Examples:
          | cv   | account_type | current_page          | parent_test_plan | jira_id      |
          | 12.0 | convergente  | Mobile Line Dashboard | QANOV-21791      | QANOV-340313 |

    @automatic @live @next @qa
    Examples:
          | cv    | account_type | current_page          | parent_test_plan | jira_id      |
          | 11.12 | beatrix      | Account               | QANOV-21949      | QANOV-340314 |
          | 11.12 | multivivo    | Mobile Line Dashboard | QANOV-21949      | QANOV-4217   |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-203121 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user cannot see the unlimited apps module in the data consumption screen if user has not associated to his/her tariff
    commented_tags="@depends_on.NOV-174884"
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user has no unlimited apps included in the tariff
      And user has the matching subscription selected in the account
      And user has the "extras" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Consumption" page
     Then the "unlimited_apps" module is not displayed

    Examples:
          | cv    | account_type | parent_test_plan | jira_id      |
          | 12.0  | convergente  | QANOV-21791      | QANOV-4215   |
          | 11.12 | beatrix      | QANOV-21949      | QANOV-4216   |
          | 11.12 | multivivo    | QANOV-21949      | QANOV-4217   |
          | 13.5  | jeri control | QANOV-200803     | QANOV-202403 |
          | 13.5  | control_n    | QANOV-200803     | QANOV-202404 |

  @jira.QANOV-214377 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-132105 @jira.link.relates_to.NOV-203121
  @manual @mobile @regression @vivobr @old_app
  Scenario: A prepay user with vivo_pre_diario allowance cannot see the unlimited apps module in the data consumption screen
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "vivo_pre_diario" data bundles
      And user has the matching subscription selected in the account
      And user has the "extras" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Consumption" page
     Then the "unlimited_apps" module is not displayed

  @jira.QANOV-214378 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-132105 @jira.link.relates_to.NOV-203121
  @manual @mobile @regression @vivobr @old_app
  Scenario: A prepay user with vivo_pre_turbo allowance can see the unlimited apps module in the data consumption screen if user has associated to his/her tariff
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "vivo_pre_turbo" data bundles
      And user has unlimited apps included in the tariff
      And user has the matching subscription selected in the account
      And user has the "extras" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Consumption" page
     Then the "unlimited_apps" module is displayed

  @jira.QANOV-214380 @android @ios @jira.cv.14.5 @jira.link.parent_test_plan.QANOV-132105 @jira.link.relates_to.NOV-203121
  @manual @mobile @regression @vivobr @old_app
  Scenario: A prepay user with vivo_pre_turbo allowance cannot see the unlimited apps module in the data consumption screen if user has not associated to his/her tariff
    Given user has any "legacy prepay;jeri prepay" account types
      And user has activated "vivo_pre_turbo" data bundles
      And user has no unlimited apps included in the tariff
      And user has the matching subscription selected in the account
      And user has the "extras" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Consumption" page
     Then the "unlimited_apps" module is not displayed

  @jira.<jira_id> @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: A user with the <offer> CRM offer will see the button to access it in the Plan details page
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has "several" products
      And user has a internet product with "<internet_type>" connectivity
      And user has a "<offer>" offer
      And user has the matching subscription selected in the account
      And user is in the "Plan Details" page
     Then the "offer_button" button with "<button_text>" text is displayed

    Examples:
          | offer            | button_text           | internet_type | jira_id      |
          | upgrade_to_fiber | Mudar para Vivo Fibra | Cobre         | QANOV-223631 |
          | upgrade_speed    | Aumentar velocidade   | Fibra         | QANOV-223632 |

  @jira.QANOV-223633 @TBD @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A user with a update to fiber CRM offer can open the offer button from the Plan details page
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has "several" products
      And user has any "upgrade_to_fiber" offer
      And user has the matching subscription selected in the account
      And user is in the "Plan Details" page
     When clicks on the "offer_button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.QANOV-223634 @TBD @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression
  @vivobr @old_app
  Scenario: A user with a upgrade speed CRM offer can open the offer button from the Plan details page
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has "several" products
      And user has any "upgrade_speed" offer
      And user has the matching subscription selected in the account
      And user is in the "Plan Details" page
     When clicks on the "offer_button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.QANOV-450786 @ber @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: Full convergente user can access to Plan details page
    Given user has a "full convergente" plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan_details_vivinho_icon" icon is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_subtitle" textfield with the "\(\d{2}\) \d{5}-\d{4}" format is displayed
      And the "plan.mobile_allowances" module is displayed
      And the "plan.internet_module" module is displayed
      And the "plan.landline_module" module is displayed
      And the "plan.tv_module" module is displayed
      And the "travel" card is displayed
      And the "plan_information" module is displayed
      And the "services_list" module is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @regression
  @vivobr
  Scenario Outline: Trio user can access to Plan details page
    Given user has a "trio" plan
      And user has a "internet" product
      And user has a "<mobile_landline_product>" product
      And user has a "<landline_tv_product>" product
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan_details_vivinho_icon" icon is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_subtitle" textfield with the "<id_format>" format is displayed
      And the "plan.<mobile_landline_product>" module is displayed
      And the "plan.internet_module" module is displayed
      And the "plan.<landline_tv_product>" module is displayed
      And the "travel" card is displayed
      And the "plan_information" module is displayed
      And the "services_list" module is displayed

    Examples:
          | mobile_landline_product | landline_tv_product | id_format             | jira_id      |
          | mobile_line             | landline            | \(\d{2}\) \d{5}-\d{4} | QANOV-450787 |
          | mobile_line             | tv                  | \(\d{2}\) \d{5}-\d{4} | QANOV-450788 |
          | landline                | tv                  | (\w+( )?)+, \d+       | QANOV-450789 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @regression
  @vivobr
  Scenario Outline: Duo user can access to Plan details page
    Given user has a "duo" plan
      And user has a "internet" product
      And user has a "<landline_tv_product>" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan_details_vivinho_icon" icon is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_subtitle" textfield with the "(\w+( )?)+, \d+" format is displayed
      And the "plan.internet_module" module is displayed
      And the "plan.<landline_tv_product>" module is displayed
      And the "travel" card is displayed
      And the "plan_information" module is displayed
      And the "services_list" module is displayed

    Examples:
          | landline_tv_product | jira_id      |
          | landline            | QANOV-450790 |
          | tv                  | QANOV-450791 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @smoke @vivobr
  Scenario Outline: A <account_type> user with only one product in plan can access to Plan details page
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan_details_vivinho_icon" icon is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_subtitle" textfield with the "\(\d{2}\) \d{5}-\d{4}" format is displayed
      And the "plan.mobile_allowances" module is displayed
      And the "travel" card is displayed
      And the "plan_information" module is displayed
      And the "services_list" module is displayed

    Examples:
          | account_type                  | ber | jira_id      | parent_test_plan |
          | beatrix                       | ber | QANOV-450792 | QANOV-437472     |
          | multivivo                     |     | QANOV-450793 | QANOV-437472     |
          | legacy control;legacy postpay |     | QANOV-450794 | QANOV-423279     |
          | jeri control; jeri postpay    |     | QANOV-450795 | QANOV-423279     |
          | control_n                     |     | QANOV-450796 | QANOV-423279     |

  @jira.QANOV-450797 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke
  @vivobr
  Scenario: A legacy prepay;jeri prepay user with only one product in plan can access to Plan details page
    Given user has a "legacy prepay;jeri prepay" account type
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan_details_vivinho_icon" icon is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_subtitle" textfield with the "\(\d{2}\) \d{5}-\d{4}" format is displayed
      And the "plan.mobile_allowances" module is displayed
      And the "balance" module is displayed
      And the "plan_information" module is displayed
      And the "services_list" module is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario Outline: A <product_plan> standalone user with only one product in plan can access to Plan details page
    Given user has a "convegente" account type
      And user has a "<product_plan>" plan
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
     Then the "Plan Details" page is displayed
      And the "plan_details_name" textfield is displayed
      And the "plan_details_subtitle" textfield with the "(\w+( )?)+, \d+" format is displayed
      And the "plan.<product_plan>" module is displayed
      And the "plan_information" module is displayed
      And the "services_list" module is displayed

    Examples:
          | product_plan | jira_id      |
          | internet     | QANOV-450798 |
          | landline     | QANOV-450799 |
          | tv           | QANOV-450800 |

  @jira.QANOV-450801 @TBD @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile
  @smoke @vivobr
  Scenario: A mobile_line product user can access to product detail screen
    Given user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
      And clicks on the "plan.mobile_allowances" section
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Plan Details" page is displayed

  @jira.QANOV-450802 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: User with less than 1GB can see commercial module
    Given user has a "mobile_line" product
      And user has "<=1" GB of the "data" allowance in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Assinatura" page
     When clicks on the "plans" card
      And the "Plan Details" page is displayed
     Then the "commercial_module" module is displayed
      And the "commercial_module.icon" icon is displayed
      And the "commercial_module.title" textfield is displayed
      And the "commercial_module.label" tag is displayed
      And the "commercial_module.information" textfield is displayed
