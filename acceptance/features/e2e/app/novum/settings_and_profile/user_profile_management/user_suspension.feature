# -*- coding: utf-8 -*-
@jira.QANOV-8516
Feature: User suspension


  @jira.<jira_id> @cert0 @cert1 @<client> @mobile @jira.cv.10.3 @automatic @jira.link.parent_test_plan.QANOV-35253
  @jira.link.relates_to.NOV-47365 @live @next @o2uk @sanity
  Scenario Outline: A user can access to the "Delete account" section on <client> device
    commented_tags="@depends_on.NOV-47205"
    other_affected_versions="2021-07"
    Given user is in the "Security And Privacy" page
     When clicks on the "delete_account_entrypoint" button
     Then the "Delete Account" internal webview is displayed
      And the "[LANG:profile.delete_account.page_header]" header is displayed
      And the "delete_account_body" textfield with "[LANG:profile.security_and_privacy.delete_account.body]" text is displayed
      And the "warning_data_textfield" textfield with "[LANG:profile.security_and_privacy.delete_account.warning_data]" text is displayed
      And the "warning_contract_textfield" textfield with "[LANG:profile.security_and_privacy.delete_account.warning_contract]" text is displayed
      And the "delete_my_my_o2_account_button" button with "[LANG:profile.security_and_privacy.delete_account.delete_button]" text is displayed

    @jira.link.detects.IOS-6509
    Examples:
          | client | jira_id    |
          | ios    | QANOV-8517 |

    Examples:
          | client  | jira_id     |
          | android | QANOV-65973 |

  @jira.QANOV-57118 @android @ios @mobile @jira.cv.10.3 @automatic @jira.link.parent_test_plan.QANOV-35253
  @jira.link.relates_to.NOV-47365 @o2uk @regression @cert0 @cert1 @live @next
  Scenario: A user who accesses to the "Delete account" screen will see the warning icons next to the information text
    commented_tags="@depends_on.NOV-47205"
    other_affected_versions="2021-07"
    Given user is in the "Delete Account" page
     Then the "warning_data_icon" icon is displayed
      And the "warning_contract_icon" icon is displayed

  @jira.<jira_id> @ber @cert0 @cert1 @<client> @mobile @jira.cv.10.3 @automatic @jira.link.depends_on.QANOV-8517
  @jira.link.relates_to.NOV-47364 @live @next @o2uk @sanity
  Scenario Outline: A user can access to the "Account Deletion Reason" screen
    Given user is in the "Delete Account" page
     When clicks on the "delete_my_my_o2_account_button" button
     Then the "Deletion Reason" internal webview is displayed
      And the "[LANG:profile.delete_account.page_header]" header is displayed
      And the "deletion_reason_title" textfield with "[LANG:profile.security_and_privacy.delete_account.deletion_reason.title]" text is displayed
      And the "deletion_reason_subtitle" textfield with "[LANG:profile.security_and_privacy.delete_account.deletion_reason.subtitle]" text is displayed
      And the "deletion_reason_list" list with "[LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.dont_use_app];[LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.app_much_space];[LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.app_doesnt_work_well];[LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.too_many_notifications];[LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.other_reason]" entrypoints is displayed
      And the "confirm_deletion_button" button with "[LANG:profile.security_and_privacy.delete_account.deletion_reason.confirm_button]" text is displayed

    @jira.link.detects.IOS-6509
    Examples:
          | client | jira_id    |
          | ios    | QANOV-8518 |

    Examples:
          | client  | jira_id     |
          | android | QANOV-59719 |

  @jira.QANOV-84591 @cert0 @cert1 @android @mobile @jira.cv.10.3 @automatic @jira.link.depends_on.QANOV-8518
  @jira.link.relates_to.NOV-47368 @live @next @o2uk @regression
  Scenario: A user can confirm that he/she wants to delete his/her account on Android devices
    Given user is in the "Deletion Reason" page
     When clicks on the "any" element in the "deletion_reason_list" list
      And clicks on the "confirm_deletion_button" button
     Then the "Account Deletion Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:profile.security_and_privacy.delete_account.popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:profile.security_and_privacy.delete_account.popup.body]" text is displayed
      And the "popup.accept" button with "[LANG:profile.security_and_privacy.delete_account.popup.delete_button.android]" text is displayed
      And the "popup.cancel" button with "[LANG:profile.security_and_privacy.delete_account.popup.cancel_button.android]" text is displayed
      And clicks on the "popup.cancel" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.QANOV-57119 @cert0 @cert1 @ios @mobile @jira.cv.10.3 @automatic @jira.link.depends_on.QANOV-8518
  @jira.link.relates_to.NOV-47368 @live @next @o2uk @regression
  Scenario: A user can confirm that he/she wants to delete his/her account on iOS devices
    Given user is in the "Deletion Reason" page
     When clicks on the "any" element in the "deletion_reason_list" list
      And clicks on the "confirm_deletion_button" button
     Then the "Account Deletion Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:profile.security_and_privacy.delete_account.popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:profile.security_and_privacy.delete_account.popup.body]" text is displayed
      And the "popup.accept" button with "[LANG:profile.security_and_privacy.delete_account.popup.delete_button.ios]" text is displayed
      And the "popup.cancel" button with "[LANG:profile.security_and_privacy.delete_account.popup.cancel_button.ios]" text is displayed


  @jira.QANOV-84592 @cert0 @cert1 @android @ios @mobile @jira.cv.10.3 @automatic @jira.link.depends_on.QANOV-8518
  @jira.link.relates_to.NOV-47367 @live @next @o2uk @regression
  Scenario: A user can cancel the account deletion
    Given user is in the "Deletion Reason" page
     When clicks on the "any" element in the "deletion_reason_list" list
      And clicks on the "confirm_deletion_button" button
      And the "Account Deletion Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Security And Privacy" page is displayed

  @jira.QANOV-8523 @android @ios @mobile @jira.cv.10.3 @automatic @jira.link.depends_on.QANOV-8518
  @jira.link.relates_to.NOV-47370 @o2uk @regression @cert0 @cert1 @live @next
  Scenario: A user can not delete his/her account without selecting a reason
    Given user is in the "Deletion Reason" page
     When clicks on the "confirm_deletion_button" button
     Then the "empty_reason_warning" textfield with "[LANG:profile.security_and_privacy.delete_account.deletion_reason.empty_form_warning]" text is displayed
      And the "empty_reason_warning" element is under "other_reason_checkbox" element

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.3 @automatic @jira.link.depends_on.QANOV-8518
  @jira.link.relates_to.NOV-47372 @o2uk @regression @cert0 @cert1 @live @next
  Scenario Outline: A user can select a reason to delete his/her account
    Given user is in the "Deletion Reason" page
     When clicks on the "<reason_element>" checkbox with "<deletion_reason>" text
     Then the "<reason_element>" checkbox is checked

    Examples:
          | reason_element                  | deletion_reason                                                                                   | jira_id    |
          | dont_use_app_checkbox           | [LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.dont_use_app]           | QANOV-8524 |
          | app_much_space_checkbox         | [LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.app_much_space]         | QANOV-8525 |
          | app_doesnt_work_well_checkbox   | [LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.app_doesnt_work_well]   | QANOV-8527 |
          | too_many_notifications_checkbox | [LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.too_many_notifications] | QANOV-8529 |
          | other_reason_checkbox           | [LANG:profile.security_and_privacy.delete_account.deletion_reason.reasons.other_reason]           | QANOV-8530 |

  @jira.QANOV-8531 @no_automatable @android @ios @mobile @jira.cv.10.3
  @jira.link.depends_on.QANOV-8518 @jira.link.relates_to.NOV-47369 @o2uk @smoke
  Scenario: A user can delete the account
    internal_checkpoint="According to the PRD this flow will be completed with another action:
    - And the user will receive a confirmation email regarding the user's account deletion"
    Given user is in the "Deletion Reason" page
     When clicks on the "any" element in the "deletion_reason_list" list
      And clicks on the "confirm_deletion_button" button
      And the "Account Deletion Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-8532 @no_automatable @android @ios @mobile @jira.cv.10.3 @jira.link.depends_on.QANOV-8531
  @jira.link.detects.DAC-2345 @jira.link.relates_to.NOV-47374 @o2uk @regression
  Scenario: A user can register again after deleting his/her account
    internal_checkpoint="note that on first login, onboarding elements like in apps might be shown before reaching the
    account page"
    Given user account is removed
      And user is in the "Splash Screen" page
     When logs in the application
     Then the "Account" page is displayed
