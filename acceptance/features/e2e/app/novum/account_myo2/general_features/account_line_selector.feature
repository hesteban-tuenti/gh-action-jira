# -*- coding: utf-8 -*-
@jira.QANOV-7151
Feature: Account line selector


  @jira.QANOV-7057 @android @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-64172
  @manual @mobile @netcracker @o2uk @smoke
  Scenario: Single-msisdn user cannot see the subscription selector in the Account dashboard
    internal_checkpoint="- CERT0: paygo14@gmail.com (prepay)"
    Given user has "1" mobile lines
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "phone_number" textfield is displayed
      And the "subscription_selector.button" button is not displayed

  @jira.QANOV-7058 @android @automatic @cert0 @cert1 @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-39358 @live @mobile @netcracker @next @o2uk @smoke @webapp
  Scenario: Multi-msisdn user can see the subscription selector in the Account dashboard
    Given user has "several" mobile lines
      And user is in the "Account" page
     Then the "subscription_selector.button" button is displayed

  @jira.<jira_id> @android @automatic @cert0 @cert1 @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-24947 @mobile @o2uk
  @sanity @webapp
  Scenario Outline: A multi-msisdn user can change between subscriptions
    Given user has the "<accounts>" account types
      And user has "several" mobile lines
      And user is in the "Account" page
     When clicks on the "<first_account>" subscription type
      And waits "1" seconds
      And takes a screenshot
      And clicks on the "<second_account>" subscription type
      And waits "1" seconds
      And waits until the "highlighted_services.see_all" element is visible
     Then check that the screen is not in the previous state with threshold "0.01"

    Examples:
          | accounts       | first_account             | second_account                 | jira_id      |
          | PAYM;MBB       | Mobile · Pay monthly      | Mobile Broadband · Pay monthly | QANOV-106123 |
          | PAYM;prepay    | Mobile · Pay monthly      | Mobile · Pay as you go         | QANOV-106124 |
          | PAYM;companion | Mobile · Pay monthly      | Apple Watch · Pay monthly      | QANOV-106125 |
          | companion;PAYM | Apple Watch · Pay monthly | Mobile · Pay monthly           | QANOV-106126 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-24140 @manual @mobile @o2uk
  @regression
  Scenario Outline: A multi-msisdn user with lines from different stacks can change between subscriptions
    Given user has "several" mobile lines
      And user has the "AO2;legacy" account types
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector.button" button
      And looks for an element in the "subscription.list" in the "<stack_group>" stack
      And clicks on the "[CONTEXT:subscription.list.element.mobile_icon]" icon
     Then the account content corresponds to the "<stack_group>" stack

    Examples:
          | stack_group | ber | jira_id    |
          | AO2         | ber | QANOV-7059 |
          | legacy      |     | QANOV-7060 |

  @jira.<jira_id> @<automation_label> @<ber> @<execution_mode> @<impeded_label> @<test_priority> @android @cert0 @cert1 @ios
  @jira.cv.10.6 @jira.link.relates_to.NOV-80883 @live @mobile @netcracker @next @o2uk @webapp
  Scenario Outline: A postpay user views companion devices in the account line selector
    internal_checkpoint="The friendly name for the companion device is extracted from the output of the /verify O2 MW
    request, from a field called friendly_connection_name."
    commented_tags="@depends_on.NOV-47635"
    Given user has a "companion" account type
      And user has "<lines>" mobile lines
      And user has "<companion_lines>" companion lines
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector.button" button
     Then the "subscription.list" list is displayed
      And the "subscription.list" has "<companion_lines>" companion devices
      And each companion entry in the "subscription.list" list has the "title" textfield
      And each companion entry in the "subscription.list" list has the "subtitle" textfield with "Apple Watch · Pay monthly" text

    Examples:
          | lines   | companion_lines | ber | impeded_label | automation_label        | test_priority | execution_mode | jira_id    |
          | 1       | 1               |     |               |                         | regression    | manual         | QANOV-7152 |
          | 1       | several         |     | impeded_mock  | automation.pending_mock | regression    | manual         | QANOV-7153 |
          | several | 1               | ber |               |                         | smoke         | automatic      | QANOV-7155 |
          | several | several         |     | impeded_mock  | automation.pending_mock | regression    | manual         | QANOV-7156 |

  @jira.QANOV-7157 @android @automation.hard @ios @jira.cv.11.1 @jira.link.relates_to.NOV-100655 @manual @mobile
  @netcracker @o2uk @regression
  Scenario: A postpay user can see the companion subscription with the friendly name even if it is saved in the phonebook
    internal_checkpoint="The friendly name for the companion device is extracted from the output of the /verify O2 MW
    request, from a field called friendly_connection_name."
    commented_tags="@depends_on.NOV-47635"
    Given user has a "companion" account type
      And the companion device from the "subscription.list" is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
     Then the "subscription.list" list is displayed
      And the companion devices are displayed below their lead device and with deeper indentation in the "subscription.list" list
      And each companion entry in the "subscription.list" list has the "friendly_name" textfield
      And each companion entry in the "subscription.list" list has the "label" textfield with "Apple Watch · Pay monthly" text
      And the text "Contact Test" is not displayed in the the "friendly_name" in the "subscription.list"

  @jira.QANOV-295237 @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-101013 @mobile @netcracker @no_automatable @o2uk
  @regression
  Scenario: A postpay user that changed the friendly name of his companion device in the My O2 web opens the line selector in the account dashboard
    commented_tags="@depends_on.NOV-80884"
    The changes made in the web take a few minutes to be reflected in the app and it might be needed to relaunch the app
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "companion" account type
      And user has updated the companion device friendly name in the MyO2 web
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When pulls down the page to refresh
      And clicks on the "subscription_selector" button
     Then the companion entry in the "subscription.list" list has the "friendly_name" textfield with the updated friendly name

  @jira.QANOV-295238 @android @ios @jira.cv.14.1 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-91721 @mobile @netcracker @no_automatable @o2uk
  @regression
  Scenario: A postpay user that removed his companion device opens the line selector in the account dashboard
    commented_tags="@depends_on.NOV-80884"
    The changes made in the web take a few minutes to be reflected in the app and it might be needed to relaunch the app
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "companion" account type
      And user has removed the companion device in the MyO2 web
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When pulls down the page to refresh
      And clicks on the "subscription_selector" button
     Then the companion entry is not displayed in the "subscription.list"

  @jira.QANOV-295239 @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.relates_to.NOV-101011 @mobile @netcracker @no_automatable @o2uk
  @regression
  Scenario: A postpay user that swapped his companion device opens the line selector in the account dashboard
    commented_tags="@depends_on.NOV-80884"
    The changes made in the web take a few minutes to be reflected in the app and it might be needed to relaunch the app
    With Digital Hub the refresh button will be replaced with a "pull to refresh" (Scroll down to refresh the page)
    Given user has a "companion" account type
      And user has "several" mobile lines
      And user swapped the companion device to a second MSISDN
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When pulls down the page to refresh
      And clicks on the "subscription_selector" button
     Then the companion device is associated to the new msisdn

  @jira.QANOV-37487 @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-35253 @jira.link.parent_test_plan.QANOV-77438 @jira.parent_test_plan.QANOV-178803
  @manual @mobile @o2uk @smoke
  Scenario: A user with only a device product cannot see the line selector
    A device product includes SIM-free financing and EECC
    DEV user: sffonly@legacy.com
    other_affected_versions="2021-07, 2022-23"
    Given user does not have a "mobile_line" product
      And user has a "device" account type
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "subscription_selector" button is not displayed
      And the "line_subscription.avatar" icon is displayed
      And the "line_subscription.friendly_name" textfield is displayed

  @jira.QANOV-37488 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-35253 @jira.link.parent_test_plan.QANOV-77438 @jira.parent_test_plan.QANOV-178803
  @mobile @o2uk @smoke @webapp
  Scenario: A user with at least a mobile line product and a device product can see the line selector
    other_affected_versions="2021-07, 2022-23"
    internal_checkpoint="CERT0 user: tradfahdf@gmail.com / Test@123"
    Given user has the "device;mobile_line" account types
      And user is in the "Account" page
     When clicks on the "subscription_selector.button" button
     Then the "subscription.list" list is displayed
      And each element has the "icon" field displayed in the "subscription.list" list
      And each element has the "title" field displayed in the "subscription.list" list
