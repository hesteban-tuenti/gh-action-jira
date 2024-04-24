# -*- coding: utf-8 -*-
@jira.QANOV-269695
Feature: Account O2de Deeplinks

  Actions After the Feature:
    Then restarts the navigation
     And navigates to "[CONF:landing_tab]" page

  @jira.QANOV-269702 @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke @ber
  Scenario: A postpay user can open the "Account.Bills" deeplink
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
     When opens the "Account.Bills" deeplink with the app in "killed" status
     Then the "Bills" page is displayed

  @jira.QANOV-291315 @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @regression
  Scenario: A user can open the "Account.Invoice Settings" deeplink
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
     When opens the "Account.Invoice Settings" deeplink with the app in "killed" status
     Then the "Bills" page is displayed

  @jira.QANOV-532943 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Account.Five Years Invoice Overview" deeplink
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has bills
     When opens the "Account.Five Years Invoice Overview" deeplink with the app in "killed" status
     Then the "5 Years Invoice Overview" page is displayed

  @jira.QANOV-532944 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Account.Bill Third Party Orders Details" deeplink
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product
      And user has bills
     When opens the "Account.Bill Third Party Orders Details" deeplink with the app in "killed" status
     Then the "Third Party Services Charges" page is displayed

  @jira.QANOV-532945 @android @blaude @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario: A postpay user can open the "Account.Myhandy Bill" deeplink
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
      And user has bills
     When opens the "Account.Myhandy Bill" deeplink with the app in "killed" status
     Then the external webview is displayed
      And the "Rechnung" string is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de @smoke
  Scenario Outline: A user with just a <product_type> product can open the "Account.Data Bundle Purchase" deeplink
    Given user has a "<product_type>" product
      And user has "1" products
      And user has "<product_type>" bundles available to purchase in "Data" category
     When opens the "Account.Data Bundle Purchase" deeplink with the app in "killed" status
     Then the "Category Bundles" page is displayed
      And the "Daten-Optionen" header is displayed

    Examples:
          | product_type    | parent_test_plan | jira_id      |
          | mobile_line     |                  | QANOV-291316 |
          | dsl;cable;fiber | QANOV-437471     | QANOV-291317 |

  @jira.<jira_id> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  @regression
  Scenario Outline: A user with just a <product_type> product can open the "Account.Specific Bundle Purchase" deeplink
    Given user has a "<product_type>" product
      And user has "1" products
      And user has "<product_type>" bundles available to purchase in "any" category
     When opens the "Account.Specific Bundle Purchase" deeplink with the app in "killed" status
     Then the "Bundle Purchase Details" page is displayed
      And the "Options-Details" header is displayed
      And the details of the desired bundle are displayed

    Examples:
          | product_type    | parent_test_plan | jira_id      |
          | mobile_line     |                  | QANOV-360218 |
          | dsl;cable;fiber | QANOV-437471     | QANOV-360219 |

  @jira.<jira_id> @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario Outline: A user can open the "Account.Bookable <pack_type> Packs" deeplink
    Given user has any "<product_type>" product in "active" status
      And user has "any" bundles for "<product_type>" product available to purchase in "<category>" category
     When opens the "Account.Bookable <pack_type> Packs" deeplink with the app in "killed" status
     Then the "Category Bundles" page is displayed
      And the "<header>" header is displayed

    Examples:
          | product_type    | pack_type       | category      | header              | jira_id      |
          | mobile_line     | Data            | Data          | Daten-Optionen      | QANOV-532946 |
          | dsl;cable;fiber | Data            | Data          | Daten-Optionen      | QANOV-532947 |
          | mobile_line     | Minutes And Sms | Minutes & SMS | Minuten und SMS     | QANOV-532948 |
          | mobile_line     | Kombi           | Kombi         | Kombi-Optionen      | QANOV-532949 |
          | mobile_line     | International   | International | Auslands-Optionen   | QANOV-532950 |
          | mobile_line     | TV And Extra    | Other packs   | TV & Extra-Optionen | QANOV-532951 |

  @jira.QANOV-269701 @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A user can open the "Account.Tariff Details" deeplink
    Given user has any "mobile_line;internet_at_home" product
     When opens the "Account.Tariff Details" deeplink with the app in "killed" status
     Then the "My Tariff" page is displayed

  @jira.QANOV-532952 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Account.Roaming Prices" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product
     When opens the "Account.Roaming Prices" deeplink with the app in "killed" status
     Then the "Zone Price List Select Country" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  @regression
  Scenario Outline: A user with <num_sims> SIM/s can open the "Account.Sim Management" deeplink
    Given user has "1" products
      And user has a "mobile_line" product
      And user has "<num_sims>" SIMs
     When opens the "Account.Sim Management" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | num_sims | page_name      | parent_test_plan | jira_id      |
          | 1        | Sim Details    | QANOV-437471     | QANOV-269708 |
          | several  | Sim Management |                  | QANOV-269709 |

  @jira.QANOV-532953 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression @jira.link.parent_test_plan.QANOV-555760
  Scenario: A postpay user can open the "Account.Swap Sim And Esim" deeplink
    Given user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
      And user has "1" SIMs
      And user has a SIM in any of "active;suspended" status
     When opens the "Account.Swap Sim And Esim" deeplink with the app in "killed" status
     Then the "Swap SIM Choose Type" page is displayed

  @jira.QANOV-532954 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Account.Activate Sim And Esim" deeplink
    Given user has a "mobile_line" product in "active" status
      And user has a SIM in any of "shipped;ready_activation" status
     When opens the "Account.Activate Sim And Esim" deeplink with the app in "killed" status
     Then the "Activate Sim Info" page is displayed

  @jira.QANOV-269710 @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de
  @regression
  Scenario: A user can open the "Account.Pin And Puk" deeplink
    Given user has a "mobile_line" product
      And user has "1" products
      And user has "1" SIMs
      And user has a SIM in any of "ordered;activating;active;suspended" status
     When opens the "Account.Pin And Puk" deeplink with the app in "killed" status
     Then the "View PIN And PUK" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  @regression
  Scenario Outline: A postpay user who <has_hasnt> a porting requested can open the "Account.Port In" deeplink for a <product_type> product
    NOTE: The request done to Kernel to obtain the information about if there is a previous port-in "in-progress" cannot be
    implemented because Box7 doesn't provide that information (OB4PDE-113). For that reason the Novum APP won't be able to
    block two consecutive port-in requests. However, we can know if a port-out has been requested.
    Given user has a "postpay" account type
      And user has a "<product_type>" product
      And user <has_hasnt> a porting requested
     When opens the "Account.Port In" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | product_type                    | has_hasnt | page_name                 | parent_test_plan | jira_id      |
          | mobile_line;home_spot;data_spot | has       | Porting Already Requested | QANOV-437471     | QANOV-269711 |
          | mobile_line                     | has not   | Port In Choose Line       |                  | QANOV-269712 |
          | home_spot;data_spot             | has not   | Port In Choose When       | QANOV-437471     | QANOV-499018 |

  @jira.<jira_id> @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de
  @regression
  Scenario Outline: A postpay user who <has_hasnt> a porting requested can open the "Account.Port Out" deeplink for a <product_type> product
    NOTE: The request done to Kernel to obtain the information about if there is a previous port-in "in-progress" cannot be
    implemented because Box7 doesn't provide that information (OB4PDE-113). For that reason the Novum APP won't be able to
    block two consecutive port-in requests. However, we can know if a port-out has been requested.
    Given user has a "<account_type>" account type
      And user has a "<product_type>" product
      And user <has_hasnt> a porting requested
     When opens the "Account.Port Out" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | account_type | product_type                    | has_hasnt | page_name                 | parent_test_plan | jira_id      |
          | postpay      | mobile_line;home_spot;data_spot | has not   | Port Out Choose When      | QANOV-437471     | QANOV-269713 |
          | prepay       | mobile_line                     | has not   | Port Out This Week Info   |                  | QANOV-269714 |
          | any          | mobile_line;home_spot;data_spot | has       | Porting Already Requested | QANOV-437471     | QANOV-269715 |

  @jira.QANOV-532955 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Account.Call Forwarding" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line;home_spot;data_spot" product in "active" status
     When opens the "Account.Call Forwarding" deeplink with the app in "killed" status
     Then the "Call Forwarding Configuration" page is displayed

  @jira.QANOV-532956 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Account.Mailbox Settings" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line;home_spot;data_spot" product in "active" status
     When opens the "Account.Mailbox Settings" deeplink with the app in "killed" status
     Then the "Mailbox Configuration" page is displayed

  @jira.QANOV-532957 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Account.Call And SMS Settings" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
     When opens the "Account.Call And SMS Settings" deeplink with the app in "killed" status
     Then the "Call And SMS Configuration" page is displayed

  @jira.QANOV-532958 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A prepay user can open the "Account.Topup With Voucher" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
     When opens the "Account.Topup With Voucher" deeplink with the app in "killed" status
     Then the "Topup With Voucher" page is displayed

  @jira.QANOV-558583 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A prepay user can open the "Account.Balance" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
     When opens the "Account.Balance" deeplink with the app in "killed" status
     Then the "Topup" page is displayed

  @jira.QANOV-558584 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A prepay user can open the "Account.Automatic Topup" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "bank_account" service in "activated" status
     When opens the "Account.Automatic Topup" deeplink with the app in "killed" status
     Then the "Automatic Topup" page is displayed

  @jira.QANOV-558586 @android @ios @jira.cv.Future @manual @mobile @o2de @regression
  Scenario: A prepay user can open the "Account.Topup With Direct Debit" deeplink
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status
      And user has "bank_account" service in "activated" status
     When opens the "Account.Topup With Direct Debit" deeplink with the app in "killed" status
     Then the "One-time Quick Charge Choose Amount" page is displayed

  @jira.QANOV-558588 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A postpay user can open the "Account.EVN Settings" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has invoices
     When opens the "Account.EVN Settings" deeplink with the app in "killed" status
     Then the "EVN Settings" page is displayed

  @jira.QANOV-558589 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A prepay user can open the "Account.Data Automatic" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "data_automatic" bundle in "active" status
     When opens the "Account.Data Automatic" deeplink with the app in "killed" status
     Then the "Data Automatic Detail" page is displayed

  @jira.QANOV-558590 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A postpay user with a MyHandy product can open the "Account.My Handy Details" deeplink
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
     When opens the "Account.My Handy Details" deeplink with the app in "killed" status
     Then the "My Handy Details" page is displayed

  @jira.QANOV-558592 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A postpay user with a MyHandy product can open the "Account.My Handy Early Payments" deeplink
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
     When opens the "Account.My Handy Early Payments" deeplink with the app in "killed" status
     Then the "Early Payment" page is displayed

  @jira.QANOV-558593 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A postpay user with a MyHandy product can open the "Account.My Handy Payment History" deeplink
    Given user has a "postpay" account type
      And user has a "my_handy" product in "active" status
     When opens the "Account.My Handy Payment History" deeplink with the app in "killed" status
     Then the "Payment History" page is displayed

  @jira.QANOV-558594 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A postpay user an eSIM in pending installation can open the "Account.Install eSIM" deeplink
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "ready_installation" status
     When opens the "Account.Install eSIM" deeplink with the app in "killed" status
     Then user is in the "Install Esim Info" page

  @jira.QANOV-558596 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multisim user can open the "Account.Add SIM/eSIM" deeplink
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has a SIM in any of "active;in_preparation;activating" status
     When opens the "Account.Add SIM/eSIM" deeplink with the app in "killed" status
     Then the "Sim Addition Choose Services" page is displayed

  @jira.QANOV-558597 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multisim UDP user can open the "Account.Delete SIM" deeplink
    Given user has a UDP tariff
      And user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has "several" SIMs in "active" status for the same mobile line
     When opens the "Account.Delete SIM" deeplink with the app in "killed" status
     Then clicks on any of the active SIMs
      And the "Delete SIM" page is displayed

  @jira.QANOV-558598 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: A multisim user can open the "Account.SIM Change Name" deeplink
    Given user has a "mobile_line" product in "active" status
      And user has "multisim" service in "activated" status
      And user has a SIM in any of "active;in_preparation;activating" status
     When opens the "Account.SIM Change Name" deeplink with the app in "killed" status
     Then the "Sim Name Change" page is displayed
