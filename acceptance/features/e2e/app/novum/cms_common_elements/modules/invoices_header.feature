# -*- coding: utf-8 -*-
@jira.QANOV-419857
Feature: Invoices header


  @jira.QANOV-419858 @android @automatic @ios @jira.cv.14.6 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.invoices_header
  Scenario: A user with bills can see the invoices header
    To be executed in QA
    Given user has bills
      And the "invoices-header" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page for current agreement
     Then the "invoices_header" module is displayed
      And the "invoices_header.selection_title" textfield is displayed
      And the "invoices_header.selection_amount" textfield is displayed
      And the "invoices_header.average_amount" textfield is not displayed
      And the "invoices_header.carousel" list is displayed
      And the last invoice of the "invoices_header" invoices chart is selected
