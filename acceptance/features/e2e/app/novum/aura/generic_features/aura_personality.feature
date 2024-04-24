# -*- coding: utf-8 -*-
@jira.QANOV-6667
Feature: Aura personality

  Actions Before the Feature:
    Given user has the Aura feature

  Actions After the Feature:
     Then clicks on the "close_aura" button
      And user is in the "Support" page
      And user sets the device to "portrait" orientation


  @jira.<jira_id> @<client> @automatic @cert0 @cert1 @jira.cv.9.12 @jira.link.detects.SUBO-4975 @jira.link.relates_to.NOV-4767
  @live @mobile @netcracker @next @o2uk @smoke @<har>
  Scenario Outline: MyO2 user with <lines> lines can invoke Aura from Support: A personalized greeting message with <elements_number> suggestions is displayed
    Given user is in the "Support" page
      And user has a "postpay" account type
      And user has "<lines>" mobile lines
     When clicks on the "support_aura" entrypoint
     Then the "Aura" page is displayed
      And waits until the "response_description" element is visible
      And the "welcome_message" textfield with "<welcome_message_title>" text is displayed
      And the "response_description" textfield with "<welcome_message>" text is displayed
      And the "suggestions" list has "<elements_number>" elements

    Examples:
          | client  | welcome_message_title                         | lines   | welcome_message                                          | elements_number | har | jira_id     |
          | android | [LANG:aura.general.welcome_message_title_adr] | 1       | [LANG:aura.general.welcome_message_subtitle]             | 3               | har | QANOV-44522 |
          | ios     | [LANG:aura.general.welcome_message_title_ios] | 1       | [LANG:aura.general.welcome_message_subtitle]             | 3               |     | QANOV-6674  |
          | android | [LANG:aura.general.welcome_message_title_adr] | several | [LANG:aura.general.welcome_message_subtitle_multimsisdn] | 0               |     | QANOV-77579 |
          | ios     | [LANG:aura.general.welcome_message_title_ios] | several | [LANG:aura.general.welcome_message_subtitle_multimsisdn] | 0               | har | QANOV-77580 |

  @jira.<jira_id> @<product> @android @automatic @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-140376 @mobile @regression @<har>
  Scenario Outline: A user with <lines> mobile lines can invoke Aura from Support in landscape mode: A personalized greeting message with <suggestions_number> suggestions is displayed
    internal_checkpoint="Aura page will not be displayed in landscape mode, as Aura has no landscape mode."
    Given user has a "<account_type>" account type
      And user has "<lines>" mobile lines
      And user is in the "Support" page
      And user sets the device to "landscape" orientation
     When clicks on the "support_aura" entrypoint
      And the "Aura" page is displayed
      And waits until the "response_description" element is visible
     Then the "welcome_message" textfield with "<welcome_message_title>" text is displayed
      And the "response_description" textfield with "<welcome_message>" text is displayed
      And the "suggestions" list has "<suggestions_number>" elements
      And user sets the device to "portrait" orientation

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | welcome_message_title                         | cv   | detects      | lines   | welcome_message                                          | suggestions_number | har | jira_id     |
          | o2uk    | postpay      | [LANG:aura.general.welcome_message_title_adr] | 9.12 | NOVUMCC-4125 | 1       | [LANG:aura.general.welcome_message_subtitle]             | 3                  | har | QANOV-6678  |
          | o2uk    | postpay      | [LANG:aura.general.welcome_message_title_adr] | 12.3 | NOVUMCC-4125 | several | [LANG:aura.general.welcome_message_subtitle_multimsisdn] | 0                  |     | QANOV-78031 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.11.11 @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-215868 @mobile @sanity
  Scenario Outline: A user with 1 mobile lines can tap on a pre-suggestion button
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
     When terminates the app
      And launches the app
      And initiate the app
      And user is in the "Aura" page
      And waits "10" seconds
      And the "suggestions" list has "3" elements
      And clicks on the "any" element in the "suggestions" list
      And waits until the "response_description" element is visible
     Then the "response_description" textfield is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | detects      | jira_id    |
          | o2uk    | postpay      | NOVUMCC-4125 | QANOV-6680 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.9.16 @jira.link.detects.<detects> @jira.link.relates_to.NOV-24105
  @mobile @no_automatable @regression @<har>
  Scenario Outline: A user with 1 mobile lines can see suggestions in response triggered from speech input
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "<intent>" to Aura via "microphone"
     Then the "response_description" textfield is displayed
      And aura reads aloud the answer
      And the "suggestions" list has "<element_value>" elements
      And the "suggestions" list has ">1" elements

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | intent              | detects    | element_value | har | jira_id    |
          | o2uk    | postpay      | data usage          |            | <=3           |     | QANOV-6683 |
          | o2uk    | postpay      | list my bundle      |            | <=3           | har | QANOV-6684 |
          | o2uk    | postpay      | bill                |            | <=3           |     | QANOV-6686 |
          | o2uk    | postpay      | higher charges, why | NOV-224596 | <=4           |     | QANOV-6687 |
          | o2uk    | postpay      | allowances          |            | <=3           |     | QANOV-6688 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.9.16 @jira.link.relates_to.NOV-91870 @mobile @no_automatable
  @regression
  Scenario Outline: A user with 1 mobile line tap on a suggestion after a response to a speech input
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "<intent>" to Aura via "microphone"
      And clicks on the "any" element in the "suggestions" list
     Then the "response_description" textfield is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | intent     | jira_id    |
          | o2uk    | postpay      | data usage | QANOV-6690 |

  @jira.<jira_id> @<product> @<test_priority> @android @automatic @ios @jira.cv.9.16 @jira.link.detects.<detects>
  @jira.link.detects.IOS-7083 @jira.link.relates_to.NOV-24104 @mobile @<har>
  Scenario Outline: A user with 1 mobile lines can see suggestions in response triggered from a keyboard input
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "<intent>" to Aura via "keyboard"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield is displayed
      And scrolls down
      And the "suggestions" list has "<element_value>" elements
      And the "suggestions" list has ">1" elements

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | intent               | detects    | element_value | test_priority | har | jira_id    |
          | o2uk    | postpay      | data usage           |            | <=3           | regression    |     | QANOV-6692 |
          | o2uk    | postpay      | list my bundle       |            | <=3           | sanity        | har | QANOV-6693 |
          | o2uk    | postpay      | bill                 |            | <=3           | regression    |     | QANOV-6694 |
          | o2uk    | postpay      | higher charges, why? | NOV-224596 | <=4           | regression    |     | QANOV-6696 |
          | o2uk    | postpay      | allowances           |            | <=3           | regression    |     | QANOV-6697 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.9.16 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-24103 @mobile @regression @<har>
  Scenario Outline: A user with 1 mobile lines can see suggestions in response triggered from the question mark icon
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
     When terminates the app
      And launches the app
      And initiate the app
      And user is in the "Aura" page
      And clicks on the "question_mark_button" button
      And clicks on the alfred "alfred_main_topic_button" button with "<alfred_button_text1>" text
      And clicks on the alfred "alfred_sub_topic_button" button with "<alfred_button_text2>" text
      And waits until the "response_description" element is visible
     Then the "response_description" textfield is displayed
      And scrolls down
      And the "suggestions" list has "<element_value>" elements
      And the "suggestions" list has ">1" elements

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | alfred_button_text1 | alfred_button_text2  | detects    | element_value | har | jira_id    |
          | o2uk    | postpay      | Data usage          | Data consumed        |            | <=3           |     | QANOV-6699 |
          | o2uk    | postpay      | Services            | List my bundle       |            | <=3           | har | QANOV-6700 |
          | o2uk    | postpay      | Billing             | Last bill            |            | <=3           |     | QANOV-6702 |
          | o2uk    | postpay      | Billing             | Higher charges, why? | NOV-224596 | <=4           |     | QANOV-6703 |
          | o2uk    | postpay      | Services            | Data allowance       |            | <=4           | har | QANOV-6705 |

  @jira.<jira_id> @<execution_mode> @<product> @android @ios @jira.cv.9.16 @jira.link.relates_to.NOV-24106 @mobile
  @regression @har
  Scenario Outline: A user with 1 mobiles lines can see suggestions in a response about a question not understood
    internal_checkpoint="Not always suggestions are sent by Aura"
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user is in the "Aura" page
     When sends the message "blabla" to Aura via "<input>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield is displayed
      And the "suggestions" list has "<=3" elements
      And the "suggestions" list has ">1" elements
      And clicks on the "close_aura" button
      And the "Support" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | input      | execution_mode | jira_id    |
          | o2uk    | postpay      | microphone | no_automatable | QANOV-6708 |
          | o2uk    | postpay      | keyboard   | automatic      | QANOV-6709 |

  @jira.QANOV-6710 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.10.2 @jira.link.relates_to.NOV-39100 @live @mobile
  @netcracker @next @o2uk @sanity
  Scenario: A multiMSISDN user who access to the question mark gets a generic response
    internal_checkpoint="There are a lot of suggestions and they are shown in random order."
    Given user has a "postpay" account type
      And user has "several" mobile lines
      And user is in the "Aura" page
     When clicks on the "question_mark_button" button
     Then the "alfred_generic_response" textfield that contains the "Some FAQs I can help you with" text is displayed
      And the "alfred_text_suggestion" list has "5" elements

  @jira.<jira_id> @<execution_mode> @<test_priority> @android @cert0 @cert1 @ios @jira.cv.10.2 @jira.link.detects.IOS-7083
  @jira.link.relates_to.NOV-39102 @live @mobile @next @o2uk
  Scenario Outline: A multiMSISDN user asks Aura a question about account, chat agent or lines through <input>: User will get a generic error message
    Given user has a "postpay" account type
      And user has "several" mobile lines
      And user is in the "Aura" page
     When sends the message "<intent>" to Aura via "<input>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield with "Sorry, I can’t get those details because of your account type. One day I’ll be able to, but in the meantime I can help you with FAQs about O2 services. If you need more info on your O2 products and services, go to the My O2 app." text is displayed
      And clicks on the "close_aura" button
      And the "O2ukSupport" page is displayed

    Examples:
          | intent                        | input      | execution_mode | test_priority | jira_id    |
          | How much data do I have left? | microphone | no_automatable | regression    | QANOV-6715 |
          | How much data do I have left? | keyboard   | automatic      | regression    | QANOV-6716 |
          | Check data usage              | microphone | no_automatable | regression    | QANOV-6717 |
          | Check data usage              | keyboard   | automatic      | sanity        | QANOV-6718 |

  @jira.<jira_id> @<ber> @<execution_mode> @<product> @<test_priority> @android @ios @jira.cv.9.12
  @jira.link.detects.<detects> @jira.link.detects.IOS-7083 @jira.link.relates_to.NOV-5062 @mobile
  Scenario Outline: A user can ask through <input> any arbitrary question
    Given user has a "<account_type>" account type
      And user is in the "Aura" page
     When sends the message "<intent>" to Aura via "<input>"
      And waits until the "response_description" element is visible
     Then the "response_description" textfield is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | account_type | intent | input      | ber | execution_mode | detects | test_priority | jira_id    |
          | o2uk    | postpay      | Hi     | microphone |     | no_automatable |         | regression    | QANOV-6728 |
          | o2uk    | postpay      | Hi     | keyboard   | ber | automatic      |         | smoke         | QANOV-6729 |
          | o2uk    | postpay      | Bye    | microphone |     | no_automatable |         | regression    | QANOV-6730 |
          | o2uk    | postpay      | Bye    | keyboard   |     | automatic      |         | regression    | QANOV-6731 |
