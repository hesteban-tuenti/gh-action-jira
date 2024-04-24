# -*- coding: utf-8 -*-
@jira.QANOV-367869
Feature: Explore Widget


  @jira.QANOV-417829 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_featured_content_in_explore_scope
  Scenario: A user can see a Explore Widget with a Featured Content module configured in "Explore" scope
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "featured content" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "featured_content_modules.list" list is displayed
     Then each element in the sublist "cards" inside each "featured_content_modules.list" list has the "title" field

  @jira.QANOV-417830 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_vertical_cards_in_explore_scope
  Scenario: A user can see a Explore Widget with a Vertical Cards module configured in "Explore" scope
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "vertical cards" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "vertical_cards_modules.list" list is displayed
     Then each element in the sublist "cards" inside each "vertical_cards_modules.list" list has the "title" field

  @jira.QANOV-417831 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_rows_list_in_explore_scope
  Scenario: A user can see a Explore Widget with a Row List module configured
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "rows" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "rows_modules.list" list is displayed
     Then each element in the sublist "cards" inside each "rows_modules.list" list has the "title" field

  @jira.QANOV-417832 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_banner_in_explore_scope
  Scenario: A user can see a Explore Widget with a Banner module configured
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "banner" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "banner_modules.list" list is displayed
     Then each item in the "banner_modules.list" list has the "card" field

  @jira.QANOV-417833 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_highlighted_cards_in_explore_scope
  Scenario: A user can see a Explore Widget with a Highlighted Cards module configured
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "highlighted cards" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "highlighted_cards_modules.list" list is displayed
     Then each element in the sublist "cards" inside each "highlighted_cards_modules.list" list has the "title" field

  @jira.QANOV-417834 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_data_cards_in_explore_scope
  Scenario: A user can see a Explore Widget with a Data Cards module configured
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "data cards" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "data_cards_modules.list" list is displayed
     Then each element in the sublist "cards" inside each "data_cards_modules.list" list has the "title" field

  @jira.QANOV-417835 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_display_cards_in_explore_scope
  Scenario: A user can see a Explore Widget with a Display Cards module configured
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "display cards" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "display_cards_modules.list" list is displayed
     Then each element in the sublist "cards" inside each "display_cards_modules.list" list has the "title" field

  @jira.QANOV-417836 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_featured_content_in_home_category
  Scenario: A user can see a Explore Widget with a Featured Content module configured with category
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "featured content" module in the Explore content with cards in "Explore" scope and "home" category
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "featured_content_modules.list" list is displayed
     Then each element in the sublist "cards" inside each "featured_content_modules.list" list has the "title" field

  @jira.<jira_id> @<priority> @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_<number_modules>_modules
  Scenario Outline: A user can see a Explore Widget configured with <number_modules> modules to display
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "featured content" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "featured_content_modules.list" list is displayed
     Then the "featured_content_modules.list" list has "<=<number_modules>" elements

    Examples:
          | number_modules | priority   | jira_id      |
          | 1              | smoke      | QANOV-417837 |
          | 3              | regression | QANOV-417838 |
          | 5              | regression | QANOV-417839 |

  @jira.<jira_id> @<priority> @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_<number_cards>_cards
  Scenario Outline: A user can see a Explore Widget configured with <number_cards> cards to display
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "featured content" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "featured_content_modules.list" list is displayed
     Then the sublist "cards" inside each "featured_content_modules.list" list has "<=<number_cards>" elements

    Examples:
          | number_cards | priority   | jira_id      |
          | 1            | smoke      | QANOV-417840 |
          | 4            | regression | QANOV-417841 |
          | 8            | regression | QANOV-417842 |

  @jira.QANOV-417844 @android @automatic @ios @jira.cv.14.4 @jira.link.detects.CMS-3009 @mobile @o2uk @qa @regression
  @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_featured_content_with_display_links_enabled
  Scenario: A user can see a Explore Widget containing a featured content module with links on display
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "featured content" module in the Explore content with cards in "Explore" scope
      And the configured module has a module link
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "featured_content_modules.list" list is displayed
     Then any element in the "featured_content_modules.list" list has the "title_link" link with the "[CONTEXT:module_link]" text

  @jira.QANOV-417845 @android @automatic @ios @jira.cv.14.4 @jira.link.detects.CMS-3009 @mobile @o2uk @qa @regression
  @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_banner_with_display_links_enabled
  Scenario: A user can see a Explore Widget containing a banner module with links on display
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "banner" module in the Explore content with cards in "Explore" scope
      And the configured module has a module link
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "banner_modules.list" list is displayed
     Then any element in "banner_modules.list" list has an element in the "links" sublist with "[CONTEXT:module_link]" text

  @jira.QANOV-417850 @android @automatic @ios @jira.cv.14.4 @jira.link.detects.CMS-3009 @jira.link.detects.TGT-2487
  @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_featured_content_without_display_links_enabled
  Scenario: A user can see a Explore Widget containing a featured content module without links on display
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "featured content" module in the Explore content with cards in "Explore" scope
      And the configured module has a module link
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "featured_content_modules.list" list is displayed
     Then no element in the "featured_content_modules.list" list has the "title_link" field

  @jira.QANOV-417851 @android @automatic @ios @jira.cv.14.4 @jira.link.detects.CMS-3009 @jira.link.detects.TGT-2487
  @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_banner_without_display_links_enabled
  Scenario: A user can see a Explore Widget containing a banner module without links on display
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "banner" module in the Explore content with cards in "Explore" scope
      And the configured module has a module link
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "banner_modules.list" list is displayed
     Then no element in the "banner_modules.list" list has the "links" sublist

  @jira.QANOV-417856 @android @automatic @ios @jira.cv.14.4 @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_hide_title_enabled
  Scenario: A user can see a Explore Widget with the module title hidden
    Here the link means the title link. ALl modules but banners can show title links
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "featured content" module in the Explore content with cards in "Explore" scope
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "featured_content_modules.list" list is displayed
     Then each element in the "featured_content_modules.list" list does not have the "title" field
      And each element in the "featured_content_modules.list" list does not have the "title_link" field

  @jira.QANOV-417857 @android @ios @jira.cv.14.4 @manual @mobile @o2uk @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.explore_widget_with_hide_title_disabled
  Scenario: A user can see a Explore Widget with the module title displayed
    To be executed in QA
    Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
      And user has a "featured content" module in the Explore content with cards in "Explore" scope
      And the configured module has a module title
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "featured_content_modules.list" list is displayed
     Then any element in the "featured_content_modules.list" list has the "title" textfield with the "[CONTEXT:module_title]" text
