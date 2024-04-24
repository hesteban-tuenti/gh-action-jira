# -*- coding: utf-8 -*-
@jira.QANOV-224590
Feature: My Handy details

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has the "My Handy card" module configured in CMS for "Account" page
      And user has the "My Handy Details" module configured in CMS for "My Handy Details" page


  @jira.<jira_id> @<ber> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203275
  @jira.link.detects.<detects> @manual @mobile @o2de
  Scenario Outline: Postpay user can access to the details screen for an active MyHandy product with a <contract_status> contract
    Given user has a "my_handy" product in "active" status
      And user has a "my_handy" product with a "<contract_status>" contract
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "myhandy.link" link
     Then the "My Handy Details" page is displayed
      And the "My Handy" header is displayed
      And the "myhandy_header.device_name" textfield is displayed
      And the "myhandy_header.amount_label" textfield with the "Zahlung fällig am \d{2}. (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{2}" format is displayed
      And the "myhandy_header.amount_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "early_payment" module is displayed
      And the "contract_status.title" textfield with "VERTRAGSSTATUS" text is displayed
      And the "contract_status.status_label" textfield with "Status" text is displayed
      And the "contract_status.status_value" textfield that contains the "<contract_status_text>" text is displayed
      And the "contract_status.monthly_rate_label" textfield with "Monatliche Rate" text is displayed
      And the "contract_status.monthly_rate_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.already_paid_label" textfield with "Bereits gezahlt" text is displayed
      And the "contract_status.already_paid_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.balance_label" textfield with "Restbetrag" text is displayed
      And the "contract_status.balance_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.payment_due_date_label" textfield with "Näschste Zahlung am" text is displayed
      And the "contract_status.payment_due_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_status.payment_history_entrypoint" entrypoint with "Zahlungen" text is displayed
      And the "contract_details.title" textfield with "VERTRAGSDETAILS" text is displayed
      And the "contract_details.device_label" textfield with "Dein Gerät" text is displayed
      And the "contract_details.device_value" textfield is displayed
      And the "contract_details.contract_number_label" textfield with "Vertragsnummer" text is displayed
      And the "contract_details.contract_number_value" textfield with the "\d+" format is displayed
      And the "contract_details.contract_duration_label" textfield with "Vertragsdauer" text is displayed
      And the "contract_details.contract_duration_value" textfield with the "\d+ Monate" format is displayed
      And the "contract_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.contract_end_date_label" textfield with "Laufzeit des Vertrages" text is displayed
      And the "contract_details.contract_end_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.total_amount_label" textfield with "Gesamtbetrag" text is displayed
      And the "contract_details.total_amount_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "vat_message" textfield with "*Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And the "billing_information.title" textfield with "INFORMATIONEN ZUR RECHNUNG" text is displayed
      And the "billing_information.payment_plan_entrypoint" entrypoint with "Ratenplan" text is displayed
      And the "billing_information.invoices_entrypoint" entrypoint with "Rechnung" text is displayed
      And the "myhandy_repair" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

    Examples:
          | contract_status         | contract_status_text           | test_priority | ber | detects   | jira_id      |
          | ongoing                 | Zahlung fällig am              | sanity        | ber | O2DE-1520 | QANOV-215952 |
          | early_payment_requested | Vorzeitige Abzahlung angefragt | smoke         |     | O2DE-1520 | QANOV-215953 |
          | early_payment_cancelled | Vorzeitige Abzahlung storniert | smoke         |     | O2DE-2937 | QANOV-215954 |

  @jira.QANOV-215955 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203275 @manual @mobile @o2de @smoke
  Scenario: Postpay user can access to the details screen for an active MyHandy product with a Overdue contract
    Given user has a "my_handy" product in "active" status
      And user has a "my_handy" product with a "overdue" contract
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "myhandy.link" link
     Then the "My Handy Details" page is displayed
      And the "My Handy" header is displayed
      And the "myhandy_header.device_name" textfield is displayed
      And the "myhandy_header.amount_label" textfield with "Overdue" text is displayed
      And the "myhandy_header.amount_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "early_payment" module is displayed
      And the "contract_status.title" textfield with "VERTRAGSSTATUS" text is displayed
      And the "contract_status.status_label" textfield with "Status" text is displayed
      And the "contract_status.status_value" textfield with "Overdue" text is displayed
      And the "contract_status.monthly_rate_label" textfield with "Monatliche Rate" text is displayed
      And the "contract_status.monthly_rate_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.already_paid_label" textfield with "Bereits gezahlt" text is displayed
      And the "contract_status.already_paid_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.balance_label" textfield with "Restbetrag" text is displayed
      And the "contract_status.balance_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.payment_due_date_label" textfield with "Näschste Zahlung am" text is displayed
      And the "contract_status.payment_due_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_status.payment_history_entrypoint" entrypoint with "Zahlungen" text is displayed
      And the "contract_details.title" textfield with "VERTRAGSDETAILS" text is displayed
      And the "contract_details.device_label" textfield with "Dein Gerät" text is displayed
      And the "contract_details.device_value" textfield is displayed
      And the "contract_details.contract_number_label" textfield with "Vertragsnummer" text is displayed
      And the "contract_details.contract_number_value" textfield with the "\d+" format is displayed
      And the "contract_details.contract_duration_label" textfield with "Vertragsdauer" text is displayed
      And the "contract_details.contract_duration_value" textfield with the "\d+ Monate" format is displayed
      And the "contract_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.contract_end_date_label" textfield with "Laufzeit des Vertrages" text is displayed
      And the "contract_details.contract_end_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.total_amount_label" textfield with "Gesamtbetrag" text is displayed
      And the "contract_details.total_amount_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "vat_message" textfield with "*Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And the "billing_information.title" textfield with "INFORMATIONEN ZUR RECHNUNG" text is displayed
      And the "billing_information.payment_plan_entrypoint" entrypoint with "Ratenplan" text is displayed
      And the "billing_information.invoices_entrypoint" entrypoint with "Rechnung" text is displayed
      And the "myhandy_repair" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-297968 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203276 @manual @mobile @o2de @smoke
  Scenario: Postpay user can access to the details screen for an active MyHandy product with a Fully Paid contract
    A MyHandy product in "cancelled" status is a a MyHandy product with the contract in "Fully paid" status. However, if
    a fully paid contract requested an early payment, the contract can be fully paid but still "active", as the contract
    has been paid before the contract end date.
    Given user has a "my_handy" product in "active" status
      And user has a "my_handy" product with a "fully_paid" contract
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "myhandy.link" link
     Then the "My Handy Details" page is displayed
      And the "My Handy" header is displayed
      And the "myhandy_header.device_name" textfield is displayed
      And the "myhandy_header.amount_label" textfield with "Abbezahlt" text is displayed
      And the "myhandy_header.amount_value" textfield is not displayed
      And the "early_payment" module is not displayed
      And the "contract_status.title" textfield with "VERTRAGSSTATUS" text is displayed
      And the "contract_status.status_label" textfield with "Status" text is displayed
      And the "contract_status.status_value" textfield with "Abbezahlt" text is displayed
      And the "contract_status.monthly_rate_label" textfield with "Monatliche Rate" text is displayed
      And the "contract_status.monthly_rate_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.already_paid_label" textfield with "Bereits gezahlt" text is displayed
      And the "contract_status.already_paid_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.balance_label" textfield with "Restbetrag" text is displayed
      And the "contract_status.balance_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.payment_history_entrypoint" entrypoint with "Zahlungen" text is displayed
      And the "contract_details.title" textfield with "VERTRAGSDETAILS" text is displayed
      And the "contract_details.device_label" textfield with "Dein Gerät" text is displayed
      And the "contract_details.device_value" textfield is displayed
      And the "contract_details.contract_number_label" textfield with "Vertragsnummer" text is displayed
      And the "contract_details.contract_number_value" textfield with the "\d+" format is displayed
      And the "contract_details.contract_duration_label" textfield with "Vertragsdauer" text is displayed
      And the "contract_details.contract_duration_value" textfield with the "\d+ Monate" format is displayed
      And the "contract_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.contract_end_date_label" textfield with "Laufzeit des Vertrages" text is displayed
      And the "contract_details.contract_end_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.total_amount_label" textfield with "Gesamtbetrag" text is displayed
      And the "contract_details.total_amount_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "vat_message" textfield with "*Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And the "billing_information.title" textfield with "INFORMATIONEN ZUR RECHNUNG" text is displayed
      And the "billing_information.payment_plan_entrypoint" entrypoint with "Ratenplan" text is displayed
      And the "billing_information.invoices_entrypoint" entrypoint with "Rechnung" text is displayed
      And the "myhandy_repair" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-326792 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-203276 @jira.link.detects.O2DE-2936
  @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @o2de @regression
  Scenario: Postpay user can access to the details screen for a cancelled MyHandy product
    A MyHandy product in "cancelled" status is a a MyHandy product with the contract in "Fully paid" status. However, if
    a fully paid contract requested an early payment, the contract can be fully paid but still "active", as the contract
    has been paid before the contract end date.
    Given user has a "my_handy" product in "cancelled" status
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "myhandy.link" link
     Then the "My Handy Details" page is displayed
      And the "My Handy" header is displayed
      And the "myhandy_header.device_name" textfield is displayed
      And the "myhandy_header.amount_label" textfield with "Abbezahlt" text is displayed
      And the "myhandy_header.amount_value" textfield is not displayed
      And the "early_payment" module is not displayed
      And the "contract_status.title" textfield with "VERTRAGSSTATUS" text is displayed
      And the "contract_status.status_label" textfield with "Status" text is displayed
      And the "contract_status.status_value" textfield with "Abbezahlt" text is displayed
      And the "contract_status.monthly_rate_label" textfield is not displayed
      And the "contract_status.monthly_rate_value" textfield is not displayed
      And the "contract_status.already_paid_label" textfield is not displayed
      And the "contract_status.already_paid_value" textfield is not displayed
      And the "contract_status.balance_label" textfield is not displayed
      And the "contract_status.balance_value" textfield is not displayed
      And the "contract_status.payment_history_entrypoint" entrypoint with "Zahlungen" text is displayed
      And the "contract_details.title" textfield with "VERTRAGSDETAILS" text is displayed
      And the "contract_details.device_label" textfield with "Dein Gerät" text is displayed
      And the "contract_details.device_value" textfield is displayed
      And the "contract_details.contract_number_label" textfield is not displayed
      And the "contract_details.contract_number_value" textfield is not displayed
      And the "contract_details.contract_duration_label" textfield is not displayed
      And the "contract_details.contract_duration_value" textfield is not displayed
      And the "contract_details.contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_details.contract_start_date_value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.contract_end_date_label" textfield with "Laufzeit des Vertrages" text is displayed
      And the "contract_details.contract_end_date_value" textfield with the "(\d{2}.\d{2}.\d{4}|--)" format is displayed
      And the "contract_details.total_amount_label" textfield with "Gesamtbetrag" text is displayed
      And the "contract_details.total_amount_value" textfield with "--" text is displayed
      And the "vat_message" textfield with "*Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And the "billing_information.title" textfield with "INFORMATIONEN ZUR RECHNUNG" text is displayed
      And the "billing_information.payment_plan_entrypoint" entrypoint is not displayed
      And the "billing_information.invoices_entrypoint" entrypoint with "Rechnung" text is displayed
      And the "myhandy_repair" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-269810 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215952 @jira.link.depends_on.QANOV-215953
  @jira.link.depends_on.QANOV-215954 @jira.link.depends_on.QANOV-215955 @manual @mobile @o2de @regression
  Scenario: Postpay user with an active product can see the MyHandy Repair module
    Given user has a "my_handy" product  in "active" status
      And user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     Then the "myhandy_repair" module is displayed
      And the "myhandy_repair.title" textfield with "My Handy Reparatur" text is displayed
      And the "myhandy_repair.subtitle" textfield with "Benötigst dein Gerät eine Retaratur?" text is displayed
      And the "myhandy_repair.description" textfield with "Unter Team hilt dir bei der schnellen Reparatur." text is displayed
      And the "myhandy_repair.repair_order_button" button with "Zum Reparatur Auftrag" text is displayed

  @jira.QANOV-269811 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-269810 @manual @mobile @o2de @regression
  Scenario: Postpay user with an active product can access to the MyHandy Repair screen from the "My Handy Details" screen
    Given user has a "my_handy" product in "active" status
      And user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     When clicks on the "myhandy_repair.repair_order_button" button
     Then the internal webview is displayed
      And the "Reparaturportal - Auftragsserfassung" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "My Handy Details" page is displayed
