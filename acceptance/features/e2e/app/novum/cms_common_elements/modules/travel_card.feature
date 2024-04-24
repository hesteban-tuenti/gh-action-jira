# -*- coding: utf-8 -*-
@jira.QANOV-421848
Feature: Travel Card


  @jira.QANOV-421849 @android @automatic @ios @jira.cv.14.9 @jira.detects.ACCOUNT-23224
  @jira.link.parent_test_plan.QANOV-359861 @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card
  Scenario: A user can see a Travel module configured with the default fields without the footer
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" configured in CMS has only the mandatory fields filled
      And user has vivo travel included in the tariff
      And user has vivo travel included in "several" plans
      And user is in the "Modular Page Configurable Modules" modular page
     Then the "travel_card" module is displayed
      And the "travel_card.title" textfield is not displayed
      And the "travel_card.card" module is displayed
      And the "travel_card.card.title" textfield is displayed
      And the "travel_card.card.footer_description" textfield is displayed
      And the "travel_card.card.footer_link" link is not displayed
      And the "travel_card.card.meatball_menu_icon" button is not displayed

  @jira.QANOV-452225 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861
  @jira.link.parent_test_plan.QANOV-437472 @mobile @qa @regression @vivobr @webapp @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_title
  Scenario: A user can see a Travel module configured with module with_title
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     Then the "travel_card" module is displayed
      And the "travel_card.title" textfield with "[CONTEXT:travel_card.module-title]" text is displayed
      And the "travel_card.card" module is displayed

  @jira.QANOV-452226 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr @webapp @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card
  Scenario: A user can see a Travel module configured with the default fields and the footer
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" configured in CMS has only the mandatory fields filled
      And user has vivo travel included in the tariff
      And user has vivo travel included in "1" plan
      And user is in the "Modular Page Configurable Modules" modular page
     Then the "travel_card" module is displayed
      And the "travel_card.title" textfield is not displayed
      And the "travel_card.card" module is displayed
      And the "travel_card.card.title" textfield is displayed
      And the "travel_card.card.footer_description" textfield with "[CONTEXT:travel_card.footer-text]" text is displayed
      And the "travel_card.card.footer_link" textfield with "[CONTEXT:travel_card.footer-link-text]" text is displayed
      And the "travel_card.card.meatball_menu_icon" button is not displayed

  @jira.<jira_id> @automatic @jira.@<jira_id> @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @qa @regression
  @vivobr @web @webapp @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_<link_type>_url_footer_link
  Scenario Outline: A user clicks on footer link with <link_type> url of a Travel module in webview
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has vivo travel included in the tariff
      And user has vivo travel included in "1" plan
      And user is in the "Modular Page Configurable Modules" modular page
      And the "travel_card.card" module is displayed
     When clicks on the "travel_card.card.footer_link" card
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | link_type     | destination_url                                                                      | jira_id      |
          | manual        | https://www.telefonica.com/es/                                                       | QANOV-452227 |
          | preconfigured | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-452228 |

  @jira.QANOV-452229 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card_with_manual_url_footer_link
  Scenario: A user clicks on footer link with manual url of a Travel module and reaches an external webview
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has vivo travel included in the tariff
      And user has vivo travel included in "1" plan
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "travel_card.card.footer_link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-452230 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card_with_preconfigured_url_footer_link
  Scenario: A user clicks on footer link with preconfigured url of a Travel module and reaches an internal webview
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has vivo travel included in the tariff
      And user has vivo travel included in "1" plan
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "travel_card.card.footer_link" link
     Then the internal webview with empty header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-421850 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr @webapp @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card_with_meatball_menu
  Scenario: A user can see a Travel module configured with the meatball menu
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" module configured in CMS has the "topRightEntrypointListId" filled
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     Then the "travel_card" module is displayed
      And the "travel_card.card" module is displayed
      And the "travel_card.card.meatball_menu_icon" button is displayed

  @jira.QANOV-452231 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa
  @regression @vivobr @webapp @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic @fixture.cms.entrypoint.basic @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_meatball_menu
  Scenario: A user can see the meatball menu of an Advanced Data Card (travel-card) module
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" advanced card configured in CMS has meatball menu
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "travel_card.card.meatball_menu_icon" link
      And waits until the "meatball_menu" element is visible
     Then the "meatball_menu.elements" list is displayed
      And the "meatball_menu.elements" list has "3" elements
      And elements in "meatball_menu.elements" have the order defined in CMS
      And closes the meatball menu

  @jira.QANOV-452232 @android @automatic @ios @jira.cv.14.9 @jira.link.detects.ACCOUNT-23094
  @jira.link.parent_test_plan.QANOV-359861 @mobile @regression @vivobr @webapp @fixture.cms.entrypoint_list.with_title
  @fixture.cms.entrypoint.basic @fixture.cms.entrypoint.basic @fixture.cms.entrypoint.basic
  @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card_with_meatball_menu
  Scenario: A user can see the meatball menu with title of an Advanced Data Card (travel-card) module
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" advanced card configured in CMS has meatball menu
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "travel_card.card.meatball_menu_icon" link
      And waits until the "meatball_menu" element is visible
     Then the "meatball_menu.elements" list is displayed
      And the "meatball_menu.title" textfield is displayed
      And closes the meatball menu

  @jira.QANOV-452233 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa
  @regression @vivobr @webapp @fixture.cms.entrypoint_list.with_icons @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon @fixture.cms.entrypoint.with_icon @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_meatball_menu
  Scenario: A user can see icons in the elements of the meatball menu of an Advanced Data Card (travel-card) module
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" advanced card configured in CMS has meatball menu
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "travel_card.card.meatball_menu_icon" link
      And waits until the "meatball_menu" element is visible
     Then the "meatball_menu.elements" list is displayed
      And the "meatball_menu.elements" list has "3" elements
      And any element in the "meatball_menu.elements" list has the "icon" field
      And closes the meatball menu

  @jira.<jira_id> @automatic @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @qa @regression @vivobr @web @webapp
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.<entrypoint_type> @fixture.cms.entrypoint.<entrypoint_type>
  @fixture.cms.entrypoint.<entrypoint_type> @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_meatball_menu
  Scenario Outline: A user can click on the elements with "<link_type>" url of the meatball menu of an Advanced Data Card (travel-card) module
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" advanced card configured in CMS has meatball menu
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "travel_card.card.meatball_menu_icon" link
      And waits until the "meatball_menu" element is visible
      And waits "1" seconds
      And clicks on any element in the "meatball_menu.elements" list
     Then the current URL is "<destination>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | link_type     | entrypoint_type        | destination                                                                          | jira_id      |
          | manual        | basic                  | https://www.telefonica.com/es/                                                       | QANOV-452234 |
          | preconfigured | with_preconfigured_url | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-452235 |

  @jira.<jira_id> @<client> @e2e @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @regression @vivobr
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card_with_meatball_menu
  Scenario Outline: A user can click on the elements with manual url of the meatball menu of an Advanced Data Card (travel-card) module
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" advanced card configured in CMS has meatball menu
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "travel_card.card.meatball_menu_icon" link
      And waits until the "meatball_menu" element is visible
      And waits "1" seconds
      And clicks on any element in the "meatball_menu.elements" list
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    @automatic @qa
    Examples:
          | client  | jira_id      |
          | android | QANOV-452236 |

    @manual
    Examples:
          | client | jira_id      |
          | ios    | QANOV-580419 |

  @jira.<jira_id> @<client> @e2e @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @regression @vivobr
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card_with_meatball_menu
  Scenario Outline: A user can click on the elements with preconfigured url of the meatball menu of an Advanced Data Card (travel-card) module
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" advanced card configured in CMS has meatball menu
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "travel_card.card.meatball_menu_icon" link
      And waits until the "meatball_menu" element is visible
      And waits "1" seconds
      And clicks on any element in the "meatball_menu.elements" list
     Then the internal webview with empty header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    @automatic @qa
    Examples:
          | client  | jira_id      |
          | android | QANOV-452237 |

    @manual
    Examples:
          | client | jira_id      |
          | ios    | QANOV-580420 |

  @jira.QANOV-597728 @android @automatic @ios @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa
  @regression @vivobr @webapp
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_meatball_menu
  Scenario: A user can't see the meatball menu icon of an Advanced Data Card (travel-card) module when the menu list is empty
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" advanced card configured in CMS has meatball menu
      And the entrypoint list configured in CMS is "without" services
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "travel_card" element is visible
     Then the "travel_card.card.meatball_menu_icon" button is not displayed

  @jira.QANOV-597730 @android @automatic @ios @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa
  @regression @vivobr @webapp
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.with_multivivo-titular-cached_audience
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_meatball_menu
  Scenario: A user can't see the meatball menu icon of an Advanced Data Card (travel-card) module when the menu list items have an audience that mismatches the current user
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "travel-card" advanced card configured in CMS has meatball menu
      And the entrypoint "[CONTEXT:entrypoint_id]" configured in CMS has the "multivivo-titular-cached" audience
      And user does not have any "multivivo" account types
      And user has vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "travel_card" element is visible
     Then the "travel_card.card.meatball_menu_icon" button is not displayed

  @jira.QANOV-452238 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr @webapp @fixture.cms.page.configurable_modules @fixture.cms.module.travel_card_with_empty_case_and_manual_url
  Scenario: A user can see the empty case of the Travel module
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has not vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
     Then the "travel_card.empty_case_card" module is displayed
      And the "travel_card.empty_case_card.icon" icon is displayed
      And the "travel_card.empty_case_card.chevron" image is displayed
      And the "travel_card.empty_case_card.title" textfield that contains the "[CONTEXT:travel_card.empty-case-title]" text is displayed
      And the "travel_card.empty_case_card.subtitle" textfield that contains the "[CONTEXT:travel_card.empty-case-subtitle]" text is displayed

  @jira.<jira_id> @automatic @jira.@<jira_id> @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @qa @regression
  @vivobr @web @webapp @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_empty_case_and_<link_type>_url
  Scenario Outline: A user can click on the empty case of the Travel module in webapp for a "<link_type>" url
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has not vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And the "travel_card.empty_case_card" module is displayed
     When clicks on the "travel_card.empty_case_card" card
     Then the current URL is "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | link_type     | destination_url                                                                      | jira_id      |
          | manual        | https://www.telefonica.com/es/                                                       | QANOV-452239 |
          | preconfigured | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-452240 |

  @jira.QANOV-452241 @android @automatic @ios @jira.@<jira_id> @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861
  @mobile @qa @regression @vivobr @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_empty_case_and_manual_url
  Scenario: A user can click on the empty case of the Travel module for a manual url and reaches an external webview
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has not vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And the "travel_card.empty_case_card" module is displayed
     When clicks on the "travel_card.empty_case_card" card
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-452242 @android @automatic @ios @jira.@<jira_id> @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861
  @mobile @qa @regression @vivobr @fixture.cms.page.configurable_modules
  @fixture.cms.module.travel_card_with_empty_case_and_preconfigured_url
  Scenario: A user can click on the empty case of the Travel module for a preconfigured url and reaches an internal webview
    To be executed in QA
    Given the "travel-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has not vivo travel included in the tariff
      And user is in the "Modular Page Configurable Modules" modular page
      And the "travel_card.empty_case_card" module is displayed
     When clicks on the "travel_card.empty_case_card" card
     Then the internal webview with empty header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed
