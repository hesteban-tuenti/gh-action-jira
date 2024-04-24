# -*- coding: utf-8 -*-
@jira.QANOV-235466
Feature: All contact channels


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @sanity
  Scenario Outline: A BOX7 user with one product can access "Contact Reasons" page from Support page
    Motives will have to come from the API for each product correctly.
    Given user has a "box7" account type
      And user has "1" products
      And user is in the "Support" page
     When clicks on the "contact_all_contact_channels" entrypoint
     Then the "Contact Reasons" page is displayed
      And the "Alle Kontaktkanäle" header is displayed
      And the "title" textfield with "Themengebiet wählen" text is displayed
      And the "reasons.list" list is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    @manual
    Examples:
          | product | cv   | detects                       | parent_test_plan          | jira_id      |
          | o2de    | 14.2 | LOC-1080:OBO2DE-716:O2DE-2879 | QANOV-402198:QANOV-437471 | QANOV-235467 |

    @automatic @live @next @raitt_drop3
    Examples:
          | product | cv   | detects  | parent_test_plan | jira_id      |
          | blaude  | 14.0 | LOC-1080 | QANOV-402198     | QANOV-235468 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.QANOV-402198 @mobile @smoke
  Scenario Outline: A BOX7 user with several products can access to select a product in the all contact channels entrypoint from Support page
    Given user has a "box7" account type
      And user has "several" products
      And user is in the "Support" page
     When clicks on the "contact_all_contact_channels" entrypoint
     Then the "Line Disambiguation" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "lines" list is displayed
      And each element in the "lines" list has the "icon" field
      And each element in the "lines" list has the "phone_number" field
      And each element in the "lines" list has the "product_type" field
      And each element in the "lines" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    @manual
    Examples:
          | product | cv   | detects   | jira_id      |
          | o2de    | 14.2 | O2DE-2879 | QANOV-235469 |

    @automatic @live @next
    Examples:
          | product | cv   | detects | jira_id      |
          | blaude  | 14.0 |         | QANOV-235470 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.LOC-1080
  @jira.link.parent_test_plan.QANOV-402198 @manual @mobile @smoke
  Scenario Outline: A BOX7 user with several products can access "Contact Reasons" page from Choose product page
    Motives will have to come from the API for each product correctly.
    Given user has a "box7" account type
      And user has "several" products
      And user is in the "Line Disambiguation" page
     When clicks on any element in the "line.list" list
     Then the "Contact Reasons" page is displayed
      And the "Alle Kontaktkanäle" header is displayed
      And the "title" textfield with "Themengebiet wählen" text is displayed
      And the "reasons.list" list is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-235469 | QANOV-235471 |
          | blaude  | 14.0 | QANOV-235470 | QANOV-235472 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @mobile @smoke @automatic @webapp @live @next
  Scenario Outline: A BOX7 user can access the All Contact Channels page from the Contact Reasons screen
    Possible channels: call me back, store (just for MeinO2), click to call.
    The order of the channels will come from the API.
    Given user has a "box7" account type
      And user has "1" products
      And user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" entrypoints list
     Then the "All Contact Channels" page is displayed
      And the "header.pretitle" textfield with "[CONTEXT:reason_clicked]" text is displayed
      And the "header.title" textfield with "Folgende Kontaktmöglichkeiten stehen dir zur Verfügung" text is displayed
      And the "alert" element is on display
      And the "alert.faq_icon" icon is displayed
      And the "alert.title" textfield with "Du hast Fragen?" text is displayed
      And the "alert.description" textfield with the "Hier findest du die Antworten." format is displayed
      And the "alert.single_action_link" link with "Zu allen FAQs" text is displayed
      And the "options.list" list is displayed

    Examples:
          | product | cv   | depends_on                | detects | jira_id      |
          | o2de    | 14.2 | QANOV-235467:QANOV-235471 |         | QANOV-235473 |

    @raitt_drop3
    Examples:
          | product | cv   | depends_on                | detects                        | jira_id      |
          | blaude  | 14.0 | QANOV-235468:QANOV-235472 | OBO2DE-471:LOC-1123:OBO2DE-674 | QANOV-235474 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @mobile @regression
  Scenario Outline: A BOX7 user can access the FAQ screen from the "All Contact Channels" screen
    Given user has a "box7" account type
      And user has "1" products
      And user is in the "Support" page
     When clicks on the "contact_all_contact_channels" entrypoint
      And the "Contact Reasons" page is displayed
      And clicks on any element in the "reasons.list" entrypoints list
      And the "All Contact Channels" page is displayed
      And clicks on the "alert.single_action_link" link
     Then the internal webview with "FAQ" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "All Contact Channels" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    @manual
    Examples:
          | product | cv   | depends_on   | detects   | jira_id      |
          | o2de    | 14.2 | QANOV-235473 | O2DE-3399 | QANOV-235491 |

    @automatic @live @next
    Examples:
          | product | cv   | depends_on   | detects | jira_id      |
          | blaude  | 14.0 | QANOV-235474 |         | QANOV-235492 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @mobile @smoke @automatic @webapp @live @next
  Scenario Outline: A BOX7 user will see the details of a Call me back channel
    Given user has a "box7" account type
      And user has any "<user_products>" product in "active" status
      And user has "1" products
      And user has a support reason with "call_me_back" channel available
      And user is in the "Contact Reasons" page
     When clicks on the element with "title" field with "[CONTEXT:reason_with_channel]" value of the "reasons.list" list
     Then the "All Contact Channels" page is displayed
      And the "call_me_back" module is displayed
      And the "call_me_back.icon" icon is displayed
      And the "call_me_back.title" textfield with "Rückrufservice" text is displayed
      And the "call_me_back.button_primary" button with "Rückruftermin vereinbaren" text is displayed

    Examples:
          | product | cv   | user_products                | depends_on   | detects    | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-235473 |            | QANOV-235475 |
          | blaude  | 14.0 | mobile_line                  | QANOV-235474 | OBO2DE-704 | QANOV-235476 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can access to "Call me back" flow from call me back module
    Given user has a "box7" account type
      And user has any "<user_products>" product in "active" status
      And user has "<pending_appointments>" pending appointments
      And user has "several" products
      And user has "several" topics with available slots for a product
      And user has a reason with "call_me_back" channels available
      And user is in the "Choose Product" page
     When clicks on any element in the "products_list" list that has "<num_topics>" topics
      And the "Contact Reasons" page is displayed
      And clicks on any element in the "reasons.list" list with a "call_me_back" contact channel
      And the "All Contact Channels" page is displayed
      And clicks on the "call_me_back.button_primary" button
     Then the "<destination_page>" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    Examples:
          | product | cv   | user_products                | pending_appointments | num_topics | destination_page             | depends_on   | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | 0                    | 1          | Call Me Back Choose Time     | QANOV-235475 | QANOV-235477 |
          | o2de    | 14.2 | mobile_line;internet_at_home | 0                    | several    | Call Me Back Choose Topic    | QANOV-235475 | QANOV-235479 |
          | o2de    | 14.2 | mobile_line;internet_at_home | 1                    | any        | Call Me Back Scheduled Calls | QANOV-235475 | QANOV-553426 |
          | blaude  | 14.0 | mobile_line                  | 0                    | 1          | Call Me Back Choose Time     | QANOV-235476 | QANOV-235478 |
          | blaude  | 14.0 | mobile_line                  | 0                    | several    | Call Me Back Choose Topic    | QANOV-235476 | QANOV-235480 |
          | blaude  | 14.0 | mobile_line                  | 1                    | any        | Call Me Back Scheduled Calls | QANOV-235476 | QANOV-553428 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user won't see the call me back module when there are no available slots
    Given user has a "box7" account type
      And user has any "<user_products>" product in "active" status
      And user has no available slots for call me back
      And user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" list without a "call_me_back" contact channel
      And the "All Contact Channels" page is displayed
      And the "call_me_back" module is not displayed

    Examples:
          | product | cv   | user_products                | depends_on   | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-235473 | QANOV-235481 |
          | blaude  | 14.0 | mobile_line                  | QANOV-235474 | QANOV-235482 |

  @jira.QANOV-235483 @android @ber @ios @jira.cv.Future @jira.link.depends_on.QANOV-235473 @manual @mobile @o2de @smoke
  Scenario: An o2de user with "location" permissions granted will see the details of a Shop channel
    Given user has a reason with "shop" channels available
      And user has "granted" "location" permissions
      And user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" list with a "shop" contact channel
     Then the "All Contact Channels" page is displayed
      And the "Alle Kontaktkanäle" header is displayed
      And the "shop" module is displayed
      And the "shop.icon" element is displayed
      And the "shop.name" textfield with "Visit our shop" text is displayed
      And the "shop.shop_detail" button with "Go to the shop detail" text is displayed

  @jira.QANOV-235485 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-235483 @manual @mobile @o2de @regression
  Scenario: An o2de user can access Shop details from Shop module with location permissions
    Given user has a reason with "shop" channels available
      And user has "granted" "location" permissions
      And user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" list with a "shop" contact channel
      And the "All Contact Channels" page is displayed
      And clicks on the "shop.shop_detail" button
     Then the internal webview is displayed
      And the "o2 Shop suchen: Alle Filialen in der Nähe | o2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-235487 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-235473 @manual @mobile @o2de @regression
  Scenario: An o2de user without "location" permissions granted will see the details of a Shop channel
    Given user has a reason with "shop" channels available
      And user has "denied" "location" permissions
      And user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" list with a "shop" contact channel
     Then the "All Contact Channels" page is displayed
      And the "Alle Kontaktkanäle" header is displayed
      And the "shop" module is displayed
      And the "shop.icon" element is displayed
      And the "shop.name" textfield with "Visit our shop" text is displayed
      And the "shop.description" textfield with "An specialist will atend all your doubts" text is displayed
      And the "shop.shop_detail" button with "Find a shop" text is displayed

  @jira.QANOV-235489 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-235487 @manual @mobile @o2de @regression
  Scenario: An o2de user can access Shop details from Shop module without location permissions
    Given user has a reason with "shop" channels available
      And user has "denied" "location" permissions
      And user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" list with a "shop" contact channel
      And the "All Contact Channels" page is displayed
      And clicks on the "shop.shop_detail" button
     Then the internal webview is displayed
      And the "o2 Shop suchen: Alle Filialen in der Nähe | o2" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.OBO2DE-704 @mobile @smoke @automatic @webapp @live @next
  Scenario Outline: A BOX7 user will see the details of a Click to call channel
    Given user has a "box7" account type
      And user has "1" products
      And user has a support reason with "click_to_call" channel available
      And user is in the "Contact Reasons" page
     When clicks on the element with "title" field with "[CONTEXT:reason_with_channel]" value of the "reasons.list" list
     Then the "All Contact Channels" page is displayed
      And the "click_call" module is displayed
      And the "click_call.icon" icon is displayed
      And the "click_call.title" textfield with "Hotline" text is displayed
      And the "click_call.button_primary" button with "Jetzt anrufen" text is displayed
      And the "click_call.link" link with "Details zur Hotline" text is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-235473 | QANOV-235490 |
          | blaude  | 14.0 | QANOV-235474 | QANOV-305227 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A BOX7 user can call the Hotline from "Click to call" module
    Given user has a "box7" account type
      And user has a reason with "click_call" channels available
      And user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" list with a "click_call" contact channel
      And the "All Contact Channels" page is displayed
      And clicks on the "click_call.button" button
     Then the "dialer" app is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-235490 | QANOV-235498 |
          | blaude  | 14.0 | QANOV-235491 | QANOV-235499 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @manual @mobile @regression
  Scenario Outline: A BOX7 user can access to the "Click to call" flow from "Click to call" module
    Given user has a "box7" account type
      And user has a reason with "click_call" channels available
      And user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" list with a "click_call" contact channel
      And the "All Contact Channels" page is displayed
      And clicks on the "click_call.link" link
     Then the "<destination_page>" page is displayed

    Examples:
          | product | cv   | destination_page              | depends_on   | detects    | jira_id      |
          | o2de    | 14.2 | Click To Call Choose Language | QANOV-235490 |            | QANOV-235500 |
          | blaude  | 14.0 | Click To Call Choose Topic    | QANOV-235491 | OBO2DE-710 | QANOV-235501 |

  @jira.QANOV-444695 @android @ber @ios @jira.cv.Future @jira.link.depends_on.QANOV-235473 @automatic @mobile @o2de @smoke
  @webapp @next @live
  Scenario: An o2de user will see the details of a Contact Form channel
    Given user is in the "Contact Reasons" page
     When clicks on any element in the "reasons.list" list
     Then the "All Contact Channels" page is displayed
      And the "Alle Kontaktkanäle" header is displayed
      And the "contact_form" module is displayed
      And the "contact_form.icon" icon is displayed
      And the "contact_form.title" textfield with "Kontaktformular" text is displayed
      And the "contact_form.button_primary" button with "Zum Kontaktformular" text is displayed

  @jira.QANOV-444696 @android @ios @jira.cv.Future @jira.link.depends_on.QANOV-444695 @manual @mobile @o2de @regression
  Scenario: An o2de user can access to the "Contact Form" webview from  the "All Contact Channels" screen
    Given user is in the "All Contact Channels" page
     When clicks on the "contact_form.button" button
     Then the internal webview is displayed
      And the "Kontaktformular" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed
