# -*- coding: utf-8 -*-
@jira.QANOV-257613
Feature: Order tracking module

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has the "order-tracking" module configured in CMS for "start" page


  @jira.<jira_id> @<ber> @android @blaude @ios @jira.cv.14.0 @automatic @mobile @<test_priority>
  @jira.link.detects.OBO2DE-457 @jira.link.detects.LOC-1068 @live @next @qa @webapp
  Scenario Outline: A postpay user with <num_orders> active orders will see the "order tracking" module in the start tab
    If an order has been processed, the module appears in the Start tab for a week, after which it'll disappear.
    Given user has "<num_orders>" orders on track
      And user is in the "Start" page
      And waits until the "order_tracking" element is visible
     Then the "order_tracking" module is displayed
      And the "order_tracking.title" textfield with "BESTELLUNG VERFOLGEN" text is displayed
      And the "order_tracking.carousel" list is displayed
      And each element in the "order_tracking.carousel" list has the "icon" field
      And each element in the "order_tracking.carousel" list has the "label" field
      And each element in the "order_tracking.carousel" list has the "title" field
      And each element in the "order_tracking.carousel" list has the "subtitle" field
      And each element in the "order_tracking.carousel" list has the "chevron" field

    Examples:
          | num_orders | test_priority | ber | jira_id      |
          | 1          | smoke         |     | QANOV-257614 |

    @raitt_drop3
    Examples:
          | num_orders | test_priority | ber | jira_id      |
          | several    | sanity        | ber | QANOV-257615 |

  @jira.QANOV-257616 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257615 @automatic @mobile
  @regression @live @next @qa @webapp
  Scenario: A postpay user with several active orders can swipe the order tracking carousel
    Given user has "several" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "order_tracking.carousel" list can be swiped

  @jira.QANOV-257617 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257614
  @jira.link.depends_on.QANOV-257615 @automatic @mobile @regression @live @next @qa
  Scenario: A postpay user with active orders taps on an order card: the user is redirected to the Order Details screen
    Given user has ">0" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on any element in the "order_tracking.carousel" list
     Then the "Order Details" page is displayed
      And the "Meine Bestellungen" header is displayed

  @jira.QANOV-257618 @android @blaude @ios @jira.cv.14.0 @automatic @mobile @regression
  @jira.link.detects.OBO2DE-459 @live @next @qa @webapp
  Scenario: A postpay user without active orders won't see the "order tracking" module in the start tab
    If an order has been processed, the module appears in the Start tab for a week, after which it'll disappear.
    Given user has "0" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     Then the "order_tracking" module is not displayed

  @jira.QANOV-257619 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-257614
  @jira.link.depends_on.QANOV-257615 @manual @mobile @regression
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
