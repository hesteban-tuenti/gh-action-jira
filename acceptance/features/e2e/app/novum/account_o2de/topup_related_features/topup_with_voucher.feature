# -*- coding: utf-8 -*-
@jira.QANOV-192999
Feature: Topup with voucher

  Actions Before each Scenario:
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status


  @jira.QANOV-193000 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-184194 @jira.link.depends_on.QANOV-47881
  @jira.link.depends_on.QANOV-47882 @manual @mobile @o2de @smoke
  Scenario: Prepay user can access to the "Topup with voucher" screen
    Given user has the "Topup Method" module configured in CMS for "Topup" page
      And user has the "Topup Voucher" module configured in CMS for "Topup With Voucher" page
      And user is in the "Topup" page
     When clicks on the "topup_options.voucher_entrypoint" entrypoint
     Then the "Topup With Voucher" page is displayed
      And the "Guthabenkarte & Code" header is displayed
      And the "title_textfield" textfield with "Guthabenkarte & Code" text is displayed
      And the "description_textfield" textfield with "16-stelligen Aufladecode hier eingeben:" text is displayed
      And the "voucher_inputtext" inputtext with the "Aufladecode" placeholder is displayed
      And the "voucher_example_textfield" textfield with "z.B. 0000 0000 0000 0000" text is displayed
      And the "submit_button" button with "Einlösen" text is displayed
      And clicks on the "top_navigation_bar.close_button" button
      And the "Topup" page is displayed
      And the "Aufladen" header is displayed

  @jira.QANOV-193001 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-193000 @manual @mobile @o2de @regression
  Scenario: Prepay user cannot topup with voucher if the voucher code field is not filled
    Given user has the "Topup Voucher" module configured in CMS for "Topup With Voucher" page
      And user is in the "Topup With Voucher" page
     When clicks on the "submit_button" entrypoint
     Then the "voucher_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-392670 @android @ios @jira.cv.14.6 @jira.link.depends_on.QANOV-193000 @manual @mobile @o2de @regression
  Scenario: Prepay user cannot insert a voucher with length different to 16-digit
    Given user has the "Topup Voucher" module configured in CMS for "Topup With Voucher" page
      And user is in the "Topup With Voucher" page
     When fills the "voucher_inputtext" inputtext with the "123412341234" text
      And clicks on the "submit_button" entrypoint
     Then the "voucher_error_textfield" textfield with "Aufladecode muss 16 Ziffern haben." text is displayed

  @jira.<jira_id> @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-193000 @jira.link.detects.O2DE-1118
  @jira.link.detects.O2DE-1119 @manual @mobile @o2de @regression
  Scenario Outline: Prepay user cannot topup with voucher if the voucher code is <voucher_status>
    To check these errors with mocks in CERT2, you have to fill the voucher_inputtext with the values "invalid",
    "used" or "expired". Any value not in (invalid, used, expired) will be considered correct.
    Given user has the "Topup Voucher" module configured in CMS for "Topup With Voucher" page
      And user has the "Topup Voucher Error Feedback" module configured in CMS for "Topup Voucher Error Feedback" page
      And user is in the "Topup With Voucher" page
     When fills the "voucher_inputtext" inputtext with the "voucher_status" text
      And clicks on the "submit_button" entrypoint
     Then the "Topup Voucher Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Hinweis" text is displayed
      And the "error_message" textfield with "<error_message>" text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | voucher_status | error_message                                                     | jira_id      |
          | invalid        | Der eingegebene Code ist ungültig. Bitte überprüfe deine Angaben. | QANOV-193002 |
          | used           | This voucher has been used already, try with another one          | QANOV-193003 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-193002 @jira.link.depends_on.QANOV-193003
  @manual @mobile @o2de @regression
  Scenario Outline: A prepay user who is in the "Topup Voucher Error Feedback" screen can tap on the "<button_name>" button
    Given user has the "Topup Voucher Error Feedback" module configured in CMS for "Topup Voucher Error Feedback" page
      And user is in the "Topup Voucher Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed

    Examples:
          | button_name   | button_id                       | jira_id      |
          | Back to topup | back_to_topup_button            | QANOV-193005 |
          | Close         | navigation_top_bar.close_button | QANOV-193006 |

  @jira.QANOV-193007 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-193002 @jira.link.depends_on.QANOV-193003 @manual
  @mobile @o2de @regression
  Scenario: A prepay user can go to previous screen from the "Topup Voucher Error Feedback" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Topup Voucher Error Feedback" module configured in CMS for "Topup Voucher Error Feedback" page
      And user is in the "Topup Voucher Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Topup With Voucher" page is displayed
      And the "Guthabenkarte & Code" header is displayed

  @jira.QANOV-193008 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-193000 @jira.link.detects.O2DE-1119
  @jira.link.detects.O2DE-1122 @jira.link.detects.O2DE-5058 @manual @mobile @o2de @smoke
  Scenario: Prepay user can topup with a valid voucher
    NOTE: if the topup with voucher takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Topup Voucher" module configured in CMS for "Topup With Voucher" page
      And user has the "Topup Voucher Success Feedback" module configured in CMS for "Topup Voucher Success Feedback" page
      And user is in the "Topup With Voucher" page
     When fills the "voucher_inputtext" inputtext with the "1234123412341234" text
      And clicks on the "submit_button" entrypoint
     Then the "Topup Voucher Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Der Code wurde erfolgreich übertragen." text is displayed
      And the "success_message" textfield with "Du hast \d+,\d\d € aufgeladen." text is displayed
      And the "back_to_topup_button" button with "Zurück zur Aufladung" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-193009 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-193008 @manual @mobile @o2de @regression
  Scenario: A prepay user who is in the "Topup Voucher Success Feedback" screen can tap on the "Back to topup" button
    Given user has the "Topup Voucher Success Feedback" module configured in CMS for "Topup Voucher Success Feedback" page
      And user is in the "Topup Voucher Success Feedback" page
     When clicks on the "back_to_topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed

  @jira.QANOV-620357 @android @e2e @ios @jira.cv.24.2 @jira.link.depends_on.QANOV-193000 @manual @mobile @o2de @regression
  Scenario: Prepay user can topup with a valid voucher
    Given user has the "Topup Voucher" module configured in CMS for "Topup With Voucher" page
      And user has the "Topup With Voucher Informative Feedback" module configured in CMS for "Topup With Voucher Informative Feedback" page
      And user is in the "Topup With Voucher" page
     When fills the "voucher" inputtext with the "1234123412341234" text
      And clicks on the "submit" button
      And the topup with voucher takes too long
     Then the "Topup With Voucher Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "main_button" button with "Zurück zur Aufladung" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed

  @jira.QANOV-620358 @android @e2e @ios @jira.cv.24.2 @jira.link.depends_on.QANOV-620357 @manual @mobile @o2de @regression
  Scenario: A prepay user can go back to "Topup" screen from the "Topup With Voucher Informative Feedback" screen
    Given user has the "Topup With Voucher Informative Feedback" module configured in CMS for "Topup With Voucher Informative Feedback" page
      And user is in the "Topup With Voucher Informative Feedback" page
     When clicks on the "main_button" button
     Then the "Topup" page is displayed
