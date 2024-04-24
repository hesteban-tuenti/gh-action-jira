# -*- coding: utf-8 -*-
@jira.QANOV-555310
Feature: Generic Gestiones Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @smoke @ber
  Scenario Outline: A telco postpay user can open the '<deeplink>' OB deeplink
    Given user has a "telco postpay" account type
      And user has a "<role>" role
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "<text>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "[CONF:landing_tab]" page is displayed

    Examples:
          | deeplink        | role  | header            | text              | jira_id      |
          | Order Tracking  | admin | Mis pedidos       | pedido            | QANOV-555311 |
          | Autodiagnostics | any   | Solucionar avería | SOLUCIONAR AVERÍA | QANOV-555312 |

  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  Scenario Outline: A telco postpay user can open the '<deeplink>' internal deeplink
    Given user has a "telco postpay" account type
      And user has a "<product_type>" product
     When opens the "Gestiones.<deeplink>" deeplink with the app in "killed" status
     Then the "Gestiones <type>" page is displayed
      And the "Gestiones" header is displayed
      And the "procedures_title" textfield with "Gestiones de <text>" text is displayed

    @smoke @ber
    Examples:
          | deeplink               | product_type | text        | type       | jira_id      |
          | Management Mobile Line | mobile_line  | línea móvil | Mobile     | QANOV-555313 |
          | Management Landline    | landline     | línea fija  | Landline   | QANOV-555314 |
          | Management Tv          | television   | televisión  | Television | QANOV-555315 |
          | Management Internet    | internet     | Internet    | Internet   | QANOV-555316 |

    @regression
    Examples:
          | deeplink                    | product_type      | type       | text                | jira_id      |
          | Management Tv               | movistar_plus_ott | Television | televisión          | QANOV-555317 |
          | Management Digital Products | movistar_salud    | Others     | servicios digitales | QANOV-555318 |

  @jira.QANOV-555319 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @smoke @ber
  Scenario: A telco postpay user can open the 'Appointment Booking' internal deeplink
    Given user has a "telco postpay" account type
     When opens the "Gestiones.Appointment Booking" deeplink with the app in "killed" status
     Then the "Store Appointment Booking" page is displayed
      And the "Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "appointment_booking_progress_bar" progress bar is displayed
      And the "appointment_booking_title_textfield" textfield with "Selecciona una tienda Movistar" text is displayed
      And the "appointment_booking_subtitle_textfield" textfield with "Introduce una dirección o comparte la actual para ver las tiendas cercanas." text is displayed
      And the "store_search_inputtext" inputtext is displayed
      And the "store_search_inputtext_placeholder" placeholder with "Introduce una dirección o CP…" text is displayed
