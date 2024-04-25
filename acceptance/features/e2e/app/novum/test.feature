Feature: Test


# @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
# @jira.link.relates_to.NOV-195451 @mobile @sanity
# Scenario Outline: User can see a card within a Featured content module
# Given user is in the "Explore" page
# And user has a "featured content" module in the Explore content
# When searches the "card"
# Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
# And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text
# And the selected explore card has the "image_or_bumper" media field displayed

# @automatic @live @next @qa @webapp
# Examples:
# | product | depends_on  | cv   | jira_id     |
# | vivobr  | QANOV-10121 | 13.3 | QANOV-10139 |

# @automatic @cert0 @cert1 @live @next @qa @webapp
# Examples:
# | product | depends_on  | cv   | jira_id     |
# | o2uk    | QANOV-10121 | 13.3 | QANOV-10141 |

# @automatic @cert2 @live @next @qa @webapp
# Examples:
# | product | depends_on  | cv   | jira_id     |
# | moves   | QANOV-10121 | 13.3 | QANOV-10142 |

# @automatic @cert3 @live @next @qa @webapp
# Examples:
# | product | depends_on   | cv   | jira_id      |
# | blaude  | QANOV-228469 | 13.9 | QANOV-228483 |

# @android @ios @mobile @blaude @moves @o2de @o2uk @vivobr @webapp @test
# @smoke @sanity @regression @ber @dev @qa @cert0 @cert1 @cert2 @cert3 @next @live @automatic
# Scenario: A legacy prepay user with a tariff without allowances without pending tariff change can see the current tariff details
# other_affected_versions="2022-06"
# commented_tags="@depends_on.NOV-63954"
# Given user has a "legacy prepay" account type
# And user does not have a "rolling plan based" tariff
# And user has no pending tariff change
# And user has a tariff without allowances
# And user has the matching subscription selected in the account
# And user has the "services" module configured in CMS for "dashboard" page
# And user has the "View or change your tariff" entrypoint configured in CMS for the "subscription-contract-dashboard" list
# And user is in the "Services" page
# When clicks on the "view_or_change_your_tariff" button
# Then the "Tariff Details" page is displayed
# And the "Your tariff details" header is displayed
# And the "header.tariff_name" textfield is displayed
# And the "header.payment_type_title" textfield is displayed
# And the "header.change_your_tariff" button with "Change your tariff" text is displayed
# And the "header.top_up" button with "Top Up" text is displayed
# And the "description_title" textfield with "WHAT YOU GET" text is displayed
# And the "description_text" textfield is displayed
# And the "remaining_allowances_title" textfield is not displayed
# And the "remaining_allowances_subtitle" textfield is not displayed
# And the item in "0" position from the "remaining_allowances_list" elements list has the "title" field with value "Status"
# And the "0" index in the "remaining_allowances_list" list has the "detail" field with "Active" text
# And the item in "1" position from the "remaining_allowances_list" elements list has the "title" field with value "Payment type"
# And the "1" index in the "remaining_allowances_list" list has the "detail" field with "Payment based" text
# And the item in "1" position from the "remaining_allowances_list" elements list has the field "chevron"
# And the item in "3" position from the "remaining_allowances_list" elements list has the "title" field with value "Additional information"
# And the "3" index in the "remaining_allowances_list" list has the "detail" field with "Find out how much of your UK allowance you can use in our Europe Zone" text
# And the item in "3" position from the "remaining_allowances_list" elements list has the field "chevron"
# And any element in the "remaining_allowances_list" list has the "title" textfield with the "Additional information" text
# And the "view_standard_rates.title" textfield with "View standard rates" text is displayed
# And the "view_standard_rates.chevron" element is displayed



  @jira.<jira_id> @android @automatic @ios @jira.cv.24.3 @mobile @<product> @qa @smoke @webapp
  @fixture.cms.explore.set_explore_cms_director
  @fixture.cms.explore.add_featured_content_module @fixture.cms.explore.add_card_featured_content_module
  @fixture.cms.explore.publish_changes
  @fixture.cms.page.configurable_modules_explore @fixture.cms.module.explore_module
  Scenario Outline: A user can see a Explore Module with a Featured Content module without title
    To be executed in QA
    Given the "Explore Module" module is configured in CMS for "Modular Page Explore" page
      And user is in the "Modular Page Explore" modular page
     Then the "featured_content_modules_list" list is displayed
      And the element in "0" position in the "featured_content_modules_list" list has not the "title" field

    @automatic @qa @smoke
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 13.3 | QANOV-9963 |



# @android @ios @mobile @blaude @moves @o2de @o2uk @vivobr @webapp @test
# @smoke @sanity @regression @ber @dev @qa @cert0 @cert1 @cert2 @cert3 @next @live @automatic
# @fixture.cms.explore.set_explore_cms_director
# @fixture.cms.explore.add_rows_module
# @fixture.cms.explore.update_rows_module_with_section_title
# @fixture.cms.explore.add_card_rows_module
# @fixture.cms.explore.update_module_in_new_layout
# @fixture.cms.explore.publish_changes
# Scenario: Test fixture vc
# Given user is in the "Explore" page
# And user has a "rows" module with section title with "[CONTEXT:fixture_module_title]" text in the Explore content