# -*- coding: utf-8 -*-
@jira.QANOV-344613
Feature: Dynamic Content Empty Case


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.3 @mobile @qa @smoke @webapp
  @fixture.cms.dynamic_content.empty_case
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see a Dynamic Content Empty Case module configured with the default fields
    To be executed in QA
    Given the "Empty case: Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case: Dynamic Content" module has the "Empty case" dynamic content type
      And the "Empty case: Dynamic Content" module configured in CMS has the "title" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_empty_case.title" textfield with "[CONTEXT:empty_case_dynamic_content.title]" text is displayed
      And the "dynamic_content_empty_case.description" textfield is not displayed
      And the "dynamic_content_empty_case.button" button is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-344614 |
          | o2uk    | QANOV-344615 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.3 @mobile @qa @regression @webapp
  @fixture.cms.dynamic_content.empty_case_with_subtitle
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see a Dynamic Content Empty Case module with a description configured
    To be executed in QA
    Given the "Empty case: Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case: Dynamic Content" module has the "Empty case" dynamic content type
      And the "Empty case: Dynamic Content" module configured in CMS has the "subtitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_empty_case.title" textfield with "[CONTEXT:empty_case_dynamic_content.title]" text is displayed
      And the "dynamic_content_empty_case.description" textfield with "[CONTEXT:empty_case_dynamic_content.subtitle]" text is displayed
      And the "dynamic_content_empty_case.button" button is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-344616 |
          | o2uk    | QANOV-344617 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.3 @mobile @qa @regression @webapp
  @fixture.cms.dynamic_content.empty_case_with_button
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see a Dynamic Content Empty Case module with a button configured
    To be executed in QA
    Given the "Empty case: Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case: Dynamic Content" module has the "Empty case" dynamic content type
      And the "Empty case: Dynamic Content" module configured in CMS has the "action" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_empty_case.title" textfield with "[CONTEXT:empty_case_dynamic_content.title]" text is displayed
      And the "dynamic_content_empty_case.description" textfield is not displayed
      And the "dynamic_content_empty_case.button" button with "[CONTEXT:empty_case_dynamic_content.action.text]" text is displayed
      And the "dynamic_content_empty_case.image" image is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-344618 |
          | o2uk    | QANOV-344619 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.3 @mobile @qa @regression @webapp
  @fixture.cms.dynamic_content.empty_case_with_image
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user can see a Dynamic Content Empty Case module with a image configured
    To be executed in QA
    Given the "Empty case: Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case: Dynamic Content" module has the "Empty case" dynamic content type
      And the "Empty case: Dynamic Content" module configured in CMS has the "imageUrl" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "dynamic_content_empty_case.title" textfield with "[CONTEXT:empty_case_dynamic_content.title]" text is displayed
      And the "dynamic_content_empty_case.description" textfield is not displayed
      And the "dynamic_content_empty_case.button" button is not displayed
      And the "style" property of the "dynamic_content_empty_case.image" element contains the "[CONTEXT:empty_case_dynamic_content.imageUrl]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-344620 |
          | o2uk    | QANOV-344621 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.3 @mobile @qa @regression
  @fixture.cms.dynamic_content.empty_case_with_button
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user clicks on the Dynamic Content Empty Case button
    To be executed in QA
    Given the "Empty case: Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case: Dynamic Content" module has the "Empty case" dynamic content type
      And the "Empty case: Dynamic Content" module configured in CMS has the "action" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "dynamic_content_empty_case.button" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-344622 |
          | o2uk    | QANOV-344623 |

  @jira.<jira_id> @<product> @automatic @jira.cv.14.3 @web @qa @regression @webapp
  @fixture.cms.dynamic_content.empty_case_with_button
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.dynamic_content
  Scenario Outline: A user clicks on the Dynamic Content Empty Case button in webapp
    To be executed in QA
    Given the "Empty case: Dynamic Content" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Empty case: Dynamic Content" module has the "Empty case" dynamic content type
      And the "Empty case: Dynamic Content" module configured in CMS has the "action" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "dynamic_content_empty_case.button" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-344624 |
          | o2uk    | QANOV-344625 |
