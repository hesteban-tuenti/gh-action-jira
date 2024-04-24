# -*- coding: utf-8 -*-
@jira.QANOV-10261
Feature: Deeplinks from Explore

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-175692 @manual @mobile @regression
  Scenario Outline: Multiline user with only one line of the card's account type can access to the account flow for that line
    Given user has "several" mobile lines or plans
      And user has an Explore card with content associated to "one" lines
     When clicks on the Explore card
     Then the Explore card is opened

    Examples:
          | cv     | product | parent_test_plan | jira_id      |
          | 13.3   | vivobr  | QANOV-21791      | QANOV-25208  |
          | 13.3   | o2uk    |                  | QANOV-25209  |
          | 13.3   | moves   |                  | QANOV-10652  |
          | 13.9   | blaude  |                  | QANOV-228165 |
          | 14.2   | o2de    |                  | QANOV-49181  |
          | Future | o2es    |                  | QANOV-407267 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-175702 @manual @mobile @smoke
  Scenario Outline: Multiline <product> user with more than one line of the card's account type can access to the line desambiguation screen
    internal_checkpoint="Card with content for several lines: e.g User with 2 prepay accounts and a card with a topup link"
    Given user has "several" mobile lines or plans
      And user has an Explore card with content associated to "several" lines
     When clicks on the Explore card
     Then the "Disambiguation" page is displayed
      And the "disambiguation_lines.list" list is displayed
      And each element in the "disambiguation_lines" list has the "line_number_or_name" field
      And each element in the "disambiguation_lines" list has the "product" field
      And each element in the "disambiguation_lines" list has the "costumer" field

    Examples:
          | cv     | product | parent_test_plan | jira_id      |
          | 13.3   | vivobr  | QANOV-21791      | QANOV-25210  |
          | 13.3   | o2uk    |                  | QANOV-25211  |
          | 13.9   | blaude  |                  | QANOV-228166 |
          | 14.2   | o2de    |                  | QANOV-49182  |
          | Future | o2es    |                  | QANOV-407268 |

  @jira.QANOV-10660 @android @automation.hard @ios @jira.cv.13.3 @jira.link.relates_to.NOV-175702 @manual @mobile @moves
  @smoke
  Scenario: Multiline moves user with more than one line of the card's account type can access to the line desambiguation screen
    Can be tested in CERT2 with card:
    https://commstoolcms-cert2-es.mytelco.io/next/explore/cards/management?moduleId=40621&moduleType=featuredContent&cardId=131698&step=0
    User FIC69823
    Given user has "several" mobile lines or plans
      And user has an Explore card with content associated to "several" lines
     When clicks on the Explore card
     Then the "Disambiguation" page is displayed
      And the "disambiguation_lines" list is displayed
      And each element in the "disambiguation_lines" list has the "line_number_or_name" field
      And each element in the "disambiguation_lines" list has the "plan_name" field
      And clicks on the "navigation_top_bar.back_button" button
      And the "Explore" page is displayed

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-175704 @manual @mobile @regression
  Scenario Outline: Multiline user with more than one line of the card's account type can select a line on the disambiguation screen
    Given user has "several" mobile lines or plans
      And user has an Explore card with content associated to "several" lines
      And user is in the "Disambiguation" page
     When clicks on any element in the "disambiguation_lines" list
     Then the deeplink configured in card is opened

    Examples:
          | cv     | product | depends_on   | parent_test_plan | jira_id      |
          | 13.3   | vivobr  | QANOV-25210  | QANOV-21791      | QANOV-25214  |
          | 13.3   | o2uk    | QANOV-25211  |                  | QANOV-25215  |
          | 13.3   | moves   | QANOV-10660  |                  | QANOV-10675  |
          | 13.9   | blaude  | QANOV-228166 |                  | QANOV-228167 |
          | 14.2   | o2de    | QANOV-49182  |                  | QANOV-49184  |
          | Future | o2es    |              |                  | QANOV-407269 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-176232 @mobile @regression
  Scenario Outline: A user can open an app deeplink from a card
    The scenario uses a card with a specific deeplink just for automation purpouses, but any deeplink is valid
    Given user has a card with the "<deeplink>" deeplink
     When searches the card
      And opens the card with the deeplink
     Then the "<deeplink_page>" page is displayed

    @live @manual @next
    Examples:
          | product | cv   | deeplink              | deeplink_page | jira_id     |
          | vivobr  | 13.3 | Account.Vivo Valoriza | Vivo Valoriza | QANOV-10767 |

    @cert0 @cert1 @live @manual @next
    Examples:
          | product | cv   | deeplink             | deeplink_page | jira_id     |
          | o2uk    | 13.3 | Account.Main Account | Account       | QANOV-10776 |

    @cert2 @live @manual @next
    Examples:
          | product | cv   | deeplink      | deeplink_page    | jira_id     |
          | moves   | 13.3 | Explore.Likes | Explore Category | QANOV-10790 |

    @manual
    Examples:
          | product | cv     | deeplink             | deeplink_page | jira_id      |
          | blaude  | 13.9   | Account.Main Account | Account       | QANOV-228168 |
          | o2de    | 14.2   | Account.Main Account | Account       | QANOV-49189  |
          | o2es    | Future | Account.Main Account | Account       | QANOV-407270 |

  @jira.<jira_id> @<exec_mode> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.parent_test_plan.QANOV-21737 @mobile @smoke @vivobr
  Scenario Outline: A user can access to the Vivo Valoriza tab through an Explore card
    To test in prod. This card is configured in prod by the OB
    Given user has a "<account_type>" account type
      And user has a valoriza card
     When searches the card
      And opens the valoriza card
     Then the "Vivo Valoriza" page is displayed
      And the "Vivo Valoriza" header is displayed

    @impeded_legacy
    Examples:
          | account_type   | parent_test_plan | exec_mode      | cv   | jira_id      |
          | legacy control |                  | no_automatable | 12.1 | QANOV-21747  |
          | legacy postpay |                  | no_automatable | 12.1 | QANOV-21748  |
          | jeri postpay   | QANOV-226748     | no_automatable | 13.6 | QANOV-228852 |

    @live @next
    Examples:
          | account_type | parent_test_plan | exec_mode | cv   | jira_id     |
          | beatrix      |                  | manual    | 12.1 | QANOV-21749 |
          | multivivo    |                  | manual    | 12.1 | QANOV-21751 |
          | convergente  | QANOV-21791      | manual    | 12.1 | QANOV-21750 |
