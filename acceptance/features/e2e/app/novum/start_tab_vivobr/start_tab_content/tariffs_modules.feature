# -*- coding: utf-8 -*-
@jira.QANOV-97693
Feature: Tariffs modules


  @jira.<jira_id> @<automation> @<execution_mode> @<impeded> @<test_priority> @android @ios @jira.cv.12.5 @mobile
  @vivobr @old_app
  Scenario Outline: A <account_type> user with one data plan will see the data use fragment
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has "1" plans
      And user has "data" allowances in the "mobile_line" product
      And user has not purchased "apps_use" data bundles
      And user has the "consumo-monoplan-nao-colaborador-platinum-v" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_usage" module is displayed
      And the "data_usage.plan_name" textfield is displayed
      And the "data_usage.progress_bar" progress bar is displayed

    Examples:
          | account_type | impeded      | automation              | test_priority | execution_mode | jira_id      |
          | multivivo    | impeded_mock | automation.impeded_mock | regression    | manual         | QANOV-97695  |
          | jeri control |              |                         | regression    | manual         | QANOV-313093 |
          | control_n    |              |                         | regression    | manual         | QANOV-313094 |

    @live @next
    Examples:
          | account_type | impeded | automation | test_priority | execution_mode | jira_id     |
          | convergente  |         |            | smoke         | automatic      | QANOV-97694 |
          | beatrix      |         |            | regression    | automatic      | QANOV-97697 |

  @jira.<jira_id> @android @automatic @ios @jira.cv.12.5 @mobile @qa @smoke @vivobr @old_app
  Scenario Outline: A <account_type> user with two data plans will see the data use carousel fragment
    Given user has a "<account_type>" account type
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has "1" plans
      And user has "data" allowances in the "mobile_line" product
      And user has purchased "apps_use" data bundles
      And user has the "consumption-counter-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_usage" module with "FIQUE DE OLHO" title is displayed
      And the "data_usage.carousel" list has "2" elements
      And each element in the "data_usage.carousel" list has the "plan_name" field
      And each element in the "data_usage.carousel" list has the "progress_bar" field
      And each element in the "data_usage.carousel" list has the "button" textfield with "Ver meu consumo" text

    Examples:
          | account_type | jira_id      |
          | convergente  | QANOV-97698  |
          | multivivo    | QANOV-97699  |
          | beatrix      | QANOV-97700  |
          | jeri control | QANOV-313095 |
          | control_n    | QANOV-313096 |

  @jira.QANOV-97702 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A user with Start tab with two data plans can swipe the data use carousel
    Given user has any "convergente;multivivo;beatrix;jeri control;control_n" account types
      And user has the "consumption-counter-cards" module configured in CMS for "start" page
      And user has a "admin" role
      And user has a "mobile_line" product
      And user has "1" plans
      And user has "data" allowances in the "mobile_line" product
      And user has purchased "apps_use" data bundles
      And user is in the "Start" page
     Then the "data_usage" module with "FIQUE DE OLHO" title is displayed
      And the "data_usage.carousel" list can be swiped

  @jira.QANOV-97707 @android @automatic @ios @jira.cv.12.5 @mobile @qa @regression @vivobr @old_app
  Scenario: A convergente user without lines will not see the data use fragment
    Given user has a "convergente" account type
      And user has "1" plans
      And user has "0" mobile lines
      And user has the "consumption-counter-cards" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_usage" module is not displayed

  @jira.QANOV-184180 @android @ber @ios @jira.cv.13.6 @manual @mobile @smoke @vivobr @old_app
  Scenario: A multiplan user with several data plans will see the data use fragment
    Given user has a "admin" role
      And user has a "mobile_line" product
      And user has "several" plans
      And user has "data" allowances in the "mobile_line" product
      And user has "several" mobile lines
      And user has not purchased "apps_use" data bundles
      And user has the "consumptions-multiplan" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "data_usage" module is displayed
      And the "data_usage.plan_name" textfield is displayed
      And the "data_usage.progress_bar" progress bar is displayed
      And the "data_usage.button" button with "Ver consumo de outros planos" text is displayed

  @jira.QANOV-252250 @android @ber @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with several data plans can access to the disambiguation screeen from the data usage module
    Given user has a "admin" role
      And user has a "mobile_line" product
      And user has "several" plans
      And user has "data" allowances in the "mobile_line" product
      And user has "several" mobile lines
      And user has not purchased "apps_use" data bundles
      And user has the "consumptions-multiplan" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "data_usage.button" button
     Then the "Line Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And each element in the "lines" list has the "product_customer_type" field
      And each element in the "lines" list has the "phone_number" field
      And the "phone_number" field of "lines" list entries will match the user mobile lines

  @jira.QANOV-252251 @android @ber @ios @jira.cv.13.6 @manual @mobile @smoke @vivobr @old_app
  Scenario: A multiplan user with several data plans can access to the consumption page from the disambiguation screeen
    Given user has a "admin" role
      And user has a "mobile_line" product
      And user has "several" plans
      And user has "data" allowances in the "mobile_line" product
      And user has "several" mobile lines
      And user has not purchased "apps_use" data bundles
      And user has the "consumptions-multiplan" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "data_usage.button" button
      And the "Line Disambiguation" page is displayed
      And clicks on the "any" element in the "lines" list
     Then the "Mobile Line Consumption" page is displayed
      And the "data" tab is selected

  @jira.QANOV-252252 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user with one data plan can access to the consumption page
    Given user has a "admin" role
      And user has a "mobile_line" product
      And user has "several" plans
      And user has "data" allowances in the "mobile_line" product
      And user has "1" mobile lines
      And user has not purchased "apps_use" data bundles
      And user has the "consumptions-multiplan" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "data_usage.button" button
     Then the "Mobile Line Consumption" page is displayed
      And the "data" tab is selected

  @jira.QANOV-97708 @android @automatic @ios @jira.cv.12.5 @mobile @qa @sanity @vivobr @old_app
  Scenario: A monoplan user will see the tariff details fragment in Start tab
    Given user has any "convergente;multivivo;beatrix;legacy prepay;jeri prepay;jeri control;control_n" account types
      And user has "1" plans
      And user has a "siebel" plan
      And user has the "tariff-summary" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "tariff" module with "MEU PLANO" title is displayed
      And the "tariff.plan_name" textfield is displayed
      And the "tariff.link" textfield with "Ver meus produtos" text is displayed

  @jira.QANOV-97712 @android @automatic @ber @ios @jira.cv.12.5 @jira.link.detects.ACCOUNT-19936 @mobile @qa @smoke
  @vivobr @old_app
  Scenario: A convergente user with several products can access the plan details page from Star tab
    Given user has a "convergente" account type
      And user has "1" plans
      And user has "several" products
      And user has a "siebel" plan
      And user has the "tariff-summary" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "tariff.link" button
     Then the "Plan Details" page is displayed
      And the "Detalhe do plano" header is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A <account_type> user can access the details webview from Start tab
    Given user has a "<account_type>" account type
      And user has the "tariff-summary" module configured in CMS for "start" page
      And user has "1" plans
      And user has a "siebel" plan
      And user is in the "Start" page
     When clicks on the "tariff.link" button
     Then the internal webview is displayed
      And the "Detalhe do produto" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

    Examples:
          | account_type  | jira_id      |
          | multivivo     | QANOV-168368 |
          | beatrix       | QANOV-168369 |
          | legacy prepay | QANOV-274608 |
          | jeri prepay   | QANOV-274609 |
          | jeri control  | QANOV-313099 |
          | control_n     | QANOV-313100 |

  @jira.<jira_id> @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: A convergente user with only <product_plan> can access the details webview from Start tab
    Given user has a "convergente" account type
      And user has the "tariff-summary" module configured in CMS for "start" page
      And user has "1" plans
      And user has a "siebel" plan
      And user has "1" products
      And user has a "<product_plan>" plan
      And user is in the "Start" page
     When clicks on the "tariff.link" button
     Then the internal webview is displayed
      And the "Detalhe do produto" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

    Examples:
          | product_plan | jira_id      |
          | internet     | QANOV-168370 |
          | tv           | QANOV-168371 |
          | landline     | QANOV-168372 |

  @jira.QANOV-184181 @android @ios @jira.cv.13.6 @manual @mobile @regression @vivobr @old_app
  Scenario: A multiplan user can not see the Tariff module
    Given user has "several" plans
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user has the "tariff-summary" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "tariff" module is not displayed
