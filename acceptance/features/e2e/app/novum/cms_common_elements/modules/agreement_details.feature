# -*- coding: utf-8 -*-
@jira.QANOV-392848
Feature: Agreement details


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @sanity @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details
  Scenario Outline: A <product> user can see the agreement details CMS module when configured with the default fields
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     Then the "agreement_details.title" textfield is displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed
      And the "agreement_details.button_primary" button is not displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-392849 |

    @old_app
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-392850 |

  @jira.<jira_id> @automatic @<product> @android @ios @jira.cv.14.5 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_germany
  Scenario Outline: A <product> user can see the agreement details CMS module when configured with the default fields
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     Then the "agreement_details.title" textfield is displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed
      And the "agreement_details.button_primary" button is not displayed

    Examples:
          | product | jira_id      |
          | o2de    | QANOV-392851 |
          | blaude  | QANOV-392852 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_title
  Scenario Outline: A <product> user can see the agreement details CMS module when configured with a module title
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" module configured in CMS has the "titleOverride" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     Then the "agreement_details.module_title" textfield with "QA module title" text is displayed
      And the "agreement_details.title" textfield is displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed

    Examples:
          | product | jira_id      |
          | moves   | QANOV-392853 |

    @old_app
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-392854 |

  @jira.<jira_id> @automatic @<product> @android @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_title_germany
  Scenario Outline: A <product> user can see the agreement details CMS module when configured with a module title
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" module configured in CMS has the "titleOverride" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     Then the "agreement_details.module_title" textfield with "QA module title" text is displayed
      And the "agreement_details.title" textfield is displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed

    Examples:
          | product | jira_id      |
          | o2de    | QANOV-392855 |
          | blaude  | QANOV-392856 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @jira.link.detects.CMS-3282 @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_<smart_action>_smart_action
  Scenario Outline: A <product> user can see the agreement details CMS module when configured with a <smart_action> smart action for the line
    To be executed in QA
    Given user has a "<account_type>" account type
      And user has a "<product_type>" product
      And the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     When waits until the "agreement_details.button_primary" element is visible
     Then the "agreement_details.title" textfield is displayed
      And the "agreement_details.button_primary" button with "<button_text>" text is displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed

    Examples:
          | product | account_type    | product_type | smart_action    | button_text           | jira_id      |
          | moves   | postpay         | mobile_line  | line_management | Gestiones de línea    | QANOV-392857 |

    @old_app
    Examples:
          | product | account_type    | product_type | smart_action    | button_text           | jira_id      |
          | vivobr  | beatrix control | mobile_line  | vivo_fibra      | Mudar para Vivo Fibra | QANOV-392858 |

  @jira.<jira_id> @automatic @<product> @android @ios @jira.cv.14.5 @jira.link.detects.CMS-3282 @mobile @qa @smoke
  @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_change_tariff_prepay_smart_action
  Scenario Outline: A <product> user can see the agreement details CMS module when configured with compatible smart action for the line
    To be executed in QA
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" module configured in CMS has the "smartActions" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "agreement_details.title" textfield is displayed
      And the "agreement_details.button_primary" button with "Tarif wechseln" text is displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed

    Examples:
          | product | jira_id      |
          | o2de    | QANOV-392859 |
          | blaude  | QANOV-392860 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_<smart_action>_smart_action
  Scenario Outline: A <product> user can see the agreement details CMS module without the button when configured with a <smart_action> smart action for the line
    To be executed in QA
    Given user has a "<account_type>" account type
      And user has a "<product_type>" product
      And the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "agreement_details.title" textfield is displayed
      And the "agreement_details.button_primary" button is not displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed

    Examples:
          | product | account_type    | product_type | smart_action         | jira_id      |
          | moves   | postpay         | mobile_line  | prepay_upgrade       | QANOV-392861 |

    @old_app
    Examples:
          | product | account_type    | product_type | smart_action         | jira_id      |
          | vivobr  | beatrix postpay | mobile_line  | control_upgrade_plan | QANOV-392862 |

  @jira.<jira_id> @automatic @<product> @android @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_change_tariff_postpay_smart_action
  Scenario Outline: A <product> user can see the agreement details CMS module without the button when configured with a non-compatible smart action for the line
    To be executed in QA
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" module configured in CMS has the "smartActions" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "agreement_details.title" textfield is displayed
      And the "agreement_details.button_primary" button is not displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed

    Examples:
          | product | jira_id      |
          | o2de    | QANOV-392863 |
          | blaude  | QANOV-392864 |

  @jira.QANOV-392865 @android @automatic @ios @jira.cv.14.5 @jira.link.detects.CMS-3282 @mobile @moves @qa @regression
  @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_mobile_postpay_smart_actions
  Scenario: A moves user can see the agreement details CMS module with 1 button when configured with several smart actions for the line
    To be executed in QA
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     When waits until the "agreement_details.button_primary" element is visible
     Then the "agreement_details.title" textfield is displayed
      And the "agreement_details.button_primary" button with "Gestiones de línea" text is displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed

  @jira.QANOV-392866 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_icon
  Scenario: A moves user can see the agreement details CMS module with an image
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" module configured in CMS has the "cardIcon" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     Then the "agreement_details.icon" icon is displayed
      And the "agreement_details.title" textfield is displayed
      And the "agreement_details.link" link with "[LANG:account.tariff.card_module.link]" text is displayed

  @jira.QANOV-392867 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_url_text
  Scenario: A moves user can see the agreement details CMS module with a changed url text
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" module configured in CMS has the "buttonLinkText" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     Then the "agreement_details.title" textfield is displayed
      And the "agreement_details.link" link with "QA link" text is displayed

  @jira.QANOV-392868 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_manual_url
  Scenario: A moves user can open the agreement details CMS module link with a manual configuration in external mode
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" module configured in CMS has the "buttonLinkText" filled
      And the "agreement-details" module configured in CMS has the "buttonLinkAccountUrl" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     When clicks on the "agreement_details.link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules By Product" page is displayed

  @jira.QANOV-392869 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_preconfigured_url
  Scenario: A moves user can open the agreement details CMS module link with a preconfigured configuration
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" configured in CMS has the "buttonLinkAccountUrl" field with a "preconfigured" link to "invoices_list" destination
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     When clicks on the "agreement_details.link" link
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules By Product" page is displayed

  @jira.QANOV-392870 @automatic @jira.cv.14.5 @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_manual_url
  Scenario: A moves user can open the agreement details CMS module link with a manual configuration in external mode
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" module configured in CMS has the "buttonLinkText" filled
      And the "agreement-details" module configured in CMS has the "buttonLinkAccountUrl" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     When clicks on the "agreement_details.link" link
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules By Product" modular page is displayed

  @jira.QANOV-392871 @automatic @jira.cv.14.5 @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.agreement_details_with_preconfigured_url
  Scenario: A moves user can open the agreement details CMS module link with a preconfigured configuration
    To be executed in QA
    Given the "agreement-details" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "agreement-details" configured in CMS has the "buttonLinkAccountUrl" field with a "preconfigured" link to "invoices_list" destination
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "any" product
     When clicks on the "agreement_details.link" link
     Then the current URL contains "/consumptions/modular-screen/invoices/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules By Product" modular page is displayed
