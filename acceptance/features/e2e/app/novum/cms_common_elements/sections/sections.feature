# -*- coding: utf-8 -*-
@jira.QANOV-418626
Feature: Sections


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.7 @mobile @qa @regression @webapp
  @fixture.cms.page.without_sections
  Scenario Outline: A modular page without header modules or sections shows the fallback page
    To be executed in QA
    Given the modular page has been configured in CMS with "0" sections
      And there are "0" modules configured in the header of the modular page
     When user is in the "Modular Page Sections" modular page
     Then the "Modular Page Fallback" modular page is displayed
      And the "image" image is displayed
      And the "title" textfield with "[LANG:account.dashboard.cms_fallback.title]" text is displayed
      And the "message" textfield with "[LANG:account.dashboard.cms_fallback.message]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418627 |
          | moves   | QANOV-418628 |
          | o2de    | QANOV-531557 |
          | o2uk    | QANOV-418629 |
          | vivobr  | QANOV-418630 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @smoke @webapp
  @fixture.cms.page.without_sections
  @fixture.cms.module.simple_action_row_for_header
  Scenario Outline: A modular page can have one module in the header
    To be executed in QA
    Given the modular page has been configured in CMS with "0" sections
      And there are "1" modules configured in the header of the modular page
     When user is in the "Modular Page Sections" modular page
     Then the "header_module_1" module is displayed
      And the "main_section_module_1" module is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418631 |
          | moves   | QANOV-418632 |
          | o2de    | QANOV-531558 |
          | o2uk    | QANOV-418633 |
          | vivobr  | QANOV-418634 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.without_sections
  @fixture.cms.module.simple_action_row_for_header
  @fixture.cms.module.simple_action_row_for_header
  @fixture.cms.module.simple_action_row_for_header
  Scenario Outline: A modular page can have several modules in the header
    To be executed in QA
    Given the modular page has been configured in CMS with "0" sections
      And there are "3" modules configured in the header of the modular page
     When user is in the "Modular Page Sections" modular page
     Then the "header_module_1" module is displayed
      And the "header_module_2" module is displayed
      And the "header_module_3" module is displayed
      And the "main_section_module_1" module is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418635 |
          | moves   | QANOV-418636 |
          | o2de    | QANOV-531559 |
          | o2uk    | QANOV-418637 |
          | vivobr  | QANOV-418638 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @smoke @webapp
  @fixture.cms.page.with_header_fields
  @fixture.cms.module.simple_action_row_for_header
  Scenario Outline: A modular page can have optional fields in the header
    To be executed in QA
    Given the modular page has been configured in CMS with "0" sections
      And there are "1" modules configured in the header of the modular page
      And the header has "titleInfo.title" field with "Title" value
      And the header has "titleInfo.description" field with "Description" value
      And the header has "titleInfo.titleLink.text" field with "Link" value
     When user is in the "Modular Page Sections" modular page
     Then the "header_module_1" module is displayed
      And the "header.title" textfield with "Title" text is displayed
      And the "header.description" textfield with "Description" text is displayed
      And the "header.link" textfield with "Link" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418639 |
          | moves   | QANOV-418640 |
          | o2de    | QANOV-531560 |
          | o2uk    | QANOV-418641 |
          | vivobr  | QANOV-418642 |

  @jira.<jira_id> @<product> @automatic @jira.cv.14.5 @qa @regression @web @webapp
  @fixture.cms.page.with_header_with_<link_type>_url_link
  @fixture.cms.module.simple_action_row_for_header
  Scenario Outline: A user can reach the <link_type> link destination of a header link in a modular page
    To be executed in QA
    Given the modular page has been configured in CMS with "0" sections
      And there are "1" modules configured in the header of the modular page
      And the "simple-action-row" module is configured in CMS in the header of the modular page
      And the header has a "<link_type>" link to "<destination>" destination
      And user is in the "Modular Page Sections" modular page
     When clicks on the "header.link" link
     Then the current URL is "<current_url>"
      And I go back to the previous page
      And the "Modular Page Sections" modular page is displayed

    Examples:
          | product | link_type     | destination                            | current_url                                                                                   | jira_id      |
          | blaude  | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-418643 |
          | blaude  | preconfigured | NAME_CHANGE                            | https://web.blau-de-qa.svc.dev.tuenti.io/pages/change-name                                    | QANOV-470184 |
          | moves   | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-418644 |
          | moves   | preconfigured | appointmentBookingUrl                  | https://web.movistar-es-qa.svc.dev.tuenti.io/pages/appointment-booking/                       | QANOV-470185 |
          | o2de    | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-531561 |
          | o2de    | preconfigured | NAME_CHANGE                            | https://web.o2-de-qa.svc.dev.tuenti.io/pages/change-name                                      | QANOV-531562 |
          | o2uk    | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-418645 |
          | o2uk    | preconfigured | billing_card_invoices                  | https://web.o2-uk-qa.svc.dev.tuenti.io/consumptions/modular-screen/start-tab-invoices-details | QANOV-470186 |
          | vivobr  | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-418646 |
          | vivobr  | preconfigured | services-list                          | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings          | QANOV-470187 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression
  @fixture.cms.page.with_header_with_manual_url_link
  @fixture.cms.module.simple_action_row_for_header
  Scenario Outline: A user can reach the external webview of a header link in a modular page
    To be executed in QA
    Given the modular page has been configured in CMS with "0" sections
      And there are "1" modules configured in the header of the modular page
      And the "simple-action-row" module is configured in CMS in the header of the modular page
      And the header has a "manual" link to "https://www.telefonica.com/?w=external" destination
      And user is in the "Modular Page Sections" modular page
     When clicks on the "header.link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Sections" modular page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418647 |
          | moves   | QANOV-418648 |
          | o2de    | QANOV-531563 |
          | o2uk    | QANOV-418649 |
          | vivobr  | QANOV-418650 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression
  @fixture.cms.page.with_header_with_preconfigured_url_link
  @fixture.cms.module.simple_action_row_for_header
  Scenario Outline: A user can reach the target page of a header link in a modular page
    To be executed in QA
    Given the modular page has been configured in CMS with "0" sections
      And there are "1" modules configured in the header of the modular page
      And the "simple-action-row" module is configured in CMS in the header of the modular page
      And the header has a "preconfigured" link to "<destination>" destination
      And user is in the "Modular Page Sections" modular page
     When clicks on the "header.link" link
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Sections" modular page is displayed

    Examples:
          | product | destination           | header        | button       | jira_id      |
          | blaude  | NAME_CHANGE           | Namen ändern  | close_button | QANOV-418651 |
          | moves   | appointmentBookingUrl | Movistar      | back_button  | QANOV-418652 |
          | o2de    | NAME_CHANGE           | Namen ändern  | close_button | QANOV-531564 |
          | o2uk    | billing_card_invoices | Total billed  | back_button  | QANOV-418653 |
          | vivobr  | services-list         | Mais serviços | back_button  | QANOV-418654 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @smoke @webapp
  @fixture.cms.page.with_one_section
  @fixture.cms.module.simple_action_row_for_main_section
  Scenario Outline: A modular page can have one module in a section
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And there are "1" modules configured in the section "Main Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "0" of the modular page
     When user is in the "Modular Page Sections" modular page
     Then the "main_section_module_1" module is displayed
      And the "secondary_section_module_1" module is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418655 |
          | moves   | QANOV-418656 |
          | o2de    | QANOV-531565 |
          | o2uk    | QANOV-418657 |
          | vivobr  | QANOV-418658 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.with_one_section
  @fixture.cms.module.simple_action_row_for_main_section
  @fixture.cms.module.simple_action_row_for_main_section
  @fixture.cms.module.simple_action_row_for_main_section
  Scenario Outline: A modular page can have several modules in the same section
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And there are "3" modules configured in the section "Main Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "0" of the modular page
     When user is in the "Modular Page Sections" modular page
     Then the "main_section_module_1" module is displayed
      And the "main_section_module_2" module is displayed
      And the "main_section_module_3" module is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418659 |
          | moves   | QANOV-418660 |
          | o2de    | QANOV-531566 |
          | o2uk    | QANOV-418661 |
          | vivobr  | QANOV-418662 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.with_three_sections
  @fixture.cms.module.simple_action_row_for_main_section
  @fixture.cms.module.simple_action_row_for_secondary_section
  @fixture.cms.module.simple_action_row_for_third_section
  Scenario Outline: A modular page can have one module per section in several sections
    To be executed in QA
    Given the modular page has been configured in CMS with "3" sections
      And the "simple-action-row" module is configured in CMS in the section "Main Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "Secondary Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "Third Section" of the modular page
      And there are "1" modules configured in the section "Main Section" of the modular page
      And there are "1" modules configured in the section "Secondary Section" of the modular page
      And there are "1" modules configured in the section "Third Section" of the modular page
     When user is in the "Modular Page Sections" modular page
     Then the "main_section_module_1" module is displayed
      And the "main_section_module_2" module is not displayed
      And the "secondary_section_module_1" module is displayed
      And the "secondary_section_module_2" module is not displayed
      And the "third_section_module_1" module is displayed
      And the "third_section_module_2" module is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418663 |
          | moves   | QANOV-418664 |
          | o2de    | QANOV-531567 |
          | o2uk    | QANOV-418665 |
          | vivobr  | QANOV-418666 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @smoke @webapp
  @fixture.cms.page.with_one_section_with_fields
  @fixture.cms.module.simple_action_row_for_main_section
  Scenario Outline: A modular page can have optional fields in a section
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And the "simple-action-row" module is configured in CMS in the section "0" of the modular page
      And the section "Main Section" has "titleInfo.title" field with "Title" value
      And the section "Main Section" has "titleInfo.description" field with "Description" value
      And the section "Main Section" has "titleInfo.titleLink.text" field with "Link" value
     When user is in the "Modular Page Sections" modular page
     Then the "main_section_module_1" module is displayed
      And the "section_0.title" textfield with "Title" text is displayed
      And the "section_0.description" textfield with "Description" text is displayed
      And the "section_0.link" textfield with "Link" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418667 |
          | moves   | QANOV-418668 |
          | o2de    | QANOV-531568 |
          | o2uk    | QANOV-418669 |
          | vivobr  | QANOV-418670 |

  @jira.<jira_id> @<product> @automatic @jira.cv.14.5 @qa @regression @web @webapp
  @fixture.cms.page.with_main_section_with_<link_type>_url_link
  @fixture.cms.module.simple_action_row_for_main_section
  Scenario Outline: A user can reach the <link_type> link destination of a section link in a modular page
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And the "simple-action-row" module is configured in CMS in the section "0" of the modular page
      And the section "Main Section" has a "<link_type>" link to "<destination>" destination
      And user is in the "Modular Page Sections" modular page
     When clicks on the "section_0.link" link
     Then the current URL is "<current_url>"
      And I go back to the previous page
      And the "Modular Page Sections" modular page is displayed

    Examples:
          | product | link_type     | destination                            | current_url                                                                                   | jira_id      |
          | blaude  | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-418671 |
          | blaude  | preconfigured | NAME_CHANGE                            | https://web.blau-de-qa.svc.dev.tuenti.io/pages/change-name                                    | QANOV-470188 |
          | moves   | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-418672 |
          | moves   | preconfigured | appointmentBookingUrl                  | https://web.movistar-es-qa.svc.dev.tuenti.io/pages/appointment-booking/                       | QANOV-470189 |
          | o2de    | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-531569 |
          | o2de    | preconfigured | NAME_CHANGE                            | https://web.o2-de-qa.svc.dev.tuenti.io/pages/change-name                                      | QANOV-531570 |
          | o2uk    | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-418673 |
          | o2uk    | preconfigured | billing_card_invoices                  | https://web.o2-uk-qa.svc.dev.tuenti.io/consumptions/modular-screen/start-tab-invoices-details | QANOV-470190 |
          | vivobr  | manual        | https://www.telefonica.com/?w=external | https://www.telefonica.com/es/                                                                | QANOV-418674 |
          | vivobr  | preconfigured | services-list                          | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings          | QANOV-470191 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression
  @fixture.cms.page.with_main_section_with_manual_url_link
  @fixture.cms.module.simple_action_row_for_main_section
  Scenario Outline: A user can reach the external webview of a section link in a modular page
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And the "simple-action-row" module is configured in CMS in the section "0" of the modular page
      And the section "Main Section" has a "manual" link to "https://www.telefonica.com/?w=external" destination
      And user is in the "Modular Page Sections" modular page
     When clicks on the "section_0.link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Sections" modular page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418675 |
          | moves   | QANOV-418676 |
          | o2de    | QANOV-531571 |
          | o2uk    | QANOV-418677 |
          | vivobr  | QANOV-418678 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression
  @fixture.cms.page.with_main_section_with_preconfigured_url_link
  @fixture.cms.module.simple_action_row_for_main_section
  Scenario Outline: A user can reach the target page of a section link in a modular page
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And the "simple-action-row" module is configured in CMS in the section "0" of the modular page
      And the section "Main Section" has a "preconfigured" link to "<destination>" destination
      And user is in the "Modular Page Sections" modular page
     When clicks on the "section_0.link" link
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Sections" modular page is displayed

    Examples:
          | product | destination           | header        | button       | jira_id      |
          | blaude  | NAME_CHANGE           | Namen ändern  | close_button | QANOV-418679 |
          | moves   | appointmentBookingUrl | Movistar      | back_button  | QANOV-418680 |
          | o2de    | NAME_CHANGE           | Namen ändern  | close_button | QANOV-531572 |
          | o2uk    | billing_card_invoices | Total billed  | back_button  | QANOV-418681 |
          | vivobr  | services-list         | Mais serviços | back_button  | QANOV-418682 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.with_hidden_header_and_hidden_main_section
  @fixture.cms.module.simple_action_row_for_header
  @fixture.cms.module.simple_action_row_for_main_section
  Scenario Outline: A modular page sees the fallback header when all sections and header are hidden
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And the "simple-action-row" module is configured in CMS in the section "Main Section" of the modular page
      And there are "1" modules configured in the header of the modular page
      And there are "1" modules configured in the section "Main Section" of the modular page
      And the header of the modular page has "hidden" visibility
      And the section "Main Section" of the modular page has "hidden" visibility
     When user is in the "Modular Page Sections" modular page
     Then the "Modular Page Fallback" modular page is displayed
      And the "image" image is displayed
      And the "title" textfield with "[LANG:account.dashboard.cms_fallback.title]" text is displayed
      And the "message" textfield with "[LANG:account.dashboard.cms_fallback.message]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418683 |
          | moves   | QANOV-418684 |
          | o2de    | QANOV-531573 |
          | o2uk    | QANOV-418685 |
          | vivobr  | QANOV-418686 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.with_hidden_header_and_visible_main_section
  @fixture.cms.module.simple_action_row_for_header
  @fixture.cms.module.simple_action_row_for_main_section
  Scenario Outline: A modular page cannot see a header module in a hidden header
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And the "simple-action-row" module is configured in CMS in the section "Main Section" of the modular page
      And there are "1" modules configured in the header of the modular page
      And the header of the modular page has "hidden" visibility
     When user is in the "Modular Page Sections" modular page
     Then the "header_module_1" module is not displayed
      And the "main_section_module_1" module is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418687 |
          | moves   | QANOV-418688 |
          | o2de    | QANOV-531574 |
          | o2uk    | QANOV-418689 |
          | vivobr  | QANOV-418690 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @smoke @webapp
  @fixture.cms.page.with_hidden_main_section_and_visible_secondary_section
  @fixture.cms.module.simple_action_row_for_main_section
  @fixture.cms.module.simple_action_row_for_secondary_section
  Scenario Outline: A modular page with two sections, one of them hidden, shows only one section content
    To be executed in QA
    Given the modular page has been configured in CMS with "2" sections
      And there are "1" modules configured in the section "Main Section" of the modular page
      And there are "1" modules configured in the section "Secondary Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "Main Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "Secondary Section" of the modular page
      And the section "Main Section" of the modular page has "hidden" visibility
      And the section "Secondary Section" of the modular page has "visible" visibility
     When user is in the "Modular Page Sections" modular page
     Then the "main_section_module_1" module is not displayed
      And the "secondary_section_module_1" module is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418691 |
          | moves   | QANOV-418692 |
          | o2de    | QANOV-531575 |
          | o2uk    | QANOV-418693 |
          | vivobr  | QANOV-418694 |

  @jira.<jira_id> @<product> @android @automatic @ber @ios @jira.cv.14.5 @mobile @qa @sanity @webapp
  @fixture.cms.page.with_header_and_two_sections
  @fixture.cms.module.simple_action_row_for_header
  @fixture.cms.module.simple_action_row_for_main_section
  @fixture.cms.module.simple_action_row_for_secondary_section
  Scenario Outline: A modular page can have header and sections at the same time
    To be executed in QA
    Given the modular page has been configured in CMS with "2" sections
      And there are "1" modules configured in the header of the modular page
      And there are "1" modules configured in the section "Main Section" of the modular page
      And there are "1" modules configured in the section "Secondary Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "Main Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "Secondary Section" of the modular page
     When user is in the "Modular Page Sections" modular page
     Then the "header_module_1" module is displayed
      And the "main_section_module_1" module is displayed
      And the "secondary_section_module_1" module is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418695 |
          | moves   | QANOV-418696 |
          | o2de    | QANOV-531576 |
          | o2uk    | QANOV-418697 |
          | vivobr  | QANOV-418698 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.5 @manual @mobile @qa @regression @webapp
  Scenario Outline: A modular page header can have other than the brand background color
    To be executed in QA
    Given the modular page has been configured in CMS with "0" sections
      And there are "1" modules configured in the header of the modular page
      And the header of the modular pages has "default" background color
     When user is in the "Modular Page Sections" modular page
     Then the header has "default" background color

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418699 |
          | moves   | QANOV-418700 |
          | o2de    | QANOV-531577 |
          | o2uk    | QANOV-418701 |
          | vivobr  | QANOV-418702 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.5 @manual @mobile @qa @regression @webapp
  Scenario Outline: A section can have other than default background color
    To be executed in QA
    Given the modular page has been configured in CMS with "1" sections
      And there are "1" modules configured in the section "Main Section" of the modular page
      And the "simple-action-row" module is configured in CMS in the section "Main Section" of the modular page
      And the "1" section of the modular pages has "brand" background color
     When user is in the "Modular Page Sections" modular page
     Then the section "Main Section" has "brand" background color

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-418703 |
          | moves   | QANOV-418704 |
          | o2de    | QANOV-531578 |
          | o2uk    | QANOV-418705 |
          | vivobr  | QANOV-418706 |
