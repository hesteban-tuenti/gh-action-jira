# -*- coding: utf-8 -*-
@jira.QANOV-229217 @not_hardening
Feature: Categories management


  @jira.<jira_id> @<product> @manual @sanity @web
  Scenario Outline: A user can access to create a new category
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "header_add_category_button" button
     Then the "Category" page is loaded
      And the text of the element "page_title" is equal to "Category"
      And the "header_create_button" button is displayed
      And the "header_cancel_button" button is displayed
      And the "dynamic_preview" module is displayed
      And the "dynamic_preview.image" element is displayed
      And the "dynamic_preview.dark_mode_checkbox" element is displayed
      And the text of the element "category_title" is equal to "Category"
      And the text of the element "internal_name_subtitle" is equal to "Internal name"
      And the "internal_name_input" inputtext with the "Internal name (This can´t be edited in the future)" placeholder is displayed
      And the text of the element "category_name_subtitle" is equal to "Category name"
      And the "category_name_input" inputtext with the "Category name" placeholder is displayed
      And the text of the element "select_audiences_subtitle" is equal to "Select your audiences (optional)"
      And the "add_condition_button" button is displayed
      And the text of the element "url_subtitle" is equal to "Url (optional)"
      And the "url_input" inputtext with the "Url (optional)" placeholder is displayed
      And the text of the element "icon_subtitle" is equal to "Url (optional)"
      And the "select_icon" module is displayed
      And the "add_icon_button" button is displayed
      And the text of the element "activate_category_subtitle" is equal to "Url (optional)"
      And the text of the element "activate_category_desc" is equal to "You can activate or deactivate the category"
      And the "active_checkbox" checkbox is enabled
      And the "inactive_checkbox" checkbox is disabled
      And the "save_button" button is displayed

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-374082 |
          | o2uk    | QANOV-374083 |
          | moves   | QANOV-374084 |
          | blaude  | QANOV-374085 |
          | o2de    | QANOV-374086 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-374087 |

  @jira.<jira_id> @<product> @manual @sanity @web
  Scenario Outline: A user can create a new category
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "header_add_category_button" button
      And the "Category" page is loaded
      And I fill in the "internal_name" field with "qa_test"
      And I fill in the "category_name" field with "qa_category"
      And I click on the "save_button" button
      And I click on the "upload_icon" button
      And I select an image from the computer files
      And I click on the "save_button" button
     Then the "Explore Categories" page is loaded
      And the "categories_names_list" elements list contains the text "qa_category"

    @jira.cv.11.14 @jira.link.detects.TGT-1984
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-229218 |
          | o2uk    | QANOV-229219 |
          | moves   | QANOV-229220 |

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-374088 |
          | o2de    | QANOV-374089 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-374090 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a category
    Given a category with "qa_category" name has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_button" button of the element with "qa_category" value in the "category.name" field
      And the "Category" page is loaded
      And I clear the "category_name_input" input value
      And I fill in the "category_name_input" field with "qa_mod"
      And I click on the "save_button" button
     Then the "Explore Categories" page is loaded
      And the "categories_names_list" elements list contains the text "qa_mod"

    @jira.cv.11.14
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-229224 |
          | o2uk    | QANOV-229225 |
          | moves   | QANOV-229226 |

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-374091 |
          | o2de    | QANOV-374092 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-374093 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can activate a category
    Given a category with "qa_category" name has been created in CMS
      And the "qa_category" category is "active"
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_button" button of the element with "qa_category" value in the "category.name" field
      And the "Category" page is loaded
      And I check the box "inactive_checkbox"
      And I accept the alert
      And I click on the "header_save_button" button
     Then the "Explore Categories" page is loaded
      And the element with "qa_category" value in the "category.name" field has the "category.status" textfield with the "inactive" text

    @jira.cv.11.14
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-229227 |
          | o2uk    | QANOV-229228 |
          | moves   | QANOV-229229 |

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-374094 |
          | o2de    | QANOV-374095 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-374096 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can deactivate a category
    Given a category with "qa_category" name has been created in CMS
      And the "qa_category" category is "inactive"
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_button" button of the element with "qa_category" value in the "category.name" field
      And the "Category" page is loaded
      And I check the box "active_checkbox"
      And I accept the alert
      And I click on the "header_save_button" button
     Then the "Explore Categories" page is loaded
      And the element with "qa_category" value in the "category.name" field has the "category.status" textfield with the "active" text

    @jira.cv.11.14
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-229230 |
          | o2uk    | QANOV-229231 |
          | moves   | QANOV-229232 |

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-374097 |
          | o2de    | QANOV-374098 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-374099 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user cannot deactivate the "home" category
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_button" button of the element with "[LANG:explore.categories.home]" value in the "category.name" field
      And the "Category" page is loaded
     Then the "inactive_checkbox" checkbox is not displayed
      And the "active_checkbox" checkbox is not displayed

    @jira.cv.11.14
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-229233 |
          | o2uk    | QANOV-229234 |
          | moves   | QANOV-229235 |

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-374100 |
          | o2de    | QANOV-374101 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-374102 |

  @jira.<jira_id> @<product> @manual @regression @web
  Scenario Outline: A user can edit a category and associate it to an audience
    Given a category with "qa_category" name has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.categories]" web page
      And the "Explore Categories" page is loaded
      And I click on the "edit_button" button of the element with "qa_category" value in the "category.name" field
      And the "Category" page is loaded
      And I click on the "add_audience_button" button
      And I select the "<criteria_value>" option by value from "criteria_option" field
      And I click on the "audience_select" button
      And I select the "first" option from "audience_select_list" field
      And I click on the "header_save_button" button
     Then the "Explore Categories" page is loaded

    @jira.cv.14.3
    Examples:
          | product | criteria_value | jira_id      |
          | vivobr  | Is             | QANOV-229236 |
          | vivobr  | Is Not         | QANOV-374103 |
          | o2uk    | Is             | QANOV-229237 |
          | o2uk    | Is Not         | QANOV-374104 |
          | moves   | Is             | QANOV-229238 |
          | moves   | Is Not         | QANOV-374105 |
          | blaude  | Is             | QANOV-374106 |
          | blaude  | Is Not         | QANOV-374107 |
          | o2de    | Is             | QANOV-374108 |
          | o2de    | Is Not         | QANOV-374109 |

    @jira.cv.Future
    Examples:
          | product | criteria_value | jira_id      |
          | o2es    | Is             | QANOV-374110 |
          | o2es    | Is Not         | QANOV-374111 |
