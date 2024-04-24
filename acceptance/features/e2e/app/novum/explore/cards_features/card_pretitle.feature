# -*- coding: utf-8 -*-
@jira.QANOV-509674
Feature: Card Pretitle

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile
  Scenario Outline: User can see a the pretitle in a card within a "<module_type> " module
    Given user has a card with a pretitle in a "<module_type>" Explore module
     When searches the "card"
     Then the selected explore "card" has the "pretitle" field with "[CONTEXT:card_pretitle]" text

    @automatic @live @next @qa @smoke @webapp
    Examples:
          | product | module_type      | cv   | jira_id      |
          | vivobr  | featured content | 13.3 | QANOV-438379 |
          | vivobr  | vertical cards   | 13.3 | QANOV-438387 |
          | vivobr  | rows             | 13.3 | QANOV-440787 |
          | vivobr  | display cards    | 14.3 | QANOV-500532 |

    @automatic @cert0 @cert1 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type      | cv   | jira_id      |
          | o2uk    | featured content | 13.3 | QANOV-438380 |
          | o2uk    | vertical cards   | 13.3 | QANOV-438388 |
          | o2uk    | rows             | 13.3 | QANOV-440788 |
          | o2uk    | display cards    | 14.3 | QANOV-500533 |

    @automatic @cert2 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type      | cv   | jira_id      |
          | moves   | featured content | 13.3 | QANOV-297867 |
          | moves   | vertical cards   | 13.3 | QANOV-438389 |
          | moves   | rows             | 13.3 | QANOV-440789 |
          | moves   | display cards    | 14.3 | QANOV-500534 |

    @automatic @cert3 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type      | cv   | jira_id      |
          | blaude  | featured content | 13.9 | QANOV-438381 |
          | blaude  | vertical cards   | 13.9 | QANOV-438390 |
          | blaude  | rows             | 14.3 | QANOV-440790 |
          | blaude  | display cards    | 14.3 | QANOV-500535 |

    @manual @regression
    Examples:
          | product | module_type      | cv     | jira_id      |
          | vivobr  | banner hero      | 14.3   | QANOV-343655 |
          | vivobr  | poster cards     | 14.8   | QANOV-442323 |
          | vivobr  | naked cards      | 14.8   | QANOV-448796 |
          | o2uk    | banner hero      | 14.3   | QANOV-343656 |
          | o2uk    | poster cards     | 14.8   | QANOV-442324 |
          | o2uk    | naked cards      | 14.8   | QANOV-448797 |
          | moves   | banner hero      | 14.3   | QANOV-297831 |
          | moves   | poster cards     | 14.8   | QANOV-442325 |
          | moves   | naked cards      | 14.8   | QANOV-448798 |
          | blaude  | banner hero      | 14.3   | QANOV-343657 |
          | blaude  | poster cards     | 14.8   | QANOV-442326 |
          | blaude  | naked cards      | 14.8   | QANOV-448799 |
          | o2de    | featured content | 14.2   | QANOV-438382 |
          | o2de    | vertical cards   | 14.2   | QANOV-438391 |
          | o2de    | rows             | 14.2   | QANOV-440791 |
          | o2de    | display cards    | 14.3   | QANOV-500536 |
          | o2de    | banner hero      | 14.3   | QANOV-343658 |
          | o2de    | poster cards     | 14.8   | QANOV-442327 |
          | o2de    | naked cards      | 14.8   | QANOV-448800 |
          | o2es    | featured content | Future | QANOV-438383 |
          | o2es    | vertical cards   | Future | QANOV-438392 |
          | o2es    | rows             | Future | QANOV-440792 |
          | o2es    | display cards    | Future | QANOV-500537 |
          | o2es    | banner hero      | Future | QANOV-407146 |
          | o2es    | poster cards     | Future | QANOV-442328 |
          | o2es    | naked cards      | Future | QANOV-448801 |
