# -*- coding: utf-8 -*-
@jira.QANOV-472899
Feature: Main Extra


  @jira.QANOV-472900 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @smoke
  @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.main_extra
  Scenario: A user can see a Add Item Card module configured with the default fields
    To be executed in QA
    Given the "main-extra" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has main SVAs included in the tariff
      And the "main_extra" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "main_extra" element is visible
     Then the "main_extra.title" textfield is displayed
      And the "main_extra.sva_icon" icon is displayed

  @jira.QANOV-472901 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-437472 @mobile @qa
  @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.main_extra
  Scenario: A user without a main SVA cannot see a Add Item Card module
    To be executed in QA
    Given the "main-extra" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has not main SVAs included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     Then the "main_extra" module is not displayed

  @jira.QANOV-471073 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @smoke
  @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.main_extra_with_title
  Scenario: A user can see a Add Item Card module with a module title
    To be executed in QA
    Given the "main-extra" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has main SVAs included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "main_extra" element is visible
     Then the "main_extra.title" textfield is displayed
      And the "main_extra.module_title" textfield with "[CONTEXT:main_extra.moduleTitle]" text is displayed

  @jira.QANOV-471074 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @smoke
  @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.main_extra_with_footer
  Scenario: A user can see a Add Item Card module with a footer text
    To be executed in QA
    Given the "main-extra" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has main SVAs included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "main_extra" element is visible
     Then the "main_extra.title" textfield is displayed
      And the "main_extra.footer" textfield with "[CONTEXT:main_extra.includedFooterText]" text is displayed

  @jira.QANOV-472902 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-437472 @mobile @qa
  @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp_with_preconfigured_link
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.main_extra_with_footer
  Scenario: A user clicks on the Add Item Card when it is configured to reach an internal webview
    To be executed in QA
    Given the "main-extra" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has main SVAs included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "main_extra" element is visible
     When clicks on the "main_extra" card
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-472903 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-437472 @mobile @qa
  @regression @vivobr
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp_with_manual_link
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.main_extra_with_footer
  Scenario: A user clicks on the Add Item Card when it is configured to reach an external webview
    To be executed in QA
    Given the "main-extra" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has main SVAs included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "main_extra" element is visible
     When clicks on the "main_extra" card
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.<jira_id> @automatic @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-437472 @qa @regression @vivobr @web @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp_with_<link_type>_link
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.main_extra_with_footer
  Scenario Outline: A user clicks on the Add Item Card when it is configured with a <link_type> link type
    To be executed in QA
    Given the "main-extra" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has main SVAs included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "main_extra" element is visible
     When clicks on the "main_extra" card
     Then the current URL is "<destination>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | link_type     | link                                   | link_field | destination                                                                          | jira_id      |
          | manual        | https://www.telefonica.com/?w=external | url        | https://www.telefonica.com/es/                                                       | QANOV-471075 |
          | preconfigured | services-list                          | id         | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-471076 |
