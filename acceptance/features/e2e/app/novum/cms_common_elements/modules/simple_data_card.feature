# -*- coding: utf-8 -*-
@jira.QANOV-370975
Feature: Simple Data Card


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card
  Scenario Outline: A user can see a Data Card module configured with the default fields
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Card" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "data_card.title" textfield with "[CONTEXT:data_card.title]" text is displayed
      And the "data_card.module_title" textfield is not displayed
      And the "data_card.description" textfield is not displayed
      And the "data_card.tag" textfield is not displayed
      And the "data_card.button_primary" textfield is not displayed
      And the "data_card.link" textfield is not displayed
      And the "data_card.icon" image is not displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-370976 |
          | blaude  | 24.3   | QANOV-622330 |
          | o2de    | 24.3   | QANOV-622331 |
          | o2es    | Future | QANOV-622332 |
          | o2uk    | 24.3   | QANOV-622333 |
          | vivobr  | 24.3   | QANOV-622334 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_<element>
  Scenario Outline: A user can see a Data Card module with a <field>
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Card" module configured in CMS has the "<field>" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "data_card.<element>" textfield with "[CONTEXT:data_card.<field>]" text is displayed

    @jira.link.parent_test_plan.QANOV-525492
    Examples:
          | field          | element        | product | cv     | jira_id      |
          | moduleTitle    | module_title   | moves   | 14.4   | QANOV-370977 |
          | buttonLinkText | link           | moves   | 14.4   | QANOV-370980 |
          | buttonText     | button_primary | moves   | 14.4   | QANOV-370981 |
          | moduleTitle    | module_title   | blaude  | 24.3   | QANOV-622335 |
          | buttonLinkText | link           | blaude  | 24.3   | QANOV-622336 |
          | buttonText     | button_primary | blaude  | 24.3   | QANOV-622337 |
          | moduleTitle    | module_title   | o2de    | 24.3   | QANOV-622338 |
          | buttonLinkText | link           | o2de    | 24.3   | QANOV-622339 |
          | buttonText     | button_primary | o2de    | 24.3   | QANOV-622340 |
          | moduleTitle    | module_title   | o2es    | Future | QANOV-622341 |
          | buttonLinkText | link           | o2es    | Future | QANOV-622342 |
          | buttonText     | button_primary | o2es    | Future | QANOV-622343 |
          | moduleTitle    | module_title   | o2uk    | 24.3   | QANOV-622344 |
          | buttonLinkText | link           | o2uk    | 24.3   | QANOV-622345 |
          | buttonText     | button_primary | o2uk    | 24.3   | QANOV-622346 |
          | moduleTitle    | module_title   | vivobr  | 24.3   | QANOV-622347 |
          | buttonLinkText | link           | vivobr  | 24.3   | QANOV-622348 |
          | buttonText     | button_primary | vivobr  | 24.3   | QANOV-622349 |

    Examples:
          | field       | element     | product | cv     | jira_id      |
          | description | description | moves   | 14.4   | QANOV-370978 |
          | tag         | tag         | moves   | 14.4   | QANOV-370979 |
          | description | description | blaude  | 24.3   | QANOV-622350 |
          | tag         | tag         | blaude  | 24.3   | QANOV-622351 |
          | description | description | o2de    | 24.3   | QANOV-622352 |
          | tag         | tag         | o2de    | 24.3   | QANOV-622353 |
          | description | description | o2es    | Future | QANOV-622354 |
          | tag         | tag         | o2es    | Future | QANOV-622355 |
          | description | description | o2uk    | 24.3   | QANOV-622356 |
          | tag         | tag         | o2uk    | 24.3   | QANOV-622357 |
          | description | description | vivobr  | 24.3   | QANOV-622358 |
          | tag         | tag         | vivobr  | 24.3   | QANOV-622359 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_link
  Scenario Outline: A user can see a Data Card module with a link
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Card" module configured in CMS has the "buttonLinkText" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "data_card.link" textfield with "[CONTEXT:data_card.buttonLinkText]" text is displayed
      And the "data_card.link_chevron" image is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-370980 |
          | blaude  | 24.3   | QANOV-622360 |
          | o2de    | 24.3   | QANOV-622361 |
          | o2es    | Future | QANOV-622362 |
          | o2uk    | 24.3   | QANOV-622363 |
          | vivobr  | 24.3   | QANOV-622364 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_link_without_chevron
  Scenario Outline: A user can see a Data Card module with a link without chevron
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Card" module configured in CMS has the "buttonLinkText" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "data_card.link" textfield with "[CONTEXT:data_card.buttonLinkText]" text is displayed
      And the "data_card.link_chevron" image is not displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.10  | QANOV-527552 |
          | blaude  | 24.3   | QANOV-622365 |
          | o2de    | 24.3   | QANOV-622366 |
          | o2es    | Future | QANOV-622367 |
          | o2uk    | 24.3   | QANOV-622368 |
          | vivobr  | 24.3   | QANOV-622369 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_button_primary
  Scenario Outline: A user can see a Data Card module with a button
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Card" module configured in CMS has the "buttonText" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "data_card.button_primary" textfield with "[CONTEXT:data_card.buttonText]" text is displayed
      And the "data_card.button_icon" image is not displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.10  | QANOV-370981 |
          | blaude  | 24.3   | QANOV-622370 |
          | o2de    | 24.3   | QANOV-622371 |
          | o2es    | Future | QANOV-622372 |
          | o2uk    | 24.3   | QANOV-622373 |
          | vivobr  | 24.3   | QANOV-622374 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_icon
  Scenario Outline: A user can see a Data Card module with a icon
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Card" module configured in CMS has the "icon" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "src" property of the "data_card.icon" element matches "[CONTEXT:data_card.icon.url]" text

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-370982 |
          | blaude  | 24.3   | QANOV-622375 |
          | o2de    | 24.3   | QANOV-622376 |
          | o2es    | Future | QANOV-622377 |
          | o2uk    | 24.3   | QANOV-622378 |
          | vivobr  | 24.3   | QANOV-622379 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_all_fields
  Scenario Outline: A user can see a Data Card module configured with all fields
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "data_card.title" textfield with "[CONTEXT:data_card.title]" text is displayed
      And the "data_card.module_title" textfield with "[CONTEXT:data_card.moduleTitle]" text is displayed
      And the "data_card.description" textfield with "[CONTEXT:data_card.description]" text is displayed
      And the "data_card.tag" textfield with "[CONTEXT:data_card.tag]" text is displayed
      And the "data_card.link" textfield with "[CONTEXT:data_card.buttonLinkText]" text is displayed
      And the "data_card.button_primary" textfield with "[CONTEXT:data_card.buttonText]" text is displayed
      And the "src" property of the "data_card.button_icon" element matches "[CONTEXT:data_card.buttonStartIcon.url]" text
      And the "data_card.module_title" textfield with "[CONTEXT:data_card.moduleTitle]" text is displayed
      And the "src" property of the "data_card.icon" element matches "[CONTEXT:data_card.icon.url]" text

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-370983 |
          | blaude  | 24.3   | QANOV-622380 |
          | o2de    | 24.3   | QANOV-622381 |
          | o2es    | Future | QANOV-622382 |
          | o2uk    | 24.3   | QANOV-622383 |
          | vivobr  | 24.3   | QANOV-622384 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.CMS-3042 @manual @mobile @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_tag_in_<status>_status
  Scenario Outline: A user can see a Data Card module with a tag in status <status>
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Data Card" module configured in CMS has the "tagType" field with "<status>" value
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "tag_data_card" element is present
     Then check that the image "tag_data_card_<status>" is present in the element "tag_data_card" with threshold "0.001"

    Examples:
          | status   | product | cv     | jira_id      |
          | promo    | moves   | 14.4   | QANOV-370984 |
          | active   | moves   | 14.4   | QANOV-370985 |
          | inactive | moves   | 14.4   | QANOV-370986 |
          | success  | moves   | 14.4   | QANOV-370987 |
          | warning  | moves   | 14.4   | QANOV-370988 |
          | error    | moves   | 14.4   | QANOV-370989 |
          | promo    | blaude  | 24.3   | QANOV-622385 |
          | active   | blaude  | 24.3   | QANOV-622386 |
          | inactive | blaude  | 24.3   | QANOV-622387 |
          | success  | blaude  | 24.3   | QANOV-622388 |
          | warning  | blaude  | 24.3   | QANOV-622389 |
          | error    | blaude  | 24.3   | QANOV-622390 |
          | promo    | o2de    | 24.3   | QANOV-622391 |
          | active   | o2de    | 24.3   | QANOV-622392 |
          | inactive | o2de    | 24.3   | QANOV-622393 |
          | success  | o2de    | 24.3   | QANOV-622394 |
          | warning  | o2de    | 24.3   | QANOV-622395 |
          | error    | o2de    | 24.3   | QANOV-622396 |
          | promo    | o2es    | Future | QANOV-622397 |
          | active   | o2es    | Future | QANOV-622398 |
          | inactive | o2es    | Future | QANOV-622399 |
          | success  | o2es    | Future | QANOV-622400 |
          | warning  | o2es    | Future | QANOV-622401 |
          | error    | o2es    | Future | QANOV-622402 |
          | promo    | o2uk    | 24.3   | QANOV-622403 |
          | active   | o2uk    | 24.3   | QANOV-622404 |
          | inactive | o2uk    | 24.3   | QANOV-622405 |
          | success  | o2uk    | 24.3   | QANOV-622406 |
          | warning  | o2uk    | 24.3   | QANOV-622407 |
          | error    | o2uk    | 24.3   | QANOV-622408 |
          | promo    | vivobr  | 24.3   | QANOV-622409 |
          | active   | vivobr  | 24.3   | QANOV-622410 |
          | inactive | vivobr  | 24.3   | QANOV-622411 |
          | success  | vivobr  | 24.3   | QANOV-622412 |
          | warning  | vivobr  | 24.3   | QANOV-622413 |
          | error    | vivobr  | 24.3   | QANOV-622414 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-525492 @mobile @qa
  @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_preconfigured_url_in_button
  Scenario Outline: A user clicks on the Data Card button when the it is configured to open a preconfigured target
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "data_card" configured in CMS has the "buttonUrl" field with a "preconfigured" link to "appointmentBookingUrl" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "data_card.button_primary" button
     Then the internal webview with "Movistar" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-370990 |
          | blaude  | 24.3   | QANOV-622415 |
          | o2de    | 24.3   | QANOV-622416 |
          | o2es    | Future | QANOV-622417 |
          | o2uk    | 24.3   | QANOV-622418 |
          | vivobr  | 24.3   | QANOV-622419 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_preconfigured_url_in_button
  Scenario Outline: A user clicks on the Data Card button when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "data_card" configured in CMS has the "buttonUrl" field with a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "data_card.button_primary" button
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv     | link                  | destination_url                                                 | jira_id      |
          | moves   | 14.4   | appointmentBookingUrl | [CONF:web_url_base]/pages/appointment-booking/                  | QANOV-370991 |
          | blaude  | 24.3   | NAME_CHANGE           | [CONF:web_url_base]/pages/change-name                           | QANOV-622420 |
          | o2de    | 24.3   | NAME_CHANGE           | [CONF:web_url_base]/pages/change-name                           | QANOV-622421 |
          | o2es    | Future | TBD                   | TBD                                                             | QANOV-622422 |
          | o2uk    | 24.3   | priority              | https://priority.o2.co.uk/offers                                | QANOV-622423 |
          | vivobr  | 24.3   | services-list         | [CONF:web_url_base]/pages/services-list/?web_view_mode=settings | QANOV-622424 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-525492 @mobile @qa
  @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_manual_url_in_button
  Scenario Outline: A user clicks on the Data Card button when it is configured to open a manual URL
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "data_card" configured in CMS has the "buttonUrl" field with a "url" link to "[CONTEXT:data_card.buttonUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "data_card.button_primary" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.3   | QANOV-370992 |
          | blaude  | 24.3   | QANOV-622425 |
          | o2de    | 24.3   | QANOV-622426 |
          | o2es    | Future | QANOV-622427 |
          | o2uk    | 24.3   | QANOV-622428 |
          | vivobr  | 24.3   | QANOV-622429 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_manual_url_in_button
  Scenario Outline: A user clicks on the Data Card button when it is configured to open a manual URL in webapp
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "data_card" configured in CMS has the "buttonUrl" field with a "url" link to "[CONTEXT:data_card.buttonUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "data_card.button_primary" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.3   | QANOV-370993 |
          | blaude  | 24.3   | QANOV-622430 |
          | o2de    | 24.3   | QANOV-622431 |
          | o2es    | Future | QANOV-622432 |
          | o2uk    | 24.3   | QANOV-622433 |
          | vivobr  | 24.3   | QANOV-622434 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-525492 @mobile @qa
  @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_preconfigured_url_in_link
  Scenario Outline: A user clicks on the Data Card link when it is configured to open a preconfigured target
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "data_card" configured in CMS has the "buttonLinkUrl" field with a "preconfigured" link to "appointmentBookingUrl" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "data_card.link" button
     Then the internal webview with "Movistar" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.4   | QANOV-370994 |
          | blaude  | 24.3   | QANOV-622435 |
          | o2de    | 24.3   | QANOV-622436 |
          | o2es    | Future | QANOV-622437 |
          | o2uk    | 24.3   | QANOV-622438 |
          | vivobr  | 24.3   | QANOV-622439 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_preconfigured_url_in_link
  Scenario Outline: A user clicks on the Data Card link when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "data_card" configured in CMS has the "buttonLinkUrl" field with a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "data_card.link" button
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv     | link                  | destination_url                                                 | jira_id      |
          | moves   | 14.4   | appointmentBookingUrl | [CONF:web_url_base]/pages/appointment-booking/                  | QANOV-370995 |
          | blaude  | 24.3   | NAME_CHANGE           | [CONF:web_url_base]/pages/change-name                           | QANOV-622440 |
          | o2de    | 24.3   | NAME_CHANGE           | [CONF:web_url_base]/pages/change-name                           | QANOV-622441 |
          | o2es    | Future | TBD                   | TBD                                                             | QANOV-622442 |
          | o2uk    | 24.3   | priority              | https://priority.o2.co.uk/offers                                | QANOV-622443 |
          | vivobr  | 24.3   | services-list         | [CONF:web_url_base]/pages/services-list/?web_view_mode=settings | QANOV-622444 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-525492 @mobile @qa
  @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_manual_url_in_link
  Scenario Outline: A user clicks on the Data Card link when it is configured to open a manual URL
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "data_card" configured in CMS has the "buttonLinkUrl" field with a "url" link to "[CONTEXT:data_card.buttonLinkUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "data_card.link" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.3   | QANOV-370996 |
          | blaude  | 24.3   | QANOV-622445 |
          | o2de    | 24.3   | QANOV-622446 |
          | o2es    | Future | QANOV-622447 |
          | o2uk    | 24.3   | QANOV-622448 |
          | vivobr  | 24.3   | QANOV-622449 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_data_card_with_manual_url_in_link
  Scenario Outline: A user clicks on the Data Card link when it is configured to open a manual URL in webapp
    To be executed in QA
    Given the "Data Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "data_card" configured in CMS has the "buttonLinkUrl" field with a "url" link to "[CONTEXT:data_card.buttonLinkUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "data_card.link" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.3   | QANOV-370997 |
          | blaude  | 24.3   | QANOV-622450 |
          | o2de    | 24.3   | QANOV-622451 |
          | o2es    | Future | QANOV-622452 |
          | o2uk    | 24.3   | QANOV-622453 |
          | vivobr  | 24.3   | QANOV-622454 |
