@jira.QANOV-28884 @not_hardening
Feature: In-App Pushes CMS

  Actions Before the Feature:
    Given user is logged in the CMS

  Actions After the Feature:
    Then removes the campaigns created
    And removes the comms created
    And logs out from the CMS


  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @smoke
  Scenario Outline: An editor can choose to create a new campaign with a push in-app
     When I go to "[CONF:cms.base][CONF:campaigns_cms.create]" web page
      And the "Campaign Creation" page is loaded
      And I fill in the "details.title" field with "Qsys campaign creation test"
      And I click on the "details.next_button" button
     Then the text of the element "message.push_in_app_textfield" is equal to "Push in-App"
      And the "message.push_in_app_switch" element is displayed
      And the "message.next_button" element is displayed

    Examples:
          | cv    | product | jira_id     |
          | 11.14 | o2uk    | QANOV-28885 |
          | 11.14 | moves   | QANOV-28886 |
          | 11.14 | vivobr  | QANOV-28887 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new campaign with an immediate push in-app no injected on the inbox
    internal_checkpoint="Immediate push: This applies only when the app is opened, and in case you receive a visible
    push notification, then the in-app will show, no matter the screen/process you are (main tab, purchase flow…).
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:campaigns_cms.create]" web page
      And the "Campaign Creation" page is loaded
      And I fill in the "details.title_inputtext" field with "Qsys campaign with immediate push in-app no-injected on the inbox"
      And I click on the "details.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "visible" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I fill in the "message.push_title_inputtext" field with "Qsys immediate push in-app"
      And I fill in the "message.push_body_inputtext" field with "Description for the immediate push in-app"
      And I upload a "image" in the "message.image_url_inputtext" field
      And I select the "immediate" option from "message.in_app_delivery_radiobutton" field
      And I select the "no" option from "message.send_to_notif_inbox_radiobutton" field
      And I click on the "message.next_button" button
      And I select the "define_audience" option from "user_list.audience_radiobutton" field
      And I click on the "user_list.token_type_button" button
      And I select the "MSISDN" option from "user_list.token_type_list" field
      And I click on the "user_list.select_file_button" button
      And I insert a file with a list of users
      And I click on the "user_list.upload_button" button
      And I click on the "user_list.next_button" button
      And I click on the "back_button" button
     Then the "Campaigns Repository" page is loaded
      And the "campaigns_list" list of elements is displayed
      And the value of "first" cell of table "campaigns_list" contains "Qsys campaign with immediate push in-app no-injected on the inbox"
      And the value of "last" cell of table "campaigns_list" contains "PENDING ACTIVATION"

    Examples:
          | cv    | product | jira_id     |
          | 11.14 | o2uk    | QANOV-28888 |
          | 11.14 | moves   | QANOV-28889 |
          | 11.14 | vivobr  | QANOV-28890 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new campaign with a deferred push in-app no injected on the inbox
    internal_checkpoint="Deferred push: This applies only when the app is opened, and in case you receive a visible
    push notification, and the case is the opposite from the immediate the in-app will not be opened straight
    away, and the in-app will be stored for the next time the user go to the home tab.
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:campaigns_cms.create]" web page
      And the "Campaign Creation" page is loaded
      And I fill in the "details.title_inputtext" field with "Qsys campaign with deferred push in-app no-injected on the inbox"
      And I click on the "details.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "visible" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I fill in the "message.push_title_inputtext" field with "Qsys deferred push in-app"
      And I fill in the "message.push_body_inputtext" field with "Description for the deferred push in-app"
      And I upload a "image" in the "message.image_url_inputtext" field
      And I select the "deferred" option from "message.in_app_delivery_radiobutton" field
      And I select the "no" option from "message.send_to_notif_inbox_radiobutton" field
      And I click on the "message.next_button" button
      And I select the "define_audience" option from "user_list.audience_radiobutton" field
      And I click on the "user_list.token_type_button" button
      And I select the "MSISDN" option from "user_list.token_type_list" field
      And I click on the "user_list.select_file_button" button
      And I insert a file with a list of users
      And I click on the "user_list.upload_button" button
      And I click on the "user_list.next_button" button
      And I click on the "back_button" button
     Then the "Campaigns Repository" page is loaded
      And the "campaigns_list" list of elements is displayed
      And the value of "first" cell of table "campaigns_list" contains "Qsys campaign with deferred push in-app no-injected on the inbox"
      And the value of "last" cell of table "campaigns_list" contains "PENDING ACTIVATION"

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28891 |
          | 11.14  | moves   | QANOV-28892 |
          | 11.14  | vivobr  | QANOV-28893 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new campaign with a silent push in-app
    internal_checkpoint="Silent push: These pushes are not visible for the users, is like sending an event to the
    app and they will trigger an in-app message in the next app time the user go to the home tab. The reason for having
    them is in case we want to have the current in-app but triggered by some conditions available in the GCT. These
    will always be deferred.
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:campaigns_cms.create]" web page
      And the "Campaign Creation" page is loaded
      And I fill in the "details.title_inputtext" field with "Qsys campaign with silent push in-app no-injected on the inbox"
      And I click on the "details.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "silent" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I click on the "message.next_button" button
      And I select the "define_audience" option from "user_list.audience_radiobutton" field
      And I click on the "user_list.token_type_button" button
      And I select the "MSISDN" option from "user_list.token_type_list" field
      And I click on the "user_list.select_file_button" button
      And I insert a file with a list of users
      And I click on the "user_list.upload_button" button
      And I click on the "user_list.next_button" button
      And I click on the "back_button" button
     Then the "Campaigns Repository" page is loaded
      And the "campaigns_list" list of elements is displayed
      And the value of "first" cell of table "campaigns_list" contains "Qsys campaign with silent push in-app no-injected on the inbox"
      And the value of "last" cell of table "campaigns_list" contains "PENDING ACTIVATION"

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28894 |
          | 11.14  | moves   | QANOV-28895 |
          | 11.14  | vivobr  | QANOV-28896 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new campaign with a visible push in-app injected on the inbox
    internal_checkpoint="Visible push: We refer to a push that will appear in the notification centre of the phone
    with title, body, etc (What comes to you when you think for a push notification). It can be of two types:
    immediate and deferred.
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:campaigns_cms.create]" web page
      And the "Campaign Creation" page is loaded
      And I fill in the "details.title_inputtext" field with "Qsys campaign with visible push in-app injected on the inbox"
      And I click on the "details.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "visible" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I fill in the "message.push_title_inputtext" field with "Qsys visible push in-app"
      And I fill in the "message.push_body_inputtext" field with "Description for the visible push in-app"
      And I upload a "image" in the "message.image_url_inputtext" field
      And I select the "immediate" option from "message.in_app_delivery_radiobutton" field
      And I select the "yes" option from "message.send_to_notif_inbox_radiobutton" field
      And I click on the "message.next_button" button
      And I select the "define_audience" option from "user_list.audience_radiobutton" field
      And I click on the "user_list.token_type_button" button
      And I select the "MSISDN" option from "user_list.token_type_list" field
      And I click on the "user_list.select_file_button" button
      And I insert a file with a list of users
      And I click on the "user_list.upload_button" button
      And I click on the "user_list.next_button" button
      And I click on the "back_button" button
     Then the "Campaigns Repository" page is loaded
      And the "campaigns_list" list of elements is displayed
      And the value of "first" cell of table "campaigns_list" contains "Qsys campaign with visible push in-app injected on the inbox"
      And the value of "last" cell of table "campaigns_list" contains "PENDING ACTIVATION"

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28897 |
          | 11.14  | moves   | QANOV-28898 |
          | 11.14  | vivobr  | QANOV-28899 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new campaign with a visible push in-app for non-logged users
    internal_checkpoint="Visible push: We refer to a push that will appear in the notification centre of the phone
    with title, body, etc (What comes to you when you think for a push notification). It can be of two types:
    immediate and deferred.
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:campaigns_cms.create]" web page
      And the "Campaign Creation" page is loaded
      And I fill in the "details.title_inputtext" field with "Qsys campaign with visible push in-app for non-logged users"
      And I click on the "details.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "visible" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I fill in the "message.push_title_inputtext" field with "Qsys visible push in-app"
      And I fill in the "message.push_body_inputtext" field with "Description for the visible push in-app"
      And I upload a "image" in the "message.image_url_inputtext" field
      And I select the "immediate" option from "message.in_app_delivery_radiobutton" field
      And I select the "yes" option from "message.send_to_notif_inbox_radiobutton" field
      And I click on the "message.next_button" button
      And I select the "non_logged_in_users" option from "user_list.audience_radiobutton" field
      And I click on the "user_list.min_app_version_button" button
      And I select the "any" option from "user_list.min_app_version_list" field
      And I click on the "user_list.max_app_version_button" button
      And I select the "any" option from "user_list.max_app_version_list" field
      And I click on the "user_list.logout_date_from_button" button
      And I select the "any" option from "user_list.logout_date_from_list" field
      And I click on the "user_list.logout_date_to_button" button
      And I select the "any" option from "user_list.logout_date_to_list" field
      And I click on the "user_list.upload_button" button
      And I click on the "user_list.next_button" button
      And I click on the "back_button" button
     Then the "Campaigns Repository" page is loaded
      And the "campaigns_list" list of elements is displayed
      And the value of "first" cell of table "campaigns_list" contains "Qsys campaign with visible push in-app for non-logged users"
      And the value of "last" cell of table "campaigns_list" contains "PENDING ACTIVATION"

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28900 |
          | 11.14  | moves   | QANOV-28901 |
          | 11.14  | vivobr  | QANOV-28902 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @jira.link.depends_on.<depends_on> @<product>
  @<test_priority>
  Scenario Outline: An editor can activate a campaign
    Given user has a campaign with a "immediate" in-app push created previously in the CMS with "pending_activation" status
     When I go to "[CONF:cms.base][CONF:campaigns_cms.campaigns_module]" web page
      And the "Campaigns Repository" page is loaded
      And I select the "<campaign_title>" option from "campaigns_list" field
      And I click on the "activate_button" button
      And I click on the "back_button" button
     Then the "Campaigns Repository" page is loaded
      And the "campaigns_list" list of elements is displayed
      And the "<campaign_title>" campaign is in "SCHEDULED" status

    Examples:
          | cv     | product | depends_on  | campaign_title                                                    | jira_id     | test_priority |
          | 11.14  | o2uk    | QANOV-28888 | Qsys campaign with immediate push in-app no-injected on the inbox | QANOV-28903 | smoke         |
          | 11.14  | o2uk    | QANOV-28891 | Qsys campaign with deferred push in-app no-injected on the inbox  | QANOV-28904 | regression    |
          | 11.14  | o2uk    | QANOV-28894 | Qsys campaign with silent push in-app no-injected on the inbox    | QANOV-28905 | regression    |
          | 11.14  | o2uk    | QANOV-28897 | Qsys campaign with visible push in-app injected on the inbox      | QANOV-28906 | regression    |
          | 11.14  | o2uk    | QANOV-28900 | Qsys campaign with visible push in-app for non-logged users       | QANOV-28907 | regression    |
          | 11.14  | moves   | QANOV-28889 | Qsys campaign with immediate push in-app no-injected on the inbox | QANOV-28908 | smoke         |
          | 11.14  | moves   | QANOV-28892 | Qsys campaign with deferred push in-app no-injected on the inbox  | QANOV-28909 | regression    |
          | 11.14  | moves   | QANOV-28895 | Qsys campaign with silent push in-app no-injected on the inbox    | QANOV-28910 | regression    |
          | 11.14  | moves   | QANOV-28898 | Qsys campaign with visible push in-app injected on the inbox      | QANOV-28911 | regression    |
          | 11.14  | moves   | QANOV-28901 | Qsys campaign with visible push in-app for non-logged users       | QANOV-28912 | regression    |
          | 11.14  | vivobr  | QANOV-28890 | Qsys campaign with immediate push in-app no-injected on the inbox | QANOV-28913 | smoke         |
          | 11.14  | vivobr  | QANOV-28893 | Qsys campaign with deferred push in-app no-injected on the inbox  | QANOV-28914 | regression    |
          | 11.14  | vivobr  | QANOV-28896 | Qsys campaign with silent push in-app no-injected on the inbox    | QANOV-28915 | regression    |
          | 11.14  | vivobr  | QANOV-28899 | Qsys campaign with visible push in-app injected on the inbox      | QANOV-28916 | regression    |
          | 11.14  | vivobr  | QANOV-28902 | Qsys campaign with visible push in-app for non-logged users       | QANOV-28917 | regression    |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @smoke
  Scenario Outline: An editor can choose to create a new comm with a push in-app
     When I go to "[CONF:cms.base][CONF:comms_cms.create]" web page
      And the "Comm Creation" page is loaded
      And I fill in the "details.title" field with "Qsys comm creation test"
      And I fill in the "details.description" field with "Qsys comm creation test"
      And I click on the "details.event_button" button
      And I select the "any" option from "details.event_list" field
      And I click on the "details.next_button" button
      And I click on the "conditions.next_button" button
     Then the text of the element "message.push_in_app_textfield" is equal to "Push in-App"
      And the "message.push_in_app_switch" element is displayed

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28918 |
          | 11.14  | moves   | QANOV-28919 |
          | 11.14  | vivobr  | QANOV-28920 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new comm with an immediate push in-app no injected on the inbox
    internal_checkpoint="Immediate push: This applies only when the app is opened, and in case you receive a visible
    push notification, then the in-app will show, no matter the screen/process you are (main tab, purchase flow…).
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:comms_cms.create]" web page
      And the "Comm Creation" page is loaded
      And I fill in the "details.title" field with "Qsys comm with immediate push in-app no-injected on the inbox"
      And I fill in the "details.description" field with "Qsys comm creation test"
      And I click on the "details.event_button" button
      And I select the "any" option from "details.event_list" field
      And I click on the "details.next_button" button
      And I click on the "conditions.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "visible" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I fill in the "message.push_title_inputtext" field with "Qsys immediate push in-app"
      And I fill in the "message.push_body_inputtext" field with "Description for the immediate push in-app"
      And I upload a "image" in the "message.image_url_inputtext" field
      And I select the "immediate" option from "message.in_app_delivery_radiobutton" field
      And I select the "no" option from "message.send_to_notif_inbox_radiobutton" field
      And I click on the "message.create_button" button
      And I click on the "back_button" button
     Then the "Comms Repository" page is loaded
      And the "comms_list" list of elements is displayed
      And the value of "first" cell of table "comms_list" contains "Qsys comm with immediate push in-app no-injected on the inbox"
      And the value of "last" cell of table "comms_list" contains "DRAFT"

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28921 |
          | 11.14  | moves   | QANOV-28922 |
          | 11.14  | vivobr  | QANOV-28923 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new comm with a deferred push in-app no injected on the inbox
    internal_checkpoint="Deferred push: This applies only when the app is opened, and in case you receive a visible
    push notification, and the case is the opposite from the immediate the in-app will not be opened straight
    away, and the in-app will be stored for the next time the user go to the home tab.
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:comms_cms.create]" web page
      And the "Comm Creation" page is loaded
      And I fill in the "details.title" field with "Qsys comm with deferred push in-app no-injected on the inbox"
      And I fill in the "details.description" field with "Qsys comm creation test"
      And I click on the "details.event_button" button
      And I select the "any" option from "details.event_list" field
      And I click on the "details.next_button" button
      And I click on the "conditions.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "visible" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I fill in the "message.push_title_inputtext" field with "Qsys deferred push in-app"
      And I fill in the "message.push_body_inputtext" field with "Description for the deferred push in-app"
      And I upload a "image" in the "message.image_url_inputtext" field
      And I select the "deferred" option from "message.in_app_delivery_radiobutton" field
      And I select the "no" option from "message.send_to_notif_inbox_radiobutton" field
      And I click on the "message.create_button" button
      And I click on the "back_button" button
     Then the "Comms Repository" page is loaded
      And the "comms_list" list of elements is displayed
      And the value of "first" cell of table "comms_list" contains "Qsys comm with deferred push in-app no-injected on the inbox"
      And the value of "last" cell of table "comms_list" contains "DRAFT"

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28924 |
          | 11.14  | moves   | QANOV-28925 |
          | 11.14  | vivobr  | QANOV-28926 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new comm with a silent push in-app
    internal_checkpoint="Silent push: These pushes are not visible for the users, is like sending an event to the
    app and they will trigger an in-app message in the next app time the user go to the home tab. The reason for having
    them is in case we want to have the current in-app but triggered by some conditions available in the GCT. These
    will always be deferred.
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:comms_cms.create]" web page
      And the "Comm Creation" page is loaded
      And I fill in the "details.title" field with "Qsys comm with silent push in-app no-injected on the inbox"
      And I fill in the "details.description" field with "Qsys comm creation test"
      And I click on the "details.event_button" button
      And I select the "any" option from "details.event_list" field
      And I click on the "details.next_button" button
      And I click on the "conditions.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "silent" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I click on the "message.create_button" button
      And I click on the "back_button" button
     Then the "Comms Repository" page is loaded
      And the "comms_list" list of elements is displayed
      And the value of "first" cell of table "comms_list" contains "Qsys comm with silent push in-app no-injected on the inbox"
      And the value of "last" cell of table "comms_list" contains "DRAFT"

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28927 |
          | 11.14  | moves   | QANOV-28928 |
          | 11.14  | vivobr  | QANOV-28929 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @<product> @regression
  Scenario Outline: An editor can create a new comm with a visible push in-app injected on the inbox
    internal_checkpoint="Visible push: We refer to a push that will appear in the notification centre of the phone
    with title, body, etc (What comes to you when you think for a push notification). It can be of two types:
    immediate and deferred.
    The UTM code is automatically created and editable."
    Given user has ">1" In-App Messages created previously in the CMS
     When I go to "[CONF:cms.base][CONF:comms_cms.create]" web page
      And the "Comm Creation" page is loaded
      And I fill in the "details.title" field with "Qsys comm with visible push in-app injected on the inbox"
      And I fill in the "details.description" field with "Qsys comm creation test"
      And I click on the "details.event_button" button
      And I select the "any" option from "details.event_list" field
      And I click on the "details.next_button" button
      And I click on the "conditions.next_button" button
      And I click on the "message.push_in_app_switch" element
      And I select the "visible" option from "message.push_type_radiobutton" field
      And I click on the "message.in_app_button" button
      And I select the "any" option from "message.in_app_list" field
      And I fill in the "message.push_title_inputtext" field with "Qsys visible push in-app"
      And I fill in the "message.push_body_inputtext" field with "Description for the visible push in-app"
      And I upload a "image" in the "message.image_url_inputtext" field
      And I select the "immediate" option from "message.in_app_delivery_radiobutton" field
      And I select the "yes" option from "message.send_to_notif_inbox_radiobutton" field
      And I click on the "message.create_button" button
      And I click on the "back_button" button
     Then the "Comms Repository" page is loaded
      And the "comms_list" list of elements is displayed
      And the value of "first" cell of table "comms_list" contains "Qsys comm with visible push in-app injected on the inbox"
      And the value of "last" cell of table "comms_list" contains "DRAFT"

    Examples:
          | cv     | product | jira_id     |
          | 11.14  | o2uk    | QANOV-28930 |
          | 11.14  | moves   | QANOV-28931 |
          | 11.14  | vivobr  | QANOV-28932 |

  @jira.<jira_id> @web @jira.cv.<cv> @manual @jira.link.depends_on.<depends_on> @<product>
  @regression
  Scenario Outline: An editor can activate a comm
    Given user has a comm with a "immediate" in-app push created previously in the CMS with "draft" status
     When I go to "[CONF:cms.base][CONF:comms_cms.comms_module]" web page
      And the "Comms Repository" page is loaded
      And I select the "<comm_title>" option from "comms_list" field
      And I click on the "status_button" button
      And I select the "active" option from "status_list" field
      And I click on the "activate_button" button
      And I click on the "back_button" button
     Then the "Comms Repository" page is loaded
      And the "comms_list" list of elements is displayed
      And the "<comm_title>" comm is in "ACTIVE" status

    Examples:
          | cv     | product | depends_on  | comm_title                                                    | jira_id     |
          | 11.14  | o2uk    | QANOV-28921 | Qsys comm with immediate push in-app no-injected on the inbox | QANOV-28933 |
          | 11.14  | o2uk    | QANOV-28924 | Qsys comm with deferred push in-app no-injected on the inbox  | QANOV-28934 |
          | 11.14  | o2uk    | QANOV-28927 | Qsys comm with silent push in-app no-injected on the inbox    | QANOV-28935 |
          | 11.14  | o2uk    | QANOV-28930 | Qsys comm with visible push in-app injected on the inbox      | QANOV-28936 |
          | 11.14  | moves   | QANOV-28922 | Qsys comm with immediate push in-app no-injected on the inbox | QANOV-28937 |
          | 11.14  | moves   | QANOV-28925 | Qsys comm with deferred push in-app no-injected on the inbox  | QANOV-28938 |
          | 11.14  | moves   | QANOV-28928 | Qsys comm with silent push in-app no-injected on the inbox    | QANOV-28939 |
          | 11.14  | moves   | QANOV-28931 | Qsys comm with visible push in-app injected on the inbox      | QANOV-28940 |
          | 11.14  | vivobr  | QANOV-28923 | Qsys comm with immediate push in-app no-injected on the inbox | QANOV-28941 |
          | 11.14  | vivobr  | QANOV-28926 | Qsys comm with deferred push in-app no-injected on the inbox  | QANOV-28942 |
          | 11.14  | vivobr  | QANOV-28929 | Qsys comm with silent push in-app no-injected on the inbox    | QANOV-28943 |
          | 11.14  | vivobr  | QANOV-28932 | Qsys comm with visible push in-app injected on the inbox      | QANOV-28944 |
