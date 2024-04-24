# -*- coding: utf-8 -*-
@jira.QANOV-10518
Feature: Explore: Single Sign On


  @jira.<jira_id> @<product> @android @ios @jira.cv.13.3 @jira.link.detects.<detects>
  @jira.link.parent_test_plan.<test_plan> @jira.link.relates_to.NOV-163360 @manual @mobile @smoke
  Scenario Outline: A user can access to an authenticated webview from the Explore tab
    The user will be authenticated in the target URL. This cards should be in PROD but can be tested in DEV/CERT
    envs if you configure the proper link.
    For o2uk you can use the add_more_extras/manage_your_extras cards
    For moves any of cards in the Vertical cards module within the Móviles category
    Given user is in the "Explore" page
      And user has a "<account_type>" account type
      And has a "any" module with card having an url of an authenticated webview in the Explore content
     When opens the card
     Then the Explore card is opened
      And the webview is authenticathed

    Examples:
          | product | account_type   | card               | header            | test_plan   | detects      | jira_id     |
          | o2uk    | legacy postpay | add_more_extras    | O2 \| My device   | QANOV-24141 |              | QANOV-10520 |
          | o2uk    | legacy postpay | manage_your_extras | O2 \| My device   | QANOV-24141 |              | QANOV-10522 |
          | o2uk    | AO2 postpay    | add_more_extras    | Your Extras       | QANOV-24140 |              | QANOV-97822 |
          | o2uk    | AO2 postpay    | manage_your_extras | Your Extras       | QANOV-24140 |              | QANOV-97823 |
          | moves   | any            | device_shop        | Tienda terminales |             | NOVUMCC-4439 | QANOV-10524 |
