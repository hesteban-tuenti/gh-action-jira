# -*- coding: utf-8 -*-
@jira.QANOV-284663
Feature: Digital services module

  Actions Before each Scenario:
    Given user has the "servicos-digitais" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @<test_priority> @android @automatic @ios @jira.cv.13.9 @live @mobile @next @qa @vivobr @old_app
  Scenario Outline: A user with Start tab will see the digital services module
    Given user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has "<plans>" plans
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "digital_services_module" module is displayed
      And the "digital_services_module.icon" icon is displayed
      And the "digital_services_module.title" textfield with "Serviços digitais" text is displayed
      And the "digital_services_module.chevron" icon is displayed

    Examples:
          | plans   | test_priority | ber | jira_id      |
          | 1       | smoke         | ber | QANOV-284664 |
          | several | regression    |     | QANOV-284665 |

  @jira.QANOV-284666 @android @ios @jira.cv.13.9 @manual @mobile @regression @vivobr @old_app
  Scenario: A user can access to the Meus Apps webview
    Given user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has a "any" plan in "active" status
      And user is in the "Start" page
     When clicks on the "digital_services_module" entrypoint
     Then the internal webview with "Meus Apps" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed
