# -*- coding: utf-8 -*-
@jira.QANOV-10020
Feature: Featured content

  Actions Before each Scenario:
    Given user is in the "Explore" page

  Actions After the feature:
     Then user is in the "Explore" page 

  @jira.<jira_id> @<product> @android @ios @manual @mobile @regreesion
  Scenario Outline: User can see a Featured content module without section title
    Given user has a "featured content" module without title in the Explore content
     When searches the "module"
     Then the selected explore "module" is displayed
      And the selected explore "module" has not the "title" field displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.5   | QANOV-440755 |
          | o2uk    | 14.5   | QANOV-440756 |
          | blaude  | 14.5   | QANOV-440757 |
          | o2de    | 14.5   | QANOV-440758 |
          | moves   | 14.5   | QANOV-440759 |
          | o2es    | Future | QANOV-440760 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-201241 @mobile @smoke
  @fixture.cms.explore.set_explore_cms_director
  @fixture.cms.explore.add_featured_content_module
  @fixture.cms.explore.update_featured_content_module_with_section_title
  @fixture.cms.explore.add_card_featured_content_module
  @fixture.cms.explore.update_module_in_new_layout
  @fixture.cms.explore.publish_changes
  Scenario Outline: User can see a Featured content module with a section title
    Given user has new Explore content
      And user is in the "Explore" page
      And user has a "featured content" module with section title with "[CONTEXT:fixture_module_title]" text in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

    @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 13.3 | QANOV-10121 |

    @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-10123 |

    @automatic @qa @webapp
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-10125 |

    @automatic @qa @raitt_drop1 @webapp
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228469 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.2   | QANOV-49215  |
          | o2es    | Future | QANOV-415163 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-195451 @mobile @sanity
  Scenario Outline: User can see a card within a Featured content module
    Given user has a "featured content" module in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text
      And the selected explore card has the "image_or_bumper" media field displayed

    @automatic @live @next @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10121 | 13.3 | QANOV-10139 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10121 | 13.3 | QANOV-10141 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10121 | 13.3 | QANOV-10142 |

    @automatic @cert3 @live @next @qa @webapp
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228469 | 13.9 | QANOV-228483 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49215 | 14.2   | QANOV-49218  |
          | o2es    |             | Future | QANOV-415164 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-195452 @mobile @regression
  Scenario Outline: User can see a tag on a Featured content card
    Given user has a card with a tag on a "featured content" Explore module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text
      And the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text

    @automatic @live @next @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10121 | 13.3 | QANOV-10144 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10123 | 13.3 | QANOV-10146 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10125 | 13.3 | QANOV-10147 |

    @automatic @cert3 @live @next @qa @webapp
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228469 | 13.9 | QANOV-228485 |

    @manual
    Examples:
          | product | depends_on  | cv     | jira_id      |
          | o2de    | QANOV-49215 | 14.2   | QANOV-49219  |
          | o2es    |             | Future | QANOV-415165 |

  @jira.QANOV-96893 @android @automatic @ber @cert0 @ios @jira.cv.13.3 @jira.link.relates_to.NOV-96227 @live @mobile @next
  @o2uk @qa @sanity
  Scenario: O2uk user can see the full version of T&C by tapping on "Terms apply" of a CMS offer
    Given user has a card with "full" T&C on a featured content Explore module
     When searches the "card"
      And clicks on the "terms_link" field in the explore "card"
     Then the Explore offer terms link is opened
      And the Explore offer terms link is closed
      And the "[CONTEXT:explore_page]" page is displayed

  @jira.QANOV-96894 @android @automatic @cert0 @cert1 @ios @jira.cv.13.3 @jira.link.relates_to.NOV-92070 @live @mobile @next
  @o2uk @qa @smoke @webapp
  Scenario: O2uk user can see the short version of T&C by tapping on "Terms apply" of a CMS offer
    Given user has a card with "short" T&C on a featured content Explore module
     When searches the "card"
      And clicks on the "terms_link" field in the explore "card"
     Then the "Short Terms" page is displayed
      And the "card_title" textfield with "[CONTEXT:card_title]" text is displayed
      And the "terms_text" textfield that contains the "[CONTEXT:card_terms_link_summary]" text is displayed
      And the "full_terms_link" link with "[CONTEXT:card_terms_link]" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "[CONTEXT:explore_page]" page is displayed

  @jira.QANOV-97039 @android @automatic @cert0 @cert1 @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-10213
  @jira.link.relates_to.NOV-92071 @live @mobile @next @o2uk @qa @smoke
  Scenario: O2uk user can see the full version of T&C from the short T&C view
    Given user has a card with "short" T&C on a featured content Explore module
     When searches the "card"
      And clicks on the "terms_link" field in the explore "card"
      And the "Short Terms" page is displayed
      And clicks on the "full_terms_link" link
     Then the Explore offer terms link is opened
      And the Explore offer terms link is closed
      And the "Short Terms" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @regression
  Scenario Outline: User can see a featured content module with a single card
    internal_checkpoint="The card will be presented the same way as if there were other cards."
    Given user has a single card in a "featured content" Explore module
     When searches the "module"
     Then the selected explore module has "1" card
      And searches the "card"
      And the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @automatic @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 13.3 | QANOV-67236 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-67237 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-67238 |

    @automatic @cert3 @live @next @qa @webapp
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228501 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.2   | QANOV-228502 |
          | o2es    | Future | QANOV-415183 |

  @jira.QANOV-213853 @android @automatic @cert0 @cert1 @ios @jira.cv.13.3 @live @mobile @next @o2uk @qa @smoke @webapp
  Scenario: O2uk user can see the "more info" button in card within a Featured content module
    Given user has a "featured content" module in the Explore content
     When searches the "card"
     Then the selected explore "card" has the "button_redeem" field displayed

  @jira.QANOV-213854 @android @automatic @cert0 @cert1 @ios @jira.cv.13.3 @live @mobile @next @o2uk @qa @regression @webapp
  Scenario: O2uk cannot open a Featured content card clicking the card container
    Given user has a "featured content" module in the Explore content
     When searches the "card"
      And clicks the card container
     Then the "[CONTEXT:explore_page]" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-290921 @manual @smoke
  Scenario Outline: User can see the voucher code in card within a Feature content module
    Given user has a card with a CTA and a voucher in a "featured content" Explore module
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text
      And the selected explore "card" has the "cta_button" field with "[CONTEXT:cta_text]" text
      And the selected explore "card" has the "voucher_code" field with "[CONTEXT:card_voucher]" text

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.4   | QANOV-371905 |
          | o2uk    | 14.4   | QANOV-291329 |
          | moves   | 14.4   | QANOV-371906 |
          | blaude  | 14.4   | QANOV-371907 |
          | o2de    | 14.4   | QANOV-371908 |
          | o2es    | Future | QANOV-438384 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-290921 @manual @smoke
  Scenario Outline: User can redeem the voucher code in card within a Feature content module when clicking the cta button
    Given user has a card with a CTA and a voucher in a "featured content" Explore module
     When searches the "card"
      And clicks on the "cta_button" field in the explore "card"
     Then a spinner is shown in the "cta_button" field
      And the code is copied to the clipboard
      And the "crouton_message" textfield with "[LANG:explore.vouchers.copy_to_clipboard]" text is displayed
      And waits until the "crouton_message" element is not visible
      And the Explore card is opened

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-371909 |
          | o2uk    | QANOV-371910 |
          | moves   | QANOV-371911 |
          | blaude  | QANOV-371912 |
          | o2de    | QANOV-371913 |
          | o2es    | QANOV-438385 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-290921 @manual @regression
  Scenario Outline: User can see the voucher code in card with a tag within a Feature content module with social proof activated
    Given user has a card with a CTA and a voucher in a "featured content" Explore module with social proof activated
      And the card within the module with more clicks has "tag" enabled
     When searches the "card"
     Then the card with more clicks has the "social_proof_textfield" field
      And the selected explore "card" has the "voucher_code" field with "[CONTEXT:card_voucher]" text
      And the selected explore "card" has the "tag" field with "[CONTEXT:card_tag]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-371914 |
          | o2uk    | QANOV-371915 |
          | moves   | QANOV-371916 |
          | blaude  | QANOV-371917 |
          | o2de    | QANOV-371918 |
          | o2es    | QANOV-438386 |

  @jira.QANOV-320591 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User can see navigable filters in the featured content module
    The filters are configured in the cms and are generated by the copy of the label included in the cards
    Given user has a "featured content" module with filters in the Explore content
     When searches the "module"
     Then the selected explore "module" has the "navigable_filters" field displayed

  @jira.QANOV-320592 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User can select a navigable filter in the featured content module
    Given user has a "featured content" module with filters in the Explore content
     When searches the "module"
      And selects a filter
     Then only the cards belonging to that filter are displayed

  @jira.QANOV-320593 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see a navigable filter displaying all cards in the featured content module
    Given user has a "featured content" module with filters in the Explore content
     When searches the "module"
      And clicks on the "navigable_filters.all" button
     Then all the cards of the module are displayed
