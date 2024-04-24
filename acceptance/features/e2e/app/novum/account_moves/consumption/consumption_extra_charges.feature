# -*- coding: utf-8 -*-
@jira.QANOV-126307
Feature: Consumption Extra Charges


  @jira.<jira_id> @android @ios @jira.cv.10.4 @live @mobile @moves
  Scenario Outline: ADMIN user can see the amount of <allowance> extra charges in a billing cycle
    commented_tags="@depends_on.NOV-47637"
    Given user has a "<account_type>" account type
      And user has the "event-history-total-<account_type_name>" module configured in CMS for "consumption-details-<allowance_name>" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "<allowance>" tab
      And waits until the "extra_charges" element is visible
     Then the "extra_charges.title" textfield with "Gasto extra actual" text is displayed
      And the "extra_charges.value" textfield with the "(-)?\d+,\d\d( | )€" format is displayed

    @automatic @ber @cert2 @next @qa @smoke @webapp
    Examples:
          | account_type  | account_type_name | allowance_name | allowance | jira_id      |
          | telco postpay | postpay-telco     | data           | data      | QANOV-126308 |
          | telco postpay | postpay           | calls          | minutes   | QANOV-249297 |
          | telco postpay | postpay           | messages       | messages  | QANOV-249298 |

    @impeded_legacy @no_automatable @regression
    Examples:
          | account_type   | account_type_name | allowance_name | allowance | jira_id      |
          | legado postpay | postpay-legado    | data           | data      | QANOV-249299 |
          | legado postpay | postpay           | calls          | minutes   | QANOV-249300 |
          | legado postpay | postpay           | messages       | messages  | QANOV-249301 |

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.detects.CMS-2198 @jira.link.relates_to.NOV-47969
  @jira.link.relates_to.NOV-47970 @mobile @moves
  Scenario Outline: User can access to the extra costs details from consumption detail screen
    commented_tags="@depends_on.NOV-47935"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product with extra charges
      And user has made consumption on the "<allowance>" allowances in the "mobile_line" product
      And user has the "event-history-total-<account_type_name>" module configured in CMS for "consumption-details-<allowance_name>" page for the "mobile" product
      And user has the "extra-charges-header-postpay" module configured in CMS for "extra-charges-details-<allowance_name>" page for the "mobile" product
      And user has the "extra-charges-aggregated-postpay" module configured in CMS for "extra-charges-details-<allowance_name>" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "extra-charges-details-<allowance_name>" page for the "mobile" product
      And user has the "extra-charges-list-postpay" module configured in CMS for "extra-charges-details-<allowance_name>" page for the "mobile" product
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "<allowance>" tab
      And clicks on the "extra_charges" button
     Then the "Extra Charges" page is displayed
      And the "<title>" header is displayed
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
      And each element in the "extra_charges_consumption_list" list has the "consumption_extra_charge" textfield with the "(-)?\d+,\d\d( | )€" format
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Consumption" page is displayed

    @automatic @qa @sanity @webapp
    Examples:
          | account_type  | account_type_name | allowance_name | allowance | title                | jira_id     |
          | telco postpay | postpay           | calls          | minutes   | Gasto extra llamadas | QANOV-95619 |

    @automatic @qa @smoke @webapp
    Examples:
          | account_type  | account_type_name | allowance_name | allowance | title                     | jira_id     |
          | telco postpay | postpay-telco     | data           | data      | Gasto extra datos móviles | QANOV-1237  |
          | telco postpay | postpay           | messages       | messages  | Gasto extra mensajes      | QANOV-95620 |

    @impeded_legacy @no_automatable @regression
    Examples:
          | account_type   | account_type_name | allowance_name | allowance | jira_id      |
          | legado postpay | postpay-legado    | data           | data      | QANOV-249302 |
          | legado postpay | postpay-legado    | calls          | minutes   | QANOV-249303 |
          | legado postpay | postpay-legado    | messages       | sms       | QANOV-249304 |
