# -*- coding: utf-8 -*-
@jira.QANOV-578516
Feature: Notification Configuration


  @jira.<jira_id> @<client> @automation.hard @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @smoke
  Scenario Outline: A <client> user logged in can open notification configuration page from app native settings with app in <app_status> status
    Given user has "granted" "notifications" permissions
      And user has the app in "<app_status>" status
      And user is logged in
      And user is in the "Mi Movistar Native Settings" page
     When clicks on the "notifications" entrypoint
      And the "App Notification Config" page is displayed
      And clicks on the "more_config" element with "<entrypoint_text>" text
     Then the "Mi Movistar" app is displayed
      And the "Notifications Management" page is displayed

    Examples:
          | client  | entrypoint_text                          | app_status | jira_id      |
          | android | Ajustes adicionales de la aplicación     | killed     | QANOV-578517 |
          | ios     | Ajustes de notificaciones de Mi Movistar | killed     | QANOV-578518 |
          | android | Ajustes adicionales de la aplicación     | background | QANOV-578519 |
          | ios     | Ajustes de notificaciones de Mi Movistar | background | QANOV-578520 |

  @jira.<jira_id> @<client> @automation.hard @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @regression
  Scenario Outline: A <client> user logged out can open notification configuration page from app native settings with app in <app_status> status
    Given user has "granted" "notifications" permissions
      And user has the app in "<app_status>" status
      And user is logged out
      And user is in the "Mi Movistar Native Settings" page
     When clicks on the "notifications" entrypoint
      And the "App Notification Config" page is displayed
      And clicks on the "more_config" element with "<entrypoint_text>" text
      And the "Mi Movistar" app is displayed
      And the "Splash Screen" page is displayed
      And logs in the application
     Then the "Notifications Management" page is displayed

    Examples:
          | client  | entrypoint_text                          | app_status | jira_id      |
          | android | Ajustes adicionales de la aplicación     | killed     | QANOV-578521 |
          | ios     | Ajustes de notificaciones de Mi Movistar | killed     | QANOV-578522 |
          | android | Ajustes adicionales de la aplicación     | background | QANOV-578523 |
          | ios     | Ajustes de notificaciones de Mi Movistar | background | QANOV-578524 |
