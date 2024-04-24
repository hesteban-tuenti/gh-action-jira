# -*- coding: utf-8 -*-
@jira.QANOV-570516
Feature: Start tab Upgrades Module

  Actions Before each Scenario:
    Given user does not have a "prepay" account type


  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.9 @manual @mobile @o2uk @sanity
  Scenario Outline: A legacy postpay user can see the upgrade card in Start tab
    Given user has a "legacy postpay" account type
      And user has "<eligible_lines>" mobile lines "eligible" for an upgrade
      And user has "<non_eligible_lines>" mobile lines "non-eligible" for an upgrade
      And user has the "<module>" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "upgrade_card" module is displayed
      And the "upgrade_card.title" textfield is displayed
      And the "upgrade_card.subtitle" textfield is displayed
      And the "upgrade_card.description" textfield is displayed
      And the "upgrade_card.image" textfield is displayed
      And the "upgrade_card.card_link" link is displayed

    Examples:
          | module                       | eligible_lines | non_eligible_lines | ber | jira_id      |
          | upgrades-legacy-eligible     | >0             | 0                  | ber | QANOV-493413 |
          | upgrades-legacy-eligible     | >0             | >0                 |     | QANOV-493414 |
          | upgrades-legacy-non-eligible | 0              | >0                 |     | QANOV-493415 |

  @jira.QANOV-493417 @android @ios @jira.cv.14.9 @manual @mobile @o2uk @smoke
  Scenario: A legacy postpay user with one line eligible to upgrade can access the Upgrade webview from Start tab
    Given user has a "legacy postpay" account type
      And user has "1" mobile lines "eligible" for an upgrade
      And user has the "upgrades-legacy-eligible" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "upgrade_card.card_link" button
     Then the browser webview with "Upgrades" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.QANOV-493419 @android @ios @jira.cv.14.9 @manual @mobile @o2uk @smoke
  Scenario: A legacy postpay user with only one non-eligible line to upgrade can access the Upgrade webview from Start tab
    Given user has a "legacy postpay" account type
      And user has "1" mobile lines "non-eligible" for an upgrade
      And user has "0" mobile lines "eligible" for an upgrade
      And user has the "upgrades-legacy-non-eligible" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "upgrade_card.card_link" button
     Then the browser webview with "Upgrades" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.QANOV-493421 @android @ios @jira.cv.14.9 @manual @mobile @o2uk @smoke
  Scenario: A legacy postpay multi-msisdn user with eligible to upgrade lines will be redirected to the disambiguation screen after clicking on the Upgrade module. Only eligible lines will be displayed.
    Given user has a "legacy postpay" account type
      And user has ">1" mobile lines "eligible" for an upgrade
      And user has the "upgrades-legacy-eligible" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "upgrade_card.card_link" button
     Then the "Line Disambiguation" page is displayed
      And the header that contains the "Your products" text is displayed
      And the "title" textfield with "Select a product to continue" text is displayed
      And the "lines.list" list is displayed
      And the "lines.list" list entries will match the "eligible" mobile lines
      And each element in the "lines.list" list has the "icon" field
      And each element in the "lines.list" list has the "title" field
      And each element in the "lines.list" list has the "subtitle" field
      And each element in the "lines.list" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.QANOV-493422 @android @ber @ios @jira.cv.14.9 @manual @mobile @o2uk @smoke
  Scenario: A legacy postpay multi-msisdn user with only non-eligible to upgrade lines will be redirected to the disambiguation screen after clicking on the Upgrade module
    Given user has a "legacy postpay" account type
      And user has "0" mobile lines "eligible" for an upgrade
      And user has ">1" mobile lines "non-eligible" for an upgrade
      And user has the "upgrades-legacy-non-eligible" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "upgrade_card.card_link" button
     Then the "Line Disambiguation" page is displayed
      And the header that contains the "Your products" text is displayed
      And the "title" textfield with "Select a product to continue" text is displayed
      And the "lines.list" list is displayed
      And the "lines.list" list entries will match the "non-eligible" mobile lines
      And each element in the "lines.list" list has the "icon" field
      And each element in the "lines.list" list has the "title" field
      And each element in the "lines.list" list has the "subtitle" field
      And each element in the "lines.list" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.9 @manual @mobile @o2uk @regression
  Scenario Outline: A legacy postpay multi-msisdn user can access to Upgrade page from Disambiguation screen
    Given user has a "legacy postpay" account type
      And user has "<eligible_lines>" mobile lines "eligible" for an upgrade
      And user has "<non_eligible_lines>" mobile lines "non-eligible" for an upgrade
      And user has the "upgrades-legacy-eligible" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "upgrade_card.card_link" button
      And the "Line Disambiguation" page is displayed
      And clicks on any element in the "lines.list" list
     Then the browser webview with "Upgrades" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Line Disambiguation" page is displayed

    Examples:
          | eligible_type | module                       | eligible_lines | non_eligible_lines | jira_id      |
          | eligible      | upgrades-legacy-eligible     | >1             | any                | QANOV-493424 |
          | non-eligible  | upgrades-legacy-non-eligible | 0              | >1                 | QANOV-493427 |

  @jira.QANOV-493428 @android @ber @ios @jira.cv.14.9 @manual @mobile @o2uk @sanity
  Scenario: An AO2 postpay user can see the upgrade card in Start tab
    Given user has a "AO2 postpay" account type
      And user has ">0" mobile lines
      And user has the "upgrades-ao2" module configured in CMS for "start" page
      And user is in the "Start" page
     Then the "upgrade_card" module is displayed
      And the "upgrade_card.title" textfield is displayed
      And the "upgrade_card.subtitle" textfield is displayed
      And the "upgrade_card.description" textfield is displayed
      And the "upgrade_card.image" textfield is displayed
      And the "upgrade_card.card_link" link is displayed

  @jira.QANOV-493430 @android @ios @jira.cv.14.9 @manual @mobile @o2uk @regression
  Scenario: An AO2 user can access the Upgrade webview from Start tab
    Given user has a "AO2 postpay" account type
      And user has "1" mobile lines
      And user has the "upgrades-ao2" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "upgrade_card.card_link" button
     Then the browser webview with "Upgrades" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.QANOV-493432 @android @ios @jira.cv.14.9 @manual @mobile @o2uk @smoke
  Scenario: A AO2 multi-msisdn user will be redirected to the disambiguation screen after clicking on the Upgrade module
    Given user has a "AO2 postpay" account type
      And user has ">1" mobile lines
      And user has the "upgrades-ao2" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "upgrade_card.card_link" button
     Then the "Line Disambiguation" page is displayed
      And the header that contains the "Your products" text is displayed
      And the "title" textfield with "Select a product to continue" text is displayed
      And the "lines.list" list is displayed
      And each element in the "lines.list" list has the "icon" field
      And each element in the "lines.list" list has the "title" field
      And each element in the "lines.list" list has the "subtitle" field
      And each element in the "lines.list" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "Start" page is displayed

  @jira.QANOV-493434 @android @ios @jira.cv.14.9 @manual @mobile @o2uk @regression
  Scenario: A AO2 multi-msisdn user can access to Upgrade page from Disambiguation screen
    Given user has a "AO2 postpay" account type
      And user has ">1" mobile lines
      And user has the "upgrades-ao2" module configured in CMS for "start" page
      And user is in the "Start" page
     When clicks on the "upgrade_card.card_link" button
      And the "Line Disambiguation" page is displayed
      And clicks on any element in the "lines.list" list
     Then the browser webview with "Upgrades" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Line Disambiguation" page is displayed
