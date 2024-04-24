# -*- coding: utf-8 -*-
@jira.QANOV-251624
Feature: App rating tab mais

  Actions Before the Feature:
    Given user has the "services-summary-2" module configured in CMS for "tab-mais-landing" page
      And user has the "[LANG:mais.main.about_app_title]" entrypoint configured in CMS for the "outras-opcoes-tab-mais-start" list
      And app rating is "enabled"

  Actions After the Feature:
    Given app rating is "disabled"

  @jira.QANOV-251625 @android @ber @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @automatic @mobile @smoke @vivobr
  @qa @next @live @old_app @har
  Scenario: Vivo user can see the app rating popup in Android devices
    Given user is in the "Tab Mais" page
     When clicks on the element with "title" field with "[LANG:mais.main.about_app_title]" value of the "other_options_list" list
      And the "About Vivo" page is displayed
      And clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "options_list" list
     Then the "Popup Rate Stars" popup is displayed
      And the "movistar_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed
      And clicks on the "not_now_button" button
      And the "About Vivo" page is displayed

  @jira.QANOV-251626 @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @automatic @mobile @smoke @vivobr
  @qa @next @live @old_app
  Scenario: Vivo user can cancel to send a rating in Android devices
    Given user is in the "Tab Mais" page
     When clicks on the element with "title" field with "[LANG:mais.main.about_app_title]" value of the "other_options_list" list
      And the "About Vivo" page is displayed
      And clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "options_list" list
      And the "Popup Rate Stars" popup is displayed
      And clicks on the "not_now_button" button
     Then the "About Vivo" page is displayed

  @jira.<jira_id> @<ber> @<test_priority> @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @automatic
  @mobile @vivobr @next @live @old_app
  Scenario Outline: Vivo user can rate the app positively in Android devices
    internal_checkpoint="NOTE: If the app used for testing is not the Store one the Play Store will still be opened but with a not found message
    Check action triggers in the appRating config file for the relevant environment, e.g. for vivo:
    https://fisheye.tuenti.io/browse/unified_config/environment/novum/vivo-br/app-rating/appRating.yaml?hb=true"
    Given user is in the "Tab Mais" page
     When clicks on the element with "title" field with "[LANG:mais.main.about_app_title]" value of the "other_options_list" list
      And the "About Vivo" page is displayed
      And clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "options_list" list
      And the "Popup Rate Stars" popup is displayed
      And clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Play Store" app is displayed
      And the "Store" page is displayed
      And the "app_name" textfield that contains the "Vivo" text is displayed
      And clicks on the native "back" button
      And the "About Vivo" page is displayed

    Examples:
          | number_stars | test_priority | ber | jira_id      |
          | 4            | smoke         | ber | QANOV-251627 |
          | 5            | sanity        |     | QANOV-251628 |

  @jira.<jira_id> @<test_priority> @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile
  @vivobr @old_app
  Scenario Outline: Vivo user can send feedback after a negative rating in Android devices
    Given user is in the "Tab Mais" page
     When clicks on the element with "title" field with "[LANG:mais.main.about_app_title]" value of the "other_options_list" list
      And the "About Vivo" page is displayed
      And clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "options_list" list
      And the "Popup Rate Stars" popup is displayed
      And clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "App rating test" text
      And clicks on the "send_button" button
     Then the "App Rating Feedback Success" page is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "title" textfield with "[LANG:app_rating.feedback_success.title]" text is displayed
      And the "text" textfield with "[LANG:app_rating.feedback_success.subtitle]" text is displayed
      And the "close_button" button with "[LANG:app_rating.feedback_success.close_button]" text is displayed
      And clicks on the "close_button" button
      And the "About Vivo" page is displayed

    Examples:
          | number_stars | test_priority | jira_id      |
          | 1            | regression    | QANOV-251629 |
          | 2            | regression    | QANOV-251630 |
          | 3            | smoke         | QANOV-251631 |

  @jira.QANOV-251632 @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @regression @vivobr
  @old_app
  Scenario: Vivo user can close the feedback screen without sending it in Android devices
    Given user is in the "Tab Mais" page
     When clicks on the "other_options_list.about_vivo" entrypoint
      And the "About Vivo" page is displayed
      And clicks on the "app_da_vivo" entrypoint
      And the App Rating popup is displayed
      And clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "About Vivo" page is displayed

  @jira.QANOV-251633 @android @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @regression @vivobr
  @old_app
  Scenario: Vivo user can go back to the previous tab after providing feedback in Android devices
    Given user is in the "Tab Mais" page
     When clicks on the "other_options_list.about_vivo" entrypoint
      And the "About Vivo" page is displayed
      And clicks on the "app_da_vivo" entrypoint
      And the App Rating popup is displayed
      And clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "App rating test" text
      And clicks on the "send_button" button
      And the "App Rating Feedback Success" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "About Vivo" page is displayed

  @jira.QANOV-251635 @ber @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @automatic @mobile @sanity
  @vivobr @qa @next @live @old_app
  Scenario: Vivo user can go to the App Store to rate the app on iOS devices
    Given user has the "[LANG:mais.about_app.rate_app_title]" entrypoint configured in CMS for the "sobre-o-app-tab-mais-start" list
      And user is in the "Tab Mais" page
     When clicks on the element with "title" field with "[LANG:mais.main.about_app_title]" value of the "other_options_list" list
      And the "About Vivo" page is displayed
      And clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "options_list" list
     Then the "Apple Store" app is displayed
      And goes back to the app
      And the "About Vivo" page is displayed

  @jira.QANOV-251636 @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @smoke @vivobr @old_app
  Scenario: Vivo user can discard to rate the app in iOS devices
    Given user is in the "Tab Mais" page
     When clicks on the "other_options_list.about_vivo" entrypoint
      And the "About Vivo" page is displayed
      And clicks on the "app_da_vivo" entrypoint
      And the App Rating popup is displayed
      And clicks on the "not_now_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "About Vivo" page is displayed

  @jira.QANOV-251637 @ios @jira.cv.13.8 @jira.link.parent_test_plan.QANOV-241065 @manual @mobile @smoke @vivobr @old_app
  Scenario: Vivo user can discard to rate the app after select stars in iOS devices
    Given user is in the "Tab Mais" page
     When clicks on the "other_options_list.about_vivo" entrypoint
      And the "About Vivo" page is displayed
      And clicks on the "app_da_vivo" entrypoint
      And the App Rating popup is displayed
      And clicks on "any" stars on "rating_star_bar" rating bar
      And clicks on the "cancel_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the "About Vivo" page is displayed
