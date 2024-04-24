# -*- coding: utf-8 -*-
@jira.QANOV-6473
Feature: List my bundle

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page


  @jira.<jira_id> @<ber> @android @automatic @cert0 @cert1 @ios @jira.cv.9.13 @jira.link.detects.NOV-228303
  @jira.link.detects.OBO2UK-1464 @jira.link.relates_to.NOV-24925 @live @mobile @netcracker @next @o2uk @<test_priority>
  Scenario Outline: A My O2 <account_type> user can ask for the list of services through chat
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "List my bundle" to Aura via "keyboard"
     Then the "aura_card" card is displayed
      And the "aura_card.title" card is displayed
      And the "aura_card.first_textfield" textfield with "Activation date" text is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And scrolls down
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list is displayed

    Examples:
          | account_type | ber | jira_id    | test_priority |
          | MBB          |     | QANOV-6475 | smoke         |
          | PAYM         | ber | QANOV-6476 | sanity        |

  @jira.<jira_id> @android @ios @jira.cv.9.16 @jira.link.relates_to.NOV-24923 @mobile @no_automatable @o2uk @regression
  Scenario Outline: A My O2 <account_type> user can ask for the list of services through microphone
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "List my bundle" to Aura via "microphone"
     Then the "aura_card" card is displayed
      And the "aura_card.title" card is displayed
      And the "aura_card.first_textfield" textfield that contains the "Activation date" text is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list is displayed

    Examples:
          | account_type | jira_id    |
          | MBB          | QANOV-6478 |
          | PAYM         | QANOV-6479 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.9.16 @jira.link.detects.OBO2UK-1464
  @jira.link.relates_to.NOV-24883 @live @mobile @next @o2uk @regression @jira.link.detects.IOS-9069
  Scenario Outline: A My O2 <account_type> user can access to the list of services from question mark icon
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When clicks on the "question_mark_button" button
      And clicks on the alfred "alfred_main_topic_button" button with "[LANG:aura.menu_first_level.services]" text
      And clicks on the alfred "alfred_sub_topic_button" button with "[LANG:aura.menu_second_level.list_my_bundle]" text
     Then the "aura_card" card is displayed
      And the "aura_card.title" card is displayed
      And the "aura_card.first_textfield" textfield that contains the "Activation date" text is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And scrolls down
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list is displayed

    Examples:
          | account_type | jira_id    |
          | MBB          | QANOV-6482 |
          | PAYM         | QANOV-6484 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.9.13 @jira.link.depends_on.<depends_on>
  @jira.link.detects.NOV-44927 @jira.link.relates_to.NOV-8358 @live @mobile @next @o2uk @smoke
  Scenario Outline: A MyO2 <account_type> user can open the services deeplink
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "List my bundle" to Aura via "keyboard"
      And the "aura_card" card is displayed
      And clicks on the "aura_card.view_on_app" link
     Then the "Account" page is displayed

    Examples:
          | account_type | depends_on | jira_id    |
          | MBB          | QANOV-6475 | QANOV-6489 |
          | PAYM         | QANOV-6476 | QANOV-6490 |
