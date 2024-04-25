# -*- coding: utf-8 -*-
@jira.QANOV-191857 @not_hardening
Feature: Dynamic Content

  Actions After the Feature:
    Given the configured dynamic contents with "[CONF:cms.dynamic_content_name_prefix]" text in CMS are deleted


  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @smoke @web
  Scenario Outline: A user can access to the Dynamic Content screen via the cms lateral menu
     When I go to "[CONF:cms.base]" web page
      And the "Comms Module" page is loaded
     When I click on the "dynamic_content_option" button
     Then the "Dynamic Contents" page is loaded

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191858 |
          | o2uk    | 13.1 | QANOV-191859 |
          | moves   | 13.1 | QANOV-191860 |
          | blaude  | 13.9 | QANOV-191861 |
          | o2de    | 24.1 | QANOV-191862 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @sanity @web
  Scenario Outline: A user can access to the Dynamic Content page with contents already created
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" dynamic contents configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
     Then the text of the element "title" is equal to "Dynamic content"
      And the text of the element "create_button" is equal to "Create"
      And the "filter_by_name" element is displayed
      And the "filter_by_status" element is displayed
      And the "filter_by_use_case" element is displayed
      And the "dynamic_contents_list" list of elements is displayed
      And each item in the "dynamic_contents_list" list has the "name" field
      And each item in the "dynamic_contents_list" list has the "description" field
      And each item in the "dynamic_contents_list" list has the "status" field
      And each item in the "dynamic_contents_list" list has the "type" field

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191863 |
          | o2uk    | 13.1 | QANOV-191864 |
          | moves   | 13.1 | QANOV-191865 |
          | blaude  | 13.9 | QANOV-191866 |
          | o2de    | 24.1 | QANOV-191867 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @smoke @web
  Scenario Outline: A user can access to create a new dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
     Then the "Dynamic Content Overview" page is loaded
      And the text of the element "close_button" is equal to "Close"
      And the "name_input" element is displayed
      And the "description_input" element is displayed
      And the "content_representation_selector" element is displayed
      And the text of the element "continue_button" is equal to "Continue"

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191868 |
          | o2uk    | 13.1 | QANOV-191869 |
          | moves   | 13.1 | QANOV-191870 |
          | blaude  | 13.9 | QANOV-191871 |
          | o2de    | 24.1 | QANOV-191872 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @regression @web
  Scenario Outline: A user can access to the edition page for a dynamic content of type "Page"
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Page" value from "content_representation_selector" field
      And I click on the "continue_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "version_tab" is equal to "Version 1"
      And the text of the element "add_version_button" is equal to "Add new version"
      And the text of the element "status" is equal to "DRAFT"
      And the "title_input" element is displayed
      And the "page_content_selector" element is displayed
      And the text of the element "add_slot_button" is equal to "Add"
      And the element in "0" position in the "actions_list" list with "No actions" text is displayed
      And the element in "1" position in the "actions_list" list with "One Action" text is displayed
      And the element in "2" position in the "actions_list" list with "Two Actions" text is displayed
      And the text of the element "plus_add_version_button" is equal to "+ ADD NEW VERSION"
      And the "page_preview" element is displayed
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "save_and_publish_button" is equal to "Save and publish"
      And I click on the "page_content_selector" button
      And waits until the elements in the "page_content_list" list have text
      And the element in "0" position in the "page_content_list" list with "Markdown section" text is displayed
      And the element in "1" position in the "page_content_list" list with "Action section" text is displayed
      And the element in "2" position in the "page_content_list" list with "Image section" text is displayed
      And the element in "3" position in the "page_content_list" list with "Feedback icon section" text is displayed
      And the element in "4" position in the "page_content_list" list with "Row List section" text is displayed
      And the element in "5" position in the "page_content_list" list with "Space" text is displayed
      And the element in "6" position in the "page_content_list" list with "Heading" text is displayed

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191873 |
          | o2uk    | 13.1 | QANOV-191874 |
          | moves   | 13.1 | QANOV-191875 |
          | blaude  | 13.9 | QANOV-191876 |
          | o2de    | 24.1 | QANOV-191877 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can access to the edition page for a dynamic content of type "Slideshow"
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "qa-slideshow-test"
      And I fill in the "description_input" field with "QA testing purposes"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the "title_input" element is displayed
      And the text of the element "button_primary_radio" is equal to "Button primary"
      And the text of the element "button_primary_link_radio" is equal to "Button primary + link"
      And the text of the element "links_radio" is equal to "Links"
      And the "button_primary_radio" checkbox is enabled
      And the text of the element "add_page_button" is equal to "+ Add page"
      And the text of the element "page_one_tab" is equal to "Page 1"
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "content_description" is equal to "You can add all modules you want and also order them as you want user seen it."
      And the "page_content_selector" element is displayed
      And the text of the element "add_slot_button" is equal to "Add"
      And I click on the "page_content_selector" button
      And waits until the elements in the "page_content_list" list have text
      And the element in "0" position in the "page_content_list" list with "Markdown section" text is displayed
      And the element in "1" position in the "page_content_list" list with "Action section" text is displayed
      And the element in "2" position in the "page_content_list" list with "Image section" text is displayed
      And the element in "3" position in the "page_content_list" list with "Feedback icon section" text is displayed
      And the element in "4" position in the "page_content_list" list with "Row List section" text is displayed
      And the element in "5" position in the "page_content_list" list with "Space" text is displayed
      And the element in "6" position in the "page_content_list" list with "Heading" text is displayed
      And the text of the element "final_action_title" is equal to "Final action"
      And the "final_action_selector" element is displayed
      And the "final_action_input" element is displayed
      And the "page_preview" element is displayed
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "save_button" is equal to "Save"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597168 |
          | o2uk    | QANOV-597169 |
          | moves   | QANOV-597170 |
          | blaude  | QANOV-597171 |
          | o2de    | QANOV-597172 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @regression @web
  Scenario Outline: A user can access to the edition page for a dynamic content of type "Banner"
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Banner" value from "content_representation_selector" field
      And I click on the "continue_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "version_tab" is equal to "Version 1"
      And the text of the element "add_version_button" is equal to "Add new version"
      And the text of the element "status" is equal to "DRAFT"
      And the "title_input" element is displayed
      And the "action_label_input" element is displayed
      And the "action_url_input" element is displayed
      And the "light_icon_add_link" element is displayed
      And the "dark_icon_add_link" element is displayed
      And the text of the element "plus_add_version_button" is equal to "+ ADD NEW VERSION"
      And the "page_preview" element is displayed
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "save_and_publish_button" is equal to "Save and publish"

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191878 |
          | o2uk    | 13.1 | QANOV-191879 |
          | moves   | 13.1 | QANOV-191880 |
          | blaude  | 13.9 | QANOV-191881 |
          | o2de    | 24.1 | QANOV-191882 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @regression @web
  Scenario Outline: A user can access to the edition page for an "Empty case" dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Empty case" value from "content_representation_selector" field
      And I click on the "continue_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "version_tab" is equal to "Version 1"
      And the text of the element "add_version_button" is equal to "Add new version"
      And the text of the element "status" is equal to "DRAFT"
      And the "title_input" element is displayed
      And the "description_input" element is displayed
      And the "action_label_input" element is displayed
      And the "action_url_input" element is displayed
      And the "light_icon_add_link" element is displayed
      And the "dark_icon_add_link" element is displayed
      And the "image_size_selector" element is displayed
      And the text of the element "plus_add_version_button" is equal to "+ ADD NEW VERSION"
      And the "page_preview" element is displayed
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "save_and_publish_button" is equal to "Save and publish"
      And I click on the "image_size_selector" button
      And waits until the elements in the "page_content_list" list have text
      And the element in "0" position in the "image_size_list" list with "Small" text is displayed
      And the element in "1" position in the "image_size_list" list with "Large" text is displayed

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191883 |
          | o2uk    | 13.1 | QANOV-191884 |
          | moves   | 13.1 | QANOV-191885 |
          | blaude  | 13.9 | QANOV-191886 |
          | o2de    | 24.1 | QANOV-191887 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @regression @web
  Scenario Outline: A user can access to the edition page for a "Terms & conditions" dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Terms and Conditions" value from "content_representation_selector" field
      And I click on the "continue_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "version_tab" is equal to "Version 1"
      And the text of the element "add_version_button" is equal to "Add new version"
      And the text of the element "status" is equal to "DRAFT"
      And the "title_input" element is displayed
      And the "page_content_selector" element is displayed
      And the text of the element "add_slot_button" is equal to "Add"
      And the element in "0" position in the "actions_list" list with "No actions" text is displayed
      And the element in "1" position in the "actions_list" list with "One Action" text is displayed
      And the element in "2" position in the "actions_list" list with "Two Actions" text is displayed
      And the text of the element "plus_add_version_button" is equal to "+ ADD NEW VERSION"
      And the "page_preview" element is displayed
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "save_and_publish_button" is equal to "Save and publish"
      And I click on the "page_content_selector" button
      And waits until the elements in the "page_content_list" list have text
      And the element in "0" position in the "page_content_list" list with "Markdown section" text is displayed
      And the element in "1" position in the "page_content_list" list with "Action section" text is displayed
      And the element in "2" position in the "page_content_list" list with "Image section" text is displayed

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191888 |
          | o2uk    | 13.1 | QANOV-191889 |
          | moves   | 13.1 | QANOV-191890 |
          | blaude  | 13.9 | QANOV-191891 |
          | o2de    | 24.1 | QANOV-191892 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @regression @web
  Scenario Outline: A user can access to the edition page for a "Embeddable content" dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable Content" value from "content_representation_selector" field
      And I click on the "continue_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "version_tab" is equal to "Version 1"
      And the text of the element "add_version_button" is equal to "Add new version"
      And the text of the element "status" is equal to "DRAFT"
      And the "page_content_selector" element is displayed
      And the text of the element "add_slot_button" is equal to "Add"
      And the text of the element "plus_add_version_button" is equal to "+ ADD NEW VERSION"
      And the "page_preview" element is displayed
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "save_and_publish_button" is equal to "Save and publish"
      And I click on the "page_content_selector" button
      And waits until the elements in the "page_content_list" list have text
      And the element in "0" position in the "page_content_list" list with "Markdown section" text is displayed
      And the element in "1" position in the "page_content_list" list with "Action section" text is displayed
      And the element in "2" position in the "page_content_list" list with "Image section" text is displayed
      And the element in "3" position in the "page_content_list" list with "Feedback icon section" text is displayed
      And the element in "4" position in the "page_content_list" list with "Banner card section" text is displayed
      And the element in "5" position in the "page_content_list" list with "Empty case section" text is displayed
      And the element in "6" position in the "page_content_list" list with "Row List section" text is displayed
      And the element in "7" position in the "page_content_list" list with "Heading" text is displayed

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191893 |
          | o2uk    | 13.1 | QANOV-191894 |
          | moves   | 13.1 | QANOV-191895 |
          | blaude  | 13.9 | QANOV-191896 |
          | o2de    | 24.1 | QANOV-191897 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.3 @manual @regression @web
  Scenario Outline: A user can add a Heading section to a "<content>" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "<content>" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Heading" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "Title 1" value from "heading_preset_selector" field
      And I select the "Heading 1" value from "heading_level_selector" field
      And I fill in the "heading_title_input" field with "test title"
      And I click on the "close_button" button
      And the "Confirm Discard Popup" page is loaded
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded

    Examples:
          | product | content            | jira_id      |
          | vivobr  | Page               | QANOV-620431 |
          | vivobr  | Embeddable content | QANOV-620432 |
          | vivobr  | Slideshow          | QANOV-620433 |
          | o2uk    | Page               | QANOV-620434 |
          | o2uk    | Embeddable content | QANOV-620435 |
          | o2uk    | Slideshow          | QANOV-620436 |
          | moves   | Page               | QANOV-620437 |
          | moves   | Embeddable content | QANOV-620438 |
          | moves   | Slideshow          | QANOV-620439 |
          | blaude  | Page               | QANOV-620440 |
          | blaude  | Embeddable content | QANOV-620441 |
          | blaude  | Slideshow          | QANOV-620442 |
          | o2de    | Page               | QANOV-620443 |
          | o2de    | Embeddable content | QANOV-620444 |
          | o2de    | Slideshow          | QANOV-620445 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add a Markdown section to a "<content>" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "<content>" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "markdown_text" field with text using the commands bar
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | content            | jira_id      |
          | vivobr  | 13.1 | Page               | QANOV-191898 |
          | vivobr  | 13.1 | Terms & Conditions | QANOV-191899 |
          | o2uk    | 13.1 | Page               | QANOV-191900 |
          | o2uk    | 13.1 | Terms & Conditions | QANOV-191901 |
          | moves   | 13.1 | Page               | QANOV-191902 |
          | moves   | 13.1 | Terms & Conditions | QANOV-191903 |
          | blaude  | 13.9 | Page               | QANOV-191904 |
          | blaude  | 13.9 | Terms & Conditions | QANOV-191905 |
          | o2de    | 24.1 | Page               | QANOV-191906 |
          | o2de    | 24.1 | Terms & Conditions | QANOV-191907 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add a Markdown section to a "Embeddable content" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "markdown_text" field with text using the commands bar
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191908 |
          | o2uk    | 13.1 | QANOV-191909 |
          | moves   | 13.1 | QANOV-191910 |
          | blaude  | 13.9 | QANOV-191911 |
          | o2de    | 24.1 | QANOV-191912 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can add a Markdown section to a "Slideshow" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "markdown_text" field with text using the commands bar
      And I click on the "close_button" button
      And the "Confirm Discard Popup" page is loaded
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597173 |
          | o2uk    | QANOV-597174 |
          | moves   | QANOV-597175 |
          | blaude  | QANOV-597176 |
          | o2de    | QANOV-597177 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add an Action section to a "<content>" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "<content>" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Action section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "any" value from "representation_selector" field
      And I fill in the "text_input" field with "test"
      And I fill in the "url_input" field with "www.google.com"
      And I click on the "add_tracking_button" button
      And I fill in the "category_input" field with "test category"
      And I fill in the "action_input" field with "test action"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | content            | jira_id      |
          | vivobr  | 13.1 | Page               | QANOV-191913 |
          | vivobr  | 13.1 | Terms & Conditions | QANOV-191914 |
          | o2uk    | 13.1 | Page               | QANOV-191915 |
          | o2uk    | 13.1 | Terms & Conditions | QANOV-191916 |
          | moves   | 13.1 | Page               | QANOV-191917 |
          | moves   | 13.1 | Terms & Conditions | QANOV-191918 |
          | blaude  | 13.9 | Page               | QANOV-191919 |
          | blaude  | 13.9 | Terms & Conditions | QANOV-191920 |
          | o2de    | 24.1 | Page               | QANOV-191921 |
          | o2de    | 24.1 | Terms & Conditions | QANOV-191922 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add an Action section to a "Embeddable content" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Action section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "any" value from "representation_selector" field
      And I fill in the "text_input" field with "test"
      And I fill in the "url_input" field with "www.google.com"
      And I click on the "add_tracking_button" button
      And I fill in the "category_input" field with "test category"
      And I fill in the "action_input" field with "test action"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191923 |
          | o2uk    | 13.1 | QANOV-191924 |
          | moves   | 13.1 | QANOV-191925 |
          | blaude  | 13.9 | QANOV-191926 |
          | o2de    | 24.1 | QANOV-191927 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can add an Action section to a "Slideshow" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Action section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "any" value from "representation_selector" field
      And I fill in the "text_input" field with "test"
      And I fill in the "url_input" field with "www.google.com"
      And I click on the "close_button" button
      And the "Confirm Discard Popup" page is loaded
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597178 |
          | o2uk    | QANOV-597179 |
          | moves   | QANOV-597180 |
          | blaude  | QANOV-597181 |
          | o2de    | QANOV-597182 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add an Image section to a "<content>" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "<content>" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Image section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "mobile_light_icon_add_link" field with file path "resources/cms/boltons.svg"
      And I fill in the "mobile_dark_icon_add_link" field with file path "resources/cms/boltons_dark.svg"
      And I fill in the "alternative_text_input" field with "test"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | content            | jira_id      |
          | vivobr  | 13.1 | Page               | QANOV-191928 |
          | vivobr  | 13.1 | Terms & Conditions | QANOV-191929 |
          | o2uk    | 13.1 | Page               | QANOV-191930 |
          | o2uk    | 13.1 | Terms & Conditions | QANOV-191931 |
          | moves   | 13.1 | Page               | QANOV-191932 |
          | moves   | 13.1 | Terms & Conditions | QANOV-191933 |
          | blaude  | 13.9 | Page               | QANOV-191934 |
          | blaude  | 13.9 | Terms & Conditions | QANOV-191935 |
          | o2de    | 24.1 | Page               | QANOV-191936 |
          | o2de    | 24.1 | Terms & Conditions | QANOV-191937 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add an Image section to a "Embeddable content" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Image section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "mobile_light_icon_add_link" field with file path "resources/cms/boltons.svg"
      And I fill in the "mobile_dark_icon_add_link" field with file path "resources/cms/boltons_dark.svg"
      And I fill in the "alternative_text_input" field with "test"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191938 |
          | o2uk    | 13.1 | QANOV-191939 |
          | moves   | 13.1 | QANOV-191940 |
          | blaude  | 13.9 | QANOV-191941 |
          | o2de    | 24.1 | QANOV-191942 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can add an Image section to a "Slideshow" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Image section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "mobile_light_icon_add_link" field with file path "resources/cms/boltons.svg"
      And I fill in the "mobile_dark_icon_add_link" field with file path "resources/cms/boltons_dark.svg"
      And I fill in the "alternative_text_input" field with "test"
      And I click on the "close_button" button
      And the "Confirm Discard Popup" page is loaded
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597183 |
          | o2uk    | QANOV-597184 |
          | moves   | QANOV-597186 |
          | blaude  | QANOV-597187 |
          | o2de    | QANOV-597188 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add a Feedback icon section to a "Page" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Page" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Feedback icon section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "Success" value from "icon_selector" field
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191943 |
          | o2uk    | 13.1 | QANOV-191944 |
          | moves   | 13.1 | QANOV-191945 |
          | blaude  | 13.9 | QANOV-191946 |
          | o2de    | 24.1 | QANOV-191947 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add a Feedback icon section to a "Embeddable content" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Feedback icon section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "Success" value from "icon_selector" field
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191948 |
          | o2uk    | 13.1 | QANOV-191949 |
          | moves   | 13.1 | QANOV-191950 |
          | blaude  | 13.9 | QANOV-191951 |
          | o2de    | 24.1 | QANOV-191952 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can add a Feedback icon section to a "Slideshow" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Feedback icon section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "Success" value from "icon_selector" field
      And I click on the "close_button" button
      And the "Confirm Discard Popup" page is loaded
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597189 |
          | o2uk    | QANOV-597190 |
          | moves   | QANOV-597191 |
          | blaude  | QANOV-597192 |
          | o2de    | QANOV-597193 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add a Banner card section to a "Embeddable" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Banner card section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "title_input" field with "test"
      And I fill in the "action_input" field with "test"
      And I fill in the "action_url" field with "www.google.com"
      And I fill in the "light_icon_add_link" field with file path "resources/cms/boltons.svg"
      And I fill in the "dark_icon_add_link" field with file path "resources/cms/boltons_dark.svg"
      And I click on the "add_tracking_button" button
      And I fill in the "category_input" field with "test category"
      And I fill in the "action_input" field with "test action"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191953 |
          | o2uk    | 13.1 | QANOV-191954 |
          | moves   | 13.1 | QANOV-191955 |
          | blaude  | 13.9 | QANOV-191956 |
          | o2de    | 24.1 | QANOV-191957 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add an Empty case section to a "Embeddable" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Empty case section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "title_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I fill in the "action_label_input" field with "test"
      And I fill in the "action_url_input" field with "www.google.com"
      And I fill in the "light_icon_add_link" field with file path "resources/cms/boltons.svg"
      And I fill in the "dark_icon_add_link" field with file path "resources/cms/boltons_dark.svg"
      And I select the "Small" value from "image_size_selector" field
      And I click on the "add_tracking_button" button
      And I fill in the "category_input" field with "test category"
      And I fill in the "action_input" field with "test action"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191958 |
          | o2uk    | 13.1 | QANOV-191959 |
          | moves   | 13.1 | QANOV-191960 |
          | blaude  | 13.9 | QANOV-191961 |
          | o2de    | 24.1 | QANOV-191962 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add a Row List section to a "Page" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Page" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Row List section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "title_input" field with "title row1"
      And I fill in the "subtitle_input" field with "subtitle row1"
      And I click on the "icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" element
      And I click on the "add_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "url_input" field with "url row1"
      And I click on the "add_item" button
      And I fill in the "title_input" field with "title row2"
      And I fill in the "subtitle_input" field with "subtitle row2"
      And I click on the "icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" element
      And I click on the "add_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "url_input" field with "url row2"
      And I click on the "add_tracking_button" button
      And I fill in the "category_input" field with "test category"
      And I fill in the "action_input" field with "test action"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.4 | QANOV-228437 |
          | o2uk    | 13.4 | QANOV-228438 |
          | moves   | 13.4 | QANOV-228439 |
          | blaude  | 13.9 | QANOV-228440 |
          | o2de    | 24.1 | QANOV-228441 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add a Row List section to a "Embeddable content" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Row List section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "title_input" field with "title row1"
      And I fill in the "subtitle_input" field with "subtitle row1"
      And I click on the "icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" element
      And I click on the "add_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "url_input" field with "url row1"
      And I click on the "add_item" button
      And I fill in the "title_input" field with "title row2"
      And I fill in the "subtitle_input" field with "subtitle row2"
      And I click on the "icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" element
      And I click on the "add_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "url_input" field with "url row2"
      And I click on the "add_tracking_button" button
      And I fill in the "category_input" field with "test category"
      And I fill in the "action_input" field with "test action"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.4 | QANOV-228442 |
          | o2uk    | 13.4 | QANOV-228443 |
          | moves   | 13.4 | QANOV-228444 |
          | blaude  | 13.9 | QANOV-228445 |
          | o2de    | 24.1 | QANOV-228446 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can add a Row List section to a "Slideshow" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Row List section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "title_input" field with "title row1"
      And I fill in the "subtitle_input" field with "subtitle row1"
      And I click on the "icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" element
      And I click on the "add_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "url_input" field with "url row1"
      And I click on the "add_item" button
      And I fill in the "title_input" field with "title row2"
      And I fill in the "subtitle_input" field with "subtitle row2"
      And I click on the "icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" element
      And I click on the "add_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "url_input" field with "url row2"
      And I click on the "close_button" button
      And the "Confirm Discard Popup" page is loaded
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597194 |
          | o2uk    | QANOV-597195 |
          | moves   | QANOV-597196 |
          | blaude  | QANOV-597197 |
          | o2de    | QANOV-597199 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @manual @regression @web
  Scenario Outline: A user can add a Space section to a "<content>" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "<content>" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Space" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | content            | jira_id      |
          | vivobr  | Page               | QANOV-603255 |
          | vivobr  | Embeddable content | QANOV-603256 |
          | o2uk    | Page               | QANOV-603257 |
          | o2uk    | Embeddable content | QANOV-603258 |
          | moves   | Page               | QANOV-603259 |
          | moves   | Embeddable content | QANOV-603260 |
          | blaude  | Page               | QANOV-603261 |
          | blaude  | Embeddable content | QANOV-603262 |
          | o2de    | Page               | QANOV-603263 |
          | o2de    | Embeddable content | QANOV-603264 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can add a Space section to a "Slideshow" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Space" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "M" value from "space_list_select" field
      And I click on the "close_button" button
      And the "Confirm Discard Popup" page is loaded
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597200 |
          | o2uk    | QANOV-597201 |
          | moves   | QANOV-597202 |
          | blaude  | QANOV-597203 |
          | o2de    | QANOV-597204 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add several sections to a "<content>" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "<content>" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"
      And the sections are displayed in the page preview

    Examples:
          | product | cv   | content            | jira_id      |
          | vivobr  | 13.1 | Page               | QANOV-191963 |
          | vivobr  | 13.1 | Terms & Conditions | QANOV-191964 |
          | o2uk    | 13.1 | Page               | QANOV-191965 |
          | o2uk    | 13.1 | Terms & Conditions | QANOV-191966 |
          | moves   | 13.1 | Page               | QANOV-191967 |
          | moves   | 13.1 | Terms & Conditions | QANOV-191968 |
          | blaude  | 13.9 | Page               | QANOV-191969 |
          | blaude  | 13.9 | Terms & Conditions | QANOV-191970 |
          | o2de    | 24.1 | Page               | QANOV-191971 |
          | o2de    | 24.1 | Terms & Conditions | QANOV-191972 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add several sections to a "Embeddable content" Dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"
      And the sections are displayed in the page preview

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191973 |
          | o2uk    | 13.1 | QANOV-191974 |
          | moves   | 13.1 | QANOV-191975 |
          | blaude  | 13.9 | QANOV-191976 |
          | o2de    | 24.1 | QANOV-191977 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @smoke @web
  Scenario Outline: A user can save and publish a dynamic content of type "Page"
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-page"
      And I fill in the "description_input" field with "test"
      And I select the "Page" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Variant 'Version 1' saved & published successfully"
      And the text of the element "pause_button" is equal to "Pause"

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191978 |
          | o2uk    | 13.1 | QANOV-191979 |
          | moves   | 13.1 | QANOV-191980 |
          | blaude  | 13.9 | QANOV-191981 |
          | o2de    | 24.1 | QANOV-191982 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @smoke @web
  Scenario Outline: A user can save and publish a dynamic content of type "Banner"
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-banner"
      And I fill in the "description_input" field with "test"
      And I select the "Banner" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I fill in the "action_label_input" field with "test"
      And I fill in the "action_url_input" field with "www.google.com"
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Variant 'Version 1' saved & published successfully"
      And the text of the element "pause_button" is equal to "Pause"

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191983 |
          | o2uk    | 13.1 | QANOV-191984 |
          | moves   | 13.1 | QANOV-191985 |
          | blaude  | 13.9 | QANOV-191986 |
          | o2de    | 24.1 | QANOV-191987 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @smoke @web
  Scenario Outline: A user can save and publish a dynamic content of type "Empty case"
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-empty-case"
      And I fill in the "description_input" field with "test"
      And I select the "Empty case" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I fill in the "action_label_input" field with "test"
      And I fill in the "action_url_input" field with "www.google.com"
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Variant 'Version 1' saved & published successfully"
      And the text of the element "pause_button" is equal to "Pause"

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191988 |
          | o2uk    | 13.1 | QANOV-191989 |
          | moves   | 13.1 | QANOV-191990 |
          | blaude  | 13.9 | QANOV-191991 |
          | o2de    | 24.1 | QANOV-191992 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @smoke @web
  Scenario Outline: A user can save and publish a dynamic content of type "Terms & conditions"
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-terms"
      And I fill in the "description_input" field with "test"
      And I select the "Terms and conditions" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I fill in the "title_input" field with "test"
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Variant 'Version 1' saved & published successfully"
      And the text of the element "pause_button" is equal to "Pause"

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191993 |
          | o2uk    | 13.1 | QANOV-191994 |
          | moves   | 13.1 | QANOV-191995 |
          | blaude  | 13.9 | QANOV-191996 |
          | o2de    | 24.1 | QANOV-191997 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @smoke @web
  Scenario Outline: A user can save and publish a dynamic content of type "Embeddable content"
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-embeddable"
      And I fill in the "description_input" field with "test"
      And I select the "Embeddable Content" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Variant 'Version 1' saved & published successfully"
      And the text of the element "pause_button" is equal to "Pause"

    @automatic @ber @qa
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-191998 |
          | o2uk    | 13.1 | QANOV-191999 |
          | moves   | 13.1 | QANOV-192000 |
          | blaude  | 13.9 | QANOV-192001 |
          | o2de    | 24.1 | QANOV-192002 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-554878 @manual @smoke @web
  Scenario Outline: A user can save and publish a dynamic content of type "Slideshow" with a buttom primary
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-slidehow"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "button_primary_radio" button
      And I fill in the "final_action_input" field with "action"
      And I click on the "save" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save_publish_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Dynamic content published"
      And the element in "0" position of the "dynamic_content_list" list has the "name" field with "[CONF:cms.dynamic_content_name_prefix]-slidehow" text
      And the element in "0" position of the "dynamic_content_list" list has the "status" field with "Published" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597205 |
          | o2uk    | QANOV-597206 |
          | moves   | QANOV-597207 |
          | blaude  | QANOV-597208 |
          | o2de    | QANOV-597209 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-554878 @regression @web
  Scenario Outline: A user can save and publish a dynamic content of type "Slideshow" with a buttom primary and a link
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-slidehow"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "button_primary_link_radio" button
      And I fill in the "final_action_input" field with "action"
      And I fill in the "final_action_link_input" field with "action link"
      And I click on the "save" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save_publish_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Dynamic content published"
      And the element in "0" position of the "dynamic_content_list" list has the "name" field with "[CONF:cms.dynamic_content_name_prefix]-slidehow" text
      And the element in "0" position of the "dynamic_content_list" list has the "status" field with "Published" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597210 |
          | o2uk    | QANOV-597211 |
          | moves   | QANOV-597212 |
          | blaude  | QANOV-597213 |
          | o2de    | QANOV-597214 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-554878 @regression @web
  Scenario Outline: A user can save and publish a dynamic content of type "Slideshow" with Links and several pages
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-slidehow"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "links_radio" button
      And I click on the "add_page_button" button
      And I click on the "0" element in the "pages_tab_list" list
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "markdown_text" field with text using the commands bar
      And I click on the "1" element in the "pages_tab_list" list
      And I select the "Markdown section" value from "page_content_selector" field
      And I click on the "add_slot_button" button
      And I fill in the "markdown_text" field with text using the commands bar
      And I fill in the "final_action_input" field with "action"
      And I click on the "save" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save_publish_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Dynamic content published"
      And the element in "0" position of the "dynamic_content_list" list has the "name" field with "[CONF:cms.dynamic_content_name_prefix]-slidehow" text
      And the element in "0" position of the "dynamic_content_list" list has the "status" field with "Published" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597215 |
          | o2uk    | QANOV-597216 |
          | moves   | QANOV-597217 |
          | blaude  | QANOV-597218 |
          | o2de    | QANOV-597219 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-554878 @smoke @web
  Scenario Outline: A user can save as draft a dynamic content of type "Slideshow" with a buttom primary
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "[CONF:cms.dynamic_content_name_prefix]-slidehow"
      And I fill in the "description_input" field with "test"
      And I select the "Slideshow" value from "content_representation_selector" field
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "button_primary_radio" button
      And I fill in the "final_action_input" field with "action"
      And I click on the "save" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save_draft_button" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Dynamic content published"
      And the element in "0" position of the "dynamic_content_list" list has the "name" field with "[CONF:cms.dynamic_content_name_prefix]-slidehow" text
      And the element in "0" position of the "dynamic_content_list" list has the "status" field with "Pending publication" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597220 |
          | o2uk    | QANOV-597221 |
          | moves   | QANOV-597222 |
          | blaude  | QANOV-597223 |
          | o2de    | QANOV-597224 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can unpublish a dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are dynamic contents in "PUBLISHED" status configured in CMS
      And the dynamic content has "1" version
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "pause_button" button
      And I click on the "popup.accept" button
     Then the text of the element "confirm_message" is equal to "Variant 'Version 1' unpublished successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-192003 |
          | o2uk    | 13.1 | QANOV-192004 |
          | moves   | 13.1 | QANOV-192005 |
          | blaude  | 13.9 | QANOV-192006 |
          | o2de    | 24.1 | QANOV-192007 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can save and publish a new version
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are dynamic contents in "any" status configured in CMS
      And the dynamic content has "1" version
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "add_version_button" button
      And the "Create Version" page is displayed
      And I fill in the "version_name" field with "Last"
      And I click on the "add_version_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Dynamic Content Edition" page is loaded
      And the text of the element "confirm_message" is equal to "Variant 'Version Last' saved & published successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-192008 |
          | o2uk    | 13.1 | QANOV-192009 |
          | moves   | 13.1 | QANOV-192010 |
          | blaude  | 13.9 | QANOV-192011 |
          | o2de    | 24.1 | QANOV-192012 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can unpublish a particular version
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are dynamic contents in "any" status configured in CMS
      And the dynamic content has ">1" version
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "version_2" button
      And I click on the "unpublish_button" button
     Then the text of the element "confirm_message" contains "unpublished successfully"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-192013 |
          | o2uk    | 13.1 | QANOV-192014 |
          | moves   | 13.1 | QANOV-192015 |
          | blaude  | 13.9 | QANOV-192016 |
          | o2de    | 24.1 | QANOV-192017 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add one action to a "<content>" dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "<content>" value from "content_representation_selector" field
      And I click on the "continue_button" button
     Then the "Dynamic Content Edition" page is loaded
      And I click on the "1" element in the "actions_list" list
      And I fill in the "action1_input" field with "test"
      And I fill in the "url1_input" field with "www.google.com"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | content            | jira_id      |
          | vivobr  | 13.1 | Page               | QANOV-192018 |
          | vivobr  | 13.1 | Terms & Conditions | QANOV-192019 |
          | o2uk    | 13.1 | Page               | QANOV-192020 |
          | o2uk    | 13.1 | Terms & Conditions | QANOV-192021 |
          | moves   | 13.1 | Page               | QANOV-192022 |
          | moves   | 13.1 | Terms & Conditions | QANOV-192023 |
          | blaude  | 13.9 | Page               | QANOV-192024 |
          | blaude  | 13.9 | Terms & Conditions | QANOV-192025 |
          | o2de    | 24.1 | Page               | QANOV-192026 |
          | o2de    | 24.1 | Terms & Conditions | QANOV-192027 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @manual @regression @web
  Scenario Outline: A user can add two actions to a "<content>" dynamic content
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the "create_button" button
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "name_input" field with "test"
      And I fill in the "description_input" field with "test"
      And I select the "<content>" value from "content_representation_selector" field
      And I click on the "continue_button" button
     Then the "Dynamic Content Edition" page is loaded
      And I click on the "2" element in the "actions_list" list
      And I fill in the "action1_input" field with "test"
      And I fill in the "url1_input" field with "www.google.com"
      And I fill in the "action2_input" field with "test"
      And I fill in the "url2_input" field with "www.google.com"
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Dynamic Content Edition" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content updated successfully"

    Examples:
          | product | cv   | content            | jira_id      |
          | vivobr  | 13.1 | Page               | QANOV-192028 |
          | vivobr  | 13.1 | Terms & Conditions | QANOV-192029 |
          | o2uk    | 13.1 | Page               | QANOV-192030 |
          | o2uk    | 13.1 | Terms & Conditions | QANOV-192031 |
          | moves   | 13.1 | Page               | QANOV-192032 |
          | moves   | 13.1 | Terms & Conditions | QANOV-192033 |
          | blaude  | 13.9 | Page               | QANOV-192034 |
          | blaude  | 13.9 | Terms & Conditions | QANOV-192035 |
          | o2de    | 24.1 | Page               | QANOV-192036 |
          | o2de    | 24.1 | Terms & Conditions | QANOV-192037 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can edit a dynamic content in DRAFT status and save it as draft
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is a dynamic content in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "description_input" field with "description updated"
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save_draft_button" button
      And the "Dynamic Contents" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content saved as draft"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-192038 |
          | o2uk    | 13.1 | QANOV-192039 |
          | moves   | 13.1 | QANOV-192040 |
          | blaude  | 13.9 | QANOV-192041 |
          | o2de    | 24.1 | QANOV-192042 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can edit a dynamic content in DRAFT status and publish it
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is a dynamic content in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "description_input" field with "description updated"
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save_publish_button" button
      And the "Dynamic Contents" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content published"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597226 |
          | o2uk    | QANOV-597227 |
          | moves   | QANOV-597228 |
          | blaude  | QANOV-597229 |
          | o2de    | QANOV-597230 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can edit a dynamic content in PUBLISHED status and save it
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is a dynamic content in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "description_input" field with "description updated"
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save" button
     Then the "Dynamic Contents" page is loaded
      And the text of the element "confirm_message" contains "Dynamic content published"

    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.1 | QANOV-192043 |
          | o2uk    | 13.1 | QANOV-192044 |
          | moves   | 13.1 | QANOV-192045 |
          | blaude  | 13.9 | QANOV-192046 |
          | o2de    | 24.1 | QANOV-192047 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can edit a dynamic content in PUBLISHED status and cancel it
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is a dynamic content in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "description_input" field with "description updated"
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "cancel" button
     Then the "Dynamic Content Edition" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-597231 |
          | o2uk    | QANOV-597232 |
          | moves   | QANOV-597233 |
          | blaude  | QANOV-597234 |
          | o2de    | QANOV-597235 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can edit a dynamic content in PAUSED status and save it
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is a dynamic content in "PAUSED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "description_input" field with "description updated"
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save_button" button
      And the "Dynamic Contents" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content saved"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-192038 |
          | o2uk    | QANOV-192039 |
          | moves   | QANOV-192040 |
          | blaude  | QANOV-192041 |
          | o2de    | QANOV-192042 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: A user can edit a dynamic content in PAUSED status and publish it
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is a dynamic content in "PAUSED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.dynamic_content]" web page
      And the "Dynamic Contents" page is loaded
      And I click on the configured dynamic content
      And the "Dynamic Content Overview" page is loaded
      And I fill in the "description_input" field with "description updated"
      And I click on the "continue_button" button
      And the "Dynamic Content Edition" page is loaded
      And I click on the "save_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "save_publish_button" button
      And the "Dynamic Contents" page is loaded
     Then the text of the element "confirm_message" is equal to "Dynamic content published"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-192038 |
          | o2uk    | QANOV-192039 |
          | moves   | QANOV-192040 |
          | blaude  | QANOV-192041 |
          | o2de    | QANOV-192042 |
