# -*- coding: utf-8 -*-
@jira.QANOV-8407
Feature: Session Management

  Actions Before each Scenario:
    Given user is in the "Profile" page


  @jira.<jira_id> @<product> @<os> @jira.cv.<cv> @jira.link.detects.ANDROID-9257 @jira.link.detects.ANDROID-9586
  @jira.link.detects.APPS-6647 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-47301 @mobile @sanity @har
  Scenario Outline: User can access to the session management screen and see the current device information on <OS> devices
    other_affected_versions="2021-07"
    Given user is in the "Security And Privacy" page
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "[LANG:profile.security_and_privacy.session_management.session_management]" header is displayed
      And the "current_device_title_textfield" textfield with "<current_device_title>" text is displayed
      And the "current_device_name_textfield" textfield is displayed
      And the "current_device_last_use_textfield" textfield with "[LANG:profile.security_and_privacy.session_management.current_device_last_use_value]" text is displayed

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | OS      | os      | parent_test_plan | current_device_title                                                                | cv   | jira_id     |
          | o2uk    | Android | android | QANOV-35253      | [LANG:profile.security_and_privacy.session_management.current_device_title_android] | 10.3 | QANOV-8452  |
          | o2uk    | iOS     | ios     |                  | [LANG:profile.security_and_privacy.session_management.current_device_title_ios]     | 10.3 | QANOV-38293 |

    @automatic @cert2 @deprecate_profile_moves @jira.dv.Future @live @next
    Examples:
          | product | OS      | os      | parent_test_plan | current_device_title                                                                | cv   | jira_id     |
          | moves   | Android | android |                  | [LANG:profile.security_and_privacy.session_management.current_device_title_android] | 10.3 | QANOV-8453  |
          | moves   | iOS     | ios     |                  | [LANG:profile.security_and_privacy.session_management.current_device_title_ios]     | 10.3 | QANOV-38294 |

  @jira.QANOV-484861 @android @automatic @ber @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @live @mobile
  @qa @sanity @vivobr
  Scenario: User can access to the session management screen and see the current device information
    Given user is in the "Security And Privacy" page
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "Acesso a sua conta" header is displayed
      And the "current_device_title_textfield" textfield with "DISPOSITIVO ATUAL" text is displayed
      And the "current_device_name_textfield" textfield is displayed
      And the "current_device_last_use_textfield" textfield with "Agora" text is displayed

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.relates_to.NOV-47307 @mobile @regression
  Scenario Outline: User without connectivity will see the current device information and a warning message in the other device's session when accessing to the session management
    Given user is in the "Security And Privacy" page
      And user turns on the Airplane mode
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "current_device_title_textfield" textfield is displayed
      And the "current_device_name_textfield" textfield is displayed
      And the "current_device_last_use_textfield" textfield is displayed
      And the "other_sessions_title_textfield" textfield is displayed
      And the "other_sessions_message_no_connectivity" textfield with "[LANG:profile.security_and_privacy.session_management.other_sessions_message_no_connectivity]" text is displayed
      And the "retry_button" button is displayed

    @automatic @jira.link.parent_test_plan.QANOV-437387 @live @next @qa
    Examples:
          | product | client  | cv   | jira_id      |
          | vivobr  | android | 10.3 | QANOV-8456   |
          | vivobr  | ios     | 10.3 | QANOV-108437 |

    @automatic @cert0 @cert1 @live @next
    Examples:
          | product | client  | cv   | jira_id      |
          | o2uk    | android | 10.3 | QANOV-8457   |
          | o2uk    | ios     | 10.3 | QANOV-108438 |

    @automatic @cert2 @deprecate_profile_moves @jira.dv.Future @live @next
    Examples:
          | product | client  | cv   | jira_id      |
          | moves   | android | 10.3 | QANOV-8458   |
          | moves   | ios     | 10.3 | QANOV-108439 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-47304 @mobile @no_automatable
  @regression
  Scenario Outline: User who only has one session will see an information message in the other device's session when accessing to the session management in Android devices
    Given user is in the "Security And Privacy" page
      And user is logged in only in the current device
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "other_sessions_message_one_session" textfield with "[LANG:profile.security_and_privacy.session_management.other_sessions_message_one_session]" text is displayed
      And the "navigation_top_bar.more_options" button is not displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.3 | QANOV-8460 |

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8461 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8463 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: User who only has one session will see an information message in the other device's session when accessing to the session management in iOS devices
    Given user is in the "Security And Privacy" page
      And user is logged in only in the current device
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "other_sessions_message_one_session" textfield with "[LANG:profile.security_and_privacy.session_management.other_sessions_message_one_session]" text is displayed
      And the "navigation_top_bar.edit" button is disabled
      And the "close_all_other_sessions_button" button is not displayed

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 10.3 | QANOV-8465 |

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8466 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8467 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-47305 @mobile @no_automatable @smoke @har
  Scenario Outline: User who has several sessions opened will see the other device's session information when accessing to the session management in Android devices
    Given user is in the "Security And Privacy" page
      And user is logged in with the same account in two devices
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "other_sessions_title_textfield" textfield with "[LANG:profile.security_and_privacy.session_management.other_sessions_title]" text is displayed
      And the "other_sessions_device_list" list is displayed
      And each element in the "other_sessions_device_list" list has the "device_name" field
      And each element in the "other_sessions_device_list" list has the "description" field
      And the "navigation_top_bar.more_options" button is displayed

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8471 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8472 |

  @jira.QANOV-484863 @android @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @smoke @har
  @vivobr
  Scenario: User who has several sessions opened will see the other device's session information when accessing to the session management in Android devices
    Given user is in the "Security And Privacy" page
      And user is logged in with the same account in two devices
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "other_sessions_title_textfield" textfield with "Outros Dispositivos" text is displayed
      And the "other_sessions_device_list" list is displayed
      And each element in the "other_sessions_device_list" list has the "device_name" field
      And each element in the "other_sessions_device_list" list has the "description" field
      And the "navigation_top_bar.more_options" button is displayed

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @mobile @no_automatable @smoke @har
  Scenario Outline: User who has several sessions openened will see the other device's session information when accessing to the session management in iOS devices
    Given user is in the "Security And Privacy" page
      And user is logged in with the same account in two devices
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "other_sessions_title_textfield" textfield with "[LANG:profile.security_and_privacy.session_management.other_sessions_title]" text is displayed
      And the "other_sessions_device_list" list is displayed
      And each element in the "other_sessions_device_list" list has the "device_name" field
      And each element in the "other_sessions_device_list" list has the "description" field
      And the "navigation_top_bar.edit" button is displayed
      And the "close_all_other_sessions_button" button is displayed

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8474 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8476 |

  @jira.QANOV-484864 @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @smoke @vivobr @har
  Scenario: User who has several sessions opened will see the other device's session information when accessing to the session management in iOS devices
    Given user is in the "Security And Privacy" page
      And user is logged in with the same account in two devices
     When clicks on the "session_management_entrypoint" entrypoint
     Then the "Session Management" page is displayed
      And the "other_sessions_title_textfield" textfield with "Outros Dispositivos" text is displayed
      And the "other_sessions_device_list" list is displayed
      And each element in the "other_sessions_device_list" list has the "device_name" field
      And each element in the "other_sessions_device_list" list has the "description" field
      And the "navigation_top_bar.edit" button is displayed
      And the "close_all_other_sessions_button" button is displayed

  @jira.QANOV-57126 @android @ios @jira.cv.10.3 @jira.link.detects.IOS-6891 @jira.link.parent_test_plan.QANOV-437387
  @jira.link.relates_to.NOV-47305 @mobile @no_automatable @regression @vivobr
  Scenario: User who has several sessions opened will see the country information for the active sessions
    Given user is in the "Security And Privacy" page
      And user is logged in with the same account in two devices
     When clicks on the "session_management_entrypoint" entrypoint
      And the "Session Management" page is displayed
     Then the "description" textfield with "[LANG:profile.security_and_privacy.session_management.current_device_country.spain]" text is displayed in the active sessions

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.relates_to.NOV-47685 @mobile @no_automatable @regression
  Scenario Outline: User who closed all session and had a session in a device without connectivity will be logged out after recovering connectiviy
    internal_checkpoint="In Android devices it might be needed to do some action, such as tapping on a tab,
    to force the log out"
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
      And device "A" is a "android"
      And device "B" is a "<client>"
      And user turns on the Airplane mode in device "B"
     When clicks on the "navigation_top_bar.more_options" button
      And clicks on the "close_all_other_sessions_button" button
      And the "other_sessions_message_one_session" textfield with "[LANG:profile.security_and_privacy.session_management.other_sessions_message_one_session]" text is displayed
      And turns off the Airplane mode in device "B"
     Then user is logged out in device "B"

    @jira.link.parent_test_plan.QANOV-437387
    Examples:
          | product | client  | cv   | jira_id    |
          | vivobr  | android | 10.3 | QANOV-8477 |
          | vivobr  | ios     | 10.3 | QANOV-8478 |

    Examples:
          | product | client  | cv   | jira_id    |
          | o2uk    | android | 10.3 | QANOV-8479 |
          | o2uk    | ios     | 10.3 | QANOV-8480 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | client  | cv   | jira_id    |
          | moves   | android | 10.3 | QANOV-8481 |
          | moves   | ios     | 10.3 | QANOV-8483 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-47306 @mobile @no_automatable @smoke @har
  Scenario Outline: User can close all sessions opened in other devices in Android devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "navigation_top_bar.more_options" button
      And clicks on the "close_all_other_sessions_button" button
     Then the "other_sessions_message_one_session" textfield with "[LANG:profile.security_and_privacy.session_management.other_sessions_message_one_session]" text is displayed
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_all_sessions_feedback]" text is displayed
      And the "navigation_top_bar.more_options" button is not displayed

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8485 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8486 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.relates_to.NOV-47308 @mobile @no_automatable @regression
  @har
  Scenario Outline: User can close a specific session opened in other devices in Android devices
    internal_checkpoint="User should be logged in with the same account in more than 2 devices"
    Given user is in the "Session Management" page
      And user is logged in with the same account in several devices
     When clicks on any element in the "other_sessions_device_list" list
      And confirms the popup message
     Then the "other_sessions_device_list" list is displayed
      And the element removed from the list is not displayed
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_one_session_feedback]" text is displayed

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8489 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8490 |

  @jira.QANOV-453458 @android @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @regression
  @vivobr
  Scenario: User can see a popup to close a specific session opened in other devices in Android devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in several devices
     When clicks on any element in the "other_sessions_device_list" list
     Then the "Close Session" popup is displayed
      And the "title" textfield with "Remover dispositivo" text is displayed
      And the "message" textfield that contains the "Quer remover o dispositivo" text is displayed
      And the "accept" button with "Remover" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.QANOV-453459 @android @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @regression
  @vivobr
  Scenario: User can cancel to close a specific session opened in other devices in Android devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in several devices
     When clicks on any element in the "other_sessions_device_list" list
      And the "Close Session" popup is displayed
      And clicks on the "cancel" button
     Then the "Close Session" popup is not displayed

  @jira.QANOV-453460 @android @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @smoke @har
  @vivobr
  Scenario: User can close a specific session opened in other devices in Android devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in several devices
     When clicks on any element in the "other_sessions_device_list" list
      And the "Close Session" popup is displayed
      And clicks on the "accept" button
     Then the "Close Session" popup is not displayed
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_one_session_feedback]" text is displayed
      And the "closed_sessions_button" warning with "Fechar" text is displayed
      And the element removed from the list is not displayed

  @jira.QANOV-453461 @android @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @smoke @har
  @vivobr
  Scenario: User can see a popup to remove all sessions in Android devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "navigation_top_bar.more_options" button
      And clicks on the "close_all_other_sessions_button" button
     Then the "Close All Sessions" popup is displayed
      And the "title" textfield with "Remover dispositivos" text is displayed
      And the "message" textfield with "Quer remover todos acessos de outros dispositivos?" text is displayed
      And the "accept" button with "Remover" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.QANOV-453462 @android @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @regression
  @vivobr
  Scenario: User can cancel to close all sessions opened in other devices in Android devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "navigation_top_bar.more_options" button
      And clicks on the "close_all_other_sessions_button" button
      And the "Close All Sessions" popup is displayed
      And clicks on the "cancel" button
     Then the "Close Session" popup is not displayed

  @jira.QANOV-453463 @android @ber @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @sanity
  @vivobr @har
  Scenario: User can close all sessions opened in other devices in Android devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "navigation_top_bar.more_options" button
      And clicks on the "close_all_other_sessions_button" button
      And the "Close All Sessions" popup is displayed
      And clicks on the "accept" button
     Then the "Close Session" popup is not displayed
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_all_sessions_feedback]" text is displayed
      And the "closed_sessions_button" warning with "Fechar" text is displayed

  @jira.QANOV-453464 @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @regression
  @vivobr
  Scenario: User can see a popup to close a specific session opened in other devices in iOS devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "navigation_top_bar.edit" button
      And clicks on the "stop_icon" field of the element in the "1" position of the "other_sessions_device_list" list
      And clicks on the "close_session" button with "Remover" text
     Then the "Close Session" popup is displayed
      And the "message" textfield that contains the "Quer remover o dispositivo" text is displayed
      And the "accept" button with "Remover" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.QANOV-453465 @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @regression
  @vivobr
  Scenario: User can cancel to close a specific session opened in other devices in iOS devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "navigation_top_bar.edit" button
      And clicks on the "stop_icon" field of the element in the "1" position of the "other_sessions_device_list" list
      And the "Close Session" popup is displayed
      And clicks on the "cancel" button
     Then the "Close Session" popup is not displayed

  @jira.QANOV-453466 @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @smoke @vivobr @har
  Scenario: User can close a specific session opened in other devices in iOS devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "navigation_top_bar.edit" button
      And clicks on the "stop_icon" field of the element in the "1" position of the "other_sessions_device_list" list
      And the "Close Session" popup is displayed
      And clicks on the "accept" button
     Then the "Close Session" popup is not displayed
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_one_session_feedback]" text is displayed
      And the "closed_sessions_button" warning with "Fechar" text is displayed
      And the element removed from the list is not displayed

  @jira.QANOV-453467 @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @smoke @vivobr @har
  Scenario: User can see a popup to remove all sessions in iOS devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
      And clicks on the "close_all_other_sessions_link" link
     Then the "Close All Sessions" popup is displayed
      And the "message" textfield with "Quer remover todos acessos de outros dispositivos?" text is displayed
      And the "accept" button with "Remover" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.QANOV-453468 @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @regression
  @vivobr
  Scenario: User can cancel to close all sessions opened in other devices in iOS devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
      And clicks on the "close_all_other_sessions_button" button
      And the "Close All Sessions" popup is displayed
      And clicks on the "cancel" button
     Then the "Close Session" popup is not displayed

  @jira.QANOV-453469 @ber @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-437387 @mobile @no_automatable @sanity
  @vivobr @har
  Scenario: User can close all sessions opened in other devices in iOS devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
      And clicks on the "close_all_other_sessions_button" button
      And the "Close All Sessions" popup is displayed
      And clicks on the "accept" button
     Then the "Close Session" popup is not displayed
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_all_sessions_feedback]" text is displayed
      And the "closed_sessions_button" warning with "Fechar" text is displayed

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-47311 @mobile @no_automatable @smoke @har
  Scenario Outline: User can close all sessions opened in other devices in iOS devices
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "close_all_other_sessions_button" button
      And confirms the popup message
     Then the "other_sessions_message_one_session" textfield with "[LANG:profile.security_and_privacy.session_management.other_sessions_message_one_session]" text is displayed
      And the "navigation_top_bar.edit" button is disabled
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_all_sessions_feedback]" text is displayed
      And the "close_all_other_sessions_button" button is not displayed

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8493 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8496 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-47310 @mobile @no_automatable @regression @har
  Scenario Outline: User can close a specific session opened in other devices using the edit button on iOS devices
    internal_checkpoint="User should be logged in with the same account in more than 2 devices"
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When clicks on the "navigation_top_bar.edit" button
      And clicks on the "stop_icon" field of the element in the "1" position of the "other_sessions_device_list" list
      And clicks on the "close_session" button with "[LANG:profile.security_and_privacy.session_management.close_session]" text
      And confirms the popup message
     Then the "other_sessions_device_list" list is displayed
      And the element removed from the list is not displayed
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_one_session_feedback]" text is displayed

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8498 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8499 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.relates_to.NOV-47309 @mobile @no_automatable @regression
  Scenario Outline: User can close a specific session opened in other devices swiping on the specific session in iOS devices
    internal_checkpoint="User should be logged in with the same account in more than 2 devices"
    Given user is in the "Session Management" page
      And user is logged in with the same account in two devices
     When swipes "left" on the "1" element in the "other_sessions_device_list" list
      And clicks on the "close_session" button with "[LANG:profile.security_and_privacy.session_management.close_session]" text
      And confirms the popup message
     Then the "other_sessions_device_list" list is displayed
      And the element removed from the list is not displayed
      And the "closed_sessions" warning with "[LANG:profile.security_and_privacy.session_management.close_one_session_feedback]" text is displayed

    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 10.3 | QANOV-8503 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | cv   | jira_id    |
          | moves   | 10.3 | QANOV-8504 |
