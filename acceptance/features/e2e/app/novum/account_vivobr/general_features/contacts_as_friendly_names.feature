@jira.QANOV-4496
Feature: Contacts as friendly names


  @jira.QANOV-22269 @android @ios @mobile @jira.cv.12.0 @manual @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-132105 @vivobr @regression @old_app
  Scenario: User cannot see the phone numbers as "Friendly Names" in the multiplan dropdown
    Given user has "several" plans
      And user has a "monoline" plan
      And a phone number from the "subscription_list" list is stored with "Contact Test" name in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "subscription_selector" button
     Then the line is displayed with the phone number in the "subscription_list" list
      And the line is displayed with the default icon in the "subscription_list" list

  @jira.QANOV-22270 @android @ios @mobile @jira.cv.12.0 @manual @jira.link.parent_test_plan.QANOV-21791
  @jira.link.parent_test_plan.QANOV-132105 @vivobr @regression @old_app
  Scenario: User cannot see the phone numbers as "Friendly Names" in the Mobile lines carousel
    Given user has "several" mobile lines in plan
      And user has a "admin" role
      And a phone number from the plan is stored with "Contact Test" name and with avatar in the phonebook
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the line is displayed with the phone number in the "mobile_lines_carousel" events
      And the line is displayed with the default icon in the "mobile_lines_carousel" events
