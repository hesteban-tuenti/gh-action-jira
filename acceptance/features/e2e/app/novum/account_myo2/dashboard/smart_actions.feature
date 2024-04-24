# -*- coding: utf-8 -*-
@jira.QANOV-126811
Feature: Smart Actions


  @jira.QANOV-5613 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.14 @jira.link.parent_test_plan.QANOV-21056
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @live @mobile @next @o2uk @sanity
  @webapp
  Scenario: A legacy prepay user who has access to dashboard will see the quick actions below the allowance section
    other_affected_versions="2020-35, 2020-48, 2020-49"
    Given user has a "legacy prepay" account type
      And user has the matching subscription selected in the account
      And user has any of the "icon-smart-actions-prepay,icon-smart-actions-prepay-rolling-plan" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "quick_actions" module is displayed
      And the "quick_actions.top_up" icon is displayed
      And the "quick_actions.top_up_text" textfield with "Top Up" text is displayed
      And the "quick_actions.buy_boltons" icon is displayed
      And the "quick_actions.buy_boltons_text" textfield with "Buy Bolt Ons" text is displayed
      And the "quick_actions.change_tariff" icon is displayed
      And the "quick_actions.change_tariff_text" textfield with "Change Tariff" text is displayed

  @jira.QANOV-5618 @android @automatic @cert0 @cert1 @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-5613
  @jira.link.detects.O2UK-3970 @jira.link.parent_test_plan.QANOV-21056 @jira.link.parent_test_plan.QANOV-24141 @live
  @mobile @next @o2uk @smoke
  Scenario: A legacy prepay user can navigate to the Top-up webview from the quick actions module
    other_affected_versions="2020-35, 2020-48, 2020-49"
    Given user has a "legacy prepay" account type
      And user has the matching subscription selected in the account
      And user has any of the "icon-smart-actions-prepay,icon-smart-actions-prepay-rolling-plan" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "quick_actions.top_up" icon
      And waits "5" seconds
     Then the internal webview with "Top-up" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-145524 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.12.7 @jira.link.parent_test_plan.QANOV-21056 @live
  @mobile @netcracker @next @o2uk @sanity @webapp
  Scenario: Postpay user who has access to dashboard will see the quick actions below the allowance section
    other_affected_versions="2021-42, 2022-03"
    Given user has a "postpay" account type
      And user has the matching subscription selected in the account
      And user has the "icon-smart-actions" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "quick_actions" module is displayed
      And the "quick_actions.buy_boltons" icon is displayed
      And the "quick_actions.buy_boltons_text" textfield with "Buy Bolt Ons" text is displayed
      And the "quick_actions.upgrade" icon is displayed
      And the "quick_actions.upgrade_text" textfield with "Upgrade" text is displayed
      And the "quick_actions.change_tariff" icon is displayed
      And the "quick_actions.change_tariff_text" textfield with "Change Tariff" text is displayed

  @jira.<jira_id> @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-5625
  @jira.link.parent_test_plan.QANOV-21056 @live @mobile @netcracker @next @o2uk @regression
  Scenario Outline: A <account_type> user can navigate to the Upgrades webview from the quick actions module
    other_affected_versions="2020-35, 2020-48, 2020-49"
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has the "icon-smart-actions" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "quick_actions.upgrade" icon
     Then the browser webview with "<header>" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

    Examples:
          | account_type   | header   | jira_id      |
          | legacy postpay | Upgrades | QANOV-5626   |
          | AO2 postpay    | Upgrades | QANOV-152297 |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.11.14 @jira.link.depends_on.<depends_on>
  @jira.link.detects.O2UK-3970 @jira.link.parent_test_plan.QANOV-21056 @mobile @o2uk @<test_priority>
  Scenario Outline: A <account_type> user can navigate to the Buy Boltons page from the quick actions module
    other_affected_versions="2020-35, 2020-48, 2020-49"
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has any of the "<cms_module>" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "quick_actions.buy_boltons" icon
      And waits "5" seconds
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | account_type   | header  | cms_module         | depends_on | ber | jira_id      | test_priority |
          | legacy postpay | Boltons | icon-smart-actions | QANOV-5625 | ber | QANOV-5628   | regression    |
          | AO2 postpay    | Boltons | icon-smart-actions |            |     | QANOV-152243 | smoke         |

    @cert0 @cert1 @jira.link.parent_test_plan.QANOV-24141 @live @next
    Examples:
          | account_type  | header  | cms_module                                                       | depends_on | ber | jira_id    | test_priority |
          | legacy prepay | Boltons | icon-smart-actions-prepay,icon-smart-actions-prepay-rolling-plan | QANOV-5613 | ber | QANOV-5633 | regression    |

  @jira.<jira_id> @<ber> @android @automatic @ios @jira.cv.11.14 @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @jira.link.detects.O2UK-3970 @jira.link.parent_test_plan.QANOV-21056 @mobile @o2uk
  @regression
  Scenario Outline: A <account_type> user can navigate to the Change tariff webview from the quick actions module
    other_affected_versions="2020-35, 2020-48, 2020-49"
    Given user has a "<account_type>" account type
      And user has the matching subscription selected in the account
      And user has any of the "<cms_module>" modules configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "quick_actions.change_tariff" icon
      And waits "7" seconds
     Then the internal webview with "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | account_type   | header             | cms_module         | depends_on | detects     | ber | jira_id      |
          | legacy postpay | Choose your tariff | icon-smart-actions | QANOV-5625 | OBO2UK-1323 | ber | QANOV-5635   |
          | AO2 postpay    | Choose your tariff | icon-smart-actions |            |             |     | QANOV-152244 |

  @jira.QANOV-5641 @android @automatic @ber @cert0 @cert1 @ios @jira.cv.11.14 @jira.link.depends_on.QANOV-5613
  @jira.link.detects.O2UK-3970 @jira.link.parent_test_plan.QANOV-21056 @jira.link.parent_test_plan.QANOV-24141
  @jira.link.parent_test_plan.QANOV-249029 @live @mobile @next @o2uk @regression
  Scenario: A legacy prepay non-rolling plan user can navigate to the Change tariff webview from the quick actions module
    The webview for prepay will be different depending on the user having a rolling plan tariff (IMI page) or not
    (O2 page)
    other_affected_versions="2020-35, 2020-48, 2020-49"
    Given user has a "legacy prepay" account type
      And user does not have a "rolling plan based" tariff
      And user has the matching subscription selected in the account
      And user has the "icon-smart-actions-prepay" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "quick_actions.change_tariff" icon
      And waits "7" seconds
     Then the internal webview with "Choose your tariff" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-261768 @android @ios @jira.cv.13.8 @jira.link.depends_on.QANOV-5613 @jira.link.parent_test_plan.QANOV-21056
  @jira.link.parent_test_plan.QANOV-24141 @jira.link.parent_test_plan.QANOV-249029 @manual @mobile @o2uk @regression
  Scenario: A legacy prepay rolling plan user can navigate to the Change tariff webview from the quick actions module
    The webview for prepay will be different depending on the user having a rolling plan tariff (IMI page) or not
    (O2 page)
    other_affected_versions="2020-35, 2020-48, 2020-49"
    Given user has a "legacy prepay" account type
      And user has a "rolling plan based" tariff
      And user has the matching subscription selected in the account
      And user has the "icon-smart-actions-prepay-rolling-plan" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     When clicks on the "quick_actions.change_tariff" icon
      And waits "7" seconds
     Then the internal webview with "Plan Selection" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed
