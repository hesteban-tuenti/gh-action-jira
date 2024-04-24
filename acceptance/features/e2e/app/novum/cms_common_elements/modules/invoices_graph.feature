# -*- coding: utf-8 -*-
@jira.QANOV-377179
Feature: Invoices Graph


  @jira.QANOV-377180 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoices_graph
  Scenario: A user with bills can see the invoices graph module without title
    To be executed in QA
    Given user has invoices
      And the "Last months invoices graph" module is configured in CMS for "Modular Page Configurable Modules" page
     When user is in the "Modular Page Configurable Modules" modular page
      And waits until the "invoices_graph" element is visible
      And waits until the "invoices_graph.graph" element is visible
     Then the "invoices_graph.title" textfield is not displayed
      And the "invoices_graph.graph" element is on display
      And the last invoice of the "invoices_graph.graph" invoices chart is selected

  @jira.QANOV-377181 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoices_graph_with_title
  Scenario: A user with bills can see the invoices graph module with title
    To be executed in QA
    Given user has invoices
      And the "Last months invoices graph" module is configured in CMS for "Modular Page Configurable Modules" page
     When user is in the "Modular Page Configurable Modules" modular page
      And waits until the "invoices_graph" element is visible
      And waits until the "invoices_graph.graph" element is visible
     Then the "invoices_graph.title" textfield with "[CONTEXT:last_months_invoices_graph.moduleTitle]" text is displayed
      And the "invoices_graph.graph" element is on display
      And the last invoice of the "invoices_graph.graph" invoices chart is selected

  @jira.QANOV-414856 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoices_graph
  Scenario: A user with bills can select another month in the invoices graph
    To be executed in QA
    Given user has invoices
      And the "Last months invoices graph" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "invoices_graph" element is visible
      And waits until the "invoices_graph.graph" element is visible
      And the last invoice of the "invoices_graph.graph" invoices chart is selected
     When clicks on a different month than the selected in the "invoices_graph.graph" invoices chart
     Then the last invoice of the "invoices_graph.graph" invoices chart is not selected

  @jira.QANOV-414857 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.invoices_graph
  Scenario: A user with bills can select a month in a different page in the invoices graph
    To be executed in QA
    Given user has invoices
      And the "Last months invoices graph" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
      And waits until the "invoices_graph" element is visible
      And waits until the "invoices_graph.graph" element is visible
      And the "invoices_graph.graph" invoices chart has "several" pages
      And the last invoice of the "invoices_graph.graph" invoices chart is selected
     When clicks on a different page than the selected in the "invoices_graph.graph" invoices chart
     Then waits until the last page of the "invoices_graph.graph" invoices chart is not selected
