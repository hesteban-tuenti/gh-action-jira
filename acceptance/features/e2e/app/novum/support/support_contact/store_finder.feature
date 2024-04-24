# -*- coding: utf-8 -*-
@jira.QANOV-235584
Feature: Store Finder


  @jira.QANOV-235585 @android @ber @ios @jira.cv.14.4 @manual @mobile @o2de @sanity
  Scenario: User can access to the Store finder webview
    For the first Scope, only this scenario will be available. For the future, the following scenarios with the native
    flow should be added to the test plan.
    Given user is in the "Support" page
     When clicks on the "contact.shop_finder" entrypoint
     Then the external webview is displayed
      And the "o2 Shop suchen: Alle Filialen in der Nähe | o2" header is displayed
      And the "Jetzt deinen O₂ Shop finden" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-235586 @android @ber @ios @jira.cv.Future @manual @mobile @o2de @sanity
  Scenario: User with granted location permissions access to Store finder page without seeing the permissions popup
    Given user has "granted" "location" permissions
      And user is in the "Support" page
     When clicks on the "contact.shop_finder" entrypoint
     Then the "Store Location" page is displayed
      And the "Store finder" header is displayed
      And the "search_box" inputtext with the current location is displayed
      And the "map" tab is selected
      And the "list" tab is displayed
      And the "store_map" map is displayed
      And the "current_location" is displayed on the map
      And the near stores are displayed on the "store_map" map
      And the "filters" button is displayed

  @jira.QANOV-235587 @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User with denied location permissions will see the permission pop up in the store location page
    Given user has "denied" "location" permissions
      And user is in the "Support" page
     When clicks on the "contact.shop_finder" entrypoint
     Then the "Grant Location Permission" popup is displayed
      And the "title" textfield with "Allow Mein O2 to use your location?" text is displayed
      And the "description" textfield with "Mein O2 needs your permission to use your location" text is displayed
      And the "allow_while_use" button is displayed
      And the "allow_once" button is displayed
      And the "denied" button is displayed

  @jira.QANOV-235588 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User with denied location permissions will see the Store finder page after allowing the location permission while using the app
    Given user has "denied" "location" permissions
      And user is in the "Support" page
     When clicks on the "contact.shop_finder" entrypoint
      And the "Grant Location Permission" popup is displayed
      And clicks on "allow_while_use" button
     Then the "Store Location" page is displayed
      And the "search_box" inputtext with the "TBD" placeholder is displayed
      And the "map" tab is selected
      And the "list" tab is displayed
      And the "store_map" map is displayed
      And the "current_location" is displayed on the map
      And the "filters" button is displayed

  @jira.QANOV-235589 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User with denied location permissions will see the Store finder page after allowing the location permission just once
    Given user has "denied" "location" permissions
      And user is in the "Support" page
     When clicks on the "contact.shop_finder" entrypoint
      And the "Grant Location Permission" popup is displayed
      And clicks on the "allow_once" button
     Then the "Store Location" page is displayed
      And the "search_box" inputtext with the "TBD" placeholder is displayed
      And the "map" tab is selected
      And the "list" tab is displayed
      And the "store_map" map is displayed
      And the "current_location" is displayed on the map
      And the "filters" button is displayed

  @jira.QANOV-235590 @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User will see the location permission pop up again if he selected allow once
    Given user has "denied" "location" permissions
      And user is in the "Support" page
     When clicks on the "contact.shop_finder" entrypoint
      And the "Grant Location Permission" popup is displayed
      And clicks on the "allow_once" button
      And terminates the app
      And launches the app
      And user is in the "Support" page
     When clicks on the "contact.store_location" entrypoint
     Then the "Grant Location Permission" popup is displayed

  @jira.QANOV-235591 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User with denied location permissions will see the Store finder page after denying the location permission
    Given user has "denied" "location" permissions
      And user is in the "Store Location" page
     Then the "search_box" inputtext with the "TBD" placeholder is displayed
      And the "map" tab is selected
      And the "list" tab is displayed
      And the "store_map" map is not displayed
      And the "no_permissions_icon" icon is displayed
      And the "no_permissions_description" textfield with "Please use the search box to find a shop" text is displayed

  @jira.QANOV-235592 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User with denied location permissions can search an address in the search box and see it in the map
    Given user has "denied" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "map" tab
      And fills the "search_box" inputtext with the "TBD" text
     Then the "TBD" address is displayed in the "store_map" map
      And the near stores are displayed on the "store_map" map

  @jira.QANOV-235593 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User who is in the Store location page will see the search in this area button if moves around the map
    Given user is in the "Store Location" page
     When clicks on the "map" tab
      And moves the position on the "store_map" map
     Then the "search_in_area" button with "Search in this area" text is displayed

  @jira.QANOV-235594 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User who is in the Store location page can search the shops in a new position in the map
    Given user is in the "Store Location" page
     When clicks on the "map" tab
      And moves the position on the "store_map" map
      And clicks on the "search_in_area" button
     Then the "TBD" address is displayed in the "store_map" map
      And the stores near to the position are displayed on the "store_map" map

  @jira.QANOV-235595 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User who is in the Store location page zoom out the map to see the stores grouped
    Given user is in the "Store Location" page
     When clicks on the "map" tab
      And zooms out on the "store_map" map
     Then the stores are grouped in the "store_map" map

  @jira.QANOV-235596 @android @ios @jira.cv.Future @manual @mobile @o2de @smoke
  Scenario: User with granted location permissions can select a shop in the map inside the Store finder page
    Given user has "granted" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "map" tab
      And clicks on any shop in the "store_map" map
     Then the "store" module is displayed
      And the "store.icon" icon is displayed
      And the "store.name" textfield is displayed
      And the "store.address" textfield is displayed
      And the "store.distance" textfield is displayed
      And the "store.tag" element is displayed
      And the "store.link" link is displayed
      And the "store.close_button" button is displayed

  @jira.QANOV-235597 @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User can close the store module when it is opened in the map
    Given user has "granted" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "map" tab
      And clicks on any shop in the "store_map" map
      And the "store" module is displayed
      And clicks on the "store.close_button" button
     Then the "map" map is displayed
      And the "store" module is not displayed

  @jira.QANOV-235598 @TBD @android @ber @ios @jira.cv.Future @manual @mobile @o2de @smoke
  Scenario: User with granted location permissions can access the shop details from the map view
    Given user has "granted" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "map" tab
      And clicks on any shop in the "store_map" map
      And clicks on the "store.link" link
     Then the "Store Details" page is displayed
      And the "Store detail" header is displayed
      And the "header.title" textfield with "Store" text is displayed
      And the "header.store_name" textfield is displayed
      And the "header.store_address" textfield is displayed
      And the "header.button" button with "TBD" text is displayed
      And the "opening_hours.title" textfield with "OPENING HOURS" text is displayed
      And the "opening_hours.hours" textfield is displayed
      And the "shop_services.title" textfield with "SHOP SERVICES" text is displayed
      And the "shop_services.tags_list" list is displayed
      And the "see_more_info" link with "See more info" text is displayed
      And the "contact.title" textfield with "CONTACT" text is displayed
      And the "contact.subtitle" textfield with "Phone number" text is displayed
      And the "contact.phone_number" textfield is displayed
      And the "contact.languages" textfield is displayed
      And the "contact.link" link with "Call the shop" text is displayed
      And the "contact.facebook_text" textfield with "Or visit this shop on Facebook" text is displayed
      And the "contact.facebook_link" link with "Go to Facebook page" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Store Location" page is displayed

  @jira.QANOV-235599 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User with denied location permissions can access the shop details from the map view
    Given user has "denied" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "map" tab
      And fills the "search_box" inputtext with the "TBD" text
      And clicks on any shop in the "store_map" map
      And clicks on the "store.link" link
     Then the "Store Details" page is displayed
      And the "Store detail" header is displayed
      And the "header.title" textfield with "Store" text is displayed
      And the "header.store_name" textfield is displayed
      And the "header.store_address" textfield is displayed
      And the "header.button" button with "TBD" text is displayed
      And the "opening_hours.title" textfield with "OPENING HOURS" text is displayed
      And the "opening_hours.hours" textfield is displayed
      And the "shop_services.title" textfield with "SHOP SERVICES" text is displayed
      And the "shop_services.tags_list" list is displayed
      And the "see_more_info" link with "See more info" text is displayed
      And the "contact.title" textfield with "CONTACT" text is displayed
      And the "contact.subtitle" textfield with "Phone number" text is displayed
      And the "contact.phone_number" textfield is displayed
      And the "contact.languages" textfield is displayed
      And the "contact.link" link with "Call the shop" text is displayed
      And the "contact.facebook_text" textfield with "Or visit this shop on Facebook" text is displayed
      And the "contact.facebook_link" link with "Go to Facebook page" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Store Location" page is displayed

  @jira.QANOV-235600 @TBD @android @ber @ios @jira.cv.Future @manual @mobile @o2de @smoke
  Scenario: User with granted location permissions can access the shop details from the list view
    Given user has "granted" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "list" tab
      And clicks on any element in the "stores_list" list
     Then the "Store Details" page is displayed
      And the "Store detail" header is displayed
      And the "header.title" textfield with "Store" text is displayed
      And the "header.store_name" textfield is displayed
      And the "header.store_address" textfield is displayed
      And the "header.button" button with "TBD" text is displayed
      And the "opening_hours.title" textfield with "OPENING HOURS" text is displayed
      And the "opening_hours.hours" textfield is displayed
      And the "shop_services.title" textfield with "SHOP SERVICES" text is displayed
      And the "shop_services.tags_list" list is displayed
      And the "see_more_info" link with "See more info" text is displayed
      And the "contact.title" textfield with "CONTACT" text is displayed
      And the "contact.subtitle" textfield with "Phone number" text is displayed
      And the "contact.phone_number" textfield is displayed
      And the "contact.languages" textfield is displayed
      And the "contact.link" link with "Call the shop" text is displayed
      And the "contact.facebook_text" textfield with "Or visit this shop on Facebook" text is displayed
      And the "contact.facebook_link" link with "Go to Facebook page" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Store Location" page is displayed

  @jira.QANOV-235601 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User with denied location permissions can search an address in the search box and see it in list
    Given user has "denied" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "list" tab
      And fills the "search_box" inputtext with the "TBD" text
     Then the "stores_list" list is displayed
      And each element has the "icon" field displayed in the "stores_list" list
      And each element has the "name" field displayed in the "stores_list" list
      And each element has the "address" field displayed in the "stores_list" list
      And each element has the "distance" field displayed in the "stores_list" list
      And each element has the "link" field displayed in the "stores_list" list
      And the elements in the "stores_list" list are ordered by "distance" ascendant
      And the "filters" button is displayed

  @jira.QANOV-235602 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User with denied location permissions can access the shop details from the list view
    Given user has "denied" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "list" tab
      And fills the "search_box" inputtext with the "TBD" text
      And the "stores_list" list is displayed
      And clicks on any element in the "stores_list" list
     Then the "Store Details" page is displayed
      And the "Store detail" header is displayed
      And the "header.title" textfield with "Store" text is displayed
      And the "header.store_name" textfield is displayed
      And the "header.store_address" textfield is displayed
      And the "header.button" button with "TBD" text is displayed
      And the "opening_hours.title" textfield with "OPENING HOURS" text is displayed
      And the "opening_hours.hours" textfield is displayed
      And the "shop_services.title" textfield with "SHOP SERVICES" text is displayed
      And the "shop_services.tags_list" list is displayed
      And the "see_more_info" link with "See more info" text is displayed
      And the "contact.title" textfield with "CONTACT" text is displayed
      And the "contact.subtitle" textfield with "Phone number" text is displayed
      And the "contact.phone_number" textfield is displayed
      And the "contact.languages" textfield is displayed
      And the "contact.link" link with "Call the shop" text is displayed
      And the "contact.facebook_text" textfield with "Or visit this shop on Facebook" text is displayed
      And the "contact.facebook_link" link with "Go to Facebook page" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Store Location" page is displayed

  @jira.QANOV-235603 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User can access to see more info in the Store Details page
    Given user is in the "Store Details" page
     When clicks on the "see_more_info" link
     Then the "Store Details Info" page is displayed
      And the "TBD" textfields are displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Store Details" page is displayed

  @jira.QANOV-235604 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User can access to the Facebook page from the Store Details page
    Given user is in the "Store Details" page
     When clicks on the "contact.facebook_link" link
     Then the "TBD" page is displayed

  @jira.QANOV-235605 @android @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User can call the Store from the Store Details page on Android devices
    Given user is in the "Store Details" page
     When clicks on the "contact.link" link
     Then the "dialer" app is displayed

  @jira.QANOV-235606 @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User can call the Store from the Store Details page on iOS devices
    Given user is in the "Store Details" page
     When clicks on the "contact.link" link
     Then the "Call Store" popup is displayed
      And the "popup.accept" button that contains the "Call" text is displayed
      And the "popup.cancel" button with "Cancel" text is displayed

  @jira.QANOV-235607 @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User can cancel to call the Store from the Store Details page on iOS devices
    Given user is in the "Store Details" page
     When clicks on the "contact.link" link
      And the "Call Store" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Store Details" page is displayed

  @jira.QANOV-235608 @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User can accept to call the Store from the Store Details page on iOS devices
    Given user is in the "Store Details" page
     When clicks on the "contact.link" link
      And the "Call Store" popup is displayed
      And clicks on the "popup.accept" button
     Then the "dialer" app is displayed

  @jira.QANOV-235609 @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: User can access to see the route until the Store
    Given user is in the "Store Details" page
     When clicks on the "header.button" button
     Then the "native_map_app" app is displayed

  @jira.QANOV-235610 @android @ios @jira.cv.Future @manual @mobile @o2de @smoke
  Scenario: User with granted location permissions can see the list view in the Store finder page
    Given user has "granted" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "list" tab
     Then the "stores_list" list is displayed
      And each element has the "icon" field displayed in the "stores_list" list
      And each element has the "name" field displayed in the "stores_list" list
      And each element has the "address" field displayed in the "stores_list" list
      And each element has the "distance" field displayed in the "stores_list" list
      And each element has the "link" field displayed in the "stores_list" list
      And the elements in the "stores_list" list are ordered by "distance" ascendant
      And the "filters" button is displayed

  @jira.<jira_id> @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario Outline: User can access to filter the results from the <view> view with granted location permission
    The filter options are dynamic, the API could return different values according to the current location
    Given user has "granted" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "<view>" tab
      And clicks on the "filters" button
     Then the "Filter Stores" page is displayed
      And the "filters_list" list is displayed
      And the "filters_list" list has the "TBD" textfields in the "name" field
      And each element in the "filters_list" web list has the "name" field
      And each element in the "filters_list" web list has the "checkbox" field
      And the "view_shops" button with "View shops" text is displayed

    Examples:
          | view | jira_id      |
          | map  | QANOV-235611 |
          | list | QANOV-235612 |

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario Outline: User can see only the filtered shops in the <view> view with granted location permission
    Given user has "granted" "location" permissions
      And user is in the "Store Location" page
     When clicks on the "<view>" tab
      And clicks on the "filters" button
      And the "Filter Stores" page is displayed
      And selects any element in the "filters_list" list
      And clicks on the "view_shops" button
      And the "Store Locations" page is displayed
     Then the "<element>" element contains only the elements filtered

    Examples:
          | view | element     | jira_id      |
          | map  | store_map   | QANOV-235613 |
          | list | stores_list | QANOV-235614 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario Outline: User can access to filter the results from the <view> view with denied location permission
    Given user has "denied" "location" permissions
      And user is in the "Store Location" page
     When fills the "search_box" inputtext with the "TBD" text
      And clicks on the "<view>" tab
      And clicks on the "filters" button
     Then the "Filter Stores" page is displayed
      And the "filters_list" list is displayed
      And the "filters_list" list has the "TBD" textfields in the "name" field
      And each element in the "filters_list" web list has the "name" field
      And each element in the "filters_list" web list has the "checkbox" field
      And the "view_shops" button with "View shops" text is displayed

    Examples:
          | view | jira_id      |
          | map  | QANOV-235615 |
          | list | QANOV-235616 |

  @jira.<jira_id> @TBD @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario Outline: User can see only the filter shops in the <view> view with denied location permission
    Given user has "denied" "location" permissions
      And user is in the "Store Location" page
     When fills the "search_box" inputtext with the "TBD" text
      And clicks on the "<view>" tab
      And clicks on the "filters" button
      And the "Filter Stores" page is displayed
      And selects any element in the "filters_list" list
      And clicks on the "view_shops" button
      And the "Store Locations" page is displayed
     Then the "<element>" element contains only the elements filtered

    Examples:
          | view | element     | jira_id      |
          | map  | store_map   | QANOV-235617 |
          | list | stores_list | QANOV-235618 |
