# -*- coding: utf-8 -*-
@jira.QANOV-1391
Feature: Balance module


  @jira.QANOV-1392 @android @cert2 @impeded_legacy @ios @jira.cv.10.5 @jira.link.detects.MOVES-4604
  @jira.link.detects.MOVES-5539 @jira.link.detects.MOVES-5540 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-64016 @live @manual @mobile @moves @next @regression
  Scenario: Legado prepay user can access to the detailed "available credit" screen for his/her mobile line: a list with the available credits will be shown
    internal_checkpoint="the credits will be displayed only if they are available for the user.
    the expiration date will be shown only for credits with expiration date (with the 'Caduca el XX mmm' format)
    the 'más información' link won't be shown if there's no more information to show."
    Given user has a "legado prepay" account type
      And user has a ">0" balance
      And user has the matching subscription selected in the account
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "balance_module.link" link
     Then the "Balance" page is displayed
      And the "Saldo" header is displayed
      And the "balance_text_title" textfield with "Tienes" text is displayed
      And the "balance_text_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "top_up_button" button with "Recargar" text is displayed
      And the "last_movements.title" textfield with "Últimos movimientos" text is displayed
      And the "last_movements.icon" icon is displayed
      And the "last_movements.chevron" icon is displayed
      And the "balance_type_summary" textfield with "TIPOS DE SALDO" text is displayed
      And the "type_of_balance" list is displayed
      And each element in the "type_of_balance" list has the "title" textfield with "Saldo" text
      And each element in the "type_of_balance" list has the "expiration_date" textfield with the "Caduca el \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format
      And each element in the "type_of_balance" list has the "status" field
      And each element in the "type_of_balance" list has the "amount" textfield with the "(-)?\d+,\d\d( | )€" format
