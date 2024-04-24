# -*- coding: utf-8 -*-
@jira.QANOV-1455
Feature: Credentials non msisdn

  Actions Before each Scenario:
    Given user is logged out


  @jira.<jira_id> @<automation> @<impeded> @android @ios @mobile @jira.cv.10.6 @<mode>
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-80631 @o2uk
  @<test_priority>
  Scenario Outline: A <account_type> user with <num_lines> line(s) subscribed to <subscription_type> and with MSISDN assets can log in the app
    internal_checkpoint="CERT0:
    O2Wifi (1 line): acce26957353@stf.ref.o2.co.uk (Added 14/06)
    O2drive and O2Wifi (several lines): inavl0ww_878541@o2.com (Added 14/06)"
    Given user has a "<account_type>" account type
      And user has "<num_lines>" mobile lines
      And user has "<subscription_type>" subscription
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "App Pin Code" page is displayed
      And inserts the current pin
     Then the "[CONF:landing_tab]" page is displayed

    @cert0 @cert1
    Examples:
          | account_type | num_lines | subscription_type | impeded | automation | jira_id    | test_priority | mode      |
          | postpay      | several   | O2Wifi            |         |            | QANOV-1466 | sanity        | automatic |
    
    Examples:
          | account_type | num_lines | subscription_type | impeded      | automation              | jira_id    | test_priority | mode   |
          | postpay      | 1         | O2Drive           |              |                         | QANOV-1456 | regression    | manual |
          | prepay       | 1         | O2Drive           | impeded_mock | automation.pending_mock | QANOV-1457 | regression    | manual |
          | postpay      | several   | O2Drive           |              |                         | QANOV-1458 | regression    | manual |
          | prepay       | several   | O2Drive           |              |                         | QANOV-1459 | regression    | manual |
          | postpay      | 1         | O2Wifi            |              |                         | QANOV-1460 | regression    | manual |
          | prepay       | 1         | O2Wifi            | impeded_mock | automation.pending_mock | QANOV-1462 | regression    | manual |
          | prepay       | several   | O2Wifi            |              |                         | QANOV-1470 | regression    | manual |
          | postpay      | 1         | O2Wifi;O2Drive    |              |                         | QANOV-1474 | smoke         | manual |
          | prepay       | 1         | O2Wifi;O2Drive    | impeded_mock | automation.pending_mock | QANOV-1475 | regression    | manual |
          | postpay      | several   | O2Wifi;O2Drive    |              |                         | QANOV-1476 | regression    | manual |
          | prepay       | several   | O2Wifi;O2Drive    |              |                         | QANOV-1477 | regression    | manual |

  @jira.<jira_id> @<ber> @cert0 @cert1 @<client> @mobile @jira.cv.10.6 @<execution_mode>
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-80625
  @jira.link.relates_to.NOV-80630 @o2uk @smoke
  Scenario Outline: A user cannot log in the app with an account with just an <subscription_type> subscription on <client> device
    internal_checkpoint="CERT0:
    User with only O2Wifi without MSISDN asset -> 'novumapptest1@o2.com'
    A O2Drive only user without a MSISDN asset -> 'sd_mike12@mailinator.com'
    User without O2wifi neither O2drive without MSISDN asset -> 'test32@thbs.com'"
    Given user has "0" mobile lines
      And user does not have a "device" account type
      And user has "<subscription_type>" subscription
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "O2uk Not Available Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:login.user_pwd_screen.not_available_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.user_pwd_screen.not_available_popup.message]" text is displayed
      And the "popup.accept" button with "<popup_accept>" text is displayed
      And the "popup.cancel" button with "<popup_cancel>" text is displayed

    Examples:
          | subscription_type | ber | client  | popup_accept                                                | popup_cancel                                                | execution_mode | jira_id     |
          | O2Drive           |     | android | [LANG:login.user_pwd_screen.not_available_popup.accept_adr] | [LANG:login.user_pwd_screen.not_available_popup.cancel_adr] | manual         | QANOV-1478  |
          | O2Wifi            | ber | android | [LANG:login.user_pwd_screen.not_available_popup.accept_adr] | [LANG:login.user_pwd_screen.not_available_popup.cancel_adr] | automatic      | QANOV-1479  |
          | O2Wifi;O2Drive    |     | android | [LANG:login.user_pwd_screen.not_available_popup.accept_adr] | [LANG:login.user_pwd_screen.not_available_popup.cancel_adr] | manual         | QANOV-1480  |
          | O2Drive           |     | ios     | [LANG:login.user_pwd_screen.not_available_popup.accept_ios] | [LANG:login.user_pwd_screen.not_available_popup.cancel_ios] | manual         | QANOV-98182 |
          | O2Wifi            | ber | ios     | [LANG:login.user_pwd_screen.not_available_popup.accept_ios] | [LANG:login.user_pwd_screen.not_available_popup.cancel_ios] | automatic      | QANOV-98183 |
          | O2Wifi;O2Drive    |     | ios     | [LANG:login.user_pwd_screen.not_available_popup.accept_ios] | [LANG:login.user_pwd_screen.not_available_popup.cancel_ios] | manual         | QANOV-98184 |

  @jira.QANOV-1481 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-80632 @o2uk @regression
  Scenario: A user not subscribed to O2Drive/O2Wifi and without MSISDN assets cannot log in the app
    internal_checkpoint="User to test:
    CERT0: test32@thbs.com/test123"
    Given user has "0" mobile lines
      And user does not have a "device" account type
      And user does not have "O2Wifi;O2Drive" subscription
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
     Then the "O2uk Not Available Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:login.user_pwd_screen.not_available_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.user_pwd_screen.not_available_popup.message_48_hours]" text is displayed
      And the "popup.accept" button with "[LANG:login.user_pwd_screen.not_available_popup.contact_us]" text is displayed
      And the "popup.cancel" button with "[LANG:login.user_pwd_screen.not_available_popup.cancel_adr]" text is displayed

  @jira.QANOV-1482 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.depends_on.QANOV-1481
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-80633 @o2uk
  @regression
  Scenario: A user not subscribed to O2Drive/O2Wifi and without MSISDN assets can go to the "Contact us" webview
    internal_checkpoint="User to test:
    CERT0: test32@thbs.com/test123
    External webview: https://www.o2.co.uk/contactus"
    Given user has "0" mobile lines
      And user does not have a "device" account type
      And user does not have "O2Wifi;O2Drive" subscription
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "O2uk Not Available Popup" popup is displayed
      And clicks on the "accept" button
     Then the external webview with "https://www.o2.co.uk/contactus" url is displayed

  @jira.QANOV-1483 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.depends_on.QANOV-1480
  @jira.link.detects.OBO2UK-1228 @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438
  @jira.link.relates_to.NOV-80629 @o2uk @regression
  Scenario: An O2Drive and O2Wifi user can access to the O2 account page from the login popup
    Given user has "0" mobile lines
      And user does not have a "device" account type
      And user has "O2Wifi;O2Drive" subscription
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "O2uk Not Available Popup" popup is displayed
      And clicks on the "accept" button
     Then the external webview with "https://accounts.o2.co.uk" url is displayed

  @jira.QANOV-1484 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.depends_on.QANOV-1480
  @jira.link.detects.OBO2UK-1228 @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438
  @jira.link.relates_to.NOV-80627 @o2uk @regression
  Scenario: An O2Drive user can access to his/her settings view from the login popup
    internal_checkpoint="CERT0: sd_mike12@mailinator.com
    External webview: O2Drive (Login screen)"
    Given user has "0" mobile lines
      And user does not have a "device" account type
      And user has "O2Drive" subscription
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "O2uk Not Available Popup" popup is displayed
      And clicks on the "accept" button
     Then the external webview with "https://o2drive" url is displayed

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.6 @manual @jira.link.depends_on.QANOV-1480
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-80626 @o2uk
  @regression
  Scenario Outline: A <subscription_type> user can cancel the login popup
    internal_checkpoint="CERT0:
    novumapptest@o2.com -> only o2wifi (no msisdns)"
    Given user has "0" mobile lines
      And user does not have a "device" account type
      And user has "<subscription_type>" subscription
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "O2uk Not Available Popup" popup is displayed
      And clicks on the "cancel" button
     Then the "Splash Screen" page is displayed

    Examples:
          | subscription_type | jira_id    |
          | O2Drive           | QANOV-1485 |
          | O2Wifi            | QANOV-1486 |
          | O2Wifi;O2Drive    | QANOV-1487 |

  @jira.QANOV-1488 @android @ios @mobile @jira.cv.10.6 @manual @jira.link.depends_on.QANOV-1480
  @jira.link.detects.OBO2UK-1228 @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438
  @jira.link.relates_to.NOV-80628 @o2uk @regression
  Scenario: An O2Wifi user can access to his/her settings view from the login popup
    internal_checkpoint="CERT0:
    novumapptest1@o2.com
    External webview: O2Wifi (Login screen)"
    Given user has "0" mobile lines
      And user does not have a "device" account type
      And user has "O2Wifi" subscription
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "O2uk Not Available Popup" popup is displayed
      And clicks on the "accept" button
     Then the external webview with "https://o2wifi" url is displayed

  @jira.<jira_id> @android @ios @mobile @jira.cv.10.6 @manual @jira.link.depends_on.QANOV-1480
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-80634 @o2uk
  @regression
  Scenario Outline: A user without connectivity can reject the O2Drive/O2Wifi login popup
    internal_checkpoint="CERT0:
    sd_mike12@mailinator.com -> only o2drive (no msisdns)
    novumapptest1@o2.com -> only o2wifi (no msisdns)
    novumapptest@o2.com -> o2drive + o2wifi (no msisdins)"
    Given user has "0" mobile lines
      And user does not have a "device" account type
      And user has "<subscription_type>" subscription
      And user turns on the Airplane mode
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And the "O2uk Not Available Popup" popup is displayed
      And clicks on the "cancel" button
     Then the "Splash Screen" page is displayed

    Examples:
          | subscription_type | jira_id    |
          | O2Drive           | QANOV-1489 |
          | O2Wifi            | QANOV-1490 |
          | O2Wifi;O2Drive    | QANOV-1491 |

  @jira.<jira_id> @automation.pending_mock @android @ios @mobile @jira.cv.Future @manual @impeded_mock
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-77438 @jira.link.relates_to.NOV-175384 @o2uk
  @regression
  Scenario Outline: A user subscribed to O2Drive/O2Wifi and with MSISDN assets can log in the app
    internal_checkpoint="CERT0:
    O2Drive: o2drive43@mailinator.com
    O2Wifi: kalyan@gmail.com / inavl0ww_878541@o2.com (Added 17/07)
    O2drive and O2Wifi: o2smartdrive+gt05@gmail.com"
    Given user has a "<account_type>" account type
      And user has "<num_lines>" mobile lines
      And user has "<subscription_type>" subscription
      And user has denied "domain" permissions
     When clicks on the "start_now" button
      And the "O2uk User Password Login" page is displayed
      And fills the "email_field" inputtext with the "[CONTEXT:user.user_login]" text
      And fills the "pass_field" inputtext with the "[CONTEXT:user.password]" text
      And clicks on the "continue_button" button
      And grants "domain" permission
     Then the "[CONF:landing_tab]" page is displayed

    Examples:
          | account_type | num_lines | subscription_type | jira_id    |
          | postpay      | 1         | O2Drive           | QANOV-1492 |
          | prepay       | 1         | O2Drive           | QANOV-1493 |
          | postpay      | several   | O2Drive           | QANOV-1497 |
          | prepay       | several   | O2Drive           | QANOV-1498 |
          | postpay      | 1         | O2Wifi            | QANOV-1499 |
          | prepay       | 1         | O2Wifi            | QANOV-1500 |
          | postpay      | several   | O2Wifi            | QANOV-1501 |
          | prepay       | several   | O2Wifi            | QANOV-1502 |
          | postpay      | 1         | O2Wifi;O2Drive    | QANOV-1503 |
          | prepay       | 1         | O2Wifi;O2Drive    | QANOV-1504 |
          | postpay      | several   | O2Wifi;O2Drive    | QANOV-1505 |
          | prepay       | several   | O2Wifi;O2Drive    | QANOV-1506 |
