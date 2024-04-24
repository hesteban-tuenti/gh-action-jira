# -*- coding: utf-8 -*-
@jira.QANOV-5000
Feature: Bundle Management


  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-780 @live @mobile @next @no_automatable @regression @vivobr @old_app
  Scenario Outline: Legacy user can access to the "Contrate um Pacote Adicional" service
    commented_tags="@depends_on.NOV-716"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "ConsumptionV1" page
     When clicks on the "contrate_um_pacote_adicional" entrypoint
     Then the internal webview is displayed
      And the "Pacotes adicionais" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "ConsumptionV1" page is displayed

    Examples:
          | account_type   | cv     | parent_test_plan | jira_id      |
          | legacy control | 9.7    | QANOV-21950      | QANOV-5002   |
          | legacy postpay | 9.7    | QANOV-21950      | QANOV-5004   |
          | jeri postpay   | 13.6   | QANOV-226748     | QANOV-228843 |
