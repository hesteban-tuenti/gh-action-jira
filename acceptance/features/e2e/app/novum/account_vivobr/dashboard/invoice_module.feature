# -*- coding: utf-8 -*-
@jira.QANOV-126816
Feature: Invoice Module


  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @old_app
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-100989 @manual @mobile @regression @vivobr
  Scenario Outline: User cannot see the last invoice in the account dashboard if an error occurs when requesting this information
    Given user has a "<account_type>" account type
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on the "navigation_top_bar.options_reload" icon
      And there is an API error when requesting the billing information
     Then the "Account" page is displayed
      And the "bills" module is displayed
      And the "bills.internal_error_bills_title_textfield" textfield with "[LANG:account.dashboard.internal_error_bills_title]" text is displayed
      And the "bills.internal_error_bills_subtitle_textfield" textfield with "[LANG:account.dashboard.internal_error_bills_subtitle]" text is displayed
      And the "bills.internal_error_bills_refresh_icon" icon is displayed
      And the "bills.internal_error_bills_link" link with "Ver detalhes da fatura" text is displayed

    Examples:
          | cv    | account_type | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-21949      | QANOV-3915 |
          | 12.0  | convergente  | QANOV-21791      | QANOV-3916 |
          | 11.12 | multivivo    | QANOV-21949      | QANOV-3917 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-100988 @mobile @smoke @vivobr @webapp @old_app
  Scenario Outline: User without bills can see the empty-case message in the account dashboard
    other_affected_versions="2021-45-B"
    User in QA: qavivo-05, qavivo-15
    Given user has a "<account_type>" account type
      And user has a "<user_plan>" plan in "<status>" status
      And user has no bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills" module is displayed
      And the "bills.empty_case.icon" icon is displayed
      And the "bills.empty_case.title" textfield with "[LANG:account.dashboard.no_bills_title]" text is displayed
      And the "bills.empty_case.subtitle" textfield with "[LANG:account.dashboard.no_bills_subtitle]" text is displayed
      And the "bills.empty_case.button" button with "Ver detalhes" text is displayed

    @live @next @qa
    Examples:
          | cv    | account_type | user_plan | status | parent_test_plan | ber | jira_id    |
          | 11.12 | beatrix      | monoline  | active | QANOV-21949      |     | QANOV-3921 |

    @qa
    Examples:
          | cv    | account_type | user_plan | status  | parent_test_plan        | ber | jira_id      |
          | 12.0  | convergente  | any       | active  | QANOV-21791:QANOV-66163 | ber | QANOV-340278 |
          | 12.4  | convergente  | any       | pending | QANOV-56585             |     | QANOV-56934  |
          | 11.12 | multivivo    | any       | active  | QANOV-21949             |     | QANOV-3923   |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @smoke @vivobr
  @old_app
  Scenario Outline: Cancelled user without bills can see the empty-case message in the account dashboard
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "any" plan in "cancelled" status
      And user does not have a "siebel" plan
      And user has no bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills" module is displayed
      And the "bills.no_bills_icon" icon is displayed
      And the "bills.no_bills_title_textfield" textfield with "[LANG:account.dashboard.no_bills_title]" text is displayed
      And the "bills.no_bills_subtitle_textfield" textfield with "[LANG:account.dashboard.no_bills_subtitle]" text is displayed
      And the "bills.no_bills_button" button with "Ver detalhes" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403066 |
          | beatrix      | QANOV-403067 |
          | multivivo    | QANOV-403068 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-100979 @live @mobile @next @qa @sanity @vivobr @webapp @old_app
  Scenario Outline: A <account_type> user can see the last invoice module in the account dashboard
    User in QA: qavivo-02, qavivo-03
    Given user has a "<account_type>" account type
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills" module is displayed
      And the "bills.tag" textfield is displayed
      And the "bills.expiration_date" textfield with the "^(Vence em|Venceu em) .*" format is displayed
      And the "bills.amount" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

    Examples:
          | cv    | account_type | parent_test_plan        | ber | jira_id    |
          | 11.12 | beatrix      | QANOV-21949             | ber | QANOV-3927 |
          | 11.12 | multivivo    | QANOV-21949             |     | QANOV-3929 |
          | 12.0  | convergente  | QANOV-21791:QANOV-66163 |     | QANOV-3928 |

  @jira.<jira_id> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual @mobile @smoke
  @vivobr @old_app
  Scenario Outline: A <account_type> cancelled user with bills can see the last invoice module in the account dashboard
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "any" plan in "cancelled" status
      And user does not have a "siebel" plan
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills" module is displayed
      And the "bills.status_textfield" textfield is displayed
      And the "bills.expiration_date_textfield" textfield is displayed
      And the "bills.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.more_bills_link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-403069 |
          | beatrix      | QANOV-403070 |
          | multivivo    | QANOV-403071 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-217458 @jira.link.relates_to.NOV-100979
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User can see a last invoice with "paid" status in the account dashboard
    internal_checkpoint="A paid invoice will have a green bar icon to identify the status."
    Given user has a "<account_type>" account type
      And user has the last bill in "paid" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills.status_textfield" textfield that contains the "Fatura paga" text is displayed
      And the "bills.expiration_date_textfield" textfield with the "Vence em dd/mmm" format is displayed
      And the "bills.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.pay_bill_button" button is not displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-3927 | QANOV-21949      | QANOV-3930 |
          | 12.0  | convergente  | QANOV-3928 | QANOV-21791      | QANOV-3931 |
          | 11.12 | multivivo    | QANOV-3929 | QANOV-21949      | QANOV-3932 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-217458 @jira.link.relates_to.NOV-100979
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User can see a last invoice with "zero amount" status in the account dashboard
    internal_checkpoint="A zero amount invoice will have a green bar icon to identify the status.
    The amount will be between 0 and 10 R$"
    Given user has a "<account_type>" account type
      And user has the last bill in "zero_amount" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills.status_textfield" textfield that contains the "Fatura isenta" text is displayed
      And the "bills.expiration_date_textfield" textfield with the "Vence em dd/mmm" format is displayed
      And the "bills.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.amount_textfield" textfield contains an ">=0" amount
      And the "bills.amount_textfield" textfield contains an "<=10" amount
      And the "bills.pay_bill_button" button is not displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-3927 | QANOV-21949      | QANOV-3933 |
          | 12.0  | convergente  | QANOV-3928 | QANOV-21791      | QANOV-3934 |
          | 11.12 | multivivo    | QANOV-3929 | QANOV-21949      | QANOV-3935 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-217458 @jira.link.relates_to.NOV-100979
  @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User can see a last invoice with "pending" status in the account dashboard
    internal_checkpoint="A pending invoice will have an orange bar icon to identify the status."
    Given user has a "<account_type>" account type
      And user has the last bill in "pending" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then And the "bills.status_textfield" textfield that contains the "Fatura pronta para pagar" text is displayed
      And the "bills.expiration_date_textfield" textfield with the "Vence em dd/mmm" format is displayed
      And the "bills.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.pay_bill_button" button with "Pagar fatura" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-3927 | QANOV-21949      | QANOV-3936 |
          | 12.0  | convergente  | QANOV-3928 | QANOV-21791      | QANOV-3937 |
          | 11.12 | multivivo    | QANOV-3929 | QANOV-21949      | QANOV-3938 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.VIVO-2546 @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-217458
  @jira.link.relates_to.NOV-100979 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User can see a last invoice with "delayed" status in the account dashboard
    internal_checkpoint="A delayed invoice will have a red bar icon to identify the status."
    Given user has a "<account_type>" account type
      And user has the last bill in "delayed" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills.status_textfield" textfield that contains the "Fatura vencida" text is displayed
      And the "bills.expiration_date_textfield" textfield with the "Vence em dd/mmm" format is displayed
      And the "bills.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.pay_bill_button" button with "Pagar fatura" text is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-3927 | QANOV-21949      | QANOV-3939 |
          | 12.0  | convergente  | QANOV-3928 | QANOV-21791      | QANOV-3940 |
          | 11.12 | multivivo    | QANOV-3929 | QANOV-21949      | QANOV-3941 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-100979 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: User can see a disputed last invoice in the account dashboard
    internal_checkpoint="Any invoice (paid, zero amount, pending, delayed) can be disputed.
    In this case, the status of the invoice will display the sufix '- Contestada'."
    Given user has a "<account_type>" account type
      And user has the last bill in "contested" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills.status_textfield" textfield that contains the "Contestada" text is displayed
      And the "bills.expiration_date_textfield" textfield is displayed
      And the "bills.amount_risked_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-3927 | QANOV-21949      | QANOV-3942 |
          | 12.0  | convergente  | QANOV-3928 | QANOV-21791      | QANOV-3943 |
          | 11.12 | multivivo    | QANOV-3929 | QANOV-21949      | QANOV-3944 |

  @jira.QANOV-66657 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.7 @jira.link.detects.VIVO-2502
  @jira.link.detects.VIVO-2504 @jira.link.detects.VIVO-2505 @jira.link.parent_test_plan.QANOV-66163 @manual @mobile
  @regression @vivobr @old_app
  Scenario: User can see a Negociada last invoice in the account dashboard
    internal_checkpoint="Any invoice (paid, zero amount, pending, delayed) can be Negociada.
    In this case, the status of the invoice will be Negociada."
    Given user has a "convergente" account type
      And user has a "siebel" plan
      And user has the last bill in "negociada" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills.status_textfield" textfield that contains the "Fatura negociada" text is displayed
      And the "bills.expiration_date_textfield" textfield is displayed
      And the "bills.amount_risked_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.acordo_button" button with "Ver acordos" text is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-100979 @manual @mobile @regression @vivobr
  @old_app
  Scenario Outline: User can see a no-disputed last invoice in the account dashboard
    Given user has a "<account_type>" account type
      And user has the last bill in "no_contested" status
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     Then the "bills.status_textfield" textfield that contains the "Contestada" text is not displayed
      And the "bills.expiration_date_textfield" textfield is displayed
      And the "bills.amount_risked_textfield" textfield is not displayed
      And the "bills.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed

    Examples:
          | cv    | account_type | depends_on | parent_test_plan | jira_id    |
          | 11.12 | beatrix      | QANOV-3927 | QANOV-21949      | QANOV-3945 |
          | 12.0  | convergente  | QANOV-3928 | QANOV-21791      | QANOV-3946 |
          | 11.12 | multivivo    | QANOV-3929 | QANOV-21949      | QANOV-3947 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @regression
  @vivobr @old_app
  Scenario Outline: User without bills can see the empty-case message in the account dashboard during a maintenance window
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has no bills
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Account" page
     Then the "bills" module is displayed
      And the "bills.no_bills_icon" icon is displayed
      And the "bills.no_bills_title_textfield" textfield with "[LANG:account.dashboard.no_bills_title]" text is displayed
      And the "bills.no_bills_subtitle_textfield" textfield with "[LANG:account.dashboard.no_bills_subtitle]" text is displayed
      And the "bills.no_bills_button" button with "Ver detalhes" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-323108 |
          | multivivo    | QANOV-323109 |
          | convergente  | QANOV-323110 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-319348 @manual @mobile @sanity
  @vivobr @old_app
  Scenario Outline: A <account_type> user can see the last invoice module in the account dashboard during a maintenance window
    Given user has a "<account_type>" account type
      And user does not have a "siebel" plan
      And user has bills
      And user has the matching subscription selected in the account
      And there is a maintenance window
      And user is in the "Account" page
     Then the "bills" module is displayed
      And the "bills.status_textfield" textfield is displayed
      And the "bills.expiration_date_textfield" textfield is displayed
      And the "bills.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills.more_bills_link" link with "[LANG:account.dashboard.see_more_bills]" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-323111 |
          | multivivo    |     | QANOV-323112 |
          | convergente  |     | QANOV-323113 |
