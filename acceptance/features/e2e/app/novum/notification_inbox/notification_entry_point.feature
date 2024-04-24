# -*- coding: utf-8 -*-
@jira.QANOV-3565
Feature: Notification Inbox entry point


  @jira.<jira_id> @<ber> @<product> @<test_priority> @android @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile
  Scenario Outline: A <product> user without unseen notifications can see the Notification entry point in <main_tab> without any counter in Android devices
    Given user has no unseen notifications
      And user is in the "<main_tab>" page
     Then the "navigation_top_bar.notification_inbox_icon" icon is displayed
      And the "numeric" red badge is not displayed in the "navigation_top_bar.notifications_inbox_icon_badge" icon

    @manual @har
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | vivobr  | 14.1   | QANOV-520839     | Start    | smoke         |     | QANOV-309459 |
          | blaude  | Future |                  | Account  | smoke         |     | QANOV-309461 |
          | o2de    | Future |                  | Account  | sanity        | ber | QANOV-309465 |
          | o2es    | Future |                  | Account  | sanity        | ber | QANOV-416855 |

    @manual
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | blaude  | Future |                  | Explore  | smoke         |     | QANOV-309462 |
          | blaude  | Future |                  | Start    | smoke         |     | QANOV-309464 |
          | o2de    | Future |                  | Explore  | smoke         |     | QANOV-309466 |
          | o2de    | Future |                  | Support  | smoke         |     | QANOV-309468 |
          | o2de    | Future |                  | Start    | smoke         |     | QANOV-309469 |
          | o2de    | Future |                  | Explore  | smoke         |     | QANOV-416857 |
          | o2de    | Future |                  | Support  | smoke         |     | QANOV-416858 |
          | o2de    | Future |                  | Invoices | smoke         |     | QANOV-416859 |

    @old_app @manual
    Examples:
          | product | cv   | parent_test_plan | main_tab      | test_priority | ber | jira_id      |
          | vivobr  | 14.1 |                  | Account       | smoke         |     | QANOV-309456 |
          | vivobr  | 14.1 |                  | Explore       | smoke         |     | QANOV-309457 |
          | vivobr  | 14.1 |                  | Tab Mais      | sanity        | ber | QANOV-309458 |
          | vivobr  | 14.1 |                  | Vivo Valoriza | smoke         |     | QANOV-309460 |

    @automatic @cert2 @live @next @qa @har
    Examples:
          | product | cv   | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | moves   | 14.1 |                  | Invoices | sanity        | ber | QANOV-598813 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab  | test_priority | ber | jira_id      |
          | moves   | 14.1 |                  | Dashboard | sanity        | ber | QANOV-309448 |
          | moves   | 14.1 |                  | Explore   | smoke         |     | QANOV-309449 |
          | moves   | 24.1 |                  | Gestiones | smoke         |     | QANOV-309450 |
          | moves   | 14.1 |                  | Start     | smoke         |     | QANOV-309452 |

    @automatic @cert0 @cert1 @live @next @qa @har
    Examples:
          | product | cv   | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | o2uk    | 14.1 |                  | Account  | smoke         |     | QANOV-309453 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | o2uk    | 14.1 |                  | Explore  | sanity        | ber | QANOV-309454 |
          | o2uk    | 14.1 |                  | Support  | smoke         |     | QANOV-309455 |
          | o2uk    | 14.1 |                  | Start    | smoke         |     | QANOV-359862 |

    @manual @live @next
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | blaude  | Future |                  | Support  | sanity        | ber | QANOV-309463 |

  @jira.<jira_id> @<ber> @<product> @<test_priority> @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile
  Scenario Outline: A <product> user without unseen notifications can see the Notification entry point in <main_tab> without any counter in iOS devices
    Given user has no unseen notifications
      And user is in the "<main_tab>" page
     Then the "navigation_top_bar.notification_inbox_icon" icon is displayed
      And the "numeric" red badge is not displayed in the "navigation_top_bar.notifications_inbox_icon_badge" icon

    @manual
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | vivobr  | 14.1   | QANOV-520839     | Start    | smoke         |     | QANOV-309480 |
          | blaude  | Future |                  | Explore  | smoke         |     | QANOV-309483 |
          | blaude  | Future |                  | Support  | smoke         |     | QANOV-309484 |
          | blaude  | Future |                  | Start    | smoke         |     | QANOV-309485 |
          | o2de    | Future |                  | Account  | smoke         |     | QANOV-309487 |
          | o2de    | Future |                  | Explore  | sanity        | ber | QANOV-309488 |
          | o2de    | Future |                  | Support  | smoke         |     | QANOV-309489 |
          | o2de    | Future |                  | Start    | smoke         |     | QANOV-309490 |
          | o2es    | Future |                  | Account  | smoke         |     | QANOV-416860 |
          | o2es    | Future |                  | Explore  | sanity        | ber | QANOV-416861 |
          | o2es    | Future |                  | Support  | smoke         |     | QANOV-416862 |
          | o2es    | Future |                  | Invoices | smoke         |     | QANOV-416863 |

    @old_app @manual
    Examples:
          | product | cv   | parent_test_plan | main_tab      | test_priority | ber | jira_id      |
          | vivobr  | 14.1 |                  | Account       | smoke         |     | QANOV-309477 |
          | vivobr  | 14.1 |                  | Explore       | smoke         |     | QANOV-309478 |
          | vivobr  | 14.1 |                  | Tab Mais      | smoke         |     | QANOV-309479 |
          | vivobr  | 14.1 |                  | Vivo Valoriza | sanity        | ber | QANOV-309481 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab  | test_priority | ber | jira_id      |
          | moves   | 14.1 |                  | Dashboard | smoke         |     | QANOV-309470 |
          | moves   | 14.1 |                  | Explore   | sanity        | ber | QANOV-309471 |
          | moves   | 24.1 |                  | Gestiones | smoke         |     | QANOV-309472 |
          | moves   | 14.1 |                  | Start     | smoke         |     | QANOV-309473 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | o2uk    | 14.1 |                  | Account  | smoke         |     | QANOV-309474 |
          | o2uk    | 14.1 |                  | Explore  | smoke         |     | QANOV-309475 |
          | o2uk    | 14.1 |                  | Support  | sanity        | ber | QANOV-309476 |
          | o2uk    | 14.1 |                  | Start    | smoke         |     | QANOV-359863 |

    @manual @live @next @qa
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | blaude  | Future |                  | Account  | sanity        | ber | QANOV-309482 |

  @jira.<jira_id> @<ber> @<product> @<test_priority> @android @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile
  Scenario Outline: A <product> user with unseen notifications can see the Notification entry point in <main_tab> and a counter indicating the number of unseen notifications in Android devices
    Given user has unseen notifications
      And user is in the "<main_tab>" page
     Then the badge in the "navigation_top_bar.notifications_inbox_icon_badge" shows the number of unseen notifications

    @manual @har
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | vivobr  | 14.1   | QANOV-520839     | Start    | smoke         |     | QANOV-309501 |
          | blaude  | Future |                  | Start    | smoke         |     | QANOV-309506 |
          | o2de    | Future |                  | Account  | sanity        | ber | QANOV-309507 |
          | o2es    | Future |                  | Account  | sanity        | ber | QANOV-416867 |

    @manual
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | blaude  | Future |                  | Account  | smoke         |     | QANOV-309503 |
          | blaude  | Future |                  | Explore  | smoke         |     | QANOV-309504 |
          | o2de    | Future |                  | Explore  | smoke         |     | QANOV-309508 |
          | o2de    | Future |                  | Support  | smoke         |     | QANOV-309509 |
          | o2de    | Future |                  | Start    | smoke         |     | QANOV-309510 |
          | o2de    | Future |                  | Explore  | smoke         |     | QANOV-416868 |
          | o2de    | Future |                  | Support  | smoke         |     | QANOV-416869 |
          | o2de    | Future |                  | Invoices | smoke         |     | QANOV-416871 |

    @old_app @manual
    Examples:
          | product | cv   | parent_test_plan | main_tab      | test_priority | ber | jira_id      |
          | vivobr  | 14.1 |                  | Account       | smoke         |     | QANOV-309498 |
          | vivobr  | 14.1 |                  | Explore       | smoke         |     | QANOV-309499 |
          | vivobr  | 14.1 |                  | Tab Mais      | sanity        | ber | QANOV-309500 |
          | vivobr  | 14.1 |                  | Vivo Valoriza | smoke         |     | QANOV-309502 |

    @automatic @cert2 @live @next @qa @har
    Examples:
          | product | cv   | parent_test_plan | main_tab  | test_priority | ber | jira_id      |
          | moves   | 14.1 |                  | Dashboard | sanity        | ber | QANOV-309491 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab  | test_priority | ber | jira_id      |
          | moves   | 14.1 |                  | Explore   | smoke         |     | QANOV-309492 |
          | moves   | 24.1 |                  | Gestiones | smoke         |     | QANOV-309493 |
          | moves   | 14.1 |                  | Start     | smoke         |     | QANOV-309494 |

    @automatic @cert0 @cert1 @live @next @qa @har
    Examples:
          | product | cv   | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | o2uk    | 14.1 |                  | Account  | smoke         |     | QANOV-309495 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | o2uk    | 14.1 |                  | Explore  | sanity        | ber | QANOV-309496 |
          | o2uk    | 14.1 |                  | Support  | smoke         |     | QANOV-309497 |
          | o2uk    | 14.1 |                  | Start    | smoke         |     | QANOV-359864 |

    @manual @live @next @qa
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | blaude  | Future |                  | Support  | sanity        | ber | QANOV-309505 |

  @jira.<jira_id> @<ber> @<product> @<test_priority> @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @mobile
  Scenario Outline: A <product> user with unseen notifications can see the Notification entry point in <main_tab> and a counter indicating the number of unseen notifications in iOS devices
    Given user has unseen notifications
      And user is in the "<main_tab>" page
     Then the badge in the "navigation_top_bar.notifications_inbox_icon_badge" shows the number of unseen notifications

    @manual @har
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | vivobr  | 14.1   | QANOV-520839     | Start    | smoke         |     | QANOV-309521 |
          | blaude  | Future |                  | Explore  | smoke         |     | QANOV-309525 |
          | o2de    | Future |                  | Account  | smoke         |     | QANOV-309528 |
          | o2es    | Future |                  | Account  | smoke         |     | QANOV-416873 |

    @manual
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | blaude  | Future |                  | Support  | smoke         |     | QANOV-309526 |
          | blaude  | Future |                  | Start    | smoke         |     | QANOV-309527 |
          | o2de    | Future |                  | Explore  | sanity        | ber | QANOV-309529 |
          | o2de    | Future |                  | Support  | smoke         |     | QANOV-309530 |
          | o2de    | Future |                  | Start    | smoke         |     | QANOV-309531 |
          | o2de    | Future |                  | Explore  | sanity        | ber | QANOV-416874 |
          | o2de    | Future |                  | Support  | smoke         |     | QANOV-416875 |
          | o2de    | Future |                  | Invoices | smoke         |     | QANOV-416876 |

    @old_app @manual
    Examples:
          | product | cv   | parent_test_plan | main_tab      | test_priority | ber | jira_id      |
          | vivobr  | 14.1 |                  | Account       | smoke         |     | QANOV-309518 |
          | vivobr  | 14.1 |                  | Explore       | smoke         |     | QANOV-309519 |
          | vivobr  | 14.1 |                  | Tab Mais      | smoke         |     | QANOV-309520 |
          | vivobr  | 14.1 |                  | Vivo Valoriza | sanity        | ber | QANOV-309522 |

    @automatic @cert2 @live @next @qa @har
    Examples:
          | product | cv   | parent_test_plan | main_tab  | test_priority | ber | jira_id      |
          | moves   | 14.1 |                  | Dashboard | smoke         |     | QANOV-309511 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab  | test_priority | ber | jira_id      |
          | moves   | 14.1 |                  | Explore   | sanity        | ber | QANOV-309512 |
          | moves   | 24.1 |                  | Gestiones | smoke         |     | QANOV-309513 |
          | moves   | 14.1 |                  | Start     | smoke         |     | QANOV-309514 |

    @automatic @cert0 @cert1 @live @next @qa @har
    Examples:
          | product | cv   | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | o2uk    | 14.1 |                  | Account  | smoke         |     | QANOV-309515 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | o2uk    | 14.1 |                  | Explore  | smoke         |     | QANOV-309516 |
          | o2uk    | 14.1 |                  | Support  | sanity        | ber | QANOV-309517 |
          | o2uk    | 14.1 |                  | Start    | smoke         |     | QANOV-359865 |

    @manual @live @next @qa
    Examples:
          | product | cv     | parent_test_plan | main_tab | test_priority | ber | jira_id      |
          | blaude  | Future |                  | Account  | sanity        | ber | QANOV-309524 |

  @jira.<jira_id> @<client> @<product> @automation_hard @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @regression
  Scenario Outline: A <product> user with more than 9 unseen notifications will see the badge counter showing "9" and a plus symbol
    Given user has ">9" unseen notifications
      And user is in the "<main_tab>" page
     Then the badge in the "navigation_top_bar.notifications_icon" has "<counter>" unseen notifications

    Examples:
          | product | parent_test_plan | cv     | client  | main_tab | counter | jira_id      |
          | vivobr  | QANOV-520839     | 14.1   | android | Start    | 9+      | QANOV-309532 |
          | moves   |                  | 14.1   | android | Account  | 9+      | QANOV-309533 |
          | o2uk    |                  | 14.1   | android | Account  | 9+      | QANOV-309534 |
          | blaude  |                  | Future | android | Account  | 9+      | QANOV-309535 |
          | o2de    |                  | Future | android | Account  | 9+      | QANOV-309536 |
          | o2es    |                  | Future | android | Account  | 9+      | QANOV-416877 |
          | vivobr  | QANOV-520839     | 14.1   | ios     | Start    | +9      | QANOV-309537 |
          | moves   |                  | 14.1   | ios     | Account  | +9      | QANOV-309538 |
          | o2uk    |                  | 14.1   | ios     | Account  | +9      | QANOV-309539 |
          | blaude  |                  | Future | ios     | Account  | +9      | QANOV-309540 |
          | o2de    |                  | Future | ios     | Account  | +9      | QANOV-309541 |
          | o2es    |                  | Future | ios     | Account  | +9      | QANOV-416878 |

  @jira.<jira_id> @<client> @<product> @<har> @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-24947 @mobile @smoke
  Scenario Outline: A <product> user who has received notifications from <main_tab> can access to the Notification inbox entry point and see them
    Notification list will be ordered by the date timestamp
    - Text truncation:
    -- Title will be truncated to '2' lines
    -- Text will be  truncated to '2' lines
    - Text formatting: Text will show bold, italic, emoji ..etc if included in the text
    - Timestamp will be shown according to this criteria:
    -- Received on the same day -> HH:MM (ex. 13:55)
    -- Received yesterday (before 00:00 of 'today') -> the word 'Yesterday'
    -- Received during the week (up to a week’s time) -> the weekday when it was received
    -- Received during the year (up to a year’s time) -> dd mmm (where the first d is not shown
    if the value is zero and the first letter is capitalised). Example: 23 Jun
    --- PT locale in VIVO in iOS devices will add "De" : 23 De Jun
    -- Received more than a year ago -> dd/mm/yyyy. Example: 14/06/2018. The first d will be shown even if it’s zero
    - Notifications will be ordered by timestamp within the Inbox.
    From 24.0 a chevron is shown
    Given user has received notifications
      And user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.notification_inbox_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "[LANG:notification_inbox.notifications]" header is displayed
      And the "inbox_list" list is displayed
      And each element in the "inbox_list" list has the "date" field
      And each element in the "inbox_list" list has the "title" field
      And each element in the "inbox_list" list has the "description" field
      And each element in the "inbox_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.<button>" button
      And the "<main_tab>" page is displayed

    @manual
    Examples:
          | product | cv   | parent_test_plan | main_tab | client  | button      | jira_id      | har |
          | vivobr  | 14.1 | QANOV-520839     | Start    | android | back_button | QANOV-309553 | har |
          | vivobr  | 24.0 | QANOV-520839     | Start    | ios     | back_button | QANOV-522449 | har |

    @manual
    Examples:
          | product | cv     | parent_test_plan | main_tab | client  | button       | jira_id      | har |
          | o2de    | Future |                  | Account  | android | back_button  | QANOV-309561 | har |
          | o2de    | Future |                  | Account  | ios     | close_button | QANOV-359875 | har |
          | o2de    | Future |                  | Explore  | android | back_button  | QANOV-309562 |     |
          | o2de    | Future |                  | Explore  | ios     | close_button | QANOV-359876 |     |
          | o2de    | Future |                  | Support  | android | back_button  | QANOV-309563 |     |
          | o2de    | Future |                  | Support  | ios     | close_button | QANOV-359877 |     |
          | o2de    | Future |                  | Start    | android | back_button  | QANOV-309565 |     |
          | o2de    | Future |                  | Start    | ios     | close_button | QANOV-359878 |     |
          | o2es    | Future |                  | Account  | android | back_button  | QANOV-416881 | har |
          | o2es    | Future |                  | Account  | ios     | close_button | QANOV-416882 | har |
          | o2es    | Future |                  | Explore  | android | back_button  | QANOV-416884 |     |
          | o2es    | Future |                  | Explore  | ios     | close_button | QANOV-416885 |     |
          | o2es    | Future |                  | Support  | android | back_button  | QANOV-416886 |     |
          | o2es    | Future |                  | Support  | ios     | close_button | QANOV-416887 |     |
          | o2es    | Future |                  | Invoices | android | back_button  | QANOV-416888 |     |
          | o2es    | Future |                  | Invoices | ios     | close_button | QANOV-416889 |     |


    @manual @old_app
    Examples:
          | product | cv   | parent_test_plan | main_tab      | client  | button       | jira_id      | har |
          | vivobr  | 14.1 |                  | Account       | android | back_button  | QANOV-309549 | har |
          | vivobr  | 14.1 |                  | Account       | ios     | close_button | QANOV-359870 | har |
          | vivobr  | 14.1 |                  | Explore       | android | back_button  | QANOV-309551 |     |
          | vivobr  | 14.1 |                  | Explore       | ios     | close_button | QANOV-359871 |     |
          | vivobr  | 14.1 |                  | Tab Mais      | android | back_button  | QANOV-309552 |     |
          | vivobr  | 14.1 |                  | Tab Mais      | ios     | close_button | QANOV-359872 |     |
          | vivobr  | 14.1 |                  | Vivo Valoriza | android | back_button  | QANOV-309554 |     |
          | vivobr  | 14.1 |                  | Vivo Valoriza | ios     | close_button | QANOV-359874 |     |
          | vivobr  | 14.1 |                  | Start         | ios     | close_button | QANOV-359873 | har |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab  | client  | button       | jira_id      | har |
          | moves   | 14.1 |                  | Dashboard | android | back_button  | QANOV-309542 | har |
          | moves   | 14.1 |                  | Dashboard | ios     | close_button | QANOV-359866 | har |
          | moves   | 14.1 |                  | Explore   | android | back_button  | QANOV-309543 |     |
          | moves   | 14.1 |                  | Explore   | ios     | close_button | QANOV-359867 |     |
          | moves   | 24.1 |                  | Gestiones | android | back_button  | QANOV-309544 |     |
          | moves   | 24.1 |                  | Gestiones | ios     | close_button | QANOV-359868 |     |
          | moves   | 14.1 |                  | Start     | android | back_button  | QANOV-309545 |     |
          | moves   | 14.1 |                  | Start     | ios     | close_button | QANOV-359869 |     |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | parent_test_plan | main_tab | client  | button       | jira_id      | har |
          | o2uk    | 14.1 |                  | Account  | android | back_button  | QANOV-309546 | har |
          | o2uk    | 14.1 |                  | Account  | ios     | close_button | QANOV-359879 | har |
          | o2uk    | 14.1 |                  | Explore  | android | back_button  | QANOV-309547 |     |
          | o2uk    | 14.1 |                  | Explore  | ios     | close_button | QANOV-359880 |     |
          | o2uk    | 14.1 |                  | Support  | android | back_button  | QANOV-309548 |     |
          | o2uk    | 14.1 |                  | Support  | ios     | close_button | QANOV-359881 |     |
          | o2uk    | 14.1 |                  | Start    | android | back_button  | QANOV-359882 |     |
          | o2uk    | 14.1 |                  | Start    | ios     | close_button | QANOV-359883 |     |

    @manual @live @next @qa
    Examples:
          | product | cv     | parent_test_plan | main_tab | client  | button       | jira_id      | har |
          | blaude  | Future |                  | Account  | android | back_button  | QANOV-309556 | har |
          | blaude  | Future |                  | Account  | ios     | close_button | QANOV-323913 | har |
          | blaude  | Future |                  | Explore  | android | back_button  | QANOV-309557 |     |
          | blaude  | Future |                  | Explore  | ios     | close_button | QANOV-323914 |     |
          | blaude  | Future |                  | Support  | android | back_button  | QANOV-309558 |     |
          | blaude  | Future |                  | Support  | ios     | close_button | QANOV-323915 |     |
          | blaude  | Future |                  | Start    | android | back_button  | QANOV-309560 |     |
          | blaude  | Future |                  | Start    | ios     | close_button | QANOV-323916 |     |

  @jira.QANOV-522450 @android @ios @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-520839 @manual @mobile @smoke
  @vivobr @har
  Scenario: A vivobr user who has received notifications can access to the Notification inbox entry point and see them
    Notification list will be ordered by the date timestamp
    - Text truncation:
    -- Title will be truncated to '2' lines
    -- Text will be  truncated to '2' lines
    - Text formatting: Text will show bold, italic, emoji ..etc if included in the text
    - Timestamp will be shown according to this criteria:
    -- Received on the same day -> HH:MM (ex. 13:55)
    -- Received yesterday (before 00:00 of 'today') -> the word 'Yesterday'
    -- Received during the week (up to a week’s time) -> the weekday when it was received
    -- Received during the year (up to a year’s time) -> dd mmm (where the first d is not shown
    if the value is zero and the first letter is capitalised). Example: 23 Jun
    --- PT locale in VIVO in iOS devices will add "De" : 23 De Jun
    -- Received more than a year ago -> dd/mm/yyyy. Example: 14/06/2018. The first d will be shown even if it’s zero
    - Notifications will be ordered by timestamp within the Inbox.
    Given user has received notifications
      And user is in the "Start" page
     When clicks on the "navigation_top_bar.notification_inbox_icon" icon
     Then the "Notification Inbox" page is displayed
      And the header is empty
      And the "notification_inbox_title" textfield with "[LANG:notification_inbox.notifications]" text is displayed
      And the "inbox_list" list is displayed
      And each element in the "inbox_list" list has the "date" field
      And each element in the "inbox_list" list has the "title" field
      And each element in the "inbox_list" list has the "description" field
      And each element in the "inbox_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed

  @jira.<jira_id> @<client> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A <product> user who has received notification with thumbnail will see it when accessing to the Inbox
    From 24.0 the thumbnail is in the left side of the notification row.
    Given user has "any" notifications with thumbnail
      And user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.notifications_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And the thumbnail is displayed in the selected notification

    Examples:
          | product | parent_test_plan         | cv     | main_tab | jira_id      |
          | vivobr  | QANOV-24947:QANOV-520839 | 14.1   | Start    | QANOV-309566 |
          | moves   | QANOV-24947              | 14.1   | Start    | QANOV-309568 |
          | o2uk    | QANOV-24947              | 14.1   | Account  | QANOV-309569 |
          | blaude  | QANOV-24947              | Future | Start    | QANOV-309571 |
          | o2de    | QANOV-24947              | Future | Start    | QANOV-309573 |
          | o2es    | QANOV-24947              | Future | Account  | QANOV-416892 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A <product> user who has accessed to the Notification inbox from <main_tab> and goes back will see the inbox entrypoint without any counter in Android devices
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "<main_tab>" page is displayed
      And the "navigation_top_bar.notifications_icon" icon is displayed
      And the "numeric" red badge is not displayed in the "navigation_top_bar.notifications_icon" icon

    Examples:
          | product | parent_test_plan         | cv     | main_tab  | jira_id      |
          | moves   | QANOV-24947              | 14.1   | Account   | QANOV-309574 |
          | moves   | QANOV-24947              | 14.1   | Explore   | QANOV-309575 |
          | moves   | QANOV-24947              | 24.1   | Gestiones | QANOV-309576 |
          | moves   | QANOV-24947              | 14.1   | Start     | QANOV-309577 |
          | o2uk    | QANOV-24947              | 14.1   | Account   | QANOV-309578 |
          | o2uk    | QANOV-24947              | 14.1   | Explore   | QANOV-309579 |
          | o2uk    | QANOV-24947              | 14.1   | Support   | QANOV-309580 |
          | vivobr  | QANOV-24947:QANOV-520839 | 14.1   | Start     | QANOV-309584 |
          | blaude  | QANOV-24947              | Future | Account   | QANOV-309587 |
          | blaude  | QANOV-24947              | Future | Explore   | QANOV-309588 |
          | blaude  | QANOV-24947              | Future | Support   | QANOV-309590 |
          | blaude  | QANOV-24947              | Future | Start     | QANOV-309591 |
          | o2de    | QANOV-24947              | Future | Account   | QANOV-309593 |
          | o2de    | QANOV-24947              | Future | Explore   | QANOV-309595 |
          | o2de    | QANOV-24947              | Future | Support   | QANOV-309597 |
          | o2de    | QANOV-24947              | Future | Start     | QANOV-309598 |
          | o2es    | QANOV-24947              | Future | Account   | QANOV-416895 |
          | o2es    | QANOV-24947              | Future | Explore   | QANOV-416896 |
          | o2es    | QANOV-24947              | Future | Support   | QANOV-416897 |
          | o2es    | QANOV-24947              | Future | Invoices  | QANOV-416899 |

    @old_app
    Examples:
          | product | parent_test_plan | cv   | main_tab      | jira_id      |
          | vivobr  | QANOV-24947      | 14.1 | Account       | QANOV-309581 |
          | vivobr  | QANOV-24947      | 14.1 | Explore       | QANOV-309582 |
          | vivobr  | QANOV-24947      | 14.1 | Tab Mais      | QANOV-309583 |
          | vivobr  | QANOV-24947      | 14.1 | Vivo Valoriza | QANOV-309585 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A <product> user who has accessed to the Notification inbox from <main_tab> and goes back will see the inbox entrypoint without any counter in iOS devices
    Splitted by client due to different implementation in how the badge is shown
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
     When clicks on the "navigation_top_bar.close_button" button
     Then the "<main_tab>" page is displayed
      And the "navigation_top_bar.notifications_icon" icon is displayed
      And the "numeric" red badge is not displayed in the "navigation_top_bar.notifications_inbox_icon_badge" icon

    Examples:
          | product | parent_test_plan         | cv     | button       | main_tab  | jira_id      |
          | moves   | QANOV-24947              | 14.1   | close_button | Account   | QANOV-309599 |
          | moves   | QANOV-24947              | 14.1   | close_button | Explore   | QANOV-309600 |
          | moves   | QANOV-24947              | 24.1   | close_button | Gestiones | QANOV-309602 |
          | moves   | QANOV-24947              | 14.1   | close_button | Start     | QANOV-309603 |
          | o2uk    | QANOV-24947              | 14.1   | close_button | Account   | QANOV-309604 |
          | o2uk    | QANOV-24947              | 14.1   | close_button | Explore   | QANOV-309605 |
          | o2uk    | QANOV-24947              | 14.1   | close_button | Support   | QANOV-309606 |
          | vivobr  | QANOV-24947:QANOV-520839 | 24.0   | back_button  | Start     | QANOV-522451 |
          | blaude  | QANOV-24947              | Future | close_button | Account   | QANOV-309613 |
          | blaude  | QANOV-24947              | Future | close_button | Explore   | QANOV-309615 |
          | blaude  | QANOV-24947              | Future | close_button | Support   | QANOV-309616 |
          | blaude  | QANOV-24947              | Future | close_button | Start     | QANOV-309617 |
          | o2de    | QANOV-24947              | Future | close_button | Account   | QANOV-309618 |
          | o2de    | QANOV-24947              | Future | close_button | Explore   | QANOV-309620 |
          | o2de    | QANOV-24947              | Future | close_button | Support   | QANOV-309621 |
          | o2de    | QANOV-24947              | Future | close_button | Start     | QANOV-309623 |
          | o2es    | QANOV-24947              | Future | close_button | Account   | QANOV-416901 |
          | o2es    | QANOV-24947              | Future | close_button | Explore   | QANOV-416902 |
          | o2es    | QANOV-24947              | Future | close_button | Support   | QANOV-416903 |
          | o2es    | QANOV-24947              | Future | close_button | Invoices  | QANOV-416905 |

    @old_app
    Examples:
          | product | parent_test_plan | cv   | button       | main_tab      | jira_id      |
          | vivobr  | QANOV-24947      | 14.1 | close_button | Account       | QANOV-309608 |
          | vivobr  | QANOV-24947      | 14.1 | close_button | Explore       | QANOV-309609 |
          | vivobr  | QANOV-24947      | 14.1 | close_button | Tab Mais      | QANOV-309610 |
          | vivobr  | QANOV-24947      | 14.1 | close_button | Start         | QANOV-309611 |
          | vivobr  | QANOV-24947      | 14.1 | close_button | Vivo Valoriza | QANOV-309612 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.1 @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression
  Scenario Outline: A <product> user who has not received any notifications can access to the Notification inbox entry point and will see the empty case screen
    In case we need to delete all the notifications for a User, we can ask the TGT dev team to do it
    Given user has not received notifications
      And user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.notification_inbox_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "[LANG:notification_inbox.notifications]" header is displayed
      And the "empty_case_image" image is displayed
      And the "empty_case_title" textfield with "[LANG:notification_inbox.empty_case_title]" text is displayed
      And the "empty_case_text" textfield with "[LANG:notification_inbox.empty_case_text]" text is displayed

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | parent_test_plan | main_tab           | jira_id      |
          | o2uk    |                  | [CONF:landing_tab] | QANOV-309625 |

    @live @next @qa
    Examples:
          | product | parent_test_plan | main_tab | jira_id      |
          | vivobr  | QANOV-520839     | Start    | QANOV-309624 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: A <product> user who has not received any notifications can access to the Notification inbox entry point and will see the empty case screen
    This will replace the scenario above once the empty_case_button is in production
    Given user has not received notifications
      And user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.notification_inbox_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "[LANG:notification_inbox.notifications]" header is displayed
      And the "empty_case_image" image is displayed
      And the "empty_case_title" textfield with "[LANG:notification_inbox.empty_case_title]" text is displayed
      And the "empty_case_text" textfield with "[LANG:notification_inbox.empty_case_text]" text is displayed
      And the "empty_case_button" button with "[LANG:notification_inbox.empty_case_button]" text is displayed

    Examples:
          | product | parent_test_plan | main_tab           | jira_id      | cv     |
          | o2uk    |                  | [CONF:landing_tab] | QANOV-491876 | Future |
          | vivobr  | QANOV-520839     | Start              | QANOV-491877 | 24.3   |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A <product> user who has not received any notifications can close the notification inbox by clicking on the empty case button
    Given user has not received notifications
      And user is in the "<main_tab>" page
     When clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "empty_case_button" button
     Then the "Notification Inbox" page is not displayed

    Examples:
          | product | parent_test_plan | main_tab           | depends_on   | jira_id      | cv     |
          | o2uk    |                  | [CONF:landing_tab] | QANOV-309625 | QANOV-491878 | Future |
          | vivobr  | QANOV-520839     | Start              | QANOV-309624 | QANOV-491879 | 24.3   |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user who has not received any notifications and has the service and commercial notifications enabled will see the empty case in the Inbox screen
    The service and commercial notifications are enabled (only for moves, o2es, blaude and o2de).
    In case we need to delete all the notifications for a user, we can ask the TARGETING dev team to do it.
    empty_case_button is still not in production.
    Given user has not received notifications
      And user is in the "Account" page
      And user has "commercial" notifications "enabled" in the application
      And user has "service" notifications "enabled" in the application
     When clicks on the "navigation_top_bar.notifications_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "[LANG:notification_inbox.notifications]" header is displayed
      And the "empty_case_image" image is displayed
      And the "empty_case_title" textfield with "[LANG:notification_inbox.empty_case_title]" text is displayed
      And the "empty_case_text" textfield with "[LANG:notification_inbox.empty_case_text]" text is displayed
      And the "empty_case_button" button with "[LANG:notification_inbox.empty_case_button]" text is displayed

    Examples:
          | product | cv     | jira_id      |
          | moves   | 14.1   | QANOV-309626 |
          | blaude  | Future | QANOV-309627 |
          | o2de    | Future | QANOV-309628 |
          | o2es    | Future | QANOV-416906 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A <product> user who has not received any notifications and has the service and commercial notifications can close the notification inbox by clicking on the empty case button
    Given user has not received notifications
      And user is in the "Account" page
      And user has "commercial" notifications "enabled" in the application
      And user has "service" notifications "enabled" in the application
     When clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And clicks on the "empty_case_button" button
     Then the "Notification Inbox" page is not displayed

    Examples:
          | product | depends_on   | jira_id      |
          | moves   | QANOV-309626 | QANOV-491880 |
          | blaude  | QANOV-309627 | QANOV-491881 |
          | o2de    | QANOV-309628 | QANOV-491882 |
          | o2es    | QANOV-416906 | QANOV-491883 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @sanity
  Scenario Outline: Notification inbox entrypoint is not shown in <page_name> page
    Given user is in the "<page_name>" page
     Then the "navigation_top_bar.notifications_icon" icon is not displayed

    Examples:
          | product | page_name | jira_id      |
          | blaude  | Account   | QANOV-545563 |
          | blaude  | Start     | QANOV-545564 |
          | blaude  | Explore   | QANOV-545565 |
          | blaude  | Support   | QANOV-545566 |
          | o2de    | Account   | QANOV-545567 |
          | o2de    | Start     | QANOV-545568 |
          | o2de    | Explore   | QANOV-545569 |
          | o2de    | Support   | QANOV-545570 |
