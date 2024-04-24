Feature: Test


  @android @ios @mobile @blaude @moves @o2de @o2uk @vivobr @webapp @test
  @smoke @sanity @regression @ber @dev @qa @cert0 @cert1 @cert2 @cert3 @next @live @automatic
  Scenario: Test
    Given user is in the "Explore" page
# And user has a "featured content" module scrollable
# When searches the "module"
# And displays the "carousel" in the "module" explore element
# And swipes the carousel from "right to left" in the selected explore module


# And takes a screenshot
# And clicks on the "navigation_tab_bar.account_tab" button
# And clicks on the "navigation_tab_bar.explore_tab" button
# And displays the "carousel" in the "module" explore element
# And waits "2" seconds
# Then check that the screen is in the previous state with threshold "0.15"
# When searches the "module"
# And waits "2" seconds
# And takes a screenshot
# And swipes the carousel from "left to right" in the selected explore module
# And displays the "carousel" in the "module" explore element
# And waits "2" seconds
# Then check that the screen is not in the previous state with threshold "0"

# @android @ios @mobile @blaude @moves @o2de @o2uk @vivobr @webapp @test
# @smoke @sanity @regression @ber @dev @qa @cert0 @cert1 @cert2 @cert3 @next @live @automatic
# Scenario: User can see a Featured content module with title
# Given user has a "featured content" module with autoplay
# And user has a "display cards" module scrollable
# When searches the "module"
# And displays the "carousel" in the "module" explore element
# And waits "2" seconds
# And takes a screenshot
# And swipes the carousel from "right to left" in the selected explore module
# And displays the "carousel" in the "module" explore element
# And waits "2" seconds
# Then check that the screen is not in the previous state with threshold "0"

# When searches the "card"
# Then the selected explore "card" has the "cta_button" field with "[CONTEXT:card_cta_text]" text
# And the selected explore "card" has the "card_link" field with "[CONTEXT:card_link_text]" text

# And the "[CONTEXT:explore_header]" header is displayed

# @automatic @live @next @qa @webapp
# Examples:
# | product | module_type      | cv    | jira_id      |
# | vivobr  | featured content | 13.10 | QANOV-285368 |
#| vivobr | vertical cards    | 13.10 | QANOV-285380 |
# | vivobr | highlighted cards | 14.6  |              |


# @android @ios @mobile @blaude @moves @o2de @o2uk @vivobr @webapp @test
# @smoke @sanity @regression @ber @dev @qa @cert0 @cert1 @cert2 @cert3 @next @live @automatic
# @fixture.cms.explore.set_explore_cms_director
# @fixture.cms.explore.add_featured_content_module
# @fixture.cms.explore.update_featured_content_module_with_section_title
# @fixture.cms.explore.add_card_featured_content_module
# @fixture.cms.explore.update_layout_with_module
# Scenario: Test explore fixtures
# To be executed in QA
# Given user is in the "Explore" page
# And user has a "featured content" module in the Explore content
# And user has a "featured content" module with section title with "[CONTEXT:fixture_module_title]" text in the Explore content
# When searches the "module"
# Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

# @android @ios @mobile @blaude @moves @o2de @o2uk @vivobr @webapp @test
# @smoke @sanity @regression @ber @dev @qa @cert0 @cert1 @cert2 @cert3 @next @live @automatic
# @fixture.cms.explore.set_explore_cms_director
# @fixture.cms.explore.add_featured_content_module
# # @fixture.cms.explore.update_featured_content_module_with_section_title
# # @fixture.cms.explore.add_card_featured_content_module
# # @fixture.cms.explore.update_layout_with_module
# Scenario: A user can see a featured content module with title
# To be executed in QA
# Given user is in the "Explore" page
# And user has a "featured content" module with section title with "[CONTEXT:fixture_module_title]" text in the Explore content
# When searches the "module"
# Then the selected explore "module" has the "title" field with "[CONTEXT:module_title]" text

# And user is in the "Modular Page Configurable Modules" modular page for current agreement
# And waits until the "banner_modules.list" list is displayed
# Then each item in the "banner_modules.list" list has the "card" field

# @webapp
# Examples:
# | product | jira_id |
# # | moves   | QANOV-367879 |
# | o2uk | QANOV-417832 |
# | blaude  | QANOV-367881 |

# @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.14.4 @jira.link.detects.CMS-3009 @mobile @qa @regression
# @fixture.cms.page.configurable_modules
# @fixture.cms.module.explore_widget_banner_with_display_links_enabled
# Scenario Outline: A user can see a Explore Widget containing a banner module with links on display
# To be executed in QA
# Given the "Explore Widget" module is configured in CMS for "Modular Page Configurable Modules" page
# And user has a "banner" module in the Explore content with cards in "Explore" scope
# And the configured module has a module link
# And user is in the "Modular Page Configurable Modules" modular page for current agreement
# And waits until the "banner_modules.list" list is displayed
# Then any element in "banner_modules.list" list has an element in the "links" field with "[CONTEXT:module_link]" text

# @webapp
# Examples:
# | product | jira_id      |
# | moves   | QANOV-417843 |
# | o2uk    | QANOV-417845 |
# | blaude  | QANOV-417847 |