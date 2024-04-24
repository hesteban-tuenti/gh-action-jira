# -*- coding: utf-8 -*-
@jira.QANOV-384405
Feature: Latest invoice

  @jira.QANOV-384406 @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.latest_invoice
  Scenario: A user can see a Latest Invoice module configured with the default long description
    To be executed in QA
    Given the "Latest invoice" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "latest_invoice" element is visible
     Then the "latest_invoice.title" textfield with "Latest Airtime Bill" text is displayed

  @jira.QANOV-384407 @android @automatic @ios @jira.cv.14.5 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.latest_invoice_short
  Scenario: A user can see a Latest Invoice module configured with the short description
    To be executed in QA
    Given the "Latest invoice" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
      And waits until the "latest_invoice" element is visible
     Then the "latest_invoice.title" textfield with "Latest Bill" text is displayed
