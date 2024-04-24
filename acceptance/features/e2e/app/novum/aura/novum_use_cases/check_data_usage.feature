# -*- coding: utf-8 -*-
@jira.QANOV-6494
Feature: Check data usage

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page


  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.9.16 @jira.link.detects.IOS-6786 @jira.link.detects.IOS-7083
  @jira.link.detects.OBO2UK-1464 @jira.link.relates_to.NOV-24935 @jira.link.relates_to.NOV-29502 @live @mobile @netcracker
  @next @o2uk @<test_priority>
  Scenario Outline: A My O2 <account_type> user can ask for the Data usage through chat
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user has "data" allowances in the "mobile_line" product
      And user is in the "Aura" page
     When sends the message "Data usage" to Aura via "keyboard"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield that contains the "Let's take a look. You've got" text is displayed
      And the "aura_card" card is displayed
      And the "aura_card.title" textfield with "Data" text is displayed
      And the "aura_card.data_usage" textfield with the "[LANG:aura.aura_card.data_usage]" format is displayed
      And the "aura_card.expiration_date" textfield with the "[LANG:aura.aura_card.expiration_date]" format is displayed
      And the "aura_card.data_usage_graph" with graph type "circular" is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And scrolls down
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list is displayed

    Examples:
          | account_type | jira_id    | test_priority |
          | MBB          | QANOV-6496 | smoke         |
          | PAYM         | QANOV-6498 | sanity        |

  @jira.<jira_id> @android @ios @jira.cv.9.16 @jira.link.relates_to.NOV-24934 @jira.link.relates_to.NOV-29501 @mobile
  @no_automatable @o2uk @regression
  Scenario Outline: A My O2 <account_type> user can ask for the Data usage through microphone
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user has "data" allowances in the "mobile_line" product
      And user is in the "Aura" page
     When sends the message "Data usage" to Aura via "microphone"
     Then the "response_description" textfield that contains the "Let's take a look. You've got" text is displayed
      And the "aura_card" card is displayed
      And the "aura_card.title" textfield with "Data" text is displayed
      And the "aura_card.data_usage" textfield with the "[LANG:aura.aura_card.data_usage]" format is displayed
      And the "aura_card.expiration_date" textfield with the "[LANG:aura.aura_card.expiration_date]" format is displayed
      And the "aura_card.data_usage_graph" with graph type "circular" is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list is displayed
      And aura reads aloud the answer

    Examples:
          | account_type | jira_id    |
          | MBB          | QANOV-6500 |
          | PAYM         | QANOV-6501 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.9.13 @jira.link.detects.IOS-7083 @jira.link.detects.OBO2UK-1464
  @jira.link.relates_to.NOV-29498 @jira.link.relates_to.NOV-29500 @jira.link.relates_to.NOV-8336
  @jira.link.relates_to.NOV-8360 @live @mobile @next @o2uk @regression
  Scenario Outline: A My O2 <account_type> user can access to Data usage from question mark icon
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user has "data" allowances in the "mobile_line" product
      And user is in the "Aura" page
     When clicks on the "question_mark_button" button
      And clicks on the alfred "alfred_main_topic_button" button with "[LANG:aura.menu_first_level.data_consumption]" text
      And waits "5" seconds
      And clicks on the alfred "alfred_sub_topic_button" button with "[LANG:aura.menu_second_level.data_consumed]" text
      And waits until the "response_description" element is visible
     Then the "response_description" textfield that contains the "Let's take a look. You've got" text is displayed
      And the "aura_card" card is displayed
      And the "aura_card.title" textfield with "Data" text is displayed
      And the "aura_card.data_usage" textfield with the "[LANG:aura.aura_card.data_usage]" format is displayed
      And the "aura_card.expiration_date" textfield with the "[LANG:aura.aura_card.expiration_date]" format is displayed
      And the "aura_card.data_usage_graph" with graph type "circular" is displayed
      And the "aura_card.view_on_app" link with "View on app" text is displayed
      And scrolls down
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list is displayed

    Examples:
          | account_type | jira_id    |
          | MBB          | QANOV-6504 |
          | PAYM         | QANOV-6505 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.9.16 @jira.link.detects.IOS-7083 @jira.link.detects.NOV-44927
  @jira.link.detects.OBO2UK-1464 @live @mobile @next @o2uk @smoke
  Scenario Outline: A MyO2 <account_type> user can open the data usage deeplink
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user has "data" allowances in the "mobile_line" product
      And user is in the "Aura" page
     When sends the message "Data usage" to Aura via "keyboard"
      And waits until the "aura_card" element is visible
      And the "aura_card" card is displayed
      And clicks on the "aura_card.view_on_app" link
     Then the "Account" page is displayed

    Examples:
          | account_type | jira_id    |
          | MBB          | QANOV-6507 |
          | PAYM         | QANOV-6508 |
