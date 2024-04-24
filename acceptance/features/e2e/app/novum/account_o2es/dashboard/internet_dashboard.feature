# -*- coding: utf-8 -*-
@jira.QANOV-492931
Feature: Internet Dashboard

  Actions Before each Scenario:
    Given user is in the "Account" page


  @jira.<jira_id> @<ber> @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario Outline: A <plan> user can access the Internet dashboard
    TBD the names of the modules
    Given user has a "<plan>" plan
      And user has the matching subscription selected in the account
      And user has the "Internet Speed Header;Billing Cycle;Services List;Help Section" modules configured in CMS for "Internet" page
     When clicks on the "no_mobile_subscriptions.internet" icon
     Then the "Internet Dashboard" page is displayed
      And the "Internet" header is displayed
      And the "internet_speed_module" module is displayed
      And the "billing_cycle_module" module is displayed
      And the "services_section_title" textfield is displayed
      And the "services_module" module is displayed
      And the "help_section_title" textfield is displayed
      And the "help_module" module is displayed

    Examples:
          | plan        | ber | jira_id      |
          | internet    |     | QANOV-492932 |
          | convergente | ber | QANOV-492933 |

  @jira.QANOV-492934 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A user can see the details of the internet speed header
    TBD the names of the modules
    Given user has a "internet" product
      And user has the matching subscription selected in the account
      And user has the "Internet Speed Header" module configured in CMS for "Internet" page
      And user is in the "Internet Dashboard" page
     Then the "internet_speed_module.title" textfield with "Internet" text is displayed
      And the "internet_speed_module.upload_speed_text" textfield with "Velocidad de subida" text is displayed
      And the "internet_speed_module.download_speed_text" textfield with "Velocidad de bajada" text is displayed
      And the "internet_speed_module.upload_speed_amount" textfield is displayed
      And the "internet_speed_module.download_speed_amount" textfield is displayed

  @jira.QANOV-492935 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: A user can access the speed test service
    TBD the names of the modules
    Given user has a "internet" product
      And user has the matching subscription selected in the account
      And user has the "Services List" module configured in CMS for "Internet" page
      And user is in the "Internet Dashboard" page
     When clicks on the "services_module.internet_speed" button
     Then the browser webview is displayed
      And the "tbd" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Internet Dashboard" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario Outline: A user can access the entrypoints in the help section from the Internet Dashboard
    TBD the names of the modules. The entrypoints are FAQs redirecting to OB WVs.
    Given user has a "internet" product
      And user has the matching subscription selected in the account
      And user has the "Help Section" module configured in CMS for "Internet" page
      And user is in the "Internet Dashboard" page
     When clicks on the "help_module.<entrypoint>" button
     Then the browser webview is displayed
      And the "<string>" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Internet Dashboard" page is displayed

    Examples:
          | entrypoint   | string | jira_id      |
          | entrypoint_1 | tbd    | QANOV-492936 |
          | entrypoint_2 | tbd    | QANOV-492937 |
          | entrypoint_3 | tbd    | QANOV-492938 |
