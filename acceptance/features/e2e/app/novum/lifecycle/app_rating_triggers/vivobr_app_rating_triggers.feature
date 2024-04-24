# -*- coding: utf-8 -*-
@jira.QANOV-7519
Feature: Vivobr app rating triggers

  Actions Before the Feature:
    Given app rating is "enabled"

  Actions After the Feature:
    Given app rating is "disabled"

  Actions After each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @<client> @<priority> @automatic @<ber> @jira.cv.<cv> @mobile @old_app @qa @vivobr @<har>
  Scenario Outline: A vivo <account_type> user can rate the app after accessing to the bills screen from the app on <client> devices
    Account status validation is performed only for V2 Account
    Event: INVOICES_SHOWN
    the popup contains a logo that is not checked due to visibility problems in ios
    Given user has a "<account_type>" account type
      And user is in the "Account" page
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user has never rated the application
     When clicks on the "bills.link" link
      And the "VivobrBills" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed
      And user is in the "Account" page

    Examples:
          | account_type | priority   | har | cv    | client  | title                                      | message                                      | button                                      | ber | jira_id     |
          | beatrix      | sanity     |     | 11.15 | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | ber | QANOV-44550 |
          | multivivo    | smoke      | har | 11.15 | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] |     | QANOV-44551 |
          | convergente  | regression |     | 12.0  | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] |     | QANOV-44552 |
          | beatrix      | sanity     |     | 11.15 | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | ber | QANOV-44553 |
          | multivivo    | smoke      | har | 11.15 | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     |     | QANOV-44554 |
          | convergente  | regression |     | 12.0  | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     |     | QANOV-44555 |

  @jira.<jira_id> @<client> @<priority> @ber @jira.cv.24.3 @manual @mobile @vivobr @<har>
  Scenario Outline: A vivo <account_type> user can rate the app after accessing to the bills screen from the app on <client> devices
    Event: INVOICES_SHOWN
    the popup contains a logo that is not checked due to visibility problems in ios
    Given user has a "<account_type>" account type
      And user is in the "Assinatura" page
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user has never rated the application
     When clicks on the "bills.link" link
      And the "Bills Central" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed
      And user is in the "Assinatura" page

    Examples:
          | account_type | priority   | har | client  | title                                      | message                                      | button                                      | jira_id      |
          | beatrix      | sanity     | har | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-599255 |
          | multivivo    | smoke      |     | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-599256 |
          | convergente  | regression |     | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-599257 |
          | beatrix      | sanity     | har | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-599258 |
          | multivivo    | smoke      |     | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-599259 |
          | convergente  | regression |     | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-599260 |

  @jira.<jira_id> @<client> @<priority> @autmation.hard @jira.cv.11.15 @manual @mobile @old_app @vivobr
  Scenario Outline: A vivo <account_type> user can rate the app after tapping in "Consumption details" from Account entry point
    internal_checkpoint="Account status validation is performed only for V2 Account.
    Event: CONSUMPTION_SHOWN"
    Given user has a "<account_type>" account type
      And user has "data" allowances in the "mobile_line" product
      And user is in the "Account" page
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user has never rated the application
     When clicks on the "data" allowance roundel
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "vivinho_logo" image is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed

    Examples:
          | account_type    | client  | title                                      | message                                      | button                                      | priority | jira_id     |
          | beatrix postpay | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | smoke    | QANOV-44531 |
          | beatrix control | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | smoke    | QANOV-44532 |
          | multivivo       | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | smoke    | QANOV-44533 |
          | beatrix postpay | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | smoke    | QANOV-44534 |
          | beatrix control | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | smoke    | QANOV-44535 |
          | multivivo       | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | smoke    | QANOV-44536 |

  @jira.<jira_id> @<client> @automation.hard @jira.cv.12.0 @manual @mobile @old_app @regression @vivobr
  Scenario Outline: A vivo convergente user can rate the app after tapping in "Consumption details" from Mobile Line Dashboard entry point
    internal_checkpoint="Account status validation is performed only for V2 Account.
    Event: CONSUMPTION_SHOWN"
    Given user has a "convergente" account type
      And user has a "mobile_line" product
      And user has "data" allowances in the "mobile_line" product
      And user is in the "Mobile Line Dashboard" page
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user has never rated the application
     When clicks on the "data" allowance roundel
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "vivinho_logo" image is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed

    Examples:
          | client  | title                                      | message                                      | button                                      | jira_id     |
          | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-44537 |
          | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-44538 |

  @jira.<jira_id> @<client> @<priority> @automation.hard @jira.cv.11.15 @manual @mobile @vivobr
  Scenario Outline: A vivo <account_type> user can rate the app after accessing to the "Share Internet" screen from Account
    Event: external_account_open_share
    Share Internet is accessed from the entrypoint: enviar internet disponivel
    In iOS there is a limitation where the operating system is in charge of determining if it is appropriate to show an
    AppRating. If it determines that one was shown a "short time ago" then it may not be shown (This limitation does
    not exist outside of the live environment).
    Given user has a "<account_type>" account type
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user has never rated the application
      And user is in the "Account" page
     When navigates to "Share Internet" page
      And waits "[CONF:app_rating.delay]" seconds
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed
     Then the "Popup Rate Stars" popup is displayed
      And the "vivinho_logo" image is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed

    Examples:
          | priority | account_type    | client  | title                                      | message                                      | button                                      | jira_id     |
          | sanity   | beatrix control | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-44559 |
          | sanity   | beatrix control | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-44562 |

    @impeded_legacy
    Examples:
          | priority   | account_type   | client  | title                                      | message                                      | button                                      | jira_id     |
          | regression | legacy control | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-44557 |
          | regression | legacy control | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-44560 |

    @impeded_legacy
    Examples:
          | priority   | account_type  | client  | title                                      | message                                      | button                                      | jira_id     |
          | regression | legacy prepay | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-44558 |
          | regression | legacy prepay | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-44561 |

  @jira.<jira_id> @<client> @<priority> @automation.hard @jira.cv.11.7 @jira.link.relates_to.NOV-186984 @manual @mobile
  @old_app @vivobr
  Scenario Outline: A vivo user can rate the app after accesing to Packages within Account
    Event: external_account_open_packages
    In iOS there is a limitation where the operating system is in charge of determining if it is appropriate to show an
    AppRating. If it determines that one was shown a "short time ago" then it may not be shown (This limitation does
    not exist outside of the live environment).
    Given user has a "<account_type>" account type
      And user has "1" plans
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user has never rated the application
      And user is in the "Account" page
     When navigates to "Pacotes" page
      And waits "[CONF:app_rating.delay]" seconds
      And clicks on the "navigation_top_bar.back_button" button
      And the "Services" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed
     Then the "Popup Rate Stars" popup is displayed
      And the "vivinho_logo" image is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed

    @impeded_legacy
    Examples:
          | priority   | account_type   | client  | title                                      | message                                      | button                                      | jira_id    |
          | regression | legacy control | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-7525 |
          | regression | legacy postpay | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-7526 |
          | regression | legacy control | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-7529 |
          | regression | legacy postpay | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-7530 |

    Examples:
          | priority | account_type    | client  | title                                      | message                                      | button                                      | jira_id      |
          | smoke    | beatrix postpay | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-7528   |
          | smoke    | beatrix control | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QANOV-95792  |
          | smoke    | beatrix postpay | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-7531   |
          | smoke    | beatrix control | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QANOV-127530 |
