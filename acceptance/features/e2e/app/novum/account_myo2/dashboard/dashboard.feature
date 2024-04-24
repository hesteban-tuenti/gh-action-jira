# -*- coding: utf-8 -*-
@jira.QANOV-5387
Feature: Dashboard


  @jira.QANOV-5610 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-21056
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-36658 @jira.link.parent_test_plan.QANOV-67289
  @jira.link.relates_to.NOV-100993 @live @mobile @next @o2uk @smoke @webapp
  Scenario: A legacy prepay user without allowances can see the allowances module in dashboard
    other_affected_versions="2020-35, 2020-49, 2021-13"
    internal_checkpoint="To determine that a prepay user has allowances:
    he should have remaining_allowances field in the answer to prepay/tariff.
    If reminder_message is included in the answer to /prepay/balance, the text
    included will be used to present an alarm above the balance & top up button
    user: paygo2@mailinator.com"
    Given user has a "legacy prepay" account type
      And user does not have allowances
      And user has the matching subscription selected in the account
      And user has the "tariff-basic-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "concentric_squares_icon" icon is displayed
      And the "allowance_title" textfield with "You don’t have any tariff allowances" text is displayed
      And the "allowance_description" textfield with "You will see your remaining tariff allowances here if you have an active tariff" text is displayed

  @jira.QANOV-5616 @android @automatic @cert0 @cert1 @qa @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-21056
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-36658 @jira.link.parent_test_plan.QANOV-67289
  @jira.link.relates_to.NOV-100976 @mobile @o2uk @sanity @webapp
  Scenario: A legacy prepay user with allowances can see the allowances module in dashboard
    other_affected_versions="2020-35, 2020-48, 2020-49, 2021-13"
    internal_checkpoint="To determine that a prepay user has allowances:
    he should have remaining_allowances field in the answer to prepay/tariff"
    Given user has a "legacy prepay" account type
      And user has allowances
      And user has the matching subscription selected in the account
      And user has the "tariff-basic-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "sim_icon" icon is displayed
      And the "allowance_title" textfield with "Remaining tariff allowances" text is displayed
      And the "allowance_description" textfield is displayed

  @jira.QANOV-310303 @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-21056
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-36658 @jira.link.parent_test_plan.QANOV-67289
  @mobile @o2uk @smoke @webapp
  Scenario: A legacy prepay user can see the quick actions module in dashboard
    Given user has a "legacy prepay" account type
      And user has the matching subscription selected in the account
      And user has any of the "icon-smart-actions-prepay,icon-smart-actions-prepay-rolling-plan" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then each element in the "quick_actions_list" list has the "icon" field
      And each element in the "quick_actions_list" list has the "name" field
      And the "quick_actions.top_up_text" textfield with "Top Up" text is displayed
      And the "quick_actions.buy_boltons_text" textfield with "Buy Bolt Ons" text is displayed
      And the "quick_actions.change_tariff_text" textfield with "Change Tariff" text is displayed

  @jira.QANOV-310305 @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-21056
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-36658 @jira.link.parent_test_plan.QANOV-67289
  @mobile @o2uk @smoke @webapp
  Scenario: A legacy prepay user can see the airtime rewards module in dashboard
    Given user has a "legacy prepay" account type
      And user has the matching subscription selected in the account
      And user has the "airtime-rewards-prepay" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "airtime_rewards" module is displayed
      And the "airtime_rewards.title" textfield is displayed
      And the "airtime_rewards.button" button is displayed
      And the "airtime_rewards.image" icon is displayed

  @jira.QANOV-310306 @android @automatic @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-21056
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-36658 @jira.link.parent_test_plan.QANOV-67289
  @mobile @o2uk @smoke @webapp
  Scenario: A legacy prepay user can see the highlighted services in dashboard
    Given user has a "legacy prepay" account type
      And user has the matching subscription selected in the account
      And user has the "services" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "highlighted_services" module is displayed
      And the "highlighted_services.title" textfield is displayed
      And each element has the "name" field displayed in the "highlighted_services.list" list

  @jira.QANOV-5619 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.QANOV-21056
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-24947 @jira.link.parent_test_plan.QANOV-36658
  @jira.link.relates_to.NOV-101231 @live @mobile @next @o2uk @sanity @webapp
  Scenario: A legacy postpay user who access to dashboard will see the mandatory modules
    other_affected_versions="2020-49"
    Given user has a "legacy postpay" account type
      And user has the matching subscription selected in the account
      And user has any allowance in the "mobile_line" product
      And user is in the "Account" page
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "icon-smart-actions" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "latest-invoice" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "airtime-rewards-postpay" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "services" module configured in CMS for "dashboard" page for the "mobile" product
     Then the "allowances_module" module is displayed
      And the "quick_actions" module is displayed
      And the "extra_charges" module is displayed
      And the "latest_invoice" module is displayed
      And the "airtime_rewards" module is displayed
      And the "highlighted_services" module is displayed

  @jira.QANOV-152791 @android @automatic @ber @qa @cert1 @ios @jira.cv.12.4 @jira.link.parent_test_plan.QANOV-24140 @mobile
  @o2uk @sanity @webapp @ao2_api_issues
  Scenario: An AO2 postpay user who accesses to dashboard will see the mandatory modules
    NOTE: removed cert0 until ao2 APIs issues are solved
    Given user has a "AO2 postpay" account type
      And user has the matching subscription selected in the account
      And user has the "counters-carousel" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "icon-smart-actions" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "latest-invoice-2" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "offering-card-ao2" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "services" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "allowances_module" element is visible
     Then the "allowances_module" module is displayed
      And the "quick_actions" module is displayed
      And the "extra_charges" module is displayed
      And the "latest_invoice" module is displayed
      And the "upgrade_module" module is displayed
      And the "highlighted_services" module is displayed

  @jira.QANOV-37485 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-35253 @jira.link.parent_test_plan.QANOV-77438 @jira.parent_test_plan.QANOV-178803
  @mobile @o2uk @sanity @live @next @webapp
  Scenario: A user with a device product can access to the Account dashboard
    A device product includes SIM-free financing and EECC
    A SIM-free financing product is one that is not linked to any msisdn, i.e. airpods and and EECC product is an
    uncoupled device plan
    CERT0 user: tradfahdf@gmail.com / Test@123
    other_affected_versions="2021-07, 2022-23"
    Given user has a "device" account type
      And user has the matching subscription selected in the account
      And user has the "dynamic-content-empty-case" module configured in CMS for "dashboard" page for the "sim-free-finance" product
      And user is in the "Account" page
     Then the "sim_free_device_plan.image" image is displayed
      And the "sim_free_device_plan.title" textfield with "Your Device Plan" text is displayed
      And the "sim_free_device_plan.subtitle" textfield with "Check your monthly payments and see how much you’ve got left to pay" text is displayed
      And the "sim_free_device_plan.button" button with "View Device Plan" text is displayed

  @android @automatic @ber @ios @jira.<jira_id> @jira.cv.11.1 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-100849 @mobile @o2uk @smoke @webapp
  Scenario Outline: A multi-msisdn <account_type> user can see the subscription by mobile phone number in account section
    Given user has "several" mobile lines
      And user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector.button" button
     Then each element in the "subscription.list" list has the "title" field
      And each element in the "subscription.list" list has the "subtitle" field
      And the "subscription_selector.subtitle" textfield with "<label_text>" text is displayed
      And clicks on the "subscription_selector.button" button

    @cert0 @cert1 @live @next
    Examples:
          | account_type  | label_text             | parent_test_plan | jira_id    |
          | PAYM          | Mobile · Pay monthly   |                  | QANOV-5786 |
          | legacy prepay | Mobile · Pay as you go | QANOV-24141      | QANOV-5789 |

    @cert0 @cert1
    Examples:
          | account_type | label_text                     | jira_id    |
          | MBB          | Mobile Broadband · Pay monthly | QANOV-5787 |

  @jira.<jira_id> @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.1 @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-101551 @mobile @netcracker @o2uk @smoke @webapp @ao2_api_issues
  Scenario Outline: A multi-msisdn <account_type> user can see the <module> module in account section
    NOTE: setted to legacy until ao2 APIS works fine again
    Given user has "several" mobile lines
      And user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "<cms_module>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And waits until the "<module>" element is visible
     Then the "<module>" module is displayed

    Examples:
          | account_type  | module        | cms_module           | parent_test_plan | jira_id    |
          | legacy PAYM   | extra_charges | unbilled-consumption |                  | QANOV-5791 |
          | legacy MBB    | extra_charges | unbilled-consumption |                  | QANOV-5793 |
          | legacy prepay | balance       | balance              | QANOV-24141      | QANOV-5794 |
