# -*- coding: utf-8 -*-
@jira.QANOV-4905
Feature: Digital invoice

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @no_automatable @regression @vivobr @old_app
  Scenario Outline: Legacy user with the "Conta digital" service activated can see the status of this service
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "digital_invoice" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     Then the "bills_settings.digital_invoice_title_textfield" textfield with "Conta Digital" text is displayed
      And the "bills_settings.digital_invoice_status_textfield" textfield with "Ativado" text is displayed

    Examples:
          | account_type   | depends_on            | cv   | parent_test_plan | jira_id      |
          | legacy control | QANOV-3883:QANOV-3885 | 9.7  | QANOV-21950      | QANOV-4906   |
          | legacy postpay | QANOV-3884:QANOV-3886 | 9.7  | QANOV-21950      | QANOV-4907   |
          | jeri postpay   | QANOV-3884:QANOV-3886 | 13.6 | QANOV-226748     | QANOV-228844 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @no_automatable @regression @vivobr @old_app
  Scenario Outline: Legacy user with the "Conta digital" service deactivated can see the status of this service
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "digital_invoice" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     Then the "bills_settings.digital_invoice_title_textfield" textfield with "Conta Digital" text is displayed
      And the "bills_settings.digital_invoice_status_textfield" textfield with "Desativada" text is displayed

    Examples:
          | account_type   | depends_on            | cv   | parent_test_plan | jira_id      |
          | legacy control | QANOV-3883:QANOV-3885 | 9.7  | QANOV-21950      | QANOV-4911   |
          | legacy postpay | QANOV-3884:QANOV-3886 | 9.7  | QANOV-21950      | QANOV-4912   |
          | jeri postpay   | QANOV-3884:QANOV-3886 | 13.6 | QANOV-226748     | QANOV-228845 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-904 @mobile @no_automatable @smoke @vivobr
  Scenario Outline: Legacy user can access to the "Conta digital" screen when this service is activated
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "digital_invoice" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "bills_send.digital_invoice_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Conta Digital" string is displayed

    Examples:
          | account_type   | depends_on | cv   | parent_test_plan | jira_id      |
          | legacy control | QANOV-4906 | 9.7  | QANOV-21950      | QANOV-4916   |
          | legacy postpay | QANOV-4907 | 9.7  | QANOV-21950      | QANOV-4917   |
          | jeri postpay   |            | 13.6 | QANOV-226748     | QANOV-228846 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.9.7 @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.QANOV-21950 @jira.link.relates_to.NOV-903 @mobile @no_automatable @regression @vivobr
  Scenario Outline: Legacy user can access to the "Conta digital" screen when this service is deactivated
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "digital_invoice" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "bills_settings.digital_invoice_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Conta Digital" string is displayed

    Examples:
          | account_type   | depends_on | cv   | parent_test_plan | jira_id      |
          | legacy control | QANOV-4911 | 9.7  | QANOV-21950      | QANOV-4921   |
          | legacy postpay | QANOV-4912 | 9.7  | QANOV-21950      | QANOV-4922   |
          | jeri postpay   |            | 13.6 | QANOV-226748     | QANOV-228847 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-2463 @mobile @no_automatable @smoke @vivobr
  Scenario Outline: Legacy user with the "Conta digital" service activated can change the email from the "Faturas" screen
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has "digital_invoice" service in "activated" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "bills_settings.email_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Conta Digital" string is displayed

    Examples:
          | account_type   | depends_on | cv   | parent_test_plan | jira_id      |
          | legacy control | QANOV-4906 | 9.7  | QANOV-21950      | QANOV-4926   |
          | legacy postpay | QANOV-4907 | 9.7  | QANOV-21950      | QANOV-4927   |
          | jeri postpay   |            | 13.6 | QANOV-226748     | QANOV-228848 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-86424 @mobile @no_automatable @regression
  @vivobr
  Scenario Outline: Legacy user who comes from the "Conta digital" screen can access to any button/link in the "Conta" screen
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "bills_settings.digital_invoice_entrypoint" entrypoint
      And the internal webview is displayed
      And clicks on the "bills_tab" tab
      And the "BillsV1" page is displayed
      And clicks on the "<bills_entrypoint>" entrypoint
     Then the internal webview is displayed

    Examples:
          | account_type   | bills_entrypoint                          | depends_on            | cv   | parent_test_plan | jira_id      |
          | legacy control | bills_settings.digital_invoice_entrypoint | QANOV-4916:QANOV-4921 | 9.7  | QANOV-21950      | QANOV-4933   |
          | legacy control | bills_settings.automatic_debit_entrypoint | QANOV-4916:QANOV-4921 | 9.7  | QANOV-21950      | QANOV-4934   |
          | legacy postpay | bills_settings.digital_invoice_entrypoint | QANOV-4917:QANOV-4922 | 9.7  | QANOV-21950      | QANOV-4935   |
          | legacy postpay | bills_settings.automatic_debit_entrypoint | QANOV-4917:QANOV-4922 | 9.7  | QANOV-21950      | QANOV-4936   |
          | jeri postpay   | bills_settings.digital_invoice_entrypoint | QANOV-4917:QANOV-4922 | 13.6 | QANOV-226748     | QANOV-228849 |
          | jeri postpay   | bills_settings.automatic_debit_entrypoint | QANOV-4917:QANOV-4922 | 13.6 | QANOV-226748     | QANOV-228850 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-286294 @manual
  @mobile @vivobr @old_app
  Scenario Outline: <account_type> user with the "Conta digital" service deactivated can see the status of this service
    Given user has a "<account_type>" account type
      And user has "digital_invoice" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     Then the "bills_send.digital_invoice_title_textfield" textfield with "Fatura Digital" text is displayed
      And the "bills_send.digital_invoice_status_textfield" textfield with "Desativada" text is displayed

    Examples:
          | account_type | priority | jira_id      |
          | beatrix      | sanity   | QANOV-287422 |
          | multivivo    | smoke    | QANOV-287423 |
          | convergente  | smoke    | QANOV-287424 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-286294
  @manual @mobile @vivobr @old_app
  Scenario Outline: <account_type> user with the "Conta digital" service activated and email delivery mode
    Given user has a "<account_type>" account type
      And user has "digital_invoice" service in "activated" status
      And user has "email" delivery mode
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     Then the "bills_send.digital_invoice_title_textfield" textfield with "Fatura Digital" text is displayed
      And the "bills_send.digital_invoice_status_textfield" textfield with "Ativada" text is displayed
      And the "bills_send.digital_invoice_email_textfield" textfield is displayed

    Examples:
          | account_type | priority | jira_id      |
          | beatrix      | sanity   | QANOV-287425 |
          | multivivo    | smoke    | QANOV-287426 |
          | convergente  | smoke    | QANOV-287427 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-286294 @manual @mobile
  @vivobr @old_app
  Scenario Outline: <account_type> user with the "Conta digital" service and paper delivery mode
    Given user has a "<account_type>" account type
      And user has "digital_invoice" service in "deactivated" status
      And user has "paper" delivery mode
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     Then the "bills_send.digital_invoice_title_textfield" textfield with "Fatura Digital" text is displayed
      And the "bills_send.digital_invoice_status_textfield" textfield with "Desativada" text is displayed
      And the "bills_send.digital_invoice_email_textfield" textfield is not displayed

    Examples:
          | account_type | priority | jira_id      |
          | beatrix      | sanity   | QANOV-287428 |
          | multivivo    | smoke    | QANOV-287429 |
          | convergente  | smoke    | QANOV-287430 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-286294 @manual @mobile
  @vivobr @old_app
  Scenario Outline: <account_type> user with the "Conta digital" service activated and vivo_app delivery mode
    Given user has a "<account_type>" account type
      And user has "digital_invoice" service in "activated" status
      And user has "vivo_app" delivery mode
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     Then the "bills_send.digital_invoice_title_textfield" textfield with "Fatura Digital" text is displayed
      And the "bills_send.digital_invoice_status_textfield" textfield with "Ativada" text is displayed
      And the "bills_send.digital_invoice_email_textfield" textfield is not displayed

    Examples:
          | account_type | priority | jira_id      |
          | beatrix      | sanity   | QANOV-287431 |
          | multivivo    | smoke    | QANOV-287432 |
          | convergente  | smoke    | QANOV-287433 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-286294
  @manual @mobile @vivobr @old_app
  Scenario Outline: <account_type> user can access to the "Conta digital" screen
    Given user has a "<account_type>" account type
      And user has "digital_invoice" service in "any" status
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     When clicks on the "bills_send.digital_invoice_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Fatura Digital" string is displayed

    Examples:
          | account_type | priority | jira_id      |
          | beatrix      | sanity   | QANOV-287434 |
          | multivivo    | smoke    | QANOV-287435 |
          | convergente  | smoke    | QANOV-287436 |
