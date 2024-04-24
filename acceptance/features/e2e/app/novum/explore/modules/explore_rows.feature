# -*- coding: utf-8 -*-
@jira.QANOV-9959
Feature: Explore rows

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: User can see a rows module without section title
    Given user has a "rows" module without title in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.5   | QANOV-440780 |
          | o2uk    | 14.5   | QANOV-440781 |
          | moves   | 14.5   | QANOV-440782 |
          | blaude  | 14.5   | QANOV-440783 |
          | o2de    | 14.5   | QANOV-440784 |
          | o2es    | Future | QANOV-440785 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.relates_to.NOV-29322 @mobile @webapp
  @fixture.cms.explore.set_explore_cms_director
  @fixture.cms.explore.add_rows_module
  @fixture.cms.explore.update_rows_module_with_section_title
  @fixture.cms.explore.add_card_rows_module
  @fixture.cms.explore.update_module_in_new_layout
  @fixture.cms.explore.publish_changes
  Scenario Outline: User can see a rows module with section title
    Given user has new Explore content
      And user is in the "Explore" page
      And user has a "rows" module with section title with "[CONTEXT:fixture_module_title]" text in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @automatic @qa @smoke
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 13.3 | QANOV-9961 |

    @automatic @qa @smoke
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 13.3 | QANOV-9963 |

    @automatic @qa @smoke
    Examples:
          | product | cv   | jira_id    |
          | moves   | 13.3 | QANOV-9965 |

    @automatic @qa @smoke
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228454 |

    @manual @smoke
    Examples:
          | product | cv   | jira_id     |
          | o2de    | 14.2 | QANOV-49206 |

    @manual @regression
    Examples:
          | product | cv     | jira_id      |
          | o2es    | Future | QANOV-407116 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: User can see a subtitle in a card in a rows module
    Given user has a "rows" card with subtitle in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "subtitle" field with "[CONTEXT:card_subtitle]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-474639 |
          | o2uk    | QANOV-474640 |
          | moves   | QANOV-474641 |
          | blaude  | QANOV-474642 |
          | o2de    | QANOV-474643 |
          | o2es    | QANOV-474644 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @manual @mobile @regression
  Scenario Outline: User can see a tag in a card in a rows module
    Rows card with tag can not have a pretitle.
    Given user has a "rows" card with a tag in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text
      And the selected explore "card" does not have the "pretitle" field displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-474645 |
          | o2uk    | QANOV-474646 |
          | moves   | QANOV-474647 |
          | blaude  | QANOV-474648 |
          | o2de    | QANOV-474649 |
          | o2es    | QANOV-474650 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201110 @mobile @webapp
  Scenario Outline: User can see the mandatory details of a card in a rows module
    Given user has a "rows" module in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @automatic @live @next @qa @sanity
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | vivobr  | QANOV-228454 | 13.3 | QANOV-410618 |

    @automatic @cert0 @cert1 @live @next @qa @sanity
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | o2uk    | QANOV-228454 | 13.3 | QANOV-410619 |

    @automatic @cert2 @live @next @qa @sanity
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | moves   | QANOV-228454 | 13.3 | QANOV-410620 |

    @automatic @cert3 @live @next @qa @raitt_drop1 @sanity
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228454 | 13.9 | QANOV-228456 |

    @manual @sanity
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2de    | QANOV-49206 | 14.2 | QANOV-49208 |

    @manual @regression
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-417469 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  Scenario Outline: User can see a rows module with a single card
    internal_checkpoint="The card will be presented the same way as if there were other cards."
    Given user has a single card in a "rows" Explore module
     When searches the "module"
     Then the selected explore module has "1" card
      And searches the "card"
      And the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @automatic @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 13.3 | QANOV-67239 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-67240 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-67241 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228464 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.2   | QANOV-228465 |
          | o2es    | Future | QANOV-407126 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201227 @mobile @regression @webapp
  Scenario Outline: User can see a classic price slot with all fields on a rows card
    Given user has a card with "classic" price slot with "all" fields in the "rows" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "price_classic" field with "[CONTEXT:card_price]" text
      And the selected explore "card" has the "price_info" field with "[CONTEXT:card_price_info]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-414262 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-414263 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | moves   | QANOV-10405 | 13.3 | QANOV-414264 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-414265 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-414266 |
          | o2es    |             | Future | QANOV-417470 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201227 @mobile @regression @webapp
  Scenario Outline: User can see a "classic" price slot with the "price" field on a rows card
    Given user has a card with "classic" price slot with the "price" field in the "rows" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "price_classic" field with "[CONTEXT:card_price]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-493055 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-493056 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | moves   | QANOV-10405 | 13.3 | QANOV-493057 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-493058 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-493059 |
          | o2es    |             | Future | QANOV-493060 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @mobile @regression @webapp
  Scenario Outline: User can see a new price slot with the "information" field on a rows card
    Given user has a card with "new" price slot with "all" fields in the "rows" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "price_new" field with "[CONTEXT:card_price]" text

    @automatic @live @next @qa
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-474651 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-474652 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | jira_id      |
          | moves   | QANOV-474653 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-474654 |

    @manual
    Examples:
          | product | jira_id      |
          | o2de    | QANOV-474655 |
          | o2es    | QANOV-474656 |
