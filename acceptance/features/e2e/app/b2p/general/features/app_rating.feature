# -*- coding: utf-8 -*-
@jira.QABP-139
Feature: App Rating


  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user will see the App Rating popup when an event is received after making a trigger
    App raring can be displayed a maxium of 3 times.
    The "Test App Rating Webview" is an OB webview that can send the event to show the App rating
    Given user has never rated the application
      And user is in the "Test App Rating Webview" page
     When clicks on the "test_app_rating_link" link
     Then the "Popup Rate Stars" popup is displayed
      And the "title_textfield" textfield with "<title>" text is displayed
      And the "message_textfield" textfield that contains the "<message>" text is displayed
      And the "rating_star_bar" image is displayed
      And the "not_now_button" button with "<button>" text is displayed
      And the "send_button" button is not displayed

    Examples:
          | product | cv     | client  | title                                      | message                                      | button                                      | jira_id  |
          | was     | Future | android | [LANG:app_rating.app_rating_android.title] | [LANG:app_rating.app_rating_android.message] | [LANG:app_rating.app_rating_android.button] | QABP-140 |
          | was     | Future | ios     | [LANG:app_rating.app_rating_ios.title]     | [LANG:app_rating.app_rating_ios.message]     | [LANG:app_rating.app_rating_ios.button]     | QABP-141 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user won't see the App Rating if the maximum of 3 times has been reached
    App raring can be displayed a maxium of 3 times.
    The "Test App Rating Webview" is an OB webview that can send the event to show the App rating
    Given user has never rated the application
      And user is in the "Test App Rating Webview" page
     When clicks on the "test_app_rating_link" link
      And the "Popup Rate Stars" popup is displayed
      And clicks on the "not_now_button" button
      And the "Test App Rating Webview" page is displayed
      And clicks on the "test_app_rating_link" link
      And the "Popup Rate Stars" popup is displayed
      And clicks on the "not_now_button" button
      And the "Test App Rating Webview" page is displayed
      And clicks on the "test_app_rating_link" link
      And the "Popup Rate Stars" popup is displayed
      And clicks on the "not_now_button" button
      And the "Test App Rating Webview" page is displayed
     Then the "Popup Rate Stars" popup is not displayed
      And the "Test App Rating Webview" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-142 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can skip the app rating
    App raring can be displayed a maxium of 3 times.
    The "Test App Rating Webview" is an OB webview that can send the event to show the App rating
    Given user has never rated the application
      And user is in the "Test App Rating Webview" page
     When clicks on the "test_app_rating_link" link
      And the "Popup Rate Stars" popup is displayed
      And clicks on the "not_now_button" button
     Then the "Popup Rate Stars" popup is not displayed
      And the "Test App Rating Webview" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-143 |

  @jira.<jira_id> @<product> @TBD @android @jira.cv.<cv> @manual @mobile @<test_priority>
  Scenario Outline: A <product> user can rate the app negatively (less than 4 stars) on Android devices: user is redirected to a feedback form
    Given user is in the "Landing Tab" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "App Rating Feedback" internal webview is displayed
      And the "[LANG:app_rating.feedback_form.header]" header is displayed
      And the "title" textfield with "[LANG:app_rating.feedback_form.title]" text is displayed
      And the "input_text" inputtext with the "[LANG:app_rating.feedback_form.input_text]" placeholder is displayed
      And the "send_button" button with "[LANG:app_rating.feedback_form.send_button]" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | number_stars | cv     | test_priority | jira_id  |
          | was     | 1            | Future | sanity        | QABP-144 |
          | was     | 2            | Future | regression    | QABP-145 |
          | was     | 3            | Future | regression    | QABP-146 |

  @jira.<jira_id> @<product> @TBD @android @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can send feedback after a negative rating on Android devices
    Given user is in the "Landing Tab" page
      And the App Rating popup is displayed
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "App rating test" text
      And clicks on the "send_button" button
     Then the "App Rating Feedback Success" page is displayed
      And the "title" textfield with "[LANG:app_rating.feedback_success.title]" text is displayed
      And the "text" textfield with "[LANG:app_rating.feedback_success.subtitle]" text is displayed
      And the "close_button" button with "[LANG:app_rating.feedback_success.close_button]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-147 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user close the feedback screen without sending it on Android devices
    Given user is in the "Landing Tab" page
      And the App Rating popup is displayed
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-148 |

  @jira.<jira_id> @<product> @TBD @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can go back to the previous tab after providing feedback on Android devices
    Given user is in the "Landing Tab" page
      And the App Rating popup is displayed
     When clicks on "1" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
      And the "App Rating Feedback" page is displayed
      And fills the "input_text" inputtext with the "App rating test" text
      And clicks on the "send_button" button
      And the "App Rating Feedback Success" page is displayed
      And clicks on the "close_button" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-149 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user cannot rate the app without selecting any stars
    Given user is in the "Landing Tab" page
      And the App Rating popup is displayed
     When user has not selected any stars on "rating_star_bar" rating bar
     Then the "not_now_button" button is displayed
      And the "send_button" button is not displayed
      And clicks on the "not_now_button" button
      And the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-151 |

  @jira.<jira_id> @<product> @<test_priority> @android @jira.cv.<cv> @manual @mobile
  Scenario Outline: A <product> user can rate the app positively (4 o 5 stars) on Android devices: user is redirected to the Play Store
    Given user is in the "Landing Tab" page
      And the App Rating popup is displayed
     When clicks on "<number_stars>" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Play Store" app is displayed
      And the "Store" page is displayed
      And the "app_name" textfield that contains the "<app_name>" text is displayed
      And clicks on the native "back" button
      And the landing tab page is displayed

    Examples:
          | product | cv     | number_stars | test_priority | app_name     | jira_id  |
          | was     | Future | 4            | regression    | Whatsapp SIM | QABP-152 |
          | was     | Future | 5            | sanity        | Whatsapp SIM | QABP-153 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can rate the app on iOS devices
    This TC can only be tested in live since in the Enterprise version of the app the submit button is disabled.
    Given user is in the "Landing Tab" page
      And the App Rating popup is displayed
     When clicks on "any" stars on "rating_star_bar" rating bar
      And clicks on the "send_button" button
     Then the "Apple Store" app is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-154 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can discard to rate the app after selecting stars on iOS devices
    Given user is in the "Landing Tab" page
      And the App Rating popup is displayed
     When clicks on "any" stars on "rating_star_bar" rating bar
      And clicks on the "cancel_button" button
     Then the "Popup Rate Stars" page is not displayed
      And the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-155 |
