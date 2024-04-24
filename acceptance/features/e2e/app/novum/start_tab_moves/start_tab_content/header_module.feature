# -*- coding: utf-8 -*-
@jira.QANOV-694
Feature: Header module

  Actions Before the Feature:
    Given user is in the "Start" page
      And pulls down the page to refresh
      And the "Start" page is displayed

  Actions Before each Scenario:
    Given user has the "header-cards-cms-snap-cards" module configured in CMS for "start" page


  @jira.<jira_id> @android @automatic @cert2 @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186764
  @jira.link.relates_to.NOV-216097 @live @mobile @moves @next @qa @sanity
  Scenario Outline: A telco user who is in the Start tab can see a welcome message according to the hour
    Given user has a "telco" account type
      And device time is between "<time_min>" and "<time_max>" hours
      And user is in the "Start" page
     When clicks on the "navigation_tab_bar.start_tab" button
     Then the header that contains the "<message>" text is displayed
      And the header contains the user first name

    @ber
    Examples:
          | time_min | time_max | message     | jira_id   |
          | 6:00     | 12:59    | Buenos días | QANOV-695 |

    Examples:
          | time_min | time_max | message       | jira_id   |
          | 13:00    | 20:59    | Buenas tardes | QANOV-696 |
          | 21:00    | 5:59     | Buenas noches | QANOV-697 |

  @jira.QANOV-56961 @android @ios @jira.cv.11.8 @manual @mobile @moves @regression
  Scenario: A telco postpay user who billing cycle starts today can see a card with the a reminder in the header
    other_affected_versions="2021-07"
    Given user has a "telco postpay" account type
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle starts today
      And user has the "billing-period-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.billing_cycle.billing_cycle_today_text]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.billing_cycle.billing_cycle_button]" text is displayed

  @jira.QANOV-56962 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @manual @mobile @moves @regression
  Scenario: A telco postpay user who billing cycle starts a few days ago can see a card with the a reminder in the header
    other_affected_versions="2021-07"
    Given user has a "telco postpay" account type
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle started ">0" days
      And the billing cycle started "<=5" days
      And user has the "billing-period-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.billing_cycle.billing_cycle_days_text]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.billing_cycle.billing_cycle_button]" text is displayed

  @jira.QANOV-56963 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @manual @mobile @moves @regression
  Scenario: A telco postpay user who billing cycle starts a few days ago taps on the header: the "billing cycle" card will disappear from the start tab
    other_affected_versions="2021-07"
    Given user has a "telco postpay" account type
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle started ">=0" days
      And the billing cycle started "<=5" days
      And user has the "billing-period-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Account" page is displayed
      And clicks on the "navigation_tab_bar.start_tab" button
     Then the "Start" page is displayed
      And the "header.title" textfield with the "[LANG:start.header.billing_cycle.billing_cycle_today_text]" format is not displayed
      And the "header.title" textfield with the "[LANG:start.header.billing_cycle.billing_cycle_days_text]" format is not displayed
      And the "header.button" textfield with "[LANG:start.header.billing_cycle.billing_cycle_button]" text is not displayed

  @jira.QANOV-698 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186781
  @manual @mobile @moves @regression
  Scenario: A telco postpay user with high consumption lands in the Start tab: a card with the warning is shown in the header
    Given user has a "telco postpay" account type
      And user has at least one line which has consumed ">80%" of the data
      And user has at least one line which has consumed "<100%" of the data
      And user does not have the last bill available
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.data_consumption.high_data_consumption_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_consumption_button]" text is displayed

  @jira.QANOV-26189 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186781
  @manual @mobile @moves @regression
  Scenario: A telco postpay user with all data consumed lands in the Start tab: a card with all data consumed is shown in the header
    Given user has a "telco postpay" account type
      And user has at least one line which has consumed "100%" of the data
      And user does not have the last bill available
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.data_consumption.data_limit_consumed_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_consumption_button]" text is displayed

  @jira.QANOV-712 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @jira.link.depends_on.QANOV-711
  @jira.link.relates_to.NOV-186930 @manual @mobile @moves @regression
  Scenario: A telco postpay user with the "80/100 % data consumption" card in the header position taps on the card button: User will be redirected to the data details screen
    internal_checkpoint="For MOVES, the button redirects to: https://appweb.movistar.es/_/account/redirect.php?target=mobile-data-purchase&msisdn=MSISDN_VALUE"
    Given user has a "telco postpay" account type
      And user has at least one line which has consumed ">80%" of the data
      And user does not have the last bill available
      And user has the "low-data-warning" start tab header configured in CMS
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Data Management" page is displayed

  @jira.QANOV-719 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @jira.link.relates_to.NOV-194554
  @mobile @moves @no_automatable @regression
  Scenario: A telco postpay user makes a data bundle puchase: the "80/100% data consumption" card will disappear from the start tab
    Given user has a "telco postpay" account type
      And user has at least one line which has consumed ">80%" of the data
      And user does not have the last bill available
      And user has the "low-data-warning" start tab header configured in CMS
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When purchases a "data" bundle
     Then the "header.title" textfield with the "[LANG:start.header.data_consumption.high_data_consumption_text]" format is not displayed
      And the "header.title" textfield with the "[LANG:start.header.data_consumption.data_limit_consumed_text]" format is not displayed

  @jira.QANOV-701 @android @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186936 @manual @mobile @moves @regression
  Scenario: A telco postpay user with an available invoice lands into the start tab: The card "available invoice" will be displayed in the header
    The card will will disappear after 10 days after the billing cycle started
    Given user has a "telco postpay" account type
      And user has bills for "some" months
      And the billing cycle started "<10" days
      And user has at least one line which has consumed "<80%" of the data
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.bill_available.bill_available_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bill_available.bill_available_button]" text is displayed

  @jira.QANOV-702 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186928
  @manual @mobile @moves @regression
  Scenario: A telco postpay user with the "Invoice available" card in the header position taps on the card button: User is redirected to the Bill Details screen
    For MOVES, the button redirects to: https://appweb.movistar.es/_/account/redirect.php?target=account-invoices.
    The card will will disappear after 10 days after the billing cycle started
    Given user has a "telco postpay" account type
      And user has bills for "some" months
      And the billing cycle started "<10" days
      And user has at least one line which has consumed "<80%" of the data
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bill Details" page is displayed

  @jira.QANOV-716 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @jira.link.relates_to.NOV-194551
  @mobile @moves @no_automatable @regression
  Scenario: A telco postpay user has been 10 days without tapping on the "Ver factura" button of the "invoice available" card: the "invoice available" card will disappear from the start tab
    Given user has a "telco postpay" account type
      And user has the last invoice available
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When the user is "10" days without tapping on the "see_bill" button from the "invoice_available" card
     Then the "header.title" textfield does not contains the "[LANG:start.header.bill_available.bill_available_root]" text

  @jira.QANOV-708 @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.8 @jira.link.depends_on.QANOV-701
  @jira.link.depends_on.QANOV-702 @manual @mobile @moves @regression
  Scenario: A telco postpay user who returns after tapping on See invoice button cannot see the Invoice Available card
    Given user has a "telco postpay" account type
      And user has bills for "some" months
      And user has at least one line which has consumed "<80%" of the data
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Bill Details" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And the "header.title" textfield does not contains the "[LANG:start.header.bill_available.bill_available_root]" text

  @jira.QANOV-715 @android @ios @jira.cv.11.8 @jira.link.relates_to.NOV-194550 @manual @mobile @moves @regression
  Scenario: The module in the header will be updated when a new billing cycle starts
    internal_checkpoint="NOTE:
    the "invoice" card will appear again when the new invoice for this cycle is generated.
    the "data" card will appear again when the user arrives to a 80/100% data consumption in this cycle.
    The possible cards are Invoice available and 80/100 data exhaustion"
    Given user has a "telco postpay" account type
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
      And the "header" module is displayed
     When a new billing cycle starts
     Then the "header.title" textfield with "[LANG:start.header.bill_available.bill_available_text]" text is displayed
      And the "header" module can not be swiped

  @jira.QANOV-56678 @android @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186937 @manual @mobile @moves @regression
  Scenario: A user with extra costs lands into the start tab: the card "Extra costs" is displayed in the header
    other_affected_versions="2021-05"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has the "extra-expenses" start tab header configured in CMS
      And user is in the "Start" page
      And user has a "any" product with extra charges
     Then the "header.title" textfield with the "[LANG:start.header.extra_costs.extra_costs_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.extra_costs.extra_costs_button]" text is displayed

  @jira.QANOV-56679 @android @ios @jira.cv.11.8 @jira.link.relates_to.NOV-186929 @manual @mobile @moves @regression
  Scenario: A user with the "Extra costs" card in the header taps on the card button: User will be redirected to the extra costs details screen
    other_affected_versions="2021-05"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has the "extra-expenses" start tab header configured in CMS
      And user is in the "Start" page
      And user has a "any" product with extra charges
     When clicks on the "header.button" button
     Then the "Extra Charges Products" page is displayed

  @jira.QANOV-56680 @android @ios @jira.cv.11.8 @jira.link.relates_to.NOV-194552 @manual @mobile @moves @regression
  Scenario: A user taps on the "Ver gasto extra" button of the "extra costs" card: the "extra costs" card disappears from the header
    other_affected_versions="2021-05"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "any" product with extra charges
      And user has the "extra-expenses" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Extra Charges Products" page is displayed
      And clicks on the "navigation_tab_bar.start_tab" button
     Then the "Start" page is displayed
      And the "header.title" textfield with the "[LANG:start.header.extra_costs.extra_costs_text]" format is not displayed

  @jira.QANOV-67911 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with only debt in favour will not see the debt critical message in header
    other_affected_versions="2021-TBD"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle started ">5" days
      And user has not "outstanding" debt
      And user has "in favour" debt
      And user has the "debt-payment-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.debt_payment.debt_payment_text]" text is not displayed
      And the "header.button" textfield with "[LANG:start.header.debt_payment.debt_payment_button]" text is not displayed

  @jira.<jira_id> @android @ios @jira.cv.12.7 @jira.link.detects.CHECKOUT-2447 @jira.link.detects.CHECKOUT-2449
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario Outline: A telco postpay user logged in as admin with only <user_debt> debt can see a debt critical message in header
    other_affected_versions="2021-TBD"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle started ">5" days
      And user has "<user_debt>" debt
      And user has not "<not_user_debt>" debt
      And user has the "debt-payment-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.debt_payment.debt_payment_text]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.debt_payment.debt_payment_button]" text is displayed

    Examples:
          | user_debt     | not_user_debt                  | jira_id     |
          | telco overdue | telco due;legado;in favour     | QANOV-67912 |
          | telco due     | telco overdue;legado;in favour | QANOV-67913 |
          | legado        | telco;in favour                | QANOV-67914 |

  @jira.QANOV-67915 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with both overdue and due debt can see a debt critical message in header
    other_affected_versions="2021-TBD"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle started ">5" days
      And user has "overdue" debt
      And user has "due" debt
      And user has the "debt-payment-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.debt_payment.debt_payment_text]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.debt_payment.debt_payment_button]" text is displayed

  @jira.QANOV-296666 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-295122
  @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with only payable documents can see a debt critical message in header
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle started ">5" days
      And user has "pending" payable documents
      And user does not have "any" debt
      And user has the "debt-payment-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.debt_payment.debt_payment_text]" text is displayed
      And the "header.button" textfield with "[LANG:start.header.debt_payment.debt_payment_button]" text is displayed

  @jira.QANOV-67916 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with overdue debt from one legal entity clicks on the debt critical message in header
    other_affected_versions="2021-TBD"
    internal_checkpoint="Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle started ">5" days
      And user has "overdue" debt from "TDE" legal entity
      And user does not have "overdue" debt from "TME" legal entity
      And has "several" bills in "unpaid" status in any subscription
      And user has the "debt-payment-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bill Selection" page is displayed
      And the "[LANG:payments.header]" header is displayed
      And the "select_debt_message" textfield with "Selecciona las facturas que deseas pagar" text is displayed
      And the "unpaid_bills" list is displayed
      And the "continue" button with "Continuar" text is displayed

  @jira.QANOV-67917 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-67291 @manual @mobile @moves @regression
  Scenario: A telco postpay user logged in as admin with outstanding debt from different legal entities clicks on the debt critical message in header
    internal_checkpoint="Entities are 'TME' (for mobile related services) and 'TDE' (for fixed related services)"
    other_affected_versions="2021-TBD"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has at least one line which has consumed "<80%" of the data
      And user does not have the last bill available
      And the billing cycle started ">5" days
      And user has "outstanding" debt from "TME" legal entity
      And user has "outstanding" debt from "TDE" legal entity
      And user has the "debt-payment-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Debt Detail" page is displayed
      And the "Detalle de deuda" header is displayed
      And the "debt_list" list has "2" elements
      And the "0" index in the "debt_list" list has the "tde_icon" field
      And the "1" index in the "debt_list" list has the "tme_icon" field

  @jira.QANOV-68958 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: ADMIN Fusion or Pikolin with renting device and who didn't choose a renting device will see the Device Renting header
    internal_checkpoint="
    TELCO
    Sin terminal R2R elegido: FIC54828 / Atlas2021"
    other_affected_versions="2021-14-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And user has the "rent-smartphone-selection" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.device_renting.title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.device_renting.button]" text is displayed

  @jira.QANOV-68959 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: ADMIN Fusion or Pikolin with renting device and who didn't choose a renting device taps on the card button: Informative page is displayed
    internal_checkpoint="
    TELCO
    Sin terminal R2R elegido: FIC54828 / Atlas2021"
    other_affected_versions="2021-14-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And user has the "rent-smartphone-selection" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Select Device" page is displayed
      And the "Elegir dispositivo" header is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Ya puedes elegir tu dispositivo" text is displayed
      And the "informative_message" textfield is displayed
      And the "informative_button" button with "Elegir dispositivo" text is displayed
      And clicks on the "navigation_top_bar.close" button
      And the "Start" page is displayed

  @jira.QANOV-68960 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: ADMIN user who accessed to the 'Elegir dispositivo' page from the Start tab taps on the 'informative_button' button: Modal webview is displayed
    internal_checkpoint="
    TELCO
    Sin terminal R2R elegido: FIC54828 / Atlas2021"
    other_affected_versions="2021-14-B"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And user has the "rent-smartphone-selection" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Select Device" page is displayed
      And clicks on the "informative_button" button
     Then the modal webview is displayed
      And the "Mi Movistar" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "smartphone libre incluido" string is displayed
      And clicks on the "navigation_top_bar.close" button
      And the "Start" page is displayed

  @jira.QANOV-68961 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: ADMIN-LIGHT user who accessed to the 'Elegir dispositivo' page from the Start tab taps on the 'informative_button' button: Login Escalation Required screen is displayed
    TELCO
    Sin terminal R2R elegido: FIC54828 / Atlas2021
    other_affected_versions="2021-14-B"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has "0" renting devices in "in_progress" status
      And user has "0" renting devices in "received" status
      And user has the "rent-smartphone-selection" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Select Device" page is displayed
      And clicks on the "informative_button" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-144894 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-144471
  @jira.link.parent_test_plan.QANOV-189597 @manual @mobile @moves @regression
  Scenario: A Fusion or Pikolin user with a renting device consolidated and with an additional device offered will see the Device Renting header
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has ">0" renting devices in "received" status
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "in_progress" status
      And user has the "rent-smartphone-second" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.device_renting_multidevices.title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.device_renting_multidevices.button]" text is displayed

  @jira.QANOV-144895 @TBD @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-144471
  @jira.link.parent_test_plan.QANOV-189597 @manual @mobile @moves @regression
  Scenario: ADMIN fusion or pikolin user with a renting device consolidated and with an additional device offered taps on the card button: OB webview is displayed
    OB webview ID: eleccion_terminal_adicional_fusion
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has ">0" renting devices in "received" status
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "in_progress" status
      And user has the "rent-smartphone-second" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the browser webview with "TBD" text in the header is displayed
      And the "TBD" header is displayed
      And the "TBD" string is displayed
      And the "Dispositivos adicionales" string is displayed
      And clicks on the "navigation_top_bar.close" button
      And the "Start" page is displayed

  @jira.QANOV-144896 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-144471
  @jira.link.parent_test_plan.QANOV-189597 @manual @mobile @moves @regression
  Scenario: ADMIN-LIGHT fusion or pikolin user with a renting device consolidated and with an additional device offered taps on the 'header' button of the Start tab: Login Escalation Required screen is displayed
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "admin-light" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has ">0" renting devices in "received" status
      And user has ">0" renting devices in "offered" status
      And user has "0" renting devices in "in_progress" status
      And user has the "rent-smartphone-second" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-68962 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-144471
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: A Fusion or Pikolin user with renting device user who already choose all the offered renting devices won't see the Device Renting header
    Note that at the moment for renting devices with cost > 0€ (Non default device)
    cannot check if the rented smartphone is chosen or not, so the header will be displayed for this kind of users
    TELCO
    Con terminal R2R recibido: FIC60593 / CPruebasFIC60593
    Con terminal R2R in progress: FIC49725 / Rojo2021
    The header notification only disappears when the renting smartphone product. Arrives to us as 'pedido en vuelo' or 'activated'.
    It is assumed that the 4P APIs once the user have 2 R2R devices as consolidated, they will not return more devices as offerable
    other_affected_versions="2021-14-B 2021-26-B 2021-35 2021-43"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has "0" renting devices in "offered" status
      And user has the "rent-smartphone-selection" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.device_renting.title]" text is not displayed
      And the "header.button" textfield with "[LANG:start.header.device_renting.button]" text is not displayed

  @jira.QANOV-144897 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-144471
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.parent_test_plan.QANOV-67288 @manual @mobile @moves @regression
  Scenario: A Fusion or Pikolin user with renting device user who has any r2r device in progress (pedido en vuelo) won't see the Device Renting header
    TELCO
    Con terminal R2R in progress: FIC49725 / Rojo2021
    The header notification only disappears when the renting smartphone product. Arrives to us as 'pedido en vuelo' or 'activated'.
    Pedido en vuelo (Drop 1) TELCO
    other_affected_versions="2021-14-B 2021-26-B 2021-35 2021-43"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has ">0" renting devices in "in_progress" status
      And user has the "rent-smartphone-selection" start tab header configured in CMS
      And user has the "rent-smartphone-second" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.device_renting.title]" text is not displayed
      And the "header.button" textfield with "[LANG:start.header.device_renting.button]" text is not displayed
      And the "header.title" textfield with "[LANG:start.header.device_renting_multidevices.title]" text is not displayed
      And the "header.button" textfield with "[LANG:start.header.device_renting_multidevices.button]" text is not displayed

  @jira.QANOV-144898 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-144471
  @jira.link.parent_test_plan.QANOV-189597 @manual @mobile @moves @regression
  Scenario: A Fusion or Pikolin user with renting device user who already choose the two renting devices won't see the Device Renting header
    It is assumed that the 4P APIs once the user have 2 R2R devices as consolidated, they will not return more devices as offerable
    other_affected_versions="2021-43"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "fusion;pikolin" plan with a renting device
      And user has "2" renting devices in "received" status
      And user has the "rent-smartphone-second" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "[LANG:start.header.device_renting_multidevices.title]" text is not displayed
      And the "header.button" textfield with "[LANG:start.header.device_renting_multidevices.button]" text is not displayed

  @jira.QANOV-126302 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-125017 @manual @mobile @moves
  @regression
  Scenario: User without Factura Digital service activated will see a card to enable it in the header
    This card will have any of this copies shown randomly:
    - Pásate a Factura sin papel y protege el medio ambiente con tu factura digital
    - Únete a Factura sin papel: tu factura digital siempre disponible con un solo clock
    - ¿Sabías que la mayoría de clientes ya han activado Factura sin papel?
    other_affected_versions="2021-TBD"
    Given user has a "telco postpay" account type
      And user has the "digital_invoice" service in "deactivated" status
      And user has the "digital-invoice-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the header contains a card with "Factura sin papel" title and "Activar" button

  @jira.QANOV-126303 @android @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-125017 @manual @mobile @moves
  @regression
  Scenario: User without Factura Digital service activated can access to enable it from header
    other_affected_versions="2021-TBD"
    Given user has a "telco postpay" account type
      And user has the "digital_invoice" service in "deactivated" status
      And user has the "digital-invoice-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Factura sin papel" string is displayed

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.<created_version> @jira.link.parent_test_plan.QANOV-127764
  @jira.link.parent_test_plan.QANOV-189597 @manual @mobile @moves
  Scenario Outline: User with a Fusion or Pikolin plan order on track but not activated yet, will see a welcome message in the header
    other_affected_versions="2021-39"
    Given user has a "telco postpay" account type
      And user has a "fusion;pikolin" order on track
      And user has "<subscriptions>" active subscriptions
      And user has a "any_admin" role
      And user has the "digital-onboarding-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with "¡Gracias por elegirnos! Te vamos a acompañar para que saques el mayor partido a tus productos" text is displayed

    Examples:
          | subscriptions | test_priority | created_version | jira_id      |
          | zero          | regression    | 12.8            | QANOV-129614 |
          | several       | smoke         | 12.7            | QANOV-129615 |

  @jira.QANOV-269734 @TBD @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-260586 @manual @mobile @moves
  @regression
  Scenario: User with any mobile line deacticated can see the card to advice her
    Given user has a "telco postpay" account type
      And user has ">0" mobile lines in "deactivated" status
      And user has the "tbd" start tab header configured in CMS
      And user is in the "Start" page
     Then the header contains a card with "Recuerda que tienes líneas móviles pendientes que puedes activar gratis" title and "Ver líneas" button

  @jira.QANOV-269735 @TBD @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-260586 @manual @mobile @moves
  @regression
  Scenario: User with 1 mobile line deacticated can access to the "Mobile Line Activation" page from the header
    Given user has a "telco postpay" account type
      And user has "1" mobile lines in "deactivated" status
      And user has the "tbd" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Mobile Line Activation" page is displayed
      And the "Líneas móviles" header is displayed
      And the "info_image" image is displayed
      And the "title" textfield that contains the "Caracterísiticas de tu tarifa" text is displayed
      And the "description" textfield is displayed
      And the "button" button with "Activar línea" text is displayed

  @jira.QANOV-269736 @TBD @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-260586 @manual @mobile @moves
  @regression
  Scenario: User with >1 mobile lines deacticated taps on the header button: Disambiguation is displayed
    Given user has a "telco postpay" account type
      And user has ">1" mobile lines in "deactivated" status
      And user has the "tbd" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Line Disambiguation" page is displayed
      And the header that contains the "Líneas móviles" text is displayed
      And the "title" textfield with "Estas son las líneas que tienes pendientes de activar" text is displayed
      And each element in the "lines.list" list has the "title" field with "Línea móvil" text
      And each element in the "lines.list" list has the "subtitle" field

  @jira.QANOV-298194 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: A telco user with only one order on track lands into the Start tab: a card with the order status will be displayed
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has "1" orders on track
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield is displayed
      And the "header.button" textfield with "Ver pedido" text is displayed

  @jira.QANOV-298195 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A telco user with several orders on track lands into the Start tab: several cards with the orders status will be displayed
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has ">1" orders on track
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" field
      And the "header_cards" list has "several" elements with the "button" button with "Ver pedido" text

  @jira.QANOV-298196 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A telco user with one order on track access to "Mis pedidos" screen from the order status header and goes back
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has "1" orders on track
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "My Orders" internal webview is displayed
      And the "Mis pedidos" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed
      And the "header.title" textfield is displayed
      And the "header.button" textfield with "Ver pedido" text is displayed

  @jira.QANOV-298197 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @smoke
  Scenario: A telco user with only one opened incident lands into the Start tab: a card with the incident status will be displayed
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has "1" tickets opened
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield is displayed
      And the "header.button" textfield with "Ver incidencia" text is displayed

  @jira.QANOV-298198 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A telco user with several opened incidents lands into the Start tab: several cards with the incidents status will be displayed
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has ">1" tickets opened
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" field
      And the "header_cards" list has "several" elements with the "button" button with "Ver incidencia" text

  @jira.QANOV-298199 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A telco user with one order on track access to "Mis incidencias" screen from the order status header and goes back
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has "1" tickets opened
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview with "Mis incidencias" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Start" page is displayed
      And the "header.title" textfield is displayed
      And the "header.button" textfield with "Ver incidencia" text is displayed

  @jira.QANOV-298200 @TBD @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: A new pikolin user with the plan order on track but not activated yet lands into the Start tab: a card with the order status will be displayed
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has a "pikolin" order on track
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield is displayed
      And the "header.button" textfield with "Ver pedido" text is displayed

  @jira.QANOV-326093 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @no_automatable
  @regression
  Scenario: User with unpaid debt can see a header
    Given user has a "telco postpay" account type
      And user has "upaid" debt
      And user is in the "Start" page
     Then the "header.title" textfield with "Tienes facturas pendientes de pago que puedes abonar a continuación" text is displayed
      And the "header.button" button with "Pagar facturas" text is displayed

  @jira.QANOV-326094 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @no_automatable
  @regression
  Scenario: User with unpaid debt clicks on the "header.button" button: Debt payment flow is displayed
    Given user has a "telco postpay" account type
      And user has "upaid" debt
      And user has the matching subscription selected in the account
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Bill Selection" page is displayed

  @jira.QANOV-326095 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @no_automatable
  @regression
  Scenario: User with in favour debt can see a header
    Given user has a "telco postpay" account type
      And user has "in favour" debt
      And user is in the "Start" page
     Then the "header.title" textfield with "Tienes una factura con un importe a tu favor" text is displayed
      And the "header.button" button with "Ver factura" text is displayed

  @jira.QANOV-326096 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @no_automatable
  @regression
  Scenario: User with in favour debt clicks on the "header.button" button: Invoices page is displayed
    Given user has a "telco postpay" account type
      And user has "in favour" debt
      And user has the matching subscription selected in the account
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Invoices" page is displayed
      And the "negative" bill is selected in the graph
