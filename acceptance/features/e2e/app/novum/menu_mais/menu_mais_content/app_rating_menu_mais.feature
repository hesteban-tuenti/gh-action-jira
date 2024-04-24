# -*- coding: utf-8 -*-
@jira.QANOV-406768
Feature: App rating menu mais

  Actions Before the Feature:
    Given user has the "[LANG:mais.about_app.rate_app_title]" entrypoint configured in CMS for the "TBD" list
      And app rating is "enabled"

  Actions After the Feature:
    Given app rating is "disabled"


  @jira.QANOV-406769 @TBD @android @ber @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-392309 @manual @mobile @smoke
  @vivobr @har
  Scenario: Vivo user can see the app rating popup in Android devices
    Given user is in the "Menu Mais" page
     When clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "TBD" list
     Then the "Popup Rate Stars" popup is displayed
      And the "movistar_logo" image is displayed
      And the "title_textfield" textfield with "[LANG:app_rating.app_rating_android.title]" text is displayed
      And the "message_textfield" textfield that contains the "[LANG:app_rating.app_rating_android.message]" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "[LANG:app_rating.app_rating_android.button]" text is displayed
      And user has not selected any stars on "rating_star_bar" rating bar
      And clicks on the "not_now_button" button
      And the "Menu Mais" page is displayed

  @jira.QANOV-406770 @TBD @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-392309 @manual @mobile @smoke
  @vivobr @har
  Scenario: Vivo user can cancel to send a rating in Android devices
    Given user is in the "Menu Mais" page
     When clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "TBD" list
      And the "Popup Rate Stars" popup is displayed
      And clicks on the "not_now_button" button
     Then the "Menu Mais" page is displayed

  @jira.<jira_id> @<ber> @<test_priority> @TBD @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-392309 @manual
  @mobile @vivobr
  Scenario Outline: Vivo user can rate the app positively in Android devices
    internal_checkpoint="NOTE: If the app used for testing is not the Store one the Play Store will still be opened but with a not found message
    Check action triggers in the appRating config file for the relevant environment, e.g. for vivo:
    https://fisheye.tuenti.io/browse/unified_config/environment/novum/vivo-br/app-rating/appRating.yaml?hb=true"
    Given user is in the "Menu Mais" page
     When clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "TBD" list
      And the "Popup Rate Stars" popup is displayed
      And clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Play Store" app is displayed
      And the "Store" page is displayed
      And the "app_name" textfield that contains the "Vivo" text is displayed
      And clicks on the native "back" button
      And the "Menu Mais" page is displayed

    Examples:
          | number_stars | test_priority | ber | jira_id      |
          | 4            | smoke         | ber | QANOV-406771 |
          | 5            | sanity        |     | QANOV-406772 |

  @jira.<jira_id> @<test_priority> @TBD @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-392309 @manual @mobile
  @vivobr @<har>
  Scenario Outline: Vivo user can send feedback after a negative rating in Android devices
    Given user is in the "Menu Mais" page
     When clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "TBD" list
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
      And the "Menu Mais" page is displayed

    Examples:
          | number_stars | test_priority | har | jira_id      |
          | 1            | regression    |     | QANOV-406773 |
          | 2            | regression    |     | QANOV-406774 |
          | 3            | smoke         | har | QANOV-406775 |

  @jira.QANOV-406776 @TBD @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-392309 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user can close the feedback screen without sending it in Android devices
    Given user is in the "Menu Mais" page
     When clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "TBD" list
      And the "Popup Rate Stars" popup is displayed
      And clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Menu Mais" page is displayed

  @jira.QANOV-406777 @TBD @android @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-392309 @manual @mobile @regression
  @vivobr
  Scenario: Vivo user can go back to the previous tab after providing feedback in Android devices
    Given user is in the "Menu Mais" page
     When clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "TBD" list
      And the "Popup Rate Stars" popup is displayed
      And clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "App rating test" text
      And clicks on the "send_button" button
      And the "App Rating Feedback Success" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Menu Mais" page is displayed

  @jira.QANOV-406778 @TBD @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-392309 @manual @mobile @sanity
  @vivobr
  Scenario: Vivo user can go to the App Store to rate the app on iOS devices
    Given user is in the "Menu Mais" page
     When clicks on the element with "title" field with "[LANG:mais.about_app.rate_app_title]" value of the "TBD" list
     Then the "Apple Store" app is displayed
      And goes back to the app
      And the "Menu Mais" page is displayed
