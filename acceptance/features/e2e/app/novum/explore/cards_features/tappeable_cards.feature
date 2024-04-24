# -*- coding: utf-8 -*-
@jira.QANOV-417473
Feature: Tappeable cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646
  @jira.link.relates_to.NOV-29282 @mobile
  Scenario Outline: User can click on a tappeable card from the <module_type> module
    Card can be clicked without cta, meaning in the UI the whole card is tappeable
    Given user has a card tappeable on a "<module_type>" Explore module
     When searches the "card"
      And clicks on the "button_container" field in the explore "card"
     Then the Explore card is opened

    @automatic @live @next @qa @smoke
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.3 | QANOV-10163  |
          | vivobr  | vertical cards    | 13.3 | QANOV-10460  |
          | vivobr  | rows              | 13.3 | QANOV-9989   |
          | vivobr  | banner            | 13.3 | QANOV-10352  |
          | vivobr  | highlighted cards | 14.3 | QANOV-285865 |
          | vivobr  | display cards     | 14.3 | QANOV-343844 |

    @automatic @cert0 @cert1 @live @next @qa @smoke
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | vertical cards    | 13.3 | QANOV-10462  |
          | o2uk    | rows              | 13.3 | QANOV-9991   |
          | o2uk    | banner            | 13.3 | QANOV-10354  |
          | o2uk    | highlighted cards | 14.3 | QANOV-285866 |
          | o2uk    | display cards     | 14.3 | QANOV-343845 |

    @automatic @cert2 @live @next @qa @smoke
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.3 | QANOV-10165  |
          | moves   | vertical cards    | 13.3 | QANOV-10464  |
          | moves   | rows              | 13.3 | QANOV-9993   |
          | moves   | banner            | 13.3 | QANOV-10356  |
          | moves   | highlighted cards | 14.3 | QANOV-285867 |
          | moves   | display cards     | 14.3 | QANOV-343848 |

    @automatic @cert3 @live @next @qa @raitt_drop1 @smoke
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-228492 |
          | blaude  | vertical cards    | 13.9 | QANOV-228521 |
          | blaude  | rows              | 13.9 | QANOV-228460 |
          | blaude  | banner            | 13.9 | QANOV-228452 |
          | blaude  | highlighted cards | 14.3 | QANOV-285868 |
          | blaude  | display cards     | 14.3 | QANOV-343846 |

    @manual @smoke
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | naked small cards   | 14.8   | QANOV-441702 |
          | vivobr  | poster cards        | 14.8   | QANOV-441700 |
          | vivobr  | carousel circle     | Future | QANOV-441703 |
          | vivobr  | data cards advanced | 14.8   | QANOV-446573 |
          | o2uk    | poster cards        | 14.8   | QANOV-441704 |
          | o2uk    | naked small cards   | 14.8   | QANOV-441706 |
          | o2uk    | carousel circle     | Future | QANOV-441707 |
          | moves   | poster cards        | 14.8   | QANOV-441708 |
          | moves   | naked small cards   | 14.8   | QANOV-441710 |
          | moves   | carousel circle     | Future | QANOV-441711 |
          | blaude  | poster cards        | 14.8   | QANOV-441712 |
          | blaude  | naked small cards   | 14.8   | QANOV-441714 |
          | blaude  | carousel circle     | Future | QANOV-441715 |
          | o2de    | featured content    | 14.2   | QANOV-49225  |
          | o2de    | vertical cards      | 14.2   | QANOV-49256  |
          | o2de    | rows                | 14.2   | QANOV-49211  |
          | o2de    | banner              | 14.2   | QANOV-49240  |
          | o2de    | display cards       | 14.3   | QANOV-343847 |
          | o2de    | highlighted cards   | 14.3   | QANOV-285869 |
          | o2de    | poster cards        | 14.8   | QANOV-441716 |
          | o2de    | naked small cards   | 14.8   | QANOV-441718 |
          | o2de    | carousel circle     | Future | QANOV-441719 |
          | o2es    | featured content    | Future | QANOV-417474 |

    @manual @regression
    Examples:
          | product | module_type       | cv     | jira_id      |
          | o2es    | vertical cards    | Future | QANOV-407246 |
          | o2es    | rows              | Future | QANOV-441720 |
          | o2es    | banner            | Future | QANOV-407206 |
          | o2es    | display cards     | Future | QANOV-407140 |
          | o2es    | highlighted cards | Future | QANOV-370128 |
          | o2es    | poster cards      | Future | QANOV-441721 |
          | o2es    | naked small cards | Future | QANOV-441723 |
          | o2es    | carousel circle   | Future | QANOV-441724 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-433646
  @jira.link.relates_to.NOV-201116 @mobile @regression
  Scenario Outline: User can go back to Explore tab after accessing clicking on a tappeable card in a <module_type> module
    Given user has a card tappeable on a "<module_type>" Explore module
     When searches the "card"
      And clicks on the "button_container" field in the explore "card"
      And the Explore card is opened
      And the Explore card is closed
     Then the "[CONTEXT:explore_page]" page is displayed

    @automatic @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 13.3 | QANOV-10167  |
          | vivobr  | vertical cards    | 13.3 | QANOV-10466  |
          | vivobr  | rows              | 13.3 | QANOV-9995   |
          | vivobr  | banner            | 13.3 | QANOV-10358  |
          | vivobr  | highlighted cards | 14.3 | QANOV-285870 |
          | vivobr  | display cards     | 14.3 | QANOV-531470 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 13.3 | QANOV-597241 |
          | o2uk    | vertical cards    | 13.3 | QANOV-10468  |
          | o2uk    | rows              | 13.3 | QANOV-9997   |
          | o2uk    | banner            | 13.3 | QANOV-10360  |
          | o2uk    | highlighted cards | 14.3 | QANOV-285871 |
          | o2uk    | display cards     | 14.3 | QANOV-531471 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 13.3 | QANOV-10171  |
          | moves   | vertical cards    | 13.3 | QANOV-10470  |
          | moves   | rows              | 13.3 | QANOV-9999   |
          | moves   | banner            | 13.3 | QANOV-10362  |
          | moves   | highlighted cards | 14.3 | QANOV-285872 |
          | moves   | display cards     | 14.3 | QANOV-531472 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 13.9 | QANOV-228493 |
          | blaude  | vertical cards    | 13.9 | QANOV-228523 |
          | blaude  | rows              | 13.9 | QANOV-228461 |
          | blaude  | banner            | 13.9 | QANOV-228453 |
          | blaude  | highlighted cards | 14.3 | QANOV-285873 |
          | blaude  | display cards     | 14.3 | QANOV-531473 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | poster cards        | 14.8   | QANOV-441725 |
          | vivobr  | naked small cards   | 14.8   | QANOV-441727 |
          | vivobr  | carousel circle     | Future | QANOV-441728 |
          | vivobr  | data cards advanced | 14.8   | QANOV-446579 |
          | o2uk    | poster cards        | 14.8   | QANOV-441729 |
          | o2uk    | naked small cards   | 14.8   | QANOV-441731 |
          | o2uk    | carousel circle     | Future | QANOV-441732 |
          | moves   | poster cards        | 14.8   | QANOV-441733 |
          | moves   | naked small cards   | 14.8   | QANOV-441735 |
          | moves   | carousel circle     | Future | QANOV-441736 |
          | blaude  | poster cards        | 14.8   | QANOV-441737 |
          | blaude  | naked small cards   | 14.8   | QANOV-441739 |
          | blaude  | carousel circle     | Future | QANOV-441740 |
          | o2de    | featured content    | 14.2   | QANOV-49226  |
          | o2de    | vertical cards      | 14.2   | QANOV-49257  |
          | o2de    | rows                | 14.2   | QANOV-49212  |
          | o2de    | banner              | 14.2   | QANOV-49241  |
          | o2de    | highlighted cards   | 14.3   | QANOV-285874 |
          | o2de    | display cards       | 14.3   | QANOV-531474 |
          | o2de    | poster cards        | 14.8   | QANOV-441741 |
          | o2de    | naked small cards   | 14.8   | QANOV-441743 |
          | o2de    | carousel circle     | Future | QANOV-441744 |
          | o2es    | featured content    | Future | QANOV-417475 |
          | o2es    | vertical cards      | Future | QANOV-407247 |
          | o2es    | rows                | Future | QANOV-407123 |
          | o2es    | banner              | Future | QANOV-407207 |
          | o2es    | highlighted cards   | Future | QANOV-370129 |
          | o2es    | display cards       | 14.3   | QANOV-531475 |
          | o2es    | poster cards        | Future | QANOV-441745 |
          | o2es    | naked small cards   | Future | QANOV-441747 |
          | o2es    | carousel circle     | Future | QANOV-441748 |
