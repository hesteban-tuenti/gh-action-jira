# -*- coding: utf-8 -*-
@jira.QANOV-492949
Feature: Consumption Counters


  @jira.QANOV-492950 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A mobile user can see the limited mobile line consumption counter for data consumption
    Bundles with data are always limited. Counter name will come from API
    Given user has a "mobile" product
      And user is in the "Mobile Dashboard" page
     Then the "data_counter" element is on display
      And the "data_counter.title" textfield with "Llevas" text is displayed
      And the "data_counter.amount" textfield with the "\d+(,\d\d)? (MB|GB|KB)" format is displayed
      And the "data_counter.subtitle" textfield with the "de \d\d (MB|GB|KB)" format is displayed
      And the "data_counter_name" textfield is displayed

  @jira.QANOV-492951 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity @tbd
  Scenario: A mobile user can see the unlimited mobile line consumption counter for minutes consumption
    Minutes bundles are always unlimited. Counter name will come from API
    Given user has a "mobile" product
      And user is in the "Mobile Dashboard" page
     Then the "minutes_counter" element is on display
      And the "minutes_counter.title" textfield with "tbd" text is displayed
      And the "minutes_counter.amount" textfield with the "tbd" format is displayed
      And the "minutes_counter.subtitle" textfield with "tbd" text is displayed
      And the "minutes_counter_name" textfield is displayed

  @jira.QANOV-600583 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: A mobile user can see the unlimited mobile line consumption counter for SMS consumption
    SMS bundles are always unlimited. Counter name will come from API
    Given user has a "mobile" product
      And user is in the "Mobile Dashboard" page
     Then the "sms_counter" element is on display
      And the "sms_counter.title" textfield with "tbd" text is displayed
      And the "sms_counter.amount" textfield with the "tbd" format is displayed
      And the "sms_counter.subtitle" textfield with "tbd" text is displayed
      And the "sms_counter_name" textfield is displayed

  @jira.QANOV-492952 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user can see the limited mobile line consumption counter for an extra pack data consumption
    Bundles with data are always limited. Counter name will come from API
    Given user has a "mobile" plan
     Then the "extra_data_counter" element is on display
      And the "extra_data_counter.title" textfield with "Llevas" text is displayed
      And the "extra_data_counter.amount" textfield with the "\d+(,\d\d)? (MB|GB|KB)" format is displayed
      And the "extra_data_counter.subtitle" textfield with the "de \d+ (MB|GB|KB)" format is displayed
      And the "extra_data_counter_name" textfield is displayed

  @jira.QANOV-492954 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user who has consumed less than 100% of his/her data allowance can see the roundel in dark blue color
    Given user has a "mobile" plan
      And user has consumed "<100%" of the "data" allowance in the "mobile_line" product
     Then the "data_counter_color" allowance roundel is displayed in "dark_blue" color

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario Outline: A user who has an unlimited <allowance_type> allowance with consumption will see the roundel in dark blue color
    Given user has a "mobile" product
      And user is in the "Mobile Dashboard" page
     Then the "<allowance_type>_counter_color" allowance roundel is displayed in "dark_blue" color

    Examples:
          | allowance_type | jira_id      |
          | minutes        | QANOV-492956 |
          | messages       | QANOV-492957 |

  @jira.QANOV-492958 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A user who has made no consumption his/her data allowance will see the roundel in grey
    Given user has a "mobile" product
      And user is in the "Mobile Dashboard" page
      And user has consumed "0%" of the "data" allowance in the "mobile_line" product
     Then the "data_counter_color" allowance roundel is displayed in "grey" color

  @jira.QANOV-492959 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A user can switch among the consumption roundels
    Given user has a "mobile" product
      And user is in the "Mobile Dashboard" page
     When swipes the "allowance_roundel" carousel in "right" direction
     Then the "roundel_2" allowance roundel is displayed

  @jira.QANOV-492960 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A convergente user with 1 mobile line can see the data consumption counter
    Given user has a "convergente" plan
      And user has "1" mobile lines
      And user is in the "Account" page
     Then the "data_counter" element is on display
      And the "data_counter.amount" textfield with the "\d+(,\d\d)? (MB|GB|KB)" format is displayed
      And the "data_counter.subtitle" textfield with the "de \d\d (MB|GB|KB)" format is displayed
      And the "data_counter_title" textfield with "[CONTEXT:user.msisdn]" text is displayed

  @jira.QANOV-492961 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user with >1 mobile line can see a carousel with the data consumption counters for all lines
    Given user has a "convergente" plan
      And user has "2" mobile lines
      And user is in the "Account" page
     Then the "allowance_roundel" carousel is displayed
      And the "allowance_roundel" list has "[CONTEXT.user.<num_lines>]" elements
      And each element in the "allowance_roundel" list has the "data_counter_title" field

  @jira.QANOV-492963 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A convergente user with 1 mobile line and an extra data pack can see the data consumption counter with the total amount of data
    Given user has a "convergente" plan
      And user has "1" mobile lines
      And user has an extra data pack
      And user is in the "Account" page
     Then the "data_counter" element is on display
      And the amount of the total data displayed in the counter will be the sum of the plan's data plus the extra pack

  @jira.QANOV-492964 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A user can see the unlimited minutes consumption counter
    Landline minutes bundles are always unlimited. Counter name will come from API (Could be something like: Llamadas a fijos)
    Given user has a "landline" product
      And user is in the "Landline Dashboard" page
     Then the "minutes_counter" element is on display
      And the "minutes_counter.title" textfield with "Llevas" text is displayed
      And the "minutes_counter.amount" textfield with the "\d+ min" format is displayed
      And the "minutes_counter.subtitle" textfield with "de ilimitados" text is displayed
      And the "minutes_counter" textfield is displayed
