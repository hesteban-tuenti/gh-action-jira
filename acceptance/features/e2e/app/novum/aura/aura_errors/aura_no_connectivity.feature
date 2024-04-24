# -*- coding: utf-8 -*-
@jira.QANOV-126322
Feature: Aura no connectivity

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page
      And user sets the device to "portrait" orientation


  @jira.<jira_id> @<client> @automatic @cert0 @cert1 @jira.cv.11.3 @jira.link.relates_to.NOV-140375 @live @mobile @next @o2uk
  @regression
  Scenario Outline: MyO2 user with <lines> lines can invoke Aura by the central Aura Summon button without connectivity: A personalized greeting message is displayed
    Given user has a "postpay" account type
      And user has "<lines>" mobile lines
      And user is in the "Support" page
     When user turns on the Airplane mode
      And clicks on the "support_aura" entrypoint
     Then the "Aura" page is displayed
      And the "welcome_message" textfield with "<welcome_message_title>" text is displayed

    Examples:
          | client  | welcome_message_title                         | lines   | jira_id     |
          | android | [LANG:aura.general.welcome_message_title_adr] | 1       | QANOV-6676  |
          | ios     | [LANG:aura.general.welcome_message_title_ios] | 1       | QANOV-44523 |
          | android | [LANG:aura.general.welcome_message_title_adr] | several | QANOV-77581 |
          | ios     | [LANG:aura.general.welcome_message_title_ios] | several | QANOV-77582 |

  @jira.<jira_id> @<execution_mode> @<product> @android @jira.cv.9.12 @jira.link.relates_to.NOV-113861
  @jira.link.relates_to.NOV-1404 @mobile @regression @har
  Scenario Outline: Error connectivity message is presented by Aura under no connectivity scenario on Android device
    Given user is in the "Support" page
      And user has a "<account_type>" account type
      And user turns on the Airplane mode
      And user is in the "Support" page
     When clicks on the "support_aura" entrypoint
      And the "Aura" page is displayed
      And waits until the "No Connectivity Warning" warning is not displayed
      And sends the message "[LANG:aura.general.greeting_to_aura]" to Aura via "<input_type>"
     Then the "response_error_message" textfield with "[LANG:aura.general.no_connectivity_response_adr]" text is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | input_type | execution_mode | jira_id    |
          | o2uk    | postpay      | keyboard   | automatic      | QANOV-6562 |
          | o2uk    | postpay      | microphone | no_automatable | QANOV-6563 |

  @jira.<jira_id> @<execution_mode> @<product> @ios @jira.cv.9.12 @jira.link.detects.IOS-6869
  @jira.link.relates_to.NOV-113861 @jira.link.relates_to.NOV-1404 @mobile @regression @har
  Scenario Outline: Error connectivity message is presented by Aura under no connectivity scenario on iOS device
    Given user is in the "Support" page
      And user has a "<account_type>" account type
      And user turns on the Airplane mode
     When clicks on the "support_aura" entrypoint
      And the "Aura" page is displayed
      And sends the message "[LANG:aura.general.greeting_to_aura]" to Aura via "<input_type>"
      And waits "35" seconds until the "response_error_message" element is visible
     Then the "response_error_message" textfield with "[LANG:aura.general.no_connectivity_response_ios]" text is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | input_type | execution_mode | jira_id     |
          | o2uk    | postpay      | keyboard   | automatic      | QANOV-96217 |
          | o2uk    | postpay      | microphone | no_automatable | QANOV-96218 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.9.10 @jira.link.detects.IOS-7027 @jira.link.relates_to.NOV-2708
  @mobile @no_automatable @regression
  Scenario Outline: Aura displays error message when user uses question mark icon without connectivity and has never used it before with connectivity
    internal_checkpoint="NOTE: On iOS devices, the user will see the message only if Alfred wasn´t used before,
    if not the user won't see a message error directly because Alfred answers are cached.
    (To delete the cache you can uninstall and reinstall the app, no need to log out)
    User doesn't see the message until taps an option that calls aura."
    Given user is in the "Support" page
      And user has a "<account_type>" account type
      And user has never clicked on the "question_mark_button" button in Aura
      And user turns on the Airplane mode
     When clicks on the "support_aura" entrypoint
      And the "Aura" page is displayed
      And clicks on the "question_mark_button" button
     Then the "response_description" textfield with "[LANG:aura.general.question_mark_no_connectivity_message]" text is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | jira_id    |
          | o2uk    | postpay      | QANOV-6567 |

  @jira.<jira_id> @<product> @android @jira.cv.11.2 @jira.link.relates_to.NOV-119828 @mobile @no_automatable @regression
  Scenario Outline: Aura displays error message when user uses question mark icon without connectivity and has used it before with connectivity in Android devices
    Given user is in the "Aura" page
      And user has a "<account_type>" account type
      And user has clicked on the "question_mark_button" button in Aura previously
     When clicks on the "question_mark_button" button
      And clicks on the "close_aura" button
      And user turns on the Airplane mode
      And clicks on the "support_aura" entrypoint
      And the "Aura" page is displayed
      And clicks on the "question_mark_button" button
     Then the "response_description" textfield with "[LANG:aura.general.question_mark_no_connectivity_message]" text is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | jira_id    |
          | o2uk    | postpay      | QANOV-6571 |

  @jira.<jira_id> @<product> @ios @jira.cv.11.2 @jira.link.relates_to.NOV-119829 @mobile @no_automatable @regression
  Scenario Outline: Aura displays cached responses when user uses question mark icon without connectivity and has used it before with connectivity in iOS devices
    Given user is in the "Aura" page
      And user has a "<account_type>" account type
      And user has clicked on the "question_mark_button" button in Aura previously
     When clicks on the "question_mark_button" button
      And clicks on the "close_aura" button
      And user turns on the Airplane mode
      And clicks on the "support_aura" entrypoint
      And the "Aura" page is displayed
      And clicks on the "question_mark_button" button
     Then the "response_description" textfield that contains the "[LANG:aura.general.question_mark_main_response]" text is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | jira_id    |
          | o2uk    | postpay      | QANOV-6574 |
