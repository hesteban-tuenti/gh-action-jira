# -*- coding: utf-8 -*-
@jira.QANOV-3638
Feature: Recovery password

  Actions Before each Scenario:
    Given user is logged out


  @jira.QANOV-5041 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.10.4 @jira.link.relates_to.NOV-63682 @live @mobile @next
  @o2uk @sanity
  Scenario: User can access to recovery password screen
    commented_tags="@depends_on.NOV-47601"
    Given user is in the "O2uk User Password Login" page
     When clicks on the "forgotten_log_in_details" link
     Then the "O2uk Reset Password" internal webview is displayed
      And the "[LANG:login.recovery_password.header]" header is displayed
      And the "email_address_tab" tab is selected
      And the "description" textfield with "[LANG:login.recovery_password.description_email]" text is displayed
      And the "description2" textfield with "[LANG:login.recovery_password.description_email2]" text is displayed
      And the "email" inputtext with the "[LANG:login.recovery_password.email]" placeholder is displayed
      And the "continue_button" button is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "O2uk Abort Reset Password Popup" popup is displayed

  @jira.<jira_id> @<client> @automatic @cert0 @cert1 @jira.cv.10.6 @live @mobile @next @o2uk @regression
  Scenario Outline: A popup is shown if user want to abort the "reset your password" process on <client> device
    Given user is in the "O2uk Reset Password" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "O2uk Abort Reset Password Popup" popup is displayed
      And the "popup.title" textfield with "[LANG:login.recovery_password.abort_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.recovery_password.abort_popup.message]" text is displayed
      And the "popup.accept" button with "<popup_accept>" text is displayed
      And the "popup.cancel" button with "<popup_cancel>" text is displayed

    Examples:
          | client  | popup_accept                                          | popup_cancel                                          | jira_id     |
          | android | [LANG:login.recovery_password.abort_popup.accept_adr] | [LANG:login.recovery_password.abort_popup.cancel_adr] | QANOV-5042  |
          | ios     | [LANG:login.recovery_password.abort_popup.accept_ios] | [LANG:login.recovery_password.abort_popup.cancel_ios] | QANOV-98219 |

  @jira.QANOV-5043 @android @automatic @cert0 @cert1 @ios @jira.cv.10.6 @jira.link.depends_on.QANOV-5042
  @jira.link.relates_to.NOV-94779 @live @mobile @next @o2uk @regression
  Scenario: User can exit "reset your password" process in any moment
    Given user is in the "O2uk Reset Password" page
     When clicks on the "navigation_top_bar.back_button" button
      And the "O2uk Abort Reset Password Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Splash Screen" page is displayed

  @jira.QANOV-5044 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5041 @jira.link.relates_to.NOV-63699 @manual
  @mobile @o2uk @regression
  Scenario: User can choose to reset the password using his/her email address
    Given user is in the "Reset Password" page
     When clicks on the "email_address_tab" tab
     Then the "email_address_tab" tab is selected
      And the "description" textfield with "[LANG:login.recovery_password.description_email]" text is displayed
      And the "email" inputtext with the "[LANG:login.recovery_password.email]" placeholder is displayed
      And the "continue" button with "[LANG:login.recovery_password.continue]" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5044 @jira.link.relates_to.NOV-63709 @manual
  @mobile @o2uk @regression
  Scenario Outline: User inserts wrong email to reset the password: error message will be shown
    Given user is in the "Reset Password" page
     When clicks on the "email_address_tab" tab
      And fills the "email" inputtext with the "<wrong_email>" text
      And clicks on the "continue" button
     Then the "error" textfield with "[LANG:login.recovery_password.email_error]" text is displayed
      And the "continue" button is disabled

    Examples:
          | wrong_email | jira_id    |
          | ssmith      | QANOV-5045 |
          | ssmith@myo2 | QANOV-5046 |

  @jira.QANOV-5047 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5044 @jira.link.relates_to.NOV-63706 @manual
  @mobile @o2uk @regression
  Scenario: User inserts his/her email to reset the password: user will be redirected to "check your email" screen
    Given user is in the "Reset Password" page
     When clicks on the "email_address_tab" tab
      And fills the "email" inputtext with the "[CONTEXT:user.email]" text
      And clicks on the "continue" button
     Then the "Check Email" page is displayed
      And the "[LANG:login.recovery_password.check_email.header]" header is displayed
      And the "first_text" textfield with "[LANG:login.recovery_password.check_email.first_text]" text is displayed
      And the "email" textfield with "[CONTEXT:user.email]" text is displayed
      And the "second_text" textfield with "[LANG:login.recovery_password.check_email.second_text]" text is displayed
      And the "not_received_email" link with "[LANG:login.recovery_password.check_email.not_received_email]" text is displayed
      And the "sign_in" link with "[LANG:login.recovery_password.check_email.sign_in]" text is displayed

  @jira.QANOV-5048 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5047 @jira.link.relates_to.NOV-65010 @manual
  @mobile @o2uk @regression
  Scenario: User can request another email to recover the password
    Given user is in the "Reset Password" page
     When clicks on the "email_address_tab" tab
      And fills the "email" inputtext with the "[CONTEXT:user.email]" text
      And clicks on the "continue" button
      And the "Check Email" page is displayed
      And clicks on the "not_received_email" link
     Then new email will be received in his/her email address

  @jira.QANOV-5049 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5047 @jira.link.relates_to.NOV-65011 @manual
  @mobile @o2uk @regression
  Scenario: User selects the link to sign with his/her known password
    Given user is in the "Reset Password" page
     When clicks on the "email_address_tab" tab
      And fills the "email" inputtext with the "[CONTEXT:user.email]" text
      And clicks on the "continue" button
      And the "Check Email" page is displayed
      And clicks on the "sign_in" link
     Then the "O2uk User Password Login" page is displayed
      And the "email_field" inputtext with the "[LANG:login.user_pwd_screen.email]" placeholder is displayed

  @jira.QANOV-5050 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5044 @jira.link.relates_to.NOV-63696 @manual
  @mobile @o2uk @regression
  Scenario: User can choose to reset the password using his/her mobile number
    Given user is in the "Reset Password" page
     When clicks on the "mobile_number_tab" tab
     Then the "mobile_number_tab" tab is selected
      And the "description" textfield with "[LANG:login.recovery_password.description_mobile_number]" text is displayed
      And the "mobile_number" inputtext with the "[LANG:login.recovery_password.mobile_number]" placeholder is displayed
      And the "continue" button with "[LANG:login.recovery_password.continue]" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5041 @jira.link.relates_to.NOV-63717 @manual
  @mobile @o2uk @regression
  Scenario Outline: User inserts a phone number with wrong format: an error message will be shown
    Given user is in the "Reset Password" page
     When clicks on the "mobile_number_tab" tab
      And fills the "mobile_number" inputtext with the "<wrong_mobile_number>" text
     Then the "error" textfield with "[LANG:login.recovery_password.mobile_number_error]" text is displayed
      And the "continue" button is disabled

    Examples:
          | wrong_mobile_number | jira_id    |
          | 447790              | QANOV-5051 |
          | 0000                | QANOV-5052 |

  @jira.QANOV-5053 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5050 @jira.link.detects.OBO2UK-1004
  @jira.link.relates_to.NOV-63701 @manual @mobile @o2uk @regression
  Scenario: User inserts a phone number not registered on O2: an error popup will be shown
    internal_checkpoint="CERT0 Business: testmyaccounsix1@yopmail.com / test123 (7798054321)"
    Given user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "07798054321" text
      And clicks on the "continue" button
     Then the "Not Registered" popup is displayed
      And the "popup.title" textfield with "[LANG:login.recovery_password.not_registered_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.recovery_password.not_registered_popup.message]" text is displayed
      And the "popup.accept" button with "[LANG:login.recovery_password.not_registered_popup.accept]" text is displayed

  @jira.QANOV-5054 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5050 @jira.link.detects.OBO2UK-1000
  @jira.link.detects.OBO2UK-1395 @jira.link.relates_to.NOV-63702 @manual @mobile @o2uk @regression
  Scenario: User inserts his/her phone number to reset the password: the user is redirected to "Verify your phone" screen
    internal_checkpoint="- The link 'Haven't you received the code?(time*)' can only be selected when the time will be
    zero. - The time will start in a minute"
    Given user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
     Then the "Verify Phone" page is displayed
      And the "[LANG:login.recovery_password.verify_phone.header]" header is displayed
      And the "description" textfield with "[LANG:login.recovery_password.verify_phone.description]" text is displayed
      And the "code" inputtext is displayed
      And the "code_not_received" link that contains the "[LANG:login.recovery_password.verify_phone.code_not_received]" text is displayed

  @jira.QANOV-5055 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5054 @jira.link.relates_to.NOV-63703 @manual
  @mobile @o2uk @regression
  Scenario: User can request a new SMS: new SMS will be received
    Given user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And waits "65" seconds
      And clicks on the "code_not_received" link
     Then a new sms is received
      And the timer of "code_not_received" link is reseated

  @jira.QANOV-5056 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5054 @jira.link.relates_to.NOV-63704 @manual
  @mobile @o2uk @regression
  Scenario: User inserts wrong verification PIN: error message will be shown
    Given user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the "00000" text
     Then the "error" textfield with "[LANG:login.recovery_password.verify_phone.error]" text is displayed

  @jira.QANOV-5057 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5056 @jira.link.relates_to.NOV-63705 @manual
  @mobile @o2uk @regression
  Scenario: User inserts wrong verification PIN 5 times: user will be blocked 24 hours
    Given user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the "000000" text
      And waits "2" seconds
      And fills the "code" inputtext with the "000000" text
      And waits "2" seconds
      And fills the "code" inputtext with the "000000" text
      And waits "2" seconds
      And fills the "code" inputtext with the "000000" text
      And waits "2" seconds
      And fills the "code" inputtext with the "000000" text
      And waits "2" seconds
     Then the "User Blocked" popup is displayed
      And the "popup.title" textfield with "[LANG:login.recovery_password.verify_phone.user_blocked_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.recovery_password.verify_phone.user_blocked_popup.message]" text is displayed

  @jira.QANOV-5058 @android @automation.pending_mock @impeded_mock @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5054
  @jira.link.relates_to.NOV-63710 @manual @mobile @o2uk @regression
  Scenario: User inserts the PIN received but hasn't an identity available for this number: error popup will be shown
    Given user has "no" identity available for this phone number
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
     Then the "Validation Error" popup is displayed
      And the "popup.title" textfield with "[LANG:login.user_pwd_screen.validation_error_popup.title]" text is displayed
      And the "popup.message" textfield with "[LANG:login.user_pwd_screen.validation_error_popup.message]" text is displayed

  @jira.QANOV-5059 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5054 @jira.link.relates_to.NOV-63716 @manual
  @mobile @o2uk @regression
  Scenario: User inserts the validation PIN and has only one identity for his/her number: user will be redirected to a single security question
    internal_checkpoint="Use the MSISDN 07521102495 and the SMS code 999999"
    Given user has "1" identity available for this phone number
      And user has several questions associated to that identity
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And fills the "code" inputtext with the pin code received
     Then the "Reset Password Answer" internal webview is displayed
      And the "[LANG:login.recovery_password.answer.header]" header is displayed
      And the "question" textfield is displayed
      And the "answer" inputtext with the "[LANG:login.recovery_password.answer.answer]" placeholder is displayed
      And the "continue" button with "[LANG:login.recovery_password.answer.continue]" text is displayed

  @jira.QANOV-5060 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5054 @jira.link.detects.OBO2UK-1283
  @jira.link.relates_to.NOV-63711 @manual @mobile @o2uk @regression
  Scenario: User inserts the validation PIN and has multiple identities for his/her number: user will be redirected to "email selection" screen
    internal_checkpoint="For CERT0 Msisdn: 447731296919 and SMS pin code is 999999"
    Given user has "several" identities available for this phone number
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
     Then the "Reset Password Accounts" internal webview is displayed
      And the "[LANG:login.recovery_password.accounts.header]" header is displayed
      And the "description" textfield with "[LANG:login.recovery_password.accounts.description]" text is displayed
      And the "account" list is displayed
      And the "select_account" button with "[LANG:login.recovery_password.accounts.select_account]" text is displayed
      And the "sign_in" link with "[LANG:login.recovery_password.accounts.sign_in]" text is displayed

  @jira.QANOV-5061 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5060 @jira.link.relates_to.NOV-63713 @manual
  @mobile @o2uk @regression
  Scenario: User with multiple identities picks one identity to recover the password: a list with security questions will be shown
    Given user has "several" identities available for this phone number
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Accounts" internal webview is displayed
      And selects the "1" element in the "account" list
      And clicks on the "select_account" button
     Then the "Reset Password Questions" internal webview is displayed
      And the "[LANG:login.recovery_password.questions.header]" header is displayed
      And the "description" textfield with "[LANG:login.recovery_password.questions.description]" text is displayed
      And the "question" list is displayed
      And the "continue" button with "[LANG:login.recovery_password.questions.continue]" text is displayed

  @jira.QANOV-5062 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5060 @jira.link.relates_to.NOV-63714 @manual
  @mobile @o2uk @regression
  Scenario: User with multiple identities picks one identity to recover the password: only one security question will be shown
    internal_checkpoint="For CERT0 Msisdn: 447731296919 and SMS pin code is 999999"
    Given user has "several" identities available for this phone number
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Accounts" internal webview is displayed
      And the "[LANG:login.recovery_password.accounts.header]" header is displayed
      And selects the "1" element in the "account" list
      And clicks on the "select_account" button
     Then the "Reset Password Answer" internal webview is displayed
      And the "[LANG:login.recovery_password.answer.header]" header is displayed
      And the "question" textfield is displayed
      And the "answer" inputtext with the "[LANG:login.recovery_password.answer.answer]" placeholder is displayed
      And the "continue" button with "[LANG:login.recovery_password.answer.continue]" text is displayed

  @jira.QANOV-5063 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5060 @jira.link.relates_to.NOV-65007 @manual
  @mobile @o2uk @regression
  Scenario: User who is in the identity selection screen decides to login with password instead of resetting password
    Given user has "several" identities available for this phone number
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Accounts" internal webview is displayed
      And clicks on the "sign_in" link
     Then the "O2uk User Password Login" page is displayed

  @jira.QANOV-5064 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5054 @jira.link.relates_to.NOV-63712 @manual
  @mobile @o2uk @regression
  Scenario: User inserts the validation PIN and has only one identity for his/her number: user will be redirected to a list of security questions
    internal_checkpoint="User the MSISDN 07731296935 with the SMS 999999 and the answer 'Uk' to the question 'Favorite sports team'."
    Given user has "1" identities available for this phone number
      And user has several questions associated to that identity
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
     Then the "Reset Password Questions" internal webview is displayed
      And the "[LANG:login.recovery_password.questions.header]" header is displayed
      And the "description" textfield with "[LANG:login.recovery_password.questions.description]" text is displayed
      And the "question" list is displayed
      And the "continue" button with "[LANG:login.recovery_password.questions.continue]" text is displayed

  @jira.QANOV-5065 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5064 @jira.link.relates_to.NOV-63680 @manual
  @mobile @o2uk @regression
  Scenario: User with several security questions picks one security question to recover the password
    Given user has "1" identities available for this phone number
      And user has several questions associated to that identity
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Questions" internal webview is displayed
      And selects the "1" element in the "question" list
      And clicks on the "continue" button
     Then the "Reset Password Answer" internal webview is displayed
      And the "[LANG:login.recovery_password.answer.header]" header is displayed
      And the "question" textfield is displayed
      And the "answer" inputtext with the "[LANG:login.recovery_password.answer.answer]" placeholder is displayed
      And the "continue" button with "[LANG:login.recovery_password.answer.continue]" text is displayed

  @jira.QANOV-5071 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5065 @jira.link.relates_to.NOV-63687 @manual
  @mobile @o2uk @regression
  Scenario: User inserts the wrong answer to the security question
    Given user has "1" identities available for this phone number
      And user has several questions associated to that identity
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Questions" internal webview is displayed
      And selects the "1" element in the "question" list
      And clicks on the "continue" button
      And the "Reset Password Answer" internal webview is displayed
      And fills the "answer" inputtext with the "wrong answer" text
      And clicks on the "continue" button
     Then the "error" textfield with "[LANG:login.recovery_password.answer.error]" text is displayed

  @jira.QANOV-5080 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5065 @jira.link.relates_to.NOV-63681 @manual
  @mobile @o2uk @regression
  Scenario: User inserts the proper answer to the security question
    Given user has "1" identities available for this phone number
      And user has several questions associated to that identity
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Questions" internal webview is displayed
      And selects the "1" element in the "question" list
      And clicks on the "continue" button
      And the "Reset Password Answer" internal webview is displayed
      And fills the "answer" inputtext with the "right answer" text
      And clicks on the "continue" button
     Then the "Reset Password New Password" internal webview is displayed
      And the "[LANG:login.recovery_password.new_password.header]" header is displayed
      And the "new_password" inputtext with the "[LANG:login.recovery_password.new_password.new_password]" placeholder is displayed
      And the "repeat_password" inputtext with the "[LANG:login.recovery_password.new_password.repeat_password]" placeholder is displayed
      And the "logout_all_devices" checkbox with "[LANG:login.recovery_password.new_password.logout_all_devices]" text is displayed
      And the "save_changes" button with "[LANG:login.recovery_password.new_password.save_changes]" text is displayed

  @jira.QANOV-5089 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5080 @jira.link.relates_to.NOV-63690 @manual
  @mobile @o2uk @regression
  Scenario: User inserts mismatched passwords
    Given user has "1" identities available for this phone number
      And user has several questions associated to that identity
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Questions" internal webview is displayed
      And selects the "1" element in the "question" list
      And clicks on the "continue" button
      And the "Reset Password Answer" internal webview is displayed
      And fills the "answer" inputtext with the "right answer" text
      And clicks on the "continue" button
      And the "Reset Password New Password" internal webview is displayed
      And fills the "new_password" inputtext with the "test123" text
      And fills the "repeat_password" inputtext with the "test1234" text
     Then the "error" textfield with "[LANG:login.recovery_password.new_password.mismatches_passwords]" text is displayed
      And the "save_changes" button is disabled

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5080 @jira.link.relates_to.NOV-65008 @manual
  @mobile @o2uk @regression
  Scenario Outline: User inserts invalid passwords
    internal_checkpoint="password can not have more than 256 characters or less than 7 characters"
    Given user has "1" identities available for this phone number
      And user has several questions associated to that identity
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Questions" internal webview is displayed
      And selects the "1" element in the "question" list
      And clicks on the "continue" button
      And the "Reset Password Answer" internal webview is displayed
      And fills the "answer" inputtext with the "right answer" text
      And clicks on the "continue" button
      And the "Reset Password New Password" internal webview is displayed
      And fills the "new_password" inputtext with the "<invalid_password>" text
      And fills the "repeat_password" inputtext with the "<invalid_password>" text
     Then the "error" textfield with "[LANG:login.recovery_password.new_password.invalid_password]" text is displayed
      And the "save_changes" button is disabled

    Examples:
          | invalid_password | jira_id    |
          | short            | QANOV-5096 |
          | more_than_256    | QANOV-5105 |

  @jira.QANOV-5114 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5080 @jira.link.detects.OBO2UK-1284
  @jira.link.relates_to.NOV-63688 @manual @mobile @o2uk @smoke
  Scenario: User inserts the new password successfully
    Given user has "1" identities available for this phone number
      And user has several questions associated to that identity
      And user is in the "Reset Password" page
     When fills the "mobile_number" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue" button
      And the "Verify Phone" page is displayed
      And fills the "code" inputtext with the pin code received
      And the "Reset Password Questions" internal webview is displayed
      And selects the "1" element in the "question" list
      And clicks on the "continue" button
      And the "Reset Password Answer" internal webview is displayed
      And fills the "answer" inputtext with the "right answer" text
      And clicks on the "continue" button
      And the "Reset Password New Password" internal webview is displayed
      And fills the "new_password" inputtext with the "test123" text
      And fills the "repeat_password" inputtext with the "test123" text
      And clicks on the "save_changes" button
     Then the "[CONF:landing_tab]" page is displayed

  @jira.QANOV-5123 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-63698
  @no_automatable @mobile @o2uk @regression
  Scenario: User with SIM and multiple identities associated to the specific brand SIM in the device can access to recovery password screen
    commented_tags="@depends_on.NOV-47603 @depends_on.NOV-175385"
    Given user has a O2 SIM in the device
      And user has "several" identities available for this phone number
      And user is in the "O2uk User Password Login" page
     When clicks on the "forgotten_log_in_details" link
     Then the "Reset Password Accounts" internal webview is displayed
      And the "[LANG:login.recovery_password.accounts.header]" header is displayed
      And the "description" textfield with "[LANG:login.recovery_password.accounts.description]" text is displayed
      And the "account" list is displayed
      And the "select_account" button with "[LANG:login.recovery_password.accounts.select_account]" text is displayed
      And the "sign_in" link with "[LANG:login.recovery_password.accounts.sign_in]" text is displayed

  @jira.QANOV-5131 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-5123
  @jira.link.relates_to.NOV-65006 @no_automatable @mobile @o2uk @regression
  Scenario: User with SIM, who is in the identity selection screen decides to login with password instead of resetting password
    internal_checkpoint="CERT0: User 447731296919"
    Given user has a O2 SIM in the device
      And user has "several" identities available for this phone number
      And user is in the "O2uk User Password Login" page
     When clicks on the "forgotten_log_in_details" link
      And the "Reset Password Accounts" internal webview is displayed
      And clicks on the "sign_in" link
     Then the "O2uk User Password Login" page is displayed
      And the "email_field" inputtext with the "[CONTEXT:user.email]" placeholder is displayed

  @jira.QANOV-25158 @android @automatic @jira.cv.12.0 @jira.link.detects.VIVO-2119
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.parent_test_plan.QANOV-360674
  @live @mobile @next @sanity @vivobr @old_app
  Scenario: Vivo user can recover their password on Android devices
    Given user is in the "Vivobr Credentials Login" page
      And clicks on the "selector_tab.password_selector" tab
      And waits "5" seconds
      And clicks on the "identifier_inputtext" button
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And I hide the keyboard
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And clicks on the "recover_pass_link" link
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Quit Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-214256 @automatic @ios @jira.cv.12.0 @jira.link.detects.VIVO-2119
  @jira.link.parent_test_plan.QANOV-21791 @jira.link.parent_test_plan.QANOV-360674
  @live @mobile @next @sanity @vivobr @old_app
  Scenario: Vivo user can recover their password on iOS devices
    Given user is in the "Vivobr Credentials Login" page
      And clicks on the "selector_tab.password_selector" tab
      And waits "5" seconds
      And clicks on the "identifier_inputtext" button
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "Vivobr Password Login" page is displayed
      And clicks on the "recover_pass_link" link
     Then the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Quit Popup" popup is displayed
      And clicks on the "popup.accept" button
      And the "Splash Screen" page is displayed

  @jira.<jira_id> @<execution_mode> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @mobile
  @sanity @cert3 @live @next
  Scenario Outline: A user can recover the password from "<page>" screen
    Given user has set the cookies preferences
      And user is in the "<page>" page
     When clicks on the "forgot_your_password_link" link
     Then the custom tab webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

    Examples:
          | product | cv   | page                     | depends_on   | execution_mode | jira_id      |
          | blaude  | 13.9 | Blaude Credentials Login | QANOV-230132 | manual         | QANOV-230176 |
          | o2de    | 14.2 | O2de Credentials Login   | QANOV-230133 | manual         | QANOV-230178 |

  @jira.QANOV-230177 @automatic @<blaude @android @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-230134 @mobile
  @smoke @cert3 @live @next
  Scenario: A user can recover the password from "Blaude Credentials Login" screen
    Given user has set the cookies preferences
      And user is in the "Blaude Credentials Login" page
     When clicks on the "forgot_your_password_link" link
     Then the custom tab webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed

  @jira.QANOV-230179 @manual @o2de @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-230135 @mobile
  @smoke @cert3 @live @next
  Scenario: A user can recover the password from "O2de Password Login" screen
    Given user has set the cookies preferences
      And user is in the "O2de Credentials Login" page
      And fills the "identifier_inputtext" inputtext with the "[CONTEXT:user.user_login]" text
      And clicks on the "continue_button" button
      And the "O2de Password Login" page is displayed
     When clicks on the "forgot_your_password_link" link
     Then the custom tab webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Splash Screen" page is displayed
