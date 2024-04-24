# -*- coding: utf-8 -*-
@jira.QANOV-400488
Feature: Contract Counters


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.contract_counters
  Scenario Outline: A moves user can see a 'Fusion: Data consumptions of mobile lines' with the default icons
    To be executed in QA
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "activated" status
      And user has "0" mobile lines in "deactivated" status
      And the "Fusion: Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then each element in the "contract_counters.list" list has the "icon" field
     Then each element in the "contract_counters.list" list has the "name" field
      And the "src" property of the "icon" field in all the elements of the "contract_counters.list" carousel contains the "/bundles/" text

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-400489 |
          | o2es    | Future | QANOV-556196 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.contract_counters_activated_lines_icon
  Scenario Outline: A moves user can see a 'Fusion: Data consumptions of mobile lines' with the activated line icon changed
    To be executed in QA
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "activated" status
      And user has "0" mobile lines in "deactivated" status
      And the "Fusion: Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Fusion: Data consumptions of mobile lines" module configured in CMS has the "placeholderIcon" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then the "src" property of the "icon" field in all the elements of the "contract_counters.list" carousel contains the "[CONTEXT:fusion_data_consumptions_of_mobile_lines.placeholderIcon.url]" text

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-400490 |
          | o2es    | Future | QANOV-556197 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can see a 'Fusion: Data consumptions of mobile lines' module with the data consumption displayed
    To be executed in QA
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "activated" status
      And user has "0" mobile lines in "deactivated" status
      And the "Fusion: Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Fusion: Data consumptions of mobile lines" module configured in CMS has the "counterRoundelContentType" field with "CONSUMPTION_TEXT" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then each element in the "contract_counters.list" carousel has the "title" field with "Llevas" text
      And each element in the "contract_counters.list" carousel has the "amount" textfield with the "\d* (MB|GB|KB)" format
      And each element in the "contract_counters.list" carousel has the "subtitle" textfield with the "de \d* (MB|GB|KB)" format

    Examples:
          | product | cv     | jira_id      |
          | moves   | 24.1   | QANOV-556198 |
          | o2es    | Future | QANOV-556199 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can see a 'Fusion: Data consumptions of mobile lines' module with the product type and formatted number
    To be executed in QA
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "activated" status
      And user has "0" mobile lines in "deactivated" status
      And the "Fusion: Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Fusion: Data consumptions of mobile lines" module configured in CMS has the "labelContentType" field with "AGREEMENT_TEXTS" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then each element in the "contract_counters.list" carousel has the "label" field with "Línea móvil" text
      And each element in the "contract_counters.list" carousel has the "line_number" textfield with the "\d{3} \d{2} \d{2} \d{2}" format

    Examples:
          | product | cv     | jira_id      |
          | moves   | 24.1   | QANOV-556200 |
          | o2es    | Future | QANOV-556201 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can see a 'Fusion: Data consumptions of mobile lines' module only with the formatted number
    To be executed in QA
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "activated" status
      And user has "0" mobile lines in "deactivated" status
      And the "Fusion: Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Fusion: Data consumptions of mobile lines" module configured in CMS has the "labelContentType" field with "AGREEMENT_DESCRIPTION_ONLY" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then each element in the "contract_counters.list" carousel has the "label" textfield with the "\d{3} \d{2} \d{2} \d{2}" format

    Examples:
          | product | cv     | jira_id      |
          | moves   | 24.1   | QANOV-556202 |
          | o2es    | Future | QANOV-556203 |

  @jira.QANOV-400491 @android @automatic @ios @jira.cv.14.4 @mobile @qa @regression @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.contract_counters
  Scenario: A vivobr user can see a 'Convergente - Data consumptions of mobile lines' with the default icons
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Convergente - Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then the "src" property of the "icon" field in all the elements of the "contract_counters.list" carousel contains the "/bundles/" text

  @jira.QANOV-400492 @android @automatic @ios @jira.cv.14.4 @mobile @qa @regression @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.contract_counters_activated_lines_icon
  Scenario: A vivobr user can see a 'Convergente - Data consumptions of mobile lines' with the activated line icon changed
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Convergente - Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Convergente - Data consumptions of mobile lines" module configured in CMS has the "placeholderIcon" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then the "src" property of the "icon" field in all the elements of the "contract_counters.list" carousel contains the "[CONTEXT:convergente___data_consumptions_of_mobile_lines.placeholderIcon.url]" text

  @jira.QANOV-556204 @android @ios @jira.cv.24.1 @manual @mobile @smoke @vivobr @old_app
  Scenario: A vivobr user can see a 'Convergente - Data consumptions of mobile lines' module with the data consumption displayed
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Convergente - Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Convergente - Data consumptions of mobile lines" module configured in CMS has the "counterRoundelContentType" field with "CONSUMPTION_TEXT" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then each element in the "contract_counters.list" carousel has the "title" field with "Já usei" text
      And each element in the "contract_counters.list" carousel has the "amount" textfield with the "\d* (MB|GB|KB)" format
      And each element in the "contract_counters.list" carousel has the "subtitle" textfield with the "de \d* (MB|GB|KB)" format

  @jira.QANOV-556205 @android @ios @jira.cv.24.1 @manual @mobile @regression @vivobr @old_app
  Scenario: A vivobr user can see a 'Convergente - Data consumptions of mobile lines' module with the product type and formatted number
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Convergente - Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Fusion: Data consumptions of mobile lines" module configured in CMS has the "labelContentType" field with "AGREEMENT_TEXTS" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then each element in the "contract_counters.list" carousel has the "label" field with "Celular" text
      And each element in the "contract_counters.list" carousel has the "line_number" textfield with the "\(\d\d\) \d{5}-\d{4}" format

  @jira.QANOV-556207 @android @ios @jira.cv.24.1 @manual @mobile @regression @vivobr @old_app
  Scenario: A vivobr user can see a 'Convergente - Data consumptions of mobile lines' module only with the formatted number
    To be executed in QA
    Given user has a "mobile_line" product
      And the "Convergente - Data consumptions of mobile lines" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Fusion: Data consumptions of mobile lines" module configured in CMS has the "labelContentType" field with "AGREEMENT_DESCRIPTION_ONLY" value
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "contract_counters.list" list is displayed
     Then each element in the "contract_counters.list" carousel has the "label" textfield with the "\(\d\d\) \d{5}-\d{4}" format
