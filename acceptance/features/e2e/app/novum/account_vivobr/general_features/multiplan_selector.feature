# -*- coding: utf-8 -*-
@jira.QANOV-25501
Feature: Multiplan selector


  @jira.<jira_id> @<automation> @<ber> @<exec_mode> @<impeded> @<test_priority> @android @ios @jira.cv.<cv>
  @jira.link.detects.<detects> @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-319348
  @live @mobile @next @qa @vivobr @old_app
  Scenario Outline: User with several plans can see the subscription_selector dropdown
    Possible wired products:
    - TV, Banda Larga or Landline with origin system Siebel (only Amdocs ones are authorized).
    - TV, Banda Larga or Landline with origin system ATIS
    - Legacy TV DTH with origin system NSIA or TV/Internet with origin system SIA.
    - Landline FWT.
    Multiplan user in Live (Internet+TV, Beatrix Control, Beatrix Postpay, Legacy Prepay): +5511944563268 (Hermes)
    If a phone number is saved as a contact, it will appear in the list with the saved contact name
    Given user has "several" plans
      And user has a "<account_type>" account type
      And user has a "<plan_type>" plan in "no cancelled" status
      And user has a "admin" role
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector.button" button
     Then each element in the "subscription_list" list has the "avatar_icon" field
      And each element in the "subscription_list" list has the "title" field
      And each element in the "subscription_list" list has the "subscription_type" field with "<id_format>" text
      And hide the subscription dropdown
      And the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield is displayed
      And the "subscription_selector.subtitle" textfield with the "<id_format>" format is displayed

    Examples:
          | cv   | account_type        | plan_type        | id_format                  | test_priority | ber | detects       | parent_test_plan                     | impeded      | automation              | exec_mode | jira_id      |
          | 12.0 | prepay              | monoline         | \(\d{2}\) \d{5}-\d{4}      | smoke         |     |               | QANOV-21791:QANOV-132105             |              |                         | automatic | QANOV-340428 |
          | 12.0 | postpay             | monoline         | \(\d{2}\) \d{5}-\d{4}      | sanity        | ber |               | QANOV-21791:QANOV-125671             |              |                         | automatic | QANOV-25503  |
          | 12.0 | control             | monoline         | \(\d{2}\) \d{5}-\d{4}      | smoke         |     |               | QANOV-21791:QANOV-125671             |              |                         | automatic | QANOV-340429 |
          | 12.0 | multivivo           | any              | \w+                        | smoke         |     | ACCOUNT-19406 | QANOV-21791:QANOV-125671             |              |                         | manual    | QANOV-133859 |
          | 12.0 | convergente         | full convergente | (\w+( )?)+, \d+            | sanity        | ber | VIVO-2273     | QANOV-21791:QANOV-125671             |              |                         | automatic | QANOV-25505  |
          | 12.0 | convergente         | trio             | (\w+( )?)+, \d+            | regression    |     | VIVO-2273     | QANOV-21791:QANOV-66163:QANOV-125671 |              |                         | manual    | QANOV-25506  |
          | 12.0 | convergente         | duo              | (\w+( )?)+, \d+            | regression    |     | VIVO-2273     | QANOV-21791:QANOV-66163:QANOV-125671 |              |                         | manual    | QANOV-25507  |
          | 12.0 | convergente         | internet         | (\w+( )?)+, \d+            | regression    |     | ACCOUNT-19406 | QANOV-21791:QANOV-66163:QANOV-125671 |              |                         | manual    | QANOV-25508  |
          | 12.0 | convergente         | tv               | (\w+( )?)+, \d+            | regression    |     | ACCOUNT-19406 | QANOV-21791:QANOV-66163:QANOV-125671 | impeded_mock | automation.pending_mock | manual    | QANOV-25509  |
          | 12.0 | convergente         | landline         | (\w+( )?)+, \d+            | regression    |     | ACCOUNT-19406 | QANOV-21791:QANOV-66163:QANOV-125671 | impeded_mock | automation.pending_mock | manual    | QANOV-25510  |
          | 12.0 | vivo_easy           | monoline         | \(\d{2}\) \d{5}-\d{4}      | regression    |     |               | QANOV-21791                          | impeded_mock | automation.pending_mock | manual    | QANOV-25511  |
          | 12.0 | control_n           | monoline         | \(\d{2}\) \d{5}-\d{4}      | regression    |     |               | QANOV-21791                          |              |                         | manual    | QANOV-25512  |
          | 12.0 | convergente         | siebel           | (\w+( )?)+, \d+            | regression    |     |               | QANOV-21791                          |              |                         | manual    | QANOV-25513  |
          | 13.5 | control_n           | monoline         | \(\d{2}\) \d{5}-\d{4}      | regression    |     |               | QANOV-200803                         |              |                         | manual    | QANOV-202395 |
          | 13.5 | jeri control cartao | monoline         | \(\d{2}\) \d{5}-\d{4}      | regression    |     |               | QANOV-200803                         |              |                         | manual    | QANOV-202396 |
          | 13.5 | jeri control boleto | monoline         | \(\d{2}\) \d{5}-\d{4}      | regression    |     |               | QANOV-200803                         |              |                         | manual    | QANOV-202397 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual
  @mobile @vivobr @old_app
  Scenario Outline: <account_type> cancelled user with several plans can see the current cancelled subscription in account
    Given user has "several" plans
      And user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "<plan_type>" plan in "cancelled" status
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector.icon" icon is displayed
      And the "subscription_selector.title" textfield is displayed
      And the "subscription_selector.subtitle" textfield with the "Cancelado - <id_format>" format is displayed

    Examples:
          | account_type    | plan_type | id_format                  | test_priority | ber | jira_id      |
          | beatrix postpay | monoline  | \(\d{2}\) \d{5}-\d{4}      | sanity        | ber | QANOV-403072 |
          | beatrix control | monoline  | \(\d{2}\) \d{5}-\d{4}      | smoke         |     | QANOV-403073 |
          | multivivo       | any       | \w+                        | smoke         |     | QANOV-403074 |
          | convergente     | any       | (\w+( )?)+, \d+            | sanity        | ber | QANOV-403075 |

  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.11 @jira.link.parent_test_plan.QANOV-360674 @manual
  @mobile @vivobr @old_app
  Scenario Outline: <account_type> cancelled user with all plans cancelled can see the subscription_selector dropdown
    Given user has "several" plans
      And user has a "<account_type>" account type
      And user has a "admin" role
      And user has all plans in "cancelled" status
      And user does not have a "siebel" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector.button" button
     Then each element in the "subscription_list" list has the "avatar_icon" field
      And each element in the "subscription_list" list has the "title" field
      And each element in the "subscription_list" list has the "subscription_type" field with "Cancelado - <id_format>" text
      And hide the subscription dropdown

    Examples:
          | account_type    | plan_type | id_format                  | test_priority | ber | jira_id      |
          | beatrix postpay | monoline  | \(\d{2}\) \d{5}-\d{4}      | sanity        | ber | QANOV-403076 |
          | beatrix control | monoline  | \(\d{2}\) \d{5}-\d{4}      | smoke         |     | QANOV-403077 |
          | multivivo       | any       | \w+                        | smoke         |     | QANOV-403078 |
          | convergente     | any       | (\w+( )?)+, \d+            | sanity        | ber | QANOV-403079 |

  @jira.<jira_id> @<automation> @<exec_mode> @<impeded> @android @ios @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @regression @vivobr @old_app
  Scenario Outline: Multiplan user with several plans can switch to a <account_type> - <plan_type> plan
    internal_checkpoint="Possible siebel products:
    - Legacy Duo: internet + landline or internet + TV.
    - Legacy Trio: internet + landline + tv.
    - Legacy standalone: landline or tv or internet"
    Given user has "several" plans
      And user has a "admin" role
      And user has a "<account_type>" account type
      And user has a "<plan_type>" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the account content corresponds to the "<plan_type>" plan

    Examples:
          | cv   | account_type        | plan_type | parent_test_plan                     | impeded      | automation              | exec_mode | jira_id      |
          | 12.0 | legacy prepay       | monoline  | QANOV-21791:QANOV-132105             |              |                         | manual    | QANOV-133860 |
          | 12.0 | legacy control      | monoline  | QANOV-21791                          |              |                         | manual    | QANOV-133861 |
          | 12.0 | legacy postpay      | monoline  | QANOV-21791                          |              |                         | manual    | QANOV-133862 |
          | 12.0 | beatrix postpay     | monoline  | QANOV-21791:QANOV-125671             |              |                         | manual    | QANOV-25520  |
          | 12.0 | beatrix control     | monoline  | QANOV-21791:QANOV-125671             |              |                         | manual    | QANOV-25521  |
          | 12.0 | multivivo           | multivivo | QANOV-21791                          |              |                         | manual    | QANOV-133863 |
          | 12.0 | convergente         | trio      | QANOV-21791:QANOV-66163:QANOV-125671 |              |                         | manual    | QANOV-25515  |
          | 12.0 | convergente         | duo       | QANOV-21791:QANOV-66163:QANOV-125671 |              |                         | manual    | QANOV-25516  |
          | 12.0 | convergente         | internet  | QANOV-21791:QANOV-66163:QANOV-125671 |              |                         | manual    | QANOV-25517  |
          | 12.0 | convergente         | tv        | QANOV-21791:QANOV-66163:QANOV-125671 | impeded_mock | automation.pending_mock | manual    | QANOV-25518  |
          | 12.0 | convergente         | landline  | QANOV-21791:QANOV-66163:QANOV-125671 | impeded_mock | automation.pending_mock | manual    | QANOV-25519  |
          | 13.5 | control_n           | monoline  | QANOV-200803                         |              |                         | manual    | QANOV-202398 |
          | 13.5 | jeri control cartao | monoline  | QANOV-200803                         |              |                         | manual    | QANOV-202399 |
          | 13.5 | jeri control boleto | monoline  | QANOV-200803                         |              |                         | manual    | QANOV-202400 |
          | 13.0 | jeri prepay         | monoline  |                                      |              |                         | manual    | QANOV-228829 |
          | 13.6 | jeri postpay        | monoline  | QANOV-226748                         |              |                         | manual    | QANOV-228830 |

  @jira.QANOV-340430 @android @automatic @ber @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-125671
  @jira.link.parent_test_plan.QANOV-21791 @mobile @qa @regression @vivobr @old_app
  Scenario: Multiplan user with several plans can switch to a convergente - full convergente plan
    Given user has "several" plans
      And user has a "admin" role
      And user has a "convergente" account type
      And user has a "full convergente" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "mobile_lines" carousel is displayed
      And the "internet.icon;tv.icon;landline.icon" icons are displayed

  @jira.QANOV-287496 @android @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-319348 @mobile @no_automatable
  @sanity @vivobr @old_app
  Scenario: Multiplan user with several plans can see the plan selector at the bottom of the screen
    Given user has "several" plans
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector.button" button
     Then the "selector_dropdown" list is displayed at the bottom of the screen

  @jira.QANOV-25544 @android @automatic @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-132105 @old_app
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.parent_test_plan.QANOV-319348 @live @mobile @next @smoke @vivobr
  Scenario: User with just one plan won't see the plan selector
    Given user has "1" plans
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector.button" button is not displayed

  @jira.QANOV-25545 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Multivivo user ADMIN with just one plan wont see the dependant lines in the plan selector
    Given user has "1" plans
      And user has a "admin" role
      And user has "several" mobile lines
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector" button is not displayed
      And the "mobile_allowances" carousel is not displayed
      And the "mobile_line" carousel is displayed
      And each element in the "mobile_line" carousel has the "icon" field
      And each element in the "mobile_line" carousel has the "name" field
      And each element in the "mobile_line" carousel has the "mobile_line_phone" textfield with the "(1X) 9XXXX-XXXX" format

  @jira.QANOV-25546 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression
  @vivobr @old_app
  Scenario: Multivivo user DEPENDANT wont see the dependant lines in the plan selector
    Given user has a "dependent" role
      And user has "several" mobile lines
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector" button is not displayed
      And the "mobile_line" carousel is not displayed
      And the "mobile_allowances" carousel is displayed

  @jira.QANOV-25547 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.0
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario: Multiplan user with several plans can switch to an vivo_easy plan: Will have a custom experience on the Account
    Given user has "several" plans
      And user has a "admin" role
      And user has a "vivo_easy" account type
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
      And clicks on the element in the "subscription_list" with the "monoline" plan type and the "vivo_easy" account type
     Then the "product_without_access_empty_case_icon" icon is displayed
      And the "product_without_access_title" textfield with "Você precisa do app Vivo Easy para ver este plano" text is displayed
      And the "product_without_access_subtitle" textfield with "Quer fazer isso agora?" text is displayed
      And the "product_without_access_button" button with "Ir pro Vivo Easy" text is displayed

  @jira.QANOV-25548 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-181726
  @jira.link.parent_test_plan.QANOV-21791 @manual @mobile @regression @vivobr @old_app
  Scenario: Multiplan user with several plans can switch to a control_n plan: Will have a custom experience on the Account
    Given user has "several" plans
      And user has a "admin" role
      And user has a "control_n" account type
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
      And clicks on the element in the "subscription_list" with the "monoline" plan type and the "control_n" account type
     Then the "product_without_access_empty_case_icon" icon is displayed
      And the "product_without_access_title" textfield with "As informações do seu plano ainda não podem ser acessadas por aqui :(" text is displayed
      And the "product_without_access_subtitle" textfield with "Enquanto não disponibilizamos o acesso ao seu plano aqui pelo app, acesse vivo.com.br pelo computador para encontrar o que precisa :)" text is displayed

  @jira.<jira_id> @<automation> @<impeded> @<test_priority> @android @ios @jira.cv.12.4 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-56585 @manual @mobile @vivobr @old_app
  Scenario Outline: Multiplan user with several plans can switch to a convergente - <plan_type> plan in pending status
    Given user has "several" plans
      And user has a "admin" role
      And user has a "<plan_type>" plan associated in "pending" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
      And clicks on the element in the "subscription_list" with the "<plan_type>" plan in "pending" status
     Then the account content corresponds to the "<plan_type>" plan

    Examples:
          | plan_type        | detects   | impeded      | automation              | test_priority | jira_id     |
          | full convergente |           | impeded_mock | automation.pending_mock | smoke         | QANOV-56939 |
          | trio             |           | impeded_mock | automation.pending_mock | regression    | QANOV-56940 |
          | duo              |           | impeded_mock | automation.pending_mock | regression    | QANOV-56941 |
          | internet         |           | impeded_mock | automation.pending_mock | regression    | QANOV-56942 |
          | tv               |           | impeded_mock | automation.pending_mock | regression    | QANOV-56943 |
          | landline         | VIVO-2555 | impeded_mock | automation.pending_mock | regression    | QANOV-56944 |
