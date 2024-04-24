# -*- coding: utf-8 -*-
@jira.QANOV-215385
Feature: Order Tracking

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.OBO2DE-728
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @har
  Scenario Outline: A postpay user can access the orders screen from "Profile" page
    Given user is in the "Profile" page
     When clicks on the "my_orders_entrypoint" entrypoint
     Then the "Your Orders" page is displayed
      And the "Meine Bestellungen" header is displayed
      And the "order_tracking_title" textfield with "Bestellverfolgung" text is displayed
      And the "order_tracking_subtitle" textfield with "Hier kannst du den Stand deiner Bestellungen einsehen." text is displayed
      And the "your_orders_title" textfield with "Meine Bestellungen" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 13.9 |                  | QANOV-215386 |
          | o2de    | 14.2 | QANOV-437471     | QANOV-215387 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @raitt_drop2 @sanity
  Scenario Outline: A postpay user with orders can see the list of orders
    Given user is in the "Profile" page
      And user has ">=1" orders on track
     When clicks on the "my_orders_entrypoint" entrypoint
     Then the "My Orders" page is displayed
      And the "empty_case" module is not displayed
      And the "order_list" list is displayed
      And each element in the "order_list" list has the "order_icon" field
      And each element in the "order_list" list has the "order_status_tag" textfield with the "(Wird bald versandt|Wurde versandt|Abgeschlossen|Profil in Erstellung|Bereit zur Installation|Bereit zur Aktivierung|In Aktivierung)" format
      And each element in the "order_list" list has the "order_description" field
      And each element in the "order_list" list has the "order_date" textfield with the "^Bestelldatum: \d{2}\.\d{2}\.\d{4}$" format
      And each element in the "order_list" list has the "chevron" field

    @live @manual @next @raitt_drop2
    Examples:
          | product | cv   | detects    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | OBO2DE-177 |                  | QANOV-215388 |

    @manual
    Examples:
          | product | cv   | detects   | parent_test_plan | jira_id      |
          | o2de    | 14.2 | O2DE-2753 | QANOV-437471     | QANOV-215389 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user without orders can see an empty case screen
    Given user is in the "Profile" page
      And user has "0" orders
     When clicks on the "my_orders_entrypoint" entrypoint
     Then the "Your Orders" page is displayed
      And the "order_list" list is not displayed
      And the "empty_case" module is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Neue Bestellungen werden nach einigen Minuten hier angezeigt." text is displayed
      And the "empty_case.subtitle" textfield with "Hier siehst du den Status aufgegebener Bestellungen" text is displayed

    @raitt_drop2
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-215390 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-215391 |

  @jira.<jira_id> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @manual @mobile
  Scenario Outline: A postpay user can see an order in the "<order_status>" status
    There are two kind of numbers associated to an order (order number and shipping number). Currently, the app is
    showing the shipping number, but not all the orders have shipping number. Then, the app will only display the
    shipping number when the order has it.
    Given user is in the "Your Orders" page
      And user has "any" orders in "<order_status>" status
     Then the "order_list" list is displayed
      And any element in the "order_list" list has the "order_status_tag" textfield with the "<order_status_label>" text
      And any element in the "order_list" list has the "order_description" textfield with the "[CONTEXT:order_description]" text
      And any element in the "order_list" list has the "order_date" textfield with the "Bestelldatum: [CONTEXT:order_date]" text

    @raitt_drop2
    Examples:
          | product | cv     | order_status       | order_status_label      | detects    | test_priority | jira_id      |
          | blaude  | 13.9   | submitted          | Wird bald versandt      | OBO2DE-177 | smoke         | QANOV-215392 |
          | blaude  | 13.9   | in_progress        | Wurde versandt          |            | smoke         | QANOV-532978 |
          | blaude  | Future | in_preparation     | Profil in Erstellung    |            | regression    | QANOV-536508 |
          | blaude  | Future | ready_installation | Bereit zur Installation |            | smoke         | QANOV-532979 |
          | blaude  | Future | ready_activation   | Bereit zur Aktivierung  |            | regression    | QANOV-532980 |
          | blaude  | Future | activating         | In Aktivierung          |            | regression    | QANOV-532977 |
          | blaude  | 13.9   | processed          | Abgeschlossen           | OBO2DE-177 | smoke         | QANOV-215394 |

    Examples:
          | product | cv   | order_status       | order_status_label      | detects | test_priority | jira_id      |
          | o2de    | 14.2 | submitted          | Wird bald versandt      |         | smoke         | QANOV-215395 |
          | o2de    | 14.2 | in_progress        | Wurde versandt          |         | smoke         | QANOV-532982 |
          | o2de    | 24.0 | in_preparation     | Profil in Erstellung    |         | regression    | QANOV-536509 |
          | o2de    | 24.0 | ready_installation | Bereit zur Installation |         | smoke         | QANOV-532983 |
          | o2de    | 24.0 | ready_activation   | Bereit zur Aktivierung  |         | regression    | QANOV-532984 |
          | o2de    | 24.0 | activating         | In Aktivierung          |         | regression    | QANOV-532981 |
          | o2de    | 14.2 | processed          | Abgeschlossen           |         | smoke         | QANOV-215397 |

  @jira.<jira_id> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.detects.O2DE-3061 @jira.link.parent_test_plan.<parent_test_plan> @mobile
  Scenario Outline: A postpay user can see the details of an order in the "<order_status>" status
    Given user is in the "My Orders" page
      And user has ">=1" orders in "<order_status>" on track
      And stores the text of the element in the "order_list" that have the "<order_status_label>" status in the "order_status_tag" field in the context storage with "order_description" key
     When clicks on the element with "order_id" field with "[CONTEXT:order_id]" value of the "order_list" list
     Then the "Order Details" page is displayed
      And the "Meine Bestellungen" header is displayed
      And the "order_icon" icon is displayed
      And the "order_status_tag" textfield with "<order_status_label>" text is displayed
      And the "order_date" textfield with the "^Bestelldatum: \d{2}\.\d{2}\.\d{4}$" format is displayed
      And the "order_items_title" textfield with "Bestellübersicht" text is displayed
      And the "order_items_list" list is displayed
      And each element in the "order_items_list" list has the "item_icon" field
      And each element in the "order_items_list" list has the "item_title" field
      And clicks on the native "back" button
      And the "My Orders" page is displayed

    @ber @live @manual @next @raitt_drop2
    Examples:
          | product | cv   | order_status | order_status_label | detects              | parent_test_plan | test_priority | jira_id      |
          | blaude  | 13.9 | processed    | Abgeschlossen      | O2DE-1853:OBO2DE-177 |                  | smoke         | QANOV-215400 |

    @ber @manual
    Examples:
          | product | cv   | order_status | order_status_label | detects | parent_test_plan | test_priority | jira_id      |
          | o2de    | 14.2 | processed    | Abgeschlossen      |         | QANOV-437471     | smoke         | QANOV-215403 |

    @live @manual @next
    Examples:
          | product | cv     | order_status       | order_status_label      | detects              | parent_test_plan | test_priority | jira_id      |
          | blaude  | 13.9   | submitted          | Wird bald versandt      | O2DE-1853:OBO2DE-177 |                  | regression    | QANOV-536511 |
          | blaude  | 13.9   | in_progress        | Wurde versandt          | O2DE-1853:OBO2DE-177 |                  | regression    | QANOV-532986 |
          | blaude  | Future | in_preparation     | Profil in Erstellung    | O2DE-1853:OBO2DE-177 |                  | regression    | QANOV-215398 |
          | blaude  | Future | ready_installation | Bereit zur Installation | O2DE-1853:OBO2DE-177 |                  | regression    | QANOV-532987 |
          | blaude  | Future | ready_activation   | Bereit zur Aktivierung  | O2DE-1853:OBO2DE-177 |                  | regression    | QANOV-532988 |
          | blaude  | Future | activating         | In Aktivierung          | O2DE-1853:OBO2DE-177 |                  | regression    | QANOV-532985 |

    @manual
    Examples:
          | product | cv   | order_status       | order_status_label      | detects | parent_test_plan | test_priority | jira_id      |
          | o2de    | 14.2 | submitted          | Wird bald versandt      |         |                  | regression    | QANOV-536512 |
          | o2de    | 14.2 | in_progress        | Wurde versandt          |         |                  | regression    | QANOV-532990 |
          | o2de    | 24.0 | in_preparation     | Profil in Erstellung    |         |                  | regression    | QANOV-215401 |
          | o2de    | 24.0 | ready_installation | Bereit zur Installation |         |                  | regression    | QANOV-532991 |
          | o2de    | 24.0 | ready_activation   | Bereit zur Aktivierung  |         |                  | regression    | QANOV-532992 |
          | o2de    | 24.0 | activating         | In Aktivierung          |         |                  | regression    | QANOV-532989 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.O2DE-2876
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @smoke
  Scenario Outline: A postpay user can see the shipping address for MyHandy orders
    The shipping address is only returned for MyHandy orders.
    Given user is in the "Your Orders" page
      And user has "any" orders of "myhandy" type
     When clicks on any element in the "order_list" list with the "order_description" field that contains the "[CONTEXT:order_description]" text
     Then the "Order Details" page is displayed
      And the "shipping_address_title" textfield with "Kontakt- und Lieferaddresse:" text is displayed
      And the "shipping_address" textfield is displayed

    @raitt_drop2
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-215406 |

    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-215409 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.dv.Future @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A postpay user can see additional details of a "myhandy" order on "processed" status
    Track your order: external web
    Logistic center: OB Webview
    Given user is in the "Your Orders" page
      And user has "any" orders of "myhandy" type in "processed" status
     When clicks on any element in the "order_list" list with the "order_description" field that contains the "[CONTEXT:order_description]" text
     Then the "Order Details" page is displayed
      And the "order_id" textfield with the "Auftragsnumner: \w+" format is displayed
      And the "track_your_order" link with "Bestellstatus" text is displayed
      And the "logistic_center_module" module is displayed
      And the "logistic_center_module.icon" icon is displayed
      And the "logistic_center_module.title" textfield with "<title>" text is displayed
      And the "logistic_center_module.label" textfield with "Lieferdokumente" text is displayed
      And the "logistic_center_module.chevron" icon is displayed
      And the "sim" module is not displayed

    @raitt_drop2
    Examples:
          | product | cv   | title                | detects    | parent_test_plan | jira_id      |
          | blaude  | 13.9 | Blau Logistik Center | OBO2DE-229 |                  | QANOV-215416 |

    Examples:
          | product | cv   | title              | detects | parent_test_plan | jira_id      |
          | o2de    | 14.2 | O2 Logistik Center |         | QANOV-437471     | QANOV-215417 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @smoke
  Scenario Outline: A postpay user can see additional details of a "myhandy" order on "processed" status
    Track your order: external web
    Logistic center: OB Webview
    Given user is in the "Your Orders" page
      And user has "any" orders of "myhandy" type in "processed" status
     When clicks on any element in the "order_list" list with the "order_description" field that contains the "[CONTEXT:order_description]" text
     Then the "Order Details" page is displayed
      And the "order_id" textfield with the "Auftragsnumner: \w+" format is displayed
      And the "track_your_order" link with "Bestellstatus" text is displayed
      And the "logistic_center_module" module is displayed
      And the "logistic_center_module.icon" icon is displayed
      And the "logistic_center_module.title" textfield with "<title>" text is displayed
      And the "logistic_center_module.label" textfield with "Lieferdokumente" text is displayed
      And the "logistic_center_module.chevron" icon is displayed
      And the "myhandy_bill_module" module is displayed
      And the "myhandy_bill_module.icon" icon is displayed
      And the "myhandy_bill_module.title" textfield with "My Handy Bill" text is displayed
      And the "myhandy_bill_module.label" textfield with "Invoices" text is displayed
      And the "myhandy_bill_module.chevron" icon is displayed
      And the "sim" module is not displayed

    Examples:
          | product | title                | jira_id      |
          | blaude  | Blau Logistik Center | QANOV-600343 |
          | o2de    | O2 Logistik Center   | QANOV-600344 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: A postpay user with a "myhandy" order in the "processed" status can access to the "My Handy Bill" screen
    Given user is in the "Your Orders" page
      And user has "any" orders of "myhandy" type in "processed" status
     When clicks on any element in the "order_list" list with the "order_description" field that contains the "[CONTEXT:order_description]" text
      And the "Order Details" page is displayed
      And clicks on the "myhandy_bill_module" module
     Then the "My Handy Bill" page is displayed
      And the "View invoice" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Order Details" page is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600345 |
          | o2de    | QANOV-600346 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A postpay user with a "myhandy" order in the "processed" status can access to the logistic center webview
    This is an OB webview
    Given user is in the "Your Orders" page
      And user has "any" orders of "myhandy" type in "processed" status
     When clicks on any element in the "order_list" list with the "order_description" field that contains the "[CONTEXT:order_description]" text
      And the "Order Details" page is displayed
      And clicks on the "logistic_center_module" module
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "order_id" inputtext is autofilled
      And the "zip_code" inputtext is autofilled
      And clicks on the "navigation_top_bar.close_button" button
      And the "Order Details" page is displayed

    Examples:
          | product | cv   | header                         | jira_id      |
          | blaude  | 13.9 | Blau.de Logistikcenter - Login | QANOV-215418 |
          | o2de    | 14.2 | o2 Logistikcenter - Login      | QANOV-215419 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.O2DE-3060 @manual @mobile @regression
  Scenario Outline: A postpay user with a "myhandy" order in the "processed" status can access to the parcel company web to track the shipment
    This is an external web
    Given user is in the "Your Orders" page
      And user has "any" orders of "myhandy" type in "processed" status
     When clicks on any element in the "order_list" list with the "order_description" field that contains the "[CONTEXT:order_description]" text
      And the "Order Details" page is displayed
      And clicks on the "track_your_order" link
     Then the external webview is displayed
      And the "DHL" string is displayed
      And clicks on the native "back" button
      And the "Order Details" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-215420 |
          | o2de    | 14.2 | QANOV-215421 |

  @jira.<jira_id> @<product> @<test_priority> @android @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  Scenario Outline: A postpay user can see additional details of a <sim_type> order in "<order_status>" status
    NOTE: the "sim" module will only be displayed if the SIM of this order is found in the sim-management API.
    pSIM orders in submitted status or eSIM orders in preparation status will not display these additional details.
    Given user is in the "Your Orders" page
      And user has "any" orders of "<sim_type>" type in "<order_status>" status
      And user has the SIM of the order "[CONTEXT:order_description]" in "<sim_status>" status
     When clicks on any element in the "order_list" list with the "order_description" field that contains the "[CONTEXT:order_description]" text
     Then the "Order Details" page is displayed
      And the "sim" module is displayed
      And the "sim.title" textfield with "SIM-KARTE" text is displayed
      And the "sim.subtitle" textfield with the "Deine( digitale)? SIM-Karte ist unterwegs und bald bei dir." format is displayed
      And the "sim_management_entrypoint" entrypoint is displayed
      And the "sim_management_entrypoint.icon" icon is displayed
      And the "sim_management_entrypoint.title" textfield with the "(SIM|eSIM)-Nr: \d+" format is displayed
      And the "sim_management_entrypoint.subtitle" textfield with "<sim_status_label>" text is displayed
      And the "sim_management_entrypoint.chevron" icon is displayed
      And the "track_your_order" link is not displayed
      And the "logistic_center_module" module is not displayed

    @raitt_drop2
    Examples:
          | product | cv   | sim_type | order_status | sim_status | sim_status_label | detects    | parent_test_plan | test_priority | jira_id      |
          | blaude  | 13.9 | psim     | processed    | active     | Aktiv            | OBO2DE-111 |                  | smoke         | QANOV-215423 |

    Examples:
          | product | cv     | sim_type | order_status       | sim_status         | sim_status_label        | detects    | parent_test_plan | test_priority | jira_id      |
          | blaude  | 13.9   | psim     | in_progress        | shipped            | Wurde versandt          | OBO2DE-111 |                  | smoke         | QANOV-215422 |
          | blaude  | Future | esim     | ready_installation | ready_installation | Bereit zur Installation |            |                  | smoke         | QANOV-477155 |
          | blaude  | Future | esim     | ready_activation   | ready_activation   | Bereit zur Aktivierung  |            |                  | smoke         | QANOV-532996 |
          | blaude  | Future | esim     | activating         | activating         | In Aktivierung          |            |                  | regression    | QANOV-532997 |
          | blaude  | Future | esim     | processed          | active             | Aktiv                   |            |                  | regression    | QANOV-477156 |
          | o2de    | 14.2   | psim     | in_progress        | shipped            | Wurde versandt          |            |                  | smoke         | QANOV-215426 |
          | o2de    | 14.2   | psim     | processed          | active             | Aktiv                   |            | QANOV-437471     | regression    | QANOV-215427 |
          | o2de    | 14.2   | esim     | ready_installation | ready_installation | Bereit zur Installation |            |                  | smoke         | QANOV-392756 |
          | o2de    | 14.2   | esim     | ready_activation   | ready_activation   | Bereit zur Aktivierung  |            |                  | smoke         | QANOV-533001 |
          | o2de    | 24.0   | esim     | activating         | activating         | In Aktivierung          |            |                  | regression    | QANOV-533002 |
          | o2de    | 14.2   | esim     | processed          | active             | Aktiv                   |            |                  | smoke         | QANOV-392757 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<detects> @manual @mobile @regression
  Scenario Outline: A postpay user with a <sim_type> order in "<order_status>" status can <action>
    Given user is in the "Your Orders" page
      And user has "any" orders of "<sim_type>" type in "<order_status>" status
      And user has the SIM of the order "[CONTEXT:order_description]" in "<sim_status>" status
     When clicks on any element in the "order_list" list with the "order_description" field that contains the "[CONTEXT:order_description]" text
      And the "Order Details" page is displayed
      And clicks on the "sim_management_entrypoint" entrypoint
     Then the "<page>" page is displayed
      And the "SIM-Karte" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Order Details" page is displayed

    Examples:
          | product | cv     | sim_type | order_status       | sim_status         | page              | action                   | detects   | jira_id      |
          | blaude  | 13.9   | psim     | in_progress        | shipped            | Activate Sim Info | activate the SIM         |           | QANOV-215432 |
          | blaude  | 13.9   | psim     | processed          | active             | Sim Details       | see the active SIM info  |           | QANOV-215433 |
          | blaude  | Future | esim     | ready_installation | ready_installation | Install Esim Info | install the eSIM         |           | QANOV-477157 |
          | blaude  | Future | esim     | ready_activation   | ready_activation   | Activate Sim Info | activate the eSIM        |           | QANOV-533003 |
          | blaude  | Future | esim     | processed          | active             | Sim Details       | see the active SIM info  |           | QANOV-477158 |
          | blaude  | Future | esim     | activating         | activating         | Sim Details       | see the SIM info         |           | QANOV-215436 |
          | o2de    | 14.2   | psim     | in_progress        | shipped            | Activate Sim Info | activate the SIM         |           | QANOV-215437 |
          | o2de    | 14.2   | psim     | processed          | active             | Sim Details       | see the active SIM info  |           | QANOV-215438 |
          | o2de    | 14.2   | esim     | ready_installation | ready_installation | Install Esim Info | install the eSIM         | O2DE-3407 | QANOV-392758 |
          | o2de    | 24.0   | esim     | ready_activation   | ready_activation   | Activate Sim Info | activate the eSIM        |           | QANOV-533004 |
          | o2de    | 14.2   | esim     | processed          | active             | Sim Details       | see the active eSIM info |           | QANOV-392759 |
          | o2de    | 24.0   | esim     | activating         | activating         | Sim Details       | see the SIM info         |           | QANOV-215441 |
