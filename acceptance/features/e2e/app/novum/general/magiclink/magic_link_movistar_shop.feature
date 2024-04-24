# -*- coding: utf-8 -*-
@jira.QANOV-34060 @not_hardening
Feature: Magic link movistar shop

  Actions Before each Scenario:
    Given user has a "admin" role
      And user has a Movistar+ Deco 4K
      And user has a router HGU


  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @<test_priority> @mobile
  Scenario Outline: A user receives a push notification when does a Seleccion Plus Futbol purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When purchases "plus_football_selection" in movistar shop living app
     Then the "plus_football_selection" notification is received
      And the "notification_title" textfield with "Cámbiate a Fusión Selección Plus Futbol a un clic" text is displayed
      And the "notification_body" textfield with "Disfruta de todo el futbol y, además, del mejor deporte en Movistar" text is displayed

    Examples:
          | account_type | status     | jira_id     | test_priority |
          | telco        | background | QANOV-34061 | smoke         |
          | telco        | killed     | QANOV-34062 | regression    |
          | legado       | background | QANOV-34063 | regression    |
          | legado       | killed     | QANOV-34064 | smoke         |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @<test_priority> @mobile
  Scenario Outline: A user can open the push notification when does a Seleccion Plus Futbol purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
      And has received a "plus_football_selection" notification
     When clicks on the notification
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "plus_football_selection_summary" textfield with "Fusión Selección Plus Fútbol Fibra 600Mb" text is displayed
      And the "plus_football_selection_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | status     | depends_on  | jira_id     | test_priority |
          | telco        | background | QANOV-34061 | QANOV-34065 | regression    |
          | telco        | killed     | QANOV-34062 | QANOV-34066 | smoke         |
          | legado       | background | QANOV-34063 | QANOV-34067 | smoke         |
          | legado       | killed     | QANOV-34064 | QANOV-34068 | regression    |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who receives a Seleccion Plus Futbol notification with app closed and doesn't tap on it will see the Inbox updated
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When user receives a "plus_football_selection" notification
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "profile_inbox_list" list is displayed
      And the "profile_inbox_notification[0]" textfield with "plus_football_selection" notification is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34061 | QANOV-34069 |
          | telco        | killed     | QANOV-34062 | QANOV-34070 |
          | legado       | background | QANOV-34063 | QANOV-34071 |
          | legado       | killed     | QANOV-34064 | QANOV-34072 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who is in Notification Inbox and receives a Seleccion Plus Futbol notification will see the list of notifications updated with the unseen notification
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
     When user receives a "plus_football_selection" notification
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0].title" textfield with "Cámbiate a Fusión Selección Plus Futbol a un clic" text is displayed
      And the "profile_inbox_notification[0].subtitle" textfield with "Disfruta de todo el futbol y, además, del mejor deporte en Movistar" text is displayed
      And a "numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | depends_on              | jira_id     |
          | telco        | QANOV-34061:QANOV-34062 | QANOV-34073 |
          | legado       | QANOV-34063:QANOV-34064 | QANOV-34074 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @regression @mobile
  Scenario Outline: A user can access to the Seleccion Plus Futbol page
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
      And user has received a "plus_football_selection" notification
     When clicks on "plus_football_selection" element in the "profile_inbox_list" list
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "plus_football_selection_summary" textfield with "Fusión Selección Plus Fútbol Fibra 600Mb" text is displayed
      And the "plus_football_selection_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | jira_id     |
          | telco        | QANOV-34075 |
          | legado       | QANOV-34076 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @regression @mobile
  Scenario Outline: A user receives a push notification when does a Fusion total plus X4 purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When purchases "fusion_total_plus_4" in movistar shop living app
     Then the "fusion_total_plus_4" notification is received
      And the "notification_title" textfield with "Cámbiate a Fusión Total Plus X4 a un clic" text is displayed
      And the "notification_body" textfield with "Todo el fútbol, cine, series, deportes y además NETFLIX premium en Movistar" text is displayed

    Examples:
          | account_type | status     | jira_id     |
          | telco        | background | QANOV-34077 |
          | telco        | killed     | QANOV-34078 |
          | legado       | background | QANOV-34079 |
          | legado       | killed     | QANOV-34080 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user can open the push notification when does a Fusion total plus X4 purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
      And has received a "fusion_total_plus_4" notification
     When clicks on the notification
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "fusion_total_plus_4_summary" textfield with "Fusión Total Plus Fibra 600Mb X4" text is displayed
      And the "fusion_total_plus_4_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34077 | QANOV-34081 |
          | telco        | killed     | QANOV-34078 | QANOV-34082 |
          | legado       | background | QANOV-34081 | QANOV-34083 |
          | legado       | killed     | QANOV-34082 | QANOV-34084 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who receives a Fusion total plus X4 notification with app closed and doesn't tap on it will see the Inbox updated
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When user receives a "fusion_total_plus_4" notification
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "profile_inbox_list" list is displayed
      And the "profile_inbox_notification[0]" textfield with "fusion_total_plus_4" notification is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34077 | QANOV-34085 |
          | telco        | killed     | QANOV-34078 | QANOV-34086 |
          | legado       | background | QANOV-34081 | QANOV-34087 |
          | legado       | killed     | QANOV-34082 | QANOV-34088 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @<test_priority> @mobile
  Scenario Outline: A user who is in Notification Inbox and receives a Fusion total plus X4 notification will see the list of notifications updated with the unseen notification
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
     When user receives a "fusion_total_plus_4" notification
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0].title" textfield with "Cámbiate a Fusión Total Plus X4 a un clic" text is displayed
      And the "profile_inbox_notification[0].subtitle" textfield with "Todo el fútbol, cine, series, deportes y además NETFLIX premium en Movistar" text is displayed
      And a "numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | depends_on              | jira_id     | test_priority |
          | telco        | QANOV-34077:QANOV-34078 | QANOV-34089 | smoke         |
          | legado       | QANOV-34079:QANOV-34080 | QANOV-34090 | regression    |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @<test_priority> @mobile
  Scenario Outline: A user can access to the Fusion total plus X4 page from the Notification Inbox
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
      And user has received a "fusion_total_plus_4" notification
     When clicks on "fusion_total_plus_4" element in the "profile_inbox_list" list
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "fusion_total_plus_4_summary" textfield with "Fusión Total Plus Fibra 600Mb X4" text is displayed
      And the "fusion_total_plus_4_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | jira_id     | test_priority |
          | telco        | QANOV-34091 | regression    |
          | legado       | QANOV-34092 | smoke         |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @<test_priority> @mobile
  Scenario Outline: A user receives a push notification when does a Fusión Selección Plus Ficción purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When purchases "plus_fiction_selection" in movistar shop living app
     Then the "plus_fiction_selection" notification is received
      And the "notification_title" textfield with "Cámbiate a Fusión Selección Plus Ficción a un clic" text is displayed
      And the "notification_body" textfield with "Series, Disney+ y cine, la mejor ficción con GB ilimitados" text is displayed

    Examples:
          | account_type | status     | jira_id     | test_priority |
          | telco        | background | QANOV-34093 | smoke         |
          | telco        | killed     | QANOV-34094 | regression    |
          | legado       | background | QANOV-34095 | regression    |
          | legado       | killed     | QANOV-34096 | smoke         |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @<test_priority> @mobile
  Scenario Outline: A user can open the push notification when does a Fusión Selección Plus Ficción purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
      And has received a "plus_fiction_selection" notification
     When clicks on the notification
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "plus_ficcion_selection_summary" textfield with "Fusión Selección Plus con Ficción Fibra 600Mb X2" text is displayed
      And the "plus_ficcion_selection_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | status     | depends_on  | jira_id     | test_priority |
          | telco        | background | QANOV-34093 | QANOV-34097 | regression    |
          | telco        | killed     | QANOV-34094 | QANOV-34098 | smoke         |
          | legado       | background | QANOV-34095 | QANOV-34099 | smoke         |
          | legado       | killed     | QANOV-34096 | QANOV-34100 | regression    |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who receives a Fusión Selección Plus Ficción notification with app closed and doesn't tap on it will see the Inbox updated
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When user receives a "plus_fiction_selection" notification
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "profile_inbox_list" list is displayed
      And the "profile_inbox_notification[0]" textfield with "plus_fiction_selection" notification is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34093 | QANOV-34101 |
          | telco        | killed     | QANOV-34094 | QANOV-34102 |
          | legado       | background | QANOV-34095 | QANOV-34103 |
          | legado       | killed     | QANOV-34096 | QANOV-34104 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who is in Notification Inbox and receives a Fusión Selección Plus Ficción notification will see the list of notifications updated with the unseen notification
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
     When user receives a "plus_fiction_selection" notification
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0].title" textfield with "Cámbiate a Fusión Selección Plus Ficción a un clic" text is displayed
      And the "profile_inbox_notification[0].subtitle" textfield with "Series, Disney+ y cine, la mejor ficción con GB ilimitados" text is displayed
      And a "numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | depends_on              | jira_id     |
          | telco        | QANOV-34093:QANOV-34094 | QANOV-34105 |
          | legado       | QANOV-34095:QANOV-34096 | QANOV-34106 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @regression @mobile
  Scenario Outline: A user can access to the Fusión Selección Plus Ficción page from the Notification Inbox
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
      And user has received a "plus_fiction_selection" notification
     When clicks on "plus_fiction_selection" element in the "profile_inbox_list" list
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "plus_ficcion_selection_summary" textfield with "Fusión Selección Plus con Ficción Fibra 600Mb X2" text is displayed
      And the "plus_ficcion_selection_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | jira_id     |
          | telco        | QANOV-34107 |
          | legado       | QANOV-34108 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @regression @mobile
  Scenario Outline: A user receives a push notification when does a Fusión Total Plus purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When purchases "fusion_total_plus" in movistar shop living app
     Then the "fusion_total_plus" notification is received
      And the "notification_title" textfield with "Cámbiate a Fusión Total Plus a un clic" text is displayed
      And the "notification_body" textfield with "Todo el fútbol, cine, series y deportes en Movistar" text is displayed

    Examples:
          | account_type | status     | jira_id     |
          | telco        | background | QANOV-34109 |
          | telco        | killed     | QANOV-34110 |
          | legado       | background | QANOV-34111 |
          | legado       | killed     | QANOV-34112 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user can open the push notification when does a Fusión Total Plus purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
      And has received a "fusion_total_plus" notification
     When clicks on the notification
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "fusion_total_plus_summary" textfield with "Fusión Total Plus Fibra 600Mb" text is displayed
      And the "fusion_total_plus_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34109 | QANOV-34113 |
          | telco        | killed     | QANOV-34110 | QANOV-34114 |
          | legado       | background | QANOV-34111 | QANOV-34115 |
          | legado       | killed     | QANOV-34112 | QANOV-34116 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who receives a Fusión Total Plus notification with app closed and doesn't tap on it will see the Inbox updated
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When user receives a "fusion_total_plus" notification
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "profile_inbox_list" list is displayed
      And the "profile_inbox_notification[0]" textfield with "fusion_total_plus" notification is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34109 | QANOV-34117 |
          | telco        | killed     | QANOV-34110 | QANOV-34118 |
          | legado       | background | QANOV-34111 | QANOV-34119 |
          | legado       | killed     | QANOV-34112 | QANOV-34120 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who is in Notification Inbox and receives a Fusión Total Plus notification will see the list of notifications updated with the unseen notification
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
     When user receives a "fusion_total_plus" notification
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0].title" textfield with "Cámbiate a Fusión Total Plus a un clic" text is displayed
      And the "profile_inbox_notification[0].subtitle" textfield with "Todo el fútbol, cine, series y deportes en Movistar" text is displayed
      And a "numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | depends_on              | jira_id     |
          | telco        | QANOV-34109:QANOV-34110 | QANOV-34121 |
          | legado       | QANOV-34111:QANOV-34112 | QANOV-34122 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @regression @mobile
  Scenario Outline: A user can access to the Fusión Total Plus page from the Notification Inbox
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
      And user has received a "fusion_total_plus" notification
     When clicks on "fusion_total_plus" element in the "profile_inbox_list" list
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "fusion_total_plus_summary" textfield with "Fusión Selección Plus con Ficción Fibra 600Mb X2" text is displayed
      And the "fusion_total_plus_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | jira_id     |
          | telco        | QANOV-34123 |
          | legado       | QANOV-34124 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @<test_priority> @mobile
  Scenario Outline: A user receives a push notification when does a Conexión segura purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When purchases "secure_connection" in movistar shop living app
     Then the "secure_connection" notification is received
      And the "notification_title" textfield with "Continua desde la app" text is displayed
      And the "notification_body" textfield with "Completa tu compra de Conexión Segura Convergente desde la app" text is displayed
      And the "notification_image_secure_connection" image is displayed

    Examples:
          | account_type | status     | jira_id     | test_priority |
          | telco        | background | QANOV-34125 | smoke         |
          | telco        | killed     | QANOV-34126 | regression    |
          | legado       | background | QANOV-34127 | regression    |
          | legado       | killed     | QANOV-34128 | smoke         |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @<test_priority> @mobile
  Scenario Outline: A user can open the push notification when does a Conexión segura purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
      And has received a "secure_connection" notification
     When clicks on the notification
     Then the internal webview is displayed
      And the "Conexión Segura" header is displayed

    Examples:
          | account_type | status     | depends_on  | jira_id     | test_priority |
          | telco        | background | QANOV-34125 | QANOV-34129 | regression    |
          | telco        | killed     | QANOV-34126 | QANOV-34130 | smoke         |
          | legado       | background | QANOV-34127 | QANOV-34131 | smoke         |
          | legado       | killed     | QANOV-34128 | QANOV-34132 | regression    |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who receives a Conexión segura notification with app closed and doesn't tap on it will see the Inbox updated
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When user receives a "secure_connection" notification
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "profile_inbox_list" list is displayed
      And the "profile_inbox_notification[0]" textfield with "secure_connection" notification is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34125 | QANOV-34133 |
          | telco        | killed     | QANOV-34126 | QANOV-34134 |
          | legado       | background | QANOV-34127 | QANOV-34135 |
          | legado       | killed     | QANOV-34128 | QANOV-34136 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who is in Notification Inbox and receives a Conexión segura notification will see the list of notifications updated with the unseen notification
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
     When user receives a "secure_connection" notification
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0].title" textfield with "Continua desde la app" text is displayed
      And the "profile_inbox_notification[0].subtitle" textfield with "Completa tu compra de Conexión Segura Convergente desde la app" text is displayed
      And the "profile_inbox_notification[0].image" image is displayed
      And a "numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | depends_on              | jira_id     |
          | telco        | QANOV-34125:QANOV-34126 | QANOV-34137 |
          | legado       | QANOV-34127:QANOV-34128 | QANOV-34138 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @regression @mobile
  Scenario Outline: A user can access to the Conexión segura page from the Notification Inbox
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
      And user has received a "secure_connection" notification
     When clicks on "secure_connection" element in the "profile_inbox_list" list
     Then the internal webview is displayed
      And the "Conexión Segura" header is displayed

    Examples:
          | account_type | jira_id     |
          | telco        | QANOV-34139 |
          | legado       | QANOV-34140 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @regression @mobile
  Scenario Outline: A user receives a push notification when does a Movistar Car purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When purchases "movistar_car" in movistar shop living app
     Then the "movistar_car" notification is received
      And the "notification_title" textfield with "Continua desde la app" text is displayed
      And the "notification_body" textfield with "Completa tu compra de Movistar Car desde la app" text is displayed
      And the "notification_image_movistar_car" image is displayed

    Examples:
          | account_type | status     | jira_id     |
          | telco        | background | QANOV-34141 |
          | telco        | killed     | QANOV-34142 |
          | legado       | background | QANOV-34143 |
          | legado       | killed     | QANOV-34144 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user can open the push notification when does a Movistar Car purchase in movistar shop living app
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
      And has received a "movistar_car" notification
     When clicks on the notification
     Then the browser webview is displayed
      And the "Particulares" header is displayed
      And the "movistar_car_summary" textfield with "Movistar Car" text is displayed
      And the "movistar_car_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34141 | QANOV-34145 |
          | telco        | killed     | QANOV-34142 | QANOV-34146 |
          | legado       | background | QANOV-34143 | QANOV-34147 |
          | legado       | killed     | QANOV-34144 | QANOV-34148 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @regression @mobile
  Scenario Outline: A user who receives a Movistar Car notification with app closed and doesn't tap on it will see the Inbox updated
    Given user has a "<account_type>" account type
      And user is logged in
      And user has the app in "<status>" status
     When user receives a "movistar_car" notification
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.bell_inbox" icon
     Then the "Notification Inbox" page is displayed
      And the "profile_inbox_list" list is displayed
      And the "profile_inbox_notification[0]" textfield with "movistar_car" notification is displayed
      And a "non_numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | status     | depends_on  | jira_id     |
          | telco        | background | QANOV-34141 | QANOV-34149 |
          | telco        | killed     | QANOV-34142 | QANOV-34150 |
          | legado       | background | QANOV-34143 | QANOV-34151 |
          | legado       | killed     | QANOV-34144 | QANOV-34152 |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14
  @jira.link.depends_on.<depends_on> @moves @<test_priority> @mobile
  Scenario Outline: A user who is in Notification Inbox and receives a Movistar Car notification will see the list of notifications updated with the unseen notification
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
     When user receives a "movistar_car" notification
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "profile_inbox_notification[0].title" textfield with "Continua desde la app" text is displayed
      And the "profile_inbox_notification[0].subtitle" textfield with "Completa tu compra de Movistar Car desde la app" text is displayed
      And the "profile_inbox_notification[0].image" image is displayed
      And a "numeric" red badge is displayed in the "profile_inbox_notification[0]" item

    Examples:
          | account_type | depends_on              | jira_id     | test_priority |
          | telco        | QANOV-34141:QANOV-34142 | QANOV-34153 | smoke         |
          | legado       | QANOV-34143:QANOV-34144 | QANOV-34154 | regression    |

  @jira.<jira_id> @no_automatable @android @ios @jira.cv.11.14 @moves
  @<test_priority> @mobile
  Scenario Outline: A user can access to the Movistar Car page from the Notification Inbox
    Given user has a "<account_type>" account type
      And user is logged in
      And user is in the "Notification Inbox" page
      And user has received a "movistar_car" notification
     When clicks on "movistar_car" element in the "profile_inbox_list" list
     Then the browser webview is displayed
      And the "Compra segura - Movistar" header is displayed
      And the "fusion_total_plus_summary" textfield with "Fusión Selección Plus con Ficción Fibra 600Mb X2" text is displayed
      And the "fusion_total_plus_ammount" textfield with the "X,XX€/mes" format is displayed

    Examples:
          | account_type | jira_id     | test_priority |
          | telco        | QANOV-34155 | regression    |
          | legado       | QANOV-34156 | smoke         |
