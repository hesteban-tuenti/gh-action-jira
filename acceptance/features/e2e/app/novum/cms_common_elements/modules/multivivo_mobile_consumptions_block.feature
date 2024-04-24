# -*- coding: utf-8 -*-
@jira.QANOV-570347
Feature: Multivivo mobile consumptions block


  @jira.QANOV-570348 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @smoke @vivobr
  @webapp
  Scenario: A user can see one multivivo plans (multivivo-mobile-consumptions-block) module when configured with the default fields
    To be executed in QA
    Given the "multivivo-mobile-consumptions-block" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for the current agreement
     Then the "plan.mobile_allowances" section is displayed
      And the "plan.lines" section is displayed
      And the "plan.lines.chevron_icon" icon is not displayed
      And the "plan.lines.footer" textfield is not displayed

  @jira.QANOV-570349 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @smoke @vivobr
  @webapp
  Scenario: A user can see a multivivo plans (multivivo-mobile-consumptions-block) module configured with footer data distributed text
    To be executed in QA
    Given the "multivivo-mobile-consumptions-block" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "multivivo-mobile-consumptions-block" footer distributed configured in CMS has custom text
      And user is in the "Modular Page Configurable Modules" modular page
      And user has data distributed
     Then the "plan.lines.footer_distributed" textfield with "[CONTEXT:multivivo_mobile_consumptions_block.footer_distributed]" text is displayed

  @jira.QANOV-570350 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @smoke @vivobr
  @webapp
  Scenario: A user can see a multivivo plans (multivivo-mobile-consumptions-block) module configured with footer data shared text
    To be executed in QA
    Given the "multivivo-mobile-consumptions-block" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "multivivo-mobile-consumptions-block" footer sharing configured in CMS has custom text
      And user is in the "Modular Page Configurable Modules" modular page
      And user has data sharing
     Then the "plan.lines.footer_sharing" textfield with "[CONTEXT:multivivo_mobile_consumptions_block.footer_sharing]" text is displayed

  @jira.<jira_id> @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @regression @vivobr @web @webapp
  Scenario Outline: A user clicks on the multivivo line: user is redirected to a <url_type> url
    To be executed in QA
    Given the "multivivo-mobile-consumptions-block" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "multivivo-mobile-consumptions-block" configured in CMS has a "<link_type>" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "plan.lines.chevron_icon" button
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | url_type      | link_type     | link                                              | destination_url                                                                      | jira_id      |
          | manual        | url           | [CONTEXT:simple_action_row.accountUrl.urlAddress] | https://www.telefonica.com/es/                                                       | QANOV-570351 |
          | preconfigured | preconfigured | services-list                                     | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-570352 |

  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-568388 @manual @mobile @regression @vivobr
  Scenario Outline: A user clicks on the multivivo line: user is redirected to a <url_type> the target page configured in CMS
    To be executed in QA
    Given the "multivivo-mobile-consumptions-block" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "multivivo-mobile-consumptions-block" configured in CMS has a "<link_type>" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "plan.lines.chevron_icon" button
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | url_type      | link_type     | link                                              | header                         | jira_id      |
          | manual        | url           | [CONTEXT:simple_action_row.accountUrl.urlAddress] | https://www.telefonica.com/es/ | QANOV-570353 |
          | preconfigured | preconfigured | services-list                                     | Mais serviços                  | QANOV-570354 |
