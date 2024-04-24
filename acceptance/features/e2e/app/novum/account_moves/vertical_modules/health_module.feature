# -*- coding: utf-8 -*-
@jira.QANOV-326042
Feature: Health Module


  @jira.<jira_id> @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @cert2 @live @next @qa @webapp
  Scenario Outline: User with a <title> purchased product can see the Salud vertical module in the Dashboard
    Given user has an eHealth "<plan>_plan" plan contracted
      And user is in the "Dashboard" page
     Then the "health_section_header" textfield is displayed
      And the "health_module.title" textfield with "<title>" text is displayed
      And the "health_module.link" link with "Ver detalle" text is displayed

    Examples:
          | plan     | title                   | jira_id      |
          | personal | Movistar Salud Personal | QANOV-326043 |
          | family   | Movistar Salud Familiar | QANOV-326044 |

  @jira.QANOV-326045 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: User with a Movistar Salud plan purchashed can access the details from the Dashboard
    Given user has an eHealth "any" plan contracted
      And user is in the "Dashboard" page
     When clicks on the "health_module.link" link
     Then the external webview with the "movistarsalud.es" text is displayed

  @jira.QANOV-326046 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves @sanity
  @cert2 @live @next @qa @webapp
  Scenario: User without any Movistar Salud plan purchased can't see the module in the Dashboard
    Given user does not have any eHealth plan contracted
      And user is in the "Dashboard" page
     Then the "health_module" module is not displayed

  @jira.QANOV-326047 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see an error if the Salud module fails to load
    Given user has an eHealth "any" plan contracted
      And user is in the "Dashboard" page
     When an error occurs loading the "health_module" module
     Then the "health_module_title" textfield with "Salud" text is displayed
      And the "health_module.error_title" textfield with "Algo ha ido mal" text is displayed
      And the "health_module.error_subtitle" textfield with "El contenido no se puede mostrar" text is displayed

  @jira.QANOV-369701 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @smoke @cert2 @live @next @qa @webapp
  Scenario: User with a "Te cuida" purchased service can see the Salud module in the Dashboard
    Title for this card is providen via API so, it can change in the future
    Given user has a senior service contracted
      And user is in the "Dashboard" page
     Then the "health_module_title" textfield with "Salud" text is displayed
      And the "senior_watch.title" textfield is displayed
      And the "senior_watch.link" link with "Ver detalle" text is displayed

  @jira.QANOV-369703 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @regression @qa @cert2 @next @live @webapp
  Scenario: User who has not purchased a Senior service can't see Health module
    Given user does not have a senior service contracted
      And user is in the "Dashboard" page
     Then the "senior_watch" module is not displayed
