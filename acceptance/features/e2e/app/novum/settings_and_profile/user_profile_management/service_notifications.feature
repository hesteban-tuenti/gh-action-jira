# -*- coding: utf-8 -*-
@jira.QANOV-8358
Feature: Service notifications

  Actions Before each Scenario:
    Given user is in the "Notifications Management" page

  Actions After each Scenario:
     Then user has "service" notifications "enabled" in the application


  @jira.QANOV-8359 @android @automatic @cert2 @ios @jira.cv.10.4
  @jira.link.relates_to.NOV-47457 @live @mobile @moves @next @smoke @har
  Scenario: User can enable the service notifications
    commented_tags="@depends_on.NOV-47287"
    Given user has "service" notifications "disabled" in the application
     When clicks on the "service_notification_switch" switch
     Then the "service_notification_switch" switch is enabled
      And the "service_notification_description" textfield with "Desactiva esta opción para dejar de recibir notificaciones de servicio a través de la app" text is displayed

  @jira.QANOV-8360 @android @automatic @cert2 @ios @jira.cv.10.3
  @jira.link.relates_to.NOV-47456 @live @mobile @moves @next @smoke @har
  Scenario: User can disable the service notifications
    commented_tags="@depends_on.NOV-47287"
    Given user has "service" notifications "enabled" in the application
     When clicks on the "service_notification_switch" switch
     Then the "service_notification_switch" switch is disabled
      And the "service_notification_description" textfield with "Activa esta opción para empezar a recibir notificaciones de servicio a través de la app" text is displayed
