# -*- coding: utf-8 -*-
@jira.QANOV-600411
Feature: Module loading error management


  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @smoke
  Scenario Outline: User accesses for the first time to the app with the modules content successfully loaded
    Given logs in the application for first time
      And there are no OB API errors
      And user is in the "Account" page
     Then no module with error is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600412 |
          | o2de    | QANOV-600413 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: User accesses for the first time to the app with errors in the OB APIs
    There are modules that can't display errors, in that case those modules are hidden
    Given logs in the application for first time
      And user is in the "Account" page
      And there are OB API errors
     Then the modules with error are displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600414 |
          | o2de    | QANOV-600415 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: User accesses to the app with the CMS configured to display errors when the modules load fails
    To be executed in QA if the required configured page doesn't exist in CMS.
    Given the "dashboard" page is configured in CMS to display errors
      And user is in the "Account" page
      And there are OB API errors
     Then the modules with error are displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600416 |
          | o2de    | QANOV-600417 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: User accesses to the app with the CMS configured to display cached content when the modules load fails
    The modules that can't cache content are hidden.
    To be executed in QA if the required configured page doesn't exist in CMS.
    Given the "dashboard" page is configured in CMS to display cached content
      And modules content has been cached previously
      And user is in the "Account" page
      And there are OB API errors
     Then the modules with cached content are displayed
      And the "cached_data_datetime_alert" module is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600418 |
          | o2de    | QANOV-600419 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @smoke
  Scenario Outline: User accesses to the app with the CMS configured to display cached content with the date and time of cached data alert
    The modules that can't cache content are hidden.
    There may be different dates with different update dates, the general alert will show the most old date we have.
    To be executed in QA if the required configured page doesn't exist in CMS.
    Given the "dashboard" page is configured in CMS to display cached content
      And the "dashboard" page is configured in CMS to display the date and time of cached data
      And modules content has been cached previously
      And user is in the "Account" page
      And there are OB API errors
     Then the modules with cached content are displayed
      And the "cached_data_datetime_alert" module is displayed
      And the "cached_data_datetime_alert.icon" is displayed
      And the "cached_data_datetime_alert.description" textfield with the "This information was last updated on \d{2}.\d{2}.\d{2} at \d{2}:\d{2}" format is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600420 |
          | o2de    | QANOV-600421 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: User pulls to refresh when the alert with date and time of cached data is displayed
    To be executed in QA if the required configured page doesn't exist in CMS.
    Given the "dashboard" page is configured in CMS to display cached content
      And the "dashboard" page is configured in CMS to display the date and time of cached data
      And modules content has been cached previously
      And user is in the "Account" page
      And there are OB API errors
      And the "cached_data_datetime_alert" module is displayed
     When pulls down the page to refresh
      And the "Account" page is displayed
     Then the "cached_data_datetime_alert" module is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600422 |
          | o2de    | QANOV-600423 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: Alerts are not displayed when there is an OB API error
    To be executed in QA if the required configured page doesn't exist in CMS.
    Given the "dashboard" page is configured in CMS to display cached content
      And the "alerts" module is configured in CMS for "dashboard" page
      And there are OB API errors that affects the alerts contents
      And user is in the "Account" page
     Then the "alert" module is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600424 |
          | o2de    | QANOV-600425 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: Header notifications are not displayed when there is an OB API error
    To be executed in QA if the required configured page doesn't exist in CMS.
    Given the "start" page is configured in CMS to display cached content
      And the "header-cards" module is configured in CMS for "start" page
      And there are OB API errors that affects the headers notification content
      And user is in the "Start" page
     Then the "start_tab_headers_module" module is not displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-600426 |
          | o2de    | QANOV-600427 |
