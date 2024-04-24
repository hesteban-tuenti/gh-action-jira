# -*- coding: utf-8 -*-
@jira.QANOV-127086
Feature: Invoices Settings And Additional Info


  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.CHECKOUT-1703 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-68826
  @mobile @vivobr @old_app
  Scenario Outline: A <account_type> user can see the bills settings in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has a "any" plan in "<status>" status
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "bills_payment_module" module is displayed
      And the "bills_send_module" module is displayed

    @automatic @live @next @qa
    Examples:
          | cv    | account_type | status | test_priority | depends_on | parent_test_plan | ber | jira_id     |
          | 11.12 | beatrix      | active | sanity        | QANOV-3924 | QANOV-21949      | ber | QANOV-96051 |
          | 11.12 | multivivo    | active | sanity        | QANOV-3926 | QANOV-21949      |     | QANOV-96053 |

    @automatic @qa
    Examples:
          | cv   | account_type | status | test_priority | depends_on | parent_test_plan | ber | jira_id      |
          | 12.0 | convergente  | active | smoke         | QANOV-3949 | QANOV-21791      | ber | QANOV-340473 |

    @manual
    Examples:
          | cv   | account_type | status  | test_priority | depends_on              | parent_test_plan | ber | jira_id     |
          | 12.4 | convergente  | pending | regression    | QANOV-56935:QANOV-56936 | QANOV-56585      |     | QANOV-96055 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: A <account_type> cancelled user can see the bills settings in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "any" plan in "cancelled" status
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "bills_payment_module" module is not displayed
      And the "bills_send_module" module is not displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403092 |
          | beatrix      | QANOV-403093 |
          | multivivo    | QANOV-403094 |

  @jira.QANOV-96169 @android @ber @ios @jira.cv.Future @jira.link.depends_on.QANOV-66654 @jira.link.depends_on.QANOV-66658
  @jira.link.parent_test_plan.QANOV-68826 @manual @mobile @smoke @vivobr @old_app
  Scenario: Siebel user can see the bills settings in the "Minhas faturas" screen
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "bills_payment_module" module is displayed
      And the "bills_send_module" module is displayed

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user can see the additional information in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has a "any" plan in "<status>" status
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "bills_more_info_module" module is displayed

    @automatic @live @next @qa
    Examples:
          | cv    | account_type | status | depends_on | parent_test_plan | ber | jira_id      |
          | 11.12 | beatrix      | active | QANOV-3924 | QANOV-21949      | ber | QANOV-340474 |
          | 11.12 | multivivo    | active | QANOV-3926 | QANOV-21949      |     | QANOV-340475 |

    @automatic @qa
    Examples:
          | cv   | account_type | status | depends_on | parent_test_plan | ber | jira_id      |
          | 12.0 | convergente  | active | QANOV-3949 | QANOV-21791      | ber | QANOV-340477 |

    @manual
    Examples:
          | cv   | account_type | status  | depends_on              | parent_test_plan | ber | jira_id     |
          | 12.4 | convergente  | pending | QANOV-56935:QANOV-56936 | QANOV-56585      |     | QANOV-96182 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @smoke
  @vivobr @old_app
  Scenario Outline: A <account_type> cancelled user can see the additional information in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has a "any" plan in "cancelled" status
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "bills_more_info_module" module is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403095 |
          | beatrix      | QANOV-403096 |
          | multivivo    | QANOV-403097 |

  @jira.QANOV-96183 @android @automatic @ios @jira.cv.12.7 @jira.link.depends_on.QANOV-66654 @old_app
  @jira.link.depends_on.QANOV-66658 @jira.link.parent_test_plan.QANOV-66163 @live @mobile @next @smoke @vivobr
  Scenario: Siebel user can see the additional information in the "Minhas faturas" screen
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-list-services" module configured in CMS for "invoices-list" page for the plan selected
      And user is in the "Bills" page
     Then the "bills_more_info_module" module is displayed

  @jira.<jira_id> @android @ios @jira.cv.13.1 @manual @mobile @smoke @vivobr @old_app
  Scenario Outline: A convergente user can see the "<text>" entry point in the "Minhas faturas" screen
    "Cartao de crédito" entrypoint is only available for convergente non-siebel users.
    Given user has a "convergente" account type
      And user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "<text>" entrypoint configured in CMS for the "invoices-settings" list
      And user is in the "Bills" page
     Then the "<entrypoint>" textfield with "<text>" text is displayed

    Examples:
          | entrypoint                                             | plan | text                        | jira_id      |
          | bills_send_module.digital_invoice_title_textfield      | any  | Fatura digital              | QANOV-184282 |
          | bills_payment_module.payment_methods_management        | any  | Adicionar ou remover cartão | QANOV-184283 |
          | bills_payment_module.recurrent_payment_title_textfield | any  | Cartão de crédito           | QANOV-184284 |

  @jira.<jira_id> @android @ios @jira.cv.13.1 @manual @mobile @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user can see the "<text>" entry point in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "<text>" entrypoint configured in CMS for the "invoices-settings" list
      And user is in the "Bills" page
     Then the "<entrypoint>" textfield with "<text>" text is displayed

    Examples:
          | account_type | entrypoint                                             | text                        | jira_id      |
          | beatrix      | bills_send_module.digital_invoice_title_textfield      | Conta digital               | QANOV-184285 |
          | beatrix      | bills_payment_module.payment_methods_management        | Adicionar ou remover cartão | QANOV-184286 |
          | beatrix      | bills_payment_module.recurrent_payment_title_textfield | Cartão de crédito           | QANOV-184287 |
          | multivivo    | bills_send_module.digital_invoice_title_textfield      | Conta digital               | QANOV-184288 |
          | multivivo    | bills_payment_module.payment_methods_management        | Adicionar ou remover cartão | QANOV-184289 |
          | multivivo    | bills_payment_module.recurrent_payment_title_textfield | Cartão de crédito           | QANOV-184290 |

  @jira.<jira_id> @android @ios @jira.cv.13.1 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user can see the "Débito automático" entry point in <status> status in the "Minhas faturas" screen
    Given user has a "<account_type>" account type
      And user has "automatic_debit" service in "<status>" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user has the "invoices-settings" module configured in CMS for "invoices-list" page for the plan selected
      And user has the "Débito automático" entrypoint configured in CMS for the "invoices-settings" list
      And user is in the "Bills" page
     Then the "bills_payment_module.automatic_debit_title_textfield" textfield with "Débito automático" text is displayed
      And the "bills_payment_module.automatic_debit_status_textfield" textfield with "<subtitle>" text is displayed

    Examples:
          | account_type | status      | subtitle   | jira_id      |
          | beatrix      | activated   | Ativado    | QANOV-184291 |
          | beatrix      | deactivated | Desativado | QANOV-184292 |
          | beatrix      | pending     | Pendente   | QANOV-184293 |
          | multivivo    | activated   | Ativado    | QANOV-184294 |
          | multivivo    | deactivated | Desativado | QANOV-184295 |
          | multivivo    | pending     | Pendente   | QANOV-184296 |
          | convergente  | activated   | Ativado    | QANOV-184297 |
          | convergente  | deactivated | Desativado | QANOV-184298 |
          | convergente  | pending     | Pendente   | QANOV-184299 |
