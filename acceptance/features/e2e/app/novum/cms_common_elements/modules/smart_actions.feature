# -*- coding: utf-8 -*-
@jira.QANOV-386230
Feature: Smart Actions


  @jira.QANOV-386231 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.moves_add_additional_line_bundle_purchase
  Scenario: A postpay moves user can see a Smart Action module configured with Add additional line and bundle purchase
    To be executed in QA
    Given user has a "postpay" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "smart_action" element is visible
     Then the "smart_action.button_primary" button with "Añadir línea adicional" text is displayed
      And the "smart_action.button_secondary" button with "Gestionar datos" text is displayed

  @jira.QANOV-386232 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.moves_mobile_line_management_add_bundle_tv
  Scenario: A postpay moves user can see a Smart Action module configured with mobile line management and Add Bundle Purchase TV
    To be executed in QA
    Given user has a "postpay" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "smart_action" element is visible
     Then the "smart_action.button_primary" button with "Gestiones de línea" text is displayed
      And the "smart_action.button_secondary" button with "Alta y baja de contenidos" text is displayed

  @jira.QANOV-386233 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.moves_change_tariff
  Scenario: A postpay moves user can see a Smart Action module configured with change tariff
    To be executed in QA
    Given user has a "postpay" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "smart_action" element is visible
     Then the "smart_action.button_primary" button with "Cambiar tarifa" text is displayed
      And the "smart_action.button_secondary" button is not displayed

  @jira.QANOV-386234 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.moves_change_tariff_bundle_purchase_mobile_line_management_add_additional_line
  Scenario: A postpay moves user can see a Smart Action module configured with change tariff and bundle purchase
    To be executed in QA
    Given user has a "postpay" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "smart_action" element is visible
     Then the "smart_action.button_primary" button with "Cambiar tarifa" text is displayed
      And the "smart_action.button_secondary" button with "Gestionar datos" text is displayed

  @jira.QANOV-386235 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.moves_prepay_action
  Scenario: A postpay moves user can not see a Smart Action module configured with a prepay action
    To be executed in QA
    Given user has a "postpay" account type
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
     Then the "smart_action.button_primary" button is not displayed
      And the "smart_action.button_secondary" button is not displayed

  @jira.QANOV-386236 @android @automatic @ios @jira.cv.14.5 @mobile @qa @smoke @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.vivo_smart_action_all
  Scenario: A siebel vivo user can not see a Smart Action module configured with a prepay action
    To be executed in QA
    Given user has a "siebel" plan
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "smart_action" element is visible
     Then the "smart_action.button_primary" button with "Mudar para Vivo Fibra" text is displayed
      And the "smart_action.button_secondary" button is not displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.smart_action_bundle_purchase_data_bundle
  Scenario Outline: A <product> user can see a Smart Action module configured with Bundle purchase action
    To be executed in QA
    Given the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the current agreement
      And waits until the "smart_action" element is visible
     Then the "smart_action.button_primary" button with "Alle Optionen verwalten" text is displayed
      And the "smart_action.button_secondary" button is not displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-417780 |
          | o2de    | 24.0 | QANOV-417781 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.smart_action_usages_no_consumptions
  Scenario Outline: A <product> user can see a Smart Action module configured with Usages no consumption action
    To be executed in QA
    Given user has no allowances
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "smart_action" element is visible
     Then the "smart_action.button_primary" button with "Verbrauchsübersicht anzeigen" text is displayed
      And the "smart_action.button_secondary" button is not displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-417782 |
          | o2de    | 24.0 | QANOV-417783 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.smart_action_bundle_purchase_data_bundle_and_usages_no_consumptions
  Scenario Outline: A <product> user can see a Smart Action module configured with two actions
    To be executed in QA
    Given user has no allowances
      And the "Smart actions" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "smart_action" element is visible
     Then the "smart_action.button_primary" button with "Alle Optionen verwalten" text is displayed
      And the "smart_action.button_secondary" button with "Verbrauchsübersicht anzeigen" text is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.5 | QANOV-417784 |
          | o2de    | 24.0 | QANOV-417785 |
