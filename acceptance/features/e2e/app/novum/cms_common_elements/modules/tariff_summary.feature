# -*- coding: utf-8 -*-
@jira.QANOV-376934
Feature: Tariff Summary


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.tariff_summary
  Scenario Outline: A user can see a Tariff Summary module configured with the default fields
    To be executed in QA
    Given the "Main Product Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Main Product Summary" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "tariff_summary_module_title" element is not displayed

    @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-342667 |

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-342668 |
          | o2de    | 24.0 | QANOV-554871 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.tariff_summary_with_module_title
  Scenario Outline: A user can see a Tariff Summary module with a header configured
    To be executed in QA
    Given the "Main Product Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Main Product Summary" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "tariff_summary_module_title" textfield with "[CONTEXT:main_product_summary.moduleTitle]" text is displayed

    @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-342669 |

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-342670 |
          | o2de    | 24.0 | QANOV-554872 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.tariff_summary_with_preconfigured_url
  Scenario Outline: A user clicks on the Tariff Summary button when it is configured to open a preconfigured target
    To be executed in QA
    Given the "Main Product Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Main Product Summary" configured in CMS has a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "tariff_summary.link" button
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Configurable Modules" modular page is displayed

    @old_app
    Examples:
          | product | link          | header        | button       | cv   | jira_id      |
          | vivobr  | services-list | Mais serviços | back_button  | 14.3 | QANOV-342671 |

    Examples:
          | product | link          | header        | button       | cv   | jira_id      |
          | blaude  | NAME_CHANGE   | Namen ändern  | close_button | 14.3 | QANOV-342672 |
          | o2de    | NAME_CHANGE   | Namen ändern  | close_button | 24.0 | QANOV-554873 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.tariff_summary_with_preconfigured_url
  Scenario Outline: A user clicks on the Tariff Summary button when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given the "Main Product Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Main Product Summary" configured in CMS has a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "tariff_summary.link" button
     Then the browser title is "<header>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    @old_app
    Examples:
          | product | link          | header        | cv   | jira_id      |
          | vivobr  | services-list | Mais serviços | 14.3 | QANOV-342673 |

    Examples:
          | product | link          | header        | cv   | jira_id      |
          | blaude  | NAME_CHANGE   | Namen ändern  | 14.3 | QANOV-342674 |
          | o2de    | NAME_CHANGE   | Namen ändern  | 24.0 | QANOV-554874 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.tariff_summary_with_manual_url
  Scenario Outline: A user clicks on the Tariff Summary button when it is configured to open a manual URL
    To be executed in QA
    Given the "Main Product Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Main Product Summary" configured in CMS has a "url" link to "[CONTEXT:main_product_summary.linkUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "tariff_summary.link" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-342675 |

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-342676 |
          | o2de    | 24.0 | QANOV-554875 |

  @jira.<jira_id> @<product> @automatic @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.tariff_summary_with_manual_url
  Scenario Outline: A user clicks on the Tariff Summary button when it is configured to open a manual URL in webapp
    To be executed in QA
    Given the "Main Product Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Main Product Summary" configured in CMS has a "url" link to "[CONTEXT:main_product_summary.linkUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "tariff_summary.link" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-342677 |

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-342678 |
          | o2de    | 24.0 | QANOV-554876 |
