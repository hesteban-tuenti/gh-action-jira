# -*- coding: utf-8 -*-
@jira.QANOV-492593
Feature: Invoices Card

  
  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity @vivobr
  Scenario Outline: <account_type> user with one bill in delayed status for a plan can see the delayed card in the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has "<=3" bills to be displayed for the actual month
      And user has "1" bill with "delayed" status for a plan
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Atrasada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button with "Pagar fatura" text is displayed
      And the "bills_summary.bills_details" link with "Exibir detalhes" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-492594 |
          | multivivo    | QANOV-492595 |
          | convergente  | QANOV-492596 |

  @jira.<jira_id> @android @<ber> @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario Outline: <account_type> user with more than one bill in delayed status for a plan can see the delayed card in the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has "<=3" bills to be displayed for the actual month
      And user has ">1" bill with "delayed" status for a plan
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Atrasada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button with "Negociar fatura" text is displayed
      And the "bills_summary.bills_details" link with "Exibir detalhes" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-519417 |
          | multivivo    |     | QANOV-519418 |
          | convergente  |     | QANOV-519419 |

  @jira.<jira_id> @android @<ber> @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario Outline: <account_type> user with one bill in delayed status for a plan can see the delayed card in the "Bills Central Details" screen
    Given user has a "<account_type>" account type
      And user has ">3" bills to be displayed for the actual month
      And user has "1" bill with "delayed" status for a plan
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
     Then the "Bills Central Details" page is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Atrasada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button with "Pagar fatura" text is displayed
      And the "bills_summary.bills_details" link with "Exibir detalhes" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      |     | QANOV-492597 |
          | multivivo    | ber | QANOV-492598 |
          | convergente  |     | QANOV-492599 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario Outline: <account_type> user with more than one bill in delayed status for a plan can see the delayed card in the "Bills Central Details" screen
    Given user has a "<account_type>" account type
      And user has ">3" bills to be displayed for the actual month
      And user has ">1" bill with "delayed" status for a plan
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
     Then the "Bills Central Details" page is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Atrasada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button with "Negociar fatura" text is displayed
      And the "bills_summary.bills_details" link with "Exibir detalhes" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-519420 |
          | multivivo    | QANOV-519421 |
          | convergente  | QANOV-519422 |

  @jira.<jira_id> @android @<ber> @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario Outline: <account_type> user with bills in paid status can see the paid card in the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has the last month with "paid" bill
      And user has "<=3" bills to be displayed for the actual month
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Paga" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button is not displayed
      And the "bills_summary.bills_details" link is not displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-492606 |
          | multivivo    |     | QANOV-492607 |
          | convergente  |     | QANOV-492608 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario Outline: <account_type> user with bills in paid status can see the paid card in the "Bills Central Details" screen
    Given user has a "<account_type>" account type
      And user has ">3" bills to be displayed for the actual month
      And user has the last month with "paid" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
     Then the "Bills Central Details" page is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Paga" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button is not displayed
      And the "bills_summary.bills_details" link is not displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-492609 |
          | multivivo    | QANOV-492610 |
          | convergente  | QANOV-492611 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user with bills in isenta status can see the isenta card in the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has "<=3" bills to be displayed for the actual month
      And user has the last month with "zero_amount" bill
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Isenta" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button is not displayed
      And the "bills_summary.bills_details" link is not displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-492612 |
          | multivivo    | QANOV-492613 |
          | convergente  | QANOV-492614 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user with bills in isenta status can see the isenta card in the "Bills Central Details" screen
    Given user has a "<account_type>" account type
      And user has ">3" bills to be displayed for the actual month
      And user has the last month with "zero_amount" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
     Then the "Bills Central Details" page is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Isenta" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button is not displayed
      And the "bills_summary.bills_details" link is not displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-492615 |
          | multivivo    | QANOV-492616 |
          | convergente  | QANOV-492617 |

  @jira.<jira_id> @android @<ber> @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke
  @vivobr
  Scenario Outline: <account_type> user with bills in pending status can see the pending card in the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has "<=3" bills to be displayed for the actual month
      And user has the last month with "pending" bill
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Pronta pra pagar" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Vence em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button with "Pagar fatura" text is displayed
      And the "bills_summary.bills_details" link with "Exibir detalhes" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      |     | QANOV-492618 |
          | multivivo    |     | QANOV-492619 |
          | convergente  | ber | QANOV-492620 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke
  @vivobr
  Scenario Outline: <account_type> user with bills in pending status can see the pending card in the "Bills Central Details" screen
    Given user has a "<account_type>" account type
      And user has ">3" bills to be displayed for the actual month
      And user has the last month with "pending" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
     Then the "Bills Central Details" page is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Pronta pra pagar" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Vence em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.pay_bill" button with "Pagar fatura" text is displayed
      And the "bills_summary.bills_details" link with "Exibir detalhes" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-492621 |
          | multivivo    | QANOV-492622 |
          | convergente  | QANOV-492623 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @regression
  @vivobr
  Scenario Outline: <account_type> user with bills in contested status can see the contested card in the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has "<=3" bills to be displayed for the actual month
      And user has a month with "contested" bill
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield that contains the "Contestada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Vence em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount_risked" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-492630 |
          | multivivo    | QANOV-492631 |
          | convergente  | QANOV-492632 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @regression
  @vivobr
  Scenario Outline: <account_type> user with bills in contested status can see the contested card in the "Bills Central Details" screen
    Given user has a "<account_type>" account type
      And user has ">3" bills to be displayed for the actual month
      And user has a month with "contested" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
     Then the "Bills Central Details" page is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield that contains the "Contestada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Vence em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount_risked" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-492633 |
          | multivivo    | QANOV-492634 |
          | convergente  | QANOV-492635 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-497058 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user with bills in negociada status can see the negociada card in the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has "<=3" bills to be displayed for the actual month
      And user has a month with "negociada" bill
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Negociada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.bills_acordo" link with "Exibir acordo" text is displayed
      And the "bills_summary.bills_details" link with "Exibir detalhes" text is displayed

    Examples:
          | account_type | ber | jira_id      |
          | beatrix      | ber | QANOV-492636 |
          | multivivo    |     | QANOV-492637 |
          | convergente  |     | QANOV-492638 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-497058 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user with bills in negociada status can see the negociada card in the "Bills Central Details" screen
    Given user has a "<account_type>" account type
      And user has ">3" bills to be displayed for the actual month
      And user has a month with "negociada" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
     Then the "Bills Central Details" page is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Negociada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.bills_acordo" link with "Exibir acordo" text is displayed
      And the "bills_summary.bills_details" link with "Exibir detalhes" text is displayed

    Examples:
          | account_type | jira_id      |
          | beatrix      | QANOV-492639 |
          | multivivo    | QANOV-492640 |
          | convergente  | QANOV-492641 |

  @jira.QANOV-492642 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-497058 @manual @mobile
  @regression @vivobr
  Scenario: User with negociada bill can access to acordos screen in Bills central page
    Given user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user has a month with "negociada" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_summary.bills_acordo" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-492643 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-497058 @manual @mobile
  @regression @vivobr
  Scenario: User with negociada bill can access to acordos screen in Bills Central Details page
    Given user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
      And user has a month with "negociada" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
      And the "Bills Central Details" page is displayed
      And clicks on the "bills_summary.bills_acordo" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central Details" page is displayed

  @jira.QANOV-492644 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario: User with bill can access to bills details screen in Bills central page
    Given user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user has a month with "unpaid" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_summary.bills_details" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-492645 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile
  @regression @vivobr
  Scenario: User with bill can access to Bills details screen in Bills Central Details page
    Given user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
      And user has a month with "unpaid" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
      And the "Bills Central Details" page is displayed
      And clicks on the "bills_summary.bills_details" button
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central Details" page is displayed

  @jira.QANOV-492646 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario: User with bill can access to bills details screen when taps on any card in Bills central page
    Given user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user is in the "Bills Central" page
     When clicks on any element in the "bills_central_cards" list
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central" page is displayed

  @jira.QANOV-492647 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile
  @regression @vivobr
  Scenario: User with bill can access to Bills details screen when taps on any card in Bills Central Details page
    Given user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
      And the "Bills Central Details" page is displayed
      And clicks on any element in the "bills_central_cards" list
     Then the internal webview is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills Central Details" page is displayed

  @jira.QANOV-517440 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke @vivobr
  Scenario: User with bills in negociada status can see the negociada card in the "Bills Central" screen without the "Exhibir acordo" link during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user has a month with "negociada" bill
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Negociada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.bills_acordo" link is not displayed

  @jira.QANOV-517441 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @regression
  @vivobr
  Scenario: User with bills in negociada status can see the negociada card in the "Bills Central Details" screen without the "Exhibir acordo" link during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
      And user has a month with "negociada" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" button
     Then the "Bills Central Details" page is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.label_icon" icon is displayed
      And the "bills_summary.label_status" textfield with "Negociada" text is displayed
      And the "bills_summary.meatball_menu" button is displayed
      And the "bills_summary.date" textfield with "Venceu em \d\d/\d\d" text is displayed
      And the "bills_summary.bill_month" textfield with the "Fatura de (janeiro|fevereiro|março|abril|maio|junho|julho|agosto|setembro|outubro|novembro|dezembro)" format is displayed
      And the "bills_summary.bill_amount" textfield with "R\$ -?\d+(?:.\d+)*,\d\d" text is displayed
      And the "bills_summary.bills_acordo" link is not displayed
