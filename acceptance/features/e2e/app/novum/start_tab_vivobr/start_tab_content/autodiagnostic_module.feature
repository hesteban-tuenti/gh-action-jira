# -*- coding: utf-8 -*-
@jira.QANOV-97619
Feature: Autodiagnostic module

  Actions Before each Scenario:
    Given user has the "auto-diagnostic" module configured in CMS for "start" page

  @jira.<jira_id> @<ber> @<execution_mode> @<test_priority> @android @ios @jira.cv.<cv> @qa
  @mobile @vivobr @old_app
  Scenario Outline: A user with <plans> plans will see the autodiagnostic module in Start tab
    Given user has a "<account_type>" account type
      And user has "<plans>" plans
      And user has a "any" plan in "active" status
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "autodiagnostic_appointment_booking_section_title" textfield with "PODEMOS TE AJUDAR" text is displayed
      And the "autodiagnostic" module is displayed
      And the "autodiagnostic.image" image is displayed
      And the "autodiagnostic.subtitle" textfield with "Suporte técnico" text is displayed
      And the "autodiagnostic.description" textfield with "Em qualquer momento ou situação, conte com a gente" text is displayed
      And the "autodiagnostic.button" button with "Preciso de ajuda" text is displayed

    Examples:
          | account_type | plans | test_priority | execution_mode | ber | cv     | status | jira_id      |
          | convergente  | 1     | smoke         | automatic      |     | 12.5   | any    | QANOV-97621  |
          | multivivo    | 1     | regression    | automatic      |     | 12.5   | any    | QANOV-97623  |

    @live @next
    Examples:
          | account_type | plans   | test_priority | execution_mode | ber | cv     | status | jira_id      |
          | beatrix      | 1       | sanity        | automatic      | ber | 12.5   | any    | QANOV-97625  |
          | any          | several | smoke         | automatic      | ber | 13.6   | active | QANOV-153061 |

  @jira.QANOV-97627 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A full convergente user with a plan in pending status see the autodiagnostic module in Start tab
    Given user has a "convergente" account type
      And user has a "full convergente" plan in "pending" status
      And user has "1" plans
      And user is in the "Start" page
     Then the "autodiagnostic_appointment_booking_section.title" textfield with "PODEMOS TE AJUDAR" text is displayed
      And the "autodiagnostic" module is displayed
      And the "autodiagnostic.image" image is displayed
      And the "autodiagnostic.subtitle" textfield with "Suporte técnico" text is displayed
      And the "autodiagnostic.description" textfield with "Em qualquer momento ou situação, conte com a gente" text is displayed
      And the "autodiagnostic.appointment_button" button with "Preciso de ajuda" text is displayed
      And the "appointment_booking" module is displayed

  @<ber> @<execution_mode> @android @ios @jira.<jira_id> @jira.cv.12.5 @live @mobile @next
  @regression @vivobr @old_app
  Scenario Outline: A user with Start tab can access to Tech support webview from autodiagnostic module
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "autodiagnostic.button" button
     Then the internal webview with "Verificando conexão" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

    Examples:
          | account_type | execution_mode | ber | jira_id     |
          | convergente  | manual         |     | QANOV-97629 |
          | multivivo    | manual         |     | QANOV-97632 |

   @live @next
    Examples:
          | account_type | execution_mode | ber | jira_id     |
          | beatrix      | automatic      | ber | QANOV-97634 |

  @jira.QANOV-153062 @android @ios @jira.cv.13.6 @live @manual @mobile @next @regression @vivobr @old_app
  Scenario: A multiplan user with one plan in active status can access to Tech support webview
    Given user has "several" plans
      And user has a "any" plan in "active" status
      And user has "only_one" plan available to autodiagnostic
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
     When clicks on the "autodiagnostic.button" button
     Then the internal webview with "Suporte Técnico" header is displayed
      And clicks on the "navigation_tob_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-153063 @android @ber @ios @jira.cv.13.6 @live @automatic @mobile @next @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab can access to Disambiguation screen from autodiagnostic module
    NOTE: the check for multivivo is because right now the multivivo element in plans doesn't have the plan name value
    Given user has "several" plans
      And user does not have any "multivivo" account types
      And user has a "any" plan in "active" status
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
     When clicks on the "autodiagnostic.button" button
     Then the "Plan Disambiguation" page is displayed
      And the "Meus planos" header is displayed
      And the "title" textfield with "Selecione um produto para continuar" text is displayed
      And the "plans" list is displayed
      And each element in the "plans" list has the "product_customer_type" field
      And each element in the "plans" list has the "plan_name" field
      And the "plan_name" field of "plans" list entries will match the user plans

  @jira.QANOV-153064 @android @ber @ios @jira.cv.13.6 @live @automatic @mobile @next @regression @vivobr @old_app
  Scenario: A multiplan user with Start tab can access the Tech support webview from Disambiguation screen
    Depending if the plan selected in the disambiguation screen has mobile line or no, a diferent webview is opened, so two titles are checked
    Given user has "several" plans
      And user has a "any" plan in "active" status
      And user does not have any "legacy control;legacy postpay;jeri postpay" account types
      And user is in the "Start" page
     When clicks on the "autodiagnostic.button" button
      And the "Plan Disambiguation" page is displayed
      And clicks on the "any" element in the "plans" list
     Then the internal webview with the "(Verificando conexão|Suporte Técnico)" format in the header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.QANOV-97636 @android @automatic @ios @jira.cv.12.5 @qa @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with a legacy prepay/jeri prepay/jeri postpay account does not see the autodiagnostic module
    Given user has any "legacy prepay;jeri prepay" account types
      And user has "1" plans
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "autodiagnostic" module is not displayed
      And the "appointment_booking" module is displayed

  @jira.QANOV-97637 @android @ios @jira.cv.12.5 @manual @mobile @regression @vivobr @old_app
  Scenario: A monoplan user with a soft convergente plan in pending status does not see the autodiagnosic module
    Given user has a "convergente" account type
      And user has a "soft convergente" plan in "pending" status
      And user has "1" plans
      And user is in the "Start" page
     Then the "autodiagnostic" module is not displayed
      And the "appointment_booking" module is displayed
