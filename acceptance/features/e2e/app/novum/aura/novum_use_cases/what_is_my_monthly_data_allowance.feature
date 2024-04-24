# -*- coding: utf-8 -*-
@jira.QANOV-5359
Feature: What is my monthly data allowance?

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page


  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.9.16 @jira.link.detects.IOS-7083 @jira.link.detects.OBO2UK-1464
  @jira.link.relates_to.NOV-24951 @live @mobile @next @o2uk @<test_priority>
  Scenario Outline: A My O2 <account_type> user can access to the data allowance from question mark icon
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When clicks on the "question_mark_button" button
      And clicks on the alfred "alfred_main_topic_button" button with "[LANG:aura.menu_first_level.services]" text
      And waits "15" seconds
      And clicks on the alfred "alfred_sub_topic_button" button with "[LANG:aura.menu_second_level.data_allowance]" text
      And waits until the "response_description" element is visible
     Then the "response_description" textfield is displayed
      And the "suggestions" list is displayed

    Examples:
          | account_type | jira_id    | test_priority |
          | MBB          | QANOV-6444 | smoke         |
          | PAYM         | QANOV-6445 | sanity        |

  @jira.<jira_id> @android @cert0 @cert1 @ios @jira.cv.9.16 @jira.link.detects.NOV-105850 @jira.link.relates_to.NOV-24952 @mobile
  @no_automatable @o2uk @regression
  Scenario Outline: A My O2 <account_type> user can ask for the data allowance through microphone
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "Check my data allowance" to Aura via "microphone"
     Then the "response_description" textfield is displayed
      And the "view_on_app" button with "View on app" text is displayed
      And aura reads aloud the answer

    Examples:
          | account_type | jira_id    |
          | MBB          | QANOV-6452 |
          | postpay      | QANOV-6453 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.9.16 @jira.link.detects.IOS-7083 @jira.link.detects.NOV-105850
  @jira.link.relates_to.NOV-24953 @live @mobile @next @o2uk @regression
  Scenario Outline: A My O2 <account_type> user can ask for the data allowance through chat
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "Check my data allowance" to Aura via "keyboard"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield is displayed

    Examples:
          | account_type | jira_id    |
          | MBB          | QANOV-6459 |
          | PAYM         | QANOV-6460 |

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.9.13 @jira.link.detects.NOV-226228 @jira.link.detects.NOV-44927
  @jira.link.relates_to.NOV-8359 @live @mobile @next @o2uk @regression
  Scenario Outline: A MyO2 <account_type> user can open the data allowance card deeplink
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "Check my data allowances" to Aura via "keyboard"
      And waits until the "response_description" element is visible
      And the "response_description" textfield is displayed
      And clicks on the "0" element in the "aura_buttons" list
     Then the "Account" page is displayed

    Examples:
          | account_type | jira_id     |
          | MBB          | QANOV-37177 |
          | PAYM         | QANOV-6468  |
