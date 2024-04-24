# -*- coding: utf-8 -*-
@jira.QANOV-3160
Feature: Device permission effect

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @<product> @android @automation.hard @har @ios @jira.cv.11.7 @jira.link.detects.RT-2111
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-186955 @manual @mobile @regression
  Scenario Outline: A user who hasn't allowed notifications at device level will see the notification in the Inbox but won't be notified
    - To disable notifications at device level:
    -- Android: from dev settings within the app option
    -- IOS : cancel notification permissions popup after logging in.
    - Service notifications (Commercial notifications) and Marketing notifications (Consumption notifications)
    can be found in Profile --> Notification management
    Note that for this scenario to work in iOS the app needs to be in foreground, in the case the app is in another
    state the user might need to log out and in again (refer to RT-2111)
    Given user has "os" notifications with "disabled" status
      And user has no unseen notifications
     When receives a notification
     Then the notification badge is displayed in the "navigation_top_bar.bell_inbox" icon
      And the notification is not displayed in the notification center

    Examples:
          | product | parent_test_plan | jira_id    |
          | vivobr  | QANOV-520839     | QANOV-3163 |
          | o2uk    |                  | QANOV-3166 |

  @jira.<jira_id> @<product> @android @automation.hard @har @ios @jira.cv.<cv> @jira.link.relates_to.NOV-186955 @manual
  @mobile @regression
  Scenario Outline: A user who hasn't allowed notifications at device level and has service and commercial notifications enabled will see the notification in the Inbox but won't be notified
    - To disable notifications at device level:
    -- Android: from dev settings within the app option
    -- IOS : cancel notification permissions popup after logging in.
    - Service notifications and Commercial notifications can be found in Profile --> Notification management
    Given user has "os" notifications with "disabled" status
      And user has "service" notifications with "enabled" status
      And user has "commercial" notifications with "enabled" status
      And user has no unseen notifications
     When receives a notification
     Then the notification badge is displayed in the "navigation_top_bar.bell_inbox" icon
      And the notification is not displayed in the notification center

    Examples:
          | product | cv     | jira_id      |
          | moves   | 11.7   | QANOV-3170   |
          | blaude  | Future | QANOV-244271 |
          | o2de    | Future | QANOV-244272 |
          | o2es    | Future | QANOV-416828 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.relates_to.NOV-186956 @manual @mobile
  @regression
  Scenario Outline: A user who hasn't allowed notifications at device level and also blocked a type of notification at app level will only see the allowed notification in the Inbox but won't be notified
    - If commstool is used to generate the notifications, it is mandatory to finish creating the campaing, otherwise if we use the Testing mode the filter won't be done
    - To disable notifications at device level:
    -- Android: from dev settings within the app option
    -- IOS : cancel notification permissions popup after logging in.
    - Service notifications and Commercial notifications can be found in Profile --> Notification management
    Given user has "os" notifications with "disabled" status
      And user has "service" notifications with "<service_status>" status
      And user has "commercial" notifications with "<commercial_status>" status
      And user has no unseen notifications
     When receives a "<notification_type>" notification
     Then the notification badge "<badge_status>" displayed in the "navigation_top_bar.bell_inbox" icon
      And the notification is not displayed in the notification center

    Examples:
          | product | cv     | service_status | commercial_status | notification_type | badge_status | jira_id      |
          | moves   | 11.7   | disabled       | enabled           | marketing         | is           | QANOV-3172   |
          | moves   | 11.7   | disabled       | enabled           | service           | is not       | QANOV-3175   |
          | moves   | 11.7   | enabled        | disabled          | marketing         | is not       | QANOV-3178   |
          | moves   | 11.7   | enabled        | disabled          | service           | is           | QANOV-3180   |
          | moves   | 11.7   | disabled       | disabled          | marketing         | is not       | QANOV-3184   |
          | moves   | 11.7   | disabled       | disabled          | service           | is not       | QANOV-3186   |
          | blaude  | Future | disabled       | enabled           | marketing         | is           | QANOV-244273 |
          | blaude  | Future | disabled       | enabled           | service           | is not       | QANOV-244274 |
          | blaude  | Future | enabled        | disabled          | marketing         | is not       | QANOV-244275 |
          | blaude  | Future | enabled        | disabled          | service           | is           | QANOV-244276 |
          | blaude  | Future | disabled       | disabled          | marketing         | is not       | QANOV-244277 |
          | blaude  | Future | disabled       | disabled          | service           | is not       | QANOV-244278 |
          | o2de    | Future | disabled       | enabled           | marketing         | is           | QANOV-244279 |
          | o2de    | Future | disabled       | enabled           | service           | is not       | QANOV-244280 |
          | o2de    | Future | enabled        | disabled          | marketing         | is not       | QANOV-244281 |
          | o2de    | Future | enabled        | disabled          | service           | is           | QANOV-244282 |
          | o2de    | Future | disabled       | disabled          | marketing         | is not       | QANOV-244283 |
          | o2de    | Future | disabled       | disabled          | service           | is not       | QANOV-244284 |
          | o2es    | Future | disabled       | enabled           | marketing         | is           | QANOV-416829 |
          | o2es    | Future | disabled       | enabled           | service           | is not       | QANOV-416830 |
          | o2es    | Future | enabled        | disabled          | marketing         | is not       | QANOV-416831 |
          | o2es    | Future | enabled        | disabled          | service           | is           | QANOV-416832 |
          | o2es    | Future | disabled       | disabled          | marketing         | is not       | QANOV-416833 |
          | o2es    | Future | disabled       | disabled          | service           | is not       | QANOV-416834 |
