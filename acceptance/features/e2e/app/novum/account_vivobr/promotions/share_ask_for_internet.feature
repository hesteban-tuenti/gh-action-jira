# -*- coding: utf-8 -*-
@jira.QANOV-4823
Feature: Share/Ask for internet


  @android @ios @jira.<jira_id> @jira.cv.9.7 @jira.link.parent_test_plan.QANOV-21950 @jira.link.relates_to.NOV-775 @live
  @mobile @next @regression @vivobr @no_automatable @impeded_legacy @old_app
  Scenario Outline: Legacy user can access to the "Envie sua internet disponível" service from Consumption tab
    commented_tags="@depends_on.NOV-30"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ConsumptionV1" page
     When clicks on the "envie_sua_internet_disponivel" entrypoint
     Then the internal webview is displayed
      And the "Compartilhar Internet" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "ConsumptionV1" page is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-4825 |

  @android @ios @jira.<jira_id> @jira.cv.9.7 @jira.link.parent_test_plan.QANOV-21950 @jira.link.relates_to.NOV-776 @live
  @mobile @next @regression @vivobr @no_automatable @impeded_legacy @old_app
  Scenario Outline: Legacy user can access to the "Peça internet aos seus amigos" service from Consumption tab
    commented_tags="@depends_on.NOV-30"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ConsumptionV1" page
     When clicks on the "peça_internet_aos_seus_amigos" entrypoint
     Then the internal webview with "Pedir Internet" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "ConsumptionV1" page is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-4827 |
