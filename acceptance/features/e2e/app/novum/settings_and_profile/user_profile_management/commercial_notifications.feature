# -*- coding: utf-8 -*-
@jira.QANOV-8341
Feature: Commercial notifications

  Actions Before each Scenario:
    Given user is in the "Notifications Management" page

  Actions After each Scenario:
     Then user has "commercial" notifications "enabled" in the application


  @jira.QANOV-8342 @android @automatic @cert2 @ios @jira.cv.10.7
  @jira.link.relates_to.NOV-47299 @live @mobile @moves @next @smoke @har
  Scenario: User can enable the commercial notifications
    commented_tags="@depends_on.NOV-47287"
    Given user has "commercial" notifications "disabled" in the application
     When clicks on the "commercial_notification_switch" switch
     Then the "commercial_notification_switch" switch is enabled
      And the "commercial_notification_description" textfield with "Desactiva esta opción para dejar de recibir las notificaciones comerciales de Movistar en la app" text is displayed

  @jira.QANOV-8343 @android @automatic @cert2 @ios @jira.cv.10.7
  @jira.link.relates_to.NOV-47300 @live @mobile @moves @next @smoke @har
  Scenario: User can disable the commercial notifications
    commented_tags="@depends_on.NOV-47287"
    Given user has "commercial" notifications "enabled" in the application
     When clicks on the "commercial_notification_switch" switch
     Then the "commercial_notification_switch" switch is disabled
      And the "commercial_notification_description" textfield with "Activa esta opción para recibir las notificaciones comerciales de Movistar en la app" text is displayed
