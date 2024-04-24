# -*- coding: utf-8 -*-
@jira.QANOV-312740
Feature: Order tracking module

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has the "order-tracking" module configured in CMS for "start" page


  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile
  @o2de @<ber>
  Scenario Outline: A postpay user with <num_orders> active orders will see the "order tracking" module in the start tab
    If an order has been processed, the module appears in the Start tab for a week, after which it'll disappear.
    Given user has "<num_orders>" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "order_tracking" module is displayed
      And the "order_tracking.title" textfield with "BESTELLUNG VERFOLGEN" text is displayed
      And the "order_tracking.carousel" carousel is displayed
      And each element in the "order_tracking.carousel" list has the "order_icon" field
      And each element in the "order_tracking.carousel" list has the "order_status_tag" field
      And each element in the "order_tracking.carousel" list has the "order_name" field
      And each element in the "order_tracking.carousel" list has the "order_purchase_date" field
      And each element in the "order_tracking.carousel" list has the "order_chevron" field

    Examples:
          | num_orders | ber | test_priority | jira_id      |
          | 1          |     | smoke         | QANOV-312741 |
          | several    | ber | sanity        | QANOV-312742 |

  @jira.QANOV-312743 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312742 @manual @mobile @o2de @regression
  Scenario: A postpay user with several active orders can swipe the order tracking carousel
    Given user has "several" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "order_tracking.carousel" list can be swiped

  @jira.QANOV-312792 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312741 @jira.link.depends_on.QANOV-312742
  @manual @mobile @o2de @regression @jira.link.detects.O2DE-2929
  Scenario: A postpay user with active orders taps on an order card: the user is redirected to the Order Details screen
    Given user has ">0" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on any element in the "order_tracking.carousel" list
     Then the "Order Details" page is displayed
      And the "Meine Bestellungen" header is displayed

  @jira.QANOV-312793 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: A postpay user without active orders won't see the "order tracking" module in the start tab
    If an order has been processed, the module appears in the Start tab for a week, after which it'll disappear.
    Given user has "0" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "order_tracking" module is not displayed

  @jira.QANOV-312794 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-312741 @jira.link.depends_on.QANOV-312742
  @manual @mobile @o2de @regression
  Scenario: A postpay user with active orders will see an error if the "order tracking" module couldn't be loaded in the start tab
    Given user has ">0" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When there is an error loading the order tracking module
     Then the "order_tracking" module is displayed
      And the "order_tracking.title" textfield with "BESTELLUNGEN" text is displayed
      And the "order_tracking.error_title" textfield with "Something went wrong" text is displayed
      And the "order_tracking.error_subtitle" textfield with "We couldn't load the content" text is displayed
      And the "order_tracking.error_button" button with "Retry" text is displayed
