# -*- coding: utf-8 -*-
@jira.QANOV-107934 @not_hardening
Feature: Entrypoints management

  Actions After the Feature:
    Given the configured entrypoints with "[CONF:cms.entrypoint_name]" name in CMS are deleted


  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can access to the Entrypoint Management page without entrypoints created
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "0" entrypoints configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoints Management" page is loaded
     Then the text of the element "title" is equal to "Entrypoints"
      And the text of the element "create_entrypoint" is equal to "Create entrypoint"
      And the text of the element "manage_lists" is equal to "Manage lists"
      And the "filter_by_text" element is displayed
      And the "filter_by_entrypoints_usage" element is displayed
      And the "entrypoints_list" list of elements is not displayed
      And the text of the element "empty_case_title" is equal to "Create your first Entrypoint"
      And the text of the element "empty_case_description" is equal to "Click on the "Create entrypoint" button to start"
      And the text of the element "empty_case_button" is equal to "Create entrypoint"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153496 |
          | o2uk    | 12.7    | QANOV-153497 |
          | moves   | 12.7    | QANOV-153498 |
          | blaude  | 13.9    | QANOV-273996 |
          | o2de    | 24.1    | QANOV-579943 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @sanity @web
  Scenario Outline: A user can access to the Entrypoint Management page with entrypoints already created
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_list" list is stable
     Then the text of the element "title" is equal to "Entrypoints"
      And the text of the element "create_entrypoint" is equal to "Create entrypoint"
      And the text of the element "manage_lists" is equal to "Manage lists"
      And the "filter_by_text" element is displayed
      And the "filter_by_entrypoints_usage" element is displayed
      And the "entrypoints_list" list of elements is displayed
      And each item in the "entrypoints_list" list has the "internal_name" field
      And each item in the "entrypoints_list" list has the "display_item" field
      And each item in the "entrypoints_list" list has the "audiences" field
      And each item in the "entrypoints_list" list has the "state" field

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107935 |
          | o2uk    | 12.7    | QANOV-146386 |
          | moves   | 12.7    | QANOV-146387 |
          | blaude  | 13.9    | QANOV-273997 |
          | o2de    | 24.1    | QANOV-579945 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can access to the screen to create an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
     Then the "Entrypoint Overview" page is loaded
      And the text of the element "title" is equal to "Create entrypoint"
      And the "entrypoint_internal_name_input" element is displayed
      And the "entrypoint_id_input" element is displayed
      And the "entrypoint_defined_by_cms_radio" element is displayed
      And the "entrypoint_preconfigured_radio" element is displayed
      And the text of the element "continue_button" is equal to "Continue"
      And the text of the element "close_button" is equal to "Close"

    Examples:
          | product | version | jira_id      |
          | o2uk    | 12.7    | QANOV-146392 |
          | moves   | 12.7    | QANOV-146393 |
          | vivobr  | 12.7    | QANOV-107938 |
          | blaude  | 13.9    | QANOV-273998 |
          | o2de    | 24.1    | QANOV-579946 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can discard to create a new entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I click on the "close_button" button
     Then the "Entrypoint Management" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154198 |
          | o2uk    | 12.7    | QANOV-154199 |
          | moves   | 12.7    | QANOV-154200 |
          | blaude  | 13.9    | QANOV-273999 |
          | o2de    | 24.1    | QANOV-579947 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can select to create a preconfigured entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I click on the "entrypoint_preconfigured_radio" element
     Then the "entrypoint_preconfigured_selector" element is displayed

    Examples:
          | product | version | jira_id      |
          | o2uk    | 12.7    | QANOV-153500 |
          | moves   | 12.7    | QANOV-153501 |
          | vivobr  | 12.7    | QANOV-153499 |
          | blaude  | 13.9    | QANOV-274000 |
          | o2de    | 24.1    | QANOV-579949 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user cannot create a manual entrypoint without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I click on the "continue_button" button
     Then the text of the element "entrypoint_internal_name_error" is equal to "This field is required"
      And the "entrypoint_id_input" element is disabled

    Examples:
          | product | version | jira_id      |
          | o2uk    | 12.7    | QANOV-154229 |
          | moves   | 12.7    | QANOV-154230 |
          | vivobr  | 12.7    | QANOV-154228 |
          | blaude  | 13.9    | QANOV-274001 |
          | o2de    | 24.1    | QANOV-579950 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @jira.link.detects.CMS-2917 @qa @regression @web
  Scenario Outline: The entrypoint internal id is satinized when the internal name contains special characters
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "test#qa"
     Then the text of the element "entrypoint_id_input" is equal to "testqa"

    Examples:
          | product | version | jira_id      |
          | o2uk    | 12.7    | QANOV-154232 |
          | moves   | 12.7    | QANOV-154233 |
          | vivobr  | 12.7    | QANOV-154231 |
          | blaude  | 13.9    | QANOV-274002 |
          | o2de    | 24.1    | QANOV-579951 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user cannot create a preconfigured entrypoint without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I click on the "entrypoint_preconfigured_radio" element
      And I click on the "continue_button" button
     Then the text of the element "entrypoint_internal_name_error" is equal to "This field is required"
      And the "entrypoint_id_input" element is disabled
      And the text of the element "entrypoint_preconfigured_error" is equal to "This field is required"

    Examples:
          | product | version | jira_id      |
          | o2uk    | 13.2    | QANOV-195349 |
          | moves   | 13.2    | QANOV-195350 |
          | vivobr  | 13.2    | QANOV-195351 |
          | blaude  | 13.9    | QANOV-274003 |
          | o2de    | 24.1    | QANOV-579952 |

  @jira.QANOV-195352 @automatic @ber @e2e @jira.cv.13.2 @o2uk @qa @smoke @web
  Scenario: A UK user can access to the second step of the entrypoint creation (Content) after having selected an entrypoint defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
     Then the "Entrypoint Content" page is loaded
      And the "entrypoint_display_text_input" element is displayed
      And the text of the element "light_icon_title" contains "Light mode"
      And the "light_icon_add_button" element is displayed
      And the text of the element "dark_icon_title" is equal to "Dark mode (optional)"
      And the "dark_icon_add_button" element is displayed
      And the "add_url_button" element is displayed
      And the "continue_button" element is displayed
      And the "back_button" element is displayed
      And the "close_button" element is displayed

  @jira.QANOV-195353 @automatic @ber @e2e @jira.cv.13.2 @moves @qa @smoke @web
  Scenario: A Moves user can access to the second step of the entrypoint creation (Content) after having selected an entrypoint defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
     Then the "Entrypoint Content" page is loaded
      And the "entrypoint_display_text_input" element is displayed
      And the text of the element "light_icon_title" is equal to "Light mode (optional)"
      And the "light_icon_add_button" element is displayed
      And the text of the element "dark_icon_title" is equal to "Dark mode (optional)"
      And the "dark_icon_add_button" element is displayed
      And the "add_url_button" element is displayed
      And the "continue_button" element is displayed
      And the "back_button" element is displayed
      And the "close_button" element is displayed

  @jira.QANOV-195354 @automatic @ber @e2e @jira.cv.13.2 @jira.link.detects.CMS-2278 @qa @smoke @vivobr @web
  Scenario: A VIVO user can access to the second step of the entrypoint creation (Content) after having selected an entrypoint defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
     Then the "Entrypoint Content" page is loaded
      And the "entrypoint_display_text_input" element is displayed
      And the text of the element "light_icon_title" is equal to "Light mode (optional)"
      And the "light_icon_add_button" element is displayed
      And the text of the element "dark_icon_title" is equal to "Dark mode (optional)"
      And the "dark_icon_add_button" element is displayed
      And the "add_url_button" element is displayed
      And the "continue_button" element is displayed
      And the "back_button" element is displayed
      And the "close_button" element is displayed

  @jira.QANOV-195355 @automatic @ber @e2e @jira.cv.13.2 @o2uk @qa @smoke @web
  Scenario: A UK user can access to the second step of the entrypoint creation (Content) after having selected a preconfigured entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "entrypoint_preconfigured_radio" element
      And I click on the "entrypoint_preconfigured_selector" button
      And I click on the "entrypoint_preconfigured_selector_first_element" button
      And I click on the "continue_button" button
     Then the "Entrypoint Content" page is loaded
      And the "entrypoint_display_text_input" element is not displayed
      And the text of the element "light_icon_title" contains "Light mode"
      And the "light_icon_add_button" element is displayed
      And the text of the element "dark_icon_title" is equal to "Dark mode (optional)"
      And the "dark_icon_add_button" element is displayed
      And the "add_url_button" element is not displayed
      And the "continue_button" element is displayed
      And the "back_button" element is displayed
      And the "close_button" element is displayed

  @jira.QANOV-195356 @automatic @ber @e2e @jira.cv.13.2 @moves @qa @smoke @web
  Scenario: A Moves user can access to the second step of the entrypoint creation (Content) after having selected a preconfigured entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "entrypoint_preconfigured_radio" element
      And I click on the "entrypoint_preconfigured_selector" button
      And I click on the "entrypoint_preconfigured_selector_first_element" button
      And I click on the "continue_button" button
     Then the "Entrypoint Content" page is loaded
      And the "entrypoint_display_text_input" element is not displayed
      And the text of the element "light_icon_title" is equal to "Light mode (optional)"
      And the "light_icon_add_button" element is displayed
      And the text of the element "dark_icon_title" is equal to "Dark mode (optional)"
      And the "dark_icon_add_button" element is displayed
      And the "add_url_button" element is not displayed
      And the "continue_button" element is displayed
      And the "back_button" element is displayed
      And the "close_button" element is displayed

  @jira.QANOV-195357 @automatic @ber @e2e @jira.cv.13.2 @jira.link.detects.CMS-2278 @qa @smoke @vivobr @web
  Scenario: A VIVO user can access to the second step of the entrypoint creation (Content) after having selected a preconfigured entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "entrypoint_preconfigured_radio" element
      And I click on the "entrypoint_preconfigured_selector" button
      And I click on the "entrypoint_preconfigured_selector_first_element" button
      And I click on the "continue_button" button
     Then the "Entrypoint Content" page is loaded
      And the "entrypoint_display_text_input" element is not displayed
      And the text of the element "light_icon_title" is equal to "Light mode (optional)"
      And the "light_icon_add_button" element is displayed
      And the text of the element "dark_icon_title" is equal to "Dark mode (optional)"
      And the "dark_icon_add_button" element is displayed
      And the "add_url_button" element is not displayed
      And the "continue_button" element is displayed
      And the "back_button" element is displayed
      And the "close_button" element is displayed

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<cv> @qa @smoke @web
  Scenario Outline: A user can access to the second step of the entrypoint creation (Content) after having selected a preconfigured entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "entrypoint_preconfigured_radio" element
      And I click on the "entrypoint_preconfigured_selector" button
      And I click on the "entrypoint_preconfigured_selector_first_element" button
      And I click on the "continue_button" button
     Then the "Entrypoint Content" page is loaded
      And the "entrypoint_display_text_input" element is not displayed
      And the "add_url_button" element is not displayed
      And the "continue_button" element is displayed
      And the "back_button" element is displayed
      And the "close_button" element is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-274004 |
          | o2de    | 24.1 | QANOV-579953 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @regression @web
  Scenario Outline: A user can see the different options to upload a <mode_type> icon in an entrypoint
    The user has the option to add the icon from a library (from Mística) or add an SVG or PNG image from his computer.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "<mode_type>_icon_add_button" element
     Then the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And the text of the element "title" is equal to "Add icon"
      And the text of the element "upload_from_computer_link" is equal to "Upload from computer"
      And the "search_input" element is displayed
      And the "icons_list" element is displayed
      And the text of the element "cancel_button" is equal to "Cancel"
      And the text of the element "add_button" is equal to "Add"

    Examples:
          | product | mode_type | jira_id      |
          | o2uk    | light     | QANOV-167619 |
          | moves   | light     | QANOV-167620 |
          | o2uk    | dark      | QANOV-167622 |
          | moves   | dark      | QANOV-167623 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @jira.link.detects.CMS-1227 @qa @regression @web
  Scenario Outline: A user can upload a light icon from computer in an entrypoint (SVG format)
    The icon from my computer can be an SVG or PNG image.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons.svg"
      And the "Entrypoint Content" page is loaded
      And waits until the "light_icon" element is visible
     Then the "light_icon" element is displayed
      And the "light_icon_change_button" element is displayed
      And the "light_icon_remove_button" element is displayed
      And the "light_icon_add_button" element is not displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-153503 |
          | moves   | QANOV-153504 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @jira.link.detects.CMS-1227 @qa @regression @web
  Scenario Outline: A user can upload a light icon from computer in an entrypoint (PNG format)
    The icon from my computer can be an SVG or PNG image.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons.png"
      And the "Select Png Icon" page is loaded
      And I click on the "select_button" web button
      And the "Entrypoint Content" page is loaded
      And waits until the "light_icon" element is visible
     Then the "light_icon" element is displayed
      And the "light_icon_change_button" element is displayed
      And the "light_icon_remove_button" element is displayed
      And the "light_icon_add_button" element is not displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-167625 |
          | moves   | QANOV-167626 |

  @jira.QANOV-167628 @automatic @ber @e2e @jira.cv.12.7 @o2uk @qa @regression @web
  Scenario: A UK user can upload a light icon from a library
    If I add an icon from the gallery, then the icon for dark mode is autofilled with that same icon.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" web button
      And I click on the "add_button" web button
     Then the "Entrypoint Content" page is loaded
      And waits until the "light_icon" element is visible
      And the "light_icon" element is displayed
      And the "light_icon_change_button" element is displayed
      And the "light_icon_remove_button" element is displayed
      And the "light_icon_add_button" element is not displayed
      And waits until the "dark_icon" element is visible
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

  @jira.QANOV-167629 @automatic @ber @e2e @jira.cv.12.7 @moves @qa @regression @web
  Scenario: A Moves user can upload a light icon from a library
    If I add an icon from the gallery, then the icon for dark mode is autofilled with that same icon.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" web button
      And I click on the "add_button" web button
     Then the "Entrypoint Content" page is loaded
      And waits until the "light_icon" element is visible
      And the "light_icon" element is displayed
      And the "light_icon_change_button" element is displayed
      And the "light_icon_remove_button" element is displayed
      And the "light_icon_add_button" element is not displayed
      And waits until the "dark_icon" element is visible
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @regression @web
  Scenario Outline: A user can change a light icon in an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons.svg"
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_change_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" web button
      And I click on the "add_button" web button
     Then the "Entrypoint Content" page is loaded
      And waits until the "light_icon" element is visible
      And the "light_icon" element is displayed
      And the "light_icon_change_button" element is displayed
      And the "light_icon_remove_button" element is displayed
      And the "light_icon_add_button" element is not displayed
      And waits until the "dark_icon" element is visible
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-167631 |
          | moves   | QANOV-167632 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @regression @web
  Scenario Outline: A user can remove a light icon in an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons.svg"
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_remove_button" element
      And waits until the "light_icon" element is not visible
     Then the "light_icon" element is not displayed
      And the "light_icon_remove_button" element is not displayed
      And the "light_icon_change_button" element is not displayed
      And the "light_icon_add_button" element is displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-154202 |
          | moves   | QANOV-154203 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @regression @web
  Scenario Outline: A user can upload a dark icon from computer in an entrypoint (SVG format)
    The icon from my computer can be an SVG or PNG image.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "dark_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons_dark.svg"
      And the "Entrypoint Content" page is loaded
      And waits until the "dark_icon" element is visible
     Then the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-153506 |
          | moves   | QANOV-153507 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @regression @web
  Scenario Outline: A user can upload a dark icon from computer in an entrypoint (PNG format)
    The icon from my computer can be an SVG or PNG image.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "dark_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons_dark.png"
      And the "Select Png Icon" page is loaded
      And I click on the "select_button" web button
      And the "Entrypoint Content" page is loaded
      And waits until the "dark_icon" element is visible
     Then the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-167634 |
          | moves   | QANOV-167635 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @regression @web
  Scenario Outline: A <product> user can upload a dark icon from a library
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "dark_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" web button
      And I click on the "add_button" web button
     Then the "Entrypoint Content" page is loaded
      And waits until the "dark_icon" element is visible
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-167637 |
          | moves   | QANOV-167638 |

  @jira.QANOV-215982 @ber @e2e @jira.cv.13.3 @manual @moves @regression @web
  Scenario: A user can upload a dark icon from a library
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "dark_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" element
      And I click on the "add_button" web button
     Then the "Entrypoint Content" page is loaded
      And waits until the "dark_icon" element is visible
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed
      And the "light_icon_add_button" element is displayed

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @regression @web
  Scenario Outline: A user can change a dark icon in an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "dark_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons_dark.svg"
      And the "Entrypoint Content" page is loaded
      And I click on the "dark_icon_change_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I click on the "icons_list_first_element" web button
      And I click on the "add_button" web button
     Then the "Entrypoint Content" page is loaded
      And waits until the "dark_icon" element is visible
      And the "dark_icon" element is displayed
      And the "dark_icon_change_button" element is displayed
      And the "dark_icon_remove_button" element is displayed
      And the "dark_icon_add_button" element is not displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-167640 |
          | moves   | QANOV-167641 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @qa @regression @web
  Scenario Outline: A user can remove a dark icon in an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "dark_icon_add_button" button
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons_dark.svg"
      And the "Entrypoint Content" page is loaded
      And I click on the "dark_icon_remove_button" element
     Then the "dark_icon" element is not displayed
      And the "dark_icon_remove_button" element is not displayed
      And the "dark_icon_change_button" element is not displayed
      And the "dark_icon_add_button" element is displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-154205 |
          | moves   | QANOV-154206 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @jira.link.detects.CMS-3030 @qa @regression @web
  Scenario Outline: A user can access to "Add URL" screen in an entrypoint defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
     Then the "Add Url" page is loaded
      And the "url_type_selector" element is displayed
      And the text of the element "empty_case_description" is equal to "Create URL"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the text of the element "add_url_button" is equal to "Add URL"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153517 |
          | o2uk    | 12.7    | QANOV-153518 |
          | moves   | 12.7    | QANOV-153519 |
          | blaude  | 13.9    | QANOV-274009 |
          | o2de    | 24.1    | QANOV-579960 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can add a preconfigured url in an entrypoint defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "preconfigured" value from "url_type_selector" field
      And I click on the "url_fixed_selector" element
      And I click on the "url_fixed_selector_first_element" element
      And I click on the "add_url_button" web button
      And the "Entrypoint Content" page is loaded
     Then the "urls_list" list of elements is displayed
      And each item in the "urls_list" list has the "url_name" field
      And each item in the "urls_list" list has the "remove_icon" field
      And each item in the "urls_list" list has the "edit_icon" field
      And each element in the "urls_list" list has the "url_name" field that contains "Preconfigured URL data" text
      And the "empty_case_title" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107940 |
          | o2uk    | 12.7    | QANOV-146396 |
          | moves   | 12.7    | QANOV-146397 |
          | blaude  | 13.9    | QANOV-274010 |
          | o2de    | 24.1    | QANOV-579961 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user cannot add a preconfigured url in an entrypoint without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "preconfigured" value from "url_type_selector" field
      And I click on the "add_url_button" web button
     Then the text of the element "url_fixed_error" is equal to "This field is required"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154213 |
          | o2uk    | 12.7    | QANOV-154214 |
          | moves   | 12.7    | QANOV-154215 |
          | blaude  | 13.9    | QANOV-274011 |
          | o2de    | 24.1    | QANOV-579964 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can add a custom url in an entrypoint defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "full" value from "url_type_selector" field
      And I fill in the "custom_url_input" field with "https://google.com"
      And I click on the "add_url_button" web button
      And the "Entrypoint Content" page is loaded
     Then the "urls_list" list of elements is displayed
      And each item in the "urls_list" list has the "url_name" field
      And each item in the "urls_list" list has the "remove_icon" field
      And each item in the "urls_list" list has the "edit_icon" field
      And each element in the "urls_list" list has the "url_name" field that contains "Custom URL data" text
      And the "empty_case_title" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107941 |
          | o2uk    | 12.7    | QANOV-146398 |
          | moves   | 12.7    | QANOV-146399 |
          | blaude  | 13.9    | QANOV-274012 |
          | o2de    | 24.1    | QANOV-579966 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user cannot add a custom url in an entrypoint without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "full" value from "url_type_selector" field
      And I click on the "add_url_button" web button
     Then the text of the element "custom_url_error" is equal to "This field is required"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154216 |
          | o2uk    | 12.7    | QANOV-154217 |
          | moves   | 12.7    | QANOV-154218 |
          | blaude  | 13.9    | QANOV-274013 |
          | o2de    | 24.1    | QANOV-579968 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can see the details of a preconfigured url in an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "preconfigured" value from "url_type_selector" field
      And I click on the "url_fixed_selector" element
      And I click on the "url_fixed_selector_first_element" element
      And I click on the "add_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "edit_icon" field on the "0" element in the "urls_list" web list
     Then the "Add Url" page is loaded
      And the "url_fixed_selector" element is displayed
      And the "add_condition_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154219 |
          | o2uk    | 12.7    | QANOV-154220 |
          | moves   | 12.7    | QANOV-154221 |
          | blaude  | 13.9    | QANOV-274014 |
          | o2de    | 24.1    | QANOV-579970 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can see the details of a custom url in an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "full" value from "url_type_selector" field
      And I fill in the "custom_url_input" field with "https://google.com"
      And I click on the "add_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "edit_icon" field on the "any" element in the "urls_list" web list
     Then the "Add Url" page is loaded
      And the "custom_url_input" element is displayed
      And the "add_condition_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154222 |
          | o2uk    | 12.7    | QANOV-154223 |
          | moves   | 12.7    | QANOV-154224 |
          | blaude  | 13.9    | QANOV-274015 |
          | o2de    | 24.1    | QANOV-579971 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can remove an url in an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "preconfigured" value from "url_type_selector" field
      And I click on the "url_fixed_selector" element
      And I click on the "url_fixed_selector_first_element" element
      And I click on the "add_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "remove_icon" field on the "any" element in the "urls_list" web list
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is clickable
      And I click on the "accept" web button
     Then the "Entrypoint Content" page is loaded
      And the "urls_list" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154225 |
          | o2uk    | 12.7    | QANOV-154226 |
          | moves   | 12.7    | QANOV-154227 |
          | blaude  | 13.9    | QANOV-274016 |
          | o2de    | 24.1    | QANOV-579972 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.13.2 @qa @smoke @web
  Scenario Outline: A <product> user can access to the third step of the entrypoint creation (Preview) after having selected an entrypoint and adding an image defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I clear the "entrypoint_id_input" input value
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I fill in the "entrypoint_display_text_input" field with "Test"
      And I click on the "light_icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons.svg"
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "full" value from "url_type_selector" field
      And I fill in the "custom_url_input" field with "https://google.com"
      And I click on the "add_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
     Then the "Entrypoint Preview" page is loaded
      And the "close_button" element is displayed
      And the "save_draft_button" element is displayed
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "internal_name_value" is equal to "[CONF:cms.entrypoint_cms_name]"
      And the text of the element "display_text_value" is equal to "Test"
      And the text of the element "id_value" contains "[CONTEXT:cms_unique_id]"
      And the text of the element "url_value" contains "https://google.com"
      And the "create_test_button" element is displayed
      And the "back_button" element is displayed
      And the "save_and_publish_button" element is displayed

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-195358 |
          | moves   | QANOV-195359 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A <product> user can access to the third step of the entrypoint creation (Preview) after having selected an entrypoint defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I clear the "entrypoint_id_input" input value
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I fill in the "entrypoint_display_text_input" field with "Test"
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "full" value from "url_type_selector" field
      And I fill in the "custom_url_input" field with "https://google.com"
      And I click on the "add_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
     Then the "Entrypoint Preview" page is loaded
      And the "close_button" element is displayed
      And the "save_draft_button" element is displayed
      And the text of the element "summary" is equal to "Summary"
      And the text of the element "internal_name_value" is equal to "[CONF:cms.entrypoint_cms_name]"
      And the text of the element "display_text_value" is equal to "Test"
      And the text of the element "id_value" is equal to "[CONTEXT:cms_unique_id]"
      And the "create_test_button" element is displayed
      And the "back_button" element is displayed
      And the "save_and_publish_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 13.2    | QANOV-195360 |
          | blaude  | 13.9    | QANOV-274017 |
          | o2de    | 24.1    | QANOV-579974 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @jira.link.detects.CMS-1711 @qa @smoke @web
  Scenario Outline: A <product> user can save a new entrypoint with an image uploaded defined by CMS as a DRAFT: Success Feedback is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I fill in the "entrypoint_display_text_input" field with "Test"
      And I click on the "light_icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons.svg"
      And the "Entrypoint Content" page is loaded
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "full" value from "url_type_selector" field
      And I fill in the "custom_url_input" field with "https://google.com"
      And I click on the "add_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "save_draft_button" button
     Then the text of the element "confirm_message" is equal to "Entrypoint has been created"
      And I click on the "close_button" button
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONF:cms.entrypoint_cms_name]" text in "internal_name" field in the "entrypoints_list" list has the "state" field with "DRAFT" text
      And the item with "[CONF:cms.entrypoint_cms_name]" text in "internal_name" field in the "entrypoints_list" list has the "audiences" field with "All users" text

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-146400 |
          | moves   | QANOV-146401 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @jira.link.detects.<detects> @qa @smoke @web
  Scenario Outline: A <product> user can save a new entrypoint defined by CMS as a DRAFT: Success Feedback is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_cms_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I fill in the "entrypoint_display_text_input" field with "Test"
      And I click on the "add_url_button" button
      And the "Add Url" page is loaded
      And I select the "full" value from "url_type_selector" field
      And I fill in the "custom_url_input" field with "https://google.com"
      And I click on the "add_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "save_draft_button" button
     Then the text of the element "confirm_message" is equal to "Entrypoint has been created"
      And I click on the "close_button" button
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONF:cms.entrypoint_cms_name]" text in "internal_name" field in the "entrypoints_list" list has the "state" field with "DRAFT" text
      And the item with "[CONF:cms.entrypoint_cms_name]" text in "internal_name" field in the "entrypoints_list" list has the "audiences" field with "All users" text

    Examples:
          | product | version | detects  | jira_id      |
          | vivobr  | 12.7    | CMS-1711 | QANOV-107942 |
          | blaude  | 13.9    |          | QANOV-274018 |
          | o2de    | 24.1    |          | QANOV-579977 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.12.7 @jira.link.detects.CMS-1711 @qa @smoke @web
  Scenario Outline: A <product> user can save a new preconfigured entrypoint uploading an image as a DRAFT: Success Feedback is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "entrypoint_preconfigured_radio" element
      And I click on the "entrypoint_preconfigured_selector" button
      And I click on the "entrypoint_preconfigured_selector_first_element" button
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "light_icon_add_button" element
      And the "Add Icon" page is loaded
      And waits until the "add_button" element is visible
      And I fill in the "upload_file_input" file field with file path "resources/cms/boltons.svg"
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "save_draft_button" button
     Then the text of the element "confirm_message" is equal to "Entrypoint has been created"
      And I click on the "close_button" button
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONF:cms.entrypoint_preconfigured_name]" text in "internal_name" field in the "entrypoints_list" list has the "state" field with "DRAFT" text
      And the item with "[CONF:cms.entrypoint_preconfigured_name]" text in "internal_name" field in the "entrypoints_list" list has the "audiences" field with "Preconfigured" text

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-153521 |
          | moves   | QANOV-153522 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @jira.link.detects.<detects> @qa @smoke @web
  Scenario Outline: A <product> user can save a new preconfigured entrypoint as a DRAFT: Success Feedback is displayed
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "create_entrypoint" button
      And the "Entrypoint Overview" page is loaded
      And I fill in the "entrypoint_internal_name_input" field with "[CONF:cms.entrypoint_preconfigured_name]"
      And I fill in the "entrypoint_id_input" field with an unique public id value
      And I click on the "entrypoint_preconfigured_radio" element
      And I click on the "entrypoint_preconfigured_selector" button
      And I click on the "entrypoint_preconfigured_selector_first_element" button
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "save_draft_button" button
     Then the text of the element "confirm_message" is equal to "Entrypoint has been created"
      And I click on the "close_button" button
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONF:cms.entrypoint_preconfigured_name]" text in "internal_name" field in the "entrypoints_list" list has the "state" field with "DRAFT" text
      And the item with "[CONF:cms.entrypoint_preconfigured_name]" text in "internal_name" field in the "entrypoints_list" list has the "audiences" field with "Preconfigured" text

    Examples:
          | product | version | detects  | jira_id      |
          | vivobr  | 12.7    | CMS-1711 | QANOV-153520 |
          | blaude  | 13.9    |          | QANOV-274019 |
          | o2de    | 24.1    |          | QANOV-579978 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.draft_not_included_in_list
  Scenario Outline: A user can perform several actions in a DRAFT entrypoint from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "more_options" element on the configured entrypoint
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_delete_button" is equal to "Delete"
      And the "more_options_publish_button" element is not displayed
      And the "more_options_pause_button" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154247 |
          | o2uk    | 12.7    | QANOV-154248 |
          | moves   | 12.7    | QANOV-154249 |
          | blaude  | 13.9    | QANOV-274020 |
          | o2de    | 24.1    | QANOV-579980 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.draft_not_included_in_list
  Scenario Outline: A user can remove the audience to an entrypoint url
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints defined by CMS in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the configured entrypoint
      And the "Entrypoint Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "edit_icon" field on the "0" element in the "urls_list" web list
      And the "Add Url" page is loaded
      And I click on the "add_condition_button" element
      And I click on the "audience_selector" element
      And waits until the "audience_selector_first_element" element is visible
      And I click on the "audience_selector_first_element" button
      And I click on the "edit_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "save_draft_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Entrypoint has been updated"
      And I click on the "back_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "edit_icon" field on the "0" element in the "urls_list" web list
      And the "Add Url" page is loaded
      And I click on the "audience_selector_remove_icon" web button
      And I click on the "edit_url_button" web button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "save_draft_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Entrypoint has been updated"
      And waits until the "confirm_message" element is not visible
      And I click on the "close_button" button
     Then the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONTEXT:cms_entrypoints.entrypoint0.metadata.id.id]" text in the "href" attribute of "link" field in the "entrypoints_list" list has the "audiences" field with "All users" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154237 |
          | o2uk    | 12.7    | QANOV-154238 |
          | moves   | 12.7    | QANOV-154239 |
          | blaude  | 13.9    | QANOV-274022 |
          | o2de    | 24.1    | QANOV-579982 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.draft_not_included_in_list
  Scenario Outline: A user can add a condition <condition> audience to an entrypoint url
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints defined by CMS in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the configured entrypoint
      And the "Entrypoint Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "edit_icon" field on the "0" element in the "urls_list" web list
      And the "Add Url" page is loaded
      And I click on the "add_condition_button" element
      And I click on the "condition_selector" element
      And I click on the "condition_<condition>" element
      And I click on the "audience_selector" element
      And waits until the "audience_selector_first_element" element is visible
      And I click on the "audience_selector_first_element" button
      And I click on the "edit_url_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "save_draft_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Entrypoint has been updated"
      And I click on the "close_button" button
     Then the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONTEXT:cms_entrypoints.entrypoint0.metadata.id.id]" text in the "href" attribute of "link" field in the "entrypoints_list" list has the "audiences" field with a text different from "All users"

    Examples:
          | product | version | condition | jira_id      |
          | vivobr  | 12.7    | with      | QANOV-154234 |
          | vivobr  | 13.9    | without   | QANOV-285795 |
          | o2uk    | 12.7    | with      | QANOV-154235 |
          | o2uk    | 13.9    | without   | QANOV-285796 |
          | moves   | 12.7    | with      | QANOV-154236 |
          | moves   | 13.9    | without   | QANOV-285797 |
          | blaude  | 13.9    | with      | QANOV-274021 |
          | blaude  | 13.9    | without   | QANOV-285798 |
          | o2de    | 24.1    | with      | QANOV-579984 |
          | o2de    | 24.1    | without   | QANOV-579986 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @jira.link.detects.CMS-1013 @qa @smoke @web
  @fixture.cms.entrypoint.draft_not_included_in_list
  Scenario Outline: A user can publish an entrypoint in DRAFT or PAUSED status
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints defined by CMS in "DRAFT,UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the configured entrypoint
      And the "Entrypoint Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Entrypoint has been published"
      And I click on the "close_button" button
     Then the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONTEXT:cms_entrypoints.entrypoint0.metadata.id.id]" text in the "href" attribute of "link" field in the "entrypoints_list" list has the "state" field with "Published" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107945 |
          | o2uk    | 12.7    | QANOV-146407 |
          | moves   | 12.7    | QANOV-146408 |
          | blaude  | 13.9    | QANOV-274023 |
          | o2de    | 24.1    | QANOV-579987 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can perform several actions in a PUBLISHED entrypoint (included in list) from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "PUBLISHED" status and "included" in some list configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I fill in the "filter_by_text" field with "\"[CONTEXT:cms_entrypoints.entrypoint0.metadata.internalName]\""
      And waits until the "entrypoints_list" list is stable
      And I click on the "more_options" element on the configured entrypoint
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_pause_button" is equal to "Pause"
      And the "more_options_publish_button" element is not displayed
      And the "more_options_delete_button" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154250 |
          | o2uk    | 12.7    | QANOV-154251 |
          | moves   | 12.7    | QANOV-154252 |
          | blaude  | 13.9    | QANOV-274024 |
          | o2de    | 24.1    | QANOV-579989 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can perform several actions in a PUBLISHED entrypoint (not included in any list) from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "PUBLISHED" status and "not_included" in some list configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I fill in the "filter_by_text" field with "\"[CONTEXT:cms_entrypoints.entrypoint0.metadata.internalName]\""
      And waits until the "entrypoints_list" list is stable
      And I click on the "more_options" element on the configured entrypoint
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_pause_button" is equal to "Pause"
      And the text of the element "more_options_delete_button" is equal to "Delete"
      And the "more_options_publish_button" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154253 |
          | o2uk    | 12.7    | QANOV-154254 |
          | moves   | 12.7    | QANOV-154255 |
          | blaude  | 13.9    | QANOV-274025 |
          | o2de    | 24.1    | QANOV-579991 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can do a test in a PUBLISHED entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    To create a test first you need to modify your published entrypoint
    Given there are entrypoints defined by CMS in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the configured entrypoint
      And the "Entrypoint Overview" page is loaded
      And I click on the "continue_button" element
      And the "Entrypoint Content" page is loaded
      And I replace the "entrypoint_display_text_input" field value with "test2"
      And I click on the "continue_button" element
      And the "Entrypoint Preview" page is loaded
      And I click on the "create_test_button" button
      And the "Create Test" page is loaded
      And I fill in the "test_description_input" field with "QA Testing entrypoint"
      And I click on the "create_test_button" button
     Then the "Entrypoint Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Test has been created"
      And the text of the element "delete_test_button" is equal to "Discard test"

    Examples:
          | product | version | jira_id      |
          | o2uk    | 12.7    | QANOV-154242 |
          | moves   | 12.7    | QANOV-154243 |
          | vivobr  | 12.7    | QANOV-154241 |
          | blaude  | 13.9    | QANOV-274026 |
          | o2de    | 24.1    | QANOV-579993 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic @fixture.cms.entrypoint_test.basic
  Scenario Outline: A user can perform several actions in a TEST entrypoint (included in any list) from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "TEST" status and "included" in some list configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "more_options" element on the configured entrypoint
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the "more_options_delete_button" element is not displayed
      And the "more_options_publish_button" element is not displayed
      And the "more_options_pause_button" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-167642 |
          | o2uk    | 12.7    | QANOV-167643 |
          | moves   | 12.7    | QANOV-167644 |
          | blaude  | 13.9    | QANOV-274027 |
          | o2de    | 24.1    | QANOV-579995 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list @fixture.cms.entrypoint_test.basic
  Scenario Outline: A user can perform several actions in a TEST entrypoint (not included in any list) from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "TEST" status and "not_included" in some list configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "more_options" element on the configured entrypoint
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_delete_button" is equal to "Delete"
      And the "more_options_publish_button" element is not displayed
      And the "more_options_pause_button" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154262 |
          | o2uk    | 12.7    | QANOV-154263 |
          | moves   | 12.7    | QANOV-154264 |
          | blaude  | 13.9    | QANOV-274028 |
          | o2de    | 24.1    | QANOV-579996 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list @fixture.cms.entrypoint_test.basic
  Scenario Outline: A user can discard a test in an entrypoint
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints in "TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the configured entrypoint
      And the "Entrypoint Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "delete_test_button" button
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is clickable
      And I click on the "accept" button
      And the "Entrypoint Preview" page is loaded
     Then the text of the element "confirm_message" is equal to "Test has been discarded"
      And the "create_test_button" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154244 |
          | o2uk    | 12.7    | QANOV-154245 |
          | moves   | 12.7    | QANOV-154246 |
          | blaude  | 13.9    | QANOV-274029 |
          | o2de    | 24.1    | QANOV-579999 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can pause an entrypoint in PUBLISHED status
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the configured entrypoint
      And the "Entrypoint Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Content" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint Preview" page is loaded
      And I click on the "pause_button" button
      And the "Confirm Changes Popup" page is loaded
      And waits until the "confirm" element is clickable
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint Preview" page is loaded
      And the text of the element "confirm_message" is equal to "Entrypoint has been paused"
      And I click on the "close_button" button
     Then the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONTEXT:cms_entrypoints.entrypoint0.metadata.id.id]" text in the "href" attribute of "link" field in the "entrypoints_list" list has the "state" field with "Paused" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153529 |
          | o2uk    | 12.7    | QANOV-153530 |
          | moves   | 12.7    | QANOV-153531 |
          | blaude  | 13.9    | QANOV-274030 |
          | o2de    | 24.1    | QANOV-580004 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.unpublished
  Scenario Outline: A user can perform several actions in a PAUSED entrypoint (included in list) from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "UNPUBLISHED" status and "included" in some list configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I fill in the "filter_by_text" field with "\"[CONTEXT:cms_entrypoints.entrypoint0.metadata.internalName]\""
      And waits until the "entrypoints_list" list is stable
      And I click on the "more_options" element on the configured entrypoint
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_publish_button" is equal to "Publish"
      And the "more_options_pause_button" element is not displayed
      And the "more_options_delete_button" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154256 |
          | o2uk    | 12.7    | QANOV-154257 |
          | moves   | 12.7    | QANOV-154258 |
          | blaude  | 13.9    | QANOV-274031 |
          | o2de    | 24.1    | QANOV-580006 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.unpublished_not_included_in_list
  Scenario Outline: A user can perform several actions in a PAUSED entrypoint (not included in any list) from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "UNPUBLISHED" status and "not_included" in some list configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_list" list is stable
      And I click on the "more_options" element on the configured entrypoint
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_publish_button" is equal to "Publish"
      And the text of the element "more_options_delete_button" is equal to "Delete"
      And the "more_options_pause_button" element is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154259 |
          | o2uk    | 12.7    | QANOV-154260 |
          | moves   | 12.7    | QANOV-154261 |
          | blaude  | 13.9    | QANOV-274032 |
          | o2de    | 24.1    | QANOV-580008 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can access to edit an entrypoint defined by CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints defined by CMS in "DRAFT,PUBLISHED,UNPUBLISHED,TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the configured entrypoint
     Then the "Entrypoint Overview" page is loaded
      And the "entrypoint_internal_name_input" element is not displayed
      And the "entrypoint_id_input" element is displayed
      And the "entrypoint_id_input" element is readonly
      And the "entrypoint_defined_by_cms_radio" element is displayed
      And the "entrypoint_defined_by_cms_radio" element is selected
      And the "entrypoint_preconfigured_radio" element is displayed

    Examples:
          | product | version | jira_id      |
          | o2uk    | 12.7    | QANOV-146405 |
          | moves   | 12.7    | QANOV-146406 |
          | vivobr  | 12.7    | QANOV-107944 |
          | blaude  | 13.9    | QANOV-274033 |
          | o2de    | 24.1    | QANOV-580010 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.with_preconfigured_provider_not_included_in_list
  Scenario Outline: A user can access to edit an entrypoint preconfigured
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints preconfigured in "DRAFT,PUBLISHED,UNPUBLISHED,TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the configured entrypoint
     Then the "Entrypoint Overview" page is loaded
      And the "entrypoint_internal_name_input" element is not displayed
      And the "entrypoint_id_input" element is displayed
      And the "entrypoint_id_input" element is readonly
      And the "entrypoint_defined_by_cms_radio" element is displayed
      And the "entrypoint_preconfigured_radio" element is displayed
      And the "entrypoint_preconfigured_radio" element is selected
      And the "entrypoint_preconfigured_selector" element is displayed

    Examples:
          | product | version | jira_id      |
          | o2uk    | 12.7    | QANOV-153524 |
          | moves   | 12.7    | QANOV-153525 |
          | vivobr  | 12.7    | QANOV-153523 |
          | blaude  | 13.9    | QANOV-274034 |
          | o2de    | 24.1    | QANOV-580011 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can access to edit an entrypoint from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in any of "DRAFT,PUBLISHED,UNPUBLISHED,TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_list" list is stable
      And I click on the "more_options" element on the configured entrypoint
      And I click on the "more_options_edit_button" element
     Then the "Entrypoint Overview" page is loaded
      And the text of the element "title" contains "[CONTEXT:cms_entrypoints.entrypoint0.metadata.internalName]"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154265 |
          | o2uk    | 12.7    | QANOV-154266 |
          | moves   | 12.7    | QANOV-154267 |
          | blaude  | 13.9    | QANOV-274035 |
          | o2de    | 24.1    | QANOV-580013 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.unpublished_not_included_in_list
  Scenario Outline: A user can publish an entrypoint from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "UNPUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_list" list is stable
      And I click on the "more_options" element on the configured entrypoint
      And I click on the "more_options_publish_button" element
      And the "Confirm Changes Popup" page is loaded
      And waits until the "confirm" element is clickable
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONTEXT:cms_entrypoints.entrypoint0.metadata.id.id]" text in the "href" attribute of "link" field in the "entrypoints_list" list has the "state" field with "Published" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154271 |
          | o2uk    | 12.7    | QANOV-154272 |
          | moves   | 12.7    | QANOV-154273 |
          | blaude  | 13.9    | QANOV-274036 |
          | o2de    | 24.1    | QANOV-580014 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can pause an entrypoint from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_list" list is stable
      And I click on the "more_options" element on the configured entrypoint
      And I click on the "more_options_pause_button" element
      And the "Confirm Changes Popup" page is loaded
      And waits until the "confirm" element is clickable
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
     Then the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_table" element is visible
      And waits until the "entrypoints_list" list is stable
      And the item with "[CONTEXT:cms_entrypoints.entrypoint0.metadata.id.id]" text in the "href" attribute of "link" field in the "entrypoints_list" list has the "state" field with "Paused" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154274 |
          | o2uk    | 12.7    | QANOV-154275 |
          | moves   | 12.7    | QANOV-154276 |
          | blaude  | 13.9    | QANOV-274037 |
          | o2de    | 24.1    | QANOV-580016 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can delete an entrypoint not included in some list from the Entrypoint Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path..
    Given there are entrypoints in any of "DRAFT,PUBLISHED,UNPUBLISHED,TEST" status and "not_included" in some list configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_list" list is stable
      And I click on the "more_options" element on the configured entrypoint
      And I click on the "more_options_delete_button" element
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is clickable
      And I click on the "accept" button
     Then the "Entrypoint Management" page is loaded
      And waits until the "entrypoints_list" list is stable
      And the selected entrypoint is deleted

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154268 |
          | o2uk    | 12.7    | QANOV-154269 |
          | moves   | 12.7    | QANOV-154270 |
          | blaude  | 13.9    | QANOV-274038 |
          | o2de    | 24.1    | QANOV-580018 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can filter by text in the Entrypoint Management page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "any" entrypoints configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I fill in the "filter_by_text" field with "\"[CONTEXT:cms_entrypoints.entrypoint0.metadata.internalName]\""
      And waits until the "entrypoints_list" list is stable
     Then each element in the "entrypoints_list" list has the "internal_name" field that contains "[CONTEXT:cms_entrypoints.entrypoint0.metadata.internalName]" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107936 |
          | o2uk    | 12.7    | QANOV-146388 |
          | moves   | 12.7    | QANOV-146389 |
          | blaude  | 13.9    | QANOV-274039 |
          | o2de    | 24.1    | QANOV-580019 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can filter by entrypoints usage in the Entrypoint Management page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given all entrypoints are included in any list configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoints_management]" web page
      And the "Entrypoint Management" page is loaded
      And I click on the "filter_by_entrypoints_usage" element
      And I click on the element with "NOT_INCLUDED_IN_ANY_LIST" value in "data-value" attribute in the "filter_elements" list
      And waits until the "entrypoints_list" list is stable
     Then the length of the "entrypoints_list" list is "0"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107937 |
          | o2uk    | 12.7    | QANOV-146390 |
          | moves   | 12.7    | QANOV-146391 |
          | blaude  | 13.9    | QANOV-274040 |
          | o2de    | 24.1    | QANOV-580021 |
