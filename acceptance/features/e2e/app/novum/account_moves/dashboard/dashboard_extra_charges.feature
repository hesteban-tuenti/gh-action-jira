# -*- coding: utf-8 -*-
@jira.QANOV-612
Feature: Dashboard Extra Charges


  @jira.QANOV-437259 @android @automatic @ber @cert2 @ios @jira.cv.14.8 @live @mobile @moves @next @qa @smoke @webapp
  Scenario: ADMIN user can see the amount of all extra charges in a billing cycle
    Given user has a "postpay" account type
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Dashboard" page
     Then the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "(-)?\d+,\d\d( | )€" format is displayed

  @jira.QANOV-1119 @android @automatic @ber @cert2 @ios @jira.cv.10.4 @jira.link.detects.CHECKOUT-2394
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-47682 @live @mobile @moves @next @qa @smoke @webapp
  Scenario: ADMIN user can see the amount of all extra charges in a billing cycle for a mobile line
    Given user has a "postpay" account type
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "(-)?\d+,\d\d( | )€" format is displayed

  @jira.QANOV-437054 @android @ios @jira.cv.14.8 @manual @mobile @moves @smoke
  Scenario: Uer can see the amount of all extra charges in a billing cycle from the Dashboard
    Given user has a "postpay" account type
      And user has the "unbilled-consumption" module configured in CMS for "dashboard-user" page
     Then the "unbilled_consumption" module is displayed

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1119
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-47688 @manual @mobile @moves
  Scenario Outline: Legado postpay user with a Convergente plan and extra charges in <product> can access to the "Extra Charges Products" screen
    If the 'element.product_extra_charges' is positive, the textfield must be shown in 'red' color.
    An entry will be shown for each mobile line of current plan. Several fields will be shown for each mobile line: icon, name or phone number, and the amount.
    An entry will be shown for the 'Televisión' product, with the TV icon, the name 'Televisión' and the amount of extra cost.
    An entry will be shown for the 'Fijo' product, with the 'Fijo' icon, the 'landline' number and the amount of extra cost.
    An entry will be shown for the 'Internet' product, with the 'Internet' icon, the name 'Internet' and the amount of extra cost.
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected.
    Convergente plan: Fusion or pikolin plan
    Given user has a "legado postpay" account type
      And user has a "fusion;pikolin" plan
      And user has a "any_admin" role
      And user has a "<product>" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user has the "extra-charges-header" module configured in CMS for "extra-charges" page
      And user has the "extra-charges-rows" module configured in CMS for "extra-charges" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "extra_charges" button
     Then the "Extra Charges Products" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "products_with_extra_charges_list" list is displayed
      And each element in the "products_with_extra_charges_list" list has the "icon" field
      And each element in the "products_with_extra_charges_list" list has the "product_title" field
      And each element in the "products_with_extra_charges_list" list has the "product_extra_charges" textfield with the "(-)?\d+,\d\d( | )€" format
      And each element in the "products_with_extra_charges_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    @smoke
    Examples:
          | product     | jira_id    |
          | mobile_line | QANOV-1122 |

    @impeded_mock @regression
    Examples:
          | product  | jira_id    |
          | tv       | QANOV-1124 |
          | landline | QANOV-1126 |

  @jira.QANOV-1128 @android @automation.pending_mock @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1119
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-47792 @manual @mobile @moves @smoke
  Scenario: Legado user with a monoline plan and extra costs can access to the "Extra charges" screen
    Given user has a "legado postpay" account type
      And user has a "monoline" plan
      And user has a "any_admin" role
      And user has a "mobile_line" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "extra_charges" button
     Then the "Extra Charges" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "extra_charges_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "extra_charges_graph" graph
      And the extra charges are displayed in the "y" axis of the "extra_charges_graph" graph
      And the selected day line is displayed in the "today" day of the "extra_charges_graph" graph
      And the "extra_charges_average_consumption_title" textfield with "Consumo medio en ciclo" text is displayed
      And the "extra_charges_average_consumption_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_consumption_list" list is displayed
      And the elements in the "extra_charges_events_list_dates" list are ordered by date descendant
      And each element in the "extra_charges_consumption_list" list has the "icon" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_title" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_subtitle" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charges" textfield with the "(-)?\d+,\d\d( | )€" format
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charges" textfield with "red" color
      And the "highlighted_services" module is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1119
  @jira.link.relates_to.NOV-47696 @manual @mobile @moves @regression
  Scenario Outline: Legado user with a <plan> plan (without mobile lines) and extra charges in <product> can access to the "Extra Charges Products" screen
    Given user has a "legado postpay" account type
      And user has a "<plan>" plan
      And user has a "any_admin" role
      And user has a "<product>" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user has the "extra-charges-header" module configured in CMS for "extra-charges" page
      And user has the "extra-charges-rows" module configured in CMS for "extra-charges" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "extra_charges" button
     Then the "Extra Charges Products" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "products_with_extra_charges_list" list is displayed
      And each element in the "products_with_extra_charges_list" list has the "icon" field
      And each element in the "products_with_extra_charges_list" list has the "product_title" field
      And each element in the "products_with_extra_charges_list" list has the "product_extra_charges" textfield with the "(-)?\d+,\d\d( | )€" format
      And each element in the "products_with_extra_charges_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | plan | product  | jira_id    |
          | trio | tv       | QANOV-1130 |
          | trio | landline | QANOV-1132 |
          | duo  | landline | QANOV-1134 |

  @jira.<jira_id> @android @automation.pending_mock @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.<relates_to> @manual @mobile @moves @smoke
  Scenario Outline: Legado ADMIN user can see the "Extra costs" of a <product> from the Product extra cost selector
    internal_checkpoint="For mobile data costs, the following information will be shown: data icon, MBs consumed, Type of consumption (normal mobile traffic, Pay per use) and price
    For mobile calls costs, the following information will be shown: phone icon, phone number, time when it was made, time duration, type of call (international call, special call, ...) and price
    For mobile SMS costs, the following information will be shown: SMS icon, phone number, time when it was sent and price
    For other mobile costs (movies mainly) the following information will be shown: extra icon, type of extra (Netflix, ...), time when it was made and price"
    Given user has a "Legado postpay" account type
      And user has a "admin" role
      And user has a "<product>" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "extra-charges-rows" module configured in CMS for "extra-charges" page
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "<module_product>" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "<module_product>" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "<module_product>" product
      And user is in the "Extra Charges Products" page
     When clicks on the "<product_entrypoint>" entrypoint
     Then the "Extra Charges" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "extra_charges_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "extra_charges_graph" graph
      And the extra charges are displayed in the "y" axis of the "extra_charges_graph" graph
      And the selected day line is displayed in the "today" day of the "extra_charges_graph" graph
      And the "extra_charges_average_consumption_title" textfield with "Consumo medio en ciclo" text is displayed
      And the "extra_charges_average_consumption_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_consumption_list" list is displayed
      And the elements in the "extra_charges_events_list_dates" list are ordered by date descendant
      And each element in the "extra_charges_consumption_list" list has the "icon" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_title" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_subtitle" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charges" textfield with the "(-)?\d+,\d\d( | )€" format
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charges" textfield with "red" color
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges Products" page is displayed

    Examples:
          | product     | product_entrypoint | module_product | relates_to | depends_on | jira_id    |
          | mobile_line | mobile_product     | mobile         | NOV-47863  | QANOV-1122 | QANOV-1136 |

    @impeded_mock
    Examples:
          | product  | product_entrypoint | module_product | relates_to | depends_on                       | jira_id    |
          | tv       | tv_product         | tv             | NOV-47866  | QANOV-1124:QANOV-1130            | QANOV-1138 |
          | landline | landline_product   | landline       | NOV-47867  | QANOV-1126:QANOV-1132:QANOV-1134 | QANOV-1140 |

  @jira.<jira_id> @android @automation.pending_mock @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-82323 @manual @mobile @moves @regression
  Scenario Outline: Postpay user can see the extra costs for each day within the billing period in a bar chart
    Given user has a "postpay" account type
      And user has a "admin" role
      And user has a "<product>" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "<module_product>" product
      And user is in the "Extra Charges Details" page
     Then the billing period is displayed in the "x" axis of the "extra_charges_graph" graph
      And the extra charges are displayed in the "y" axis of the "extra_charges_graph" graph
      And the selected day line is displayed in the "today" day of the "extra_charges_graph" graph
      And the "extra_charges_graph.selected_value" textfield with the "dd mmm · XX,XX €" format is displayed

    Examples:
          | product     | module_product | depends_on | jira_id    |
          | mobile_line | mobile         | QANOV-1136 | QANOV-1148 |

    @impeded_mock
    Examples:
          | product  | module_product | depends_on | jira_id    |
          | tv       | tv             | QANOV-1138 | QANOV-1150 |
          | landline | landline       | QANOV-1140 | QANOV-1152 |

  @jira.QANOV-1154 @android @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1119
  @jira.link.relates_to.NOV-80830 @mobile @moves @no_automatable @regression
  Scenario: ADMIN user generates new extra costs: a red ball is shown in the "Extra costs" section in Account dashboard
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "legado postpay" account type
      And user has generated a new "extra_charge" in the "any" product
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then a "non_numeric" red badge is displayed in the "extra_charges" item

  @jira.QANOV-1157 @android @impeded_legacy @impeded_mock @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1154
  @jira.link.relates_to.NOV-47973 @jira.link.relates_to.NOV-80831 @mobile @moves @no_automatable @regression
  Scenario: A user who generated new extra costs goes to the "Extra costs" screen: the red ball in the "Extra costs" section will disappear
    Given user has a "legado postpay" account type
      And user has generated a new "extra_charge" in the "any" product
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "extra_charges" button
      And the "Extra Charges" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the notification badge is not displayed in the "extra_charges" item

  @jira.<jira_id> @android @automation.pending_mock @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-82324 @manual @mobile @moves @regression
  Scenario Outline: User can interact with the bar chart of extra costs
    Given user has a "postpay" account type
      And user has a "admin" role
      And user has a "<product>" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "<module_product>" product
      And user is in the "Extra Charges Details" page
     When clicks on a different day in the "extra_charges_graph" graph
     Then the "extra_charges_graph.selected_day" line is displayed in the "selected" day
      And the "extra_charges_graph.selected_value" textfield with the "dd mmm · XX,XX €" format is displayed

    Examples:
          | product     | module_product | depends_on | jira_id    |
          | mobile_line | mobile         | QANOV-1148 | QANOV-1161 |

    @impeded_mock
    Examples:
          | product  | module_product | depends_on | jira_id    |
          | tv       | tv             | QANOV-1150 | QANOV-1162 |
          | landline | landline       | QANOV-1152 | QANOV-1165 |

  @jira.QANOV-1167 @android @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1119
  @jira.link.detects.MOVES-5303 @jira.link.relates_to.NOV-47687 @jira.link.relates_to.NOV-47971 @mobile @moves
  @no_automatable @regression
  Scenario: User with just one product and without extra charges can access to the "Extra charges" screen from the Account dashboard
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "pikolin" plan
      And user has a "monoline" plan
      And user has a "mobile_line" product without extra charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "extra_charges" button
     Then the "Extra Charges" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with "0,00 €" text is displayed
      And the "extra_charges_title.amount" textfield is displayed in "black" color
      And the "extra_charges_consumption_list" list is not displayed
      And the "extra_charges_empty_case.title" textfield with "No se ha generado consumo extra" text is displayed
      And the "extra_charges_empty_case.subtitle" textfield with "Aquí verás el detalle de consumos que conllevan cargos adicionales sobre tu tarifa" text is displayed
      And the "highlighted_services.title" textfield with "GESTIONES" text is displayed
      And the "highlighted_services" module is displayed

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1119
  @jira.link.detects.MOVES-4011 @jira.link.detects.MOVES-5303 @jira.link.relates_to.NOV-47687 @mobile @moves
  @no_automatable @smoke
  Scenario Outline: Legado user with several products and extra charges can see the "Extra charges" screen for a <product> product without extra charges
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "monoline" plan
      And user has extra charges
      And user has a "<product>" product without extra charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user has the "extra-charges-rows" module configured in CMS for "extra-charges" page
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "<product>" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "<product>" product
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "extra_charges" button
      And the "Extra Charges Products" page is displayed
      And clicks on the "<product_entrypoint>" entrypoint
     Then the "Extra Charges" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with "0,00€" text is displayed
      And the "extra_charges_title.amount" textfield is displayed in "black" color
      And the "products_with_extra_charges_list" list is not displayed
      And the "extra_charges_empty_case.title" textfield with "No se ha generado consumo extra" text is displayed
      And the "extra_charges_empty_case.subtitle" textfield with "Aquí verás el detalle de consumos que conllevan cargos adicionales sobre tu tarifa" text is displayed
      And the "highlighted_services.title" textfield is not displayed
      And the "highlighted_services" list is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges Products" page is displayed
      And the "Gasto extra actual" header is displayed

    Examples:
          | product  | product_entrypoint | jira_id    |
          | tv       | tv_product         | QANOV-1187 |
          | internet | internet_product   | QANOV-1200 |

  @jira.QANOV-142012 @android @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1119 @mobile @moves
  @no_automatable @regression
  Scenario: Legado user with several products and without extra charges can access to the "Extra charges" screen from the Account dashboard
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user does not have a "monoline" plan
      And user has not extra charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user has the "extra-charges-header" module configured in CMS for "extra-charges" page
      And user has the "extra-charges-rows" module configured in CMS for "extra-charges" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "extra_charges" button
     Then the "Extra Charges" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with "0,00 €" text is displayed
      And the "extra_charges_title.amount" textfield is displayed in "black" color
      And the "extra_charges_consumption_list" list is not displayed
      And the "extra_charges_empty_case.title" textfield with "No se ha generado consumo extra" text is displayed
      And the "extra_charges_empty_case.subtitle" textfield with "Aquí verás el detalle de consumos que conllevan cargos adicionales sobre tu tarifa" text is displayed
      And the "highlighted_services.title" textfield is not displayed
      And the "highlighted_services" list is not displayed

  @jira.QANOV-1204 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47971 @manual @mobile @moves @regression
  Scenario: User with more than one product and without extra charges in the mobile line product can access to the "Extra charges" screen from the mobile line dashboard
    commented_tags="@depends_on.NOV-47913"
    other_affected_versions="2021-45-B"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product without extra charges
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "extra_charges" button
     Then the "Extra Charges" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with "0,00€" text is displayed
      And the "extra_charges_title.amount" textfield is displayed in "black" color
      And the "products_with_extra_charges_list" list is not displayed
      And the "extra_charges_empty_case.title" textfield with "Aún no has generado gastos extras en este periodo." text is displayed
      And the "extra_charges_empty_case.subtitle" textfield with "Aquí verás el detalle de gastos extras durante el ciclo de facturación." text is displayed
      And the "highlighted_services.title" textfield with "GESTIONES" text is displayed
      And the "highlighted_services" module is displayed

  @jira.QANOV-1206 @android @impeded_mock @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47972 @mobile @moves
  @no_automatable @regression
  Scenario: ADMIN user generates new extra costs: a red ball is shown in the "Extra costs" section in mobile line dashboard
    commented_tags="@depends_on.NOV-47913"
    Given user has a "postpay" account type
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
      And user has generated a new "extra_charge" in the "mobile_line" product
     Then a "non_numeric" red badge is displayed in the "extra_charges" item

  @jira.QANOV-1209 @android @automation.pending_mock @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1122
  @jira.link.depends_on.QANOV-1124 @jira.link.depends_on.QANOV-1126 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.relates_to.NOV-47871 @manual @mobile @moves @regression
  Scenario: Legado ADMIN LIGHT user with a convergente plan can only see the "Extra costs" of the line used with MobileConnect to log in the app
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user has a "fusion;pikolin" plan
      And user has a "logged_mobile_line" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "extra-charges-rows" module configured in CMS for "extra-charges" page
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user is in the "Extra Charges Products" page
     When clicks on the "logged_mobile_line" entrypoint
     Then the "Extra Charges" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "extra_charges_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "extra_charges_graph" graph
      And the extra charges are displayed in the "y" axis of the "extra_charges_graph" graph
      And the selected day line is displayed in the "today" day of the "extra_charges_graph" graph
      And the "extra_charges_average_consumption_title" textfield with "Consumo medio en ciclo" text is displayed
      And the "extra_charges_average_consumption_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_consumption_list" list is displayed
      And the elements in the "extra_charges_events_list_dates" list are ordered by date descendant
      And each element in the "extra_charges_consumption_list" list has the "icon" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_title" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_subtitle" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charges" textfield with the "(-)?\d+,\d\d( | )€" format
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charges" textfield with "red" color
      And the "highlighted_services" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges Products" page is displayed
      And the "Gasto extra actual" header is displayed

  @jira.QANOV-1213 @android @automation.pending_mock @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-1122
  @jira.link.depends_on.QANOV-1124 @jira.link.depends_on.QANOV-1126 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.relates_to.NOV-47873 @manual @mobile @moves @regression
  Scenario: Legado ADMIN LIGHT user with a convergente plan cannot see the "Extra costs" of a line different from the one used with MobileConnect to log in the app: Escalation screen is displayed
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user has a "fusion;pikolin" plan
      And user has a "non_logged_mobile_line" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "extra-charges-rows" module configured in CMS for "extra-charges" page
      And user is in the "Extra Charges Products" page
     When clicks on the "non_logged_mobile_line" entrypoint
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges Products" page is displayed
      And the "Gasto extra actual" header is displayed

  @jira.<jira_id> @android @automation.pending_mock @impeded_legacy @ios @jira.cv.10.4 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-47874 @manual @mobile @moves @regression
  Scenario Outline: Legado ADMIN LIGHT user cannot see the "Extra costs" of any product: "Upgrade to ADMIN" option will be shown
    Given user has a "legado postpay" account type
      And user has a "admin-light" role
      And user has a "fusion;pikolin" plan
      And user has a "<product>" product with extra charges
      And user has the matching subscription selected in the account
      And user has the "extra-charges-rows" module configured in CMS for "extra-charges" page
      And user is in the "Extra Charges Products" page
     When clicks on the "<product_entrypoint>" entrypoint
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para acceder a esta información introduce el documento del titular y contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Extra Charges Products" page is displayed
      And the "Gasto extra actual" header is displayed

    Examples:
          | product  | product_entrypoint | depends_on | jira_id    |
          | tv       | tv_product         | QANOV-1122 | QANOV-1215 |
          | landline | landline_product   | QANOV-1124 | QANOV-1218 |

    @impeded_mock
    Examples:
          | product  | product_entrypoint | depends_on | jira_id    |
          | internet | internet_product   | QANOV-1126 | QANOV-1220 |

  @jira.QANOV-1274 @android @automatic @ber @cert2 @ios @jira.cv.10.4 @jira.link.detects.ACCOUNT-17957
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-47967
  @jira.link.relates_to.NOV-47970 @live @mobile @moves @next @qa @smoke @webapp
  Scenario: User can access to the extra costs details from mobile line screen
    commented_tags="@depends_on.NOV-47913"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product with extra charges
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-all" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "extra_charges" module
     Then the "Extra Charges" page is displayed
      And the "Gasto extra actual" header is displayed
      And the "extra_charges_title.expiration_date" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "extra_charges_title.billing_cycle" textfield with the "Periodo de (0?[1-9]|[12][0-9]|3[01]) [a-z]{3} - (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "extra_charges_title.title" textfield with "Tienes un gasto extra de:" text is displayed
      And the "extra_charges_title.amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_title.amount" textfield is displayed in "red" color
      And the "extra_charges_graph_title" textfield with "Consumo diario" text is displayed
      And the billing period is displayed in the "x" axis of the "extra_charges_graph" graph
      And the extra charges are displayed in the "y" axis of the "extra_charges_graph" graph
      And waits until the "extra_charges_graph.y.selected_day_label" element is visible
      And the selected day line is displayed in the "today" day of the "extra_charges_graph" graph
      And the "extra_charges_average_consumption_title" textfield with "Consumo medio en ciclo" text is displayed
      And the "extra_charges_average_consumption_amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "extra_charges_consumption_list" list is displayed
      And each element in the "extra_charges_consumption_list" list has the "icon" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_title" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_subtitle" field
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charge" textfield with the "(-)?\d+,\d\d( | )€" format
      And the elements in the "extra_charges_events_list_dates" list are ordered by date descendant
      And the "highlighted_services" carousel is displayed

  @jira.QANOV-6771 @android @impeded_mock @ios @jira.cv.11.9 @jira.link.relates_to.NOV-210064 @mobile @moves
  @no_automatable @regression
  Scenario: User with a billing cycle that starts and ends at the same day will se an Empty case in the Consumption page
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "mobile_line" product
      And the billing cycle starts and ends the same day
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "any_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Tu consumo se mostrará pronto" text is displayed
      And the "empty_case.subtitle" textfield with "Tu ciclo de facturación se está reiniciando" text is displayed

  @jira.QANOV-6772 @android @impeded_mock @ios @jira.cv.11.9 @jira.link.relates_to.NOV-210066 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user with a billing cycle that starts and ends at the same day will se an Empty case in the Extra Charges screen from the Mobile Line Dashboard
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "mobile_line" product
      And the billing cycle starts and ends the same day
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "extra_charges" entrypoint
     Then the "Mobile Line Extra Charges" page is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Tu consumo se mostrará pronto" text is displayed
      And the "empty_case.subtitle" textfield with "Tu ciclo de facturación se está reiniciando" text is displayed

  @jira.QANOV-6774 @android @impeded_mock @ios @jira.cv.11.9 @jira.link.relates_to.NOV-210067 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user with a billing cycle that starts and ends at the same day will se an Empty case in the Extra Charges page from the Account Dashboard
    other_affected_versions="2021-45-B"
    Given user has a "legado postpay" account type
      And user has a "mobile_line" product
      And the billing cycle starts and ends the same day
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "extra_charges" entrypoint
     Then the "Extra Charges" page is displayed
      And the "empty_case.icon" icon is displayed
      And the "empty_case.title" textfield with "Tu consumo se mostrará pronto" text is displayed
      And the "empty_case.subtitle" textfield with "Tu ciclo de facturación se está reiniciando" text is displayed
