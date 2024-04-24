# -*- coding: utf-8 -*-
@jira.QANOV-4943
Feature: Automatic debit


  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @no_automatable @regression @vivobr @old_app
  Scenario Outline: Legacy user can see the status of the "Débito automático" service
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "automatic_debit" service in "<automatic_debit_status>" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     Then the "bills_settings.automatic_debit_title_textfield" textfield with "Débito automático" text is displayed
      And the "bills_settings.automatic_debit_status_textfield" textfield with "<automatic_debit_text>" text is displayed

    Examples:
          | account_type   | automatic_debit_status | automatic_debit_text | depends_on            | cv     | parent_test_plan | jira_id      |
          | legacy control | activated              | Ativado              | QANOV-3883:QANOV-3885 | 9.7    | QANOV-21950      | QANOV-4944   |
          | legacy control | deactivated            | Desativado           | QANOV-3883:QANOV-3885 | 9.7    | QANOV-21950      | QANOV-4945   |
          | legacy control | pending                | Pendente             | QANOV-3883:QANOV-3885 | 9.7    | QANOV-21950      | QANOV-4946   |
          | legacy postpay | activated              | Ativado              | QANOV-3884:QANOV-3886 | 9.7    | QANOV-21950      | QANOV-4947   |
          | legacy postpay | deactivated            | Desativado           | QANOV-3884:QANOV-3886 | 9.7    | QANOV-21950      | QANOV-4948   |
          | legacy postpay | pending                | Pendente             | QANOV-3884:QANOV-3886 | 9.7    | QANOV-21950      | QANOV-4949   |
          | jeri postpay   | activated              | Ativado              |                       | 13.6   | QANOV-226748     | QANOV-228835 |
          | jeri postpay   | deactivated            | Desativado           |                       | 13.6   | QANOV-226748     | QANOV-228836 |
          | jeri postpay   | pending                | Pendente             |                       | 13.6   | QANOV-226748     | QANOV-228837 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-908 @mobile @no_automatable @regression @vivobr
  Scenario Outline: Legacy user can access to the "Débito automático" screen when this service is activated
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "automatic_debit" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "bills_settings.automatic_debit_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Débito automático" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "BillsV1" page is displayed

    Examples:
          | account_type   | depends_on | cv     | parent_test_plan | jira_id      |
          | legacy control | QANOV-4944 | 9.7    | QANOV-21950      | QANOV-4961   |
          | legacy postpay | QANOV-4947 | 9.7    | QANOV-21950      | QANOV-4962   |
          | jeri postpay   |            | 13.6   | QANOV-226748     | QANOV-228838 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-906 @mobile @no_automatable @smoke @vivobr
  Scenario Outline: Legacy user can access to the "Débito automático" screen when this service is deactivated
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "automatic_debit" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "bills_settings.automatic_debit_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Débito automático" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "BillsV1" page is displayed

    Examples:
          | account_type   | depends_on | cv     | parent_test_plan | jira_id      |
          | legacy control | QANOV-4945 | 9.7    | QANOV-21950      | QANOV-4968   |
          | legacy postpay | QANOV-4948 | 9.7    | QANOV-21950      | QANOV-4969   |
          | jeri postpay   |            | 13.6   | QANOV-226748     | QANOV-228839 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-907 @mobile @no_automatable @regression @vivobr
  Scenario Outline: Legacy user can access to the "Débito automático" screen when this service is in activation progress
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "automatic_debit" service in "pending" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "bills_settings.automatic_debit_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Débito automático" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "BillsV1" page is displayed

    Examples:
          | account_type   | depends_on | cv     | parent_test_plan | jira_id      |
          | legacy control | QANOV-4946 | 9.7    | QANOV-21950      | QANOV-4974   |
          | legacy postpay | QANOV-4949 | 9.7    | QANOV-21950      | QANOV-4975   |
          | jeri postpay   |            | 13.6   | QANOV-226748     | QANOV-228840 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-78251 @mobile @no_automatable @regression
  @vivobr
  Scenario Outline: Legacy user who comes from the "Débito automático" screen can access to any button/link in the "Conta" screen
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "bills_settings.automatic_debit_entrypoint" entrypoint
      And the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "BillsV1" page is displayed
      And clicks on the "<bills_entrypoint>" entrypoint
     Then the internal webview is displayed

    Examples:
          | account_type   | bills_entrypoint                          | depends_on                       | cv     | parent_test_plan | jira_id      |
          | legacy control | bills_settings.digital_invoice_entrypoint | QANOV-4961:QANOV-4968:QANOV-4974 | 9.7    | QANOV-21950      | QANOV-4980   |
          | legacy control | bills_settings.automatic_debit_entrypoint | QANOV-4961:QANOV-4968:QANOV-4974 | 9.7    | QANOV-21950      | QANOV-4981   |
          | legacy postpay | bills_settings.digital_invoice_entrypoint | QANOV-4962:QANOV-4969:QANOV-4975 | 9.7    | QANOV-21950      | QANOV-4982   |
          | legacy postpay | bills_settings.automatic_debit_entrypoint | QANOV-4962:QANOV-4969:QANOV-4975 | 9.7    | QANOV-21950      | QANOV-4983   |
          | jeri postpay   | bills_settings.digital_invoice_entrypoint | QANOV-4962:QANOV-4969:QANOV-4975 | 13.6   | QANOV-226748     | QANOV-228841 |
          | jeri postpay   | bills_settings.automatic_debit_entrypoint | QANOV-4962:QANOV-4969:QANOV-4975 | 13.6   | QANOV-226748     | QANOV-228842 |
