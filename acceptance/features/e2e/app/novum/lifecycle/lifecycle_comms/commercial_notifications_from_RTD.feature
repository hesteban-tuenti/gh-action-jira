# -*- coding: utf-8 -*-
@jira.QANOV-56697
Feature: Commercial notifications from RTD


  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.0 @manual @mobile @regression @vivobr
  Scenario Outline: A user with the app in <status> status who receives a commercial notification from RTD will see the push notification
    internal_checkpoint="As we cannot test with a real RTD event. It is possible to send a POST request to the user-notification API
    POST to Cert0 -- https://notif-4p-cert0-br.mytelco.io/notifications/v3/user-notification
    to LIVE  -- https://notif-4p-br.mytelco.io/notifications/v3/user-notification
    body
    {
    \"id\": \"2342342342231231232342\",
    \"owner_id\": \"novum-test-ob-events\",
    \"subscription_id\": \"9e38c5fa-1342-47e5-9d95-877c6147c561\",
    \"event\": {
    \"id\": \"ec0d42b9-f2de-431c-9ec0-843b7f994fad\",
    \"owner_id\": \"vivo-rtd\",
    \"correlator\": \"293cecb8-feef-4d23-a643-4ec2113fa2d5\",
    \"event_type\": \"user-notification\",
    \"user_id\": \"624a0559-1684-33c0-b04a-ab1cf717500a\",
    \"creation_date\": \"2020-11-09T10:22:59.39Z\",
    \"payload\": {
    \"notification_id\": \"cb157993-c201-46b5-9ab9-3112bfde75d0\",
    \"notification_type\": \"oferta_fibra_postpago\",
    \"title\": \"Notification Test QA title\",
    \"message\": \"Notification Test QA message\",
    \"action_url\": \"https://google.com/?utm=tracking\",
    \"media_url\": \"https://cdn-pre-vivobr-brazilsouth01.mytelco.io/fs/vivo-br-cert0/2RqpE4tmhiXwAAAACAAAAFtFf2IoG\",
    \"notification_group\": \"oferta_fibra\"
    },
    \"operation_id\": \"cb312bfa-721c-4b27-881c-369570e42f84\"
    },
    \"creation_date\": \"2020-11-09T15:19:36.381Z\"
    }
    Can be used a curl like: curl -H "Content-Type: application/json" --data {THE BODY} THE_API
    Modify the user_id field to the 4P user ID (format like: 624a0559-1684-33c0-b04a-ab1cf717500a)
    To get the 4p user ID:
    API = Login4pService.1
    method = get4pUserID
    param = USERID de Novum
    "
    Given user has a "any" account type
      And user has the app in "<status>" status
     When a notification from RTD with "Notification Test QA title" title and "Notification Test QA message" body and url "https://google.com/?utm=tracking" is sent
     Then the notification via "push" is received
      And the notification is displayed in the notification center
      And the "notification_title" textfield with "Notification Test QA title" text is displayed
      And the "notification_body" textfield with "Notification Test QA message" text is displayed

    Examples:
          | status     | jira_id     |
          | background | QANOV-56698 |
          | killed     | QANOV-56699 |

  @jira.<jira_id> @<priority> @android @automation.hard @ios @jira.cv.12.0 @manual @mobile @vivobr @har
  Scenario Outline: A user with the app in <status> status who receives a push notification from RTD can access to the url content
    internal_checkpoint="As we cannot test with a real RTD event. It is possible to send a POST request to the user-notification API
    POST to Cert0 -- https://notif-4p-cert0-br.mytelco.io/notifications/v3/user-notification
    to LIVE  -- https://notif-4p-br.mytelco.io/notifications/v3/user-notification
    body
    {
    \"id\": \"2342342342231231232342\",
    \"owner_id\": \"novum-test-ob-events\",
    \"subscription_id\": \"9e38c5fa-1342-47e5-9d95-877c6147c561\",
    \"event\": {
    \"id\": \"ec0d42b9-f2de-431c-9ec0-843b7f994fad\",
    \"owner_id\": \"vivo-rtd\",
    \"correlator\": \"293cecb8-feef-4d23-a643-4ec2113fa2d5\",
    \"event_type\": \"user-notification\",
    \"user_id\": \"624a0559-1684-33c0-b04a-ab1cf717500a\",
    \"creation_date\": \"2020-11-09T10:22:59.39Z\",
    \"payload\": {
    \"notification_id\": \"cb157993-c201-46b5-9ab9-3112bfde75d0\",
    \"notification_type\": \"oferta_fibra_postpago\",
    \"title\": \"Notification Test QA title\",
    \"message\": \"Notification Test QA message\",
    \"action_url\": \"https://google.com/?utm=tracking\",
    \"media_url\": \"https://cdn-pre-vivobr-brazilsouth01.mytelco.io/fs/vivo-br-cert0/2RqpE4tmhiXwAAAACAAAAFtFf2IoG\",
    \"notification_group\": \"oferta_fibra\"
    },
    \"operation_id\": \"cb312bfa-721c-4b27-881c-369570e42f84\"
    },
    \"creation_date\": \"2020-11-09T15:19:36.381Z\"
    }
    Can be used a curl like: curl -H "Content-Type: application/json" --data {THE BODY} THE_API
    Modify the user_id field to the 4P user ID (format like: 624a0559-1684-33c0-b04a-ab1cf717500a)
    "
    Given user has a "any" account type
      And user has the app in "<status>" status
     When a notification from RTD with "Notification Test QA title" title and "Notification Test QA message" body and url "https://google.com/?utm=tracking" is sent
      And the notification via "push" is received
      And clicks on the notification
     Then the external webview with "https://google.com/?utm=tracking" url is displayed

    Examples:
          | status     | priority   | jira_id     |
          | background | regression | QANOV-56700 |
          | killed     | sanity     | QANOV-56701 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.0 @manual @mobile @old_app @regression @vivobr
  Scenario Outline: A user with the app in <status> status who receives a push notification from RTD can see the injected message in the Notification Inbox after launching the app
    internal_checkpoint="As we cannot test with a real RTD event. It is possible to send a POST request to the user-notification API
    POST to Cert0 -- https://notif-4p-cert0-br.mytelco.io/notifications/v3/user-notification
    to LIVE  -- https://notif-4p-br.mytelco.io/notifications/v3/user-notification
    body
    {
    \"id\": \"2342342342231231232342\",
    \"owner_id\": \"novum-test-ob-events\",
    \"subscription_id\": \"9e38c5fa-1342-47e5-9d95-877c6147c561\",
    \"event\": {
    \"id\": \"ec0d42b9-f2de-431c-9ec0-843b7f994fad\",
    \"owner_id\": \"vivo-rtd\",
    \"correlator\": \"293cecb8-feef-4d23-a643-4ec2113fa2d5\",
    \"event_type\": \"user-notification\",
    \"user_id\": \"624a0559-1684-33c0-b04a-ab1cf717500a\",
    \"creation_date\": \"2020-11-09T10:22:59.39Z\",
    \"payload\": {
    \"notification_id\": \"cb157993-c201-46b5-9ab9-3112bfde75d0\",
    \"notification_type\": \"oferta_fibra_postpago\",
    \"title\": \"Notification Test QA title\",
    \"message\": \"Notification Test QA message\",
    \"action_url\": \"https://google.com/?utm=tracking\",
    \"media_url\": \"https://cdn-pre-vivobr-brazilsouth01.mytelco.io/fs/vivo-br-cert0/2RqpE4tmhiXwAAAACAAAAFtFf2IoG\",
    \"notification_group\": \"oferta_fibra\"
    },
    \"operation_id\": \"cb312bfa-721c-4b27-881c-369570e42f84\"
    },
    \"creation_date\": \"2020-11-09T15:19:36.381Z\"
    }
    Can be used a curl like: curl -H "Content-Type: application/json" --data {THE BODY} THE_API
    Modify the user_id field to the 4P user ID (format like: 624a0559-1684-33c0-b04a-ab1cf717500a)
    "
    Given user has a "any" account type
      And user has the app in "<status>" status
     When a notification from RTD with "Notification Test QA title" title and "Notification Test QA message" body and url "https://google.com/?utm=tracking" is sent
      And the notification via "push" is received
      And launches the app
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "navigation_top_bar.notifications_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And an element in the "inbox_list" list has the "title" textfield that contains the "Notification Test QA title" text
      And the "text" textfield with "Notification Test QA message" text is displayed

    Examples:
          | status     | jira_id     |
          | background | QANOV-56702 |
          | killed     | QANOV-56703 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.12.0 @manual @mobile @regression @har @vivobr
  Scenario Outline: A user with the app in <status> status who receives a push notification from RTD can see the injected message in the Notification Inbox after launching the app
    internal_checkpoint="As we cannot test with a real RTD event. It is possible to send a POST request to the user-notification API
    POST to Cert0 -- https://notif-4p-cert0-br.mytelco.io/notifications/v3/user-notification
    to LIVE  -- https://notif-4p-br.mytelco.io/notifications/v3/user-notification
    body
    {
    \"id\": \"2342342342231231232342\",
    \"owner_id\": \"novum-test-ob-events\",
    \"subscription_id\": \"9e38c5fa-1342-47e5-9d95-877c6147c561\",
    \"event\": {
    \"id\": \"ec0d42b9-f2de-431c-9ec0-843b7f994fad\",
    \"owner_id\": \"vivo-rtd\",
    \"correlator\": \"293cecb8-feef-4d23-a643-4ec2113fa2d5\",
    \"event_type\": \"user-notification\",
    \"user_id\": \"624a0559-1684-33c0-b04a-ab1cf717500a\",
    \"creation_date\": \"2020-11-09T10:22:59.39Z\",
    \"payload\": {
    \"notification_id\": \"cb157993-c201-46b5-9ab9-3112bfde75d0\",
    \"notification_type\": \"oferta_fibra_postpago\",
    \"title\": \"Notification Test QA title\",
    \"message\": \"Notification Test QA message\",
    \"action_url\": \"https://google.com/?utm=tracking\",
    \"media_url\": \"https://cdn-pre-vivobr-brazilsouth01.mytelco.io/fs/vivo-br-cert0/2RqpE4tmhiXwAAAACAAAAFtFf2IoG\",
    \"notification_group\": \"oferta_fibra\"
    },
    \"operation_id\": \"cb312bfa-721c-4b27-881c-369570e42f84\"
    },
    \"creation_date\": \"2020-11-09T15:19:36.381Z\"
    }
    Can be used a curl like: curl -H "Content-Type: application/json" --data {THE BODY} THE_API
    Modify the user_id field to the 4P user ID (format like: 624a0559-1684-33c0-b04a-ab1cf717500a)
    "
    Given user has a "any" account type
      And user has the app in "<status>" status
     When a notification from RTD with "Notification Test QA title" title and "Notification Test QA message" body and url "https://google.com/?utm=tracking" is sent
      And the notification via "push" is received
      And launches the app
      And clicks on the "navigation_top_bar.notifications_icon" icon
     Then the "Notification Inbox" page is displayed
      And the "inbox_list" list is displayed
      And an element in the "inbox_list" list has the "title" textfield that contains the "Notification Test QA title" text
      And the "text" textfield with "Notification Test QA message" text is displayed

    Examples:
          | status     | jira_id      |
          | background | QANOV-599267 |
          | killed     | QANOV-599268 |

  @jira.QANOV-56704 @android @automation.hard @ios @jira.cv.12.0 @manual @mobile @smoke @vivobr
  Scenario: A user who is in Notification Inbox and receives a notification notification from RTD will see the notification in the inbox
    internal_checkpoint="As we cannot test with a real RTD event. It is possible to send a POST request to the user-notification API
    POST to Cert0 -- https://notif-4p-cert0-br.mytelco.io/notifications/v3/user-notification
    to LIVE  -- https://notif-4p-br.mytelco.io/notifications/v3/user-notification
    body
    {
    \"id\": \"2342342342231231232342\",
    \"owner_id\": \"novum-test-ob-events\",
    \"subscription_id\": \"9e38c5fa-1342-47e5-9d95-877c6147c561\",
    \"event\": {
    \"id\": \"ec0d42b9-f2de-431c-9ec0-843b7f994fad\",
    \"owner_id\": \"vivo-rtd\",
    \"correlator\": \"293cecb8-feef-4d23-a643-4ec2113fa2d5\",
    \"event_type\": \"user-notification\",
    \"user_id\": \"624a0559-1684-33c0-b04a-ab1cf717500a\",
    \"creation_date\": \"2020-11-09T10:22:59.39Z\",
    \"payload\": {
    \"notification_id\": \"cb157993-c201-46b5-9ab9-3112bfde75d0\",
    \"notification_type\": \"oferta_fibra_postpago\",
    \"title\": \"Notification Test QA title\",
    \"message\": \"Notification Test QA message\",
    \"action_url\": \"https://google.com/?utm=tracking\",
    \"media_url\": \"https://cdn-pre-vivobr-brazilsouth01.mytelco.io/fs/vivo-br-cert0/2RqpE4tmhiXwAAAACAAAAFtFf2IoG\",
    \"notification_group\": \"oferta_fibra\"
    },
    \"operation_id\": \"cb312bfa-721c-4b27-881c-369570e42f84\"
    },
    \"creation_date\": \"2020-11-09T15:19:36.381Z\"
    }
    Can be used a curl like: curl -H "Content-Type: application/json" --data {THE BODY} THE_API
    Modify the user_id field to the 4P user ID (format like: 624a0559-1684-33c0-b04a-ab1cf717500a)
    "
    Given user is in the "Notification Inbox" page
     When a notification from RTD with "Notification Test QA title" title and "Notification Test QA message" body and url "https://google.com/?utm=tracking" is sent
     Then the new notification is displayed on the "1" position of the "profile_inbox_list" list
      And the "1" index in the "profile_inbox_list" list has the "title" field with "Notification Test QA title" text
      And the "1" index in the "profile_inbox_list" list has the "message" field with "Notification Test QA message" text
