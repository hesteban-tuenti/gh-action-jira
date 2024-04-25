# -*- coding: utf-8 -*-
@jira.QANOV-2026
Feature: Help topics


  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.<detects> @mobile @smoke
  Scenario Outline: User can access to "All FAQs" screen
    Just for BLAU: We will have different URLs for different environments
    - E2E2 --> https://e2e2-www.blau.de/service/b2c_app_faq.html
    - TLRT --> https://tlrt-www.blau.de/service/b2c_app_faq.html
    - PLRT = LRT Env --> https://crt.blau.de/service/b2c_app_faq.html
    - PROD --> https://www.blau.de/service/b2c_app_faq.html
    For MeinO2:
    - Current legacy webview.
    Given user is in the "Support" page
     When clicks on the "faq_see_all_faqs" entrypoint
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

    @automatic @live @next @raitt_drop1
    Examples:
          | product | cv   | header | depends_on                             | detects    | jira_id      |
          | blaude  | 13.9 | FAQ    | QANOV-240364:QANOV-240365:QANOV-240366 | OBO2DE-456 | QANOV-228471 |

    @automatic @live @next
    Examples:
          | product | cv   | header | depends_on                                                       | detects             | jira_id      |
          | o2de    | 14.2 | FAQs   | QANOV-308723:QANOV-308724:QANOV-308725:QANOV-308726:QANOV-308727 | O2DE-2891:O2DE-3083 | QANOV-228472 |
