# -*- coding: utf-8 -*-
@jira.QANOV-417417
Feature: Title link

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<ber> @<product> @android @ios @jira.cv.<cv> @mobile
  Scenario Outline: A title link can be shown in a <module_type> module
    Given user has a "<module_type>" module with a "title" link in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title_link" field displayed

    @automatic @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | ber | cv   | jira_id      |
          | vivobr  | featured content  | ber | 13.3 | QANOV-38865  |
          | vivobr  | vertical cards    |     | 13.3 | QANOV-10383  |
          | vivobr  | rows              |     | 13.3 | QANOV-9967   |
          | vivobr  | highlighted cards |     | 14.3 | QANOV-285894 |
          | vivobr  | display cards     |     | 14.3 | QANOV-343778 |

    @automatic @cert0 @cert1 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | ber | cv   | jira_id      |
          | o2uk    | featured content  | ber | 13.3 | QANOV-38866  |
          | o2uk    | vertical cards    |     | 13.3 | QANOV-10385  |
          | o2uk    | rows              |     | 13.3 | QANOV-9969   |
          | o2uk    | highlighted cards |     | 14.3 | QANOV-285895 |
          | o2uk    | display cards     |     | 14.3 | QANOV-343779 |

    @automatic @cert2 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | ber | cv   | jira_id      |
          | moves   | featured content  | ber | 13.3 | QANOV-38867  |
          | moves   | vertical cards    |     | 13.3 | QANOV-10387  |
          | moves   | rows              |     | 13.9 | QANOV-9971   |
          | moves   | highlighted cards |     | 14.3 | QANOV-285896 |
          | moves   | display cards     |     | 14.3 | QANOV-343782 |

    @automatic @cert3 @live @next @qa @smoke @webapp
    Examples:
          | product | module_type       | ber | cv   | jira_id      |
          | blaude  | featured content  | ber | 13.9 | QANOV-228498 |
          | blaude  | vertical cards    |     | 13.9 | QANOV-228505 |
          | blaude  | highlighted cards |     | 14.3 | QANOV-285897 |
          | blaude  | rows              |     | 13.9 | QANOV-228462 |
          | blaude  | display cards     |     | 14.3 | QANOV-343780 |

    @manual @smoke
    Examples:
          | product | module_type         | ber | cv     | jira_id      |
          | vivobr  | data cards          |     | 14.3   | QANOV-343713 |
          | vivobr  | poster cards        |     | 14.8   | QANOV-417418 |
          | vivobr  | data cards advanced |     | 14.8   | QANOV-417419 |
          | vivobr  | naked cards         |     | 14.8   | QANOV-417420 |
          | vivobr  | carousel circle     |     | Future | QANOV-417421 |
          | vivobr  | naked small cards   |     | 14.8   | QANOV-417422 |
          | o2uk    | display cards       |     | 14.3   | QANOV-343779 |
          | o2uk    | data cards          |     | 14.3   | QANOV-343714 |
          | o2uk    | poster cards        |     | 14.8   | QANOV-417423 |
          | o2uk    | naked cards         |     | 14.8   | QANOV-417425 |
          | o2uk    | carousel circle     |     | Future | QANOV-417426 |
          | o2uk    | naked small cards   |     | 14.8   | QANOV-417427 |
          | moves   | display cards       |     | 14.3   | QANOV-343782 |
          | moves   | data cards          |     | 14.3   | QANOV-320583 |
          | moves   | poster cards        |     | 14.8   | QANOV-417428 |
          | moves   | naked cards         |     | 14.8   | QANOV-417430 |
          | moves   | carousel circle     |     | Future | QANOV-417431 |
          | moves   | naked small cards   |     | 14.8   | QANOV-417432 |
          | blaude  | display cards       |     | 14.3   | QANOV-343780 |
          | blaude  | data cards          |     | 14.3   | QANOV-343715 |
          | blaude  | poster cards        |     | 14.8   | QANOV-417433 |
          | blaude  | naked cards         |     | 14.8   | QANOV-417435 |
          | blaude  | carousel circle     |     | Future | QANOV-417436 |
          | blaude  | naked small cards   |     | 14.8   | QANOV-417437 |
          | o2de    | featured content    |     | 14.2   | QANOV-49233  |
          | o2de    | vertical cards      |     | 14.2   | QANOV-49243  |
          | o2de    | rows                |     | 14.2   | QANOV-49207  |
          | o2de    | highlighted cards   |     | 14.3   | QANOV-285898 |
          | o2de    | display cards       |     | 14.3   | QANOV-343781 |
          | o2de    | data cards          |     | 14.3   | QANOV-343716 |
          | o2de    | poster cards        |     | 14.8   | QANOV-417438 |
          | o2de    | naked cards         |     | 14.8   | QANOV-417440 |
          | o2de    | carousel circle     |     | Future | QANOV-417441 |
          | o2de    | naked small cards   |     | 14.8   | QANOV-417442 |

    @manual @regression
    Examples:
          | product | module_type       | ber | cv     | jira_id      |
          | o2es    | featured content  |     | Future | QANOV-415180 |
          | o2es    | vertical cards    |     | Future | QANOV-407236 |
          | o2es    | rows              |     | Future | QANOV-407117 |
          | o2es    | highlighted cards |     | Future | QANOV-370134 |
          | o2es    | display cards     |     | Future | QANOV-407128 |
          | o2es    | data cards        |     | Future | QANOV-407188 |
          | o2es    | poster cards      |     | Future | QANOV-441749 |
          | o2es    | naked cards       |     | Future | QANOV-441751 |
          | o2es    | carousel circle   |     | Future | QANOV-441752 |
          | o2es    | naked small cards |     | Future | QANOV-441753 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  Scenario Outline: User can access to the title link in a <module_type> module
    Given user has a "<module_type>" module with a "title" link in the Explore content
     When searches the "module"
      And clicks on the "title_link" field in the explore "module"
     Then the Explore module link is opened
      And the Explore module link is closed
      And the "[CONTEXT:explore_page]" page is displayed

    @automatic @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.3 | QANOV-38868  |
          | vivobr  | vertical cards    | 13.3 | QANOV-10388  |
          | vivobr  | rows              | 13.3 | QANOV-10001  |
          | vivobr  | highlighted cards | 14.3 | QANOV-285899 |
          | vivobr  | display cards     | 14.3 | QANOV-343795 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 13.3 | QANOV-38869  |
          | o2uk    | vertical cards    | 13.3 | QANOV-10390  |
          | o2uk    | rows              | 13.3 | QANOV-10003  |
          | o2uk    | highlighted cards | 14.3 | QANOV-285900 |
          | o2uk    | display cards     | 14.3 | QANOV-343796 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.3 | QANOV-38870  |
          | moves   | vertical cards    | 13.3 | QANOV-10392  |
          | moves   | rows              | 13.3 | QANOV-10004  |
          | moves   | highlighted cards | 14.3 | QANOV-285901 |
          | moves   | display cards     | 14.3 | QANOV-343799 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-228499 |
          | blaude  | vertical cards    | 13.9 | QANOV-228506 |
          | blaude  | rows              | 13.9 | QANOV-228462 |
          | blaude  | highlighted cards | 14.3 | QANOV-285902 |
          | blaude  | display cards     | 14.3 | QANOV-343797 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | data cards          | 14.3   | QANOV-343726 |
          | vivobr  | data cards advanced | 14.8   | QANOV-417444 |
          | vivobr  | poster cards        | 14.8   | QANOV-417443 |
          | vivobr  | naked cards         | 14.8   | QANOV-417445 |
          | vivobr  | carousel circle     | Future | QANOV-417446 |
          | vivobr  | naked small cards   | 14.8   | QANOV-417447 |
          | o2uk    | display cards       | 14.3   | QANOV-343796 |
          | o2uk    | data cards          | 14.3   | QANOV-343727 |
          | o2uk    | poster cards        | 14.8   | QANOV-417448 |
          | o2uk    | naked cards         | 14.8   | QANOV-417450 |
          | o2uk    | carousel circle     | Future | QANOV-417451 |
          | o2uk    | naked small cards   | 14.8   | QANOV-417452 |
          | moves   | display cards       | 14.3   | QANOV-343799 |
          | moves   | data cards          | 14.3   | QANOV-297842 |
          | moves   | poster cards        | 14.8   | QANOV-531479 |
          | moves   | naked cards         | 14.8   | QANOV-417454 |
          | moves   | carousel circle     | Future | QANOV-417455 |
          | moves   | naked small cards   | 14.8   | QANOV-417456 |
          | blaude  | display cards       | 14.3   | QANOV-343797 |
          | blaude  | data cards          | 14.3   | QANOV-343728 |
          | blaude  | poster cards        | 14.8   | QANOV-417457 |
          | blaude  | naked cards         | 14.8   | QANOV-417459 |
          | blaude  | carousel circle     | Future | QANOV-417460 |
          | blaude  | naked small cards   | 14.8   | QANOV-417461 |
          | o2de    | featured content    | 14.2   | QANOV-49234  |
          | o2de    | vertical cards      | 14.2   | QANOV-49244  |
          | o2de    | rows                | 14.2   | QANOV-49213  |
          | o2de    | highlighted cards   | 14.3   | QANOV-285903 |
          | o2de    | display cards       | 14.3   | QANOV-343798 |
          | o2de    | data cards          | 14.3   | QANOV-343729 |
          | o2de    | poster cards        | 14.8   | QANOV-441754 |
          | o2de    | naked cards         | 14.8   | QANOV-441756 |
          | o2de    | carousel circle     | Future | QANOV-441757 |
          | o2de    | naked small cards   | 14.8   | QANOV-441758 |
          | o2es    | highlighted cards   | Future | QANOV-370135 |
          | o2es    | vertical cards      | Future | QANOV-407237 |
          | o2es    | featured content    | Future | QANOV-415181 |
          | o2es    | rows                | Future | QANOV-407124 |
          | o2es    | display cards       | Future | QANOV-407131 |
          | o2es    | data cards          | Future | QANOV-407191 |
          | o2es    | poster cards        | Future | QANOV-441759 |
          | o2es    | naked cards         | Future | QANOV-441761 |
          | o2es    | carousel circle     | Future | QANOV-441762 |
          | o2es    | naked small cards   | Future | QANOV-441763 |
