# -*- coding: utf-8 -*-
@jira.QANOV-192997
Feature: Topup with third party

  Actions Before each Scenario:
    Given user has a "prepay" account type
      And user has a "mobile_line" product in "active" status


  @jira.QANOV-192998 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-184194 @jira.link.depends_on.QANOV-47881
  @jira.link.depends_on.QANOV-47882 @manual @mobile @o2de @smoke
  Scenario: Prepay user can access to the "Topup with third party providers" screen
    Given user has the "Topup Method" module configured in CMS for "Topup" page
      And user is in the "Topup" page
     When clicks on the "topup_options.third_party_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "Aufladebetrag auswählen - Alphacomm Prepaid Services B.V." header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Topup" page is displayed
