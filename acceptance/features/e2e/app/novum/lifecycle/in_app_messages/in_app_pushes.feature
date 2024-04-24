# -*- coding: utf-8 -*-
@jira.QANOV-21629
Feature: In app pushes


  @jira.<jira_id> @<product> @android @automation.hard @har @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: User can receive an immediate in-app push with app opened
    Given user has the app in "foreground" status
     When receives an in-app push of type "visible" with delivery mode "immediate"
     Then the "In App Message" page is displayed
      And the "in-app" notification is not displayed

    Examples:
          | cv     | product | jira_id      |
          | 12.0   | o2uk    | QANOV-21630  |
          | 12.0   | moves   | QANOV-21631  |
          | 11.14  | vivobr  | QANOV-21632  |
          | Future | blaude  | QANOV-258433 |
          | Future | o2de    | QANOV-258434 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can close an immediate in-app received with app opened
    Given user has a "<account_type>" account type
      And user is in the "<screen>" page
     When receives an in-app push of type "visible" with delivery mode "immediate"
      And the "In App Message" page is displayed
      And clicks on the "close" button
     Then the "<screen>" page is displayed

    Examples:
          | cv     | product | account_type | screen     | jira_id      |
          | 12.0   | o2uk    | any          | Account    | QANOV-21633  |
          | 12.0   | o2uk    | any          | Explore    | QANOV-21634  |
          | 12.0   | o2uk    | postpay      | Aura       | QANOV-21635  |
          | 12.0   | o2uk    | any          | Support    | QANOV-21636  |
          | 12.0   | o2uk    | any          | Profile    | QANOV-21637  |
          | 12.0   | moves   | any          | Account    | QANOV-21638  |
          | 12.0   | moves   | any          | Explore    | QANOV-21639  |
          | 12.0   | moves   | telco        | Aura       | QANOV-21640  |
          | 12.0   | moves   | any          | Support    | QANOV-21641  |
          | 12.0   | moves   | any          | Profile    | QANOV-21642  |
          | 11.14  | vivobr  | any          | Assinatura | QANOV-599261 |
          | 11.14  | vivobr  | any          | Explore    | QANOV-599262 |
          | 11.14  | vivobr  | any          | Start      | QANOV-599263 |
          | 11.14  | vivobr  | any          | Menu Mais  | QANOV-599264 |
          | 11.14  | vivobr  | any          | Profile    | QANOV-599265 |
          | Future | blaude  | any          | Start    | QANOV-258650 |
          | Future | blaude  | any          | Account  | QANOV-258435 |
          | Future | blaude  | any          | Explore  | QANOV-258436 |
          | Future | blaude  | any          | Support  | QANOV-258438 |
          | Future | blaude  | any          | Profile  | QANOV-258439 |
          | Future | o2de    | any          | Start    | QANOV-258651 |
          | Future | o2de    | any          | Account  | QANOV-258440 |
          | Future | o2de    | any          | Explore  | QANOV-258441 |
          | Future | o2de    | any          | Support  | QANOV-258443 |
          | Future | o2de    | any          | Profile  | QANOV-258444 |

    @old_app
    Examples:
          | cv    | product | account_type | screen   | jira_id     |
          | 11.14 | vivobr  | any          | Account  | QANOV-21643 |
          | 11.14 | vivobr  | any          | Explore  | QANOV-21644 |
          | 11.14 | vivobr  | any          | Aura     | QANOV-21645 |
          | 11.14 | vivobr  | any          | Tab Mais | QANOV-21646 |
          | 11.14 | vivobr  | any          | Profile  | QANOV-21647 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can receive a deferred in-app push with app opened
    Given user has the app in "foreground" status
     When receives an in-app push of type "visible" with delivery mode "deferred"
     Then the "In App Message" page is not displayed
      And the "in-app" notification is not displayed

    Examples:
          | cv     | product | jira_id      |
          | 12.0   | o2uk    | QANOV-21648  |
          | 12.0   | moves   | QANOV-21649  |
          | 11.14  | vivobr  | QANOV-21650  |
          | Future | blaude  | QANOV-258445 |
          | Future | o2de    | QANOV-258446 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can receive a silent in-app push with app opened
    Given user has the app in "foreground" status
     When receives an in-app push of type "silent"
     Then the "In App Message" page is not displayed
      And the "in-app" notification is not displayed

    Examples:
          | cv     | product | jira_id      |
          | 12.0   | o2uk    | QANOV-21651  |
          | 12.0   | moves   | QANOV-21652  |
          | 11.14  | vivobr  | QANOV-21653  |
          | Future | blaude  | QANOV-258447 |
          | Future | o2de    | QANOV-258448 |

  @jira.<jira_id> @<product> @android @automation.hard @har @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: User can see a deferred in-app push the next app opening with the app opened
    Given user has the app in "foreground" status
     When receives an in-app push of type "visible" with delivery mode "deferred"
      And terminates the app
      And launches the app
     Then the "In App Message" page is displayed

    Examples:
          | cv     | product | jira_id      |
          | 12.0   | o2uk    | QANOV-21654  |
          | 12.0   | moves   | QANOV-21655  |
          | 11.14  | vivobr  | QANOV-21656  |
          | Future | blaude  | QANOV-258449 |
          | Future | o2de    | QANOV-258450 |

  @jira.<jira_id> @<product> @android @automation.hard @har @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: User can see a silent in-app push the next app opening with the app opened
    Given user has the app in "foreground" status
     When receives an in-app push of type "silent"
      And terminates the app
      And launches the app
     Then the "In App Message" page is displayed

    Examples:
          | cv     | product | jira_id      |
          | 12.0   | o2uk    | QANOV-21657  |
          | 12.0   | moves   | QANOV-21658  |
          | 11.14  | vivobr  | QANOV-21659  |
          | Future | blaude  | QANOV-258451 |
          | Future | o2de    | QANOV-258452 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can close an in-app that has been shown when app is opened
    Given user has the app in "foreground" status
     When receives an in-app push of type "silent"
      And terminates the app
      And launches the app
      And the "In App Message" page is displayed
      And clicks on the "close" button
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | cv     | product | jira_id      |
          | 12.0   | o2uk    | QANOV-21660  |
          | 12.0   | moves   | QANOV-21661  |
          | 11.14  | vivobr  | QANOV-21662  |
          | Future | blaude  | QANOV-258453 |
          | Future | o2de    | QANOV-258454 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.detects.<detects> @manual @mobile
  @regression
  Scenario Outline: User can receive a visible in-app push with app closed
    Given user has the app in "<app_state>" status
     When receives an in-app push of type "visible" with delivery mode "<delivery_mode>"
      And opens the notifications center
     Then the "In App Message" page is not displayed
      And the "in-app" notification is displayed

    Examples:
          | cv     | product | app_state  | delivery_mode | detects    | jira_id      |
          | 12.0   | o2uk    | background | immediate     |            | QANOV-21663  |
          | 12.0   | o2uk    | killed     | immediate     |            | QANOV-21664  |
          | 12.0   | o2uk    | background | deferred      |            | QANOV-21665  |
          | 12.0   | o2uk    | killed     | deferred      |            | QANOV-21666  |
          | 12.0   | moves   | background | immediate     |            | QANOV-21667  |
          | 12.0   | moves   | killed     | immediate     |            | QANOV-21668  |
          | 12.0   | moves   | background | deferred      |            | QANOV-21669  |
          | 12.0   | moves   | killed     | deferred      |            | QANOV-21670  |
          | 11.14  | vivobr  | background | immediate     |            | QANOV-21671  |
          | 11.14  | vivobr  | killed     | immediate     |            | QANOV-21672  |
          | 11.14  | vivobr  | background | deferred      |            | QANOV-21673  |
          | 11.14  | vivobr  | killed     | deferred      |            | QANOV-21674  |
          | Future | blaude  | background | immediate     |            | QANOV-258455 |
          | Future | blaude  | killed     | immediate     | OBO2DE-261 | QANOV-258456 |
          | Future | blaude  | background | deferred      |            | QANOV-258457 |
          | Future | blaude  | killed     | deferred      | OBO2DE-261 | QANOV-258458 |
          | Future | o2de    | background | immediate     |            | QANOV-258459 |
          | Future | o2de    | killed     | immediate     |            | QANOV-258460 |
          | Future | o2de    | background | deferred      |            | QANOV-258461 |
          | Future | o2de    | killed     | deferred      |            | QANOV-258462 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can open a immediate in-app push with app closed
    Given user has the app in "<app_status>" status
     When receives an in-app push of type "visible" with delivery mode "immediate"
      And opens the notifications center
      And clicks on the "in-app" notification
     Then the "In App Message" page is displayed

    Examples:
          | cv     | product | app_status | jira_id      |
          | 12.0   | o2uk    | background | QANOV-21675  |
          | 12.0   | moves   | background | QANOV-21677  |
          | 12.0   | moves   | killed     | QANOV-21678  |
          | 11.14  | vivobr  | background | QANOV-21679  |
          | 11.14  | vivobr  | killed     | QANOV-21680  |
          | Future | blaude  | background | QANOV-258463 |
          | Future | o2de    | background | QANOV-258465 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can open a immediate in-app push with app closed
    Given user has the app in "killed" status
     When receives an in-app push of type "visible" with delivery mode "immediate"
      And opens the notifications center
      And clicks on the "in-app" notification
      And the "App Pin Code" page is displayed
      And fills the PIN placeholder
     Then the "In App Message" page is displayed

    Examples:
          | cv     | product | jira_id      |
          | 12.0   | o2uk    | QANOV-21676  |
          | Future | blaude  | QANOV-258464 |
          | Future | o2de    | QANOV-258466 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see a deferred in-app push the next app opening with the app closed
    Given user has the app in "<app_status>" status
     When receives an in-app push of type "visible" with delivery mode "deferred"
      And launches the app
     Then the "In App Message" page is displayed

    Examples:
          | cv     | product | app_status | jira_id      |
          | 12.0   | o2uk    | background | QANOV-21681  |
          | 12.0   | o2uk    | killed     | QANOV-21682  |
          | 12.0   | moves   | background | QANOV-21683  |
          | 12.0   | moves   | killed     | QANOV-21684  |
          | 11.14  | vivobr  | background | QANOV-21685  |
          | 11.14  | vivobr  | killed     | QANOV-21686  |
          | Future | blaude  | background | QANOV-258467 |
          | Future | blaude  | killed     | QANOV-258468 |
          | Future | o2de    | background | QANOV-258469 |
          | Future | o2de    | killed     | QANOV-258470 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.detects.<jira_bug_id>
  @manual @mobile @smoke @har
  Scenario Outline: A visible in-app push can be injected in the notification inbox
    internal_checkpoint=" In order to have an univocal title to identify the notification received, a $timestamp or
    other unique string should be added to the title when sending the notification"
    Given user is in the "Notification Inbox" page
     When receives an in-app push of type "visible" with delivery mode "<delivery_mode>" and send to notification inbox
     Then the "inbox_list" list is displayed
      And the "0" index in the "inbox_notification" list with "Qsys test $timestamp" format is displayed

    Examples:
          | cv     | product | delivery_mode | jira_bug_id | jira_id      |
          | 12.0   | o2uk    | immediate     |             | QANOV-21687  |
          | 12.0   | o2uk    | deferred      |             | QANOV-21688  |
          | 12.0   | moves   | immediate     |             | QANOV-21689  |
          | 12.0   | moves   | deferred      |             | QANOV-21690  |
          | 11.14  | vivobr  | immediate     |             | QANOV-21691  |
          | 11.14  | vivobr  | deferred      | IOS-7166    | QANOV-21692  |
          | Future | blaude  | immediate     |             | QANOV-258471 |
          | Future | blaude  | deferred      |             | QANOV-258472 |
          | Future | o2de    | immediate     |             | QANOV-258473 |
          | Future | o2de    | deferred      |             | QANOV-258474 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A visible in-app push is not injected in the notification inbox
    internal_checkpoint=" In order to have an univocal title to identify the notification received, a $timestamp or
    other unique string should be added to the title when sending the notification"
    Given user is in the "Notification Inbox" page
     When receives an in-app push of type "visible" with delivery mode "<delivery_mode>" and not send to notification inbox
     Then the "inbox_list" list is displayed
      And the "0" index in the "inbox_notification" list with "Qsys test $timestamp" format is not displayed

    Examples:
          | cv     | product | delivery_mode | jira_id      |
          | 12.0   | o2uk    | immediate     | QANOV-21693  |
          | 12.0   | o2uk    | deferred      | QANOV-21694  |
          | 12.0   | moves   | immediate     | QANOV-21695  |
          | 12.0   | moves   | deferred      | QANOV-21696  |
          | 11.14  | vivobr  | immediate     | QANOV-21697  |
          | 11.14  | vivobr  | deferred      | QANOV-21698  |
          | Future | blaude  | immediate     | QANOV-258475 |
          | Future | blaude  | deferred      | QANOV-258476 |
          | Future | o2de    | immediate     | QANOV-258477 |
          | Future | o2de    | deferred      | QANOV-258478 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A silent in-app push is not injected in the notification inbox
    internal_checkpoint=" In order to have an univocal title to identify the notification received, a $timestamp or
    other unique string should be added to the title when sending the notification"
    Given user is in the "Notification Inbox" page
     When receives an in-app push of type "silent" with delivery mode "none" and not send to notification inbox
     Then the "inbox_list" list is displayed
      And the "0" index in the "inbox_notification" list with "Qsys test $timestamp" format is not displayed

    Examples:
          | cv     | product | jira_id      |
          | 12.0   | o2uk    | QANOV-21699  |
          | 12.0   | moves   | QANOV-21700  |
          | 11.14  | vivobr  | QANOV-21701  |
          | Future | blaude  | QANOV-258479 |
          | Future | o2de    | QANOV-258480 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression @har
  Scenario Outline: User can open a visible in-app that has been injected on the notification inbox
    Given user is in the "Notification Inbox" page
     When receives an in-app push of type "visible" with delivery mode "<delivery_mode>" and send to notification inbox
      And clicks on the "1" element in the "inbox_list" list
     Then the "In App Message" page is displayed

    Examples:
          | cv     | product | delivery_mode | jira_id      |
          | 12.0   | o2uk    | immediate     | QANOV-21702  |
          | 12.0   | o2uk    | deferred      | QANOV-21703  |
          | 12.0   | moves   | immediate     | QANOV-21704  |
          | 12.0   | moves   | deferred      | QANOV-21705  |
          | 11.14  | vivobr  | immediate     | QANOV-21706  |
          | 11.14  | vivobr  | deferred      | QANOV-21707  |
          | Future | blaude  | immediate     | QANOV-258481 |
          | Future | blaude  | deferred      | QANOV-258482 |
          | Future | o2de    | immediate     | QANOV-258483 |
          | Future | o2de    | deferred      | QANOV-258484 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can close an in-app that has been opened from notification inbox
    Given user is in the "Notification Inbox" page
     When receives an in-app push of type "visible" with delivery mode "<delivery_mode>" and send to notification inbox
      And clicks on the "1" element in the "inbox_list" list
      And the "In App Message" page is displayed
      And clicks on the "close" button
     Then the "Notification Inbox" page is displayed

    Examples:
          | cv     | product | delivery_mode | jira_id      |
          | 12.0   | o2uk    | immediate     | QANOV-21708  |
          | 12.0   | o2uk    | deferred      | QANOV-21709  |
          | 12.0   | moves   | immediate     | QANOV-21710  |
          | 12.0   | moves   | deferred      | QANOV-21711  |
          | 11.14  | vivobr  | immediate     | QANOV-21712  |
          | 11.14  | vivobr  | deferred      | QANOV-21713  |
          | Future | blaude  | immediate     | QANOV-258485 |
          | Future | blaude  | deferred      | QANOV-258486 |
          | Future | o2de    | immediate     | QANOV-258487 |
          | Future | o2de    | deferred      | QANOV-258488 |
