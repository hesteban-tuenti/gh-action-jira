# -*- coding: utf-8 -*-
@jira.QANOV-420540
Feature: Advanced Data Card


  @jira.QANOV-443242 @android @automatic @ios @jira.cv.14.9 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards
  Scenario: A user can see one Advanced Data Card (agreement-overview-cards) module per user subscription and viceversa
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for the current agreement
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then each element in the "agreement_overview_cards.cards" list has the "title" field matching a subscription display name
      And each subscription display name matches the "title" field of any element in "agreement_overview_cards.cards" list

  @jira.QANOV-443243 @android @automatic @ios @jira.cv.14.9 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_carousel_representation
  Scenario: A user can see a carousel of one Advanced Data Card (agreement-overview-cards) module per user subscription and viceversa
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has "CAROUSEL" representation
      And user is in the "Modular Page Configurable Modules" modular page for the current agreement
      And waits until the "agreement_overview_cards.carousel_cards" list is displayed
     Then each element in the "agreement_overview_cards.carousel_cards" list has the "title" field matching a subscription display name
      And each subscription display name matches the "title" field of any element in "agreement_overview_cards.carousel_cards" list

  @jira.<jira_id> @jira.cv.14.9 @mobile @regression @vivobr
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_carousel_representation
  Scenario Outline: A user can swipe a carousel of Advanced Data Card (agreement-overview-cards) modules
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has "CAROUSEL" representation
      And user is in the "Modular Page Configurable Modules" modular page for the current agreement
      And waits until the "agreement_overview_cards.carousel_cards" list is displayed
     Then the "agreement_overview_cards.carousel_cards" carousel can be swiped

    @android @automatic @qa @webapp
    Examples:
          | jira_id      |
          | QANOV-443244 |

    @ios @manual
    Examples:
          | jira_id      |
          | QANOV-443245 |

  @jira.QANOV-443246 @android @automatic @ios @jira.cv.14.9 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_custom_text
  Scenario: A user can see an Advanced Data Card (agreement-overview-cards) module configured with custom text
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has custom text
      And user is in the "Modular Page Configurable Modules" modular page
     Then each element in the "agreement_overview_cards.cards" list has the "custom_text" textfield with "[CONTEXT:agreement_overview_cards.agreementsAudiences.0.customTextDescription]" text

  @jira.QANOV-443247 @android @automatic @ios @jira.cv.14.9 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_mobile_data_consumption
  Scenario: A user with mobile allowances can see an Advanced Data Card (agreement-overview-cards) module configured with mobile data consumption
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has "mobile_data_consumption" content
      And user has a "mobile_line" product
      And user has "data" allowances in the "mobile_line" product
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list has the "mobile_data_consumption" field

  @jira.QANOV-443248 @android @automatic @ios @jira.cv.14.9 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_non_mobile_product_information
  Scenario: A user with internet can see an Advanced Data Card (agreement-overview-cards) module configured with internet information
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has "non_mobile_product_information" content
      And user has a "internet" product
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list has the "internet_speed" field

  @jira.QANOV-623538 @android @automatic @ios @jira.cv.14.9 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_cancellation_information
  Scenario: A user with cancelled product can see an Advanced Data Card (agreement-overview-cards) module configured with cancellation information
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has "cancellation_date" content
      And user has a plan in "cancelled" status
      And user is in the "Modular Page Configurable Modules" modular page for the matching agreement
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list has the "cancellation_title" field
      And the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list has the "cancellation_date" field

  @jira.QANOV-420541 @android @automatic @ios @jira.cv.14.9 @jira.link.detects.VIVO-3910
  @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @regression @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_sva_footer
  Scenario: A user can see an Advanced Data Card (agreement-overview-cards) module configured with SVA
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has only the mandatory fields filled
      And user has main SVAs included in the tariff
      And the "agreement-overview-cards" advanced card configured in CMS has "SVA" footer
      And the "agreement-overview-cards" advanced card configured in CMS has footer SVAs "without" links
      And user is in the "Modular Page Configurable Modules" modular page for the matching subscription
     Then any element in the "agreement_overview_cards.cards" list has the "sva_icon" field
      And any element in the "agreement_overview_cards.cards" list has the "sva_text" field
      And no element in the "agreement_overview_cards.cards" list has the "sva_link" field

  @jira.QANOV-443249 @android @automatic @ios @jira.cv.14.9 @mobile @qa @smoke @vivobr @webapp
  @fixture.cms.extras_list.basic
  @fixture.cms.extra.whatsapp_with_link
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_sva_footer
  Scenario: A user can see an Advanced Data Card (agreement-overview-cards) module configured with SVA with link
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has only the mandatory fields filled
      And user has main SVAs included in the tariff
      And the "agreement-overview-cards" advanced card configured in CMS has "SVA" footer
      And the "agreement-overview-cards" advanced card configured in CMS has footer SVAs "with" links
      And user is in the "Modular Page Configurable Modules" modular page
     Then any element in the "agreement_overview_cards.cards" list has the "sva_icon" field
      And any element in the "agreement_overview_cards.cards" list has the "sva_text" field
      And any element in the "agreement_overview_cards.cards" list has the "sva_link" field

  @jira.QANOV-420542 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @sanity
  @vivobr @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards
  Scenario: A user can see a Advanced Data Card (agreement-overview-cards) module configured without SVA
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page
     Then no element in the "agreement_overview_cards.cards" list has the "sva_icon" field
      And no element in the "agreement_overview_cards.cards" list has the "sva_text" field
      And no element in the "agreement_overview_cards.cards" list has the "sva_link" field

  @jira.QANOV-420545 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_prepay_footer_with_preconfigured_link
  Scenario: A user can see an Advanced Data Card (agreement-overview-cards) module configured with balance section and preconfigured link can reach internal webview
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has only the mandatory fields filled
      And the "agreement-overview-cards" advanced card configured in CMS has "PREPAY" footer
      And the "agreement-overview-cards" advanced card configured in CMS has "preconfigured" footer link to "services-list" destination
      And user has a "prepay" account type
      And user is in the "Modular Page Configurable Modules" modular page
     When user clicks on "footer_link" of the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list
     Then the internal webview with empty header is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-420546 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_prepay_footer_with_manual_link
  Scenario: A user can see an Advanced Data Card (agreement-overview-cards) module configured with balance section and manual link can reach external webview
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has only the mandatory fields filled
      And the "agreement-overview-cards" advanced card configured in CMS has "PREPAY" footer
      And the "agreement-overview-cards" advanced card configured in CMS has "manual" footer link to "https://www.telefonica.com/?w=external" destination
      And user has a "prepay" account type
      And user is in the "Modular Page Configurable Modules" modular page
     When user clicks on "footer_link" of the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.<jira_id> @automatic @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @qa @regression @vivobr @web @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_prepay_footer_with_<link_type>_link
  Scenario Outline: A user can see an Advanced Data Card (agreement-overview-cards) module configured with balance section and <link_type> link can reach url
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has only the mandatory fields filled
      And the "agreement-overview-cards" advanced card configured in CMS has "PREPAY" footer
      And the "agreement-overview-cards" advanced card configured in CMS has "<link_type>" footer link to "<link>" destination
      And user has a "prepay" account type
      And user is in the "Modular Page Configurable Modules" modular page
     When user clicks on "footer_link" of the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list
     Then the current URL is "<destination>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | link_type     | link                                   | destination                                                                          | jira_id      |
          | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                       | QANOV-443250 |
          | preconfigured | services-list                          | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-443251 |

  @jira.QANOV-420547 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_prepay_footer_with_preconfigured_link
  Scenario: A user can see an Advanced Data Card (agreement-overview-cards) module configured with balance section
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has only the mandatory fields filled
      And the "agreement-overview-cards" advanced card configured in CMS has "PREPAY" footer
      And the "agreement-overview-cards" advanced card configured in CMS has "preconfigured" footer link to "services-list" destination
      And user has a "prepay" account type
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "agreement_overview_cards" element is visible
     Then the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list has the "footer_balance" field
      And the advanced data card matching the current subscription in the "agreement_overview_cards.cards" list has the "footer_link" field

  @jira.QANOV-443252 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa @smoke
  @vivobr @webapp
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario: A user can see the meatball menu icon of an Advanced Data Card (agreement-overview-cards) module configured with a meatball menu
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then each item in the "agreement_overview_cards.cards" list has the "meatball_menu_icon" field

  @jira.QANOV-443253 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa
  @regression @vivobr @webapp
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario: A user can see the meatball menu of an Advanced Data Card (agreement-overview-cards) module
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "meatball_menu_icon" button of "agreement_overview_cards.cards" list with "1" index
      And waits until the "meatball_menu" element is visible
     Then the "meatball_menu.elements" list is displayed
      And the "meatball_menu.elements" list has "3" elements
      And elements in "meatball_menu.elements" have the order defined in CMS
      And closes the meatball menu

  @jira.QANOV-443263 @android @automatic @ios @jira.cv.14.9 @jira.link.detects.ACCOUNT-23094
  @jira.link.parent_test_plan.QANOV-359861 @mobile @regression @vivobr @webapp
  @fixture.cms.entrypoint_list.with_title
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario: A user can see the meatball menu with title of an Advanced Data Card (agreement-overview-cards) module
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "meatball_menu_icon" button of "agreement_overview_cards.cards" list with "1" index
      And waits until the "meatball_menu" element is visible
     Then the "meatball_menu.elements" list is displayed
      And the "meatball_menu.title" textfield is displayed
      And closes the meatball menu

  @jira.QANOV-443255 @android @automatic @ios @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa
  @regression @vivobr @webapp
  @fixture.cms.entrypoint_list.with_icons
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.entrypoint.with_icon
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario: A user can see icons in the elements of the meatball menu of an Advanced Data Card (agreement-overview-cards) module
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "agreement_overview_cards.cards" list is displayed
     When clicks on the "meatball_menu_icon" button of "agreement_overview_cards.cards" list with "1" index
      And waits until the "meatball_menu" element is visible
     Then the "meatball_menu.elements" list is displayed
      And the "meatball_menu.elements" list has "3" elements
      And any element in the "meatball_menu.elements" list has the "icon" field
      And closes the meatball menu

  @jira.<jira_id> @automatic @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @qa @regression @vivobr @web @webapp
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.<entrypoint_type>
  @fixture.cms.entrypoint.<entrypoint_type>
  @fixture.cms.entrypoint.<entrypoint_type>
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario Outline: A user can click on the elements with "<link_type>" url of the meatball menu of an Advanced Data Card (agreement-overview-cards) module
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "agreement_overview_cards.cards" list is displayed
     When clicks on the "meatball_menu_icon" button of "agreement_overview_cards.cards" list with "1" index
      And waits until the "meatball_menu" element is visible
      And waits "1" seconds
      And clicks on any element in the "meatball_menu.elements" list
     Then the current URL is "<destination>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | link_type     | entrypoint_type        | destination                                                                          | jira_id      |
          | manual        | basic                  | https://www.telefonica.com/es/                                                       | QANOV-443257 |
          | preconfigured | with_preconfigured_url | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-443258 |

  @jira.<jira_id> @<client> @e2e @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @regression @vivobr
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.entrypoint.basic
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario Outline: A user can click on the elements with manual url of the meatball menu of an Advanced Data Card (agreement-overview-cards) module
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "meatball_menu_icon" link of any element of the "agreement_overview_cards.cards" list
      And waits until the "meatball_menu" element is visible
      And waits "1" seconds
      And clicks on any element in the "meatball_menu.elements" list
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    @automatic @qa
    Examples:
          | client  | jira_id      |
          | android | QANOV-443259 |

    @manual
    Examples:
          | client | jira_id      |
          | ios    | QANOV-580417 |

  @jira.<jira_id> @<client> @e2e @jira.cv.14.9 @jira.link.parent_test_plan.QANOV-359861 @mobile @regression @vivobr
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.entrypoint.with_preconfigured_url
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario Outline: A user can click on the elements with preconfigured url of the meatball menu of an Advanced Data Card (agreement-overview-cards) module
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And user is in the "Modular Page Configurable Modules" modular page
     When clicks on the "meatball_menu_icon" link of any element of the "agreement_overview_cards.cards" list
      And waits until the "meatball_menu" element is visible
      And waits "1" seconds
      And clicks on any element in the "meatball_menu.elements" list
     Then the internal webview with empty header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    @automatic @qa
    Examples:
          | client  | jira_id      |
          | android | QANOV-443261 |

    @manual
    Examples:
          | client | jira_id      |
          | ios    | QANOV-580418 |

  @jira.QANOV-597724 @android @automatic @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa
  @regression @vivobr @webapp
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario: A user can't see the meatball menu icon of an Advanced Data Card (agreement-overview-cards) module when the menu list is empty
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And the entrypoint list configured in CMS is "without" services
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then no element in the "agreement_overview_cards.cards" list has the "meatball_menu_icon" field

  @jira.QANOV-597725 @android @automatic @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-359861 @mobile @qa
  @regression @vivobr @webapp
  @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.with_multivivo-titular-cached_audience
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.agreement_overview_cards_with_meatball_menu
  Scenario: A user can't see the meatball menu icon of an Advanced Data Card (agreement-overview-cards) module when the menu list items have an audience that mismatches the current user
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has meatball menu
      And the entrypoint "[CONTEXT:entrypoint_id]" configured in CMS has the "multivivo-titular-cached" audience
      And user does not have any "multivivo" account types
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then no element in the "agreement_overview_cards.cards" list has the "meatball_menu_icon" field

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  @webapp
  Scenario Outline: A user can see a Advance Data Card module configured with a <field>
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" module configured in CMS has the "<field>" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "agreement-overview-cards.<element>" textfield with "[CONTEXT:data_spent.<field>]" text is displayed

    Examples:
          | element        | field          | jira_id      |
          | module_title   | moduleTitle    | QANOV-453470 |
          | link           | buttonLinkText | QANOV-453471 |
          | button_primary | buttonText     | QANOV-453472 |

  @jira.QANOV-453473 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario: A user can see a Advance Data Card module configured with all fields
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And the "agreement-overview-cards.module_title" textfield with "[CONTEXT:data_spent.moduleTitle]" text is displayed
      And the "agreement-overview-cards.link" textfield with "[CONTEXT:data_spent.buttonLinkText]" text is displayed
      And the "agreement-overview-cards.button_primary" textfield with "[CONTEXT:data_spent.buttonText]" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @regression @vivobr
  Scenario Outline: A user clicks on the Advance Data Card module <element> when it is configured to open a preconfigured url to services-list
    To be executed in QA
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has the "<field>" field with a "preconfigured" link to "services-list" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "agreement-overview-cards.<element>" button
     Then the internal webview with empty header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | element        | field                | jira_id      |
          | button_primary | buttonAccountUrl     | QANOV-453474 |
          | link           | buttonLinkAccountUrl | QANOV-453475 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @smoke @vivobr
  Scenario Outline: A user clicks on the Advance Data Card module <element> with custom url pointing to an external webview
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" configured in CMS has the "<field>" field with a "url" link to "https://www.telefonica.com/es/" destination
     When user is in the "Modular Page Configurable Modules" modular page for current agreement
      And clicks on the "agreement-overview-cards.<element>" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | element        | field                | jira_id      |
          | button_primary | buttonAccountUrl     | QANOV-453476 |
          | link           | buttonLinkAccountUrl | QANOV-453477 |

  @jira.QANOV-623539 @android @ios @jira.cv.24.4 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile @regression
  @vivobr
  Scenario: A user cannot see the Advanced Data Card module when the configured card audience mismatch the current user
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has the "multivivo-titular-cached" audience
      And user does not have any "multivivo" account types
      And user is in the "Modular Page Configurable Modules" modular page
     Then the "agreement_overview_cards.cards" list is not displayed

  @jira.QANOV-623540 @android @automation.hard @ios @jira.cv.24.4 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile
  @regression @vivobr
  Scenario: A user can see the second configured card of the Advanced Data Card module when first card does not apply to him
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has the "internet" audience for the "first" card
      And the "agreement-overview-cards" advanced card configured in CMS has the "mobile" audience for the "second" card
      And user does not have any "convergente" account types
      And user has a "mobile" product
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then the "agreement-overview-cards.cards" list has the "mobile" product card
      And the advanced data card matching the current subscription in the "agreement_overview_cards.cards" matches the "second" configured card

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.24.4 @jira.link.parent_test_plan.QANOV-437472 @manual @mobile
  @regression @vivobr
  Scenario Outline: A user with Advanced Data Card module in <representation> representation can see the cards for the first defined products the first in the list
    Given the "agreement-overview-cards" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "agreement-overview-cards" advanced card configured in CMS has "<representation>" representation
      And the "agreement-overview-cards" module configured in CMS has the "mobile,internet" product cards order
      And user has a "mobile" product
      And user has a "internet" product
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "agreement_overview_cards.cards" list is displayed
     Then the element in "0" position in the "agreement_overview_cards.cards" list has a mobile product card

    Examples:
          | representation | jira_id      |
          | STACK          | QANOV-623541 |
          | CAROUSEL       | QANOV-623542 |
