# -*- coding: utf-8 -*-
@jira.QANOV-27010
Feature: In-App CMS E2E


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-187126 @manual @mobile @regression
  @har
  Scenario Outline: A user can see an In-app Message preview in the app
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
    Given user is in the "Developer Settings" page
     When clicks on the "in_app_messages_entrypoint" element
      And clicks on the "show_preview_entrypoint" element
      And the "Enter Preview ID" popup is displayed
      And fills the "preview_id" inputtext with the "[CONF:in_app.onboarding_in_app_id]" text
      And clicks on the "show_button" element
     Then the "In App Message" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 11.6   | QANOV-27011  |
          | moves   | 11.6   | QANOV-27012  |
          | o2uk    | 11.6   | QANOV-27013  |
          | blaude  | 13.9   | QANOV-258431 |
          | o2de    | 14.2   | QANOV-258432 |
          | o2es    | Future | QANOV-416971 |
