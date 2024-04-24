# -*- coding: utf-8 -*-
@jira.QANOV-410631
Feature: CTA in cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @smoke
  Scenario Outline: User can see a CTA in a card within a <module_type> module
    Given user has a card with a cta on a "<module_type>" Explore module
     When searches the "card"
     Then the selected explore "card" has the "cta_button" field with "[CONTEXT:card_cta_text]" text

    @automatic @live @next @qa @webapp
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 14.3 | QANOV-410632 |
          | vivobr  | display cards     | 14.3 | QANOV-343822 |
          | vivobr  | highlighted cards | 14.3 | QANOV-410637 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 14.3 | QANOV-410633 |
          | o2uk    | display cards     | 14.3 | QANOV-343823 |
          | o2uk    | highlighted cards | 14.3 | QANOV-410638 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 14.3 | QANOV-410634 |
          | moves   | display cards     | 14.3 | QANOV-343826 |
          | moves   | highlighted cards | 14.3 | QANOV-410645 |

    @automatic @cert3 @live @next @qa @webapp
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 14.3 | QANOV-410635 |
          | blaude  | display cards     | 14.3 | QANOV-343824 |
          | blaude  | highlighted cards | 14.3 | QANOV-410639 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | banner hero         | 14.3   | QANOV-410641 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441582 |
          | o2uk    | banner hero         | 14.3   | QANOV-410642 |
          | moves   | banner hero         | 14.3   | QANOV-410646 |
          | blaude  | banner hero         | 14.3   | QANOV-410643 |
          | o2de    | featured content    | 14.3   | QANOV-410636 |
          | o2de    | display cards       | 14.3   | QANOV-343825 |
          | o2de    | highlighted cards   | 14.3   | QANOV-410640 |
          | o2de    | banner hero         | 14.3   | QANOV-410644 |
          | o2es    | display cards       | Future | QANOV-407136 |
          | o2es    | highlighted cards   | Future | QANOV-417261 |
          | o2es    | banner hero         | Future | QANOV-417262 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  Scenario Outline: User can see a CTA and a link in a card within a <module_type> module
    Given user has a card with a CTA and a link on a "<module_type>" Explore module
     When searches the "card"
     Then the selected explore "card" has the "cta_button" field with "[CONTEXT:card_cta_text]" text
      And the selected explore "card" has the "card_link" field with "[CONTEXT:card_link_text]" text

    @automatic @live @next @qa @webapp
    Examples:
          | product | module_type      | cv   | jira_id      |
          | vivobr  | display cards    | 14.3 | QANOV-343827 |
          | vivobr  | featured content | 14.3 | QANOV-410647 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | module_type      | cv   | jira_id      |
          | o2uk    | display cards    | 14.3 | QANOV-343828 |
          | o2uk    | featured content | 14.3 | QANOV-410648 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | module_type      | cv   | jira_id      |
          | moves   | display cards    | 14.3 | QANOV-343831 |
          | moves   | featured content | 14.3 | QANOV-297868 |

    @automatic @cert3 @live @next @qa @raitt_drop1 @webapp
    Examples:
          | product | module_type      | cv   | jira_id      |
          | blaude  | display cards    | 14.3 | QANOV-343829 |
          | blaude  | featured content | 14.3 | QANOV-410649 |

    @manual
    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | banner hero         | 14.3   | QANOV-519430 |
          | o2uk    | banner hero         | 14.3   | QANOV-519431 |
          | moves   | banner hero         | 14.3   | QANOV-519432 |
          | blaude  | banner hero         | 14.3   | QANOV-519433 |
          | o2de    | display cards       | 14.3   | QANOV-343830 |
          | o2de    | featured content    | 14.3   | QANOV-410650 |
          | o2de    | banner hero         | 14.3   | QANOV-519434 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441593 |
          | o2es    | display cards       | Future | QANOV-407137 |
          | o2es    | featured content    | Future | QANOV-417264 |
          | o2es    | banner hero         | Future | QANOV-519435 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-29282 @mobile
  Scenario Outline: User can click on a CTA button in a card within a <module_type> module
    Given user has a card with a cta on a "<module_type>" Explore module
     When searches the "card"
      And clicks on the "cta_button" field in the explore "card"
     Then the Explore card is opened

    @automatic @live @next @qa @smoke
    Examples:
          | product | module_type       | cv   | jira_id      |
          | vivobr  | featured content  | 14.3 | QANOV-410653 |
          | vivobr  | highlighted cards | 14.3 | QANOV-410656 |
          | vivobr  | display cards     | 14.3 | QANOV-343832 |

    @automatic @ber @cert0 @cert1 @live @next @qa @smoke
    Examples:
          | product | module_type       | cv   | jira_id      |
          | o2uk    | featured content  | 14.3 | QANOV-410654 |
          | o2uk    | highlighted cards | 14.3 | QANOV-410657 |
          | o2uk    | display cards     | 14.3 | QANOV-343833 |

    @automatic @cert2 @live @next @qa @smoke
    Examples:
          | product | module_type       | cv   | jira_id      |
          | moves   | featured content  | 14.3 | QANOV-297869 |
          | moves   | highlighted cards | 14.3 | QANOV-410658 |
          | moves   | display cards     | 14.3 | QANOV-410659 |

    @automatic @ber @cert3 @live @next @qa @smoke
    Examples:
          | product | module_type       | cv   | jira_id      |
          | blaude  | featured content  | 14.3 | QANOV-410655 |
          | blaude  | highlighted cards | 14.3 | QANOV-410660 |
          | blaude  | display cards     | 14.3 | QANOV-343834 |

    @manual @smoke
    Examples:
          | product | module_type         | cv   | jira_id      |
          | vivobr  | banner hero         | 14.3 | QANOV-343676 |
          | vivobr  | data cards advanced | 14.8 | QANOV-441601 |
          | o2uk    | banner hero         | 14.3 | QANOV-343678 |
          | moves   | banner hero         | 14.3 | QANOV-297837 |
          | blaude  | banner hero         | 14.3 | QANOV-343679 |
          | o2de    | featured content    | 14.3 | QANOV-410661 |
          | o2de    | highlighted cards   | 14.3 | QANOV-343835 |
          | o2de    | display cards       | 14.3 | QANOV-410662 |
          | o2de    | banner hero         | 14.3 | QANOV-343680 |

    @manual @regression
    Examples:
          | product | module_type       | cv     | jira_id      |
          | o2es    | featured content  | Future | QANOV-441598 |
          | o2es    | highlighted cards | Future | QANOV-417265 |
          | o2es    | display cards     | Future | QANOV-407138 |
          | o2es    | banner hero       | Future | QANOV-407151 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can click on a card link in a card with CTA within a <module_type> module
    Card should have a CTA configured and a Link field added
    Given user has a card with a CTA and a link on a "<module_type>" Explore module
     When searches the "card"
      And clicks on the "card_link" field in the explore "card"
     Then the Explore module link is opened

    Examples:
          | product | module_type         | cv     | jira_id      |
          | vivobr  | featured content    | 14.3   | QANOV-410663 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441614 |
          | o2uk    | featured content    | 14.3   | QANOV-410664 |
          | moves   | featured content    | 14.3   | QANOV-297870 |
          | blaude  | featured content    | 14.3   | QANOV-410665 |
          | o2de    | featured content    | 14.3   | QANOV-410666 |
          | o2es    | featured content    | Future | QANOV-441611 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User who has a card with cta in a <module_type>, will see the rest of the card's module with a predefined CTA
    Given user has a "<module_type>" module containing at least a card card with a cta in the Explore content
      And there are other cards in the module without cta
     When searches the "card"
     Then the selected explore "card" has the "cta_button" field displayed
      And the other cards in the module have the "cta_button" field with the "[LANG:explore.more_information]" textfield

    Examples:
          | product | module_type         | Future | jira_id      |
          | vivobr  | featured content    | 14.3   | QANOV-359581 |
          | vivobr  | highlighted cards   | 14.3   | QANOV-359586 |
          | vivobr  | display cards       | 14.3   | QANOV-359576 |
          | vivobr  | data cards advanced | 14.8   | QANOV-441624 |
          | o2uk    | featured content    | 14.3   | QANOV-359582 |
          | o2uk    | highlighted cards   | 14.3   | QANOV-359587 |
          | o2uk    | display cards       | 14.3   | QANOV-359577 |
          | moves   | featured content    | 14.3   | QANOV-359583 |
          | moves   | highlighted cards   | 14.3   | QANOV-359588 |
          | moves   | display cards       | 14.3   | QANOV-359580 |
          | blaude  | featured content    | 14.3   | QANOV-359584 |
          | blaude  | highlighted cards   | 14.3   | QANOV-359589 |
          | blaude  | display cards       | 14.3   | QANOV-359578 |
          | o2de    | featured content    | 14.3   | QANOV-359585 |
          | o2de    | highlighted cards   | 14.3   | QANOV-359590 |
          | o2de    | display cards       | 14.3   | QANOV-359579 |
          | o2es    | featured content    | Future | QANOV-417267 |
          | o2es    | highlighted cards   | Future | QANOV-370136 |
          | o2es    | display cards       | Future | QANOV-407143 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.8 @manual @mobile @regression
  Scenario Outline: User who has one card with cta and the others without cta, will see the cta only in the card with cta
    Given user has a "<module_type>" module containing at least a card card with a cta in the Explore content
      And there are other cards in the module without cta
     When searches the "card"
     Then the selected explore "card" has the "cta_button" field displayed
      And the other cards in the module have not the "cta_button" field

    Examples:
          | product | module_type         | jira_id      |
          | vivobr  | data cards advanced | QANOV-446763 |
