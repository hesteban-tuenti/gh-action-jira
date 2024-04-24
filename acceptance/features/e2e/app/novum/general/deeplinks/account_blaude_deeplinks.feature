# -*- coding: utf-8 -*-
@jira.QANOV-269668
Feature: Account Blaude Deeplinks

  Actions After the Feature:
    Then restarts the navigation
     And navigates to "[CONF:landing_tab]" page

  @jira.QANOV-269675 @android @automatic @ber @blaude @cert3 @ios @jira.cv.13.9 @jira.link.detects.IOS-8336 @live @mobile
  @next @sanity
  Scenario: A postpay user can open the "Account.Bills" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product
     When opens the "Account.Bills" deeplink with the app in "killed" status
     Then the "Bills" page is displayed

  @jira.QANOV-291313 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user can open the "Account.Invoice Settings" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product
     When opens the "Account.Invoice Settings" deeplink with the app in "killed" status
     Then the "Bills" page is displayed

  @jira.QANOV-532928 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Five Years Invoice Overview" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has bills
     When opens the "Account.Five Years Invoice Overview" deeplink with the app in "killed" status
     Then the "5 Years Invoice Overview" page is displayed

  @jira.QANOV-532929 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Bill Third Party Orders Details" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has bills
     When opens the "Account.Bill Third Party Orders Details" deeplink with the app in "killed" status
     Then the "Third Party Services Charges" page is displayed

  @jira.QANOV-532930 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Myhandy Bill" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user has bills
     When opens the "Account.Myhandy Bill" deeplink with the app in "killed" status
     Then the external webview is displayed
      And the "Rechnung" string is displayed

  @jira.QANOV-291314 @android @blaude @ios @jira.cv.14.0 @jira.link.detects.OBO2DE-439 @manual @mobile @smoke
  Scenario: A user with just a mobile line product can open the "Account.Data Bundle Purchase" deeplink
    Given user has a "mobile_line" product
      And user has "1" products
      And user has "mobile_line" bundles available to purchase in "Data" category
     When opens the "Account.Data Bundle Purchase" deeplink with the app in "killed" status
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed

  @jira.QANOV-360217 @android @blaude @ios @jira.cv.14.4 @manual @mobile @regression
  Scenario: A user with just a mobile line product can open the "Account.Specific Bundle Purchase" deeplink
    Given user has a "mobile_line" product
      And user has "1" products
      And user has "mobile_line" bundles available to purchase in "any" category
     When opens the "Account.Specific Bundle Purchase" deeplink with the app in "killed" status
     Then the "Bundle Purchase Details" page is displayed
      And the "Options-Details" header is displayed
      And the details of the desired bundle are displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: A user can open the "Account.Bookable <pack_type> Packs" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has any "mobile_line" product in "active" status
      And user has "any" bundles for "mobile_line" product available to purchase in "<category>" category
     When opens the "Account.Bookable <pack_type> Packs" deeplink with the app in "killed" status
     Then the "Category Bundles" page is displayed
      And the "<header>" header is displayed

    Examples:
          | pack_type       | category      | header              | jira_id      |
          | Data            | Data          | Daten-Optionen      | QANOV-532931 |
          | Minutes And Sms | Minutes & SMS | Minuten und SMS     | QANOV-532932 |
          | Kombi           | Kombi         | Kombi-Optionen      | QANOV-532933 |
          | International   | International | Auslands-Optionen   | QANOV-532934 |
          | TV And Extra    | Other packs   | TV & Extra-Optionen | QANOV-532935 |

  @jira.QANOV-269674 @android @blaude @ios @jira.cv.14.0 @manual @mobile @smoke
  Scenario: A user can open the "Account.Tariff Details" deeplink
    Given user has a "mobile_line" product
     When opens the "Account.Tariff Details" deeplink with the app in "killed" status
     Then the "My Tariff" page is displayed

  @jira.QANOV-532936 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Roaming Prices" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "postpay" account type
      And user has a "mobile_line" product
     When opens the "Account.Roaming Prices" deeplink with the app in "killed" status
     Then the "Zone Price List Select Country" page is displayed

  @jira.QANOV-532937 @android @blaude @ios @jira.cv.24.0 @manual @mobile @smoke
  Scenario: A prepay user can open the "Account.Prepaid Plan Change" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
     When opens the "Account.Prepaid Plan Change" deeplink with the app in "killed" status
     Then the "Available Tariffs" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario Outline: A user with <num_sims> SIM/s can open the "Account.Sim Management" deeplink
    Given user has a "mobile_line" product
      And user has "<num_sims>" SIMs
     When opens the "Account.Sim Management" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | num_sims | page_name      | jira_id      |
          | 1        | Sim Details    | QANOV-269681 |
          | several  | Sim Management | QANOV-269682 |

  @jira.QANOV-532938 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Swap Sim And Esim" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "mobile_line" product in "active" status
      And user has a SIM in any of "active;suspended" status
     When opens the "Account.Swap Sim And Esim" deeplink with the app in "killed" status
     Then the "Swap SIM Choose Type" page is displayed

  @jira.QANOV-532939 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Activate Sim And Esim" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "mobile_line" product in "active" status
      And user has a SIM in any of "shipped;ready_activation" status
     When opens the "Account.Activate Sim And Esim" deeplink with the app in "killed" status
     Then the "Activate Sim Info" page is displayed

  @jira.QANOV-269683 @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario: A user can open the "Account.Pin And Puk" deeplink
    Given user has a "mobile_line" product
      And user has a SIM in any of "ordered;activating;active;suspended" status
     When opens the "Account.Pin And Puk" deeplink with the app in "killed" status
     Then the "View PIN And PUK" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @manual @mobile @regression
  Scenario Outline: A postpay user who <has_hasnt> a porting requested can open the "Account.Port In" deeplink
    NOTE: The request done to Kernel to obtain the information about if there is a previous port-in "in-progress" cannot be
    implemented because Box7 doesn't provide that information (OB4PDE-113). For that reason the Novum APP won't be able to
    block two consecutive port-in requests. However, we can know if a port-out has been requested.
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user <has_hasnt> a porting requested
     When opens the "Account.Port In" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | has_hasnt | page_name                 | jira_id      |
          | has       | Porting Already Requested | QANOV-269684 |
          | has not   | Port In Choose Line       | QANOV-269685 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.detects.<detects> @manual @mobile @regression
  Scenario Outline: A postpay user who <has_hasnt> a porting requested can open the "Account.Port Out" deeplink
    NOTE: The request done to Kernel to obtain the information about if there is a previous port-in "in-progress" cannot be
    implemented because Box7 doesn't provide that information (OB4PDE-113). For that reason the Novum APP won't be able to
    block two consecutive port-in requests. However, we can know if a port-out has been requested.
    Given user has a "<account_type>" account type
      And user has a "mobile_line" product
      And user <has_hasnt> a porting requested
     When opens the "Account.Port Out" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | account_type | has_hasnt | page_name                 | detects    | jira_id      |
          | postpay      | has not   | Port Out Choose When      | OBO2DE-446 | QANOV-269686 |
          | prepay       | has not   | Port Out This Week Info   |            | QANOV-269687 |
          | any          | has       | Porting Already Requested |            | QANOV-269688 |

  @jira.QANOV-532940 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Call Forwarding" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
     When opens the "Account.Call Forwarding" deeplink with the app in "killed" status
     Then the "Call Forwarding Configuration" page is displayed

  @jira.QANOV-532941 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Mailbox Settings" deeplink
    By default is opened as internal browser, until OB define the behaviour
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
     When opens the "Account.Mailbox Settings" deeplink with the app in "killed" status
     Then the "Mailbox Configuration" page is displayed

  @jira.QANOV-532942 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A prepay user can open the "Account.Topup With Voucher" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
     When opens the "Account.Topup With Voucher" deeplink with the app in "killed" status
     Then the "Topup With Voucher" page is displayed

  @jira.QANOV-558485 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A prepay user can open the "Account.Balance" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
     When opens the "Account.Balance" deeplink with the app in "killed" status
     Then the "Topup" page is displayed

  @jira.QANOV-558486 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A prepay user can open the "Account.Automatic Topup" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "bank_account" service in "activated" status
     When opens the "Account.Automatic Topup" deeplink with the app in "killed" status
     Then the "Automatic Topup" page is displayed

  @jira.QANOV-558487 @android @blaude @ios @jira.cv.Future @manual @mobile @regression
  Scenario: A prepay user with can open the "Account.Topup With Direct Debit" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "bank_account" service in "activated" status
     When opens the "Account.Topup With Direct Debit" deeplink with the app in "killed" status
     Then the "One-time Quick Charge Choose Amount" page is displayed

  @jira.QANOV-558488 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.EVN Settings" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has invoices
     When opens the "Account.EVN Settings" deeplink with the app in "killed" status
     Then the "EVN Settings" page is displayed

  @jira.QANOV-558490 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Data Automatic" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "data_automatic" bundle in "active" status
     When opens the "Account.Data Automatic" deeplink with the app in "killed" status
     Then the "Data Automatic Detail" page is displayed

  @jira.QANOV-558491 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A postpay user with a MyHandy product can open the "Account.My Handy Details" deeplink
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
     When opens the "Account.My Handy Details" deeplink with the app in "killed" status
     Then the "My Handy Details" page is displayed

  @jira.QANOV-558492 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A postpay user with a MyHandy product can open the "Account.My Handy Early Payments" deeplink
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
     When opens the "Account.My Handy Early Payments" deeplink with the app in "killed" status
     Then the "Early Payment" page is displayed

  @jira.QANOV-558493 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A postpay user with a MyHandy product can open the "Account.My Handy Payment History" deeplink
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
     When opens the "Account.My Handy Payment History" deeplink with the app in "killed" status
     Then the "Payment History" page is displayed

  @jira.QANOV-558494 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A postpay user an eSIM in pending installation can open the "Account.Install eSIM" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "ready_installation" status
     When opens the "Account.Install eSIM" deeplink with the app in "killed" status
     Then user is in the "Install Esim Info" page
