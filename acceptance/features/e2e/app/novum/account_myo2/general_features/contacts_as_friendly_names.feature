# -*- coding: utf-8 -*-
@jira.QANOV-7162
Feature: Contacts as friendly names


  @jira.<jira_id> @android @automation.hard @har @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-175331 @manual @mobile @o2uk @regression
  Scenario Outline: A single-msisdn legacy user won't see the friendly name if the numbers in the bill are not stored in his/her phonebook
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has granted "contacts" permissions
      And user has made consumption on "<allowance>" in the last bill
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
      And user has not stored in the phonebook any phone number displayed in the "events_list" events
     Then each element in the "events_list" list has the "phone_number" textfield with the "XX XXX XXX XXX" format
      And each element in the "events_list" list has the "avatar" icon with the default icon

    Examples:
          | allowance              | page                   | jira_id    |
          | minutes                | Bill Minutes           | QANOV-7163 |
          | messages               | Bill Messages          | QANOV-7164 |
          | international-minutes  | International Minutes  | QANOV-7165 |
          | international-messages | International Messages | QANOV-7166 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-175330 @manual @mobile @o2uk @regression
  Scenario Outline: A single-msisdn legacy user won't see the friendly name if the user hasn't synchronized his/her phonebook
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has denied "contacts" permissions
      And user has made consumption on "<allowance>" in the last bill
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     Then each element in the "events_list" list has the "phone_number" textfield with the "XX XXX XXX XXX" format
      And each element in the "events_list" list has the "avatar" icon with the default icon

    Examples:
          | allowance              | page                   | jira_id    |
          | minutes                | Bill Minutes           | QANOV-7168 |
          | messages               | Bill Messages          | QANOV-7169 |
          | international-minutes  | International Minutes  | QANOV-7170 |
          | international-messages | International Messages | QANOV-7171 |

  @jira.QANOV-7175 @android @automation.hard @ios @jira.cv.11.5 @jira.link.relates_to.NOV-175367 @manual @mobile
  @netcracker @o2uk @regression
  Scenario: A user with multiple lines associated to the bill won't see the friendly name of his/her subscription if the user hasn't synchronized his/her phonebook
    Given user has a "postpay" account type
      And user has the latest airtime bill with "several" mobile lines
      And user has denied "contacts" permissions
      And a phone number from the "subscriptions" is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     Then the stored line is displayed with the phone number in the "subscription.list"

  @jira.QANOV-7176 @android @ios @jira.cv.10.6 @jira.link.relates_to.NOV-80900 @manual @mobile @netcracker @o2uk
  @regression
  Scenario: A postpay user whose companion device does not have a friendly name can identify his companion device line by the connection label
    internal_checkpoint="The name shown for the lines of the companion devices will be extracted from the /verify
    request and correspond to the friendly_name field or connection_label field (in that order of precedence)
    CERT0: snow79992211@stf.ref.o2.co.uk"
    commented_tags="@depends_on.NOV-80883"
    Given user has a "companion" account type
      And user has the latest airtime bill available
      And the companion device does not have a friendly name
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     Then the connection label is displayed in the "companion_friendly_name_entry" textfield

  @jira.<jira_id> @<test_priority> @android @automation.hard @ios @jira.cv.11.1 @jira.link.detects.IOS-6644
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100893 @jira.link.relates_to.NOV-100894 @manual
  @mobile @o2uk
  Scenario Outline: A single-msisdn legacy user can see numbers in Latest airtime bill consumption details as Friendly Names
    internal_checkpoint="CERT0: inl_may8842@o2.com (447521116559)"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill available
      And user has granted "contacts" permissions
      And user has made consumption on "<allowance>" in the last bill
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
     Then the stored line is displayed with the "Contact Test" name in the "events_list" events
      And the other lines not stored in the phonebook are displayed with the phone number and the default mobile avatar

    Examples:
          | allowance              | page                   | test_priority | jira_id    |
          | minutes                | Bill Minutes           | smoke         | QANOV-7177 |
          | messages               | Bill Messages          | regression    | QANOV-7178 |
          | international-minutes  | International Minutes  | regression    | QANOV-7179 |
          | international-messages | International Messages | regression    | QANOV-7181 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-175316 @manual @mobile @o2uk @regression
  Scenario Outline: A single-msisdn legacy user can see the friendly name updated if the user updates the contact stored in his/her phonebook
    internal_checkpoint="CERT1 / CERT0: testuser28@o2.com / test123"
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill with "1" mobile lines
      And user has granted "contacts" permissions
      And user has made consumption on "<allowance>" in the last bill
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     When updates the "Contact Test" contact to "Contact Test Updated" in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "bills_card_link" link
      And the "Bills" page is displayed
      And clicks on the "see_bill_details" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the "<allowance>" entrypoint
      And the "<page>" page is displayed
     Then the stored line is displayed with the "Contact Test Updated" name in the "events_list" events

    Examples:
          | allowance              | page                   | jira_id    |
          | minutes                | Bill Minutes           | QANOV-7184 |
          | messages               | Bill Messages          | QANOV-7185 |
          | international-minutes  | International Minutes  | QANOV-7187 |
          | international-messages | International Messages | QANOV-7188 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-175338 @manual @mobile @o2uk @regression
  Scenario Outline: A multi-msisdn legacy user can see the friendly name of the numbers in Latest airtime bill consumption details updated if the user updates the contact stored in his/her phonebook
    Given user has a "legacy postpay" account type
      And user has the latest airtime bill with "several" mobile lines
      And user has granted "contacts" permissions
      And user has made consumption on "<allowance>" in the last bill in one of the subscriptions
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "<page>" page of the subscription with consumption in "<allowance>" in the last bill
     When updates the "Contact Test" contact to "Contact Test Updated" in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "bills_card_link" link
      And the "Bills" page is displayed
      And clicks on the "see_bill_details" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the subscription with consumption in "<allowance>" in the last bill
      And the "Bill Concepts" page is displayed
      And clicks on the "<allowance>" entrypoint
      And the "<page>" page is displayed
     Then the stored line is displayed with the "Contact Test Updated" name in the "events_list" events

    Examples:
          | allowance | page          | jira_id    |
          | minutes   | Bill Minutes  | QANOV-7189 |
          | messages  | Bill Messages | QANOV-7190 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-175329 @manual @mobile @o2uk @regression
  Scenario Outline: A single-msisdn legacy user won't see the friendly name if the user has deleted the contact stored in his/her phonebook
    Given user has a "legacy postpay" account type
      And user has "1" mobile lines
      And user has granted "contacts" permissions
      And user has made consumption on "<allowance>" in the last bill
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page for the "mobile" product
      And user is in the "<page>" page
     When deletes the "Contact Test" contact in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "bills_card_link" link
      And the "Bills" page is displayed
      And clicks on the "see_bill_details" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the "<allowance>" entrypoint
      And the "<page>" page is displayed
     Then the deleted line is displayed with the phone number in the "events_list" events
      And the deleted line is displayed with the default icon in the "events_list" events

    Examples:
          | allowance              | page                   | jira_id    |
          | minutes                | Bill Minutes           | QANOV-7191 |
          | messages               | Bill Messages          | QANOV-7193 |
          | international-minutes  | International Minutes  | QANOV-7194 |
          | international-messages | International Messages | QANOV-7195 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-175343 @manual @mobile @o2uk @regression
  Scenario Outline: A multi-msisdn legacy user won't see the friendly name in Latest airtime bill consumption details if the user has deleted the contact stored in his/her phonebook
    Given user has a "legacy postpay" account type
      And user has "several" mobile lines
      And user has granted "contacts" permissions
      And user has made consumption on "<allowance>" in the last bill in one of the subscriptions
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page for the "mobile" product
      And user is in the "<page>" page of the subscription with consumption in "<allowance>" in the last bill
     When deletes the "Contact Test" contact in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "bills_card_link" link
      And the "Bills" page is displayed
      And clicks on the "see_bill_details" link
      And the "Latest Airtime Bill" page is displayed
      And clicks on the subscription with consumption in "<allowance>" in the last bill
      And the "Bill Concepts" page is displayed
      And clicks on the "<allowance>" entrypoint
      And the "<page>" page is displayed
     Then the deleted line is displayed with the phone number in the "events_list" events
      And the deleted line is displayed with the default icon in the "events_list" events

    Examples:
          | allowance | page          | jira_id    |
          | minutes   | Bill Minutes  | QANOV-7196 |
          | messages  | Bill Messages | QANOV-7197 |

  @jira.QANOV-7198 @android @automation.hard @ios @jira.cv.11.5 @jira.link.relates_to.NOV-175345 @manual @mobile
  @netcracker @o2uk @regression
  Scenario: A multi-msisdn user won't see the friendly name of his/her subscription if the user has deleted the contact stored in his/her phonebook
    Given user has a "postpay" account type
      And user has "several" mobile lines
      And user has granted "contacts" permissions
      And a phone number from the "subscriptions" is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Latest Airtime Bill" page
     When deletes the "Contact Test" contact in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "bills_card_link" link
      And the "Bills" page is displayed
      And clicks on the "see_bill_details" link
      And the "Latest Airtime Bill" page is displayed
     Then the deleted line is displayed with the phone number in the "subscription.list"

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-175245 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user won't see the friendly name if the numbers in <page> are not stored in his/her local phonebook
    commented_tags="@depends_on.NOV-100931"
    Given user has a "legacy postpay" account type
      And user has granted "contacts" permissions
      And user has a "mobile_line" product with "<allowance>" extra charges
      And user has not stored in the phonebook any phone number displayed in the "events_list" events
      And user has the matching subscription selected in the account
      And user has the "extra-charges-list" module configured in CMS for "<modular_page>" page for the "mobile" product
      And user is in the "<page>" page
     Then each element in the "events_list" list has the "phone_number" textfield with the "XX XXX XXX XXX" format
      And each element in the "events_list" list has the "avatar" icon with the default icon

    Examples:
          | allowance | page                   | modular_page           | jira_id    |
          | minutes   | Extra Charges Minutes  | extra-charges-calls    | QANOV-7200 |
          | messages  | Extra Charges Messages | extra-charges-messages | QANOV-7201 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-175213 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user won't see the friendly name in <page> if the user doesn't synchronize his/her local phonebook
    commented_tags="@depends_on.NOV-100931"
    Given user has a "legacy postpay" account type
      And user has denied "contacts" permissions
      And user has a "mobile_line" product with "<allowance>" extra charges
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "extra-charges-list" module configured in CMS for "<modular_page>" page for the "mobile" product
      And user is in the "<page>" page
     Then each element in the "events_list" list has the "phone_number" textfield with the "XX XXX XXX XXX" format
      And each element in the "events_list" list has the "avatar" icon with the default icon

    Examples:
          | allowance | page                   | modular_page           | jira_id    |
          | minutes   | Extra Charges Minutes  | extra-charges-calls    | QANOV-7203 |
          | messages  | Extra Charges Messages | extra-charges-messages | QANOV-7204 |

  @jira.<jira_id> @<test_priority> @android @automation.hard @ios @jira.cv.10.2 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-45911 @manual @mobile @o2uk
  Scenario Outline: A legacy postpay user can see numbers in <page> consumption details as Friendly Names
    internal_checkpoint="For minutes screen, the avatar of the contact number will also be shown in the corresponding
    entries"
    commented_tags="@depends_on.NOV-100931"
    Given user has a "legacy postpay" account type
      And user has granted "contacts" permissions
      And user has a "mobile_line" product with "<allowance>" extra charges
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "extra-charges-list" module configured in CMS for "<modular_page>" page for the "mobile" product
      And user is in the "<page>" page
     Then the stored line is displayed with the "Contact Test" name in the "events_list" events
      And the other lines not stored in the phonebook are displayed with the phone number and the default mobile avatar

    Examples:
          | allowance | page                   | test_priority | modular_page           | jira_id    |
          | minutes   | Extra Charges Minutes  | smoke         | extra-charges-calls    | QANOV-7207 |
          | messages  | Extra Charges Messages | regression    | extra-charges-messages | QANOV-7208 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.10.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-73687 @manual @mobile @o2uk @regression
  Scenario Outline: A <account_type> user can see the friendly names for premium numbers in "Premium & Information Services" if the user stored them in the phonebook
    internal_checkpoint="- CERT0 Bills: inl_may8842@o2.com / 7521116559
    - CERT0 Recent charges: in00322v_118704@o2.com / 7731296931
    - DEV Bills: 121111112@gmail.com, 141111121@gmail.com"
    commented_tags="@depends_on.NOV-47461"
    Given user has a "<account_type>" account type
      And user has granted "contacts" permissions
      And user has events "with" cost in the "premium_and_information_services" "<section>" section
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     Then the stored line is displayed with the "Contact Test" name in the "events_list" events
      And the other lines not stored in the phonebook are displayed with the phone number and the default mobile avatar

    Examples:
          | account_type | section        | page                                           | jira_id    |
          | legacy PAYM  | bill           | Bill Premium And Information Services          | QANOV-7210 |
          | legacy PAYM  | recent_charges | Extra Charges Premium And Information Services | QANOV-7211 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.10.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-72376 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user can see the friendly names for premium numbers in "Premium & Information Services" if the OB provides this information
    commented_tags="@depends_on.NOV-47461"
    internal_checkpoint="Only when the OB provides the data.
    - CERT0: Bills: inl_may8842@o2.com / 7521116559
    - CERT0 Recent charges: in00322v_118704@o2.com / 7731296931
    - DEV: 121111112@gmail.com or 141111121@gmail.com"
    Given user has a "legay postpay" account type
      And user has granted "contacts" permissions
      And user has events "with" cost in the "premium_and_information_services" "<section>" section
      And user has not stored in the phonebook any phone number displayed in the "events_list" events
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     Then each element in the "events_list" list has the "phone_number" textfield with the "XX XXX XXX XXX - {friendly_name}" format

    Examples:
          | section        | page                                           | jira_id    |
          | bill           | Bill Premium And Information Services          | QANOV-7212 |
          | recent_charges | Extra Charges Premium And Information Services | QANOV-7214 |

  @jira.QANOV-7215 @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-136681 @manual @mobile @o2uk @regression
  Scenario: A legacy user will see the friendly names in the Minutes extra charges screen for numbers stored in the phonebook
    commented_tags="@depends_on.NOV-136680"
    Given user has a "legacy postpay" account type
      And user has granted "contacts" permissions
      And user has a "mobile_line" product with "minutes" extra charges
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-calls" page for the "mobile" product
      And user is in the "Minutes Extra Charges" page
     Then the stored line is displayed with the "Contact Test" name in the "events_list" events
      And the other lines not stored in the phonebook are displayed with the phone number and the default mobile avatar

  @jira.QANOV-7216 @android @automation.hard @ios @jira.cv.11.5 @jira.link.detects.O2UK-3037
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-136699 @manual @mobile @o2uk @regression
  Scenario: A legacy postpay user will see the friendly names in the Messages extra charges screen with the number stored in the phonebook
    commented_tags="@depends_on.NOV-136698 @depends_on.NOV-136700"
    Given user has a "legacy postpay" account type
      And user has granted "contacts" permissions
      And user has a "mobile_line" product with "messages" extra charges
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "extra-charges-list" module configured in CMS for "extra-charges-messages" page for the "mobile" product
      And user is in the "Messages Extra Charges" page
     Then the stored line is displayed with the "Contact Test" name in the "events_list" events
      And the other lines not stored in the phonebook are displayed with the phone number and the default mobile avatar

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-162723 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user can see the friendly name updated in <page> if the user updates the contact stored in his/her phonebook
    Given user has a "legacy postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has granted "contacts" permissions
      And user has a "mobile_line" product with "<allowance>" extra charges
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "extra-charges-list" module configured in CMS for "<modular_page>" page for the "mobile" product
      And user is in the "<page>" page
     When updates the "Contact Test" contact to "Contact Test Updated" in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "<allowance>" allowance roundel
      And the "Consumption" page is displayed
      And the "<allowance>" tab is selected
      And clicks on the "extra_charges" entrypoint
      And the "<page>" page is displayed
     Then the stored line is displayed with the "Contact Test Updated" name in the "events_list" events

    Examples:
          | allowance | page                   | modular_page           | jira_id    |
          | minutes   | Minutes Extra Charges  | extra-charges-calls    | QANOV-7219 |
          | messages  | Messages Extra Charges | extra-charges-messages | QANOV-7220 |

  @jira.<jira_id> @android @ios @jira.cv.11.5 @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-162726
  @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay user won't see the friendly name if the user has deleted the contact stored in his/her phonebook
    Given user has a "legacy postpay" account type
      And user has any allowance in the "mobile_line" product
      And user has granted "contacts" permissions
      And user has a "mobile_line" product with "<allowance>" extra charges
      And a phone number from the "events_list" events is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user has the "extra-charges-list" module configured in CMS for "<modular_page>" page for the "mobile" product
      And user is in the "<page>" page
     When deletes the "Contact Test" contact in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "<allowance>" allowance roundel
      And the "Consumption" page is displayed
      And the "<allowance>" tab is selected
      And clicks on the "extra_charges" entrypoint
      And the "<page>" page is displayed
     Then the deleted line is displayed with the phone number in the "events_list" events
      And the deleted line is displayed with the default icon in the "events_list" events

    Examples:
          | allowance | page                   | modular_page           | jira_id    |
          | minutes   | Minutes Extra Charges  | extra-charges-calls    | QANOV-7222 |
          | messages  | Messages Extra Charges | extra-charges-messages | QANOV-7223 |

  @jira.QANOV-7226 @android @automation.hard @ios @jira.cv.11.1 @jira.link.relates_to.NOV-174905 @manual @mobile @o2uk
  @regression
  Scenario: A multi-msisdn user cannot see his/her connections as friendly names in the account line selector when his/her connections are not stored in the local phonebook
    Given user has "several" mobile lines
      And user has granted "contacts" permissions
      And user has not stored in the phonebook any phone number displayed in the "subscription_selector" list
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
     Then each element in the "subscription.list" list has the "mobile_icon" icon
      And each element in the "subscription.list" list has the "phone_number" textfield with the "XX XXX XXX XXX" format
      And each element in the "subscription.list" list has the "phone_number" textfield with the "Mobile · {account_type}" format

  @jira.QANOV-7227 @android @automation.hard @ios @jira.cv.11.1 @jira.link.relates_to.NOV-174906 @manual @mobile @o2uk
  @regression
  Scenario: A multi-msisdn user cannot see his/her connections as friendly names in the account line selector if the local phonebook is not synchronized
    Given user has "several" mobile lines
      And user has denied "contacts" permissions
      And a phone number from the "subscription_selector" list is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
     Then each element in the "subscription.list" list has the "mobile_icon" icon
      And each element in the "subscription.list" list has the "phone_number" textfield with the "XX XXX XXX XXX" format
      And each element in the "subscription.list" list has the "phone_number" textfield with the "Mobile · {account_type}" format

  @jira.QANOV-7228 @android @automation.hard @ios @jira.cv.10.2 @jira.link.relates_to.NOV-47136 @manual @mobile @o2uk
  @regression
  Scenario: A multi-msisdn user can set a friendly name to his/her connections in the account line selector
    Given user has "several" mobile lines
      And user has granted "contacts" permissions
      And user has not stored in the phonebook any phone number displayed in the "subscription_selector" list
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When stores a phone number from the "subscription_selector" list with "Contact Test" name in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "subscription_selector" button
     Then the stored line is displayed with the "Contact Test" name in the "subscription_selector" list
      And the stored line is displayed with the phonebook avatar in the "subscription_selector" list

  @jira.QANOV-7230 @android @automation.hard @ios @jira.cv.11.1 @jira.link.relates_to.NOV-101194 @manual @mobile @o2uk
  @smoke @har
  Scenario: A multi-msisdn user can see the friendly name set for his/her connections in the account line selector
    Given user has "several" mobile lines
      And user has granted "contacts" permissions
      And a phone number from the "subscription_selector" list is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
     Then the stored line is displayed with the "Contact Test" name in the "subscription_selector" list
      And the stored line is displayed with the phonebook avatar in the "subscription_selector" list

  @jira.QANOV-7231 @android @automation.hard @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100847 @manual @mobile @o2uk
  @regression
  Scenario: A multi-msisdn user can edit the friendly name of his/her connections in the account line selector
    internal_checkpoint="Sometimes it takes a while to see the number updated"
    Given user has "several" mobile lines
      And user has granted "contacts" permissions
      And a phone number from the "subscription_selector" list is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When updates the "Contact Test" contact to "Contact Test Updated" in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "subscription_selector" button
     Then the stored line is displayed with the "Contact Test Updated" name in the "subscription_selector" list

  @jira.QANOV-7232 @android @automation.hard @ios @jira.cv.11.2 @jira.link.relates_to.NOV-122087 @manual @mobile @o2uk
  @regression
  Scenario: A multiline user cannot see the mobile products in the line selector as Friendly Names if the user has deleted the contact stored in his/her phoneboo
    Given user has "several" mobile lines
      And user has granted "contacts" permissions
      And a phone number from the "subscription_selector" list is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When deletes the "Contact Test" contact in the phonebook
      And terminates the app
      And launches the app
      And the "Account" page is displayed
      And clicks on the "subscription_selector" button
     Then each element in the "subscription.list" list has the "mobile_icon" icon
      And each element in the "subscription.list" list has the "phone_number" textfield with the "XX XXX XXX XXX" format

  @jira.QANOV-6343 @android @automation.hard @ios @jira.cv.10.6 @jira.link.depends_on.QANOV-6252
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.relates_to.NOV-100862 @manual @mobile @netcracker @o2uk @regression
  Scenario: A postpay user that has changed the friendly name of his companion device in the My O2 web access Latest Airtime
    Given user has a "companion" account type
      And user has the latest airtime bill available
      And user has granted "contacts" permissions
      And a phone number from the companion device is stored with "Contact Test" name in the web
      And user has the matching subscription selected in the account
      And user has any of the "latest-invoice,latest-invoice-2" modules configured in CMS for "dashboard" page for the "mobile" product
      And user has the "invoices-list" module configured in CMS for "invoices-list" page for the "mobile" product
      And user is in the "Bills" page
     When clicks on the "bill.see_bill_details_link" link
     Then the "Latest Airtime Bill" page is displayed
      And the "companion_device_entry" textfield with "Contact Test" text is displayed
