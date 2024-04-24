# -*- coding: utf-8 -*-
@jira.QANOV-531445
Feature: Card Description

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @mobile
  @regression
  Scenario Outline: User can see a description in a <module> card
    Given user has a card with a description on a "<module>" Explore module
     When searches the "card"
     Then the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text

    @automatic @live @next @qa @webapp
    Examples:
          | product | module            | cv   | parent_test_plan | jira_id      |
          | vivobr  | featured content  | 14.3 |                  | QANOV-531446 |
          | vivobr  | vertical cards    | 14.8 |                  | QANOV-531447 |
          | vivobr  | rows              | 14.3 |                  | QANOV-440793 |
          | vivobr  | display cards     | 14.3 |                  | QANOV-343812 |
          | vivobr  | highlighted cards | 14.3 | QANOV-285803     | QANOV-531448 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | module            | cv   | parent_test_plan | jira_id      |
          | o2uk    | featured content  | 14.3 |                  | QANOV-531449 |
          | o2uk    | vertical cards    | 14.8 |                  | QANOV-531450 |
          | o2uk    | rows              | 14.3 |                  | QANOV-440794 |
          | o2uk    | display cards     | 14.3 |                  | QANOV-343813 |
          | o2uk    | highlighted cards | 14.3 | QANOV-285803     | QANOV-531451 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | module            | cv   | parent_test_plan | jira_id      |
          | moves   | featured content  | 14.3 |                  | QANOV-531452 |
          | moves   | vertical cards    | 14.8 |                  | QANOV-531453 |
          | moves   | rows              | 14.3 |                  | QANOV-320588 |
          | moves   | display cards     | 14.3 |                  | QANOV-343816 |
          | moves   | highlighted cards | 14.3 | QANOV-285803     | QANOV-531454 |

    @automatic @cert3 @live @next @qa @webapp
    Examples:
          | product | module            | cv   | parent_test_plan | jira_id      |
          | blaude  | featured content  | 14.3 |                  | QANOV-531455 |
          | blaude  | vertical cards    | 14.8 |                  | QANOV-531456 |
          | blaude  | rows              | 14.3 |                  | QANOV-440795 |
          | blaude  | display cards     | 14.3 |                  | QANOV-343814 |
          | blaude  | highlighted cards | 14.3 | QANOV-285803     | QANOV-531457 |

    @manual
    Examples:
          | product | module            | cv     | parent_test_plan | jira_id      |
          | vivobr  | banner hero       | 14.3   |                  | QANOV-343659 |
          | vivobr  | data cards        | 14.3   |                  | QANOV-343735 |
          | vivobr  | naked cards       | 14.8   | QANOV-433646     | QANOV-448814 |
          | vivobr  | naked small cards | 14.8   | QANOV-433646     | QANOV-448869 |
          | vivobr  | poster cards      | 14.8   | QANOV-433646     | QANOV-531458 |
          | o2uk    | banner hero       | 14.3   |                  | QANOV-343660 |
          | o2uk    | data cards        | 14.3   |                  | QANOV-343736 |
          | o2uk    | naked cards       | 14.8   | QANOV-433646     | QANOV-448815 |
          | o2uk    | naked small cards | 14.8   | QANOV-433646     | QANOV-448870 |
          | o2uk    | poster cards      | 14.8   | QANOV-433646     | QANOV-531459 |
          | moves   | banner hero       | 14.3   |                  | QANOV-297832 |
          | moves   | data cards        | 14.3   |                  | QANOV-298443 |
          | moves   | naked cards       | 14.8   | QANOV-433646     | QANOV-448816 |
          | moves   | naked small cards | 14.8   | QANOV-433646     | QANOV-448871 |
          | moves   | poster cards      | 14.8   | QANOV-433646     | QANOV-531460 |
          | blaude  | banner hero       | 14.3   |                  | QANOV-343661 |
          | blaude  | data cards        | 14.3   |                  | QANOV-343737 |
          | blaude  | naked cards       | 14.8   | QANOV-433646     | QANOV-448817 |
          | blaude  | naked small cards | 14.8   | QANOV-433646     | QANOV-448872 |
          | blaude  | poster cards      | 14.8   | QANOV-433646     | QANOV-531461 |
          | o2de    | featured content  | 14.3   |                  | QANOV-531462 |
          | o2de    | vertical cards    | 14.8   |                  | QANOV-531463 |
          | o2de    | banner hero       | 14.3   |                  | QANOV-343662 |
          | o2de    | data cards        | 14.3   |                  | QANOV-343739 |
          | o2de    | display cards     | 14.3   |                  | QANOV-343815 |
          | o2de    | rows              | 14.3   |                  | QANOV-440796 |
          | o2de    | highlighted cards | 14.3   | QANOV-285803     | QANOV-531464 |
          | o2de    | naked cards       | 14.8   | QANOV-433646     | QANOV-448818 |
          | o2de    | naked small cards | 14.8   | QANOV-433646     | QANOV-448873 |
          | o2de    | poster cards      | 14.8   | QANOV-433646     | QANOV-531465 |
          | o2es    | featured content  | Future |                  | QANOV-531466 |
          | o2es    | vertical cards    | Future |                  | QANOV-531467 |
          | o2es    | banner hero       | Future |                  | QANOV-407147 |
          | o2es    | data cards        | Future |                  | QANOV-407193 |
          | o2es    | display cards     | Future |                  | QANOV-407134 |
          | o2es    | rows              | Future |                  | QANOV-440797 |
          | o2es    | highlighted cards | Future | QANOV-285803     | QANOV-531468 |
          | o2es    | naked cards       | Future | QANOV-433646     | QANOV-448819 |
          | o2es    | naked small cards | Future | QANOV-433646     | QANOV-448874 |
          | o2es    | poster cards      | Future | QANOV-433646     | QANOV-531469 |

  @jira.<jira_id> @<priority> @android @ios @jira.cv.14.8 @jira.link.parent_test_plan.QANOV-433646 @manual @mobile @vivobr
  Scenario Outline: User can see the description in a Data cards advanced card with "<slot_type>" slot
    Given user has a "data cards advanced" card with "<slot_type>" and "description" in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "description" field with "[CONTEXT:card_desc]" text

    Examples:
          | slot_type   | priority   | jira_id      |
          | none        | regression | QANOV-442219 |
          | highlighted | regression | QANOV-442220 |
          | stacking    | smoke      | QANOV-442221 |
