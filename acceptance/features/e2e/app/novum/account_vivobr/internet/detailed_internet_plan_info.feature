# -*- coding: utf-8 -*-
@jira.QANOV-4803
Feature: Detailed internet plan info

  Actions Before each Scenario:
    Given user has a "admin" role
      And user does not have a "internet" plan


  @jira.QANOV-4804 @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next
  @smoke @vivobr @qa @webapp @old_app
  Scenario: User can see Internet product included in the plan
    Given user has a "internet" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "internet_icon" icon is displayed
      And the "internet_label" textfield with "Internet" text is displayed

  @jira.QANOV-4805 @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next
  @regression @vivobr @qa @webapp @old_app
  Scenario: User without Internet product cannot see the Internet icon in dashboard
    Given user does not have "internet" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "internet_icon" icon is not displayed
      And the "internet_label" textfield is not displayed

  @jira.QANOV-77649 @android @automatic @ber @ios @jira.cv.13.1 @jira.link.depends_on.QANOV-4804
  @jira.link.parent_test_plan.QANOV-76707 @live @mobile @next @qa @sanity @vivobr @webapp @old_app
  Scenario: User can access to the Internet dashboard
    Given user has a "internet" product in "active" status
      And user has the matching subscription selected in the account
      And user has the "internet-header" module configured in CMS for "internet" page for the "internet" product
      And user has the "services-summary" module configured in CMS for "internet" page for the "internet" product
      And user has the "support" module configured in CMS for "internet" page for the "internet" product
      And user is in the "Account" page
     When clicks on the "internet_icon" entrypoint
     Then the "Internet" page is displayed
      And the "Internet" header is displayed
      And the "internet_products.title" textfield is displayed
      And the "internet_products.speed.upload" textfield with the "\d+ Mbps" format is displayed
      And the "internet_products.speed.download" textfield with the "\d+ Mbps" format is displayed
      And the "internet_products.speed.upload_title" textfield with "Upload até" text is displayed
      And the "internet_products.speed.download_title" textfield with "Download até" text is displayed
      And the "internet_services_module.titles" list is displayed
      And the "diagnostics_module.module_title" textfield is displayed
      And the "diagnostics_module.title" textfield is displayed
      And the "diagnostics_module.description" textfield is displayed
      And the "diagnostics_module.link" button is displayed

  @jira.QANOV-4807 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-4804
  @jira.link.detects.VIVO-2316 @jira.link.parent_test_plan.QANOV-56585 @manual @mobile @smoke @vivobr @old_app
  Scenario: User with pending installation can access to the Internet dashboard
    Given user has a "internet" product in "pending" status
      And user has the "alerts" module configured in CMS for "internet" page for the "internet" product
      And user has the "dynamic-content-empty-case" module configured in CMS for "internet" page for the "internet" product
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "internet_icon" entrypoint
     Then the "Internet" page is displayed
      And the "Internet" header is displayed
      And the "pending_installation_title" textfield with "Vamos instalar seu Vivo Fibra em breve" text is displayed
      And the "pending_installation_subtitle" textfield with "Você pode ver todos os detalhes acompanhando a instalação" text is displayed
      And the "plan_configuration_button" button with "Acompanhar" text is displayed

  @jira.QANOV-4808 @android @automatic @ios @jira.cv.12.0 @jira.link.depends_on.QANOV-4806 @qa @webapp @old_app
  @jira.link.depends_on.QANOV-4807 @jira.link.parent_test_plan.QANOV-21791 @live @mobile @next @regression @vivobr
  Scenario: User can go back to main account dashboard from the Internet dashboard
    Given user has a "internet" product
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "navigation_top_bar.back_button" button to go back to the previous page
     Then the "Account" page is displayed

  @jira.QANOV-4809 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.4 @jira.link.depends_on.QANOV-4807
  @jira.link.parent_test_plan.QANOV-56585 @manual @mobile @smoke @vivobr @old_app
  Scenario: User with pending installation can access to Acompanhar instalação page when taps on "Acompanhar instalação" button
    Given user has a "internet" product in "pending" status
      And user has the "alerts" module configured in CMS for "internet" page for the "internet" product
      And user has the "dynamic-content-empty-case" module configured in CMS for "internet" page for the "internet" product
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "plan_configuration_button" button
     Then the internal webview with "Suporte Técnico" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Internet" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile @regression
  @vivobr @TBD @old_app
  Scenario Outline: A user with the <offer> CRM offer will see the button to access it in the Internet dashboard
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has "several" products
      And user has a internet product with "<internet_type>" connectivity
      And user has a "<offer>" offer
      And user has the "TBD" module configured in CMS for "internet" page for the "internet" product
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     Then the "offer_button" button with "<button_text>" text is displayed

    Examples:
          | offer            | button_text           | internet_type | jira_id      |
          | upgrade_to_fiber | Mudar para Vivo Fibra | Cobre         | QANOV-223635 |
          | upgrade_speed    | Aumentar velocidade   | Fibra         | QANOV-223636 |

  @jira.QANOV-223637 @TBD @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile
  @regression @vivobr @old_app
  Scenario: A user with a upgrade to fiber CRM offer can open the offer button from the Internet dashboard page
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has "several" products
      And user has any "upgrade_to_fiber" offer
      And user has the "TBD" module configured in CMS for "internet" page for the "internet" product
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "offer_button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Internet" page is displayed

  @jira.QANOV-223638 @TBD @android @ios @jira.cv.13.6 @jira.link.parent_test_plan.QANOV-218253 @manual @mobile
  @regression @vivobr @old_app
  Scenario: A user with a upgrade speed CRM offer can open the offer button from the Internet dashboard page
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has "several" products
      And user has any "upgrade_speed" offer
      And user has the "TBD" module configured in CMS for "internet" page for the "internet" product
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "offer_button" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Internet" page is displayed
