# -*- coding: utf-8 -*-
@jira.QANOV-48473
Feature: Detailed internet plan info

  Actions Before each Scenario:
    Given user has the "Non mobile products" module configured in CMS for "Account" page


  @jira.QANOV-48496 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-38257 @jira.link.detects.O2DE-2871
  @jira.link.detects.O2DE-3045 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user can see the "services" module of a internet@home product
    The Services section is an 'Entrypoint list' module configured in CMS. The title is optional in this type of
    module, but for this section it should be filled with 'DIENSTLEISTUNGEN'.
    An optional link with the 'Alle ansehen' text could be displayed if the entrypoint list is configured in CMS
    with this link and if the maximum number of services allowed in summary view of the module is lower than the total
    number of services configured for this module.
    Given user has a "postpay" account type
      And user has a "internet_at_home" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And the "Entrypoint list" module configured in CMS for "Account" page has the "Internet Dashboard" list to render
      And the "Entrypoint list" module configured in CMS for "Account" page has a "LIST" representation
      And the "Entrypoint list" module configured in CMS for "Account" page has a total of ">0" services
      And user is in the "Account" page
     Then the "highlighted_services" module is displayed
      And the "highlighted_services_list" list is displayed

  @jira.QANOV-203602 @TBD @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-44695 @jira.link.detects.O2DE-3107
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A postpay user with a dsl/cable/fiber product can change the installation address
    Given user has a "postpay" account type
      And user has any "dsl;cable;fiber" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "internet_at_home_services.change_installation_address_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "o2online.de/edsl/move/address" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-203603 @TBD @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-44695 @jira.link.detects.O2DE-3107
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A postpay user with a internet@home product can change the router password
    Given user has a "postpay" account type
      And user has a "internet_at_home" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "internet_at_home_services.change_router_password_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Mein o2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-48502 @android @ios @jira.cv.14.11 @jira.link.depends_on.QANOV-38257 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario: Postpay user can see a promotion available for a internet@home product
    The card will contain:
    - Title: Kombi-Vorteil
    - Description: Spare 50% auf Mobilfunk- uund Datentarife
    - Button: Mehr erfahren
    An optional link with the 'Zu allen Angeboten' text could be displayed under the promo card if the OB wants to
    highlight something about the promotion.
    Given user has a "postpay" account type
      And user has a "internet_at_home" product
      And user has a promotion available for the "internet_at_home" tariff
      And user has the matching subscription selected in the account
      And user has the "Promotion" module configured in CMS for "Account" page
      And user is in the "Account" page
     Then the "promo" module is displayed
      And the "promo.title" textfield with "ANGEBOTE" text is displayed

  @jira.QANOV-48503 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-38257 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario: Postpay user with SVAs for internet@home can see the "SVAs" module
    The SVAs section is an 'Extras' module configured in CMS. The title is optional in this type of module, but for this
    section it should be filled with 'ZUSATZOPTIONEN'.
    An optional link with the 'Mehr sehen' text could be displayed if the Extras module is configured in CMS
    with this link.
    Given user has a "postpay" account type
      And user has a "internet_at_home" product in "active" status
      And user has at least a "SVA" service available for the "internet_at_home" tariff
      And user has the matching subscription selected in the account
      And user has the "Extras" module configured in CMS for "Account" page
      And the "Extras" module configured in CMS for "Account" page has the "Internet Dashboard" extras to render
      And user is in the "Account" page
     Then the "SVAs" module is displayed
      And the "SVAs.carousel" carousel is displayed

  @jira.QANOV-54183 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-38257 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @regression
  Scenario: Postpay user with SVAs for internet@home can access to the SVAs details
    Given user has a "postpay" account type
      And user has "several" products
      And user has a "internet_at_home" product in "active" status
      And user has at least a "SVA" service available for the "internet_at_home" tariff
      And user has the matching subscription selected in the account
      And user has the "Extras" module configured in CMS for "Account" page
      And the "Extras" module configured in CMS for "Account" page has the "Internet Dashboard" extras to render
      And user is in the "Account" page
     When clicks on the "SVAs.link" link
     Then the "SVAs" page is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed
