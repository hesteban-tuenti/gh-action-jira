# -*- coding: utf-8 -*-
@jira.QANOV-26125
Feature: Speed upgrade

  Actions Before the Feature:
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "internet" product
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "internet-header" module configured in CMS for "internet" page for the "internet" product


  @jira.QANOV-26126 @android @ios @mobile @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @moves
  @regression @automation.pending_mock @manual
  Scenario: User eligible to upgrade who accessed to the Speed Upgrade page can access to the Terms and Conditions page
    other_affected_versions="2021-01"
    internal_checkpoint="TBD the webview mode of the Terms And Conditions"
    Given user has a plan eligible for a speed upgrade
      And user has not upgraded the internet speed
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "speed_upgrade_button" button
      And the "Speed Upgrade" page is displayed
      And clicks on the "terms_conditions_link" link
     Then the external webview with "https://movistar.es/contratos/" url is displayed

  @jira.QANOV-26128 @android @ios @mobile @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @moves
  @regression @automation.pending_mock @manual
  Scenario: User eligible to upgrade who accessed to the Speed Upgrade page cannot upgrade the connection if a server error occurs: KO feedback is displayed
    other_affected_versions="2021-01"
    Given user has a plan eligible for a speed upgrade
      And user has not upgraded the internet speed
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "speed_upgrade_button" button
      And the "Speed Upgrade" page is displayed
      And clicks on the "finish" button
      And an error happens during the operation
     Then the "Feedback Ko" page is displayed
      And the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield with "Tu solicitud no ha podido ser tramitada correctamente" text is displayed
      And the "negative_feedback_subtitle" textfield with "Inténtalo más tarde." text is displayed
      And the "back_to_account" button with "Volver a mi cuenta" text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Speed Upgrade" page is displayed

  @jira.<jira_id> @android @ios @mobile @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @moves
  @regression @automation.pending_mock @manual
  Scenario Outline: User can retry the Speed Upgrade after an error processing the initial request
    other_affected_versions="2021-01"
    Given user has a plan eligible for a "<speed_option>" speed upgrade
      And user has not upgraded the internet speed
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "speed_upgrade_button" button
      And the "Speed Upgrade" page is displayed
      And clicks on the "finish" button
      And an error happens during the operation
      And the "Feedback Ko" page is displayed
      And clicks on the "retry" button
     Then the "Speed Upgrade" page is displayed
      And the "<header>" header is displayed

    Examples:
          | speed_option   | header              | jira_id     |
          | 600Mb to 1Gb   | Subida de velocidad | QANOV-26129 |
          | 100Mb to 300Mb | Subida de velocidad | QANOV-47755 |

  @jira.QANOV-26131 @android @ios @mobile @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @moves
  @regression @automation.pending_mock @manual @impeded_legacy
  Scenario: User goes back to main account screen after an error during Speed Upgrade request
    other_affected_versions="2021-01"
    Given user has a "legado" account type
      And user has a plan eligible for a speed upgrade
      And user has not upgraded the internet speed
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "speed_upgrade_button" button
      And the "Speed Upgrade" page is displayed
      And clicks on the "finish" button
      And an error happens during the operation
      And the "Feedback Ko" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed

  @jira.QANOV-26132 @android @ios @mobile @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222
  @jira.link.detects.MOVES-5534 @moves @smoke @automation.pending_mock @manual
  Scenario: User eligible to upgrade who accessed to the Speed Upgrade page can upgrade the connection: Success feedback is displayed
    other_affected_versions="2021-01"
    Given user has a plan eligible for a speed upgrade
      And user has not upgraded the internet speed
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "speed_upgrade_button" button
      And the "Speed Upgrade" page is displayed
      And clicks on the "finish" button
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Tu solicitud ha sido enviada correctamente" text is displayed
      And the "success_message_1" textfield with "La subida de velocidad de tu fibra óptica se hará efectiva en las próximas horas." text is displayed
      And the "success_message_2" textfield with "Podrás comprobar la actualización de tu velocidad desde en la sección de Internet." text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-26133 @android @ios @mobile @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-25222 @moves
  @regression @automation.pending_mock @manual @impeded_legacy
  Scenario: Legado user goes back to main account screen after successful Speed Upgrade
    other_affected_versions="2021-01"
    Given user has a "legado" account type
      And user has a plan eligible for a speed upgrade
      And user has not upgraded the internet speed
      And user has the matching subscription selected in the account
      And user is in the "Internet" page
     When clicks on the "speed_upgrade_button" button
      And the "Speed Upgrade" page is displayed
      And clicks on the "finish" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed
