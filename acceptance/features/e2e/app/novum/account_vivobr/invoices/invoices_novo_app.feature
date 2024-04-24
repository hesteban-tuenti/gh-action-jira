# -*- coding: utf-8 -*-
@jira.QANOV-474625
Feature: Invoices


  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario Outline: <account_type> user without bills can access to the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has a "<user_plan>" plan in "<status>" status
      And user does not have invoices
      And user is in the "Assinatura" page
     When clicks on the "chip_list.bills" button
     Then the "Bills Central" page is displayed
      And the "navigation_top_bar.back_icon" icon is displayed
      And the "navigation_top_bar.faq_icon" icon is displayed
      And the "bills_title" textfield with "Central de faturas" text is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.no_bills_icon" icon is displayed
      And the "bills_summary.no_bills_title_textfield" textfield with "Nenhuma fatura por enquanto" text is displayed
      And the "bills_summary.no_bills_subtitle_textfield" textfield with "Assim que tiver a sua primeira fatura, ela e todas as seguintes vão aparecer aqui" text is displayed
      And the "bills_summary.no_bills_button" button with "Ir para o inicio" text is displayed
      And the "bills_more_info_module" module is displayed

    Examples:
          | account_type | user_plan | status                   | jira_id      |
          | beatrix      | monoline  | active;cancelled         | QANOV-474626 |
          | multivivo    | any       | active;cancelled         | QANOV-474627 |
          | convergente  | any       | active;pending;cancelled | QANOV-474628 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario Outline: A <account_type> user with bills can access to the "Bills Central" screen
    Given user has a "<account_type>" account type
      And user has a "<user_plan>" plan in "<status>" status
      And user has invoices
      And user is in the "Account" page
     When clicks on the "chip_list.bills" link
     Then the "Bills Central" page is displayed
      And the "navigation_top_bar.back_icon" icon is displayed
      And the "navigation_top_bar.faq_icon" icon is displayed
      And the "bills_title" textfield with "Central de faturas" text is displayed
      And the "bills_summary" card is displayed
      And the "bills_history" module is displayed
      And the "bills_more_info_module" module is displayed

    Examples:
          | account_type | user_plan | status    | ber | jira_id      |
          | beatrix      | monoline  | active    | ber | QANOV-474629 |
          | multivivo    | any       | active    |     | QANOV-474630 |
          | convergente  | any       | active    | ber | QANOV-474631 |
          | convergente  | any       | pending   |     | QANOV-474632 |
          | beatrix      | monoline  | cancelled |     | QANOV-474633 |
          | multivivo    | any       | cancelled |     | QANOV-474634 |
          | convergente  | any       | cancelled |     | QANOV-474635 |

  @jira.QANOV-531857 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: A beatrix;multivivo;convergente user without bills for the current month can access to the "Bills Central" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user does not have invoices for the actual month
      And user has invoices for other month
      And user is in the "Account" page
     When clicks on the "chip_list.bills" link
     Then the "Bills Central" page is displayed
      And the "navigation_top_bar.back_icon" icon is displayed
      And the "navigation_top_bar.faq_icon" icon is displayed
      And the "bills_title" textfield with "Central de faturas" text is displayed
      And the "bills_summary" card is displayed
      And the "1" bills to be displayed for the actual month
      And the bills to be displayed for the other month

  @jira.QANOV-474657 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: User with less or equals than 3 bills can not see link in bills_central module in the "Bills Central" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user is in the "Bills Central" page
     Then the "bills_central_cards.link" link is not displayed

  @jira.QANOV-474658 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @sanity
  @vivobr
  Scenario: User with more than 3 bills can see link in bills_central module in the "Bills Central" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
      And user is in the "Bills Central" page
     Then the "bills_central_cards.link" link with the "Exibir mais \d+ faturas" format is displayed

  @jira.QANOV-474659 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke
  @vivobr
  Scenario: User can see the "Bills Central Details" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
     When clicks on the "bills_central_cards.link" link
     Then the "Bills Central Details" page is displayed
      And the "navigation_top_bar.back_icon" icon is displayed
      And the "navigation_top_bar.faq_icon" icon is displayed
      And the "bills_title" textfield with "Central de faturas" text is displayed
      And the "bills_summary" card is displayed
      And the "bills_central_cards" list is ordered "descendent" by "date"

  @jira.QANOV-474660 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-497058 @manual @mobile @smoke @vivobr
  Scenario: User without unpaid bills can see only invoices for the current month in the "Bills Central Details" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
      And user does not have a month with "delayed" bill
      And user does not have a month with "negociada" bill
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" link
     Then the "Bills Central Details" page is displayed
      And each element in the "bills_central_cards" list has the "date" field matching with the current month
      And each element in the "bills_central_cards" list does not have the "label_status" field with the "Atrasada" text
      And each element in the "bills_central_cards" list does not have the "label_status" field with the "Negociada" text

  @jira.<jira_id> @<ber> @<severity> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-454142 @manual
  @mobile @vivobr
  Scenario Outline: User with <status> bills but without <status> bills in the last month can see invoices for the other months in the "Bills Central Details" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
      And user has a month with "<status>" bill
      And user does not have the last month a bill in "<status>" status
      And user is in the "Bills Central" page
     When clicks on the "bills_central_cards.link" link
     Then the "Bills Central Details" page is displayed
      And any element in the "bills_central_cards" list has the "date" field different from the current month
      And any element in the "bills_central_cards" list has the "label_status" textfield with the "<text_status>" text

    Examples:
          | status    | text_status | severity   | ber | jira_id      |
          | delayed   | Atrasada    | sanity     | ber | QANOV-474661 |
          | negociada | Negociada   | regression |     | QANOV-474662 |

  @jira.QANOV-517442 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @sanity
  @vivobr
  Scenario: User will see a warning about the maintenance windows in the "Bills Central" screen during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;multivivo;convergente" account types
      And user is in the "Assinatura" page
     When clicks on the "plans.footer_link" button
     Then the "Bills Central" page is displayed
      And the "maintenance_information" card is displayed

  @jira.QANOV-517443 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @regression
  @vivobr
  Scenario: User without bills can access to the "Bills Central" screen during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;multivivo;convergente" account types
      And user does not have invoices
      And user is in the "Assinatura" page
     When clicks on the "plans.footer_link" button
     Then the "Bills Central" page is displayed
      And the "navigation_top_bar.back_icon" icon is displayed
      And the "navigation_top_bar.faq_icon" icon is displayed
      And the "bills_title" textfield with "Central de faturas" text is displayed
      And the "bills_summary" card is displayed
      And the "bills_summary.no_bills_icon" icon is displayed
      And the "bills_summary.no_bills_title_textfield" textfield with "Nenhuma fatura por enquanto" text is displayed
      And the "bills_summary.no_bills_subtitle_textfield" textfield with "Assim que tiver a sua primeira fatura, ela e todas as seguintes vão aparecer aqui" text is displayed
      And the "bills_summary.no_bills_button" button with "Ir para o inicio" text is displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-517444 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke @vivobr
  Scenario: User with less or equals than 3 bills will see the permited modules in the "Bills Central" screen during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_central_cards" list has "<=3" elements
      And the "bills_central_cards.link" link is not displayed
      And the "bills_history" module is not displayed
      And the "bills_more_info_module" module is displayed

  @jira.QANOV-517445 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-492945 @manual @mobile @smoke
  @vivobr
  Scenario: User with more than 3 bills will see the permitted modules in the "Bills Central" screen during a maintenance window
    Given there is a maintenance window
      And user has any "beatrix;multivivo;convergente" account types
      And user has ">3" bills to be displayed for the actual month
      And user is in the "Bills Central" page
     Then the "bills_summary" card is displayed
      And the "bills_central_cards" list has "3" elements
      And the "bills_central_cards.link" link with the "Exibir mais \d+ faturas" format is displayed
      And the "bills_more_info_module" module is displayed
      And the "bills_history" module is not displayed

  @jira.<jira_id> @<ber> @<severity> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-454142 @manual
  @mobile @vivobr
  Scenario Outline: User with delayed bills but with <status> bills in the last month can see invoices for the other months in the "Bills Central" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user has bill with "delayed" status for other month
      And user has the last month a bill in "<status>" status
      And user is in the "Bills Central" page
     Then any element in the "bills_central_cards" list has the "label_status" textfield with the "Atrasada" text
      And the "bills_central_cards" list is ordered by older unpaid bill date

    Examples:
          | status           | severity   | ber | jira_id      |
          | unpaid           | sanity     | ber | QANOV-605482 |
          | paid;zero_amount | regression |     | QANOV-605483 |

  @jira.QANOV-605484 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: User with paid bills but with pending bills in the last month cannot see paid invoices in the "Bills Central" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user has bill with "paid" status for other month
      And user has the last month a bill in "pending" status
      And user is in the "Bills Central" page
     Then each element in the "bills_central_cards" list does not have the "label_status" field with the "Paga" text

  @jira.QANOV-605485 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-454142 @manual @mobile @smoke @vivobr
  Scenario: User with paid bills in the last month can see newer paid bill in the "Bills Central" screen
    Given user has any "beatrix;multivivo;convergente" account types
      And user has "<=3" bills to be displayed for the actual month
      And user has "several" bills with "paid" status for the actual month
      And user is in the "Bills Central" page
     Then the "bills_central_cards" list is ordered by newer paid bill date
