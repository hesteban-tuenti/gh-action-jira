# -*- coding: utf-8 -*-
@jira.QANOV-164990
Feature: O2uk app rating triggers

  Actions Before the Feature:
    Given app rating is "enabled"

  Actions After the Feature:
    Given app rating is "disabled"

  Actions After each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @<client> @automatic @ber @jira.cv.10.2 @mobile @o2uk @qa @smoke
  Scenario Outline: A o2uk user can rate the app after accessing to the services screen
    the popup contains a logo that is not checked due to visibility problems in ios
    Given user is in the "Account" page
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
     When clicks on the "highlighted_services.see_all" link
      And the "O2ukServices" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed

    Examples:
          | client  | title                                      | message                                      | button                                      | jira_id      |
          | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-164991 |
          | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-164992 |

  @jira.<jira_id> @<client> @automatic @ber @har @jira.cv.10.2 @jira.link.relates_to.NOV-38661 @mobile @o2uk @qa @smoke
  Scenario Outline: A o2uk user can rate the app after interacting with Explore from the app
    the popup contains a logo that is not checked due to visibility problems in ios
    Given user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Explore" page
     When clicks on the "navigation_tab_bar.account_tab" tab
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed

    Examples:
          | client  | title                                      | message                                      | button                                      | jira_id    |
          | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-7589 |
          | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-7590 |

  @jira.<jira_id> @<client> @automatic @ber @jira.cv.10.2 @jira.link.relates_to.NOV-38658 @mobile @netcracker @o2uk @qa
  @smoke
  Scenario Outline: A o2uk user can rate the app after accessing to the bills screen from the app
    internal_checkpoint="Account status validation is performed only for V2 Account."
    Given user has a "postpay" account type
      And user is in the "Account" page
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
     When clicks on the "latest_invoice.link" link
      And the "Bills" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "movistar_logo" image is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed
      And user is in the "Account" page

    Examples:
          | client  | title                                      | message                                      | button                                      | jira_id    |
          | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-7520 |
          | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-7522 |
