# -*- coding: utf-8 -*-
@jira.QANOV-1385
Feature: Multilogin

  Actions Before each Scenario:
    Given user is in the "Profile" page


  @jira.QANOV-1405 @account_chooser_deprecate @android @automatic @ios @jira.cv.9.14 @jira.link.depends_on.QANOV-1407
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-13481 @live @mobile @next @smoke @vivobr @har
  Scenario: User can access to the login screen to add another line
    Given user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
     Then the "Vivobr Credentials Login" page is displayed

  @jira.QANOV-355911 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr @har
  Scenario: User without credentials saved can access to the login screen to add another line
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
     Then the "Vivobr Credentials Login" page is displayed

  @jira.QANOV-355912 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke @vivobr @har
  Scenario: User with credentials saved can access to the login screen to add another line
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
     Then the "Account Chooser" page is displayed

  @jira.QANOV-1406 @account_chooser_deprecate @android @automation.hard @ios @jira.cv.10.5 @jira.link.detects.APPS-7721
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-64173 @manual @mobile @regression @vivobr @har
  Scenario: User can add a line that never logged in before
    Given user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a "not_registered" line
     Then the "Profile" page is displayed
      And the "subtitle" textfield with "[CONTEXT:user.number_formatted]" text is displayed

  @jira.QANOV-355913 @android @automation.hard @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr @har
  Scenario: User without credentials saved can add a line that never logged in before
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a "not_registered" line
     Then the "Profile" page is displayed
      And the "subtitle" textfield with "[CONTEXT:user.number_formatted]" text is displayed

  @jira.QANOV-355914 @android @automation.hard @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario: User with credentials saved can add a line that never logged in before
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Account Chooser" page is displayed
      And clicks on the "sign_in_with_another_credential" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a "not_registered" line
     Then the "Profile" page is displayed
      And the "subtitle" textfield with "[CONTEXT:user.number_formatted]" text is displayed

  @jira.QANOV-1407 @account_chooser_deprecate @android @automatic @ber @ios @jira.cv.10.5 @jira.link.detects.ANDROID-10381
  @jira.link.detects.APPS-7721 @jira.link.parent_test_plan.QANOV-200803 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-64174 @live @mobile @next @sanity @vivobr
  Scenario: User can add a registered line with CPF
    Given user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a registered line with cpf
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONF:user_info.name]" text is displayed

  @jira.QANOV-355915 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @sanity @vivobr
  Scenario: User without credentials saved can add a registered line with CPF
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a registered line with cpf
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONF:user_info.name]" text is displayed

  @jira.QANOV-355916 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr @har
  Scenario: User with credentials saved can add a registered line with CPF from "Vivobr Credentials Login" page
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Account Chooser" page is displayed
      And clicks on the "sign_in_with_another_credential" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a registered line with cpf
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONF:user_info.name]" text is displayed

  @jira.QANOV-355917 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @sanity @vivobr
  Scenario: User with credentials saved can add a registered line with CPF from "Account Chooser" page
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Account Chooser" page is displayed
      And clicks on any element in the "user_4P_stored_credentials" list
     Then the "Profile" page is displayed
      And the "title" textfield with "[CONF:user_info.name]" text is displayed

  @jira.QANOV-1408 @account_chooser_deprecate @android @ios @jira.cv.9.15 @jira.link.detects.EXPLORE-2654
  @jira.link.relates_to.NOV-12964 @manual @mobile @regression @vivobr @old_app
  Scenario: User can add a registered line already added to that app
    Given user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a line already added to the application
     Then the "Profile" page is displayed
      And clicks on the "user_selector" button
      And the "[CONTEXT:user.number_formatted]" text is not shown twice in "users_logged" list

  @jira.QANOV-519045 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: User can add a registered line already added to that app
    Given user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a line already added to the application
     Then the landing tab page is displayed
      And clicks on the "navigation_top_bar.menu_mais" tab
      And the "Menu Mais" page is displayed
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "user_selector" button
      And the "[CONTEXT:user.number_formatted]" text is not shown twice in "users_logged" list

  @jira.QANOV-355918 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519 @manual @mobile @regression
  @vivobr @old_app
  Scenario: User without credentials saved can add a registered line already added to that app
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a line already added to the application
     Then the "Profile" page is displayed
      And clicks on the "user_selector" button
      And the "[CONTEXT:user.number_formatted]" text is not shown twice in "users_logged" list

  @jira.QANOV-519046 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: User without credentials saved can add a registered line already added to that app
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a line already added to the application
     Then the landing tab page is displayed
      And clicks on the "navigation_top_bar.menu_mais" tab
      And the "Menu Mais" page is displayed
      And clicks on the "navigation_top_bar.profile_icon" icon
      And the "Profile" page is displayed
      And clicks on the "user_selector" button
      And the "[CONTEXT:user.number_formatted]" text is not shown twice in "users_logged" list

  @jira.QANOV-355919 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario: User with credentials saved can add a registered line already added to that app from "Vivobr Credentials Login" page
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Account Chooser" page is displayed
      And clicks on the "sign_in_with_another_credential" button
      And the "Vivobr Credentials Login" page is displayed
      And logs in the application with a line already added to the application
     Then the "Profile" page is displayed
      And clicks on the "user_selector" button
      And the "[CONTEXT:user.number_formatted]" text is not shown twice in "users_logged" list

  @jira.QANOV-355920 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr
  Scenario: User with credentials saved can add a registered line already added to that app from "Account Chooser" page
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Account Chooser" page is displayed
      And clicks on a line already added to the application in the "user_4P_stored_credentials" list
      And the "Profile" page is displayed
      And clicks on the "user_selector" button
     Then the "[CONTEXT:user.number_formatted]" text is not shown twice in "users_logged" list

  @jira.QANOV-1409 @android @ios @jira.cv.9.14 @jira.link.detects.APPS-6843 @jira.link.parent_test_plan.QANOV-200803
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-13279 @manual
  @mobile @smoke @vivobr @old_app
  Scenario: User can switch among lines in the same app
    Given user is logged in the application with "several" lines
     When clicks on the "user_selector" button
      And clicks on the "user_selector" button
      And an element in the "users_logged" list has the "number" textfield not equal to "[CONTEXT:user.number_formatted]" text
      And clicks on the "[CONTEXT:user_logged.number]" textfield
     Then the "Profile" page is displayed
      And the "subtitle" textfield with "[CONTEXT:user_logged.number]" text is displayed
      And the "change_sessions_text" warning with "Voce trocou de conta" text is displayed
      And the "change_sessions_button" warning with "Fechar" text is displayed

  @jira.QANOV-519047 @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke
  @vivobr
  Scenario: Android user can switch among lines in the same app
    Given user is logged in the application with "several" lines
     When clicks on the "user_selector" button
      And clicks on the "user_selector" button
      And an element in the "users_logged" list has the "number" textfield not equal to "[CONTEXT:user.number_formatted]" text
      And clicks on the "[CONTEXT:user_logged.number]" textfield
     Then the "Profile" page is displayed
      And the "subtitle" textfield with "[CONTEXT:user_logged.number]" text is displayed
      And the "change_sessions_text" warning with "Voce trocou de conta" text is displayed
      And the "change_sessions_button" warning with "Fechar" text is displayed

  @jira.QANOV-519048 @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke
  @vivobr @har
  Scenario: iOS user can switch among lines in the same app
    Given user is logged in the application with "several" lines
     When clicks on the "user_selector" button
      And an element in the "users_logged" list has the "number" textfield not equal to "[CONTEXT:user.number_formatted]" text
      And clicks on the "[CONTEXT:user_logged.number]" textfield
     Then the "Assinaturas" page is displayed
      And the "subtitle" textfield with "[CONTEXT:user_logged.number]" text is displayed
      And the "change_sessions_text" warning with "Voce trocou de conta" text is displayed
      And the "change_sessions_button" warning with "Fechar" text is displayed

  @jira.QANOV-1411 @account_chooser_deprecate @android @automation.hard @ios @jira.cv.9.15 @old_app
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-13272 @manual @mobile @regression @vivobr
  Scenario: User cannot add a line that never logged in before with invalid code
    Given user is logged in the application with "less" than "10" users
      And user is "not_registered" with one line in the application
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with wrong otac
     Then the "error" textfield with "Código Incorreto. Você tem mais 2 tentativas." text is displayed

  @jira.QANOV-355921 @android @automation.hard @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr @old_app
  Scenario: User without credentials saved cannot add a line that never logged in before with invalid code
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is logged in the application with "less" than "10" users
      And user is "not_registered" with one line in the application
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with wrong otac
     Then the "error" textfield with "Código Incorreto. Você tem mais 2 tentativas." text is displayed

  @jira.QANOV-355922 @android @automation.hard @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr @old_app
  Scenario: User with credentials saved cannot add a line that never logged in before with invalid code
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
      And user is "not_registered" with one line in the application
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Account Chooser" page is displayed
      And clicks on the "sign_in_with_another_credential" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with wrong otac
     Then the "error" textfield with "Código Incorreto. Você tem mais 2 tentativas." text is displayed

  @jira.QANOV-1412 @account_chooser_deprecate @android @ios @jira.cv.9.15 @jira.link.parent_test_plan.QANOV-437387
  @jira.link.relates_to.NOV-12867 @manual @mobile @regression @vivobr @old_app
  Scenario: User cannot add a registered line with invalid code
    Given user is logged in the application with "less" than "10" users
      And user is "registered" in the application
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with wrong otac
     Then the "error" textfield with "Código Incorreto. Você tem mais 2 tentativas." text is displayed

  @jira.QANOV-355923 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr @old_app
  Scenario: User without credentials saved cannot add a registered line with invalid code
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is logged in the application with "less" than "10" users
      And user is "registered" in the application
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with wrong otac
     Then the "error" textfield with "Código Incorreto. Você tem mais 2 tentativas." text is displayed

  @jira.QANOV-355924 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr @old_app
  Scenario: User with credentials saved cannot add a registered line with invalid code
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
      And user is "registered" in the application
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Account Chooser" page is displayed
      And clicks on the "sign_in_with_another_credential" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "[CONTEXT:user.number]" text
      And clicks on the "continue_button" button
      And the "Vivobr Otac Login" page is displayed
      And fills "otac_edit_box" inputext with wrong otac
     Then the "error" textfield with "Código Incorreto. Você tem mais 2 tentativas." text is displayed

  @jira.<jira_id> @account_chooser_deprecate @android @ios @jira.cv.9.14 @jira.link.parent_test_plan.QANOV-437387
  @jira.link.relates_to.NOV-13274 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User cannot add an invalid line: an error is shown after inserting the phone number
    Given user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "<phone_number>" text
     Then the "error" textfield with the "[LANG:login.phone_number.error]" text is displayed under the "number_edit_box" field

    Examples:
          | phone_number | jira_id    |
          | 00000000000  | QANOV-1413 |
          | 123456789    | QANOV-1414 |
          | 9112345678   | QANOV-1415 |
          | 190          | QANOV-1416 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User without credentials saved cannot add an invalid line: an error is shown after inserting the phone number
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And no credentials are saved in 4P
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "<phone_number>" text
     Then the "error" textfield with the "[LANG:login.phone_number.error]" text is displayed under the "number_edit_box" field

    Examples:
          | phone_number | jira_id      |
          | 00000000000  | QANOV-355925 |
          | 123456789    | QANOV-355926 |
          | 9112345678   | QANOV-355927 |
          | 190          | QANOV-355928 |

  @jira.<jira_id> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-326519
  @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression @vivobr @old_app
  Scenario Outline: User with credentials saved cannot add an invalid line: an error is shown after inserting the phone number
    Given cookies are enabled in the browser
      And saving credentials are enabled in 4P
      And user has "any" credentials saved in 4P
      And credentials are not expired
      And user is logged in the application with "less" than "10" users
     When clicks on the "user_selector" button
      And clicks on the "profile_add" button
      And the "Account Chooser" page is displayed
      And clicks on the "sign_in_with_another_credential" button
      And the "Vivobr Credentials Login" page is displayed
      And fills the "number_edit_box" inputtext with the "<phone_number>" text
     Then the "error" textfield with the "[LANG:login.phone_number.error]" text is displayed under the "number_edit_box" field

    Examples:
          | phone_number | jira_id      |
          | 00000000000  | QANOV-355929 |
          | 123456789    | QANOV-355930 |
          | 9112345678   | QANOV-355931 |
          | 190          | QANOV-355932 |

  @jira.QANOV-1417 @android @automation.hard @ios @jira.cv.9.14 @jira.link.parent_test_plan.QANOV-437387
  @jira.link.relates_to.NOV-12965 @manual @mobile @regression @vivobr
  Scenario: User cannot add more than 10 lines
    Given user is logged in the application with "equal" to "10" users
     When clicks on the "user_selector" button
     Then the "more_ten_lines" textfield with "Você não pode gerenciar mais de 10 linhas" text is displayed
      And the "add_line" button is not displayed

  @jira.QANOV-1419 @android @ios @jira.cv.10.0 @jira.link.detects.APPS-7079 @jira.link.parent_test_plan.QANOV-200803
  @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-32473 @manual @mobile @smoke @vivobr
  Scenario: User who switches to another line can access to the account section successfully
    Given user is logged in the application with "several" lines
     When clicks on the "user_selector" button
      And clicks on any element in the "users_logged" list
      And clicks on the "navigation_top_bar.back_button" button
      And clicks on the "navigation_tab_bar.account_tab" tab
     Then the "Account" page is displayed

  @jira.QANOV-116640 @android @ios @jira.cv.12.5 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @smoke
  @vivobr
  Scenario: User who switches to another line can access to the start tab section successfully
    Given user is logged in the application with "several" lines
     When clicks on the "user_selector" button
      And clicks on any element in the "users_logged" list
      And clicks on the "navigation_top_bar.back_button" button
      And clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed

  @jira.QANOV-1420 @android @ios @jira.cv.9.15 @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-13251
  @manual @mobile @regression @vivobr
  Scenario: User without data connection cannot add another line
     When turns on the Airplane mode
      And clicks on the "user_selector" button
     Then the "add_line" button is disabled

  @jira.QANOV-1421 @android @ios @jira.cv.9.14 @jira.link.parent_test_plan.QANOV-437387 @jira.link.relates_to.NOV-13280
  @manual @mobile @regression @vivobr
  Scenario: User without data connection cannot switch among lines in the same app
     When turns on the Airplane mode
      And clicks on the "user_selector" button
     Then the "users_logged" list is disabled

  @jira.QANOV-1422 @android @automation.hard @ios @jira.cv.9.14 @jira.link.parent_test_plan.QANOV-437387
  @jira.link.relates_to.NOV-13374 @manual @mobile @regression @vivobr
  Scenario: User with several added lines can be logged out from the app remotely
    Given user is logged in the application with "several" lines on the "device1" device
      And user is logged with same line on the "device2" device
      And user is in the "Session Management" page on the "device2" device
     When clicks on the "close_other_sessions" link on the "device2" device
      And the "Close Session" popup is displayed on the "device2" device
      And clicks on the "popup.accept" button on the "device2" device
     Then user is logged out from current line on the "device1" device
      And the "Profile" page is displayed on the "device1" device
      And user is logged with first line that is shown in header dropdown on the "device1" device

  @jira.QANOV-44520 @android @ios @jira.cv.11.15 @manual @mobile @regression @vivobr
  Scenario: User cannot select more than one line in the user selector
    Given user is logged in the application with "several" lines
     When clicks on the "user_selector" button
      And clicks on any element in the "users_logged" list
     Then the "users_logged" list is not displayed
      And the "Profile" page is displayed

  @jira.QANOV-519049 @android @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-437387 @manual @mobile @regression
  @vivobr
  Scenario: User cannot select more than one line in the user selector
    Given user is logged in the application with "several" lines
     When clicks on the "user_selector" button
      And clicks on any element in the "users_logged" list
     Then the "users_logged" list is not displayed
      And the "[CONF:landing_tab]" page is displayed
