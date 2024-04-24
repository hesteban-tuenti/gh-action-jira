# -*- coding: utf-8 -*-
@jira.QANOV-224588
Feature: My Handy details

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has the "My Handy card" module configured in CMS for "Account" page
      And user has the "My Handy Details" module configured in CMS for "My Handy Details" page


  @jira.<jira_id> @<ber> @<test_priority> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203288
  @jira.link.detects.<detects> @mobile @raitt_drop1 @webapp
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
      And the "contract_status.status.label" textfield with "Status" text is displayed
      And the "contract_status.status.value" textfield that contains the "<contract_status_text>" text is displayed
      And the "contract_status.monthly_rate.label" textfield with "Monatliche Rate" text is displayed
      And the "contract_status.monthly_rate.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.already_paid.label" textfield with "Bereits gezahlt" text is displayed
      And the "contract_status.already_paid.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.remaining_amount.label" textfield with "Restbetrag" text is displayed
      And the "contract_status.remaining_amount.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.payment_due_date.label" textfield with "Nächste Zahlung am" text is displayed
      And the "contract_status.payment_due_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_status.payment_history_entrypoint_text" entrypoint with "Zahlungen" text is displayed
      And the "contract_details.title" textfield with "VERTRAGSDETAILS" text is displayed
      And the "contract_details.device.label" textfield with "Dein Gerät" text is displayed
      And the "contract_details.device.value" textfield is displayed
      And the "contract_details.contract_number.label" textfield with "Vertragsnummer" text is displayed
      And the "contract_details.contract_number.value" textfield with the "\d+" format is displayed
      And the "contract_details.contract_duration.label" textfield with "Vertragsdauer" text is displayed
      And the "contract_details.contract_duration.value" textfield with the "\d+ Monate" format is displayed
      And the "contract_details.contract_start_date.label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_details.contract_start_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.contract_end_date.label" textfield with "Laufzeit des Vertrages" text is displayed
      And the "contract_details.contract_end_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.total_amount.label" textfield with "Gesamtbetrag" text is displayed
      And the "contract_details.total_amount.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "vat_message" textfield with "*Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And the "billing_information.title" textfield with "INFORMATIONEN ZUR RECHNUNG" text is displayed
      And the "billing_information.payment_plan_entrypoint.title" entrypoint with "Ratenplan" text is displayed
      And the "billing_information.invoices_entrypoint.title" entrypoint with "Rechnung" text is displayed
      And the "myhandy_repair" module is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Account" page is displayed

    @automatic @qa
    Examples:
          | contract_status | contract_status_text | test_priority | ber | detects             | jira_id      |
          | ongoing         | Zahlung fällig am    | sanity        | ber | O2DE-1520:O2DE-2143 | QANOV-215960 |

    @manual
    Examples:
          | contract_status         | contract_status_text           | test_priority | ber | detects             | jira_id      |
          | early_payment_requested | Vorzeitige Abzahlung angefragt | smoke         |     | O2DE-1520:OBO2DE-92 | QANOV-215961 |
          | early_payment_cancelled | Vorzeitige Abzahlung storniert | smoke         |     |                     | QANOV-215962 |

  @jira.QANOV-215963 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-203288 @jira.link.detects.OBO2DE-166
  @manual @mobile @smoke @raitt_drop1
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
      And the "contract_status.status.label" textfield with "Status" text is displayed
      And the "contract_status.status.value" textfield with "Overdue" text is displayed
      And the "contract_status.monthly_rate.label" textfield with "Monatliche Rate" text is displayed
      And the "contract_status.monthly_rate.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.already_paid.label" textfield with "Bereits gezahlt" text is displayed
      And the "contract_status.already_paid.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.remaining_amount.label" textfield with "Restbetrag" text is displayed
      And the "contract_status.remaining_amount.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.payment_due_date.label" textfield with "Nächste Zahlung am" text is displayed
      And the "contract_status.payment_due_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_status.payment_history_entrypoint" entrypoint with "Zahlungen" text is displayed
      And the "contract_details.title" textfield with "VERTRAGSDETAILS" text is displayed
      And the "contract_details.device.label" textfield with "Dein Gerät" text is displayed
      And the "contract_details.device.value" textfield is displayed
      And the "contract_details.contract_number.label" textfield with "Vertragsnummer" text is displayed
      And the "contract_details.contract_number.value" textfield with the "\d+" format is displayed
      And the "contract_details.contract_duration.label" textfield with "Vertragsdauer" text is displayed
      And the "contract_details.contract_duration.value" textfield with the "\d+ Monate" format is displayed
      And the "contract_details.contract_start_date.label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_details.contract_start_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.contract_end_date.label" textfield with "Laufzeit des Vertrages" text is displayed
      And the "contract_details.contract_end_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.total_amount.label" textfield with "Gesamtbetrag" text is displayed
      And the "contract_details.total_amount.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "vat_message" textfield with "*Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And the "billing_information.title" textfield with "INFORMATIONEN ZUR RECHNUNG" text is displayed
      And the "billing_information.payment_plan_entrypoint" entrypoint with "Ratenplan" text is displayed
      And the "billing_information.invoices_entrypoint" entrypoint with "Rechnung" text is displayed
      And the "myhandy_repair" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-297967 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-203289 @jira.link.detects.OBO2DE-383
  @manual @mobile @smoke @raitt_drop1
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
      And the "contract_status.status.label" textfield with "Status" text is displayed
      And the "contract_status.status.value" textfield with "Abbezahlt" text is displayed
      And the "contract_status.monthly_rate.label" textfield with "Monatliche Rate" text is displayed
      And the "contract_status.monthly_rate.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.already_paid.label" textfield with "Bereits gezahlt" text is displayed
      And the "contract_status.already_paid.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.remaining_amount.label" textfield with "Restbetrag" text is displayed
      And the "contract_status.remaining_amount.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "contract_status.payment_history_entrypoint" entrypoint with "Zahlungen" text is displayed
      And the "contract_details.title" textfield with "VERTRAGSDETAILS" text is displayed
      And the "contract_details.device.label" textfield with "Dein Gerät" text is displayed
      And the "contract_details.device.value" textfield is displayed
      And the "contract_details.contract_number.label" textfield with "Vertragsnummer" text is displayed
      And the "contract_details.contract_number.value" textfield with the "\d+" format is displayed
      And the "contract_details.contract_duration.label" textfield with "Vertragsdauer" text is displayed
      And the "contract_details.contract_duration.value" textfield with the "\d+ Monate" format is displayed
      And the "contract_details.contract_start_date.label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_details.contract_start_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.contract_end_date.label" textfield with "Laufzeit des Vertrages" text is displayed
      And the "contract_details.contract_end_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.total_amount.label" textfield with "Gesamtbetrag" text is displayed
      And the "contract_details.total_amount.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "vat_message" textfield with "*Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And the "billing_information.title" textfield with "INFORMATIONEN ZUR RECHNUNG" text is displayed
      And the "billing_information.payment_plan_entrypoint" entrypoint with "Ratenplan" text is displayed
      And the "billing_information.invoices_entrypoint" entrypoint with "Rechnung" text is displayed
      And the "myhandy_repair" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-326753 @android @blaude @ios @jira.cv.14.1 @jira.link.depends_on.QANOV-203289 @jira.link.detects.OBO2DE-383
  @jira.link.detects.OBO2DE-715 @jira.link.parent_test_plan.QANOV-306250 @manual @mobile @regression
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
      And the "contract_status.status.label" textfield with "Status" text is displayed
      And the "contract_status.status.value" textfield with "Abbezahlt" text is displayed
      And the "contract_status.monthly_rate.label" textfield is not displayed
      And the "contract_status.monthly_rate.value" textfield is not displayed
      And the "contract_status.already_paid.label" textfield is not displayed
      And the "contract_status.already_paid.value" textfield is not displayed
      And the "contract_status.remaining_amount.label" textfield is not displayed
      And the "contract_status.remaining_amount.value" textfield is not displayed
      And the "contract_status.payment_history_entrypoint" entrypoint with "Zahlungen" text is displayed
      And the "contract_details.title" textfield with "VERTRAGSDETAILS" text is displayed
      And the "contract_details.device.label" textfield with "Dein Gerät" text is displayed
      And the "contract_details.device.value" textfield is displayed
      And the "contract_details.contract_number.label" textfield is not displayed
      And the "contract_details.contract_number.value" textfield is not displayed
      And the "contract_details.contract_duration.label" textfield is not displayed
      And the "contract_details.contract_duration.value" textfield is not displayed
      And the "contract_details.contract_start_date.label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_details.contract_start_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.contract_end_date.label" textfield with "Laufzeit des Vertrages" text is displayed
      And the "contract_details.contract_end_date.value" textfield with the "\d{2}.\d{2}.\d{4}" format is displayed
      And the "contract_details.total_amount.label" textfield with "Gesamtbetrag" text is displayed
      And the "contract_details.total_amount.value" textfield with "-" text is displayed
      And the "vat_message" textfield with "*Alle Preise sind inkl. Mehrwertsteuer angegeben." text is displayed
      And the "billing_information.title" textfield with "INFORMATIONEN ZUR RECHNUNG" text is displayed
      And the "billing_information.payment_plan_entrypoint" entrypoint is not displayed
      And the "billing_information.invoices_entrypoint" entrypoint with "Rechnung" text is displayed
      And the "myhandy_repair" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Account" page is displayed

  @jira.QANOV-269808 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-215960 @jira.link.depends_on.QANOV-215961
  @jira.link.depends_on.QANOV-215962 @jira.link.depends_on.QANOV-215963 @manual @mobile @regression
  Scenario: Postpay user with an active product can see the MyHandy Repair module
    Given user has a "my_handy" product in "active" status
      And user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     Then the "myhandy_repair" module is displayed
      And the "myhandy_repair.title" textfield with "My Handy Reparatur" text is displayed
      And the "myhandy_repair.subtitle" textfield with "Benötigst dein Gerät eine Retaratur?" text is displayed
      And the "myhandy_repair.description" textfield with "Unter Team hilt dir bei der schnellen Reparatur." text is displayed
      And the "myhandy_repair.repair_order_button" button with "Zum Reparatur Auftrag" text is displayed

  @jira.QANOV-269809 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-269808 @manual @mobile @regression
  Scenario: Postpay user with an active product can access to the MyHandy Repair screen from the "My Handy Details" screen
    Given user has a "my_handy" product in "active" status
      And user has the matching subscription selected in the account
      And user is in the "My Handy Details" page
     When clicks on the "myhandy_repair.repair_order_button" button
     Then the internal webview is displayed
      And the "Reparaturportal - Auftragsserfassung" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "My Handy Details" page is displayed
