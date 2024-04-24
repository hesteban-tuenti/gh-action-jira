# -*- coding: utf-8 -*-
@jira.QANOV-495472
Feature: Module Description

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile
  Scenario Outline: User can see a <module_type> module with a section description
    Section title is mandatory if there is a section description.
    Given user has a "<module_type>" module with description in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text
      And the selected explore "module" has the "description" field with "[CONTEXT:module_description]" text

    @automatic @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.3 | QANOV-438374 |
          | vivobr  | vertical cards    | 13.3 | QANOV-10377  |
          | vivobr  | rows              | 13.3 | QANOV-476278 |
          | vivobr  | highlighted cards | 14.3 | QANOV-495473 |
          | vivobr  | display cards     | 14.3 | QANOV-343785 |

    @automatic @cert0 @cert1 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 13.3 | QANOV-438375 |
          | o2uk    | vertical cards    | 13.3 | QANOV-10379  |
          | o2uk    | rows              | 13.3 | QANOV-476279 |
          | o2uk    | highlighted cards | 14.3 | QANOV-495474 |
          | o2uk    | display cards     | 14.3 | QANOV-343786 |

    @automatic @cert2 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.3 | QANOV-320590 |
          | moves   | vertical cards    | 13.3 | QANOV-10381  |
          | moves   | rows              | 13.3 | QANOV-476280 |
          | moves   | highlighted cards | 14.3 | QANOV-495475 |
          | moves   | display cards     | 14.3 | QANOV-343789 |

    @automatic @cert3 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-438376 |
          | blaude  | vertical cards    | 13.9 | QANOV-228503 |
          | blaude  | rows              | 14.3 | QANOV-476281 |
          | blaude  | highlighted cards | 14.3 | QANOV-495476 |
          | blaude  | display cards     | 14.3 | QANOV-343787 |

    @manual @regression
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards          | 14.3   | QANOV-343717 |
          | vivobr  | poster cards        | 14.8   | QANOV-442308 |
          | vivobr  | data cards advanced | 14.8   | QANOV-446184 |
          | vivobr  | naked cards         | 14.8   | QANOV-448784 |
          | vivobr  | naked small cards   | 14.8   | QANOV-448851 |
          | o2uk    | data cards          | 14.3   | QANOV-343719 |
          | o2uk    | poster cards        | 14.8   | QANOV-442310 |
          | o2uk    | naked cards         | 14.8   | QANOV-448785 |
          | o2uk    | naked small cards   | 14.8   | QANOV-448852 |
          | moves   | data cards          | 14.3   | QANOV-320584 |
          | moves   | poster cards        | 14.8   | QANOV-442311 |
          | moves   | naked cards         | 14.8   | QANOV-448786 |
          | moves   | naked small cards   | 14.8   | QANOV-448853 |
          | blaude  | data cards          | 14.3   | QANOV-343720 |
          | blaude  | poster cards        | 14.8   | QANOV-442313 |
          | blaude  | naked cards         | 14.8   | QANOV-448787 |
          | blaude  | naked small cards   | 14.8   | QANOV-448854 |
          | o2de    | featured content    | 14.2   | QANOV-438377 |
          | o2de    | vertical cards      | 14.2   | QANOV-49242  |
          | o2de    | rows                | 14.2   | QANOV-476282 |
          | o2de    | highlighted cards   | 14.3   | QANOV-495477 |
          | o2de    | display cards       | 14.3   | QANOV-343788 |
          | o2de    | data cards          | 14.3   | QANOV-343721 |
          | o2de    | poster cards        | 14.8   | QANOV-442315 |
          | o2de    | naked cards         | 14.8   | QANOV-448788 |
          | o2de    | naked small cards   | 14.8   | QANOV-448855 |
          | o2es    | featured content    | Future | QANOV-438378 |
          | o2es    | vertical cards      | Future | QANOV-407235 |
          | o2es    | rows                | Future | QANOV-476283 |
          | o2es    | highlighted cards   | Future | QANOV-495478 |
          | o2es    | display cards       | Future | QANOV-407129 |
          | o2es    | data cards          | Future | QANOV-407189 |
          | o2es    | poster cards        | Future | QANOV-442316 |
          | o2es    | naked cards         | Future | QANOV-448789 |
          | o2es    | naked small cards   | Future | QANOV-448856 |
