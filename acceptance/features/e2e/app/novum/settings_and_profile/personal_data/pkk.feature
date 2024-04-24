# -*- coding: utf-8 -*-
@jira.QANOV-596405
Feature: PKK

  Actions Before each Scenario:
    Given user has a "box7" account type
      And user has PKK availability


  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-558162 @manual @mobile @regression
  Scenario Outline: A user can see the PKK entrypoint in "Personal data" screen
    Given user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user is in the "Personal Data" page
     Then the "display_pkk_entrypoint" entrypoint with "[LANG:profile.dashboard.personal_data.display_pkk]" text is displayed
      And the "display_pkk_description" textfield with "[LANG:profile.dashboard.personal_data.display_pkk_description]" text is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-217322 | QANOV-596406 |
          | o2de    | QANOV-217323 | QANOV-596407 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-558162 @manual @mobile @regression @har
  Scenario Outline: An ordinary customer can access to the PKK entrypoint: a Second Factor Authentication screen is displayed
    Ordinary customers are:
    - postpay with single billing account
    - postpay with 1 billing account + 1 myHandy
    - prepay
    Given user is an ordinary customer
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user is in the "Personal Data" page
     When clicks on the "display_pkk_entrypoint" entrypoint
     Then the "Second Factor Authentication" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-596406 | QANOV-596409 |
          | o2de    | QANOV-596407 | QANOV-596410 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-558162 @manual @mobile @regression
  Scenario Outline: An ordinary customer cannot see the PKK if the Second Factor Authentication goes wrong
    Ordinary customers are:
    - postpay with single billing account
    - postpay with 1 billing account + 1 myHandy
    - prepay
    Given user is an ordinary customer
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Display Pkk" module configured in CMS for "Display Pkk" page
      And user is in the "Personal Data" page
     When clicks on the "display_pkk_entrypoint" entrypoint
      And the "Second Factor Authentication" page is displayed
      And the second factor authentication goes wrong
     Then the "Personal Data" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-596409 | QANOV-596411 |
          | o2de    | QANOV-596410 | QANOV-596412 |

  @jira.<jira_id> @<product> @TBD @android @e2e @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-558162 @manual @mobile @smoke
  Scenario Outline: An ordinary customer can see the PKK if the Second Factor Authentication goes fine
    The PKK is a 4-digit-number needed to authenticate yourself when you call the hotline (similar to a 2nd factor authentication). Mandatory by law.
    Ordinary customers are:
    - postpay with single billing account
    - postpay with 1 billing account + 1 myHandy
    - prepay
    Given user is an ordinary customer
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Display Pkk" module configured in CMS for "Display Pkk" page
      And user is in the "Personal Data" page
     When clicks on the "display_pkk_entrypoint" entrypoint
      And the "Second Factor Authentication" page is displayed
      And the second factor authentication goes fine
     Then the "Display Pkk" page is displayed
      And the "TBD" header is displayed
      And the "pkk_textfield" textfield with "Code PKK" text is displayed
      And the "pkk_value" textfield is displayed
      And the "back_to_personal_details" button with "Go back to personal details" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Data" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-596409 | QANOV-596413 |
          | o2de    | QANOV-596410 | QANOV-596414 |

  @jira.<jira_id> @<product> @android @e2e @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-558162 @manual @mobile @regression
  Scenario Outline: An ordinary customer can go back to the "Personal data" screen after seeing the PKK
    Ordinary customers are:
    - postpay with single billing account
    - postpay with 1 billing account + 1 myHandy
    - prepay
    Given user is an ordinary customer
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user has the "Display Pkk" module configured in CMS for "Display Pkk" page
      And user is in the "Display Pkk" page
     When clicks on the "back_to_personal_details" button
     Then the "Personal Data" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-596413 | QANOV-596416 |
          | o2de    | QANOV-596414 | QANOV-596417 |

  @jira.<jira_id> @<product> @TBD @android @e2e @ios @jira.cv.Future @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-558162 @manual @mobile @regression
  Scenario Outline: A non-ordinary customer can see an OB webview to request the PKK by letter
    The PKK is a 4-digit-number needed to authenticate yourself when you call the hotline (similar to a 2nd factor authentication). Mandatory by law.
    Non-ordinary customers are:
    - SoHo: Small office / Home office
    - SME: Small and Medium-sized Enterprises
    - customers with more than one billing account
    The webviews will be differnt for prepay, postpay and RAITT.
    Given user is a non-ordinary customer
      And user has a "<account_type>" account type
      And user has a "<stack>" account type
      And user has the "Personal Data" module configured in CMS for "Personal Data" page
      And user is in the "Personal Data" page
     When clicks on the "display_pkk_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Data" page is displayed

    Examples:
          | product | account_type | stack | header | depends_on   | jira_id      |
          | blaude  | prepay       | box7  | TBD    | QANOV-596406 | QANOV-596418 |
          | blaude  | prepay       | raitt | TBD    | QANOV-596406 | QANOV-596419 |
          | blaude  | postpay      | box7  | TBD    | QANOV-596406 | QANOV-596421 |
          | o2de    | prepay       | box7  | TBD    | QANOV-596407 | QANOV-596422 |
          | o2de    | prepay       | raitt | TBD    | QANOV-596407 | QANOV-596423 |
          | o2de    | postpay      | box7  | TBD    | QANOV-596407 | QANOV-596424 |
