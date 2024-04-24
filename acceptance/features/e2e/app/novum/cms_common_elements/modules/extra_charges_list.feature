# -*- coding: utf-8 -*-
@jira.QANOV-410843
Feature: Extra Charges List


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.6 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_<type>
  Scenario Outline: A user can see an Extra Charges List module for <type>
    To be executed in QA
    Given user has "<recent_charge>" recent charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is displayed
      And the elements in the "extra_charges_list.dates" list are ordered by date descendant
      And each element in the "extra_charges_list.events" list has the "type_of_<type>" textfield with the "<charge_format>" format

    Examples:
          | type | recent_charge | charge_format                      | jira_id      |
          | data | data          | .*Data.*                           | QANOV-410844 |
          | call | minutes       | .*(Call\|call\|Premium services).* | QANOV-410845 |
          | sms  | sms           | .*SMS.*                            | QANOV-410846 |
          | mms  | mms           | .*MMS.*                            | QANOV-410847 |

  @jira.QANOV-410848 @android @automatic @ios @jira.cv.14.6 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_data_call_sms_mms
  Scenario: A user can see an Extra Charges List module for all units
    To be executed in QA
    Given user has "any" recent charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is displayed
      And the elements in the "extra_charges_list.dates" list are ordered by date descendant
      And any element in the "extra_charges_list.events" list has the "type_of_data" textfield with the ".*Data.*" format
      And any element in the "extra_charges_list.events" list has the "type_of_call" textfield with the ".*(Call|call).*" format
      And any element in the "extra_charges_list.events" list has the "type_of_sms" textfield with the ".*SMS.*" format
      And any element in the "extra_charges_list.events" list has the "type_of_mms" textfield with the ".*MMS.*" format

  @jira.QANOV-410849 @android @automatic @ios @jira.cv.14.6 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_data_call_sms_mms
  Scenario: A user can see an Extra Charges List empty case with default fields
    To be executed in QA
    Given user has "none" recent charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is not displayed
      And the "src" property of the "extra_charges_list.empty_case.icon" element matches "[CONTEXT:extra_charges_list_of_events.emptyStateCMSIcon.url]" text
      And the "extra_charges_list.empty_case.title" textfield with "[CONTEXT:extra_charges_list_of_events.emptyCaseTitle]" text is displayed
      And the "extra_charges_list.empty_case.description" textfield is not displayed

  @jira.QANOV-410850 @android @automatic @ios @jira.cv.14.6 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_with_empty_case_description
  Scenario: A user can see an Extra Charges List empty case with description
    To be executed in QA
    Given user has "none" recent charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is not displayed
      And the "src" property of the "extra_charges_list.empty_case.icon" element matches "[CONTEXT:extra_charges_list_of_events.emptyStateCMSIcon.url]" text
      And the "extra_charges_list.empty_case.title" textfield with "[CONTEXT:extra_charges_list_of_events.emptyCaseTitle]" text is displayed
      And the "extra_charges_list.empty_case.description" textfield with "[CONTEXT:extra_charges_list_of_events.emptyCaseDescription]" text is displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_<type>_with_date_strategy
  Scenario Outline: A user can see an Extra Charges List module for <type> with and date strategy for billing cycle
    To be executed in QA
    Given user has a "<charge_type>" product with extra charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is displayed
      And the elements in the "extra_charges_list.dates" list are ordered by date descendant
      And each element in the "extra_charges_list.events" list has the "type_of_<type>" textfield with the "<charge_format>" format

    Examples:
          | type     | charge_type | charge_format | jira_id      |
          | data     | data        | .*Datos.*     | QANOV-410851 |
          | call     | minutes     | .*Llamada.*   | QANOV-410852 |
          | sms      | messages    | .*SMS.*       | QANOV-410853 |
          | mms      | mms         | .*MMS.*       | QANOV-410854 |
          | movement | others      | .*Pagos*.     | QANOV-410855 |

  @jira.QANOV-410856 @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_all_units_with_date_strategy
  Scenario: A user can see an Extra Charges List module for all units with and date strategy for billing cycle
    To be executed in QA
    Given user has a "data" product with extra charges
      And user has a "minutes" product with extra charges
      And user has a "messages" product with extra charges
      And user has a "mms" product with extra charges
      And user has a "others" product with extra charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is displayed
      And the elements in the "extra_charges_list.dates" list are ordered by date descendant
      And any element in the "extra_charges_list.events" list has the "type_of_data" textfield with the ".*Datos.*" format
      And any element in the "extra_charges_list.events" list has the "type_of_call" textfield with the ".*Llamada.*" format
      And any element in the "extra_charges_list.events" list has the "type_of_sms" textfield with the ".*SMS.*" format
      And any element in the "extra_charges_list.events" list has the "type_of_mms" textfield with the ".*MMS.*" format
      And any element in the "extra_charges_list.events" list has the "type_of_movement" textfield with the ".*Pagos.*" format

  @jira.QANOV-410857 @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_all_units_with_date_strategy
  Scenario: A user can see an Extra Charges List module configured with date strategy for billing cycle
    To be executed in QA
    Given user has a "any" product with extra charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is displayed
      And the elements in the "extra_charges_list.dates" list are ordered by date descendant
      And the dates for the billing cycle are displayed in the "extra_charges_list.dates" list

  @jira.QANOV-410858 @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_with_date_strategy_last_month
  Scenario: A user can see an Extra Charges List module configured with date strategy for last month
    To be executed in QA
    Given user has a "any" product with extra charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is displayed
      And the elements in the "extra_charges_list.dates" list are ordered by date descendant
      And the dates for last month are displayed in the "extra_charges_list.dates" list

  @jira.QANOV-410859 @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_all_units_with_date_strategy
  Scenario: A user can see an Extra Charges List empty case with default fields and date strategy for billing cycle
    To be executed in QA
    Given user has a "mobile_line" product without extra charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is not displayed
      And the "src" property of the "extra_charges_list.empty_case.icon" element matches "[CONTEXT:extra_charges_list_of_events.emptyStateCMSIcon.url]" text
      And the "extra_charges_list.empty_case.title" textfield with "[CONTEXT:extra_charges_list_of_events.emptyCaseTitle]" text is displayed
      And the "extra_charges_list.empty_case.description" textfield is not displayed

  @jira.QANOV-410860 @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.extra_charges_list_with_empty_case_description_with_date_strategy
  Scenario: A user can see an Extra Charges List empty case with description
    To be executed in QA
    Given user has a "mobile_line" product without extra charges
      And the "Extra Charges List of Events" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the matching subscription
      And waits until the "extra_charges_list" element is present
     Then the "extra_charges_list.events" list is not displayed
      And the "src" property of the "extra_charges_list.empty_case.icon" element matches "[CONTEXT:extra_charges_list_of_events.emptyStateCMSIcon.url]" text
      And the "extra_charges_list.empty_case.title" textfield with "[CONTEXT:extra_charges_list_of_events.emptyCaseTitle]" text is displayed
      And the "extra_charges_list.empty_case.description" textfield with "[CONTEXT:extra_charges_list_of_events.emptyCaseDescription]" text is displayed
