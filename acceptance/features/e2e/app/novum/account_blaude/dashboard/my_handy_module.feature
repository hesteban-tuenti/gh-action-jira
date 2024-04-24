# -*- coding: utf-8 -*-
@jira.QANOV-203286 @raitt_drop1
Feature: My Handy module

  Actions Before each Scenario:
    Given user has any of the "device-plan,device-plan-terminated" modules configured in CMS for "dashboard" page
      And user is in the "Account" page


  @jira.QANOV-203288 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202552 @jira.link.detects.OBO2DE-225
  @jira.link.detects.OBO2DE-133 @jira.link.detects.LOC-1160 @automatic @mobile @sanity @ber @qa @webapp
  Scenario: Postpay user with MyHandy product/s not fully paid can see the MyHandy card
    Possible values of the My Handy contract status: ongoing (blue), early payment requested (blue), early payment
    cancelled (grey), overdue (orange), fully paid (green).
    A MyHandy product in "active" status is a a MyHandy product with the contract in any of the possible status except
    the "Fully paid".
    Given user has a "my_handy" product with any of "ongoing;early_payment_requested;early_payment_cancelled;overdue" contracts
      And user has the matching subscription selected in the account
     Then the "myhandy" module is displayed
      And the "myhandy.tag" textfield with the "(Nächste Zahlung am \d{2}. (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{2}|Vorzeitige Abzahlung angefragt|Vorzeitige Abzahlung storniert|Überfällig am \d{2}. (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{2})" format is displayed
      And the "myhandy.title" textfield is displayed
      And the "myhandy.paid_amount" textfield with the "\d+,\d{2} €" format is displayed
      And the "myhandy.total_amount" textfield with the "von \d+,\d{2} € gezahlt" format is displayed
      And the "myhandy.progress_bar" progress bar is displayed
      And the "myhandy.monthly_payment" textfield with the "\d+,\d{2} € im Monat" format is displayed
      And the "myhandy.link" link with "Details anzeigen" text is displayed

  @jira.QANOV-203289 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-202552 @automatic @mobile
  @smoke @qa @webapp
  Scenario: Postpay user with MyHandy product/s fully paid can see the MyHandy card
    Possible values of the My Handy contract status: ongoing (blue), early payment requested (blue), early payment
    cancelled (red), overdue (orange), fully paid (green).
    Given user has a "my_handy" product with a "fully_paid" contract
      And user has the matching subscription selected in the account
     Then the "myhandy" module is displayed
      And the "myhandy.tag" textfield is displayed
      And the "myhandy.title" textfield is displayed
      And the "myhandy.fully_paid_text" textfield is displayed
      And the "myhandy.link" link is displayed
