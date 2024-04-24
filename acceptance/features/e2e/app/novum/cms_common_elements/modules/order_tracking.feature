# -*- coding: utf-8 -*-
@jira.QANOV-400709
Feature: Order Tracking


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.order_tracking
  Scenario Outline: A user can see a Order tracking module configured with the default fields
    To be executed in QA
    Given the "Order tracking" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has ">0" orders on track
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "order_tracking" element is visible
     Then the "order_tracking" module is displayed
      And the "order_tracking.title" textfield is not displayed
      And the "order_tracking.carousel" carousel is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-389768 |
          | o2de    | QANOV-554849 |

  @jira.QANOV-389769 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.order_tracking
  Scenario: A user can see a Order tracking module configured with the default fields
    To be executed in QA
    Given the "Order tracking" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has ">0" orders on track
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "order_tracking" element is visible
     Then the "order_tracking" module is displayed
      And the "order_tracking.title" textfield is displayed
      And the "order_tracking.carousel" carousel is displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.order_tracking_with_title
  Scenario Outline: A user can see a Order tracking module configured with title
    To be executed in QA
    Given the "Order tracking" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has ">0" orders on track
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "order_tracking" element is visible
     Then the "order_tracking" module is displayed
      And the "order_tracking.title" textfield with "TEST TITLE" text is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-389770 |
          | o2de    | QANOV-554850 |

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.5 @mobile @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.order_tracking_with_maximum_orders_2
  Scenario Outline: A user can see a Order tracking module configured with a maximum number of orders to show
    To be executed in QA
    Given the "Order tracking" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has ">2" orders on track
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "order_tracking" element is visible
     Then the "order_tracking" module is displayed
      And the length of the "order_tracking.carousel" list is "2"

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-389771 |
          | moves   | QANOV-389772 |
          | o2de    | QANOV-554851 |
