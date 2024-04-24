# -*- coding: utf-8 -*-
@jira.QANOV-405233
Feature: Event History Total


  @jira.<jira_id> @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @sanity @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_<type>_last_month_no_units
  Scenario Outline: A moves user can see an Event History Total module for <type> events in the last month and not showing the consumed units
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "event_history_total.module_title" textfield with "Title" text is displayed
      And the "event_history_total.cards" list has "1" elements
      And the element in "0" position in the "event_history_total.cards" list has the "title" field with the "[LANG:cms_modules.event_history_total.extra_charges]" text

    Examples:
          | type     | jira_id      |
          | data     | QANOV-405234 |
          | call     | QANOV-405235 |
          | sms      | QANOV-405236 |
          | mms      | QANOV-405237 |
          | movement | QANOV-405238 |
          | expense  | QANOV-405239 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_<type>_last_month
  Scenario Outline: A moves user can see an Event History Total module for <type> events in the last month and showing the consumed units
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "event_history_total.module_title" textfield with "Title" text is displayed
      And the "event_history_total.cards" list has "2" elements
      And the element in "0" position in the "event_history_total.cards" list has the "title" field with the "[LANG:cms_modules.event_history_total.have_consumed]" text
      And the element in "1" position in the "event_history_total.cards" list has the "title" field with the "[LANG:cms_modules.event_history_total.extra_charges]" text

    Examples:
          | type     | jira_id      |
          | data     | QANOV-405240 |
          | call     | QANOV-405241 |
          | sms      | QANOV-405242 |
          | mms      | QANOV-405243 |
          | movement | QANOV-405244 |
          | expense  | QANOV-405245 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_<type>_bylling_cycle_no_units
  Scenario Outline: A moves user can see an Event History Total module for <type> events in the bylling cycle and not showing the consumed units
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "event_history_total.module_title" textfield with "Title" text is displayed
      And the "event_history_total.cards" list has "1" elements
      And the element in "0" position in the "event_history_total.cards" list has the "title" field with the "[LANG:cms_modules.event_history_total.extra_charges]" text

    Examples:
          | type     | jira_id      |
          | data     | QANOV-405246 |
          | call     | QANOV-405247 |
          | sms      | QANOV-405248 |
          | mms      | QANOV-405249 |
          | movement | QANOV-405250 |
          | expense  | QANOV-405251 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.6 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_<type>_bylling_cycle
  Scenario Outline: A moves user can see an Event History Total module for <type> events in the bylling cycle and showing the consumed units
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "event_history_total.module_title" textfield with "Title" text is displayed
      And the "event_history_total.cards" list has "2" elements
      And the element in "0" position in the "event_history_total.cards" list has the "title" field with the "[LANG:cms_modules.event_history_total.have_consumed]" text
      And the element in "1" position in the "event_history_total.cards" list has the "title" field with the "[LANG:cms_modules.event_history_total.extra_charges]" text

    Examples:
          | type     | jira_id      |
          | data     | QANOV-405252 |
          | call     | QANOV-405253 |
          | sms      | QANOV-405254 |
          | mms      | QANOV-405255 |
          | movement | QANOV-405256 |
          | expense  | QANOV-405257 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.6 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_<type>
  Scenario Outline: A o2uk user can see an Event History Total module for <type> events
    For O2UK the module shows the consumed units by default
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "event_history_total.module_title" textfield with "Title" text is displayed
      And the "event_history_total.cards" list has "2" elements
      And the element in "0" position in the "event_history_total.cards" list has the "title" field with the "[LANG:cms_modules.event_history_total.have_consumed]" text
      And the element in "1" position in the "event_history_total.cards" list has the "title" field with the "[LANG:cms_modules.event_history_total.extra_charges]" text

    Examples:
          | type | jira_id      |
          | data | QANOV-405258 |
          | call | QANOV-405259 |
          | sms  | QANOV-405260 |
          | mms  | QANOV-405261 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.6 @mobile @moves @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_<fixture_event_type>
  Scenario Outline: A user can see an Event History Total module for <event> events with the correct consumed units
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the element in "0" position in the "event_history_total.cards" list has the "value" field with the "<regex>" format
      And the element in "1" position in the "event_history_total.cards" list has the "value" field with the "[LANG:cms_modules.event_history_total.extra_charges_regex]" format

    Examples:
          | event       | fixture_event_type | regex                                                | jira_id      |
          | SMS and MMS | sms_mms            | [LANG:cms_modules.event_history_total.sms_mms_regex] | QANOV-405262 |
          | calls       | call_bylling_cycle | ^(\d+h)?(\s)?(\d+min)?(\s)?(\d+s)?                   | QANOV-405263 |
          | data        | data_bylling_cycle | ^\d+(,\d+)? (GB\|MB)                                 | QANOV-405264 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.6 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_url_extra_charges
  Scenario Outline: A <product> user can see an Event History Total module with an url in the extra charges configured
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "1" index in the "event_history_total.cards" list has the "link" field whose "href" attribute contains the "https://www.google.com" value

    Examples:
          | product | jira_id      |
          | moves   | QANOV-405265 |
          | o2uk    | QANOV-405266 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.6 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_url_title
  Scenario Outline: A <product> user can see an Event History Total module with a title info url configured
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "event_history_total.title_url_link" link is displayed
      And the "href" property of the "event_history_total.title_url_link" element contains the "https://www.google.com/" text
      And the element in "1" position in the "event_history_total.cards" list has not the "link" field

    Examples:
          | product | jira_id      |
          | moves   | QANOV-405267 |
          | o2uk    | QANOV-405268 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.6 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_title_preconfigured_url
  Scenario Outline: A <product> user can see an Event History Total module with a preconfigured url in the title
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "event_history_total.title_url_link" link is displayed
      And the "href" property of the "event_history_total.title_url_link" element contains the "<expected_link_text>" text
      And the element in "1" position in the "event_history_total.cards" list has not the "link" field

    Examples:
          | product | expected_link_text   | jira_id      |
          | moves   | purchase-mobile-line | QANOV-405269 |
          | o2uk    | add-boltons          | QANOV-405270 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.6 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.event_history_total_extra_charges_preconfigured_url
  Scenario Outline: A <product> user can see an Event History Total module with a preconfigured url in the extra charges
    To be executed in QA
    Given the "Consumptions and extra charges panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumptions and extra charges panel" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
      And waits until the "event_history_total" element is visible
     Then the "event_history_total" module is displayed
      And the "1" index in the "event_history_total.cards" list has the "link" field whose "href" attribute contains the "<expected_link_text>" value

    Examples:
          | product | expected_link_text   | jira_id      |
          | moves   | purchase-mobile-line | QANOV-405271 |
          | o2uk    | add-boltons          | QANOV-405273 |
