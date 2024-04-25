# -*- coding: utf-8 -*-
@jira.QANOV-8268
Feature: Terms & Conditions


  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.10.3 @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-47314 @mobile @regression
  Scenario Outline: <product> user can access to the internal webview after accessing the <term_text> link inside the Terms and conditions
    Given user is in the "Terms And Conditions Settings" page
      And the internal webview is displayed
     When clicks on the "webview" element with "<term_text>" text
     Then the internal webview with "<header_name>" header is displayed
      And clicks on the "<button>" button
      And the "<page>" page is displayed

    @cert0 @cert1 @live @next
    Examples:
          | product | term_text                                                                 | header_name                                                                                                                                                | button                          | page                          | depends_on | jira_id    |
          | o2uk    | https://www.o2.co.uk/contactus                                            | Contact Us \| Help, Support and Useful Numbers \| O2                                                                                                       | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8275 |
          | o2uk    | https://www.o2.co.uk/apps/myo2                                            | My O2 App \| Available on iOS, Android and Windows \| O2                                                                                                   | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8276 |
          | o2uk    | www.o2.co.uk/termsandconditions/privacy-policy                            | O2 \| Terms and Conditions \| Privacy Policy                                                                                                               | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8278 |
          | o2uk    | https://www.o2.co.uk/termsandconditions                                   | Terms & conditions \| O2                                                                                                                                   | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8279 |
          | o2uk    | https://www.competitionagency.com                                         | Prize Promotion Agency for Competitions and Prize Draws \| Competition PR, Marketing, Design, Legal, Compliance, Prize fulfilment - The Competition Agency | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8280 |
          | o2uk    | https://www.o2.co.uk/termsandconditions/other-products-and-services/my-o2 | O2 \| My O2 Terms and Conditions                                                                                                                           | navigation_top_bar.close_button | Terms And Conditions Settings | QANOV-8271 | QANOV-8281 |
