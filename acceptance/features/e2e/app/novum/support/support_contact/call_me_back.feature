# -*- coding: utf-8 -*-
@jira.QANOV-238169
Feature: Call me back

  Actions Before each Scenario:
    Given user has any "mobile_line;internet_at_home" product in "active" status


  @jira.QANOV-238170 @blaude @android @ber @ios @jira.cv.14.0 @jira.link.detects.OBO2DE-458 @manual @mobile @sanity
  @jira.link.parent_test_plan.QANOV-402198 @raitt_drop3
  Scenario: A BOX7 user without an appointment can access to the "Call me back info" screen from the Support tab
    The available callback days & times (hotline is open) should be provided by the API.
    If the info about the opening hours is too long, it will be displayed compacted with a "View more hours" link.
    If the info about the opening hours is short, it will be displayed without a "View more hours" link.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Call Me Back Info" module configured in CMS for "Call Me Back Info" page
      And user is in the "Support" page
     When clicks on the "contact.call_me_back" entrypoint
     Then the "Call Me Back Info" page is displayed
      And the "Rückrufservice" header is displayed
      And the "title" textfield with "Rückrufservice" text is displayed
      And the "description" textfield with "Wir rufen dich zu einem von dir festgelegten Termin zurück. Schnell und kostenlos." text is displayed
      And the "opening_hours" module is displayed
      And the "opening_hours.title" textfield with "ÖFFNUNGSZEITEN" text is displayed
      And the "opening_hours.hours" textfield with "Lass dich zu einem von dir festgelegten Termin zurückrufen. Schnell und kostenlos. Wir können dich von Montag bis Freitag 07:00 - 20:00 Uhr, sowie Samstags 10:00 - 18:00 Uhr zurückrufen." text is displayed
      And the "get_appointment_button" button with "Rückruftermin vereinbaren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-238178 @blaude @android @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-238170 @manual @mobile @smoke
  Scenario: A multiproduct BOX7 user without an appointment can access to the "Call Me Back Choose Product" screen
    The different products of the user will be displayed in this screen (except my_handy products, as the call me back
    feature is not available for these products).
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "several" products different from "my_handy"
      And user has the "Call Me Back Info" module configured in CMS for "Call Me Back Info" page
      And user has the "Call Me Back Choose Product" module configured in CMS for "Call Me Back Choose Product" page
      And user is in the "Call Me Back Info" page
     When clicks on the "get_appointment_button" button
     Then the "Call Me Back Choose Product" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Wähle den Vertrag um den es geht" text is displayed
      And the "products_list" list is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Call Me Back Info" page is displayed

  @jira.QANOV-238180 @blaude @android @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-238178 @jira.link.detects.LOC-1069
  @manual @mobile @regression
  Scenario: A multiproduct BOX7 user without an appointment can access to the "Call Me Back Choose Topic" screen
    The available topics depends on the type of product and should be provided by API. If there's just one topic
    available for the selected product, this step will be skipped.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "several" products different from "my_handy"
      And user has "several" topics for a product
      And user has the "Call Me Back Choose Product" module configured in CMS for "Call Me Back Choose Product" page
      And user has the "Call Me Back Choose Topic" module configured in CMS for "Call Me Back Choose Topic" page
      And user is in the "Call Me Back Choose Product" page
     When clicks on any element in the "products_list" list that has "several" topics
     Then the "Call Me Back Choose Topic" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Wähle das passende Themengebiet:" text is displayed
      And the "topics_list" list is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Call Me Back Info" page is displayed

  @jira.QANOV-238182 @blaude @android @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-238170 @jira.link.detects.LOC-1069
  @manual @mobile @smoke
  Scenario: A monoproduct BOX7 user without an appointment can access to the "Call Me Back Choose Topic" screen
    The available topics depends on the type of product and should be provided by API. If there's just one topic
    available for the product, this step will be skipped.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "1" products different from "my_handy"
      And user has "several" topics for a product
      And user has the "Call Me Back Info" module configured in CMS for "Call Me Back Info" page
      And user has the "Call Me Back Choose Topic" module configured in CMS for "Call Me Back Choose Topic" page
      And user is in the "Call Me Back Info" page
     When clicks on the "get_appointment_button" button
     Then the "Call Me Back Choose Topic" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Wähle das passende Themengebiet" text is displayed
      And the "topics_list" list is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Call Me Back Info" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A BOX7 user without an appointment can access to the "Call Me Back Choose Time" screen for a product with several topics
    The available topics depends on the type of product and should be provided by API. If there's just one topic
    available for the selected product, this step will be skipped.
    The available slots should be provided by API. They are not dependant on the product nor the topic that have been
    previously selected.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "any" products different from "my_handy"
      And user has "several" topics with available slots for a product
      And user has the "Call Me Back Choose Topic" module configured in CMS for "Call Me Back Choose Topic" page
      And user has the "Call Me Back Choose Time" module configured in CMS for "Call Me Back Choose Time" page
      And user is in the "Call Me Back Choose Topic" page
     When clicks on any element in the "topics_list" list that has available slots
     Then the "Call Me Back Choose Time" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Zeitpunkt wählen" text is displayed
      And the "description" textfield with "Wähle das Datum und die Uhrzeit aus, zu der wir dich zurückgerufen stollen. Der ausgewählte Termin wird erst nach Terminbestätigung für dich reserviert." text is displayed
      And the "date_selector" selector is displayed
      And the "date_selector_placeholder" textfield with "Datum & Uhrzeit wählen" text is displayed
      And the "next_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    Examples:
          | product | cv   | close_screen         | depends_on                             | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238180:QANOV-238182:QANOV-235480 | QANOV-238184 |
          | o2de    | 14.2 | All Contact Channels | QANOV-235479                           | QANOV-238185 |

  @jira.QANOV-238188 @blaude @android @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-238178 @jira.link.depends_on.QANOV-235478
  @manual @mobile @regression
  Scenario: A multiproduct BOX7 user without an appointment can access to the "Call Me Back Choose Time" screen for a product with just one topic
    The available topics depends on the type of product and should be provided by API. If there's just one topic
    available for the selected product, this step will be skipped.
    The available slots should be provided by API. They are not dependant on the product nor the topic that have been
    previously selected.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "several" products different from "my_handy"
      And user has "1" topics with available slots for a product
      And user has the "Call Me Back Choose Product" module configured in CMS for "Call Me Back Choose Product" page
      And user has the "Call Me Back Choose Time" module configured in CMS for "Call Me Back Choose Time" page
      And user is in the "Call Me Back Choose Product" page
     When clicks on any element in the "products_list" list that has "1" topics with available slots
     Then the "Call Me Back Choose Time" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Zeitpunkt wählen" text is displayed
      And the "description" textfield with "Wähle das Datum und die Uhrzeit aus, zu der wir dich zurückgerufen stollen. Der ausgewählte Termin wird erst nach Terminbestätigung für dich reserviert." text is displayed
      And the "date_selector" selector is displayed
      And the "date_selector_placeholder" textfield with "Datum & Uhrzeit wählen" text is displayed
      And the "next_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Call Me Back Info" page is displayed

  @jira.QANOV-238190 @blaude @android @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-238170 @jira.link.depends_on.QANOV-235478
  @manual @mobile @regression
  Scenario: A monoproduct BOX7 user without an appointment can access to the "Call Me Back Choose Time" screen for a product with just one topic
    The available topics depends on the type of product and should be provided by API. If there's just one topic
    available for the product, this step will be skipped.
    The available slots should be provided by API. They are not dependant on the product nor the topic that have been
    previously selected.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "1" products different from "my_handy"
      And user has "1" topics with available slots for a product
      And user has the "Call Me Back Info" module configured in CMS for "Call Me Back Info" page
      And user has the "Call Me Back Choose Time" module configured in CMS for "Call Me Back Choose Time" page
      And user is in the "Call Me Back Info" page
     When clicks on the "get_appointment_button" button
     Then the "Call Me Back Choose Time" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Zeitpunkt wählen" text is displayed
      And the "description" textfield with "Wähle das Datum und die Uhrzeit aus, zu der wir dich zurückgerufen stollen. Der ausgewählte Termin wird erst nach Terminbestätigung für dich reserviert." text is displayed
      And the "date_selector" selector is displayed
      And the "date_selector_placeholder" textfield with "Datum & Uhrzeit wählen" text is displayed
      And the "next_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Call Me Back Info" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user without an appointment chooses a time in the "Call Me Back Choose Time" screen but an internal error happens: a crouton error is displayed
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Choose Time" module configured in CMS for "Call Me Back Choose Time" page
      And user is in the "Call Me Back Choose Time" page
     When clicks on the "date_selector" selector
      And clicks on the "first" element in the "date_selector_list" list
      And clicks on the "next_button" button
      And there is an error choosing an appointment time
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "We are sorry, something went wrong. Please, try again" text is displayed
      And the "error_warning.button" button with "Try again" text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 14.0 | QANOV-238184:QANOV-238188:QANOV-238190:QANOV-235478 | QANOV-238192 |
          | o2de    | 14.2 | QANOV-238185:QANOV-235477                           | QANOV-238193 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can choose a time again in the "Call Me Back Choose Time" screen after an internal error
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Choose Time" module configured in CMS for "Call Me Back Choose Time" page
      And user is in the "Call Me Back Choose Time" page
     When clicks on the "date_selector" selector
      And clicks on the "first" element in the "date_selector_list" list
      And clicks on the "next_button" button
      And there is an error choosing an appointment time
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Call Me Back Choose Time" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238192 | QANOV-238194 |
          | o2de    | 14.2 | QANOV-238193 | QANOV-238195 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment cannot choose a time already chosen in the "Call Me Back Choose Time" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Choose Time" module configured in CMS for "Call Me Back Choose Time" page
      And user is in the "Call Me Back Choose Time" page
     When clicks on the "date_selector" selector
      And clicks on the "first" element in the "date_selector_list" list
      And clicks on the "next_button" button
      And the selected date is unavailable
     Then the "date_error" textfield with "The selected date is unavailable. Please choose a different one" text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 14.0 | QANOV-238184:QANOV-238188:QANOV-238190:QANOV-235478 | QANOV-238196 |
          | o2de    | 14.2 | QANOV-238185:QANOV-235477                           | QANOV-238197 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  @jira.link.detects.O2DE-2864
  Scenario Outline: A BOX7 user without an appointment cannot access to the "Call Me Back Describe Concern" screen without selecting a time
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Choose Time" module configured in CMS for "Call Me Back Choose Time" page
      And user has the "Call Me Back Describe Concern" module configured in CMS for "Call Me Back Describe Concern" page
      And user is in the "Call Me Back Choose Time" page
     When clicks on the "next_button" button
     Then the "date_selector_error" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 14.0 | QANOV-238184:QANOV-238188:QANOV-238190:QANOV-235478 | QANOV-238198 |
          | o2de    | 14.2 | QANOV-238185:QANOV-235477                           | QANOV-238199 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can access to the "No Dates Available" screen for a product with several topics
    The available topics depends on the type of product and should be provided by API. If there's just one topic
    available for the selected product, this step will be skipped.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "any" products different from "my_handy"
      And user has "several" topics and one of them without available slots for a product
      And user has the "Call Me Back Choose Topic" module configured in CMS for "Call Me Back Choose Topic" page
      And user has the "No Dates Available" module configured in CMS for "No Dates Available Info Feedback" page
      And user is in the "Call Me Back Choose Topic" page
     When clicks on any element in the "topics_list" list that has no available slots
     Then the "No Dates Available Info Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Leider sind aktuell keine Termine verfügbar" text is displayed
      And the "info_message" textfield with "<info_message>" text is displayed
      And the "go_to_faq_button" button with "Zu den FAQs" text is displayed
      And the "back_to_support_link" link with "Zurück zu Hilfe" text is displayed

    Examples:
          | product | cv   | info_message                                                                                                        | depends_on                             | jira_id      |
          | blaude  | 14.0 | Alternativ hast du die Möglichkeit, unsere FAQs zu nutzen.                                                          | QANOV-238180:QANOV-238182:QANOV-235480 | QANOV-238200 |
          | o2de    | 14.2 | Alternativ hast du die Möglichkeit, unsere FAQs zu nutzen oder dich in einem Shop in deiner Nähe beraten zu lassen. | QANOV-235479                           | QANOV-238201 |

  @jira.QANOV-238204 @blaude @android @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-238178 @jira.link.depends_on.QANOV-235478
  @manual @mobile @regression
  Scenario: A multiproduct BOX7 user without an appointment can access to the "No Dates Available" screen for a product with just one topic
    The available topics depends on the type of product and should be provided by API. If there's just one topic
    available for the selected product, this step will be skipped.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "several" products different from "my_handy"
      And user has "1" topics without available slots for a product
      And user has the "Call Me Back Choose Product" module configured in CMS for "Call Me Back Choose Product" page
      And user has the "No Dates Available" module configured in CMS for "No Dates Available Info Feedback" page
      And user is in the "Call Me Back Choose Product" page
     When clicks on any element in the "products_list" list that has "1" topics without available slots
     Then the "No Dates Available Info Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Leider sind aktuell keine Termine verfügbar" text is displayed
      And the "info_message" textfield with "Alternativ hast du die Möglichkeit, unsere FAQs zu nutzen." text is displayed
      And the "go_to_faq_button" button with "Zu den FAQs" text is displayed
      And the "back_to_support_link" link with "Zurück zu Hilfe" text is displayed

  @jira.QANOV-238206 @blaude @android @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-238170 @manual @mobile @regression
  Scenario: A monoproduct BOX7 user without an appointment can access to the "No Dates Available" screen for a product with just one topic
    The available topics depends on the type of product and should be provided by API. If there's just one topic
    available for the product, this step will be skipped.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has "1" products different from "my_handy"
      And user has "1" topics without available slots for a product
      And user has the "Call Me Back Info" module configured in CMS for "Call Me Back Info" page
      And user has the "No Dates Available" module configured in CMS for "No Dates Available Info Feedback" page
      And user is in the "Call Me Back Info" page
     When clicks on the "get_appointment_button" button
     Then the "No Dates Available Info Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Leider sind aktuell keine Termine verfügbar" text is displayed
      And the "info_message" textfield with "Alternativ hast du die Möglichkeit, unsere FAQs zu nutzen." text is displayed
      And the "go_to_faq_button" button with "Zu den FAQs" text is displayed
      And the "back_to_support_link" link with "Zurück zu Hilfe" text is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can go to Support screen from the "No Dates Available Info Feedback" screen
    For the first Scope, an OB webview will be displayed instead of the "Store Location" screen.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "No Dates Available Info Feedback" module configured in CMS for "No Dates Available Info Feedback" page
      And user is in the "No Dates Available Info Feedback" page
     When clicks on the "back_to_support_button" button
     Then the "Support" page is displayed
      And the "Hilfe" header is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 14.0 | QANOV-238200:QANOV-238204:QANOV-238206 | QANOV-238208 |
          | o2de    | 14.2 | QANOV-238201:QANOV-238205:QANOV-238207 | QANOV-238209 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can go to the FAQ screen from the "No Dates Available Info Feedback" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "No Dates Available Info Feedback" module configured in CMS for "No Dates Available Info Feedback" page
      And user is in the "No Dates Available Info Feedback" page
     When clicks on the "go_to_faq_button" button
     Then the "Call Me Back FAQ" page is displayed
      And the "Service: Schnelle Hilfe für Kunden" header is displayed
      And the "message" textfield with "Oder wähle zuerst eine Kategorie" text is displayed

    Examples:
          | product | cv   | depends_on                             | jira_id      |
          | blaude  | 14.0 | QANOV-238200:QANOV-238204:QANOV-238206 | QANOV-238210 |
          | o2de    | 14.2 | QANOV-238201:QANOV-238205:QANOV-238207 | QANOV-238211 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.LOC-1069
  @manual @mobile @smoke
  Scenario Outline: A BOX7 user without an appointment can access to the "Call Me Back Describe Concern" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Choose Time" module configured in CMS for "Call Me Back Choose Time" page
      And user has the "Call Me Back Describe Concern" module configured in CMS for "Call Me Back Describe Concern" page
      And user is in the "Call Me Back Choose Time" page
     When clicks on the "date_selector" selector
      And clicks on the "first" element in the "date_selector_list" list
      And clicks on the "next_button" button
     Then the "Call Me Back Describe Concern" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Beschreibe dein Anliegen" text is displayed
      And the "description" textfield with "Hier hast du die Möglichkeit uns weitere Details zu deinem Anliegen zu nennen." text is displayed
      And the "description_inputtext" inputtext with the "Beschreibung (optional)" placeholder is displayed
      And the "description_label" textfield with "0/200" text is displayed
      And the "next_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    Examples:
          | product | cv   | close_screen         | depends_on                                          | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238184:QANOV-238188:QANOV-238190:QANOV-235478 | QANOV-238212 |
          | o2de    | 14.2 | All Contact Channels | QANOV-238185:QANOV-238189:QANOV-238191:QANOV-235477 | QANOV-238213 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.ANDROID-11575 @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment cannot insert a description with more than 200 characters in the "Call Me Back Describe Concern" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Describe Concern" module configured in CMS for "Call Me Back Describe Concern" page
      And user is in the "Call Me Back Describe Concern" page
     When fills the "description_inputtext" inputtext with the "abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst" text
     Then the "description_inputtext" inputtext with "abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijklmnopqrst abcdefghijk" text is displayed
      And the "description_label" textfield with "200/200" text is displayed
      And the "next_button" button with "Weiter" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238212 | QANOV-238214 |
          | o2de    | 14.2 | QANOV-238213 | QANOV-238215 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can access to the "Call Me Back Contact Details" screen without inserting any description
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Describe Concern" module configured in CMS for "Call Me Back Describe Concern" page
      And user has the "Call Me Back Contact Details" module configured in CMS for "Call Me Back Contact Details" page
      And user is in the "Call Me Back Describe Concern" page
     When clicks on the "next_button" button
     Then the "Call Me Back Contact Details" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Kontakdaten" text is displayed
      And the "subtitle1" textfield with "Deine Kontaktdaten" text is displayed
      And the "description1" textfield with "Wir rufen dich unter folgender Nummer zurück:" text is displayed
      And the "callback_number_inputtext" inputtext with the "Rückruf Nummer" placeholder is displayed
      And the "subtitle2" textfield with "Terminbestätigung" text is displayed
      And the "description2" textfield with "Du erhältst eine Terminbestätigung und Erinnerung an die folgende E-Mail-Adresse:" text is displayed
      And the "email_inputtext" inputtext with the "E-mail-Adresse" placeholder is displayed
      And the "next_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    Examples:
          | product | cv   | close_screen         | depends_on   | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238212 | QANOV-238216 |
          | o2de    | 14.2 | All Contact Channels | QANOV-238213 | QANOV-238217 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A BOX7 user without an appointment can access to the "Call Me Back Contact Details" screen after inserting a description
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Describe Concern" module configured in CMS for "Call Me Back Describe Concern" page
      And user has the "Call Me Back Contact Details" module configured in CMS for "Call Me Back Contact Details" page
      And user is in the "Call Me Back Describe Concern" page
     When fills the "description_inputtext" inputtext with the "This is a NOVUM test" text
      And clicks on the "next_button" button
     Then the "Call Me Back Contact Details" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Kontakdaten" text is displayed
      And the "subtitle1" textfield with "Deine Kontaktdaten" text is displayed
      And the "description1" textfield with "Wir rufen dich unter folgender Nummer zurück:" text is displayed
      And the "callback_number_inputtext" inputtext with the "Rückruf Nummer" placeholder is displayed
      And the "subtitle2" textfield with "Terminbestätigung" text is displayed
      And the "description2" textfield with "Du erhältst eine Terminbestätigung und Erinnerung an die folgende E-Mail-Adresse:" text is displayed
      And the "email_inputtext" inputtext with the "E-mail-Adresse" placeholder is displayed
      And the "next_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    Examples:
          | product | cv   | close_screen         | depends_on   | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238212 | QANOV-238218 |
          | o2de    | 14.2 | All Contact Channels | QANOV-238213 | QANOV-238219 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can see his/her contact details in the "Call Me Back Contact Details" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has a "phone number" stored in the contact details
      And user has a "verified email" stored in the contact details
      And user has the "Call Me Back Contact Details" module configured in CMS for "Call Me Back Contact Details" page
      And user is in the "Call Me Back Contact Details" page
     Then the "callback_number_inputtext" inputtext with "[CONTEXT:contact_phone_number]" text is displayed
      And the "email_inputtext" inputtext with "[CONTEXT:contact_email]" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238216:QANOV-238218 | QANOV-238220 |
          | o2de    | 14.2 | QANOV-238217:QANOV-238219 | QANOV-238221 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment cannot see his/her contact details in the "Call Me Back Contact Details" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has not a "phone number" stored in the contact details
      And user has a "no email" stored in the contact details
      And user has the "Call Me Back Contact Details" module configured in CMS for "Call Me Back Contact Details" page
      And user is in the "Call Me Back Contact Details" page
     Then the "callback_number_inputtext" inputtext is empty
      And the "email_inputtext" inputtext is empty

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238216:QANOV-238218 | QANOV-238222 |
          | o2de    | 14.2 | QANOV-238217:QANOV-238219 | QANOV-238223 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment cannot access to the "Call Me Back Additional Reminder" screen without filling the contact phone number and email
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Contact Details" module configured in CMS for "Call Me Back Contact Details" page
      And user is in the "Call Me Back Contact Details" page
     When clears the "callback_number_inputtext" inputtext
      And clears the "email_inputtext" inputtext
      And clicks on the "next_button" button
     Then the "callback_number_error" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "email_error" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238216:QANOV-238218 | QANOV-238224 |
          | o2de    | 14.2 | QANOV-238217:QANOV-238219 | QANOV-238225 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1624
  @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment cannot access to the "Call Me Back Additional Reminder" screen after filling the contact phone number and email with a wrong format
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Contact Details" module configured in CMS for "Call Me Back Contact Details" page
      And user is in the "Call Me Back Contact Details" page
     When fills the "callback_number_inputtext" inputtext with the "0000" text
      And fills the "email_inputtext" inputtext with the "email@mail" text
      And clicks on the "next_button" button
     Then the "callback_number_error" textfield with "Diese Telefonnummer its ungültig. Gib eine gültige Nummer ein" text is displayed
      And the "email_error" textfield with "Falsche E-Mail-Adresse" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238216:QANOV-238218 | QANOV-238226 |
          | o2de    | 14.2 | QANOV-238217:QANOV-238219 | QANOV-238227 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.LOC-1069
  @jira.link.detects.OBO2DE-462 @manual @mobile @smoke
  Scenario Outline: A BOX7 user without an appointment can access to the "Call Me Back Additional Reminder" screen after filling the contact phone number and email
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Contact Details" module configured in CMS for "Call Me Back Contact Details" page
      And user has the "Call Me Back Additional Reminder" module configured in CMS for "Call Me Back Additional Reminder" page
      And user is in the "Call Me Back Contact Details" page
     When fills the "callback_number_inputtext" inputtext with the "17687430942" text
      And fills the "email_inputtext" inputtext with the "email@mail.com" text
      And clicks on the "next_button" button
     Then the "Call Me Back Additional Reminder" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Termin-Erinnerung" text is displayed
      And the "description" textfield with "Zusätzlich zur SMS erhältst du eine Erinnerung zum anstehenden Termin." text is displayed
      And the "sms_phone_number_inputtext" inputtext with the "Mobilfunknummer SMS (optional)" placeholder is displayed
      And the "next_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    Examples:
          | product | cv   | close_screen         | depends_on                | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238216:QANOV-238218 | QANOV-238228 |
          | o2de    | 14.2 | All Contact Channels | QANOV-238217:QANOV-238219 | QANOV-238229 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.LOC-1069 @jira.link.detects.OBO2DE-463 @manual @mobile @smoke
  Scenario Outline: A multiproduct BOX7 user without an appointment can access to the "Call Me Back Summary" screen
    A multiproduct user will see a "Product" section in this screen. Monoproduct users will not see that section.
    If the user writes concern details we will show as maximum of two lines of description for it. If user doesn't write
    concern details we will show a description to explain user can write concern details.
    If user doesn't fill the additional reminder we will show the "App notification" text.
    NOTE: the "Topic" section only will display an "Edit" link when the product selected has several topics (for a
    product with only a topic, it makes no sense to allow to edit it).
    Given user has a "box7" account type
      And user has "several" products
      And user has "0" pending appointments
      And user has the "Call Me Back Additional Reminder" module configured in CMS for "Call Me Back Additional Reminder" page
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Additional Reminder" page
     When clicks on the "next_button" button
     Then the "Call Me Back Summary" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Bitte überprüfe deine Daten und bestätige deinen Termin." text is displayed
      And the "product_label" textfield with "Vertragstyp" text is displayed
      And the "product_value" textfield is displayed
      And the "product_edit_link" link with "Bearbeiten" text is displayed
      And the "topic_label" textfield with "Themengebiet" text is displayed
      And the "topic_value" textfield is displayed
      And the "appointment_label" textfield with "Details zum Termin" text is displayed
      And the "appointment_value" textfield is displayed
      And the "appointment_edit_link" link with "Bearbeiten" text is displayed
      And the "description_label" textfield with "Angaben zum Anliegen" text is displayed
      And the "description_value" textfield is displayed
      And the "description_edit_link" link with "Bearbeiten" text is displayed
      And the "callback_number_label" textfield with "Kontaktdaten" text is displayed
      And the "callback_number_value" textfield with the "Rückruf Nummer: \d+" format is displayed
      And the "callback_number_edit_link" link with "Bearbeiten" text is displayed
      And the "email_label" textfield with "Terminbestätigung" text is displayed
      And the "email_value" textfield with the "^E-Mail-Adresse: [a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_edit_link" link with "Bearbeiten" text is displayed
      And the "sms_phone_number_label" textfield with "Termin-Erinnerung" text is displayed
      And the "sms_phone_number_value" textfield is displayed
      And the "sms_phone_number_edit_link" link with "Bearbeiten" text is displayed
      And the "confirm_button" button with "Bestätigen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    @raitt_drop3
    Examples:
          | product | cv   | close_screen         | depends_on   | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238228 | QANOV-238230 |

    Examples:
          | product | cv   | close_screen         | depends_on   | jira_id      |
          | o2de    | 14.2 | All Contact Channels | QANOV-238229 | QANOV-238231 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.LOC-1069 @jira.link.detects.OBO2DE-463 @manual @mobile @smoke
  Scenario Outline: A monoproduct BOX7 user without an appointment can access to the "Call Me Back Summary" screen
    A multiproduct user will see a "Product" section in this screen. Monoproduct users will not see that section.
    If the user writes concern details we will show as maximum of two lines of description for it. If user doesn't write
    concern details we will show a description to explain user can write concern details.
    If user doesn't fill the additional reminder we will show the "App notification" text.
    NOTE: the "Topic" section only will display an "Edit" link when the product selected has several topics (for a
    product with only a topic, it makes no sense to allow to edit it).
    Given user has a "box7" account type
      And user has "1" products different from "my_handy"
      And user has "0" pending appointments
      And user has the "Call Me Back Additional Reminder" module configured in CMS for "Call Me Back Additional Reminder" page
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Additional Reminder" page
     When fills the "sms_phone_number_inputtext" inputtext with the "123456789" text
      And clicks on the "next_button" button
     Then the "Call Me Back Summary" page is displayed
      And the "Rückrufservice" header is displayed
      And the "call_me_back_progression" progression bar is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Bitte überprüfe deine Daten und bestätige deinen Termin." text is displayed
      And the "product_label" textfield is not displayed
      And the "product_value" textfield is not displayed
      And the "product_edit_link" link is not displayed
      And the "topic_label" textfield with "Themengebiet" text is displayed
      And the "topic_value" textfield is displayed
      And the "appointment_label" textfield with "Details zum Termin" text is displayed
      And the "appointment_value" textfield is displayed
      And the "appointment_edit_link" link with "Bearbeiten" text is displayed
      And the "description_label" textfield with "Angaben zum Anliegen" text is displayed
      And the "description_value" textfield is displayed
      And the "description_edit_link" link with "Bearbeiten" text is displayed
      And the "callback_number_label" textfield with "Kontaktdaten" text is displayed
      And the "callback_number_value" textfield with the "Rückruf Nummer: \d+" format is displayed
      And the "callback_number_edit_link" link with "Bearbeiten" text is displayed
      And the "email_label" textfield with "Terminbestätigung" text is displayed
      And the "email_value" textfield with the "^E-Mail-Adresse: [a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_edit_link" link with "Bearbeiten" text is displayed
      And the "sms_phone_number_label" textfield with "Termin-Erinnerung" text is displayed
      And the "sms_phone_number_value" textfield is displayed
      And the "sms_phone_number_edit_link" link with "Bearbeiten" text is displayed
      And the "confirm_button" button with "Bestätigen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    Examples:
          | product | cv   | close_screen         | depends_on   | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238228 | QANOV-238232 |
          | o2de    | 14.2 | All Contact Channels | QANOV-238229 | QANOV-238233 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can see the Additional reminder section in the "Call Me Back Summary" screen when the additional reminder is not filled
    If user doesn't fill the additional reminder we will show the "App notification" text.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has not filled the "additional_reminder" field in the call me back flow
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     Then the "sms_phone_number_value" textfield with "Benachrichtigungen" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238230:QANOV-238232 | QANOV-238234 |
          | o2de    | 14.2 | QANOV-238231:QANOV-238233 | QANOV-238235 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can see the Additional reminder section in the "Call Me Back Summary" screen when the additional reminder is filled
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has filled the "additional_reminder" field in the call me back flow
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     Then the "sms_phone_number_value" textfield with the "SMS: \d+( )?\d+" format is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238230:QANOV-238232 | QANOV-238236 |
          | o2de    | 14.2 | QANOV-238231:QANOV-238233 | QANOV-238237 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.LOC-1069
  @jira.link.detects.O2DE-1626 @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can see the Description section in the "Call Me Back Summary" screen when the description is not filled
    If user doesn't write concern details we will show a description to explain user can write concern details.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has not filled the "description" field in the call me back flow
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     Then the "description_value" textfield with "Du kannst dein Anliegen beschreiben" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238230:QANOV-238232 | QANOV-238238 |
          | o2de    | 14.2 | QANOV-238231:QANOV-238233 | QANOV-238239 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1625
  @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can see the Description section in the "Call Me Back Summary" screen when the description is filled
    If the user writes concern details we will show as maximum of two lines of description for it.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has filled the "description" field in the call me back flow
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     Then the "description_value" textfield is displayed with a maximum of two lines

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238230:QANOV-238232 | QANOV-238240 |
          | o2de    | 14.2 | QANOV-238231:QANOV-238233 | QANOV-238241 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A multiproduct BOX7 user without an appointment can edit the product type from the "Call Me Back Summary" screen selecting a product with just one topic
    Given user has a "box7" account type
      And user has "several" products different from "my_handy"
      And user has "0" pending appointments
      And user has "1" topics with available slots for a product
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     When clicks on the "product_edit_link" link
      And the "Call Me Back Choose Product" page is displayed
      And clicks on any element in the "products_list" list that has "1" topics with available slots
     Then the "Call Me Back Summary" page is displayed
      And the "product_value" textfield with "[CONTEXT:product_list_selected]" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238230 | QANOV-305435 |
          | o2de    | 14.2 | QANOV-238231 | QANOV-305436 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A multiproduct BOX7 user without an appointment can edit the product type from the "Call Me Back Summary" screen selecting a product with several topics
    Given user has a "box7" account type
      And user has "several" products different from "my_handy"
      And user has "0" pending appointments
      And user has "several" topics with available slots for a product
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     When clicks on the "product_edit_link" link
      And the "Call Me Back Choose Product" page is displayed
      And clicks on any element in the "products_list" list that has "several" topics with available slots
      And the "Call Me Back Choose Topic" page is displayed
      And clicks on any element in the "topics_list" list that has available slots
     Then the "Call Me Back Summary" page is displayed
      And the "product_value" textfield with "[CONTEXT:product_list_selected]" text is displayed
      And the "topic_value" textfield with "[CONTEXT:topic_list_selected]" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238230 | QANOV-305437 |
          | o2de    | 14.2 | QANOV-238231 | QANOV-305438 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can edit the topic type from the "Call Me Back Summary" screen for a product with several topics
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user selected a product with "several" topics
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     When clicks on the "topic_edit_link" link
      And the "Call Me Back Choose Topic" page is displayed
      And clicks on any element in the "topics_list" list that has available slots
     Then the "Call Me Back Summary" page is displayed
      And the "topic_value" textfield with "[CONTEXT:topic_list_selected]" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238230:QANOV-238232 | QANOV-305439 |
          | o2de    | 14.2 | QANOV-238231:QANOV-238233 | QANOV-305440 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.OBO2DE-472
  @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment cannot edit the topic type from the "Call Me Back Summary" screen for a product with just one topic
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user selected a product with "1" topics
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     Then the "topic_edit_link" link is not displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238230:QANOV-238232 | QANOV-305441 |
          | o2de    | 14.2 | QANOV-238231:QANOV-238233 | QANOV-305442 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can edit the appointment time from the "Call Me Back Summary" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     When clicks on the "appointment_edit_link" link
      And the "Call Me Back Choose Time" page is displayed
      And clicks on the "date_selector" selector
      And clicks on the "1" element in the "date_selector_list" list
      And clicks on the "next_button" button
     Then the "Call Me Back Summary" page is displayed
      And the "appointment_value" textfield with "[CONTEXT:date_selector_list_selected]" text is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 14.0 | QANOV-238230:QANOV-238232 | QANOV-238244 |
          | o2de    | 14.2 | QANOV-238231:QANOV-238233 | QANOV-238245 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can edit the "<section>" section from the "Call Me Back Summary" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     When clicks on the "<field_id>_edit_link" link
      And the "Call Me Back Describe Concern" page is displayed
      And fills the "<field_id>_inputtext" inputtext with the "<field_value>" text
      And clicks on the "next_button" button
     Then the "Call Me Back Summary" page is displayed
      And the "<field_id>_value" textfield with "<field_value>" text is displayed

    Examples:
          | product | cv   | section             | field_id         | field_value              | depends_on                | jira_id      |
          | blaude  | 14.0 | Description         | description      | This is a new NOVUM test | QANOV-238230:QANOV-238232 | QANOV-238246 |
          | blaude  | 14.0 | Additional reminder | sms_phone_number | 987654321                | QANOV-238230:QANOV-238232 | QANOV-238247 |
          | o2de    | 14.2 | Description         | description      | This is a new NOVUM test | QANOV-238231:QANOV-238233 | QANOV-238248 |
          | o2de    | 14.2 | Additional reminder | sms_phone_number | 987654321                | QANOV-238231:QANOV-238233 | QANOV-238249 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can edit the "<section>" section from the "Call Me Back Summary" screen
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user is in the "Call Me Back Summary" page
     When clicks on the "<field_id>_edit_link" link
      And the "Call Me Back Contact Details" page is displayed
      And fills the "<field_id>_inputtext" inputtext with the "<field_value>" text
      And clicks on the "next_button" button
     Then the "Call Me Back Summary" page is displayed
      And the "<field_id>_value" textfield with "<field_value>" text is displayed

    Examples:
          | product | cv   | section                  | field_id        | field_value  | depends_on                | jira_id      |
          | blaude  | 14.0 | Your contact details     | callback_number | 123456789    | QANOV-238230:QANOV-238232 | QANOV-238250 |
          | blaude  | 14.0 | Appointment confirmation | email_number    | new@mail.com | QANOV-238230:QANOV-238232 | QANOV-238251 |
          | o2de    | 14.2 | Your contact details     | callback_number | 123456789    | QANOV-238231:QANOV-238233 | QANOV-238252 |
          | o2de    | 14.2 | Appointment confirmation | email_number    | new@mail.com | QANOV-238231:QANOV-238233 | QANOV-238253 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.LOC-1069 @manual @mobile @smoke
  Scenario Outline: A BOX7 user without an appointment can finish the "Call me back" flow successfully
    After clicking in the "confirm_button", the text of this button will be replaced with "Wird bestätigt" until the
    Success Feedback screen is displayed.
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user has the "Call Me Back Success Feedback" module configured in CMS for "Call Me Back Success Feedback" page
      And user is in the "Call Me Back Summary" page
     When clicks on the "confirm_button" button
     Then the "Call Me Back Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir rufen dich zurück!" text is displayed
      And the "success_message" textfield with the "Dein Rückruf-Termin ist am \d+ (Jan.|Feb.|März|Apr.|Mai|Jun.|Jul.|Aug.|Sept.|Okt.|Nov.|Dez.) um \d{2}:\d{2}. Ein Service Mitarbeiter wird sich zum geplanten Termin bei dir melden." format is displayed
      And the "add_to_calendar_button" button with "Zum Kalender hinzufügen" text is displayed
      And the "back_to_support_button" button with "Zurück zu Hilfe" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    @raitt_drop3
    Examples:
          | product | cv   | close_screen         | depends_on                | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238230:QANOV-238232 | QANOV-238254 |

    Examples:
          | product | cv   | close_screen         | depends_on                | jira_id      |
          | o2de    | 14.2 | All Contact Channels | QANOV-238231:QANOV-238233 | QANOV-238255 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go back to the Support screen from the "Call Me Back Success Feedback" screen
    Given user has a "box7" account type
      And user has the "Call Me Back Success Feedback" module configured in CMS for "Call Me Back Success Feedback" page
      And user is in the "Call Me Back Success Feedback" page
     When clicks on the "back_to_support_button" button
     Then the "Support" page is displayed
      And the "Hilfe" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238254 | QANOV-238256 |
          | o2de    | 14.2 | QANOV-238255 | QANOV-238257 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can see the new "Call me back" appointment scheduled
    Given user has a "box7" account type
      And user has the "Call Me Back Success Feedback" module configured in CMS for "Call Me Back Success Feedback" page
      And user is in the "Call Me Back Success Feedback" page
     When clicks on the "back_to_support_button" button
      And the "Support" page is displayed
      And clicks on the "contact.call_me_back" entrypoint
     Then the "Call Me Back Scheduled Calls" page is displayed
      And the new scheduled appointment is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238254 | QANOV-238258 |
          | o2de    | 14.2 | QANOV-238255 | QANOV-238259 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can add the appointment to his/her calendar from the "Call Me Back Success Feedback" screen in android devices
    Given user has a "box7" account type
      And user has the "Call Me Back Success Feedback" module configured in CMS for "Call Me Back Success Feedback" page
      And user is in the "Call Me Back Success Feedback" page
     When clicks on the "add_to_calendar_button" button
     Then the "Calendar" app is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238254 | QANOV-238260 |
          | o2de    | 14.2 | QANOV-238255 | QANOV-238261 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user with calendar permissions granted can add the appointment to his/her calendar from the "Call Me Back Success Feedback" screen in iOS devices
    Given user has a "box7" account type
      And user has "granted" "calendar" permissions
      And user has the "Call Me Back Success Feedback" module configured in CMS for "Call Me Back Success Feedback" page
      And user is in the "Call Me Back Success Feedback" page
     When clicks on the "add_to_calendar_button" button
     Then the "Calendar" app is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238254 | QANOV-238262 |
          | o2de    | 14.2 | QANOV-238255 | QANOV-238263 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1627 @manual
  @mobile @regression
  Scenario Outline: A BOX7 user who just installed the app cannot add the appointment to his/her calendar from the "Call Me Back Success Feedback" screen in iOS devices: a permissions popup is displayed
    Given user has a "box7" account type
      And user just installed the application
      And user has the "Call Me Back Success Feedback" module configured in CMS for "Call Me Back Success Feedback" page
      And user is in the "Call Me Back Success Feedback" page
     When clicks on the "add_to_calendar_button" button
     Then the "Calendar Permissions Popup" popup is displayed
      And the "title" textfield with "<app_name> quiere acceder a tu calendario" text is displayed
      And the "body" textfield with "Du kannst erst Ereignisse im Kalender erstellen, wenn du diesen Zugriff erlaubst" text is displayed
      And the "continue_button" button with "OK" text is displayed
      And the "cancel_button" button with "Don't allow" text is displayed

    Examples:
          | product | cv   | app_name    | depends_on   | jira_id      |
          | blaude  | 14.0 | "Mein Blau" | QANOV-238254 | QANOV-238264 |
          | o2de    | 14.2 | "Mein O2"   | QANOV-238255 | QANOV-238265 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user who just installed the app denies calendar permissions from the "Call Me Back Success Feedback" screen in iOS devices
    Given user has a "box7" account type
      And user just installed the application
      And user has the "Call Me Back Success Feedback" module configured in CMS for "Call Me Back Success Feedback" page
      And user is in the "Call Me Back Success Feedback" page
     When clicks on the "add_to_calendar_button" button
      And the "Calendar Permissions Popup" popup is displayed
      And clicks on the "cancel_button" button
     Then the "Call Me Back Success Feedback" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238264 | QANOV-238266 |
          | o2de    | 14.2 | QANOV-238265 | QANOV-238267 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user who just installed the app grants calendar permissions from the "Call Me Back Success Feedback" screen in iOS devices
    Given user has a "box7" account type
      And user just installed the application
      And user has the "Call Me Back Success Feedback" module configured in CMS for "Call Me Back Success Feedback" page
      And user is in the "Call Me Back Success Feedback" page
     When clicks on the "add_to_calendar_button" button
      And the "Calendar Permissions Popup" popup is displayed
      And clicks on the "continue_button" button
     Then the "Calendar" app is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238264 | QANOV-238268 |
          | o2de    | 14.2 | QANOV-238265 | QANOV-238269 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.OBO2DE-464
  @manual @mobile @regression
  Scenario Outline: A BOX7 user without an appointment can finish the "Call me back" flow unsuccessfully
    Given user has a "box7" account type
      And user has "0" pending appointments
      And user has the "Call Me Back Summary" module configured in CMS for "Call Me Back Summary" page
      And user has the "Call Me Back Error Feedback" module configured in CMS for "Call Me Back Error Feedback" page
      And user is in the "Call Me Back Summary" page
     When clicks on the "confirm_button" button
      And there is an error confirming the call me back appointment
     Then the "Call Me Back Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Bei deiner Anfrage gab es einen Fehler" text is displayed
      And the "back_to_support_button" button with "Zurück zu Hilfe" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "<close_screen>" page is displayed

    Examples:
          | product | cv   | close_screen         | depends_on                | jira_id      |
          | blaude  | 14.0 | Call Me Back Info    | QANOV-238230:QANOV-238232 | QANOV-238270 |
          | o2de    | 14.2 | All Contact Channels | QANOV-238231:QANOV-238233 | QANOV-238271 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go back to the Support screen from the "Call Me Back Error Feedback" screen
    Given user has a "box7" account type
      And user has the "Call Me Back Error Feedback" module configured in CMS for "Call Me Back Error Feedback" page
      And user is in the "Call Me Back Error Feedback" page
     When clicks on the "back_to_support_button" button
     Then the "Support" page is displayed
      And the "Hilfe" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238270 | QANOV-238272 |
          | o2de    | 14.2 | QANOV-238271 | QANOV-238273 |

  @jira.<jira_id> @<client> @<product> @TBD @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go to previous screen from the "Call Me Back Error Feedback" screen on <client> devices
    Given user has a "box7" account type
      And user has the "Call Me Back Error Feedback" module configured in CMS for "Call Me Back Error Feedback" page
      And user is in the "Call Me Back Error Feedback" popup
     When clicks on the <button> button
     Then the "Change Name Step Four" page is displayed
      And the "Change name" header is displayed

    Examples:
          | product | cv   | client  | button                           | depends_on   | jira_id      |
          | blaude  | 14.0 | android | native "back"                    | QANOV-238270 | QANOV-238274 |
          | blaude  | 14.0 | ios     | "navigation_top_bar.back_button" | QANOV-238270 | QANOV-238275 |
          | o2de    | 14.2 | android | native "back"                    | QANOV-238271 | QANOV-238276 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | QANOV-238271 | QANOV-238277 |

  @jira.QANOV-238278 @blaude @android @ber @ios @jira.cv.14.0 @jira.link.detects.LOC-1069 @manual @mobile @sanity
  @jira.link.parent_test_plan.QANOV-402198 @raitt_drop3
  Scenario: A BOX7 user with an appointment can access to the "Call me back Scheduled Calls" screen from the Support tab
    The information about a previously scheduled call should be provided by the API.
    Given user has a "box7" account type
      And user has "1" pending appointments
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Call Me Back Scheduled Calls" module configured in CMS for "Call Me Back Scheduled Calls" page
      And user is in the "Support" page
     When clicks on the "contact.call_me_back" entrypoint
     Then the "Call Me Back Scheduled Calls" page is displayed
      And the "Rückrufservice" header is displayed
      And the "title" textfield with "DEINE GEPLANTEN ANRUFE" text is displayed
      And the "scheduled_call" module is displayed
      And the "scheduled_call.icon" icon is displayed
      And the "scheduled_call.topic" textfield is displayed
      And the "scheduled_call.date" textfield with the "\d{2}. (Jan.|Feb.|März|Apr.|Mai|Jun.|Jul.|Aug.|Sept.|Okt.|Nov.|Dez.) \d{4}" format is displayed
      And the "scheduled_call.hour" textfield with the "\d{2}:\d{2} - \d{2}:\d{2}" format is displayed
      And the "scheduled_call.edit_appointment_button" button with "Ändern" text is displayed
      And the "scheduled_call.cancel_appointment_link" link with "Stornieren" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @manual @mobile @regression @jira.link.parent_test_plan.QANOV-402198
  Scenario Outline: A monoproduct BOX7 user with an appointment won't see the product tag in the "Call me back Scheduled Calls" screen
    Given user has a "box7" account type
      And user has "1" products different from "my_handy"
      And user has "1" pending appointments
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Call Me Back Scheduled Calls" module configured in CMS for "Call Me Back Scheduled Calls" page
      And user is in the "Call Me Back Scheduled Calls" page
     Then the "scheduled_call.product_tag" textfield is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-341279 |
          | o2de    | QANOV-341280 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @manual @mobile @regression @jira.link.parent_test_plan.QANOV-402198
  Scenario Outline: A multiproduct BOX7 user with an appointment can see the product tag in the "Call me back Scheduled Calls" screen
    Given user has a "box7" account type
      And user has "several" products
      And user has "1" pending appointments
      And user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Call Me Back Scheduled Calls" module configured in CMS for "Call Me Back Scheduled Calls" page
      And user is in the "Call Me Back Scheduled Calls" page
     Then the "scheduled_call.product_tag" textfield is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-341281 |
          | o2de    | QANOV-341282 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.LOC-1069
  @manual @mobile @smoke
  Scenario Outline: A BOX7 user with an appointment can see the details of a scheduled appointment
    The user will be able to edit the appointment details from this screen
    Given user has a "box7" account type
      And user has "1" pending appointments
      And user has the "Call Me Back Scheduled Calls" module configured in CMS for "Call Me Back Scheduled Calls" page
      And user is in the "Call Me Back Scheduled Calls" page
     When clicks on the "scheduled_call.edit_appointment_button" button
     Then the "Call Me Back Summary" page is displayed
      And the "Rückrufservice" header is displayed
      And the "header.title" textfield with "Rückrufservice" text is displayed
      And the "header.description" textfield with "Details zu deinem Termin" text is displayed
      And the "product_label" textfield is not displayed
      And the "product_value" textfield is not displayed
      And the "product_edit_link" link is not displayed
      And the "topic_label" textfield with "Themengebiet" text is displayed
      And the "topic_value" textfield is displayed
      And the "topic_edit_link" link is not displayed
      And the "appointment_label" textfield with "Details zum Termin" text is displayed
      And the "appointment_value" textfield is displayed
      And the "appointment_edit_link" link with "Bearbeiten" text is displayed
      And the "description_label" textfield with "Angaben zum Anliegen" text is displayed
      And the "description_value" textfield is displayed
      And the "description_edit_link" link with "Bearbeiten" text is displayed
      And the "callback_number_label" textfield with "Kontaktdaten" text is displayed
      And the "callback_number_value" textfield with the "Rückruf Nummer: \d+" format is displayed
      And the "callback_number_edit_link" link with "Bearbeiten" text is displayed
      And the "email_label" textfield with "Terminbestätigung" text is displayed
      And the "email_value" textfield with the "^E-Mail-Adresse: [a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_edit_link" link with "Bearbeiten" text is displayed
      And the "sms_phone_number_label" textfield with "Termin-Erinnerung" text is displayed
      And the "sms_phone_number_value" textfield is displayed
      And the "sms_phone_number_edit_link" link with "Bearbeiten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238278 | QANOV-238280 |
          | o2de    | 14.2 | QANOV-238279 | QANOV-238281 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user with an appointment taps on the "Cancel appointment" link of a scheduled appointment: a confirmation popup is displayed
    Given user has a "box7" account type
      And user has "1" pending appointments
      And user has the "Call Me Back Scheduled Calls" module configured in CMS for "Call Me Back Scheduled Calls" page
      And user is in the "Call Me Back Scheduled Calls" page
     When clicks on the "scheduled_call.cancel_appointment_link" link
     Then the "Cancel Appointment Confirmation Popup" popup is displayed
      And the "title" textfield with "Möchtest du deinen Rückruftermin stornieren?" text is displayed
      And the "continue_button" button with the "(Termin stornieren|TERMIN STORNIEREN)" format is displayed
      And the "cancel_button" button with the "(Abbrechen|ABBRECHEN)" format is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238278 | QANOV-238282 |
          | o2de    | 14.2 | QANOV-238279 | QANOV-238283 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user cancels the appointment cancellation
    Given user has a "box7" account type
      And user has "1" pending appointments
      And user has the "Call Me Back Scheduled Calls" module configured in CMS for "Call Me Back Scheduled Calls" page
      And user is in the "Cancel Appointment Confirmation Popup" popup
     When clicks on the "cancel_button" button
     Then the "Call Me Back Scheduled Calls" page is displayed
      And the "scheduled_call" module is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238282 | QANOV-238284 |
          | o2de    | 14.2 | QANOV-238283 | QANOV-238285 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A BOX7 user confirms the appointment cancellation: appointment cancelled successfully
    Given user has a "box7" account type
      And user has "1" pending appointments
      And user has the "Call Me Back Scheduled Calls" module configured in CMS for "Call Me Back Scheduled Calls" page
      And user has the "Appointment Cancellation Success Feedback" module configured in CMS for "Appointment Cancellation Success Feedback" page
      And user is in the "Cancel Appointment Confirmation Popup" popup
     When clicks on the "continue_button" button
     Then the "Appointment Cancellation Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deinen Rückruftermin storniert." text is displayed
      And the "success_message" textfield with "Du kannst jederzeit einen neuen Rückruftermin vereinbaren." text is displayed
      And the "back_to_support_button" button with "Zurück zu Hilfe" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238282 | QANOV-238286 |
          | o2de    | 14.2 | QANOV-238283 | QANOV-238287 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go back to the Support screen from the "Appointment Cancellation Success Feedback" screen
    Given user has a "box7" account type
      And user has the "Appointment Cancellation Success Feedback" module configured in CMS for "Appointment Cancellation Success Feedback" page
      And user is in the "Appointment Cancellation Success Feedback" page
     When clicks on the "back_to_support_button" button
     Then the "Support" page is displayed
      And the "Hilfe" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238286 | QANOV-238288 |
          | o2de    | 14.2 | QANOV-238287 | QANOV-238289 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A BOX7 user who cancelled his/her appointment cannot see it anymore
    Given user has a "box7" account type
      And user has the "Appointment Cancellation Success Feedback" module configured in CMS for "Appointment Cancellation Success Feedback" page
      And user is in the "Appointment Cancellation Success Feedback" page
     When clicks on the "back_to_support_button" button
      And the "Support" page is displayed
      And clicks on the "contact.call_me_back" entrypoint
     Then the "Call Me Back Info" page is displayed
      And the "Rückrufservice" header is displayed
      And the "title" textfield with "Rückrufservice" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238286 | QANOV-238290 |
          | o2de    | 14.2 | QANOV-238287 | QANOV-238291 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user confirms the appointment cancellation: appointment cancelled unsuccessfully
    Given user has a "box7" account type
      And user has "1" pending appointments
      And user has the "Call Me Back Scheduled Calls" module configured in CMS for "Call Me Back Scheduled Calls" page
      And user has the "Appointment Cancellation Error Feedback" module configured in CMS for "Appointment Cancellation Error Feedback" page
      And user is in the "Cancel Appointment Confirmation Popup" popup
     When clicks on the "continue_button" button
      And there is an error cancelling the call me back appointment
     Then the "Appointment Cancellation Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send your request" text is displayed
      And the "error_message" textfield with "Please try again later" text is displayed
      And the "back_to_support_button" button with "Zurück zu Hilfe" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238282 | QANOV-238292 |
          | o2de    | 14.2 | QANOV-238283 | QANOV-238293 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go back to the Support screen from the "Appointment Cancellation Error Feedback" screen
    Given user has a "box7" account type
      And user has the "Appointment Cancellation Error Feedback" module configured in CMS for "Appointment Cancellation Error Feedback" page
      And user is in the "Appointment Cancellation Error Feedback" page
     When clicks on the "back_to_support_button" button
     Then the "Support" page is displayed
      And the "Hilfe" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 14.0 | QANOV-238292 | QANOV-238294 |
          | o2de    | 14.2 | QANOV-238293 | QANOV-238295 |

  @jira.<jira_id> @<client> @<product> @TBD @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can go to previous screen from the "Appointment Cancellation Error Feedback" screen on <client> devices
    Given user has a "box7" account type
      And user has the "Appointment Cancellation Error Feedback" module configured in CMS for "Appointment Cancellation Error Feedback" page
      And user is in the "Appointment Cancellation Error Feedback" popup
     When clicks on the <button> button
     Then the "Call Me Back Scheduled Calls" page is displayed
      And the "scheduled_call" module is displayed

    Examples:
          | product | cv   | client  | button                           | depends_on   | jira_id      |
          | blaude  | 14.0 | android | native "back"                    | QANOV-238292 | QANOV-238296 |
          | blaude  | 14.0 | ios     | "navigation_top_bar.back_button" | QANOV-238292 | QANOV-238297 |
          | o2de    | 14.2 | android | native "back"                    | QANOV-238293 | QANOV-238298 |
          | o2de    | 14.2 | ios     | "navigation_top_bar.back_button" | QANOV-238293 | QANOV-238299 |
