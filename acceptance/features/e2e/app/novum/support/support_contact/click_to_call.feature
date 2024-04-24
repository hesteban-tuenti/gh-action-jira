# -*- coding: utf-8 -*-
@jira.QANOV-238997
Feature: Click to call


  @jira.QANOV-420519 @android @blaude @ios @jira.cv.14.10 @jira.link.parent_test_plan.QANOV-402198 @manual @mobile
  @raitt_drop3 @smoke @har
  Scenario: A RAITT blaude prepay user can call hotline number from Support screen
    Given user has a "raitt" account type
      And user has a "prepay" account type
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user is in the "Support" page
     When clicks on the "contact.click_to_call" entrypoint
     Then the "dialer" app is displayed

  @jira.QANOV-244216 @android @blaude @ios @jira.cv.14.0 @jira.link.detects.LOC-1077 @jira.link.detects.OBO2DE-716
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @raitt_drop3 @smoke
  Scenario: A BOX7 blaude monoproduct user can access to the "Click To Call Choose Topic" screen from Support screen
    If the /call-center-info/v1/call-center/languages API returns languages, the "Choose language" screen will be displayed.
    If the /call-center-info/v1/call-center/languages API returns an empty array, the OB will work with the default language
    (German), so the "Choose language" screen will not be displayed.
    BLAU currently doesn't have call center in multiple languages, so the "Choose language" screen will not be displayed.
    MeinO2 has call center in multiple languages, so the "Choose language" screen will be displayed.
    Given user has a "box7" account type
      And user has "1" products
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user is in the "Support" page
     When clicks on the "contact.click_to_call" entrypoint
     Then the "Click To Call Choose Topic" page is displayed
      And the "Hotline" header is displayed
      And the "title" textfield with "Wähle das passende Themengebiet:" text is displayed
      And the "topics_list" list is displayed
      And each element in the "topics_list" list has the "name" field
      And each element in the "topics_list" list has the "radiobutton" field
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-244218 @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @smoke @ber
  Scenario: A o2de monoproduct user can access to the "Click To Call Choose Language" screen from Support screen
    If the /call-center-info/v1/call-center/languages API returns languages, the "Choose language" screen will be displayed.
    If the /call-center-info/v1/call-center/languages API returns an empty array, the OB will work with the default language
    (German), so the "Choose language" screen will not be displayed.
    BLAU currently doesn't have call center in multiple languages, so the "Choose language" screen will not be displayed.
    MeinO2 has call center in multiple languages, so the "Choose language" screen will be displayed.
    Given user has "1" products
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Click To Call Choose Language" module configured in CMS for "Click To Call Choose Language" page
      And user is in the "Support" page
     When clicks on the "contact.click_to_call" entrypoint
     Then the "Click To Call Choose Language" page is displayed
      And the "Hotline" header is displayed
      And the "title" textfield with "Wähle eine Sprache" text is displayed
      And the "description" textfield with "Wähle die Sprache der Hotline" text is displayed
      And the "german_option.name" textfield with "Deutsch" text is displayed
      And the "german_option.radiobutton" button is displayed
      And the "english_option.name" textfield with "Englisch" text is displayed
      And the "english_option.radiobutton" button is displayed
      And the "sign_option.name" textfield with "Deutsche Gebärdensprache" text is displayed
      And the "sign_option.radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A multiproduct user can access to the "Click To Call Choose Product" screen from Support screen
    If the /call-center-info/v1/call-center/languages API returns languages, the "Choose language" screen will be displayed.
    If the /call-center-info/v1/call-center/languages API returns an empty array, the OB will work with the default language
    (German), so the "Choose language" screen will not be displayed.
    BLAU currently doesn't have call center in multiple languages, so the "Choose language" screen will not be displayed.
    MeinO2 has call center in multiple languages, so the "Choose language" screen will be displayed.
    Given user has a "box7" account type
      And user has "several" products
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Click To Call Choose Product" module configured in CMS for "Click To Call Choose Product" page
      And user is in the "Support" page
     When clicks on the "contact.click_to_call" entrypoint
     Then the "Click To Call Choose Product" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "product_icon" field
      And each element in the "products_list" list has the "name" field
      And each element in the "products_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.0 | QANOV-244217 |
          | o2de    | 14.2 | QANOV-244223 |

  @jira.QANOV-244224 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-244217 @jira.link.detects.LOC-1077
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @regression
  Scenario: A blaude multiproduct user who is in the "Click To Call Choose Product" screen can access to the "Click To Call Choose Topic" screen in the German hotline
    Given user has a "box7" account type
      And user has "several" products
      And user has the "Click To Call Choose Product" module configured in CMS for "Click To Call Choose Product" page
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user is in the "Click To Call Choose Product" page
     When clicks on any element in the "products_list" list
     Then the "Click To Call Choose Topic" page is displayed
      And the "Hotline" header is displayed
      And the "title" textfield with "Wähle das passende Themengebiet:" text is displayed
      And the "topics_list" list is displayed
      And each element in the "topics_list" list has the "name" field
      And each element in the "topics_list" list has the "radiobutton" field
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-244225 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-244223 @jira.link.detects.LOC-1077
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @o2de @regression
  Scenario: A o2de multiproduct user who is in the "Click To Call Choose Product" screen can access to the "Click To Call Choose Language" screen in the German hotline
    Given user has a "box7" account type
      And user has "several" products
      And user has the "Click To Call Choose Product" module configured in CMS for "Click To Call Choose Product" page
      And user has the "Click To Call Choose Language" module configured in CMS for "Click To Call Choose Language" page
      And user is in the "Click To Call Choose Product" page
     When clicks on any element in the "products_list" list
     Then the "Click To Call Choose Language" page is displayed
      And the "Hotline" header is displayed
      And the "title" textfield with "Wähle eine Sprache" text is displayed
      And the "description" textfield with "Wähle die Sprache der Hotline" text is displayed
      And the "german_option.name" textfield with "Deutsch" text is displayed
      And the "german_option.radiobutton" button is displayed
      And the "english_option.name" textfield with "Englisch" text is displayed
      And the "english_option.radiobutton" button is displayed
      And the "sign_option.name" textfield with "Deutsche Gebärdensprache" text is displayed
      And the "sign_option.radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-244219 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-244218 @jira.link.depends_on.QANOV-244225
  @jira.link.detects.O2DE-2881 @jira.link.detects.O2DE-3898 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @smoke
  Scenario: A o2de user who chooses the English hotline can access to the "Call Hotline" screen
    Given user has the "Click To Call Choose Language" module configured in CMS for "Click To Call Choose Language" page
      And user has the "Call Hotline" module configured in CMS for "Call Hotline" page
      And user is in the "Click To Call Choose Language" page
     When clicks on the "english_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Call Hotline" page is displayed
      And the "Call Hotline" header is displayed
      And the "title" textfield with "How you reach us" text is displayed
      And the "tip" textfield with "Tip: To help you more quickly, please have your customer code ready. You were able to choose your own four-digit personal customer code when you signed the contract." text is displayed
      And the "call_hotline_button" button with "Call Hotline" text is displayed
      And the "opening_hours.title" textfield with "Opening hours customer Hotline" text is displayed
      And the "opening_hours.hours" textfield is displayed
      And the "description" textfield with "Changes may apply for using the hotline, according to your tariff for calls to the German mobile network. From abroad depending on your roaming tariff." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-543146 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-244219 @manual @mobile @o2de @regression
  Scenario: A o2de user who chooses the English hotline can tap on the button of the "Call Hotline" screen
    Given user has the "Click To Call Choose Language" module configured in CMS for "Click To Call Choose Language" page
      And user has the "Call Hotline" module configured in CMS for "Call Hotline" page
      And user is in the "Click To Call Choose Language" page
     When clicks on the "english_option.radiobutton" button
      And clicks on the "continue_button" button
      And the "Call Hotline" page is displayed
      And clicks on the "call_hotline_button" button
     Then the "dialer" app is displayed
      And the "089666630081" phone number is inserted on the dialer

  @jira.QANOV-444711 @android @ios @jira.cv.14.9 @jira.link.depends_on.QANOV-244218 @jira.link.depends_on.QANOV-244225
  @manual @mobile @o2de @regression
  Scenario: A o2de user who chooses the Sign Language hotline can access to the "Sign Language" OB webview
    Given user has the "Click To Call Choose Language" module configured in CMS for "Click To Call Choose Language" page
      And user is in the "Click To Call Choose Language" page
     When clicks on the "sign_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the internal webview is displayed
      And the "Gehörlos telefonieren dank Tess | o2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Click To Call Choose Language" page is displayed

  @jira.QANOV-244221 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-244218 @jira.link.depends_on.QANOV-244225
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @o2de @regression
  Scenario: A o2de user who chooses the German hotline can access to the "Click To Call Choose Topic" screen
    Given user has the "Click To Call Choose Language" module configured in CMS for "Click To Call Choose Language" page
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user is in the "Click To Call Choose Language" page
     When clicks on the "german_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Click To Call Choose Topic" page is displayed
      And the "Hotline" header is displayed
      And the "title" textfield with "Wähle das passende Themengebiet:" text is displayed
      And the "topics_list" list is displayed
      And each element in the "topics_list" list has the "name" field
      And each element in the "topics_list" list has the "radiobutton" field
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-296884 @android @ber @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-244216
  @jira.link.depends_on.QANOV-244224 @jira.link.detects.LOC-1077 @jira.link.detects.O2DE-3246
  @jira.link.detects.OBO2DE-468 @jira.link.detects.OBO2DE-469 @manual @mobile @raitt_drop3 @sanity
  Scenario: A blaude BOX7 user with info about the opening hours can access to the "Click To Call Details" screen in the German hotline
    If the user does not receive info about the opening hours in the API, then no content will be displayed in this
    screen (an empty case will be displayed in the future).
    The estimated waiting time in minutes, occupancy status (low, moderate, high, closed) and opening hours will be
    provided by API (/call-center/waiting-time).
    One or two buttons will be displayed in the header, depending on the occupancy status.
    NOTE: Right now, BLAU brand cannot provide waiting time in minutes or the occupancy status (low, moderate, high,
    closed), but it will in the future. Meanwhile, the header will display just a message and two buttons.
    NOTE: we are not receiving real information from the API about the popular times, so the diagram displays wrong
    info. Then, we remove the "popupar times" diagram just in Blau until the API is fixed.
    Given user has a "box7" account type
      And user has info about the opening hours
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Choose Topic" page
     When clicks on any element in the "topics_list" list
      And clicks on the "continue_button" button
     Then the "Click To Call Details" page is displayed
      And the "Hotline" header is displayed
      And the "header.title" textfield with "Wie können wir dir weiterhelfen?" text is displayed
      And the "header.call_now" button with "Jetzt anrufen" text is displayed
      And the "header.call_me_back" button with "Rückrufservice" text is displayed
      And the "opening_hours" module is displayed
      And the "opening_hours.title" textfield with "ÖFFNUNGSZEITEN" text is displayed
      And the "opening_hours.hours" textfield is displayed
      And the "popular_times" module is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-244227 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-244221
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity
  Scenario: A o2de user with info about the opening hours can access to the "Click To Call Details" screen in the German hotline
    If the user does not receive info about the opening hours in the API, then no content will be displayed in this
    screen (an empty case will be displayed in the future).
    The estimated waiting time in minutes, occupancy status (low, moderate, high, closed) and opening hours will be
    provided by API (/call-center/waiting-time).
    One or two buttons will be displayed in the header, depending on the occupancy status.
    Given user has info about the opening hours
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Choose Topic" page
     When clicks on any element in the "topics_list" list
      And clicks on the "continue_button" button
     Then the "Click To Call Details" page is displayed
      And the "Hotline" header is displayed
      And the "header.occupancy" textfield is displayed
      And the "header.time_wait" textfield is displayed
      And the "opening_hours" module is displayed
      And the "opening_hours.title" textfield with "ÖFFNUNGSZEITEN" text is displayed
      And the "opening_hours.hours" textfield is displayed
      And the "popular_times" module is displayed
      And the "popular_times.title" textfield with "BELIEBTE ZEITEN" text is displayed
      And the "popular_times.days" tabs are displayed
      And the "popular_times.graph" graph is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-376150 @android @blaude @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-244216
  @jira.link.depends_on.QANOV-244224 @manual @mobile @regression
  Scenario: A blaude BOX7 user without info about the opening hours can access to the "Click To Call Details" screen in the German hotline
    If the user does not receive info about the opening hours in the API, then no content will be displayed in this
    screen (an empty case will be displayed in the future).
    User to test in PROD: 01791341427 / #brt12345678
    Given user has a "box7" account type
      And user has not info about the opening hours
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Choose Topic" page
     When clicks on any element in the "topics_list" list
      And clicks on the "continue_button" button
     Then the "Click To Call Details" page is displayed
      And the "Hotline" header is displayed
      And the "header.title" textfield with "Wie können wir dir weiterhelfen?" text is displayed
      And the "header.call_now" button with "Jetzt anrufen" text is displayed
      And the "header.call_me_back" button with "Rückrufservice" text is displayed
      And the "opening_hours" module is not displayed
      And the "popular_times" module is not displayed
      And the "no_available.info_icon" icon is displayed
      And the "no_available.title" textfield with "Öffnungszeiten nicht verfügbar" text is displayed
      And the "no_available.description" textfield with "Öffnungszeiten sind aktuell nich verfügbar. Versuche es später noch einmal." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-376152 @android @ios @jira.cv.14.5 @jira.link.depends_on.QANOV-244221 @manual @mobile @o2de @regression
  Scenario: A o2de user without info about the opening hours can access to the "Click To Call Details" screen in the German hotline
    If the user does not receive info about the opening hours in the API, then no content will be displayed in this
    screen (an empty case will be displayed in the future).
    Given user has not info about the opening hours
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Choose Topic" page
     When clicks on any element in the "topics_list" list
      And clicks on the "continue_button" button
     Then the "Click To Call Details" page is displayed
      And the "Hotline" header is displayed
      And the "header.occupancy" textfield is displayed
      And the "header.time_wait" textfield is displayed
      And the "opening_hours" module is not displayed
      And the "popular_times" module is not displayed
      And the "no_available.info_icon" icon is displayed
      And the "no_available.title" textfield with "Öffnungszeiten und beliebte Zeiten nicht verfügbar" text is displayed
      And the "no_available.description" textfield with "Öffnungszeiten und beliebte Zeiten sind aktuell nich verfügbar. Versuche es später noch einmal." text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-244227
  @jira.link.depends_on.QANOV-376152 @manual @mobile @o2de
  Scenario Outline: A o2de user with a hotline waiting time <waiting_time> mins can see the "Click To Call Details" header for a German hotline
    Given user has the hotline service with "<waiting_time>" min of waiting time
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Choose Topic" page
     When clicks on any element in the "topics_list" list
      And clicks on the "continue_button" button
      And the "Click To Call Details" page is displayed
     Then the "header.occupancy" textfield with "<occupancy_text>" text is displayed
      And the "header.time_wait" textfield with the "<waiting_time_text>" format is displayed
      And the "header.call_now" button with "Jetzt anrufen" text is displayed
      And the "header.call_me_back" button with "Rückrufservice" text is displayed

    Examples:
          | waiting_time | occupancy_text      | waiting_time_text                  | test_priority | jira_id      |
          | <= 10        | Niedrige Auslastung | Wartezeit: [1-9] (Minute\|Minuten) | smoke         | QANOV-238999 |
          | [11-20]      | Moderate Auslastung | Wartezeit: (1[1-9]\|20) Minuten    | regression    | QANOV-239001 |

  @jira.QANOV-239002 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-244227 @jira.link.depends_on.QANOV-376152
  @manual @mobile @o2de @regression
  Scenario: A o2de user with a hotline waiting time >20 mins can see the "Click To Call Details" header for a German hotline
    Given user has the hotline service with ">20" min of waiting time
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Choose Topic" page
     When clicks on any element in the "topics_list" list
      And clicks on the "continue_button" button
      And the "Click To Call Details" page is displayed
     Then the "header.occupancy" textfield with "Hohe Auslastung" text is displayed
      And the "header.time_wait" textfield with the "Wartezeit: \d+ Minuten" format is displayed
      And the "header.call_me_back" button with "Rückrufservice" text is displayed

  @jira.QANOV-239004 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-244227 @jira.link.depends_on.QANOV-376152
  @manual @mobile @o2de @regression
  Scenario: A o2de user with a hotline closed can see the "Click To Call Details" header for a German hotline
    Given user has the hotline service in "closed" status
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Choose Topic" page
     When clicks on any element in the "topics_list" list
      And clicks on the "continue_button" button
      And the "Click To Call Details" page is displayed
     Then the "header.occupancy" textfield with "Geschlossen" text is displayed
      And the "header.time_wait" textfield with "Beachte die Öffnungszeiten" text is displayed
      And the "header.call_me_back" button with "Rückrufservice" text is displayed

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: A <product> postpay user can see the "expand hours" link in the "Click To Call Details" screen if there are many hours
    TBD when the hours can be expanded
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has info about the opening hours
      And the opening hours info is too long
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Details" page
     Then the "opening_hours.view_more" link with "View more hours" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-296884              | QANOV-239006 |
          | o2de    | 14.2 | QANOV-244219:QANOV-244227 | QANOV-239007 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: A <product> postpay user can expand the opening hours in the "Click To Call Details" screen
    TBD when the hours can be expanded
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has info about the opening hours
      And the opening hours info is too long
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Details" page
     When clicks on the "opening_hours.view_more" link
     Then the "opening_hours.hours" list is expanded
      And the "opening_hours.view_less" link with "View less hours" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-239006 | QANOV-239008 |
          | o2de    | 14.2 | QANOV-239007 | QANOV-239009 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: A <product> postpay user can contract the opening hours in the "Click To Call Details" screen
    TBD when the hours can be expanded
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has info about the opening hours
      And the opening hours info is too long
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Details" page
     When clicks on the "opening_hours.view_more" link
      And clicks on the "opening_hours.view_less" link
     Then the "opening_hours.hours" list is contracted
      And the "opening_hours.view_more" link with "View more hours" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-239008 | QANOV-239010 |
          | o2de    | 14.2 | QANOV-239009 | QANOV-239011 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile
  @regression
  Scenario Outline: A <product> postpay user can see the German hotline occupancy for any hour in the graph of the "Click To Call Details" screen
    NOTE: we are not receiving real information from the API about the popular times, so the diagram displays wrong
    info. Then, we remove the "popupar times" diagram just in Blau until the API is fixed.
    Given user has a "box7" account type
      And user has a "postpay" account type
      And user has info about the opening hours
      And user has the "Click To Call Choose Topic" module configured in CMS for "Click To Call Choose Topic" page
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Choose Topic" page
     When clicks on any element in the "topics_list" list
      And clicks on the "continue_button" button
      And the "Click To Call Details" page is displayed
      And clicks on any day in the "popular_times.days" tabs
      And clicks on any hour in the "popular_times.graph" graph
     Then the "popular_times.hour" textfield is displayed
      And the "popular_times.occupancy" textfield is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-296884 | QANOV-239012 |
          | o2de    | 14.2   | QANOV-244227 | QANOV-239013 |

  @jira.QANOV-296886 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-296884
  @jira.link.depends_on.QANOV-376150 @manual @mobile @regression
  Scenario: A blaude BOX7 user can click on the "Call now" button in the "Click To Call Details" header
    Given user has a "box7" account type
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Details" page
     When clicks on the "header.call_now" button
     Then the "dialer" app is displayed

  @jira.QANOV-296887 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-296884
  @jira.link.depends_on.QANOV-376150 @manual @mobile @regression
  Scenario: A blaude BOX7 user can click on the "Call me back" button in the "Click To Call Details" header
    Given user has a "box7" account type
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Details" page
     When clicks on the "header.call_me_back" button
     Then the "Call Me Back" page is displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile
  @o2de
  Scenario Outline: A o2de user with a hotline waiting time <minutes> mins can click on the "Call now" button in the "Click To Call Details" header
    Given user has the hotline service with "<minutes>" min of waiting time
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Details" page
     When clicks on the "header.call_now" button
     Then the "dialer" app is displayed

    Examples:
          | minutes | depends_on                | test_priority | jira_id      |
          | <=10    | QANOV-238999:QANOV-444712 | smoke         | QANOV-239024 |
          | [11-20] | QANOV-239001:QANOV-444713 | regression    | QANOV-239025 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de
  Scenario Outline: A o2de user with a hotline waiting time <minutes> mins can click on the "Call me back" button in the "Click To Call Details" header
    Given user has the hotline service with "<minutes>" min of waiting time
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Details" page
     When clicks on the "header.call_me_back" button
     Then the "Call Me Back" page is displayed

    Examples:
          | minutes | depends_on   | test_priority | jira_id      |
          | <=10    | QANOV-238999 | smoke         | QANOV-239030 |
          | [11-20] | QANOV-239001 | regression    | QANOV-239031 |
          | >20     | QANOV-239002 | regression    | QANOV-239029 |

  @jira.QANOV-239033 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-239004 @manual @mobile @o2de @regression
  Scenario: A o2de user with a hotline closed can click on the "Call me back" button in the "Click To Call Details" header
    Given user has the hotline service in "closed" status
      And user has the "Click To Call Details" module configured in CMS for "Click To Call Details" page
      And user is in the "Click To Call Details" page
     When clicks on the "header.call_me_back" button
     Then the "Call Me Back" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Click To Call Details" page is displayed
