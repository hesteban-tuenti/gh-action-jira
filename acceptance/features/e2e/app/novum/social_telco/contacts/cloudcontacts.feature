@jira.QANOV-829
Feature: CloudContacts


  @jira.<jira_id> @mobile @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-174878 @har
  @jira.link.relates_to.NOV-174879 @jira.link.relates_to.NOV-121753 @<product> @regression @manual @automation.hard
  Scenario Outline: Contacts permissions are requested to a user when he logs in for the first time in the app
    internal_checkpoint="For iOS Title and buttons of the popup will be shown in the device language"
    Given user has never logged in the app
      And user is in the "Splash Screen" page
     When logs in the application
     Then the "Grant Contacts Permissions" popup is displayed

    Examples:
      | product | jira_id   | cv   |
      | moves   | QANOV-842 | 11.6 |
      | o2uk    | QANOV-843 | 11.6 |
      | vivobr  | QANOV-844 | 11.2 |

  @jira.<jira_id> @mobile @android @ios @jira.cv.11.6 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-174880
  @<product> @regression @manual @automation.hard @har
  Scenario Outline: A user accepts contact permissions after first login
    internal_checkpoint="NOTE: We can check if the device phonebook has been synchronized with the app, checking: *
    Account dashboard * Line selector in account * Consumption > Calls > List of calls In all of these, will be
    updated with the contact name and avatar of the local phonebook NOTE: during the deployment of No Phonebooks
    feature, fallback to remote phonebook will be enabled, so friendly names might appear if they are stored in a
    remote phonebook loaded with an old app version"
    Given user has never logged in the app
      And user is in the "Splash Screen" page
     When logs in the application
      And the "Grant Contacts Permissions" popup is displayed
      And clicks on the "popup.accept" button
     Then "contacts" permission is granted to the app

    Examples:
      | product | depends_on | jira_id   |
      | moves   | QANOV-842  | QANOV-830 |
      | o2uk    | QANOV-843  | QANOV-831 |

  @jira.<jira_id> @mobile @android @ios @jira.cv.11.6 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-174881
  @<product> @regression @manual @automation.hard @har
  Scenario Outline: A user refuses contact permissions after first login
    internal_checkpoint="NOTE: We can check if the device phonebook has been synchronized with the app, checking: *
    Account dashboard * Line selector in account * Consumption > Calls > List of calls In all of these, won't be
    updated with the contact name and avatar of the local phonebook NOTE: during the deployment of No Phonebooks
    feature, fallback to remote phonebook will be enabled, so friendly names might appear if they are stored in a
    remote phonebook loaded with an old app version"
    Given user has never logged in the app
      And user is in the "Splash Screen" page
     When logs in the application
      And the "Grant Contacts Permissions" popup is displayed
      And clicks on the "popup.cancel" link with "reject" text
     Then "contacts" permission is not granted to the app

    Examples:
      | product | depends_on | jira_id   |
      | moves   | QANOV-842  | QANOV-838 |
      | o2uk    | QANOV-843  | QANOV-839 |

  @jira.<jira_id> @mobile @android @ios @jira.cv.11.6 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-175706
  @moves @regression @manual @automation.hard @har
  Scenario Outline: Phone Numbers in the app are matched to native phonebook contacts for a user that accepted contact permissions
    internal_checkpoint="NOTE: We can check if the device phonebook has been synchronized with the app, checking:  *
    Account dashboard  * Line selector in account  * Consumption > Calls > List of calls  In all of these, will be
    updated with the contact name and avatar of the local phonebook"
    Given user has granted "contacts" permissions
      And a phone number from the "subscriptions" is stored with "Contact Test" name in the phonebook with "<format>" format
      And user is in the "Account" page
      Then the stored line is displayed with the "Contact Test" name in the "mobile_line_roundels" carousel

    Examples:
      | format                | depends_on | jira_id   |
      | international with 00 | QANOV-842  | QANOV-832 |
      | international with +  | QANOV-842  | QANOV-833 |
      | national              | QANOV-842  | QANOV-834 |

  @jira.<jira_id> @mobile @android @ios @jira.cv.11.6 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-175706
  @o2uk @regression @manual @automation.hard
  Scenario Outline: Phone Numbers in the app are matched to native phonebook contacts for a user that accepted contact permissions
    internal_checkpoint="NOTE: We can check if the device phonebook has been synchronized with the app, checking:  *
    Account dashboard  * Line selector in account  * Consumption > Calls > List of calls  In all of these, will be
    updated with the contact name and avatar of the local phonebook"
    Given user has granted "contacts" permissions
      And a phone number from the "subscriptions" is stored with "Contact Test" name in the phonebook with "<format>" format
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
     Then the "subscription.list" list is displayed
      And the stored line is displayed with the "Contact Test" name in the "subscription_selector" list

    Examples:
      | format                | depends_on | jira_id   |
      | international with 00 | QANOV-843  | QANOV-835 |
      | international with +  | QANOV-843  | QANOV-836 |
      | national              | QANOV-843  | QANOV-837 |
