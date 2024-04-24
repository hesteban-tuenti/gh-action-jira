# -*- coding: utf-8 -*-
@jira.QANOV-204436
Feature: Invoices services

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has the "Bills services" module configured in CMS for "Bills" page


  @jira.QANOV-47775 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200127
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity
  Scenario: Postpay user with bills can access to the "5 years invoice overview" bill service
    The user can see the bill overviews for the last 5 years.
    The "year_filter" selector will display the last 5 years when the user had bills (ordered from most recent year to
    less recent year). Note that complete natural years are displayed, so 6 years could be displayed in the filter.
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "5 Years Invoice Overview" module configured in CMS for "5 Years Invoice Overview" page
      And user is in the "Bills" page
     When clicks on the "5years_invoice_overview_entrypoint" entrypoint
     Then the "5 Years Invoice Overview" page is displayed
      And the "Jahresübersicht" header is displayed
      And the "title" textfield with "Jahresübersicht" text is displayed
      And the "description" textfield with "Wähle das gewünschte Jahr aus:" text is displayed
      And the "year_filter" selector is displayed
      And the "year_filter_placeholder" textfield with "Jahr" text is displayed
      And the "most" recent year is selected in the "year_filter_list" list
      And the "download_pdf_button" button with "PDF herunterladen" text is displayed
      And the "monthly_bills_list_title" textfield with "DATUM UND RECHNUNGSNUMMER" text is displayed
      And the "monthly_bills_list" list is displayed
      And each element in the "monthly_bills_list" list has the "bill_month" textfield with the "(Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format
      And each element in the "monthly_bills_list" list has the "bill_number" textfield with the "\d+\/\d{2}" format
      And each element in the "monthly_bills_list" list has the "bill_amount" textfield with the "[-]?\d+,\d\d €" format
      And the elements in the "monthly_bills_list" list are ordered by date descendant
      And the elements in the "monthly_bills_list" list correspond to the selected year
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-47776 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47775 @manual @mobile @o2de @regression
  Scenario: Postpay user can filter the bills by year in the "5 years invoice overview" screen
    The "year_filter" selector will display the last 5 years when the user had bills (ordered from most recent year to
    less recent year). Note that complete natural years are displayed, so 6 years could be displayed in the filter.
    Given user has any "mobile_line;internet_at_home" product
      And user has bills for "several" years
      And user has the matching subscription selected in the account
      And user has the "5 Years Invoice Overview" module configured in CMS for "5 Years Invoice Overview" page
      And user is in the "5 Years Invoice Overview" page
     When clicks on the "year_filter" selector
      And clicks on the "last" element in the "year_filter_list" list
     Then the "less" recent year is selected in the "year_filter_list" list
      And the "monthly_bills_list" list is displayed
      And each element in the "monthly_bills_list" list has the "bill_month" textfield with the "(Januar|Februar|März|April|Mai|Juni|Juli|August|September|Oktober|November|Dezember) \d{4}" format
      And each element in the "monthly_bills_list" list has the "bill_number" textfield with the "\d+\/\d{2}" format
      And each element in the "monthly_bills_list" list has the "bill_amount" textfield with the "[-]?\d+,\d\d €" format
      And the elements in the "monthly_bills_list" list are ordered by date descendant
      And the elements in the "monthly_bills_list" list correspond to the selected year

  @jira.QANOV-47777 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47775 @manual @mobile @o2de @regression
  Scenario: Postpay user can see bills for only the last 5 years in the "5 years invoice overview" screen
    Note that complete natural years are displayed, so 6 years will be displayed in the filter.
    Given user has any "mobile_line;internet_at_home" product
      And user has bills for ">5" years
      And user has the matching subscription selected in the account
      And user has the "5 Years Invoice Overview" module configured in CMS for "5 Years Invoice Overview" page
      And user is in the "5 Years Invoice Overview" page
     When clicks on the "year_filter" selector
     Then the "year_filter_list" list has "6" elements

  @jira.QANOV-47778 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-47775 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: Postpay user can download the bills list of the selected year in the "5 years invoice overview" screen on Android devices
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "5 Years Invoice Overview" module configured in CMS for "5 Years Invoice Overview" page
      And user is in the "5 Years Invoice Overview" page
     When clicks on the "download_pdf_button" button
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened

  @jira.QANOV-47779 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47775 @jira.link.parent_test_plan.QANOV-437471 @manual
  @mobile @o2de @smoke
  Scenario: Postpay user can open the bills list of the selected year in the "5 years invoice overview" screen on iOS devices
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "5 Years Invoice Overview" module configured in CMS for "5 Years Invoice Overview" page
      And user is in the "5 Years Invoice Overview" page
     When clicks on the "download_pdf_button" button
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47778 @jira.link.depends_on.QANOV-47779 @manual
  @mobile @o2de @regression
  Scenario Outline: Postpay user can zoom <direction> on a bills list file
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "5 Years Invoice Overview" module configured in CMS for "5 Years Invoice Overview" page
      And the "monthly_bills_list" file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id     |
          | in        | bigger  | QANOV-47780 |
          | out       | smaller | QANOV-47781 |

  @jira.QANOV-47782 @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47779 @manual @mobile @o2de @regression
  Scenario: Postpay user can share the bills list on iOS devices
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "5 Years Invoice Overview" module configured in CMS for "5 Years Invoice Overview" page
      And the "monthly_bills_list" file is displayed
     When clicks on the "share" button
     Then the native sharing options are displayed

  @jira.QANOV-241999 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200127
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @regression
  Scenario: Postpay user without third party charges can access to the "Third Party Services Charges" bill service
    Given user has any "mobile_line;home_spot;data_spot" product in "active" status
      And user has bills
      And user has not third party charges
      And user has the matching subscription selected in the account
      And user has the "Third Party Services Charges" module configured in CMS for "Third Party Services Charges" page
      And user is in the "Bills" page
     When clicks on the "bills_services.third_party_service_charges_entrypoint" entrypoint
     Then the "Third Party Services Charges" page is displayed
      And the "Drittanbieterdienste" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Keine genutzten Drittanbieterdienste" text is displayed
      And the "description" textfield with "Fallen Kosten für Drittanbieterdienste an, werden diese hier agezeigt." text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-47783 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200127
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity
  Scenario: Postpay user with third party charges can access to the "Third Party Services Charges" bill service
    The user can see a list of all charges for the last billing period. The APP does not sort the elements of this list,
    we are showing the order provided by the OB API.
    These 3rd party charges are not associated with any invoice from an API perspective. This means that we will never
    know which invoice they refer to. We should display the charges of the past 90 days.
    Given user has any "mobile_line;home_spot;data_spot" product in "active" status
      And user has bills
      And user has third party charges
      And user has the matching subscription selected in the account
      And user has the "Third Party Services Charges" module configured in CMS for "Third Party Services Charges" page
      And user is in the "Bills" page
     When clicks on the "bills_services.third_party_service_charges_entrypoint" entrypoint
     Then the "Third Party Services Charges" page is displayed
      And the "Drittanbieterdienste" header is displayed
      And the "title" textfield with "Genutzte Drittanbieterdienste" text is displayed
      And the "description" textfield with "Hier findest du bis zu 90 Tage zurückliegende Umsätze anderer Anbieter, die du über den Dienst “Bezahlen per Handyrechnung” genutzt hast." text is displayed
      And the "charges_title" textfield with "ANBIETER/DIENST" text is displayed
      And the "charges_list" list is displayed
      And each element in the "charges_list" list has the "third_party_provider_name" field
      And each element in the "charges_list" list has the "date_and_time" textfield with the "\d\d.\d\d.\d\d\d\d \d{2}:\d{2}" format
      And each element in the "charges_list" list has the "amount" textfield with the "\d+,\d\d €" format
      And each element in the "charges_list" list has the "chevron_icon" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bills" page is displayed

  @jira.QANOV-242000 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47783 @manual @mobile @o2de @regression
  Scenario: A third party provider charge without provider name will display the default "Third party service" name
    If the API doesn't return a provider name for any charge, we will print the default name "Third party service".
    Given user has any "mobile_line;home_spot;data_spot" product in "active" status
      And user has bills
      And user has a third party charge without provider name
      And user has the matching subscription selected in the account
      And user has the "Third Party Services Charges" module configured in CMS for "Third Party Services Charges" page
      And user is in the "Third Party Services Charges" page
     Then any element in the "charges_list" list has the "third_party_provider_name" textfield with the "Third party service" text

  @jira.QANOV-204437 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-47783
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user can see the details of a third-party provider
    The header of this screen will be the name of the third-party provider
    Given user has any "mobile_line;home_spot;data_spot" product in "active" status
      And user has bills
      And user has third party charges
      And user has the matching subscription selected in the account
      And user has the "Third Party Services Charges" module configured in CMS for "Third Party Services Charges" page
      And user has the "Provider details" module configured in CMS for "Provider Details" page
      And user is in the "Third Party Services Charges" page
     When clicks on any element in the "charges_list" list
     Then the "Provider Details" page is displayed
      And the "[CONTEXT:selected_provider]" header is displayed
      And the "title" textfield with "Details Drittanbieter" text is displayed
      And the "address_title" textfield with "Addresse" text is displayed
      And the "address_value" textfield is displayed
      And the "email_title" textfield with "E-Mail Adresse" text is displayed
      And the "email_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "phone_number_title" textfield with "Rufnummer" text is displayed
      And the "phone_number_value" textfield with the "TBD" format is displayed
      And the "website_title" textfield with "Website" text is displayed
      And the "website_value" textfield with the "^https?:\/\/[\w\-]+(\.[\w\-]+)+[\/#?]?.*$" format is displayed
      And the "description_title" textfield with "Beschreibung" text is displayed
      And the "description_value" textfield is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Third Party Services Charges" page is displayed

  @jira.QANOV-47784 @TBD @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-200127
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: Postpay user with bills can access to the "Bill Example" service
    Given user has any "mobile_line;internet_at_home" product
      And user has bills
      And user has the matching subscription selected in the account
      And user is in the "Bills" page
     When clicks on the "bill_example_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "o2 Rechnung online einsehen und Zahlungen verwalten" header is displayed
      And the "Rechnung & Zahlung" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.QANOV-576586 @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-576577 @manual @mobile @o2de
  @regression @e2e
  Scenario: Postpay user with bills can access to the "Manage phone payments" service
    Given user has any "mobile_line;home_spot;data_spot" product
      And user has bills
      And user has the matching subscription selected in the account
      And user has the "Manage Phone Payments" modules configured in CMS for "Manage Phone Payments" page
      And user is in the "Bills" page
     When clicks on the "manage_phone_payments_entrypoint" entrypoint
     Then the "Manage Phone Payments" page is displayed
      And the "Drittanbieterdienste" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed
