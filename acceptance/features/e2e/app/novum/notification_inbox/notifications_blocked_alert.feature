# -*- coding: utf-8 -*-
@jira.QANOV-3609
Feature: Notifications blocked alert

  Actions After each Scenario:
     Then user has "commercial" notifications "enabled" in the application
      And user has "service" notifications "enabled" in the application


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.IOS-6560 @jira.link.relates_to.NOV-186943
  @manual @mobile @regression
  Scenario Outline: A user who hasn't received any notifications and has the marketing and/or service notifications disabled will see an information message when entering in the Inbox
    Given user is in the "Account" page
      And user has not received notifications
      And user has "service" notifications with "<service_status>" status
      And user has "commercial" notifications with "<commercial_status>" status
     When clicks on the "navigation_top_bar.notifications_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "notifications_icon" icon is displayed
      And the "notification_title" textfield with "[LANG:notification_inbox.empty_case_title_with_notifications_disabled]" text is displayed
      And the "notification_body" textfield with "<body>" text is displayed
      And the "notification_activate" button with "[LANG:notification_inbox.activate_notifications_button]" text is displayed

    Examples:
          | product | cv     | service_status | commercial_status | body                                                                                                                             | jira_id      |
          | moves   | 11.7   | disabled       | any               | No te pierdas ninguna notificación de Mi Movistar. Podrás estar al día de las novedades de tu plan y las mejores promos para ti. | QANOV-3610   |
          | moves   | 11.7   | enabled        | disabled          | No te pierdas ninguna notificación de Mi Movistar. Podrás estar al día de las novedades de tu plan y las mejores promos para ti. | QANOV-3611   |
          | blaude  | Future | disabled       | any               | Verpasse keine Benachrichtigung von Mein Blau. Neuigkeiten zu meinem Plan und die besten indivuduellen Angebot erhalten.         | QANOV-244373 |
          | blaude  | Future | enabled        | disabled          | Verpasse keine Benachrichtigung von Mein Blau. Neuigkeiten zu meinem Plan und die besten indivuduellen Angebot erhalten.         | QANOV-244374 |
          | o2de    | Future | disabled       | any               | Verpasse keine Benachrichtigung von Mein O2. Neuigkeiten zu meinem Plan und die besten indivuduellen Angebot erhalten.           | QANOV-244375 |
          | o2de    | Future | enabled        | disabled          | Verpasse keine Benachrichtigung von Mein O2. Neuigkeiten zu meinem Plan und die besten indivuduellen Angebot erhalten.           | QANOV-244376 |
          | o2es    | Future | disabled       | any               | TBD                                                                                                                              | QANOV-416920 |
          | o2es    | Future | enabled        | disabled          | TBD                                                                                                                              | QANOV-416921 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-186946 @mobile @smoke
  Scenario Outline: A user who has received notifications and has the marketing and/or service notifications disabled will see an alert when entering in the Inbox if the user hasn't interacted with the alert previously
    As there is no way of assuring that the user hasn't interacted with the alert unless a log out and log in is done, the
    prerequisite is removed from the steps. In case the automated scenario fails, it should be checked manually doing a
    log out/log in process
    Given user is in the "[CONF:landing_tab]" page
      And user has received notifications
      And user has "commercial" notifications "<commercial_status>" in the application
      And user has "service" notifications "<service_status>" in the application
     When clicks on the "navigation_top_bar.notification_inbox_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "activate_notifications_alert" module is displayed
      And the "activate_notifications_alert.title" textfield with "[LANG:notification_inbox.activate_notifications_title]" text is displayed
      And the "activate_notifications_alert.description" textfield with "[LANG:notification_inbox.activate_notifications_description]" text is displayed
      And the "activate_notifications_alert.link" button with "[LANG:notification_inbox.activate_notifications_button]" text is displayed
      And the "activate_notifications_alert.close_button" button is displayed

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv     | service_status | commercial_status | jira_id      |
          | moves   | 11.7   | disabled       | any               | QANOV-3612   |
          | moves   | 11.7   | enabled        | disabled          | QANOV-3613   |

    @manual
    Examples:
          | product | cv     | service_status | commercial_status | jira_id      |
          | o2de    | Future | disabled       | any               | QANOV-244379 |
          | o2de    | Future | enabled        | disabled          | QANOV-244380 |
          | o2es    | Future | disabled       | any               | QANOV-416922 |
          | o2es    | Future | enabled        | disabled          | QANOV-416923 |
          | blaude  | Future | disabled       | any               | QANOV-244377 |
          | blaude  | Future | enabled        | disabled          | QANOV-244378 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186945 @jira.link.relates_to.NOV-187027 @manual @mobile @regression
  Scenario Outline: A user who has received notifications and sees the notification blocked alert is redirected to the notification's management setting after tapping the button in the screen in android devices
    Given user is in the "Account" page
      And user has received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "activate_notifications_alert.link" button
     Then the "Notification Management" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Notification Inbox" page is displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3613                | QANOV-3614   |
          | blaude  | Future | QANOV-244377:QANOV-244378 | QANOV-244381 |
          | o2de    | Future | QANOV-244379:QANOV-244380 | QANOV-244382 |
          | o2es    | Future | QANOV-416922:QANOV-416923 | QANOV-416924 |

  @jira.<jira_id> @<product> @android @automation.hard @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186945 @jira.link.relates_to.NOV-187027 @manual @mobile @regression
  Scenario Outline: A user who has not received notifications is redirected to the notification's management setting after tapping the button in the screen in android devices
    Given user is in the "Account" page
      And user has not received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
     When clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "notification_activate" button
     Then the "Notification Management" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Notification Inbox" page is displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3611                | QANOV-3615   |
          | blaude  | Future | QANOV-244373:QANOV-244374 | QANOV-244383 |
          | o2de    | Future | QANOV-244375:QANOV-244376 | QANOV-244384 |
          | o2es    | Future | QANOV-416920:QANOV-416921 | QANOV-416925 |

  @jira.<jira_id> @<product> @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186945 @jira.link.relates_to.NOV-193317 @manual @mobile @regression
  Scenario Outline: A user who has received notifications and sees the notification blocked alert is redirected to the notification's management setting after tapping the button in the screen in iOS devices
    Given user is in the "Account" page
      And user has received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "activate_notifications_alert.link" button
     Then the "Notification Management" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3613                | QANOV-3616   |
          | blaude  | Future | QANOV-244377:QANOV-244378 | QANOV-244385 |
          | o2de    | Future | QANOV-244379:QANOV-244380 | QANOV-244386 |
          | o2es    | Future | QANOV-416922:QANOV-416923 | QANOV-416926 |

  @jira.<jira_id> @<product> @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186945 @jira.link.relates_to.NOV-193317 @manual @mobile @regression
  Scenario Outline: A user who has not received notifications is redirected to the notification's management setting after tapping the button in the screen in iOS devices
    Given user is in the "Account" page
      And user has not received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
     When clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "notification_activate" button
     Then the "Notification Management" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3611                | QANOV-3617   |
          | blaude  | Future | QANOV-244373:QANOV-244374 | QANOV-244387 |
          | o2de    | Future | QANOV-244375:QANOV-244376 | QANOV-244388 |
          | o2es    | Future | QANOV-416920:QANOV-416921 | QANOV-416928 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-187152 @manual @mobile @regression
  Scenario Outline: A user who doesn't enable the notifications after tapping the link and hasn't received notifications yet will see the information message when entering in the Inbox again
    Given user is in the "Notification Inbox" page
      And user has not received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
     When clicks on the "notification_activate" button
      And the "Notification Management" page is displayed
      And "<service_status>" the "service_notifications" switch
      And "<commercial_status>" the "commercial_notifications" switch
      And user is in the "Notification Inbox" page
     Then the "notifications_icon" icon is displayed
      And the "notifications_title" textfield is displayed
      And the "notifications_body" textfield is displayed
      And the "notifications_activate" button is displayed

    Examples:
          | product | cv     | service_status | commercial_status | depends_on                | jira_id      |
          | moves   | 11.7   | disables       | enables           | QANOV-3611                | QANOV-3618   |
          | moves   | 11.7   | enables        | disables          | QANOV-3611                | QANOV-3619   |
          | moves   | 11.7   | disables       | disables          | QANOV-3611                | QANOV-3620   |
          | blaude  | Future | disables       | enables           | QANOV-244373:QANOV-244374 | QANOV-244389 |
          | blaude  | Future | enables        | disables          | QANOV-244373:QANOV-244374 | QANOV-244390 |
          | blaude  | Future | disables       | disables          | QANOV-244373:QANOV-244374 | QANOV-244391 |
          | o2de    | Future | disables       | enables           | QANOV-244375:QANOV-244376 | QANOV-244392 |
          | o2de    | Future | enables        | disables          | QANOV-244375:QANOV-244376 | QANOV-244393 |
          | o2de    | Future | disables       | disables          | QANOV-244375:QANOV-244376 | QANOV-244394 |
          | o2es    | Future | disables       | enables           | QANOV-416920:QANOV-416921 | QANOV-416929 |
          | o2es    | Future | enables        | disables          | QANOV-416920:QANOV-416921 | QANOV-416930 |
          | o2es    | Future | disables       | disables          | QANOV-416920:QANOV-416921 | QANOV-416931 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-187153 @manual @mobile @regression
  Scenario Outline: A user who enabled the notifications after tapping the link and hasn't received notifications yet will see empty case screen when entering in the Inbox again
    Given user is in the "Notification Inbox" page
      And user has not received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
     When clicks on the "notification_activate" button
      And the "Notification Management" page is displayed
      And enables the "service_notifications" switch
      And enables the "commercial_notifications" switch
      And user is in the "Notification Inbox" page
     Then the "empty_case_image" image is displayed
      And the "empty_case_title" textfield with "[LANG:notification_inbox.empty_case_title]" text is displayed
      And the "empty_case_text" textfield with "[LANG:notification_inbox.empty_case_text]" text is displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3611                | QANOV-3624   |
          | blaude  | Future | QANOV-244373:QANOV-244374 | QANOV-244401 |
          | o2de    | Future | QANOV-244375:QANOV-244376 | QANOV-244402 |
          | o2es    | Future | QANOV-416920:QANOV-416921 | QANOV-416936 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-187156 @manual @mobile @regression
  Scenario Outline: A user who enabled the notifications after tapping the link and has received notifications won't see the activate message when entering in the Inbox again
    Given user is in the "Notification Inbox" page
      And user has not received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
     When clicks on the "notification_activate" button
      And the "Notification Management" page is displayed
      And enables the "service_notifications" switch
      And enables the "commercial_notifications" switch
      And receives a notification
      And user is in the "Notification Inbox" page
     Then the "inbox_list" list is displayed
      And the "activate_notifications" module is not displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3611                | QANOV-3625   |
          | blaude  | Future | QANOV-244373:QANOV-244374 | QANOV-244403 |
          | o2de    | Future | QANOV-244375:QANOV-244376 | QANOV-244404 |
          | o2es    | Future | QANOV-416920:QANOV-416921 | QANOV-416937 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186949 @jira.link.relates_to.NOV-187155 @manual @mobile @regression
  Scenario Outline: A user who doesn't enable the notifications after tapping the link receives a notification meanwhile, won't see the activate message button and will see the alert when entering the Inbox again and the notification list
    Given user is in the "Notification Inbox" page
      And user has not received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "notification_activate" button
      And the "Notification Management" page is displayed
      And "<service_status>" the "service_notifications" switch
      And "<commercial_status>" the "commercial_notifications" switch
      And receives a notification
      And user is in the "Notification Inbox" page
     Then the "inbox_list" list is displayed
      And the "notification_activate" button is not displayed
      And the "activate_notifications" module is displayed

    Examples:
          | product | cv     | service_status | commercial_status | depends_on                | jira_id      |
          | moves   | 11.7   | disables       | enables           | QANOV-3611                | QANOV-3626   |
          | moves   | 11.7   | enables        | disables          | QANOV-3611                | QANOV-3627   |
          | moves   | 11.7   | disables       | disables          | QANOV-3611                | QANOV-3628   |
          | blaude  | Future | disables       | enables           | QANOV-244373:QANOV-244374 | QANOV-244405 |
          | blaude  | Future | enables        | disables          | QANOV-244373:QANOV-244374 | QANOV-244406 |
          | blaude  | Future | disables       | disables          | QANOV-244373:QANOV-244374 | QANOV-244407 |
          | o2de    | Future | disables       | enables           | QANOV-244375:QANOV-244376 | QANOV-244408 |
          | o2de    | Future | enables        | disables          | QANOV-244375:QANOV-244376 | QANOV-244409 |
          | o2de    | Future | disables       | disables          | QANOV-244375:QANOV-244376 | QANOV-244410 |
          | o2es    | Future | disables       | enables           | QANOV-416920:QANOV-416921 | QANOV-416938 |
          | o2es    | Future | enables        | disables          | QANOV-416920:QANOV-416921 | QANOV-416939 |
          | o2es    | Future | disables       | disables          | QANOV-416920:QANOV-416921 | QANOV-416940 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186949 @manual @mobile @regression
  Scenario Outline: A user with notifications who doesn't enable them after tapping the link in the alert and has received notifications won't see the alert when entering in the Inbox again
    Given user is in the "Notification Inbox" page
      And user has received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "activate_notifications_alert.link" button
      And the "Notification Management" page is displayed
      And "<service_status>" the "service_notifications" switch
      And "<commercial_status>" the "commercial_notifications" switch
      And user is in the "Notification Inbox" page
     Then the "inbox_list" list is displayed
      And the "activate_notifications" module is not displayed

    Examples:
          | product | cv     | service_status | commercial_status | depends_on                | jira_id      |
          | moves   | 11.7   | disables       | enables           | QANOV-3613                | QANOV-3629   |
          | moves   | 11.7   | enables        | disables          | QANOV-3613                | QANOV-3630   |
          | moves   | 11.7   | disables       | disables          | QANOV-3613                | QANOV-3631   |
          | blaude  | Future | disables       | enables           | QANOV-244377:QANOV-244378 | QANOV-244411 |
          | blaude  | Future | enables        | disables          | QANOV-244377:QANOV-244378 | QANOV-244412 |
          | blaude  | Future | disables       | disables          | QANOV-244377:QANOV-244378 | QANOV-244413 |
          | o2de    | Future | disables       | enables           | QANOV-244379:QANOV-244380 | QANOV-244414 |
          | o2de    | Future | enables        | disables          | QANOV-244379:QANOV-244380 | QANOV-244415 |
          | o2de    | Future | disables       | disables          | QANOV-244379:QANOV-244380 | QANOV-244416 |
          | o2es    | Future | disables       | enables           | QANOV-416922:QANOV-416923 | QANOV-416941 |
          | o2es    | Future | enables        | disables          | QANOV-416922:QANOV-416923 | QANOV-416942 |
          | o2es    | Future | disables       | disables          | QANOV-416922:QANOV-416923 | QANOV-416943 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186950 @manual @mobile @regression
  Scenario Outline: A user who enables the notifications after tapping the link in the alert and has received notifications won't see the alert when entering in the Inbox again
    Given user is in the "Notification Inbox" page
      And user has received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "activate_notifications_alert.link" button
      And the "Notification Management" page is displayed
      And enables the "service_notifications" switch
      And enables the "commercial_notifications" switch
      And user is in the "Notification Inbox" page
     Then the "inbox_list" list is displayed
      And the "activate_notifications" module is not displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3613                | QANOV-3632   |
          | blaude  | Future | QANOV-244377:QANOV-244378 | QANOV-244417 |
          | o2de    | Future | QANOV-244379:QANOV-244380 | QANOV-244418 |
          | o2es    | Future | QANOV-416922:QANOV-416923 | QANOV-416944 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186951 @manual @mobile @regression
  Scenario Outline: A user who doesn't enable the notifications after tapping the link in the alert will see the alert when entering in the Inbox again after logging out
    Given user is in the "Notification Inbox" page
      And user has received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "activate_notifications_alert.link" button
      And the "Notification Management" page is displayed
      And "<service_status>" the "service_notifications" switch
      And "<commercial_status>" the "commercial_notifications" switch
      And user is in the "Notification Inbox" page
      And the "activate_notifications" module is not displayed
      And logs out from the application
      And logs in the application
      And the "[CONF:landing_tab]" page is displayed
      And user is in the "Notification Inbox" page
     Then the "inbox_list" list is displayed
      And the "activate_notifications" module is displayed

    Examples:
          | product | cv     | service_status | commercial_status | depends_on                | jira_id      |
          | moves   | 11.7   | disables       | enabled           | QANOV-3613                | QANOV-3633   |
          | moves   | 11.7   | enabled        | disables          | QANOV-3613                | QANOV-3634   |
          | moves   | 11.7   | disables       | disables          | QANOV-3613                | QANOV-3635   |
          | blaude  | Future | disables       | enables           | QANOV-244377:QANOV-244378 | QANOV-244419 |
          | blaude  | Future | enables        | disables          | QANOV-244377:QANOV-244378 | QANOV-244420 |
          | blaude  | Future | disables       | disables          | QANOV-244377:QANOV-244378 | QANOV-244421 |
          | o2de    | Future | disables       | enables           | QANOV-244379:QANOV-244380 | QANOV-244422 |
          | o2de    | Future | enables        | disables          | QANOV-244379:QANOV-244380 | QANOV-244423 |
          | o2de    | Future | disables       | disables          | QANOV-244379:QANOV-244380 | QANOV-244424 |
          | o2es    | Future | disables       | enables           | QANOV-416922:QANOV-416923 | QANOV-416945 |
          | o2es    | Future | enables        | disables          | QANOV-416922:QANOV-416923 | QANOV-416946 |
          | o2es    | Future | disables       | disables          | QANOV-416922:QANOV-416923 | QANOV-416947 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186947 @manual @mobile @regression
  Scenario Outline: A user who has already received notifications and sees the notifications blocked alert can dismiss it
    Given user is in the "Notification Inbox" page
      And user has received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "activate_notifications_close" button
     Then the "activate_notifications" module is not displayed
      And the "inbox_list" list is displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3613                | QANOV-27034  |
          | blaude  | Future | QANOV-244377:QANOV-244378 | QANOV-244425 |
          | o2de    | Future | QANOV-244379:QANOV-244380 | QANOV-244426 |
          | o2es    | Future | QANOV-416922:QANOV-416923 | QANOV-416948 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-186948 @manual @mobile @regression
  Scenario Outline: A user who has already received notifications and has dismissed the alert won't see the alert when entering in the Inbox again
    Given user is in the "[CONF:landing_tab]" page
      And clicks on the "navigation_top_bar.notifications_icon" button
      And the "Notification Inbox" page is displayed
      And user has received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "activate_notifications_close" button
      And clicks on the "navigation_top_bar.back_button" button
      And the "[CONF:landing_tab]" page is displayed
      And clicks on the "navigation_top_bar.notifications_icon" button
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And the "activate_notifications" module is not displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3613                | QANOV-3636   |
          | blaude  | Future | QANOV-244377:QANOV-244378 | QANOV-244427 |
          | o2de    | Future | QANOV-244379:QANOV-244380 | QANOV-244428 |
          | o2es    | Future | QANOV-416922:QANOV-416923 | QANOV-416949 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-187026 @manual @mobile @regression
  Scenario Outline: A user who dismissed the notifications blocked alert will see the alert when entering in the Inbox again after logging out
    Given user is in the "Notification Inbox" page
      And user has received notifications
      And user has "service" notifications with "disabled" status
      And user has "commercial" notifications with "disabled" status
      And user has not interacted previously with the notifications alert
     When clicks on the "activate_notifications_close" button
      And the "activate_notifications" module is not displayed
      And logs out from the application
      And logs in the application
      And the "[CONF:landing_tab]" page is displayed
      And user is in the "Notification Inbox" page
     Then the "inbox_list" list is displayed
      And the "activate_notifications" module is displayed

    Examples:
          | product | cv     | depends_on                | jira_id      |
          | moves   | 11.7   | QANOV-3613                | QANOV-3637   |
          | blaude  | Future | QANOV-244377:QANOV-244378 | QANOV-244429 |
          | o2de    | Future | QANOV-244379:QANOV-244380 | QANOV-244430 |
          | o2es    | Future | QANOV-416922:QANOV-416923 | QANOV-416950 |
