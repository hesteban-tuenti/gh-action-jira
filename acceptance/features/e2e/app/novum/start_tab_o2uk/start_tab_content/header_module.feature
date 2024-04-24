# -*- coding: utf-8 -*-
@jira.QANOV-266863
Feature: Header module

  Actions Before the Feature:
    Given user is in the "Start" page
      And pulls down the page to refresh
      And the "Start" page is displayed

  Actions Before each Scenario:
    Given user has the "header-cards-cms" module configured in CMS for "start" page

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @smoke
  Scenario Outline: A user who is in the Start tab can see a welcome message according to the hour
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user is in the "Start" page
      And device time is between "<time_min>" and "<time_max>" hours
     Then the header that contains the "<message>" text is displayed
      And the header contains the user first name

    @ber
    Examples:
          | time_min | time_max | message      | jira_id      |
          | 6:00     | 11:59    | Good morning | QANOV-266864 |

    Examples:
          | time_min | time_max | message        | jira_id      |
          | 12:00    | 17:59    | Good afternoon | QANOV-266865 |
          | 18:00    | 5:59     | Good evening   | QANOV-266866 |

  @jira.QANOV-266867 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @sanity
  Scenario: A user with no "Lifecycle & User actions" cards to be shown in the Start tab header lands in the Start tab: a random default header will be shown
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has any default start tab header configured in CMS
      And user is in the "Start" page
      And user does not have lifecycle cards in the Start tab header
     Then a random default header is displayed

  @jira.QANOV-266871 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with an available invoice lands into the start tab: The card "available invoice" will be displayed in the header
    The card will will disappear after 10 days after the billing cycle started
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has the last invoice available
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.bill_available.bill_available_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bill_available.bill_available_button]" text is displayed

  @jira.QANOV-266872 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with only one available invoice lands into the start tab: The card "available invoice" will be displayed in the header
    The card will will disappear after 10 days after the billing cycle started
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the last invoice available for "1" mobile lines
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header.title" textfield with the "[LANG:start.header.bill_available.bill_available_line_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.bill_available.bill_available_button]" text is displayed

  @jira.QANOV-266873 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with several available invoices lands into the start tab: The cards "available invoice" for each invoice will be displayed in the header
    The card will will disappear after 10 days after the billing cycle started
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the last invoice available for "several" mobile lines
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.bill_available.bill_available_line_text]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.bill_available.bill_available_button]" text

  @jira.QANOV-266874 @android @ios @jira.cv.14.1 @mobile @no_automatable @o2uk @regression
  Scenario: A user has been 10 days without tapping on the "View bill" button of the "invoice available" card: the "invoice available" card will disappear from the start tab
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has the last invoice available
      And user has the "unified-invoice" start tab header configured in CMS
      And the billing cycle started "<10" days
      And user did not tap on the "see_bill" button from the "invoice_available" card in the last "10" days
      And user is in the "Start" page
     Then the "header.title" textfield does not contain the "[LANG:start.header.bill_available.bill_available_root]" text

  @jira.QANOV-266875 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with a available invoice on the card button: User is redirected to the Latest Airtime Bill screen
    The card will will disappear after 10 days after the billing cycle started
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has the last invoice available
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Latest Airtime Bill" page is displayed

  @jira.QANOV-266876 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with several available invoices taps on the card button: User is redirected to the Latest Airtime Bill screen
    The card will will disappear after 10 days after the billing cycle started
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the last invoice available for "several" mobile lines
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Latest Airtime Bill" page is displayed
      And the bill info for the header line is displayed

  @jira.QANOV-295226 @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @o2uk
  @regression
  Scenario: A user who returns after tapping on See invoice button will see the "invoice available" card for 5 more days
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has the last invoice available
      And the billing cycle started "<10" days
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Latest Airtime Bill" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And pulls down the page to refresh
      And the "header.title" textfield that contains the "[LANG:start.header.bill_available.bill_available_root]" text is displayed

  @jira.QANOV-266878 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A user who tapped on See invoice button won't see the "invoice available" card after 5 days
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has the last invoice available
      And user accessed to the "invoice_available" card "<5" days ago
      And user has the "unified-invoice" start tab header configured in CMS
      And user is in the "Start" page
     When "5" days have passed since user accessed to the "invoice_available" card
     Then the "header.title" textfield does not contain the "[LANG:start.header.bill_available.bill_available_root]" text

  @jira.QANOV-266879 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with high consumption lands in the Start tab: a card with the warning is shown in the header
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has at least one line which has consumed ">80%" of the data
      And user has at least one line which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.data_consumption.high_data_consumption_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_consumption_button]" text is displayed

  @jira.QANOV-266880 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with high consumption lands in the Start tab: cards with the warning is shown in the header
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has "several" mobile lines which have consumed between the "80%" and the "99%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.data_consumption.high_data_consumption_line_text]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.data_consumption.data_consumption_button]" text

  @jira.QANOV-266881 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with the high data consumption card in the header taps on the card button: User will be redirected to the Account screen
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has at least one line which has consumed ">80%" of the data
      And user has at least one line which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Account" page is displayed

  @jira.QANOV-266882 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with the high data consumption card in the header taps on the card button: User will be redirected to the Account screen for the header line
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has "several" mobile lines which have consumed between the "80%" and the "99%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Account" page is displayed
      And the account info for the header line is displayed

  @jira.QANOV-266883 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with the high data consumption card in the header taps on the card button and goes back: the card won't be displayed
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has at least one line which has consumed ">80%" of the data
      And user has at least one line which has consumed "<100%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Account" page is displayed
      And clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header.title" textfield does not contain the "[LANG:start.header.data_consumption.data_consumption_root]" text

  @jira.QANOV-266884 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with the high data consumption card in the header taps on the card button and goes back: the card won't be displayed
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has "1" mobile lines which have consumed between the "80%" and the "99%" of the data
      And user has the "low-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Account" page is displayed
      And clicks on the "navigation_tab_bar.start_tab" tab
     Then the "Start" page is displayed
      And the "header.title" textfield does not contain the "[LANG:start.header.data_consumption.data_consumption_root]" text

  @jira.QANOV-266885 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with all data consumed lands in the Start tab: a card with all data consumed is shown in the header
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has at least one line which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.data_consumption.data_limit_consumed_text]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.data_consumption.data_packs_button]" text is displayed

  @jira.QANOV-266886 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with all data consumed for several lines lands in the Start tab: a card with all data consumed is shown in the header
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has "several" mobile lines which have consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.data_consumption.data_limit_consumed_line_text]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.data_consumption.data_packs_button]" text

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario Outline: A single-msisdn  <account_type> user with the all data consumed card in the header taps on the card button: User will be redirected to the buy bolt ons screen
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user has at least one line which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview with "<header>" header is displayed
      And the "Bolt On" string is displayed

    Examples:
          | account_type   | header                 | jira_id      |
          | legacy postpay | O2 \| My device        | QANOV-266887 |
          | AO2 postpay    | Buy a Bolt On \| My O2 | QANOV-266888 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario Outline: A multi-msisdn  <account_type> user with the all data consumed in several lines cards in the header taps on the card button: User will be redirected to the buy bolt ons screen
    Given user has a "<account_type>" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has "several" mobile lines which have consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview with "<header>" header is displayed
      And the "Bolt On" string is displayed

    Examples:
          | account_type   | header                 | jira_id      |
          | legacy postpay | O2 \| My device        | QANOV-266889 |
          | AO2 postpay    | Buy a Bolt On \| My O2 | QANOV-266890 |

  @jira.QANOV-266891 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with the all data consumed card in the header taps on the card button and goes back: the card won't be displayed
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has at least one line which has consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And the "header.title" textfield does not contain the "[LANG:start.header.data_consumption.data_limit_root]" text

  @jira.QANOV-266892 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with the all data consumed in one line card in the header taps on the card button and goes back: the card won't be displayed
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has "1" mobile lines which have consumed "100%" of the data
      And user has the "exhausted-data-warning" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And the "header.title" textfield does not contain the "[LANG:start.header.data_consumption.data_limit_root]" text

  @jira.QANOV-266893 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with the latest airtime bill overdue lands in the Start tab: the bill overdue card is shown in the header
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has the latest airtime bill in "overdue" status
      And user has the "overdue-invoice-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.overdue.bill_overdue_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.overdue.bill_overdue_button]" text is displayed

  @jira.QANOV-266894 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with the latest airtime bill overdue for several lines lands in the Start tab: the bill overdue cards is shown in the header
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the latest airtime bill in "overdue" status for "several" mobile lines
      And user has the "overdue-invoice-header" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.overdue.bill_overdue_line_title]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.overdue.bill_overdue_button]" text

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario Outline: A single-msisdn <account_type> user with the bill overdue card in the header taps on the card button: User will be redirected to the make a payment screen
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user has the latest airtime bill in "overdue" status
      And user has the "overdue-invoice-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "<header>" header is displayed

    Examples:
          | account_type   | header                  | jira_id      |
          | legacy postpay | O2 \| My Bills          | QANOV-266895 |
          | AO2 postpay    | Make a payment \| My O2 | QANOV-266896 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario Outline: A multi-msisdn user with the bill overdue card for a line with <account_type> account in the header taps on the card button: User will be redirected to the make a payment screen
    Given user has a "<account_type>" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the latest airtime bill in "overdue" status for "1" mobile lines with "<account_type>" account type
      And user has the "overdue-invoice-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "<header>" header is displayed

    Examples:
          | account_type   | header                  | jira_id      |
          | legacy postpay | O2 \| My Bills          | QANOV-266897 |
          | AO2 postpay    | Make a payment \| My O2 | QANOV-266898 |

  @jira.QANOV-266899 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with the bill overdue card in the header taps on the card button and goes back: the card will be displayed
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has the latest airtime bill in "overdue" status
      And user has the "overdue-invoice-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.overdue.bill_overdue_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.overdue.bill_overdue_button]" text is displayed

  @jira.QANOV-266900 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with the bill overdue card in the header taps on the card button and goes back: the card will be displayed
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the latest airtime bill in "overdue" status for "1" mobile lines
      And user has the "overdue-invoice-header" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.overdue.bill_overdue_line_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.overdue.bill_overdue_button]" text is displayed

  @jira.QANOV-266901 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with the device plan payment overdue lands in the Start tab: the device plan payment overdue card is shown in the header
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has the device plan in "overdue" status
      And user has the "device-plan-payment-overdue" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.overdue.device_plan_overdue_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.overdue.device_plan_overdue_button]" text is displayed

  @jira.QANOV-266902 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with the device plan payment overdue for several lines lands in the Start tab: the device plan payment overdue cards is shown in the header
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the device plan in "overdue" status for "several" mobile lines
      And user has the "device-plan-payment-overdue" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.overdue.device_plan_overdue_line_title]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.overdue.device_plan_overdue_button]" text

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario Outline: A single-msisdn <account_type> user with the device plan payment overdue card in the header taps on the card button: User will be redirected to the make a payment screen
    Given user has a "<account_type>" account type
      And user has "1" mobile lines
      And user has the device plan in "overdue" status
      And user has the "device-plan-payment-overdue" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "<header>" header is displayed

    Examples:
          | account_type   | header                  | jira_id      |
          | legacy postpay | O2 \| My Bills          | QANOV-266903 |
          | AO2 postpay    | Make a payment \| My O2 | QANOV-266904 |

  @jira.<jira_id> @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario Outline: A multi-msisdn user with the device plan payment overdue card for a line with <account_type> account in the header taps on the card button: User will be redirected to the make a payment screen
    Given user has a "<account_type>" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the device plan in "overdue" status for "1" mobile lines with "<account_type>" account type
      And user has the "device-plan-payment-overdue" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the internal webview is displayed
      And the "<header>" header is displayed

    Examples:
          | account_type   | header                  | jira_id      |
          | legacy postpay | O2 \| My Bills          | QANOV-266905 |
          | AO2 postpay    | Make a payment \| My O2 | QANOV-266906 |

  @jira.QANOV-266907 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn user with the device plan payment overdue card in the header taps on the card button and goes back: the card will be displayed
    Given user has a "postpay" account type
      And user has "1" mobile lines
      And user has the device plan in "overdue" status
      And user has the "device-plan-payment-overdue" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.overdue.device_plan_overdue_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.overdue.device_plan_overdue_button]" text is displayed

  @jira.QANOV-266908 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with the device plan payment overdue card in the header taps on the card button and goes back: the card will be displayed
    Given user has a "postpay" account type
      And user does not have a "prepay" account type
      And user has "several" mobile lines
      And user has the device plan in "overdue" status for "1" mobile lines
      And user has the "device-plan-payment-overdue" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the internal webview is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.overdue.device_plan_overdue_line_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.overdue.device_plan_overdue_button]" text is displayed

  @jira.QANOV-266909 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn AO2 postpay user with a eSIM pending installation lands in the Start tab: the eSIM pending installation card is shown in the header
    Given user has "1" mobile lines
      And user has a "AO2 postpay" account type
      And user has an eSIM profile to install
      And user has a device with eSIM capabilities
      And user has the "e-sim" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.esim.title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.esim.button]" text is displayed

  @jira.QANOV-266910 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn AO2 postpay user with a eSIM pending installation for several lines lands in the Start tab: the eSIM pending installation cards is shown in the header
    Given user has "several" mobile lines
      And user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has an eSIM profile to install for "several" mobile lines
      And user has a device with eSIM capabilities
      And user has the "e-sim" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header_cards" list has ">1" elements
      And each element in the "header_cards" list has the "title" textfield with the "[LANG:start.header.esim.line_title]" format
      And each element in the "header_cards" list has the "button" button with "[LANG:start.header.esim.button]" text

  @jira.QANOV-266911 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn AO2 user with the eSIM pending installation card in the header taps on the card button: User will be redirected to the installation screen
    Given user has "1" mobile lines
      And user has a "AO2 postpay" account type
      And user has an eSIM profile to install
      And user has a device with eSIM capabilities
      And user has the "e-sim" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Esim Installation" page is displayed
      And the "[LANG:esim.esim_installation_page.header]" header is displayed

  @jira.QANOV-266912 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn AO2 postapy user with the eSIM pending installation card in the header taps on the card button: User will be redirected to the installation screen
    Given user has "several" mobile lines
      And user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has an eSIM profile to install for "several" mobile lines
      And user has a device with eSIM capabilities
      And user has the "e-sim" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "Esim Installation" page is displayed
      And the "[LANG:esim.esim_installation_page.header]" header is displayed

  @jira.QANOV-266913 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A single-msisdn AO2 postpay user with the eSIM pending installation card in the header taps on the card button and goes back: the card will be displayed
    Given user has "1" mobile lines
      And user has a "AO2 postpay" account type
      And user has an eSIM profile to install
      And user has a device with eSIM capabilities
      And user has the "e-sim" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Esim Installation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Confirm Exit" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.esim.title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.esim.button]" text is displayed

  @jira.QANOV-266914 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A multi-msisdn user with the eSIM pending installation card in the header taps on the card button and goes back: the card will be displayed
    Given user has "several" mobile lines
      And user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has an eSIM profile to install for "1" mobile lines
      And user has a device with eSIM capabilities
      And user has the "e-sim" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
      And the "Esim Installation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Confirm Exit" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Start" page is displayed
      And the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.esim.line_title]" format is displayed
      And the "header.button" textfield with "[LANG:start.header.esim.button]" text is displayed

  @jira.QANOV-266915 @android @ios @jira.cv.14.1 @manual @mobile @o2uk @regression
  Scenario: A AO2 postpay user with a eSIM pending installation and device without eSIM capabilities lands in the Start tab: the eSIM pending installation card is not displayed in the header
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has an eSIM profile to install
      And user does not have a device with eSIM capabilities
      And user has the "e-sim" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield with the "[LANG:start.header.esim.title]" format is not displayed

  @jira.QANOV-420140 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: A AO2 postpay user will be able to see relevant and personalized information related to PEGA offers in the Start tab header
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has PEGA offers for the "Start tab headers" module
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     Then the "header" module is displayed
      And the "header.title" textfield is displayed
      And the "header.button" button is displayed
      And the "pega_feedback_presented" feedback is sent

  @jira.QANOV-420141 @android @ios @jira.cv.Future @manual @mobile @o2uk @regression
  Scenario: An AO2 postpay user with PEGA offers in the Start tab header can access an offer
    Given user has a "AO2 postpay" account type
      And user does not have a "prepay" account type
      And user has PEGA offers for the "Start tab headers" module
      And user has the "TBD" start tab header configured in CMS
      And user is in the "Start" page
     When clicks on the "header.button" button
     Then the "pega_feedback_clicked" feedback is sent
      And the "Your Offers" page is displayed
