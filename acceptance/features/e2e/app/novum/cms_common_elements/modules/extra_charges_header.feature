# -*- coding: utf-8 -*-
@jira.QANOV-372409
Feature: Extra Charges Header


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.extra_charges_header_<type>
  Scenario Outline: A user can see an Extra Charges Header module for <type>
    To be executed in QA
    Given the "Extra Charges Header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then waits until the "extra_charges_header" element is visible

    Examples:
          | type | jira_id      |
          | data | QANOV-372410 |
          | call | QANOV-372411 |
          | sms  | QANOV-372412 |
          | mms  | QANOV-372413 |

  @jira.QANOV-372414 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.extra_charges_header_all
  Scenario: A user can see an Extra Charges Header module for all units
    To be executed in QA
    Given the "Extra Charges Header" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then waits until the "extra_charges_header" element is visible
