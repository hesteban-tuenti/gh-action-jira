# -*- coding: utf-8 -*-
@jira.QANOV-126325
Feature: Credentials with SIM

  Actions Before each Scenario:
    Given user is in the "Splash Screen" page


  @jira.<jira_id> @UniqueLoginClose @android @ios @mobile @jira.cv.10.2 @no_automatable @jira.link.detects.OBO2UK-1227
  @jira.link.relates_to.NOV-47603 @o2uk @<test_priority> @har
  Scenario Outline: A user can access with the specific Telefonica SIM in the device
    internal_checkpoint="Only tested against live with O2 SIMs"
    commented_tags="@relates_to.NOV-47602 @relates_to.NOV-47695 @relates_to.NOV-58627 @relates_to.NOV-175428"
    Given user is "<register_status>" in the application
      And user has a "o2uk" SIM in the device
     When clicks on the "start_now" button
     Then the "O2uk Password Login" page is displayed
      And the "description" textfield with "We've detected these account details. Please enter your password to log in:" text is displayed
      And the "pass_field" inputtext with the "Password" placeholder is displayed
      And the "continue" button with "Continue" text is displayed
      And the "other_account" link with "User another account" text is displayed
      And the "forgotten_log_in_details" link with "Forgotten login details?" text is displayed

    Examples:
          | register_status | jira_id    | test_priority |
          | registered      | QANOV-5506 | sanity        |
          | not_registered  | QANOV-5507 | smoke         |

  @jira.QANOV-5512 @no_automatable @android @ios @mobile @jira.cv.10.2
  @jira.link.relates_to.NOV-47605 @jira.link.relates_to.QANOV-5507 @jira.link.relates_to.QANOV-5747 @o2uk @regression
  Scenario: A user with the specific Telefonica SIM in the device selects use other account
    Given user has a "o2uk" SIM in the device
     When clicks on the "start_now" button
      And the "O2uk Password Login" page is displayed
      And clicks on the "other_account" link
     Then the "email_field" inputtext with the "Email" placeholder is displayed
      And the "other_account" link is not displayed
