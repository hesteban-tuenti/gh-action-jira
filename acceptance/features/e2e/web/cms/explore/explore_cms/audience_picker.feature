# -*- coding: utf-8 -*-
@jira.QANOV-283698 @not_hardening
Feature: Audience Picker


  @jira.<jira_id> @<product> @manual @smoke @web
  Scenario Outline: An editor can create a category with an audience containing a single element and the "<criteria_value>" criteria
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "add_category_button" button
      And the "Category" page is loaded
      And I fill in the "internal_name" field with "qa_segment"
      And I fill in the "category_name" field with "qa_segment"
      And I click on the "upload_icon_button" button
      And I select an image from the computer files
      And I click on the "add_audience_button" button
      And I select the "<criteria_value>" option by value from "criteria_option" field
      And I click on the "audience_select_button" button
      And I select the "first" option from "audience_select_list" field
      And I click on the "save_button" button
     Then the "Explore Categories" page is loaded
      And the "categories_names_list" elements list contains the text "qa_segment"

    @jira.cv.14.4
    Examples:
          | product | criteria_value | jira_id      |
          | vivobr  | Is             | QANOV-283822 |
          | vivobr  | Is Not         | QANOV-283700 |
          | o2uk    | Is             | QANOV-283823 |
          | o2uk    | Is Not         | QANOV-283702 |
          | moves   | Is             | QANOV-283824 |
          | moves   | Is Not         | QANOV-283704 |
          | blaude  | Is             | QANOV-283705 |
          | blaude  | Is Not         | QANOV-283706 |
          | o2de    | Is             | QANOV-360602 |
          | o2de    | Is Not         | QANOV-360603 |

    @jira.cv.Future
    Examples:
          | product | criteria_value | jira_id      |
          | o2es    | Is             | QANOV-360604 |
          | o2es    | Is Not         | QANOV-360605 |

  @jira.<jira_id> @<product> @manual @smoke @web
  Scenario Outline: An editor can create a card with an audience containing a single element and the "<criteria_value>" criteria
    Given a "featured content" module has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.modules_repo]" web page
      And the "Modules Repository" page is loaded
      And I click on the "edit_featured_content" button
      And the "Edit Module" page is loaded
      And I click on the "add_card_button" button
      And the "Add Card" page is loaded
      And I click on the "new_card_radio_button" button
      And I click on the "next_button" button
      And the "Card Content" page is loaded
      And I fill in the "card_pre_title_input" field with "qa test card pretitle"
      And I fill in the "card_title_input" field with "qa test card using audience"
      And I fill in the "card_desc_input" field with "qa test card description"
      And I click on the "next_button" button
      And the "Card Actions" page is loaded
      And I fill in the "card_action_url" field with "https://www.google.es"
      And I click on the "next_button" button
      And the "Card Other" page is loaded
      And I click on the "add_audience_button" button
      And I select the "<criteria_value>" option by value from "criteria_option" field
      And I click on the "audience_select_button" button
      And I select the "first" option from "audience_select_list" field
      And I click on the "select_tracking_tag" element
      And I click on the "first_tracking_tag" element
      And I fill in the "tracking_desc_input" field with "qa test tracking tag desc"
      And I click on the "save_button" button
     Then the "Edit Module" page is loaded
      And the "cards_title_list" elements list contains the text "qa test card using audience"

    @jira.cv.14.4
    Examples:
          | product | criteria_value | jira_id      |
          | vivobr  | Is             | QANOV-283707 |
          | vivobr  | Is Not         | QANOV-283708 |
          | o2uk    | Is             | QANOV-283709 |
          | o2uk    | Is Not         | QANOV-283710 |
          | moves   | Is             | QANOV-283711 |
          | moves   | Is Not         | QANOV-283712 |
          | blaude  | Is             | QANOV-283713 |
          | blaude  | Is Not         | QANOV-283714 |
          | o2de    | Is             | QANOV-360606 |
          | o2de    | Is Not         | QANOV-360607 |

    @jira.cv.Future
    Examples:
          | product | criteria_value | jira_id      |
          | o2es    | Is             | QANOV-360608 |
          | o2es    | Is Not         | QANOV-360609 |

  @jira.<jira_id> @<product> @manual @smoke @web
  Scenario Outline: An editor can create a "<in_app_type>" In-app with an audience containing a single element and the "<criteria_value>" criteria
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I press the element in position "<in_app_number>" in the elements list "in_app_messages_types_list"
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And I select "any" option from "audience_checklist" field
      And I select "any" option from "tab_access" field
      And I click on the "continue" button
      And the selected option of the element "in_app_creation_step_list" is equal to "Preview"
      And I click on the "add_audience_button" button
      And I select the "<criteria_value>" option by value from "criteria_option" field
      And I click on the "audience_select" button
      And I select the "first" option from "audience_select_list" field
      And I click on the "continue" button
      And the selected option of the element "in_app_creation_step_list" is equal to "Preview"
      And I click on the "continue" button
      And I fill in the "google_analytics" field with "Analytics Test"
      And I click on the "publish" button
     Then the "In App Messages CMS" page is loaded
      And the value of "last" cell of table "in_app_messages_list" contains "PUBLISHED"
      And the text of the element "confirmation_message" is equal to "The message has been published successfully"

    @jira.cv.14.4
    Examples:
          | product | in_app_number | in_app_type | criteria_value | jira_id      |
          | vivobr  | 1             | Localized   | Is             | QANOV-283715 |
          | vivobr  | 3             | Contextual  | Is Not         | QANOV-283716 |
          | moves   | 1             | Localized   | Is             | QANOV-283717 |
          | moves   | 3             | Contextual  | Is Not         | QANOV-283718 |
          | o2uk    | 1             | Localized   | Is             | QANOV-283719 |
          | o2uk    | 3             | Contextual  | Is Not         | QANOV-283720 |
          | blaude  | 1             | Localized   | Is             | QANOV-283721 |
          | blaude  | 3             | Contextual  | Is Not         | QANOV-283722 |
          | o2de    | 1             | Localized   | Is             | QANOV-360610 |
          | o2de    | 3             | Contextual  | Is Not         | QANOV-360611 |

    @jira.cv.Future
    Examples:
          | product | in_app_number | in_app_type | criteria_value | jira_id      |
          | o2es    | 1             | Localized   | Is             | QANOV-360612 |
          | o2es    | 3             | Contextual  | Is Not         | QANOV-360613 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can define an audience with more than one audience and combine the criteria
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
    This scenario only covers two audiences and all the combinations, but there is no restriction with the
    number of audiences that can be added.
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "add_category_button" button
      And the "Category" page is loaded
      And I fill in the "internal_name" field with "qa_segment"
      And I fill in the "category_name" field with "qa_segment"
      And I click on the "upload_icon" button
      And I select an image from the computer files
      And I click on the "add_audience_button" button
      And I click on the "add_audience_button" button
      And I select the "<criteria_value_first>" option by value from "criteria_option_first" field
      And I select the "<criteria_value_second>" option by value from "criteria_option_second" field
      And I click on the "audience_select_first" button
      And I select the "first" option from "audience_select_list_first" field
      And I click on the "audience_select_second" button
      And I select the "first" option from "audience_select_list_second" field
      And I click on the "<must_meet_checkbox>" button
      And I click on the "save_button" button
     Then the "Explore Categories" page is loaded
      And the "categories_names_list" elements list contains the text "qa_segment"

    @jira.cv.14.4
    Examples:
          | product | criteria_value_first | criteria_value_second | must_meet_checkbox             | jira_id      |
          | vivobr  | Is                   | Is                    | must_meet_checkbox_all         | QANOV-283723 |
          | vivobr  | Is                   | Is                    | must_meet_checkbox_one_or_more | QANOV-283724 |
          | vivobr  | Is                   | Is  Not               | must_meet_checkbox_all         | QANOV-283725 |
          | vivobr  | Is                   | Is  Not               | must_meet_checkbox_one_or_more | QANOV-283726 |
          | vivobr  | Is Not               | Is                    | must_meet_checkbox_all         | QANOV-283727 |
          | vivobr  | Is Not               | Is                    | must_meet_checkbox_one_or_more | QANOV-283728 |
          | vivobr  | Is Not               | Is  Not               | must_meet_checkbox_all         | QANOV-283729 |
          | vivobr  | Is Not               | Is  Not               | must_meet_checkbox_one_or_more | QANOV-283730 |
          | moves   | Is                   | Is                    | must_meet_checkbox_all         | QANOV-283731 |
          | moves   | Is                   | Is                    | must_meet_checkbox_one_or_more | QANOV-283732 |
          | moves   | Is                   | Is  Not               | must_meet_checkbox_all         | QANOV-283733 |
          | moves   | Is                   | Is  Not               | must_meet_checkbox_one_or_more | QANOV-283734 |
          | moves   | Is Not               | Is                    | must_meet_checkbox_all         | QANOV-283735 |
          | moves   | Is Not               | Is                    | must_meet_checkbox_one_or_more | QANOV-283736 |
          | moves   | Is Not               | Is  Not               | must_meet_checkbox_all         | QANOV-283737 |
          | moves   | Is Not               | Is  Not               | must_meet_checkbox_one_or_more | QANOV-283738 |
          | o2uk    | Is                   | Is                    | must_meet_checkbox_all         | QANOV-283739 |
          | o2uk    | Is                   | Is                    | must_meet_checkbox_one_or_more | QANOV-283740 |
          | o2uk    | Is                   | Is  Not               | must_meet_checkbox_all         | QANOV-283741 |
          | o2uk    | Is                   | Is  Not               | must_meet_checkbox_one_or_more | QANOV-283742 |
          | o2uk    | Is Not               | Is                    | must_meet_checkbox_all         | QANOV-283743 |
          | o2uk    | Is Not               | Is                    | must_meet_checkbox_one_or_more | QANOV-283744 |
          | o2uk    | Is Not               | Is  Not               | must_meet_checkbox_all         | QANOV-283745 |
          | o2uk    | Is Not               | Is  Not               | must_meet_checkbox_one_or_more | QANOV-283746 |
          | blaude  | Is                   | Is                    | must_meet_checkbox_all         | QANOV-283747 |
          | blaude  | Is                   | Is                    | must_meet_checkbox_one_or_more | QANOV-283748 |
          | blaude  | Is                   | Is  Not               | must_meet_checkbox_all         | QANOV-283749 |
          | blaude  | Is                   | Is  Not               | must_meet_checkbox_one_or_more | QANOV-283750 |
          | blaude  | Is Not               | Is                    | must_meet_checkbox_all         | QANOV-283751 |
          | blaude  | Is Not               | Is                    | must_meet_checkbox_one_or_more | QANOV-283752 |
          | blaude  | Is Not               | Is  Not               | must_meet_checkbox_all         | QANOV-283753 |
          | blaude  | Is Not               | Is  Not               | must_meet_checkbox_one_or_more | QANOV-283754 |
          | o2de    | Is                   | Is                    | must_meet_checkbox_all         | QANOV-360614 |
          | o2de    | Is                   | Is                    | must_meet_checkbox_one_or_more | QANOV-360615 |
          | o2de    | Is                   | Is  Not               | must_meet_checkbox_all         | QANOV-360616 |
          | o2de    | Is                   | Is  Not               | must_meet_checkbox_one_or_more | QANOV-360617 |
          | o2de    | Is Not               | Is                    | must_meet_checkbox_all         | QANOV-360618 |
          | o2de    | Is Not               | Is                    | must_meet_checkbox_one_or_more | QANOV-360619 |
          | o2de    | Is Not               | Is  Not               | must_meet_checkbox_all         | QANOV-360620 |
          | o2de    | Is Not               | Is  Not               | must_meet_checkbox_one_or_more | QANOV-360621 |

    @jira.cv.Future
    Examples:
          | product | criteria_value_first | criteria_value_second | must_meet_checkbox             | jira_id      |
          | o2es    | Is                   | Is                    | must_meet_checkbox_all         | QANOV-360622 |
          | o2es    | Is                   | Is                    | must_meet_checkbox_one_or_more | QANOV-360623 |
          | o2es    | Is                   | Is  Not               | must_meet_checkbox_all         | QANOV-360624 |
          | o2es    | Is                   | Is  Not               | must_meet_checkbox_one_or_more | QANOV-360625 |
          | o2es    | Is Not               | Is                    | must_meet_checkbox_all         | QANOV-360626 |
          | o2es    | Is Not               | Is                    | must_meet_checkbox_one_or_more | QANOV-360627 |
          | o2es    | Is Not               | Is  Not               | must_meet_checkbox_all         | QANOV-360628 |
          | o2es    | Is Not               | Is  Not               | must_meet_checkbox_one_or_more | QANOV-360629 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor who defines an audience with more than 2 audiences will see the must meet all checkbox updated
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "add_category_button" button
      And the "Category" page is loaded
      And I fill in the "internal_name" field with "qa_segment"
      And I fill in the "category_name" field with "qa_segment"
      And I click on the "upload_icon" button
      And I select an image from the computer files
      And I click on the "add_audience_button" button
      And I click on the "add_audience_button" button
      And I click on the "add_audience_button" button
     Then the text of the element "must_meet_checkbox_all_text" is equal to "Must meet all 3 conditions at once"

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-283755 |
          | o2uk    | QANOV-283756 |
          | moves   | QANOV-283757 |
          | blaude  | QANOV-283758 |
          | o2de    | QANOV-360630 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-360631 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can see the list of audiences in a Repository
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And there is a category with >1 audiences
      And I click on the "audiences" element
     Then the "audiences_list" element is displayed

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-360632 |
          | o2uk    | QANOV-360633 |
          | moves   | QANOV-360634 |
          | blaude  | QANOV-360635 |
          | o2de    | QANOV-360636 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-360637 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can access to delete an audience from a category
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_category_button" button
      And the "Category" page is loaded
      And I click on the "delete_audience_button" button
     Then the "delete_popup" popup is displayed

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-360638 |
          | o2uk    | QANOV-360639 |
          | moves   | QANOV-360640 |
          | blaude  | QANOV-360641 |
          | o2de    | QANOV-360642 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-360643 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can see a warning and a tooltip when in the audience list the request for the info of the audience fails
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "add_category_button" button
      And the "Category" page is loaded
      And there is a category with an error in the audiences info request
     Then the "warning_icon" icon is displayed
      And the "audience_info_problem_tooltip" tooltip is displayed

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-360644 |
          | o2uk    | QANOV-360645 |
          | moves   | QANOV-360646 |
          | blaude  | QANOV-360647 |
          | o2de    | QANOV-360648 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-360649 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can see a warning when introduce an audience that does not exist or is undefined
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "add_category_button" button
      And the "Category" page is loaded
      And I fill in the "audience_placeholder" field with "TBD"
     Then the "warning_icon" icon is displayed
      And the "validation_error" element is under "audience_placeholder" element
      And the text of the element "validation_error" is equal to "The target audience does not exist"

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-360650 |
          | o2uk    | QANOV-360651 |
          | moves   | QANOV-360652 |
          | blaude  | QANOV-360653 |
          | o2de    | QANOV-360654 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-360655 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can see a warning when the data coming from the backend is invalid
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_category_button" button
      And the "Category" page is loaded
      And there is a category with an audience with invalid data from backend
     Then the "warning_icon" icon is displayed
      And the "validation_error" element is under "audience_placeholder" element
      And the text of the element "validation_error" is equal to "The target audience is unsupported and in read-only mode. Click on the delete icon to clear."

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-360656 |
          | o2uk    | QANOV-360657 |
          | moves   | QANOV-360658 |
          | blaude  | QANOV-360659 |
          | o2de    | QANOV-360660 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-360661 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can see a warning when an error ocurred when loading the audiences
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_category_button" button
      And the "Category" page is loaded
      And there is a category with an error when loading the audiences
     Then the "warning_icon" icon is displayed
      And the "validation_error" element is under "audience_placeholder" element
      And the text of the element "validation_error" is equal to "An error ocurred when loading the audiences"
      And the "error_snackbar" snackbar is displayed

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-360662 |
          | o2uk    | QANOV-360663 |
          | moves   | QANOV-360664 |
          | blaude  | QANOV-360665 |
          | o2de    | QANOV-360666 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-360667 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: An editor can see a warning when an audience no longer exist
    The scenario defines the audience in the category page but the logic will be the same in the rest of the pages:
    In-apps and Cards
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_category_button" button
      And the "Category" page is loaded
      And there is a category with an audience that no longer exist
     Then the "warning_icon" icon is displayed
      And the "validation_error" element is under "audience_placeholder" element
      And the text of the element "warning_text" is equal to "The target audience does not exist"

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-360668 |
          | o2uk    | QANOV-360669 |
          | moves   | QANOV-360670 |
          | blaude  | QANOV-360671 |
          | o2de    | QANOV-360672 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-360673 |
