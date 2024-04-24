# -*- coding: utf-8 -*-
@jira.QANOV-310052
Feature: Support network

  Actions Before each Scenario:
    Given user has all products in "active" status

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.14.8 @jira.link.depends_on.<depends_on> @mobile
  @sanity @har
  Scenario Outline: User can access to the "<service>" service
    The screens will be provided by the SpatialBuzz SDK.
    Given user has "granted" "location" permissions
      And user is in the "Support" page
     When clicks on the "network_<service_entrypoint>" entrypoint
     Then the "Spatial Buzz" page is displayed
      And the "header" textfield with "<service_header>" text is displayed
      And clicks on the "close_button" button
      And the "Support" page is displayed

    @raitt_drop1 @manual
    Examples:
          | product | service              | service_entrypoint | service_header | depends_on                                          | jira_id      |
          | blaude  | Live check           | live_check         | Live-Check     | QANOV-308719:QANOV-308720:QANOV-308721:QANOV-308722 | QANOV-310053 |
          | blaude  | Network coverage map | network_coverage   | Netzkarte      | QANOV-308719:QANOV-308720:QANOV-308721:QANOV-308722 | QANOV-310054 |

    @automatic @live @next
    Examples:
          | product | service              | service_entrypoint | service_header | depends_on                                                       | jira_id      |
          | o2de    | Live check           | live_check         | Live-Check     | QANOV-308723:QANOV-308724:QANOV-308725:QANOV-308726:QANOV-308727 | QANOV-310056 |
          | o2de    | Network coverage map | coverage           | Netzkarte      | QANOV-308723:QANOV-308724:QANOV-308725:QANOV-308726:QANOV-308727 | QANOV-310057 |

  @jira.<jira_id> @<product> @ber @ios @jira.cv.14.8 @jira.link.depends_on.<depends_on> @mobile @sanity @har
  Scenario Outline: User can access to the "Speed check" service on iOS devices
    The screens will be provided by the SpatialBuzz SDK.
    Given user has "granted" "location" permissions
      And user is in the "Support" page
     When clicks on the "network_speed_check" entrypoint
     Then the "Spatial Buzz" page is displayed
      And the "header" textfield with "Speed-Check" text is displayed
      And clicks on the "close_button" button
      And the "Support" page is displayed

    @raitt_drop1 @manual
    Examples:
          | product | depends_on                                          | jira_id      |
          | blaude  | QANOV-308719:QANOV-308720:QANOV-308721:QANOV-308722 | QANOV-310055 |

    @automatic @live @next
    Examples:
          | product | depends_on                                                       | jira_id      |
          | o2de    | QANOV-308723:QANOV-308724:QANOV-308725:QANOV-308726:QANOV-308727 | QANOV-310058 |

  @jira.<jira_id> @<product> @android @ber @jira.cv.14.8 @jira.link.depends_on.<depends_on> @mobile @sanity @har
  Scenario Outline: User can access to the "Speed check" service on Android devices
    The screens will be provided by the SpatialBuzz SDK.
    Given user has "granted" "location" permissions
      And user has "granted" "calls" permissions
      And user is in the "Support" page
     When clicks on the "network_speed_check" entrypoint
     Then the "Spatial Buzz" page is displayed
      And the "header" textfield with "Speed-Check" text is displayed
      And clicks on the "close_button" button
      And the "Support" page is displayed

    @raitt_drop1 @manual
    Examples:
          | product | depends_on                                          | jira_id      |
          | blaude  | QANOV-308719:QANOV-308720:QANOV-308721:QANOV-308722 | QANOV-355370 |

    @automatic @live @next
    Examples:
          | product | depends_on                                                       | jira_id      |
          | o2de    | QANOV-308723:QANOV-308724:QANOV-308725:QANOV-308726:QANOV-308727 | QANOV-355371 |
