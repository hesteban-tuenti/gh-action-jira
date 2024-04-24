# -*- coding: utf-8 -*-
@jira.QANOV-217256
Feature: App notifications


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A user can access to the "App Notifications" screen
    Given user has the "Notifications" module configured in CMS for "Notifications" page
      And user has the "Notifications Management" module configured in CMS for "Notifications Management" page
      And user is in the "App Configuration" page
     When clicks on the "notifications_management_entrypoint" entrypoint
     Then the "Notifications Management" page is displayed
      And the "Benachrichtigungen" header is displayed
      And the "service_notification_title" textfield with "Dienstkommunikation" text is displayed
      And the "service_notification_switch" switch is displayed
      And the "service_notification_description" textfield is displayed
      And the "commercial_notification_title" textfield with "Werbenachrichten" text is displayed
      And the "commercial_notification_switch" switch is displayed
      And the "commercial_notification_description" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "App Configuration" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed
      And the "Profil" header is displayed

    @cert3 @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-296679 | QANOV-217262 |

    @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      |
          | o2de    | Future | QANOV-296681 | QANOV-217263 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  @jira.link.detects.<detects> @har
  Scenario Outline: User can enable the service notifications successfully
    Given user has "service" notifications "disabled" in the application
      And user has the "Notifications Management" module configured in CMS for "Notifications Management" page
      And user is in the "Notifications Management" page
     When clicks on the "service_notification_switch" switch
     Then the "service_notification_switch" switch is enabled
      And the "service_notification_description" textfield with "Option deaktivieren, um keine Dienstkommunikation zu erhalten" text is displayed

    @cert3 @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      | detects  |
          | blaude  | Future | QANOV-217262 | QANOV-217264 | LOC-1092 |

    @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      | detects           |
          | o2de    | Future | QANOV-217263 | QANOV-217265 | LOC-1092:IOS-9641 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke @har
  Scenario Outline: User can disable the service notifications successfully
    Given user has "service" notifications "enabled" in the application
      And user has the "Notifications Management" module configured in CMS for "Notifications Management" page
      And user is in the "Notifications Management" page
     When clicks on the "service_notification_switch" switch
     Then the "service_notification_switch" switch is disabled
      And the "service_notification_description" textfield with "Option aktivieren, um ab jetzt Dienstkommunikation in der App zu erhalten" text is displayed

    @cert3 @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-217262 | QANOV-217266 |

    @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      |
          | o2de    | Future | QANOV-217263 | QANOV-217267 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke @har
  Scenario Outline: User can enable the commercial notifications successfully
    Given user has "commercial" notifications "disabled" in the application
      And user has the "Notifications Management" module configured in CMS for "Notifications Management" page
      And user is in the "Notifications Management" page
     When clicks on the "commercial_notification_switch" switch
     Then the "commercial_notification_switch" switch is enabled
      And the "commercial_notification_description" textfield with "Option deaktivieren, um keine Werbenachrichten von <brand_name> in der App zu erhalten" text is displayed

    @cert3 @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      | brand_name |
          | blaude  | Future | QANOV-217262 | QANOV-217268 | Blau       |

    @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      | brand_name |
          | o2de    | Future | QANOV-217263 | QANOV-217269 | O2         |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke @har
  Scenario Outline: User can disable the commercial notifications successfully
    Given user has "commercial" notifications "enabled" in the application
      And user has the "Notifications Management" module configured in CMS for "Notifications Management" page
      And user is in the "Notifications Management" page
     When clicks on the "commercial_notification_switch" switch
     Then the "commercial_notification_switch" switch is disabled
      And the "commercial_notification_description" textfield with "Option aktivieren, um Werbenachrichten von <brand_name> in der App zu erhalten" text is displayed

    @cert3 @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      | brand_name |
          | blaude  | Future | QANOV-217262 | QANOV-217270 | Blau       |

    @live @next
    Examples:
          | product | cv     | depends_on   | jira_id      | brand_name |
          | o2de    | Future | QANOV-217263 | QANOV-217271 | O2         |
