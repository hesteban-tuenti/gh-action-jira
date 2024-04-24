# -*- coding: utf-8 -*-
@jira.QANOV-10375
Feature: Vertical cards

  Actions Before each Scenario:
    Given user is in the "Explore" page


  @jira.<jira_id> @<product> @android @ios @manual @mobile @regression
  Scenario Outline: User can see a Vertical cards module without section title
    Given user has a "vertical cards" module without title in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.5   | QANOV-440761 |
          | o2uk    | 14.5   | QANOV-440762 |
          | blaude  | 14.5   | QANOV-440763 |
          | o2de    | 14.5   | QANOV-440764 |
          | moves   | 14.5   | QANOV-440765 |
          | o2es    | Future | QANOV-440766 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-293817 @mobile
  @fixture.cms.explore.set_explore_cms_director
  @fixture.cms.explore.add_vertical_cards_module
  @fixture.cms.explore.update_vertical_cards_module_with_section_title
  @fixture.cms.explore.add_card_vertical_cards_module
  @fixture.cms.explore.update_module_in_new_layout
  @fixture.cms.explore.publish_changes
  Scenario Outline: User can see a Vertical cards module with a section title
    Given user has new Explore content
      And user is in the "Explore" page
      And user has a "vertical cards" module with section title with "[CONTEXT:fixture_module_title]" text in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 14.3 | QANOV-410626 |

    @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.3 | QANOV-410627 |

    @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 14.3 | QANOV-410628 |

    @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | moves   | 14.3 | QANOV-320595 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.3   | QANOV-410629 |
          | o2es    | Future | QANOV-417471 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201221 @mobile @webapp
  Scenario Outline: User can see a card within a Vertical cards module
    Given user has a "vertical cards" module in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore card has the "image" media field displayed

    @automatic @live @next @qa @sanity
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10377 | 13.3 | QANOV-10400 |

    @automatic @cert0 @cert1 @live @next @qa @sanity
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10379 | 13.3 | QANOV-10402 |

    @automatic @cert2 @live @next @qa @sanity
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10381 | 13.3 | QANOV-10405 |

    @automatic @cert3 @live @next @qa @raitt_drop1 @sanity
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-228508 |

    @manual @sanity
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2de    | QANOV-49242 | 14.2 | QANOV-49246 |

    @manual @regression
    Examples:
          | product | depends_on | cv     | jira_id      |
          | o2es    |            | Future | QANOV-407239 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201228 @mobile @regression @webapp
  Scenario Outline: User can see a tag on a vertical card
    Given user has a card with a tag on a "vertical cards" Explore module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-10407 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-10409 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10405 | 13.3 | QANOV-10410 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-228510 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-49247  |
          | o2es    |             | Future | QANOV-407240 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201227 @mobile @regression @webapp
  Scenario Outline: User can see a classic price slot with the "information" field on a vertical card
    Given user has a card with "classic" price slot with the "information" field in the "vertical cards" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "cl_price" field with "[CONTEXT:card_price]" text
      And the selected explore "card" has the "cl_price_info" field with "[CONTEXT:card_price_info]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-10412 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-10415 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10405 | 13.3 | QANOV-10416 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-228512 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-49248  |
          | o2es    |             | Future | QANOV-407241 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201227 @mobile @regression @webapp
  Scenario Outline: User can see a classic price slot with the "price" field on a vertical card
    Given user has a card with "classic" price slot with the "price" field in the "vertical cards" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "cl_price" field with "[CONTEXT:card_price]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-493061 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-493062 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id      |
          | moves   | QANOV-10405 | 13.3 | QANOV-493063 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-493064 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-493065 |
          | o2es    |             | Future | QANOV-493066 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201222 @mobile @regression @webapp
  Scenario Outline: User can see a "classic" price slot with the "standard text" field on a vertical card
    Given user has a card with "classic" price slot with the "standard_text" field in the "vertical cards" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "cl_price" field with "[CONTEXT:card_price]" text
      And the selected explore "card" has the "cl_price_standard_text" field with "[CONTEXT:card_price_standard]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-10418 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-10420 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10405 | 13.3 | QANOV-10423 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-228514 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-49249  |
          | o2es    |             | Future | QANOV-407242 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201224 @mobile @regression @webapp
  Scenario Outline: User can see a "classic" price slot with the "highlighted text" field on a vertical card
    Given user has a card with "classic" price slot with the "highlighted_text" field in the "vertical cards" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "cl_price" field with "[CONTEXT:card_price]" text
      And the selected explore "card" has the "cl_price_highlighted_text" field with "[CONTEXT:card_price_highlighted]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-10424 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-10426 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10405 | 13.3 | QANOV-10428 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-228516 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-49250  |
          | o2es    |             | Future | QANOV-407243 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201225 @mobile @regression @webapp
  Scenario Outline: User can see a classic price slot with the "strikethrough text" field on a vertical card
    Given user has a card with "classic" price slot with the "strikethrough_text" field in the "vertical cards" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "cl_price" field with "[CONTEXT:card_price]" text
      And the selected explore "card" has the "cl_price_strikethrough_text" field with "[CONTEXT:card_price_strikethrough]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-10430 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-10432 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10405 | 13.3 | QANOV-10434 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-228518 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-49251  |
          | o2es    |             | Future | QANOV-407244 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-201226 @mobile @regression @webapp
  Scenario Outline: User can see a classic price slot with all fields on a vertical card
    Given user has a card with "classic" price slot with "all" fields in the "vertical cards" module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "cl_price" field with "[CONTEXT:card_price]" text
      And the selected explore "card" has the "cl_price_info" field with "[CONTEXT:card_price_info]" text
      And the selected explore "card" has the "cl_price_strikethrough_text" field with "[CONTEXT:card_price_strikethrough]" text
      And the selected explore "card" has the "cl_price_highlighted_text" field with "[CONTEXT:card_price_highlighted]" text

    @automatic @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10400 | 13.3 | QANOV-10436 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10402 | 13.3 | QANOV-10444 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10405 | 13.3 | QANOV-10452 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228503 | 13.9 | QANOV-228520 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49242 | 14.2   | QANOV-49252  |
          | o2es    |             | Future | QANOV-407245 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-433646 @mobile @regression
  @webapp
  Scenario Outline: User can see all fields of a new price slot on a vertical card
    Given user has a card with "new" price slot with "all" fields in the "vertical cards" module
     When searches the "card"
     Then the selected explore "card" has the "new_price" field with "[CONTEXT:card_price]" text
      And the selected explore "card" has the "new_price_top_desc" field with "[CONTEXT:card_price_top_desc]" text
      And the selected explore "card" has the "new_price_bottom_desc" field with "[CONTEXT:card_price_bottom_desc]" text

    @automatic @live @next @qa
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-438406 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-438407 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | jira_id      |
          | moves   | QANOV-438408 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-438409 |

    @manual
    Examples:
          | product | jira_id      |
          | o2de    | QANOV-438410 |
          | o2es    | QANOV-438411 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-433646 @mobile @regression
  @webapp
  Scenario Outline: User can see a "new" price slot with the "price" field on a vertical card
    Given user has a card with "new" price slot with the "price" field in the "vertical cards" module
     When searches the "card"
     Then the selected explore "card" has the "new_price" field with "[CONTEXT:card_price]" text

    @automatic @live @next @qa
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-493067 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-493068 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | jira_id      |
          | moves   | QANOV-493069 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-493070 |

    @manual
    Examples:
          | product | jira_id      |
          | o2de    | QANOV-493071 |
          | o2es    | QANOV-493072 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression @webapp
  Scenario Outline: User can see a vertical card module with a single card
    internal_checkpoint="The card will be presented the same way as if there were other cards."
    Given user has a single card in a "vertical cards" Explore module
     When searches the "module"
     Then the selected explore module has "1" card
      And searches the "card"
      And the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @automatic @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 13.3 | QANOV-67230 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-67231 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-67232 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228524 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.2   | QANOV-207573 |
          | o2es    | Future | QANOV-407248 |

  @jira.QANOV-320596 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User can see navigable filters in the vertical cards module
    The filters are configured in the cms and are generated by the copy of the label included in the cards
    Given user has a "vertical cards" module with filters in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "navigable_filters" field displayed

  @jira.QANOV-320597 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User can select a navigable filter in the vertical cards module
    Given user has a "vertical cards" module with filters in the Explore content
     When searches the "module"
      And selects a filter
     Then only the cards belonging to that filter are displayed

  @jira.QANOV-320598 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see a navigable filter displaying all cards in the vertical cards module
    Given user has a "vertical cards" module with filters in the Explore content
     When searches the "module"
      And clicks on the "navigable_filters.all" button
     Then all the cards of the module are displayed
