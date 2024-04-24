# -*- coding: utf-8 -*-
@jira.QANOV-8373
Feature: Log out

  Actions After the Feature:
     Then the device is connected to a "wifi" network


  @jira.<jira_id> @<product> @android @har @ios @jira.cv.<cv> @jira.link.detects.IOS-6890 @ber
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-334 @mobile @sanity
  Scenario Outline: Local log out for a user with only a logged account
    Given user is logged in with "1" account/s
      And user is in the "Profile" page
     When clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

    @automatic @cert0 @cert1
    Examples:
          | cv   | product | parent_test_plan | jira_id    |
          | 9.12 | o2uk    | QANOV-35253      | QANOV-8376 |

    @automatic @cert3 @live @next @qa @raitt_drop1
    Examples:
          | cv   | product | parent_test_plan | jira_id      |
          | 13.9 | blaude  |                  | QANOV-243620 |

    @automatic @live @next @qa
    Examples:
          | cv   | product | parent_test_plan | jira_id    |
          | 9.12 | vivobr  | QANOV-437387     | QANOV-8374 |

    @automatic @cert2 @deprecate_profile_moves @jira.dv.Future @live @next @qa
    Examples:
          | cv   | product | parent_test_plan | jira_id    |
          | 9.12 | moves   |                  | QANOV-8377 |

    @automatic @live @next
    Examples:
          | cv   | product | parent_test_plan | jira_id     |
          | 14.2 | o2de    | QANOV-437471     | QANOV-49060 |

    @manual
    Examples:
          | cv     | product | parent_test_plan | jira_id      |
          | Future | o2es    |                  | QANOV-410802 |

  @jira.QANOV-556395 @android @ber @har @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile
  @moves @sanity
  Scenario: Moves user can log out
    Given user is logged in with "1" account/s
      And user is in the "Profile" page
     When clicks on the "log_out_link" link
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-13369
  @mobile @regression
  Scenario Outline: Local log out for a user with only a logged account and no connectivity
    Given user is logged in with "1" account/s
      And user is in the "Profile" page
      And user turns on the Airplane mode
     When clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

    @automatic @cert0 @cert1
    Examples:
          | cv   | product | parent_test_plan | detects | jira_id    |
          | 9.12 | o2uk    | QANOV-35253      |         | QANOV-8379 |

    @manual
    Examples:
          | cv     | product | parent_test_plan | detects    | jira_id      |
          | 9.12   | vivobr  | QANOV-437387     |            | QANOV-8378   |
          | 13.9   | blaude  |                  | OBO2DE-197 | QANOV-243621 |
          | 14.2   | o2de    |                  |            | QANOV-49061  |
          | Future | o2es    |                  |            | QANOV-410803 |

    @deprecate_profile_moves @jira.dv.Future @manual
    Examples:
          | cv   | product | parent_test_plan | detects | jira_id    |
          | 9.12 | moves   |                  |         | QANOV-8381 |

  @jira.QANOV-556396 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @regression
  Scenario: Moves user can log out with no connectivity
    Given user is in the "Profile" page
      And user turns on the Airplane mode
     When clicks on the "log_out_link" link
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

  @jira.<jira_id> @<product> @android @har @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-335 @mobile @no_automatable @sanity
  Scenario Outline: Remote log out for a user with only a logged account from android devices
    other_affected_versions="2021-07"
    Given user is logged in with "1" account/s
      And user is in the "Profile" page
      And user is logged in with the same account in two devices
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And clicks on the "session_management_entrypoint" entrypoint
      And clicks on any element in the "other_sessions_device_list" list
      And the "Close Session Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed in the other device

    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | vivobr  | QANOV-437387     | 9.12 | QANOV-283332 |
          | o2uk    | QANOV-35253      | 9.12 | QANOV-283333 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | parent_test_plan | cv   | jira_id      |
          | moves   |                  | 9.12 | QANOV-283334 |

  @jira.<jira_id> @<product> @har @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-335 @mobile @no_automatable @sanity
  Scenario Outline: Remote log out for a user with only a logged account from iOS devices
    other_affected_versions="2021-07"
    Given user is logged in with "1" account/s
      And user is in the "Profile" page
      And user is logged in with the same account in two devices
     When clicks on the "security_and_privacy_entrypoint" entrypoint
      And clicks on the "session_management_entrypoint" entrypoint
      And swipes "left" on the "1" element in the "other_sessions_device_list" list
      And clicks on the "close_session" button with "[LANG:profile.security_and_privacy.session_management.close_session]" text
      And the "Close Session Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed in the other device

    Examples:
          | product | parent_test_plan | cv   | jira_id    |
          | vivobr  | QANOV-437387     | 9.12 | QANOV-8382 |
          | o2uk    | QANOV-35253      | 9.12 | QANOV-8383 |

    @deprecate_profile_moves @jira.dv.Future
    Examples:
          | product | parent_test_plan | cv   | jira_id    |
          | moves   |                  | 9.12 | QANOV-8384 |

  @jira.QANOV-8386 @android @ber @ios @jira.cv.9.11 @jira.link.relates_to.NOV-2263 @mobile @no_automatable @regression
  @vivobr
  Scenario: Local log out for a user with multiple logged accounts
    Given user is logged in with "2" account/s
      And user is in the "Profile" page
     When clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Profile" page is displayed

  @jira.QANOV-519051 @android @ber @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: Android local log out for a user with multiple logged accounts
    Given user is logged in with "2" account/s
      And user is in the "Profile" page
     When clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Profile" page is displayed

  @jira.QANOV-519052 @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: iOS local log out for a user with multiple logged accounts
    Given user is logged in with "2" account/s
      And user is in the "Profile" page
     When clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Assinaturas" page is displayed

  @jira.QANOV-8390 @android @ios @jira.cv.9.15 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-13372
  @mobile @no_automatable @regression @vivobr
  Scenario: Local log out for a user with multiple logged accounts and no connectivity
    Given user is logged in with "2" account/s
      And user is in the "Profile" page
     When user turns on the Airplane mode
      And clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Profile" page is displayed

  @jira.QANOV-519053 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario: Android local log out for a user with multiple logged accounts and no connectivity
    Given user is logged in with "2" account/s
      And user is in the "Profile" page
     When user turns on the Airplane mode
      And clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Profile" page is displayed
      And user is logged in with "1" account/s

  @jira.QANOV-519054 @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario: iOS local log out for a user with multiple logged accounts and no connectivity
    Given user is logged in with "2" account/s
      And user is in the "Profile" page
     When user turns on the Airplane mode
      And clicks on the "log_out_button" entrypoint
      And the "Log Out Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Assinaturas" page is displayed
      And user is logged in with "1" account/s
