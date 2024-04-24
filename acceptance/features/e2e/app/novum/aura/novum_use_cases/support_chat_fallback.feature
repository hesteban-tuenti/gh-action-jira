# -*- coding: utf-8 -*-
@jira.QANOV-6514
Feature: Support chat fallback

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page


  @jira.<jira_id> @<execution_mode> @<test_priority> @android @cert0 @cert1 @ios @jira.cv.9.12 @jira.link.detects.IOS-7083
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.parent_test_plan.QANOV-254776 @jira.link.relates_to.NOV-141881
  @jira.link.relates_to.NOV-2400 @live @mobile @next @o2uk
  Scenario Outline: User can see the confirmation messages from Aura to be transferred to a new chat with a support agent after asking through <input_type>
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "<intent>" to Aura via "<input_type>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield with "[LANG:aura.fallback_to_support_chat.confirmation_message_text]" text is displayed
      And the "0" index in the "aura_buttons" list with "[LANG:aura.fallback_to_support_chat.ok_button]" text is displayed
      And the "1" index in the "aura_buttons" list with "[LANG:aura.fallback_to_support_chat.cancel_button]" text is displayed

    Examples:
          | intent                          | input_type | test_priority | execution_mode | jira_id    |
          | Talk to agent                   | keyboard   | sanity        | automatic      | QANOV-6528 |
          | Chat agent                      | keyboard   | smoke         | automatic      | QANOV-6530 |
          | Chat with an agent              | keyboard   | regression    | automatic      | QANOV-6531 |
          | Hand over to chat support Agent | keyboard   | regression    | automatic      | QANOV-6533 |
          | Talk to agent                   | microphone | regression    | no_automatable | QANOV-6534 |
          | Chat agent                      | microphone | regression    | no_automatable | QANOV-6535 |
          | Chat with an agent              | microphone | regression    | no_automatable | QANOV-6537 |
          | Hand over to chat support Agent | microphone | regression    | no_automatable | QANOV-6538 |

  @jira.QANOV-6549 @android @automatic @cert0 @cert1 @ios @jira.cv.9.14 @jira.link.detects.SUBO-4925
  @jira.link.parent_test_plan.QANOV-254776 @jira.link.relates_to.NOV-13448 @live @mobile @next @o2uk @smoke
  Scenario: User rejects to be transferred to a support chat from Aura
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "Talk to agent" to Aura via "keyboard"
      And waits until the "response_description" element is visible
      And clicks on the "1" element in the "aura_buttons" list
     Then the "response_description" textfield with "[LANG:aura.fallback_to_support_chat.cancel_message_text]" text is displayed

  @jira.<jira_id> @<ber> @<execution_mode> @android @cert0 @cert1 @ios @jira.cv.9.12 @jira.link.detects.IOS-7083
  @jira.link.detects.OBO2UK-1361 @jira.link.detects.OBO2UK-1425 @jira.link.detects.SERVER-1013 @<har>
  @jira.link.detects.SERVER-1393 @jira.link.detects.SERVER-633 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.parent_test_plan.QANOV-254776 @jira.link.relates_to.NOV-141881 @mobile @o2uk @<test_priority>
  Scenario Outline: Aura can transfer postpay user to a new chat with a support agent after asking through <input_type>
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "<intent>" to Aura via "<input_type>"
      And waits "10" seconds
      And clicks on the "0" element in the "aura_buttons" list
     Then the "Support Chat" page is displayed
      And waits "10" seconds
      And the "O2" header is displayed
      And the "support_chat_inputtext" inputtext is displayed

    Examples:
          | intent        | input_type | test_priority | execution_mode | ber | har | jira_id    |
          | Talk to agent | keyboard   | smoke         | automatic      | ber | har | QANOV-6544 |
          | Talk to agent | microphone | regression    | no_automatable |     |     | QANOV-6546 |
