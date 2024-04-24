# -*- coding: utf-8 -*-
@jira.QANOV-7081
Feature: Feedback alerts


  @jira.QANOV-152924 @android @ios @jira.cv.12.8 @manual @mobile @o2uk @smoke
  Scenario: A user can see an alert in Account screen when there is an alert with low balance provider in CMS
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "low-balance-novum" preconfiguration
      And user has a "legacy prepay" account type
      And user has a "<2" balance
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "alert.title" textfield with "Balance notification" text is displayed
      And the "alert.description" textfield with "Your balance was too low to get your monthly tariff allowances. Top up with the right amount to get your tariff allowances." text is displayed

  @jira.QANOV-152926 @android @ios @jira.cv.12.8 @manual @mobile @o2uk @smoke
  Scenario: A user can see an alert in Account screen when there is an alert configured with tariff reminder provider in CMS
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "prepay-tariff-reminder-message" preconfiguration
      And user has a "legacy prepay" account type
      And the balance of the user is too low to buy allowances
      And user has a ">2" balance
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "alert.title" textfield with "Balance notification" text is displayed
      And the "alert.description" textfield is displayed

  @jira.<jira_id> @android @ios @jira.cv.12.8 @manual @mobile @o2uk @regression
  Scenario Outline: A user can see an alert in <page> Previous usage screen when there is an alert configured with <provider> provider in CMS
    Given user has the "Alerts" configured in CMS for "Previous Usage <page>" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "<provider>" preconfiguration
      And user has a "legacy postpay" account type
      And user has "<allowance>" previous usage in the mobile line product from 6 months ago
      And user has recommendations in "<allowance>" previous usage
      And user is in the "Previous Usage <page>" page
     Then the "alert.title" textfield with "Let's save you money" text is displayed
      And the "alert.description" textfield is displayed
      And the "alert.link1" link with "Get a Bolt On" text is displayed
      And the "alert.link2" link with "Find a better tariff" text is displayed

    Examples:
          | provider                                | allowance | page     | jira_id      |
          | previous-usage-recommendations-data     | data      | Data     | QANOV-152927 |
          | previous-usage-recommendations-minutes  | minutes   | Minutes  | QANOV-152928 |
          | previous-usage-recommendations-messages | messages  | Messages | QANOV-152929 |

  @jira.QANOV-152930 @android @ios @jira.cv.13.0 @manual @mobile @o2uk @regression
  Scenario: A user can see an alert in Account screen when there is an alert configured with api opal provider in CMS
    other_affected_versions="2022-09"
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "reminders-api-opal" preconfiguration
      And user has a "AO2" account type
      And user has a pending extra
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.title" textfield is displayed
      And the "alert.description" textfield with the "Your plan comes with an extra \d+ days to choose" format is displayed
      And the "alert.link" textfield with "Choose your extra" text is displayed

  @jira.QANOV-152931 @android @ios @jira.cv.12.8 @manual @mobile @o2uk @regression
  Scenario: A user can see an alert in Account screen when there is an alert configured with upgrade provider in CMS
    Given user has an alert configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "upgrade" preconfiguration
      And user has a "legacy" account type
      And user is eligible for a "free" upgrade offer
      And user can upgrade in "0 days" to the offer
      And user has the matching subscription selected in the account
      And user has the "alerts" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "alert.title" textfield with "Good news. You can upgrade today" text is displayed
      And the "alert.description" textfield with "See upgrade options" text is displayed

  @jira.QANOV-360902 @android @ios @manual @mobile @o2uk @sanity @jira.cv.14.6
  Scenario: A user with delinked accounts can see the migration alert
    Given user has the "Alerts" module configured in CMS for "Account" page
      And the alert configured in CMS has the "PUBLISHED" status
      And the alert configured in CMS has the "migrated-user-alert" preconfiguration
      And user has a "AO2" account type
      And user has "several" mobile lines
      And user has "delinked" lines
      And user is in the "Account" page
     Then the "alert" element is on display
      And the "alert.info_icon" icon is displayed
      And the "alert.title" textfield is displayed
      And the "alert.description" textfield is displayed
      And the "alert.close_button" button is displayed