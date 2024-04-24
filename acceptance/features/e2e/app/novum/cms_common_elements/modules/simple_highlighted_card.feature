# -*- coding: utf-8 -*-
@jira.QANOV-310314
Feature: Simple Highlighted Card


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_highlighted_card
  Scenario Outline: A user can see a Highlighted Card module configured with the default fields
    To be executed in QA
    Vivo requires image displayed. The rest of the brands do not.
    Given the "simple-highlighted-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-highlighted-card" configured in CMS has only the mandatory fields filled
     When user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "simple_highlighted_card.title" textfield with "[CONTEXT:simple_highlighted_card.title]" text is displayed
      And the "simple_highlighted_card.description" textfield with "[CONTEXT:simple_highlighted_card.description]" text is displayed
      And the "simple_highlighted_card.module_title" textfield is not displayed
      And the "simple_highlighted_card.button_primary" textfield is not displayed
      And the "simple_highlighted_card.button_secondary" textfield is not displayed
      And the "simple_highlighted_card.link" textfield is not displayed
      And the "simple_highlighted_card.image" image <image_displayed> displayed

    Examples:
          | product | cv   | image_displayed | jira_id      |
          | blaude  | 14.7 | is not          | QANOV-414268 |
          | moves   | 13.1 | is not          | QANOV-183860 |
          | o2de    | 24.0 | is not          | QANOV-414269 |
          | o2uk    | 13.3 | is not          | QANOV-183859 |
          | vivobr  | 13.3 | is              | QANOV-183858 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_highlighted_card_with_module_title
  Scenario Outline: A user can see a Highlighted Card module with a header configured
    To be executed in QA
    Given the "simple-highlighted-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-highlighted-card" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "simple_highlighted_card.module_title" textfield with "[CONTEXT:simple_highlighted_card.moduleTitle]" text is displayed
      And the "simple_highlighted_card.title" textfield with "[CONTEXT:simple_highlighted_card.title]" text is displayed
      And the "simple_highlighted_card.description" textfield with "[CONTEXT:simple_highlighted_card.description]" text is displayed
      And the "simple_highlighted_card.image" image <image_displayed> displayed

    Examples:
          | product | cv   | image_displayed | jira_id      |
          | blaude  | 14.7 | is not          | QANOV-414270 |
          | moves   | 13.1 | is not          | QANOV-183863 |
          | o2de    | 24.0 | is not          | QANOV-414271 |
          | o2uk    | 13.3 | is not          | QANOV-183862 |
          | vivobr  | 13.3 | is              | QANOV-183861 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user can see a Highlighted Card module with the image size filling the card content
    We are assuming that the module is published in the Account page, but the page depends on the publishing status in CMS.
    To be executed in QA
    Given user has the "Highlighted Card" module configured in CMS for "Account" page
      And the "Highlighted Card" module configured in CMS for "Account" page has an image with "fill" size
      And user is in the "Account" page
     Then the "simple_highlighted_card.image" image is displayed filling the card content

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-183864 |
          | o2uk    | 13.3 | QANOV-183865 |
          | moves   | 13.1 | QANOV-183866 |
          | blaude  | 24.0 | QANOV-554867 |
          | o2de    | 24.0 | QANOV-554868 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A user can see a Highlighted Card module with the image size fit
    We are assuming that the module is published in the Account page, but the page depends on the publishing status in CMS.
    To be executed in QA
    Given user has the "Highlighted Card" module configured in CMS for "Account" page
      And the "Highlighted Card" module configured in CMS for "Account" page has an image with "fit" size
      And user is in the "Account" page
     Then the "simple_highlighted_card.image" image is displayed with its own size

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-183867 |
          | o2uk    | 13.3 | QANOV-183868 |
          | moves   | 13.1 | QANOV-183869 |
          | blaude  | 24.0 | QANOV-554869 |
          | o2de    | 24.0 | QANOV-554870 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_highlighted_card_with_<element>
  Scenario Outline: A user can see a Highlighted Card module with a <element>
    To be executed in QA
    Given the "simple-highlighted-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple_highlighted-card" module configured in CMS has the "buttonType" field with "<button_type>" value
     When user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "simple_highlighted_card.<element>" link with "[CONTEXT:simple_highlighted_card.buttonText]" text is displayed
      And the "simple_highlighted_card.<invisible_element_1>" button is not displayed
      And the "simple_highlighted_card.<invisible_element_2>" button is not displayed

    Examples:
          | product | cv   | button_type | element          | invisible_element_1 | invisible_element_2 | jira_id      |
          | blaude  | 14.7 | buttonLink  | link             | button_primary      | button_secondary    | QANOV-421964 |
          | blaude  | 14.7 | primary     | button_primary   | link                | button_secondary    | QANOV-414272 |
          | blaude  | 14.7 | secondary   | button_secondary | link                | button_primary      | QANOV-421965 |
          | moves   | 13.1 | buttonLink  | link             | button_primary      | button_secondary    | QANOV-183878 |
          | moves   | 13.3 | primary     | button_primary   | link                | button_secondary    | QANOV-329794 |
          | moves   | 13.3 | secondary   | button_secondary | link                | button_primary      | QANOV-329795 |
          | o2de    | 24.0 | buttonLink  | link             | button_primary      | button_secondary    | QANOV-421966 |
          | o2de    | 24.0 | primary     | button_primary   | link                | button_secondary    | QANOV-414273 |
          | o2de    | 24.0 | secondary   | button_secondary | link                | button_primary      | QANOV-421967 |
          | o2uk    | 13.3 | buttonLink  | link             | button_primary      | button_secondary    | QANOV-183877 |
          | o2uk    | 13.3 | primary     | button_primary   | link                | button_secondary    | QANOV-329792 |
          | o2uk    | 13.3 | secondary   | button_secondary | link                | button_primary      | QANOV-329793 |
          | vivobr  | 13.3 | buttonLink  | link             | button_primary      | button_secondary    | QANOV-183876 |
          | vivobr  | 13.3 | primary     | button_primary   | link                | button_secondary    | QANOV-329790 |
          | vivobr  | 13.3 | secondary   | button_secondary | link                | button_primary      | QANOV-329791 |

  @jira.<jira_id> @<execution> @<product> @android @ios @jira.cv.<cv> @mobile @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_highlighted_card_with_preconfigured_url
  Scenario Outline: A user clicks on the Highlighted Card button when it is configured to open a preconfigured target
    To be executed in QA
    Given the "simple-highlighted-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-highlighted-card" configured in CMS has a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "simple_highlighted_card.link" button
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.<button>" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | cv   | link                        | header         | button       | execution | jira_id      |
          | blaude  | 14.7 | NAME_CHANGE                 | Namen ändern   | close_button | automatic | QANOV-414274 |
          | moves   | 13.1 | appointmentBookingUrl       | Movistar       | back_button  | automatic | QANOV-183881 |
          | o2de    | 24.0 | NAME_CHANGE                 | Namen ändern   | close_button | automatic | QANOV-414275 |
          | o2uk    | 13.3 | view_and_change_your_tariff | Tariff Details | back_button  | manual    | QANOV-183880 |
          | vivobr  | 13.3 | services-list               | Mais serviços  | back_button  | automatic | QANOV-183879 |

  @jira.<jira_id> @<product> @automatic @jira.cv.14.3 @qa @regression @web @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_highlighted_card_with_preconfigured_url
  Scenario Outline: A user clicks on the Highlighted Card button when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given the "simple-highlighted-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-highlighted-card" configured in CMS has a "preconfigured" link to "<link>" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "simple_highlighted_card.link" button
     Then the current URL contains "<destination_url>"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | link                  | destination_url                                                                      | jira_id      |
          | blaude  | NAME_CHANGE           | https://web.blau-de-qa.svc.dev.tuenti.io/pages/change-name                           | QANOV-414276 |
          | moves   | appointmentBookingUrl | https://web.movistar-es-qa.svc.dev.tuenti.io/pages/appointment-booking/              | QANOV-342288 |
          | o2uk    | priority              | https://priority.o2.co.uk/offers                                                     | QANOV-342287 |
          | o2de    | NAME_CHANGE           | https://web.o2-de-qa.svc.dev.tuenti.io/pages/change-name                             | QANOV-414277 |
          | vivobr  | services-list         | https://web.vivo-br-qa.svc.dev.tuenti.io/pages/services-list/?web_view_mode=settings | QANOV-342286 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.3 @mobile @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_highlighted_card_with_manual_url
  Scenario Outline: A user clicks on the Highlighted Card button when it is configured to open a manual URL
    To be executed in QA
    Given the "simple-highlighted-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-highlighted-card" configured in CMS has a "url" link to "[CONTEXT:simple_highlighted_card.buttonUrlId.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "simple_highlighted_card.link" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-414278 |
          | moves   | QANOV-342291 |
          | o2de    | QANOV-414279 |
          | o2uk    | QANOV-342290 |
          | vivobr  | QANOV-342289 |

  @jira.<jira_id> @<product> @automatic @jira.cv.14.3 @qa @regression @web @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.simple_highlighted_card_with_manual_url
  Scenario Outline: A user clicks on the Highlighted Card button when it is configured to open a manual URL in webapp
    To be executed in QA
    Given the "simple-highlighted-card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "simple-highlighted-card" configured in CMS has a "url" link to "[CONTEXT:simple_highlighted_card.buttonUrlId.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     When clicks on the "simple_highlighted_card.link" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-414280 |
          | moves   | QANOV-342294 |
          | o2de    | QANOV-414281 |
          | o2uk    | QANOV-342293 |
          | vivobr  | QANOV-342292 |
