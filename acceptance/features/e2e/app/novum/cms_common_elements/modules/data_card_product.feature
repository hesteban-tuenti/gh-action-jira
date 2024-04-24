# -*- coding: utf-8 -*-
@jira.QANOV-372388
Feature: Data Card Product


  @jira.QANOV-372389 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_qustodio
  Scenario: A user can see a Verticales digital hub card module configured with the default fields
    To be executed in QA
    Given user has the "qustodio" service in "activated" status
      And the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Verticales digital hub card" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     Then the "data_card_product.title" textfield with "[CONTEXT:verticales_digital_hub_card.title]" text is displayed
      And the "data_card_product.description" textfield is not displayed
      And the "data_card_product.link" textfield is not displayed
      And the "data_card_product.icon" image is not displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_<element>
  Scenario Outline: A user can see a Verticales digital hub card module with a <element>
    To be executed in QA
    Given the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Verticales digital hub card" module configured in CMS has the "<field>" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     Then the "data_card_product.<element>" textfield with "[CONTEXT:verticales_digital_hub_card.<field>]" text is displayed

    Examples:
          | field          | element     | jira_id      |
          | description    | description | QANOV-372390 |
          | buttonLinkText | link        | QANOV-372391 |

  @jira.QANOV-372392 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_icon
  Scenario: A user can see a Verticales digital hub card module with a icon
    To be executed in QA
    Given the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Verticales digital hub card" module configured in CMS has the "icon" filled
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     Then the "src" property of the "data_card_product.icon" element matches "[CONTEXT:verticales_digital_hub_card.icon.url]" text

  @jira.<jira_id> @jira.cv.14.4 @mobile @moves @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_<vertical>
  Scenario Outline: A user can see a Verticales digital hub card module with the vertical <vertical>
    To be executed in QA
    Given user has the "<vertical>" service in "activated" status
      And the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Verticales digital hub card" module configured in CMS has the "productId" field with "<field>" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     Then the "data_card_product.title" textfield with "[CONTEXT:verticales_digital_hub_card.title]" text is displayed

    @android @automatic @ios @qa @webapp
    Examples:
          | vertical          | field        | jira_id      |
          | movistar_car      | movistar-car | QANOV-372393 |
          | qustodio          | qustodio     | QANOV-372394 |
          | movistar_prosegur | prosegur     | QANOV-372395 |

  @jira.QANOV-372396 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_microsoft_game_pass
  Scenario: A user can see a Verticales digital hub card module with the vertical Microsoft Game Pass
    To be executed in QA
    Given user has purchased ">0" Game Pass Ultimate subscriptions
      And the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Verticales digital hub card" module configured in CMS has the "productId" field with "microsoft-game-pass" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     Then the "data_card_product.title" textfield with "[CONTEXT:verticales_digital_hub_card.title]" text is displayed

  @jira.QANOV-372397 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_mobile_insurance
  Scenario: A user can see a Verticales digital hub card module with the vertical Mobile insurance
    To be executed in QA
    Given user has the "mobile_insurance" service in "activated" status
      And the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Verticales digital hub card" module configured in CMS has the "productId" field with "mobile-insurance" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     Then the "data_card_product.title" textfield with "[CONTEXT:verticales_digital_hub_card.title]" text is displayed

  @jira.<jira_id> @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_<vertical>
  Scenario Outline: A user can see a Verticales digital hub card module with the vertical <vertical>
    To be executed in QA
    Given user has an eHealth "<vertical>" plan contracted
      And the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Verticales digital hub card" module configured in CMS has the "productId" field with "<field>" value
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     Then the "data_card_product.title" textfield with "[CONTEXT:verticales_digital_hub_card.title]" text is displayed

    Examples:
          | vertical      | field             | jira_id      |
          | personal_plan | personal-e-health | QANOV-372398 |
          | family_plan   | family-e-health   | QANOV-372399 |

  @jira.QANOV-372400 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_movistar_car
  Scenario: A user won't see a Verticales digital hub card module if the user does not have the product
    To be executed in QA
    Given user has the "movistar_car" service in "deactivated" status
      And the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Verticales digital hub card" module configured in CMS has the "productId" field with "movistar-car" value
      And user is in the "Modular Page Fallback" modular page
     Then the "module" element is not displayed

  @jira.QANOV-372401 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_all_fields
  Scenario: A user can see a Verticales digital hub card module configured with all fields
    To be executed in QA
    Given the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     Then the "data_card_product.title" textfield with "[CONTEXT:verticales_digital_hub_card.title]" text is displayed
      And the "data_card_product.description" textfield with "[CONTEXT:verticales_digital_hub_card.description]" text is displayed
      And the "data_card_product.link" textfield with "[CONTEXT:verticales_digital_hub_card.buttonLinkText]" text is displayed
      And the "src" property of the "data_card_product.icon" element matches "[CONTEXT:verticales_digital_hub_card.icon.url]" text

  @jira.QANOV-372402 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_preconfigured_url_in_link
  Scenario: A user clicks on the Verticales digital hub card link when it is configured to open a preconfigured target
    To be executed in QA
    Given the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "verticales_digital_hub_card" configured in CMS has the "buttonLinkAccountUrl" field with a "preconfigured" link to "appointmentBookingUrl" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     When clicks on the "data_card_product.link" button
     Then the internal webview with "Movistar" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-372403 @automatic @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_preconfigured_url_in_link
  Scenario: A user clicks on the Verticales digital hub card link when it is configured to open a preconfigured target in webapp
    To be executed in QA
    Given the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "verticales_digital_hub_card" configured in CMS has the "buttonLinkAccountUrl" field with a "preconfigured" link to "appointmentBookingUrl" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     When clicks on the "data_card_product.link" button
     Then the current URL is "[CONF:web_url_base]/pages/appointment-booking/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-372404 @android @automatic @ios @jira.cv.14.3 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_manual_url_in_link
  Scenario: A user clicks on the Verticales digital hub card link when it is configured to open a manual URL
    To be executed in QA
    Given the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "verticales_digital_hub_card" configured in CMS has the "buttonLinkAccountUrl" field with a "url" link to "[CONTEXT:verticales_digital_hub_card.buttonLinkAccountUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     When clicks on the "data_card_product.link" button
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Modular Page Configurable Modules" modular page is displayed

  @jira.QANOV-372405 @automatic @jira.cv.14.3 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.data_card_product_with_manual_url_in_link
  Scenario: A user clicks on the Verticales digital hub card link when it is configured to open a manual URL in webapp
    To be executed in QA
    Given the "Verticales digital hub card" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "verticales_digital_hub_card" configured in CMS has the "buttonLinkAccountUrl" field with a "url" link to "[CONTEXT:verticales_digital_hub_card.buttonLinkAccountUrl.urlAddress]" destination
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "data_card_product" element is visible
     When clicks on the "data_card_product.link" button
     Then the current URL is "https://www.telefonica.com/es/"
      And I go back to the previous page
      And the "Modular Page Configurable Modules" modular page is displayed
