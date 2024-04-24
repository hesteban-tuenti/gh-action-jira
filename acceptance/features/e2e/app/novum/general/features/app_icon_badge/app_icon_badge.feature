# -*- coding: utf-8 -*-
@jira.QANOV-377071
Feature: App icon badge


  @jira.<jira_id> @<priority> @<product> @android @automation.hard @ios @manual
  Scenario Outline: A user who receives a notification and there aren't unseen notifications will see a numeric badge in the app's icon
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    the format and place of the badge depends on the OS and is not configurable
    Not all launchers will display notification badges in the app icon for example OnePlues and PocoPhone
    Other Android launchers such as the Pixel shows a popup when pressing and holding on the app icon
    Given user has "os" notifications with "enabled" status
      And user has no unseen notifications
      And user has the app in "<status>" status
     When receives a notification
      And launches the home screen
     Then a "numeric" badge is displayed in the "<product>_app" icon
      And the badge in the "<product>_app" has "1" unseen notifications

    @jira.cv.14.5 @har
    Examples:
          | product | status     | priority   | jira_id      |
          | vivobr  | foreground | sanity     | QANOV-377072 |
          | o2uk    | foreground | sanity     | QANOV-377075 |
          | moves   | foreground | sanity     | QANOV-377078 |

    @jira.cv.14.5
    Examples:
          | product | status     | priority   | jira_id      |
          | vivobr  | killed     | regression | QANOV-377074 |
          | vivobr  | background | smoke      | QANOV-377073 |
          | o2uk    | killed     | regression | QANOV-377077 |
          | o2uk    | background | smoke      | QANOV-377076 |
          | moves   | killed     | regression | QANOV-377080 |
          | moves   | background | smoke      | QANOV-377079 |

    @jira.cv.Future
    Examples:
          | product | status     | priority   | jira_id      |
          | o2es    | foreground | sanity     | QANOV-377087 |
          | o2es    | background | smoke      | QANOV-377088 |
          | o2es    | killed     | regression | QANOV-377089 |
          | blaude  | foreground | sanity     | QANOV-377081 |
          | blaude  | background | smoke      | QANOV-377082 |
          | blaude  | killed     | regression | QANOV-377083 |
          | o2de    | foreground | sanity     | QANOV-377084 |
          | o2de    | background | smoke      | QANOV-377085 |
          | o2de    | killed     | regression | QANOV-377086 |

  @jira.<jira_id> @<priority> @<product> @android @automation.hard @ios @manual
  Scenario Outline: A user who receives a notification and there are unseen notifications will see the numeric badge in the app's icon updated
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    the format and place of the badge depends on the OS and is not configurable
    Not all launchers will display notification badges in the app icon for example OnePlues and PocoPhone
    Other Android launchers such as the Pixel shows a popup when pressing and holding on the app icon
    Given user has "os" notifications with "enabled" status
      And user has unseen notifications
      And the badge in the "<product>_app" shows the number of unseen notifications
      And user has the app in "<status>" status
     When receives a notification
      And launches the home screen
     Then the badge in the "<product>_app" has "[CONTEXT:unseen_notifications]+1" unseen notifications

    @jira.cv.14.5 @har
    Examples:
          | product | status     | priority   | jira_id      |
          | vivobr  | foreground | smoke      | QANOV-377090 |
          | o2uk    | foreground | smoke      | QANOV-377093 |
          | moves   | foreground | smoke      | QANOV-377096 |

    @jira.cv.14.5
    Examples:
          | product | status     | priority   | jira_id      |
          | vivobr  | background | regression | QANOV-377091 |
          | vivobr  | killed     | regression | QANOV-377092 |
          | o2uk    | background | regression | QANOV-377094 |
          | o2uk    | killed     | regression | QANOV-377095 |
          | moves   | background | regression | QANOV-377097 |
          | moves   | killed     | regression | QANOV-377098 |

    @jira.cv.Future
    Examples:
          | product | status     | priority   | jira_id      |
          | o2es    | foreground | smoke      | QANOV-377105 |
          | o2es    | background | regression | QANOV-377106 |
          | o2es    | killed     | regression | QANOV-377107 |
          | blaude  | foreground | smoke      | QANOV-377099 |
          | blaude  | background | regression | QANOV-377100 |
          | blaude  | killed     | regression | QANOV-377101 |
          | o2de    | foreground | smoke      | QANOV-377102 |
          | o2de    | background | regression | QANOV-377103 |
          | o2de    | killed     | regression | QANOV-377104 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @manual @smoke @har
  Scenario Outline: A user who has a numeric badge in the app icon will see the same value in the notification inbox badge
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    Some launchers might show more than 3 digits but the inbox icon will show up to 9, and from then it'll show +9
    Given user has unseen notifications
      And user launches the home screen
      And the badge in the "<product>_app" shows the number of unseen notifications
     When goes back to the app
      And navigates to "[CONF:landing_tab]" page
     Then the badge in the "notifications_inbox_icon_badge" shows the number of unseen notifications

    @jira.cv.14.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-377108 |
          | o2uk    | QANOV-377109 |
          | moves   | QANOV-377110 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-377113 |
          | blaude  | QANOV-377111 |
          | o2de    | QANOV-377112 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @manual @regression
  Scenario Outline: A user who has a numeric badge in the app icon won't see it after accessing the Inbox
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    Some launchers might show more than 3 digits but the inbox icon will show up to 9, and from then it'll show +9
    Given user has unseen notifications
      And user launches the home screen
      And the badge in the "<product>_app" shows the number of unseen notifications
     When goes back to the app
      And user is in the "[CONF:landing_tab]" page
      And clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And launches the home screen
     Then the "numeric" badge is not displayed in the "<product>_app" icon

    @jira.cv.14.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-377114 |
          | o2uk    | QANOV-377115 |
          | moves   | QANOV-377116 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-377119 |
          | blaude  | QANOV-377117 |
          | o2de    | QANOV-377118 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @manual @regression
  Scenario Outline: A user who is logged in in several devices and receives a notification will see a numeric badge in the app icon in all devices
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    the format and place of the badge depends on the OS and is not configurable
    Not all launchers will display notification badges in the app icon for example OnePlues and PocoPhone
    Other Android launchers such as the Pixel shows a popup when pressing and holding on the app icon
    Given user is logged in with the same account in several devices
      And user has "os" notifications with "enabled" status
      And user has no unseen notifications
     When receives a notification
      And launches the home screen in all devices
     Then a "numeric" badge is displayed in the "<product>_app" icon in all devices
      And the badge in the "<product>_app" has "1" unseen notifications in all devices

    @jira.cv.14.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-377120 |
          | o2uk    | QANOV-377121 |
          | moves   | QANOV-377122 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-377125 |
          | blaude  | QANOV-377123 |
          | o2de    | QANOV-377124 |

  @jira.<jira_id> @<product> @android @ios @manual @no.automatable @regression
  Scenario Outline: A user who is logged in in several devices with unseen notifications and receives a notification will see the numeric badge updated in the app icon in all devices
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    the format and place of the badge depends on the OS and is not configurable
    Not all launchers will display notification badges in the app icon for example OnePlues and PocoPhone
    Other Android launchers such as the Pixel shows a popup when pressing and holding on the app icon
    Given user is logged in with the same account in two devices
      And user has "os" notifications with "enabled" status
      And user has unseen notifications
      And the badge in the "<product>_app" shows the number of unseen notifications in all devices
     When receives a notification
      And launches the home screen in all devices
     Then the badge in the "<product>_app" has "[CONTEXT:unseen_notifications]+1" unseen notifications in all devices

    @jira.cv.14.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-377126 |
          | o2uk    | QANOV-377127 |
          | moves   | QANOV-377128 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-377131 |
          | blaude  | QANOV-377129 |
          | o2de    | QANOV-377130 |

  @jira.<jira_id> @<product> @android @ios @manual @no.automatable @regression
  Scenario Outline: A user who has the app opened in several devices with unseen notifications will see the numeric badge in the app icon removed in all the devices after accesing to the notification Inbox in a device
    Important: currently when the notifications are read in Android devices it will remove the badge from all the IOS devices but only in the Android where the action is done
    Given user has unseen notifications
      And user launches the home screen
      And the badge in the "<product>_app" shows the number of unseen notifications in all devices
     When goes back to the app in "device1"
      And user is in the "[CONF:landing_tab]" page
      And clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And launches the home screen in all devices
     Then the "numeric" badge is not displayed in the "<product>_app" icon in all devices

    @jira.cv.14.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-377132 |
          | o2uk    | QANOV-377133 |
          | moves   | QANOV-377134 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-377137 |
          | blaude  | QANOV-377135 |
          | o2de    | QANOV-377136 |

  @jira.QANOV-377138 @<priority> @android @automation.hard @ios @jira.cv.14.5 @manual @regression @vivobr
  Scenario: A user with several added lines will see a numeric badge in the app icon when the user who receives a notification is the same then the one in the the selected line
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    Some launchers might show more than 3 digits but the inbox icon will show up to 9, and from then it'll show +9
    Given user is logged in the application with "several" lines
      And user has "os" notifications with "enabled" status
      And the "user1" line is selected in the user selector
      And "user1" has no unseen notifications
     When "user1" receives a notification
      And launches the home screen
     Then a "numeric" badge is displayed in the "vivobr_app" icon
      And the badge in the "vivobr_app" has "1" unseen notifications

  @jira.QANOV-377139 @<priority> @android @automation.hard @ios @jira.cv.14.5 @manual @regression @vivobr
  Scenario: A user with several added lines won't see a numeric badge in the app icon when the user who receives a notification is different from the one in the the selected line
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    Some launchers might show more than 3 digits but the inbox icon will show up to 9, and from then it'll show +9
    Given user is logged in the application with "several" lines
      And user has "os" notifications with "enabled" status
      And the "user1" line is selected in the user selector
      And "user1" has no unseen notifications
     When "user2" receives a notification
      And launches the home screen
     Then the "numeric" badge is not displayed in the "vivobr_app" icon

  @jira.<jira_id> @<product> @automation.hard @ios @manual @regression
  Scenario Outline: A user with an older app version who has a numeric badge in the app icon will continue seeing it after accessing the Inbox in iOS devices
    The mechanism to reset the app icon badge won't work until users update to 14.5
    this scenario can be deprecated when all BER
    Given the app version is "lower" than "14.5"
      And user has unseen notifications
      And user launches the home screen
      And the badge in the "<product>_app" shows the number of unseen notifications
     When goes back to the app
      And user is in the "[CONF:landing_tab]" page
      And clicks on the "navigation_top_bar.notifications_icon" icon
      And the "Notification Inbox" page is displayed
      And launches the home screen
     Then the badge in the "<product>_app" shows the number of unseen notifications

    @jira.cv.14.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-377140 |
          | o2uk    | QANOV-377141 |
          | moves   | QANOV-377142 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-377145 |
          | blaude  | QANOV-377143 |
          | o2de    | QANOV-377144 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @manual @regression
  Scenario Outline: A user who has a numeric badge in the app icon won't see it after logging out
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    Some launchers might show more than 3 digits but the inbox icon will show up to 9, and from then it'll show +9
    Given user has unseen notifications
      And user launches the home screen
      And the badge in the "<product>_app" shows the number of unseen notifications
     When goes back to the app
      And user is in the "[CONF:landing_tab]" page
      And logs out from the application
      And user launches the home screen
     Then the "numeric" badge is not displayed in the "<product>_app" icon

    @jira.cv.14.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-377146 |
          | o2uk    | QANOV-377147 |
          | moves   | QANOV-377148 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-377151 |
          | blaude  | QANOV-377149 |
          | o2es    | QANOV-377150 |

  @jira.<jira_id> @<product> @automation.hard @ios @manual @regression
  Scenario Outline: A user who had a numeric badge in the app icon and loggged out, will see the badge after logging in again in iOS devices
      Android devices usually shows the badge in the app's icon upper right corner
    Ios devices usually shows the badge in the app's icon top left-hand corner
    Some launchers might show more than 3 digits but the inbox icon will show up to 9, and from then it'll show +9
    Given user has unseen notifications
      And user launches the home screen
      And the badge in the "<product>_app" shows the number of unseen notifications
     When goes back to the app
      And user is in the "[CONF:landing_tab]" page
      And logs out from the application
      And user launches the home screen
      And the "numeric" badge is not displayed in the "<product>_app" icon
      And logs in the application
      And user launches the home screen
     Then the badge in the "<product>_app" shows the number of unseen notifications

    @jira.cv.14.5
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-377152 |
          | o2uk    | QANOV-377153 |
          | moves   | QANOV-377154 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-377157 |
          | blaude  | QANOV-377155 |
          | o2es    | QANOV-377156 |
