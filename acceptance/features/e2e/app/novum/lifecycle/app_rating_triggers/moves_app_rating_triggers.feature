# -*- coding: utf-8 -*-
@jira.QANOV-7542
Feature: Moves app rating triggers
  
  Actions Before the Feature:
    Given app rating is "enabled"

  Actions After the Feature:
    Given app rating is "disabled"
  
  Actions After each Scenario:
    Given user is in the "Start" page


  @jira.<jira_id> @<client> @mobile @jira.cv.10.5 @jira.link.relates_to.NOV-29349 @moves
  @jira.link.detects.ANDROID-9542
  Scenario Outline: A moves <account_type> user logged in as <role> role can rate the app after interacting with Explore
    Account status validation is performed only for V2 Account.
    the popup contains a logo that is not checked due to visibility problems in ios
    Given user has a "<account_type>" account type
      And user has a "<role>" role
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.dashboard_tab" tab
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    @sanity @ber @automatic @qa @har
    Examples:
          | account_type | role | jira_id    | client  | title                                      | message                                      | button                                      |
          | telco        | any  | QANOV-7544 | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] |
          | telco        | any  | QANOV-7547 | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     |

    @regression @no_automatable @impeded_legacy
    Examples:
          | account_type | role  | jira_id    | client  | title                                      | message                                      | button                                      |
          | legado       | admin | QANOV-7548 | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     |
          | legado       | admin | QANOV-7545 | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] |

  @jira.<jira_id> @<client> @mobile @jira.cv.10.5 @manual @jira.link.relates_to.NOV-53810 @moves
  @smoke
  Scenario Outline: A moves user with <role> role can rate the app after tapping in “Consumption details” from Account entry point
    internal_checkpoint="Account status validation is performed only for V2 Account."
    Given user has a "<role>" role
      And user has "data" allowances in the "mobile_line" product
      And user is in the "Mobile Line Dashboard" page
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
     When clicks on the "data" allowance roundel
      And the "Mobile Line Consumption" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "movistar_logo" image is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed

    Examples:
          | role        | jira_id    | client  | title                                      | message                                      | button                                      |
          | admin       | QANOV-7534 | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] |
          | admin       | QANOV-7538 | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     |

    Examples:
          | role        | jira_id    | client  | title                                      | message                                      | button                                      |
          | admin-light | QANOV-7539 | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     |
          | admin-light | QANOV-7535 | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] |
