# -*- coding: utf-8 -*-
@jira.QANOV-376941
Feature: Plan data card


  @jira.QANOV-376942 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @sanity @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card
  Scenario: A user can see a Plan data card module configured with the default fields
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Plan Card" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "plan_data_card.module_title" textfield is not displayed
      And the "plan_data_card.description" textfield is not displayed
      And the "plan_data_card.button_primary" textfield is not displayed
      And the "plan_data_card.link" textfield is not displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card_with_<element>
  Scenario Outline: A user can see a Plan data card module configured with a <field>
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Plan Card" module configured in CMS has the "<field>" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "plan_data_card.<element>" textfield with "[CONTEXT:plan_card.<field>]" text is displayed

    Examples:
          | element        | field          | jira_id      |
          | module_title   | moduleTitle    | QANOV-376943 |
          | link           | buttonLinkText | QANOV-376944 |
          | button_primary | buttonText     | QANOV-376945 |

  @jira.QANOV-376946 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card_with_description
  Scenario: A user can see a Plan data card module configured with a description
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Plan Card" module configured in CMS has the "description" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "plan_data_card.description" textfield is displayed

  @jira.QANOV-376947 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card_with_icon
  Scenario: A user can see a Plan data card module with a icon
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Plan Card" module configured in CMS has the "cardIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "src" property of the "plan_data_card.icon" element matches "[CONTEXT:plan_card.cardIcon.url]" text

  @jira.QANOV-376948 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card_with_all_fields
  Scenario: A user can see a Plan data card module configured with all fields
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And the "plan_data_card.module_title" textfield with "[CONTEXT:plan_card.moduleTitle]" text is displayed
      And the "plan_data_card.description" textfield is displayed
      And the "plan_data_card.link" textfield with "[CONTEXT:plan_card.buttonLinkText]" text is displayed
      And the "plan_data_card.button_primary" textfield with "[CONTEXT:plan_card.buttonText]" text is displayed
      And the "plan_data_card.module_title" textfield with "[CONTEXT:plan_card.moduleTitle]" text is displayed
      And the "src" property of the "plan_data_card.icon" element matches "[CONTEXT:plan_card.cardIcon.url]" text

  @jira.<jira_id> @automatic @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card_with_preconfigured_url_in_<element>
  Scenario Outline: A user clicks on the Plan data card module <element> when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Plan Card" configured in CMS has the "<field>" field with a "preconfigured" link to "appointmentBookingUrl" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "plan_data_card.<element>" button
     Then the current URL is "[CONF:web_url_base]/pages/appointment-booking/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | element        | field                | jira_id      |
          | button_primary | buttonAccountUrl     | QANOV-376949 |
          | link           | buttonLinkAccountUrl | QANOV-376950 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card_with_preconfigured_url_in_<element>
  Scenario Outline: A user clicks on the Plan data card module <element> when it is configured to open a preconfigured target
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "plan_card" configured in CMS has the "<field>" field with a "preconfigured" link to "appointmentBookingUrl" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "plan_data_card.<element>" button
     Then the internal webview with "Movistar" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | element        | field                | jira_id      |
          | button_primary | buttonAccountUrl     | QANOV-376951 |
          | link           | buttonLinkAccountUrl | QANOV-376952 |

  @jira.<jira_id> @automatic @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card_with_<element>
  Scenario Outline: A user clicks on the Plan data card module <element> when it is configured to open a manual target in webapp
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "plan_card" configured in CMS has the "<field>" field with a "url" link to "[CONTEXT:plan_card.<field>.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "plan_data_card.<element>" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | element        | field                | jira_id      |
          | button_primary | buttonAccountUrl     | QANOV-376953 |
          | link           | buttonLinkAccountUrl | QANOV-376954 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.plan_data_card_with_<element>
  Scenario Outline: A user clicks on the Plan data card module <element> when it is configured to open a manual target
    To be executed in QA
    Given the "Plan Card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Plan Card" configured in CMS has the "<field>" field with a "url" link to "[CONTEXT:plan_card.<field>.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "plan_data_card.<element>" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | element        | field                | jira_id      |
          | button_primary | buttonAccountUrl     | QANOV-376955 |
          | link           | buttonLinkAccountUrl | QANOV-376956 |
