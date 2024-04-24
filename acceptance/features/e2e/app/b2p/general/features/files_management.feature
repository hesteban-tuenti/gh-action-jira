# -*- coding: utf-8 -*-
@jira.QABP-202
Feature: Files Management


  @jira.<jira_id> @<product> @android @e2e @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can download a file on Android devices
    Given user has installed the "Google Drive" app
      And user is in the "Download File" page
     When clicks on the "download_file" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-203 |

  @jira.<jira_id> @<product> @e2e @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can download a file on iOS devices
    Given user is in the "Download File" page
     When clicks on the "download_file" link
     Then the browser webview is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-204 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user will see the native upload page if tries to upload a file
    The "Native Upload" page could request permissions but are managed by the native app, B2P app doesn't control it.
    Given user is in the "Upload File" page
     When clicks on the "upload_file" link
     Then the "Native Upload" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-258 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can upload a file
    The "Native Upload" page could request permissions but are managed by the native app, B2P app doesn't control it.
    Given user is in the "Upload File" page
     When clicks on the "upload_file" link
      And the "Native Upload" page is displayed
      And clicks on any element in the "files_list" list
     Then the "Upload File" page is displayed
      And the "selected_file_name" textfield is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-259 |
