# -*- coding: utf-8 -*-
@jira.QANOV-7533
Feature: Germany app rating triggers

  Actions Before the Feature:
    Given app rating is "enabled"

  Actions After the Feature:
    Given app rating is "disabled"

  Actions Before each Scenario:
    Given the app version is "equal_or_higher" than "14.3"

  Actions After each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @<product> @android @jira.cv.14.5 @manual @mobile @smoke @har @ber
  Scenario Outline: A <product> user can rate the app after downloading a bill from the app on android devices
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user has installed the "Google Drive" app
      And user is in the "Bills" page
     When clicks on the "bills_summary.download_pdf_button" button
      And the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_.+\.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the native "back" button
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375954 |
          | o2de    | QANOV-375955 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.5 @manual @mobile @smoke @har @ber
  Scenario Outline: A <product> user can rate the app after opening a bill from the app on iOS devices
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Bills" page
     When clicks on the "bills_summary.download_pdf_button" button
      And the browser webview is displayed
      And the PDF file is opened
      And clicks on the "navigation_top_bar.close_button" button
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_ios.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_ios.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_ios.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375956 |
          | o2de    | QANOV-375957 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.5 @manual @mobile @smoke
  Scenario Outline: A <product> prepay user can rate the app after making a successful topup with bank account on iOS devices
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "bank_account" service in "activated" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Topup" page
     When clicks on the "topup_options.bank_account_entrypoint" entrypoint
      And the "One-time Quick Charge Choose Amount" page is displayed
      And clicks on any element in the "topup_choose_amount_list" list
      And the "One-time Quick Charge Summary" page is displayed
      And clicks on the "topup_summary.pay_with_bank_account_button" button
      And the "Topup One-time Quick Charge Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_ios.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_ios.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_ios.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375958 |
          | o2de    | QANOV-375959 |

  @jira.<jira_id> @<product> @android @jira.cv.14.5 @manual @mobile @smoke
  Scenario Outline: A <product> prepay user can rate the app after making a successful topup with bank account on Android devices
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "bank_account" service in "activated" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Topup" page
     When clicks on the "topup_options.bank_account_entrypoint" entrypoint
      And the "One-time Quick Charge Choose Amount" page is displayed
      And clicks on any element in the "topup_choose_amount_list" list
      And the "One-time Quick Charge Summary" page is displayed
      And clicks on the "topup_summary.pay_with_bank_account_button" button
      And the "Topup One-time Quick Charge Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-386238 |
          | o2de    | QANOV-386239 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.5 @manual @mobile @regression
  Scenario Outline: A <product> prepay user can rate the app after making a successful topup with voucher on iOS devices
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Topup" page
     When clicks on the "topup_options.voucher_entrypoint" entrypoint
      And the "Topup With Voucher" page is displayed
      And fills the "voucher_inputtext" inputtext with the "1234123412341234" text
      And clicks on the "submit_button" entrypoint
      And the "Topup Voucher Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_ios.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_ios.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_ios.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375960 |
          | o2de    | QANOV-375961 |

  @jira.<jira_id> @<product> @android @jira.cv.14.5 @manual @mobile @regression
  Scenario Outline: A <product> prepay user can rate the app after making a successful topup with voucher on Android devices
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Topup" page
     When clicks on the "topup_options.voucher_entrypoint" entrypoint
      And the "Topup With Voucher" page is displayed
      And fills the "voucher_inputtext" inputtext with the "1234123412341234" text
      And clicks on the "submit_button" entrypoint
      And the "Topup Voucher Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
     Then the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-386240 |
          | o2de    | QANOV-386241 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.5 @manual @mobile @smoke
  Scenario Outline: A <product> postpay user can rate the app after making a successful bundle purchase on iOS devices
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "details_button" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
     Then the "Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
      And the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_ios.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_ios.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_ios.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375962 |
          | o2de    | QANOV-375963 |

  @jira.<jira_id> @<product> @android @jira.cv.14.5 @manual @mobile @smoke
  Scenario Outline: A <product> postpay user can rate the app after making a successful bundle purchase on Android devices
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "details_button" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
     Then the "Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
      And the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-386242 |
          | o2de    | QANOV-386243 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.5 @manual @mobile @smoke
  Scenario Outline: A <product> prepay user can rate the app after making a successful bundle purchase on iOS devices
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "details_button" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
      And clicks on the "bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
     Then the "Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
      And the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_ios.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_ios.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_ios.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-375964 |
          | o2de    | QANOV-375965 |

  @jira.<jira_id> @<product> @android @jira.cv.14.5 @manual @mobile @smoke
  Scenario Outline: A <product> prepay user can rate the app after making a successful bundle purchase on Android devices
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "any" bundles available to purchase in "any" category
      And user has "bank_account" service in "activated" status
      And user has not the "CUSTOMER_SHOW_BALANCE" forbidden use case
      And user has not the "ACCOUNT_TOP_UP_ON_DEMAND" forbidden use case
      And user has never rated the application
      And no critical events and less than "20" % of bad events in the last "3" minutes in Account
      And user is in the "Bundle Management" page
     When clicks on the elegible category in the "categories_list" list
      And the "Category Bundles" page is displayed
      And clicks on the "details_button" button of any bundle
      And the "Bundle Purchase Details" page is displayed
      And clicks on the "continue_button" button
      And the "Bundle Purchase Payment Methods" page is displayed
      And clicks on the "bankaccount_radiobutton" radio button
      And clicks on the "continue_button" button
      And the "Bundle Purchase Order Confirmation" page is displayed
      And clicks on the "add_pack_button" button
     Then the "Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Category Bundles" page is displayed
      And waits "[CONF:app_rating.delay]" seconds
      And the "Popup Rate Stars" popup is displayed
      And the "<product>_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-386244 |
          | o2de    | QANOV-386245 |
