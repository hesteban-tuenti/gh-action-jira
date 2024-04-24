# -*- coding: utf-8 -*-
@jira.QANOV-218361
Feature: Digital billing email

  Actions Before each Scenario:
    Given user has a "postpay" account type


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User without digital bill email saved can see the "digital bill email" entrypoint in the "Payment Settings" screen
    Given user has any "<postpay_products>" product in "active" status
      And user has "digital_bill" service in "deactivated" status
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "digital_bill_entrypoint" entrypoint with "Online-Rechnung" text is displayed
      And the "digital_bill_description" textfield is not displayed
      And the "digital_bill_tag" textfield with "Nicht hinterlegt" text is displayed

    @raitt_drop2
    Examples:
          | product | cv   | postpay_products | depends_on                                          | jira_id      |
          | blaude  | 13.9 | mobile_line      | QANOV-217326:QANOV-217341                           | QANOV-217348 |

    Examples:
          | product | cv   | postpay_products             | depends_on                                          | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-217337:QANOV-217338:QANOV-217342:QANOV-217343 | QANOV-217349 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User with digital bill email saved can see the "digital bill email" entrypoint in the "Payment Settings" screen
    Given user has any "<postpay_products>" product
      And user has "digital_bill" service in "activated" status
      And user has the "Payment Settings" module configured in CMS for "Payment Settings" page
      And user is in the "Payment Settings" page
     Then the "digital_bill_entrypoint" entrypoint with "Online-Rechnung" text is displayed
      And the "digital_bill_description" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "digital_bill_tag" textfield is not displayed

    @raitt_drop2
    Examples:
          | product | cv   | postpay_products | depends_on                                          | jira_id      |
          | blaude  | 13.9 | mobile_line      | QANOV-217326:QANOV-217341                           | QANOV-217350 |

    Examples:
          | product | cv   | postpay_products             | depends_on                                          | jira_id      |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-217337:QANOV-217338:QANOV-217342:QANOV-217343 | QANOV-217351 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A postpay user with Telco product/s and My Handy product/s can access to the "Digital Bill" screen for Telco products from the Profile screen
    Telco products: mobile line, internet@home.
    The flow to add/edit the Digital Billing Email will be defined in the "account_XXXX/invoices" folder.
    Given user has any "<postpay_products>" product in "active" status
      And user has a "my_handy" product in "active" status
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Distributive Payment Settings" modules configured in CMS for "Distributive Payment Settings" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Distributive Payment Settings" page is displayed
      And clicks on the element with "title" field with "Telco-Produkte" value of the "products_list" list
      And the "Payment Settings" page is displayed
      And clicks on the "digital_bill_entrypoint" entrypoint
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | postpay_products             | jira_id      |
          | blaude  | 13.9 | mobile_line                  | QANOV-218362 |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-218363 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A postpay user with only Telco product/s can access to the "Digital Bill" screen from Profile screen
    The flow to add/edit the Digital Billing Email will be defined in the "account_XXXX/invoices" folder.
    Given user has a "postpay" account type
      And user has any "<postpay_products>" product in "active" status
      And user does not have the "my_handy" products
      And user has the "Entrypoint list" module configured in CMS for "Profile" page
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user is in the "Profile" page
     When clicks on the "payment_settings_entrypoint" entrypoint
      And the "Payment Settings" page is displayed
      And clicks on the "digital_bill_entrypoint" entrypoint
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | postpay_products             | jira_id      |
          | blaude  | 13.9 | mobile_line                  | QANOV-218364 |
          | o2de    | 14.2 | mobile_line;internet_at_home | QANOV-218365 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression
  Scenario Outline: Postpay user with all products cancelled cannot change the digital bill email from Profile screen
    This screen will be displayed in "only read" mode.
    Given user has "digital_bill" service in "activated" status
      And user has all products in "cancelled" status
      And user has the "Payment Settings" modules configured in CMS for "Payment Settings" page
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Payment Settings" page
     When clicks on the "digital_bill_entrypoint" entrypoint
     Then the "Digital Bill" page is displayed
      And the "title" textfield with "E-Rechnungs-E-Mail bearbeiten" text is displayed
      And the "description" textfield with "Du erhältst deine Rechnung monatlich per E-Mail." text is displayed
      And the "email_value" textfield is displayed
      And the "email_label" textfield with "E-Mail-Adresse" text is displayed
      And the "email_info.description" textfield with "You will always receive an email with your billing notifications but you can also choose to receive it by SMS" text is displayed
      And the "billing_sms_notifications_entrypoint" entrypoint is not displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "change_digital_bill_email_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Payment Settings" page is displayed

    Examples:
          | product | cv   | parent_test_plan          | jira_id      |
          | blaude  | 14.1 | QANOV-306250              | QANOV-308051 |
          | o2de    | 14.2 | QANOV-306250:QANOV-437471 | QANOV-308052 |
