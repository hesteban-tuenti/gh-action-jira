# -*- coding: utf-8 -*-
@jira.QANOV-107946 @not_hardening
Feature: Lists management

  Actions After each Scenario:
    Given the configured entrypoint lists with "[CONF:cms.entrypoint_list_name]" name in CMS are deleted


  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can access to the Entrypoint List management screen via the cms lateral menu
     When I go to "[CONF:cms.base]" web page
      And the "Comms Module" page is loaded
     When I click on the "entrypoint_lists_option" button
     Then the "Entrypoint List Management" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-146411 |
          | o2uk    | 12.7    | QANOV-146412 |
          | moves   | 12.7    | QANOV-146413 |
          | blaude  | 13.9    | QANOV-274041 |
          | o2de    | 24.1    | QANOV-580031 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can access to Entrypoint List Management page without lists created
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "0" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
     Then the text of the element "title" is equal to "Entrypoint Lists"
      And the text of the element "create_list" is equal to "Create list"
      And the text of the element "manage_entrypoints" is equal to "Manage entrypoints"
      And the "filter_by_name" element is displayed
      And the "filter_by_status" element is displayed
      And the "entrypoint_lists_list" list of elements is not displayed
      And the text of the element "empty_case_title" is equal to "Create your first Entrypoint List"
      And the text of the element "empty_case_description" is equal to "Click on the "Create" button to start"
      And the text of the element "empty_case_button" is equal to "Create list"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153347 |
          | o2uk    | 12.7    | QANOV-153348 |
          | moves   | 12.7    | QANOV-153349 |
          | blaude  | 13.9    | QANOV-274042 |
          | o2de    | 24.1    | QANOV-580032 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can access to Entrypoint List Management page with lists already created
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
     Then the text of the element "title" is equal to "Entrypoint Lists"
      And the text of the element "create_list" is equal to "Create list"
      And the text of the element "manage_entrypoints" is equal to "Manage entrypoints"
      And the "filter_by_name" element is displayed
      And the "filter_by_type" element is displayed
      And the "filter_by_display_mode" element is displayed
      And the "filter_by_status" element is displayed
      And the "entrypoint_lists_list" list of elements is displayed
      And each item in the "entrypoint_lists_list" list has the "list_id" field
      And each item in the "entrypoint_lists_list" list has the "list_type" field
      And each item in the "entrypoint_lists_list" list has the "display_mode" field
      And each item in the "entrypoint_lists_list" list has the "status" field

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107947 |
          | o2uk    | 12.7    | QANOV-146414 |
          | moves   | 12.7    | QANOV-146415 |
          | blaude  | 13.9    | QANOV-274043 |
          | o2de    | 24.1    | QANOV-580033 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can access to create a new entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
     Then the "Create New Entrypoint List" page is loaded
      And the "list_name" element is displayed
      And the "list_id" element is displayed
      And the "list_id" element is disabled
      And the text of the element "create_list" is equal to "Create"
      And the text of the element "cancel_button" is equal to "Cancel"

    Examples:
          | product | version | jira_id      |
          | o2uk    | 12.7    | QANOV-146418 |
          | moves   | 12.7    | QANOV-146419 |
          | blaude  | 13.9    | QANOV-274044 |
          | o2de    | 24.1    | QANOV-580034 |

  @jira.QANOV-107949 @ber @e2e @jira.cv.12.7 @manual @qa @smoke @vivobr @web
  Scenario: A vivobr user can access to create a new entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
     Then the "Create New Entrypoint List" page is loaded
      And the "list_name" element is displayed
      And the "list_id" element is displayed
      And the "list_id" element is disabled
      And the text of the element "list_type_title" is equal to "List type"
      And the element in "0" position in the "list_type_list" list with "CMS" text is displayed
      And the element in "0" position in the "list_type_list" list with "Entrypoints will be defined manually" text is displayed
      And the element in "1" position in the "list_type_list" list with "API" text is displayed
      And the element in "1" position in the "list_type_list" list with "Entrypoints will be defined using an API" text is displayed
      And the "list_type_cms" element is selected
      And the text of the element "create_list" is equal to "Create entrypoint list"
      And the text of the element "cancel_button" is equal to "Cancel"

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can close the "Create New Entrypoint List" screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I click on the "cancel_button" web button
     Then the "Entrypoint List Management" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154277 |
          | o2uk    | 12.7    | QANOV-154278 |
          | moves   | 12.7    | QANOV-154279 |
          | blaude  | 13.9    | QANOV-274045 |
          | o2de    | 24.1    | QANOV-580035 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user cannot access to the first step (Overview) for creating an entrypoints list without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I click on the "create_list" web button
     Then the text of the element "name_error" is equal to "This field is required"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153350 |
          | o2uk    | 12.7    | QANOV-153351 |
          | moves   | 12.7    | QANOV-153352 |
          | blaude  | 13.9    | QANOV-274046 |
          | o2de    | 24.1    | QANOV-580036 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @jira.link.detects.CMS-1147 @qa @regression @web
  Scenario Outline: The list id is satinized when the internal name contains special characters
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "test#qa"
     Then the text of the element "list_id" is equal to "testqa"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153353 |
          | o2uk    | 12.7    | QANOV-153354 |
          | moves   | 12.7    | QANOV-153355 |
          | blaude  | 13.9    | QANOV-274047 |
          | o2de    | 24.1    | QANOV-580037 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @qa @regression @web
  Scenario Outline: A user cannot create an entrypoints list with a list_id that already existed and was deleted
    WARNING: the paths defined in this test correspond to the PROD environment.However, this test must be executed in DEV/CERT environment, so be sure to use the proper path.
    The list with ID 'automatic-entrypoint-list-name-consumptions' that the user wants to create already exists.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I click on the "create_list" web button
      And waits until the "error_message" element is visible
      And the text of the element "error_message" contains "Please indicate another ID"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153356 |
          | o2uk    | 12.7    | QANOV-153357 |
          | moves   | 12.7    | QANOV-153358 |
          | blaude  | 13.9    | QANOV-274048 |
          | o2de    | 24.1    | QANOV-580038 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can create an entrypoints list of type CMS in DRAFT status by just filling the "Create New Entrypoint List" page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And the "entrypoint_lists_list" list is displayed
      And waits until the "entrypoint_lists_list" list is stable
      And the item with "[CONTEXT:cms_unique_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Draft" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154280 |
          | o2uk    | 12.7    | QANOV-154281 |
          | moves   | 12.7    | QANOV-154282 |
          | blaude  | 13.9    | QANOV-274049 |
          | o2de    | 24.1    | QANOV-580040 |

  @jira.QANOV-554894 @e2e @jira.cv.24.0 @manual @qa @smoke @vivobr @web
  Scenario: A user can create an entrypoints list of type API in DRAFT status by just filling the "Create New Entrypoint List" page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "list_type_api" button
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And the "entrypoint_lists_list" list is displayed
      And waits until the "entrypoint_lists_list" list is stable
      And the item with "[CONTEXT:cms_unique_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Draft" text

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @qa @smoke @web
  Scenario Outline: A user can access to the first step (Overview) for editing an entrypoints list of type CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "CMS" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
     Then the "Entrypoint List Overview" page is loaded
      And the "list_name" element is displayed
      And the "list_id" element is displayed
      And the "edit_header" element is displayed
      And the "list_summary_title_input" element is displayed
      And the text of the element "list_type_title" is equal to "Display mode"
      And the element in "0" position in the "list_type_values" list with "List" text is displayed
      And the element in "1" position in the "list_type_values" list with "Snap cards" text is displayed
      And the element in "2" position in the "list_type_values" list with "Chips" text is displayed
      And the element in "3" position in the "list_type_values" list with "Mosaic" text is displayed
      And the element in "4" position in the "list_type_values" list with "Circles" text is displayed
      And the element in "5" position in the "list_type_values" list with "Icons" text is displayed
      And the "restrict_checkbox" element is displayed
      And the text of the element "restrict_checkbox" is equal to "Limit the number of items shown"
      And the "preview_switch" element is displayed
      And the text of the element "continue_button" is equal to "Continue"
      And the "entrypoint_lists_preview_image" element is displayed
      And switches to iframe
      And the text of the element "entrypoint_lists_preview" is equal to "Internal entrypoint list preview"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107950 |
          | o2uk    | 12.7    | QANOV-146420 |
          | moves   | 12.7    | QANOV-146421 |
          | blaude  | 13.9    | QANOV-274050 |
          | o2de    | 24.1    | QANOV-580041 |

  @jira.QANOV-554895 @e2e @jira.cv.24.0 @manual @qa @smoke @vivobr @web
  Scenario: A user can access to the Overview screen for editing an entrypoints list of type API
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "API" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
     Then the "Entrypoint List Overview" page is loaded
      And the "list_name" element is displayed
      And the "list_id" element is displayed
      And the "edit_header" element is displayed
      And the text of the element "product_tags_title" is equal to "Product tags"
      And the text of the element "product_tags_button" is equal to "+ Add product tag"
      And the "list_summary_title_input" element is displayed
      And the text of the element "list_type_title" is equal to "Display mode"
      And the element in "0" position in the "list_type_values" list with "List" text is displayed
      And the element in "1" position in the "list_type_values" list with "Snap cards" text is displayed
      And the element in "2" position in the "list_type_values" list with "Chips" text is displayed
      And the element in "3" position in the "list_type_values" list with "Mosaic" text is displayed
      And the element in "4" position in the "list_type_values" list with "Circles" text is displayed
      And the element in "5" position in the "list_type_values" list with "Icons" text is displayed
      And the "restrict_checkbox" element is displayed
      And the text of the element "restrict_checkbox" is equal to "Limit the number of items shown"
      And the "preview_switch" element is displayed
      And the text of the element "cancel_button" is equal to "Cancel"
      And the text of the element "save_button" is equal to "Save list"
      And the text of the element "publish_button" is equal to "Publish"
      And the "entrypoint_lists_preview_image" element is displayed

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic
  Scenario Outline: A user can close the Overview screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154283 |
          | o2uk    | 12.7    | QANOV-154284 |
          | moves   | 12.7    | QANOV-154285 |
          | blaude  | 13.9    | QANOV-274051 |
          | o2de    | 24.1    | QANOV-580042 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can select that the services are displayed as <selection> in the Overview screen of an entrypoints list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "<type>" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "<selection>" button
      And I switch to "entrypoint_lists_preview_image" iframe
      And I wait "1" seconds
      And the "<preview_list>" list is displayed
      And the "entrypoint_lists_preview" element is displayed

    @automatic @ber
    Examples:
          | product | version | selection         | preview_list                                     | type | jira_id      |
          | vivobr  | 12.7    | list_button       | entrypoint_lists_preview_image_list              | CMS  | QANOV-271058 |
          | o2uk    | 12.7    | list_button       | entrypoint_lists_preview_image_list              | CMS  | QANOV-271059 |
          | moves   | 12.7    | list_button       | entrypoint_lists_preview_image_list              | CMS  | QANOV-271060 |
          | blaude  | 13.9    | list_button       | entrypoint_lists_preview_image_list              | CMS  | QANOV-274053 |
          | o2de    | 24.1    | list_button       | entrypoint_lists_preview_image_list              | CMS  | QANOV-580043 |
          | vivobr  | 12.7    | snap_cards_button | entrypoint_lists_preview_image_snapcard_carousel | CMS  | QANOV-271061 |
          | o2uk    | 12.7    | snap_cards_button | entrypoint_lists_preview_image_snapcard_carousel | CMS  | QANOV-271062 |
          | moves   | 12.7    | snap_cards_button | entrypoint_lists_preview_image_snapcard_carousel | CMS  | QANOV-271063 |
          | blaude  | 13.9    | snap_cards_button | entrypoint_lists_preview_image_snapcard_carousel | CMS  | QANOV-274054 |
          | o2de    | 24.1    | snap_cards_button | entrypoint_lists_preview_image_snapcard_carousel | CMS  | QANOV-580044 |
          | vivobr  | 12.7    | chips_button      | entrypoint_lists_preview_image_chips             | CMS  | QANOV-271064 |
          | o2uk    | 12.7    | chips_button      | entrypoint_lists_preview_image_chips             | CMS  | QANOV-271065 |
          | moves   | 12.7    | chips_button      | entrypoint_lists_preview_image_chips             | CMS  | QANOV-271066 |
          | blaude  | 13.9    | chips_button      | entrypoint_lists_preview_image_chips             | CMS  | QANOV-274055 |
          | o2de    | 24.1    | chips_button      | entrypoint_lists_preview_image_chips             | CMS  | QANOV-580045 |
          | vivobr  | 14.7    | mosaic_button     | entrypoint_lists_preview_image_mosaic            | CMS  | QANOV-420773 |
          | o2uk    | 14.7    | mosaic_button     | entrypoint_lists_preview_image_mosaic            | CMS  | QANOV-420774 |
          | moves   | 14.7    | mosaic_button     | entrypoint_lists_preview_image_mosaic            | CMS  | QANOV-420775 |
          | blaude  | 14.7    | mosaic_button     | entrypoint_lists_preview_image_mosaic            | CMS  | QANOV-420776 |
          | o2de    | 24.1    | mosaic_button     | entrypoint_lists_preview_image_mosaic            | CMS  | QANOV-580046 |
          | vivobr  | 14.8    | circles_button    | entrypoint_lists_preview_image_circles           | CMS  | QANOV-439543 |
          | o2uk    | 14.8    | circles_button    | entrypoint_lists_preview_image_circles           | CMS  | QANOV-439544 |
          | moves   | 14.8    | circles_button    | entrypoint_lists_preview_image_circles           | CMS  | QANOV-439545 |
          | blaude  | 14.8    | circles_button    | entrypoint_lists_preview_image_circles           | CMS  | QANOV-439546 |
          | o2de    | 24.1    | circles_button    | entrypoint_lists_preview_image_circles           | CMS  | QANOV-580049 |

    @manual
    Examples:
          | product | version | selection         | preview_list                                     | type | jira_id      |
          | vivobr  | 24.0    | list_button       | entrypoint_lists_preview_image_list              | API  | QANOV-554896 |
          | vivobr  | 24.0    | snap_cards_button | entrypoint_lists_preview_image_snapcard_carousel | API  | QANOV-554897 |
          | vivobr  | 24.0    | chips_button      | entrypoint_lists_preview_image_chips             | API  | QANOV-554898 |
          | vivobr  | 24.0    | mosaic_button     | entrypoint_lists_preview_image_mosaic            | API  | QANOV-554899 |
          | vivobr  | 24.0    | circles_button    | entrypoint_lists_preview_image_circles           | API  | QANOV-554900 |
          | vivobr  | 24.1    | icons_button      | entrypoint_lists_preview_image_icons             | CMS  | QANOV-573409 |
          | o2uk    | 24.1    | icons_button      | entrypoint_lists_preview_image_icons             | CMS  | QANOV-573411 |
          | blaude  | 24.1    | icons_button      | entrypoint_lists_preview_image_icons             | CMS  | QANOV-573413 |
          | o2de    | 24.1    | icons_button      | entrypoint_lists_preview_image_icons             | CMS  | QANOV-573437 |

    @jira.link.parent_test_plan.QANOV-525492 @manual
    Examples:
          | product | version | selection    | preview_list                         | type | jira_id      |
          | moves   | 24.1    | icons_button | entrypoint_lists_preview_image_icons | CMS  | QANOV-573412 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can access to restrict the amount of services in the Overview screen of an entrypoints list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "<type>" configured in CMS
      And the entrypoints lists configured in CMS has the restriction in amount of services "disabled"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "restrict_checkbox" button
      And waits until the "amount_of_services_input" element is present
     Then the "amount_of_services_input" element is displayed
      And the "enable_view_more_link" element is displayed
      And the text of the element "enable_view_more_link" is equal to "Enable "view more" link"

    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-107956 |
          | vivobr  | 24.0    | API  | QANOV-554901 |
          | o2uk    | 12.7    | CMS  | QANOV-146422 |
          | moves   | 12.7    | CMS  | QANOV-146423 |
          | blaude  | 13.9    | CMS  | QANOV-274056 |
          | o2de    | 24.1    | CMS  | QANOV-580050 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can restrict the amount services in the Overview screen of an entrypoints list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "<type>" configured in CMS
      And the entrypoints lists configured in CMS has the restriction in amount of services "disabled"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "restrict_checkbox" button
      And waits until the "amount_of_services_input" element is present
      And I scroll to the element "amount_of_services_input"
      And I replace the "amount_of_services_input" field value with "4"
      And switches to iframe
     Then the "entrypoint_lists_preview_image_list" list of elements is displayed
      And there are "4" elements on the "entrypoint_lists_preview_image_list" elements list

    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154286 |
          | vivobr  | 24.0    | API  | QANOV-554902 |
          | o2uk    | 12.7    | CMS  | QANOV-154287 |
          | moves   | 12.7    | CMS  | QANOV-154288 |
          | blaude  | 13.9    | CMS  | QANOV-274057 |
          | o2de    | 24.1    | CMS  | QANOV-580051 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.1 @qa @regression @web
  Scenario Outline: A user can see the list visualization options when the List type is selected in an entrypoint list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "<type>" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "list_button" button
     Then the text of the element "list_visualization_full_width" is equal to "Full width"
      And the text of the element "list_visualization_boxed" is equal to "Boxed"
      And the "mosaic_vertical" element is not displayed
      And the "mosaic_horizontal" element is not displayed
      And the "snapcard_carousel" element is not displayed
      And the "snapcard_grid" element is not displayed
      And the "snapcard_dynamic_height" element is not displayed
      And the "snapcard_square" element is not displayed

    @automatic @ber
    Examples:
          | product | type | jira_id      |
          | vivobr  | CMS  | QANOV-311708 |
          | o2uk    | CMS  | QANOV-311709 |
          | moves   | CMS  | QANOV-311710 |
          | blaude  | CMS  | QANOV-311711 |
          | o2de    | CMS  | QANOV-580052 |

    @manual
    Examples:
          | product | type | jira_id      |
          | vivobr  | API  | QANOV-311708 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.10 @qa @regression @web
  Scenario Outline: A user can see the visualization options when the Snap Card type is selected in an entrypoint list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "<type>" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "snap_cards_button" button
     Then the text of the element "snapcard_carousel" is equal to "Carrousel"
      And the text of the element "snapcard_grid" is equal to "Grid"
      And the text of the element "snapcard_dynamic_height" is equal to "Dynamic height"
      And the text of the element "snapcard_square" is equal to "Square"
      And the "mosaic_vertical" element is not displayed
      And the "mosaic_horizontal" element is not displayed
      And the "list_visualization_full_width" element is not displayed
      And the "list_visualization_full_width" element is not displayed

    @automatic @ber
    Examples:
          | product | type | jira_id      |
          | vivobr  | CMS  | QANOV-493446 |
          | o2uk    | CMS  | QANOV-493447 |
          | moves   | CMS  | QANOV-493448 |
          | blaude  | CMS  | QANOV-493449 |
          | o2de    | CMS  | QANOV-580053 |

    @manual
    Examples:
          | product | type | jira_id      |
          | vivobr  | API  | QANOV-554903 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.10 @qa @regression @web
  Scenario Outline: A user can see the visualization options when the Mosaic type is selected in an entrypoint list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "<type>" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "mosaic_button" button
     Then the text of the element "mosaic_vertical" is equal to "Vertical"
      And the text of the element "mosaic_horizontal" is equal to "Horizontal"
      And the "snapcard_carousel" element is not displayed
      And the "snapcard_grid" element is not displayed
      And the "snapcard_dynamic_height" element is not displayed
      And the "snapcard_square" element is not displayed
      And the "list_visualization_full_width" element is not displayed
      And the "list_visualization_full_width" element is not displayed

    @automatic @ber
    Examples:
          | product | type | jira_id      |
          | vivobr  | CMS  | QANOV-493450 |
          | o2uk    | CMS  | QANOV-493451 |
          | moves   | CMS  | QANOV-493452 |
          | blaude  | CMS  | QANOV-493453 |
          | o2de    | CMS  | QANOV-580054 |

    @manual
    Examples:
          | product | type | jira_id      |
          | vivobr  | API  | QANOV-554904 |

  @jira.<jira_id> @<product> @e2e @jira.cv.14.10 @qa @regression @web
  Scenario Outline: A user won't see any visualization options when the <display_mode> type is selected in an entrypoint list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "<type>" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "<button>" button
     Then the "mosaic_vertical" element is not displayed
      And the "mosaic_horizontal" element is not displayed
      And the "snapcard_carousel" element is not displayed
      And the "snapcard_grid" element is not displayed
      And the "snapcard_dynamic_height" element is not displayed
      And the "snapcard_square" element is not displayed
      And the "list_visualization_full_width" element is not displayed
      And the "list_visualization_full_width" element is not displayed

    @automatic @ber
    Examples:
          | product | button         | display_mode | type | jira_id      |
          | vivobr  | chips_button   | Chips        | CMS  | QANOV-493454 |
          | o2uk    | chips_button   | Chips        | CMS  | QANOV-493455 |
          | moves   | chips_button   | Chips        | CMS  | QANOV-493456 |
          | blaude  | chips_button   | Chips        | CMS  | QANOV-493457 |
          | o2de    | chips_button   | Chips        | CMS  | QANOV-580055 |
          | vivobr  | circles_button | Circle       | CMS  | QANOV-493458 |
          | o2uk    | circles_button | Circle       | CMS  | QANOV-493459 |
          | moves   | circles_button | Circle       | CMS  | QANOV-493460 |
          | blaude  | circles_button | Circle       | CMS  | QANOV-493461 |
          | o2de    | circles_button | Circle       | CMS  | QANOV-580056 |

    @manual
    Examples:
          | product | button         | display_mode | type | jira_id      |
          | vivobr  | chips_button   | Chips        | API  | QANOV-554905 |
          | vivobr  | circles_button | Circle       | API  | QANOV-554906 |
          | vivobr  | icons_button   | Icon         | CMS  | QANOV-573439 |
          | o2uk    | icons_button   | Icon         | CMS  | QANOV-573440 |
          | blaude  | icons_button   | Icon         | CMS  | QANOV-573442 |
          | o2de    | icons_button   | Icon         | CMS  | QANOV-573443 |

    @jira.link.parent_test_plan.QANOV-525492 @manual
    Examples:
          | product | button       | display_mode | type | jira_id      |
          | moves   | icons_button | Icon         | CMS  | QANOV-573441 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.14.7 @qa @regression @web
  Scenario Outline: A user can see the fields to change the 'view more link' and 'full list' title when the 'view more' checkbox is selected in an entrypoint list of type CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "restrict_checkbox" button
      And waits until the "view_more_input" element is visible
     Then the "view_more_input" element is displayed
      And the "display_full_title" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-414751 |
          | o2uk    | QANOV-414752 |
          | moves   | QANOV-414753 |
          | blaude  | QANOV-414754 |
          | o2de    | QANOV-580057 |

  @jira.QANOV-554907 @e2e @jira.cv.24.0 @manual @qa @regression @vivobr @web
  Scenario: A user can see the fields to change the 'view more link' and 'full list' title when the 'view more' checkbox is selected in an entrypoint list of type API
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "list_type_api" button
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "restrict_checkbox" button
      And waits until the "view_more_input" element is visible
     Then the "view_more_input" element is displayed
      And the "display_full_title" element is displayed

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.14.7 @qa @regression @web
  Scenario Outline: A user can see the input to fill the full list title when the 'display full title' checkbox is selected in an entrypoint list of type CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "restrict_checkbox" button
      And waits until the "display_full_title" element is visible
      And I click on the "display_full_title" button
     Then the "full_list_title_input" element is displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-414755 |
          | o2uk    | QANOV-414756 |
          | moves   | QANOV-414757 |
          | blaude  | QANOV-414758 |
          | o2de    | QANOV-580058 |

  @jira.QANOV-554908 @e2e @jira.cv.24.0 @manual @qa @regression @vivobr @web
  Scenario: A user can see the input to fill the full list title when the 'display full title' checkbox is selected in an entrypoint list of type API
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "list_type_api" button
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "restrict_checkbox" button
      And waits until the "display_full_title" element is visible
      And I click on the "display_full_title" button
     Then the "full_list_title_input" element is displayed

  @jira.<jira_id> @<product> @e2e @jira.cv.24.0 @manual @qa @regression @web
  Scenario Outline: A user can open the edition popup to update the name of an entrypoint list of type CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "any" entrypoints lists of type "CMS" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "edit_header" button
     Then the "Edit Entrypoint List" page is loaded
      And the "list_name" element is displayed
      And the "list_id" element is displayed
      And the "list_id" element is disabled
      And the text of the element "update_list" is equal to "Update"
      And the text of the element "cancel_button" is equal to "Cancel"
      And I click on the "cancel_button" button
      And the "Entrypoint List Overview" page is loaded
      And the text of the element "list_name" is equal to "[CONF:cms.entrypoint_list_name]"

    Examples:
          | product | jira_id      |
          | o2uk    | QANOV-554909 |
          | moves   | QANOV-554910 |
          | blaude  | QANOV-554911 |
          | o2de    | QANOV-580059 |

  @jira.<jira_id> @e2e @jira.cv.24.0 @manual @qa @regression @vivobr @web
  Scenario Outline: A user can open the edition popup to update the name of an entrypoint list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "any" entrypoints lists of type "<type>" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "edit_header" button
     Then the "Edit Entrypoint List" page is loaded
      And the "list_name" element is displayed
      And the "list_id" element is displayed
      And the "list_id" element is disabled
      And the "list_type_<selected>" element is selected
      And the "list_type_cms" element is disabled
      And the "list_type_api" element is disabled
      And the text of the element "update_list" is equal to "Update"
      And the text of the element "cancel_button" is equal to "Cancel"
      And I click on the "cancel_button" button
      And the "Entrypoint List Overview" page is loaded
      And the text of the element "list_name" is equal to "[CONF:cms.entrypoint_list_name]"

    Examples:
          | type | selected | jira_id      |
          | CMS  | cms      | QANOV-554912 |
          | API  | api      | QANOV-554913 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.0 @manual @qa @regression @web
  Scenario Outline: A user can edit the name of an entrypoint list of type <type>
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "any" entrypoints lists of type "<type>" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "edit_header" button
      And the "Edit Entrypoint List" page is loaded
      And I fill in the "list_name" field with "Name updated"
      And I click on the "update_list" button
     Then the "Entrypoint List Overview" page is loaded
      And the text of the element "confirm_message" is equal to "List name updated"
      And the text of the element "list_name" is equal to "Name updated"

    Examples:
          | product | type | jira_id      |
          | vivobr  | CMS  | QANOV-554914 |
          | vivobr  | API  | QANOV-554915 |
          | o2uk    | CMS  | QANOV-554916 |
          | moves   | CMS  | QANOV-554917 |
          | blaude  | CMS  | QANOV-554918 |
          | o2de    | CMS  | QANOV-580060 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can save an entrypoint list as DRAFT in the Overview screen of an entrypoints list of type CMS
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "list_button" button
      And I click on the "save_draft_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Overview" page is loaded
      And the text of the element "confirm_message" is equal to "List changes have been saved"
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And the item with "[CONTEXT:cms_unique_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Draft" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154289 |
          | o2uk    | 12.7    | QANOV-154290 |
          | moves   | 12.7    | QANOV-154291 |
          | blaude  | 13.9    | QANOV-274058 |
          | o2de    | 24.1    | QANOV-580061 |

  @jira.QANOV-554919 @e2e @jira.cv.24.0 @manual @qa @regression @vivobr @web
  Scenario: A vivobr user can't save an entrypoint list of type API as DRAFT without filling the mandatory fields
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "list_type_api" button
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "save_draft_button" button
     Then the text of the element "product_tags_error" is equal to "At least one product tag is needed"

  @jira.QANOV-554920 @e2e @jira.cv.24.0 @manual @qa @smoke @vivobr @web
  Scenario: A vivobr user can save an entrypoint list of type API as DRAFT
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "list_type_api" button
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "product_tags_button" button
      And I fill in the "product_tag_input" field with "test"
      And I press the Enter key on "product_tag_input" field
      And I click on the "list_button" button
      And I click on the "save_draft_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Overview" page is loaded
      And the text of the element "confirm_message" is equal to "List changes have been saved"
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And the item with "[CONTEXT:cms_unique_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Draft" text

  @jira.QANOV-554921 @e2e @jira.cv.24.0 @manual @qa @smoke @vivobr @web
  Scenario: A vivobr user can publish an entrypoint list of type API from the List Overview screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "DRAFT" status configured in CMS
      And the entrypoint list is of type "API"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And the item with "[CONTEXT:cms_unique_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Published" text

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic
  Scenario Outline: A user can access to the second step (Services) for editing an entrypoints list without services
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "without" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
     Then the "Entrypoint List Services" page is loaded
      And the text of the element "add_entrypoint_button" is equal to "Add entrypoint"
      And the "services_list" element is not displayed
      And the text of the element "empty_case_description" is equal to "Add entrypoints to the list"
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "continue_button" is equal to "Continue"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153362 |
          | o2uk    | 12.7    | QANOV-153363 |
          | moves   | 12.7    | QANOV-153364 |
          | blaude  | 13.9    | QANOV-274059 |
          | o2de    | 24.1    | QANOV-580062 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can close the Services screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154292 |
          | o2uk    | 12.7    | QANOV-154293 |
          | moves   | 12.7    | QANOV-154294 |
          | blaude  | 13.9    | QANOV-274060 |
          | o2de    | 24.1    | QANOV-580064 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can go back from the Services screen to the Overview screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "internal_name" field on the "any" element in the "entrypoint_lists_list" web list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "back_button" web button
     Then the "Entrypoint List Overview" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154295 |
          | o2uk    | 12.7    | QANOV-154296 |
          | moves   | 12.7    | QANOV-154297 |
          | blaude  | 13.9    | QANOV-274061 |
          | o2de    | 24.1    | QANOV-580065 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic
  Scenario Outline: A user can access to the "Add entrypoint" page from the "Services" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "any" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "add_entrypoint_button" button
     Then the "Add Entrypoint" page is loaded
      And the "entrypoint_selector" element is displayed
      And the text of the element "description" is equal to "Select the entrypoint you want to add to this list"
      And the text of the element "cancel_button" is equal to "Cancel"
      And the text of the element "add_entrypoint_button" is equal to "Add entrypoint"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153365 |
          | o2uk    | 12.7    | QANOV-153366 |
          | moves   | 12.7    | QANOV-153367 |
          | blaude  | 13.9    | QANOV-274062 |
          | o2de    | 24.1    | QANOV-580066 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web @fixture.cms.entrypoint_list.DRAFT
  @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can add a entrypoint from the "Services" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "without" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "add_entrypoint_button" button
      And the "Add Entrypoint" page is loaded
      And I click on the "entrypoint_selector" element
      And clicks on any element in the "entrypoints_list" list that contains the "[CONTEXT:entrypoint_public_id]" text
      And I click on the "add_entrypoint_button" button
     Then the "Entrypoint List Services" page is loaded
      And the "services_list" list of elements is displayed
      And waits until the "services_list" list is stable
      And each item in the "services_list" list has the "internal_name" field
      And each item in the "services_list" list has the "display_item" field
      And each item in the "services_list" list has the "audiences" field
      And each item in the "services_list" list has the "state" field
      And each item in the "services_list" list has the "remove_icon" field
      And each item in the "services_list" list has the "edit_icon" field
      And I click on the "save_draft_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107968 |
          | o2uk    | 12.7    | QANOV-146426 |
          | moves   | 12.7    | QANOV-146427 |
          | blaude  | 13.9    | QANOV-274063 |
          | o2de    | 24.1    | QANOV-580067 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.DRAFT @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can save an entrypoint list as DRAFT in the Services screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "DRAFT" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "add_entrypoint_button" button
      And the "Add Entrypoint" page is loaded
      And I click on the "entrypoint_selector" element
      And clicks on any element in the "entrypoints_list" list that contains the "[CONTEXT:entrypoint_public_id]" text
      And I click on the "add_entrypoint_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "save_draft_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Services" page is loaded
      And the text of the element "confirm_message" is equal to "List changes have been saved"
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And the item with "[CONTEXT:entrypoint_list_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "DRAFT" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154298 |
          | o2uk    | 12.7    | QANOV-154299 |
          | moves   | 12.7    | QANOV-154300 |
          | blaude  | 13.9    | QANOV-274064 |
          | o2de    | 24.1    | QANOV-580068 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can access to the second step (Services) for editing an entrypoints list with services
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "with" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
     Then the "Entrypoint List Services" page is loaded
      And the "add_entrypoint_button" element is displayed
      And the "services_list" list of elements is displayed
      And waits until the "services_list" list is stable
      And each item in the "services_list" list has the "internal_name" field
      And each item in the "services_list" list has the "display_item" field
      And each item in the "services_list" list has the "audiences" field
      And each item in the "services_list" list has the "state" field
      And each item in the "services_list" list has the "remove_icon" field
      And each item in the "services_list" list has the "edit_icon" field
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "continue_button" is equal to "Continue"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107962 |
          | o2uk    | 12.7    | QANOV-146424 |
          | moves   | 12.7    | QANOV-146425 |
          | blaude  | 13.9    | QANOV-274065 |
          | o2de    | 24.1    | QANOV-580069 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can see the information about an entrypoint audience in the second step (Services) for editing an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "with" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "audiences" field on the "any" element in the "services_list" web list
     Then waits until the "audiences_info" element is visible

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154301 |
          | o2uk    | 12.7    | QANOV-154302 |
          | moves   | 12.7    | QANOV-154303 |
          | blaude  | 13.9    | QANOV-274066 |
          | o2de    | 24.1    | QANOV-580070 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can access to edit an entrypoint in the second step (Services) for editing an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "with" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "edit_icon" field on the "any" element in the "services_list" web list
      And I switch to the new window
     Then the "Entrypoint Overview" page is loaded
      And the "title" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154304 |
          | o2uk    | 12.7    | QANOV-154305 |
          | moves   | 12.7    | QANOV-154306 |
          | blaude  | 13.9    | QANOV-274067 |
          | o2de    | 24.1    | QANOV-580071 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can reorder the entrypoints in the second step (Services) for editing an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "with" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And moves some entrypoint in the "services_list" list
     Then the "services_list" list has the new order

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154307 |
          | o2uk    | 12.7    | QANOV-154308 |
          | moves   | 12.7    | QANOV-154309 |
          | blaude  | 13.9    | QANOV-274068 |
          | o2de    | 24.1    | QANOV-580072 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can remove a service from a entrypoint list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "with" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "remove_icon" field on the "any" element in the "services_list" web list
      And the "Confirm Popup" page is loaded
      And I click on the "accept" button
     Then the "Entrypoint List Services" page is loaded
      And the deleted service is not displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108082 |
          | o2uk    | 12.7    | QANOV-146465 |
          | moves   | 12.7    | QANOV-146466 |
          | blaude  | 13.9    | QANOV-274069 |
          | o2de    | 24.1    | QANOV-580073 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.basic
  Scenario Outline: A user can access to the third step (Categories & sorting) for editing an entrypoints list without having configured personalizations previously
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "without" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
     Then the "Entrypoint List Categories And Sorting" page is loaded
      And the "categories_description" element is displayed
      And the text of the element "add_categories_and_custom_sorting_button" is equal to "Add categories and custom sorting"
      And the text of the element "back_button" is equal to "Back"
      And the text of the element "continue_button" is equal to "Continue"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107974 |
          | o2uk    | 12.7    | QANOV-146428 |
          | moves   | 12.7    | QANOV-146429 |
          | blaude  | 13.9    | QANOV-274070 |
          | o2de    | 24.1    | QANOV-580074 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can close the Categories And Sorting screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "with" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154310 |
          | o2uk    | 12.7    | QANOV-154311 |
          | moves   | 12.7    | QANOV-154312 |
          | blaude  | 13.9    | QANOV-274071 |
          | o2de    | 24.1    | QANOV-580075 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can go back from the Categories And Sorting screen to the Services screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list "with" services configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "back_button" web button
     Then the "Entrypoint List Services" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154313 |
          | o2uk    | 12.7    | QANOV-154314 |
          | moves   | 12.7    | QANOV-154315 |
          | blaude  | 13.9    | QANOV-274072 |
          | o2de    | 24.1    | QANOV-580076 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @jira.link.detects.CMS-1178 @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can access to add categories in the "Categories & sorting" screen of an entrypoints list without configured personalizations
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "without" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "add_categories_and_custom_sorting_button" button
     Then the "new_personalization_input" element is displayed
      And the text of the element "new_personalization_empty_case" is equal to "Add your first personalization in the left column"
      And the "info_icon" element is displayed

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107980 |
          | o2uk    | 12.7    | QANOV-146430 |
          | moves   | 12.7    | QANOV-146431 |
          | blaude  | 13.9    | QANOV-274073 |
          | o2de    | 24.1    | QANOV-580078 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can add a new personalization in the "Categories & sorting" screen of an entrypoints list without configured personalizations
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "without" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "add_categories_and_custom_sorting_button" button
      And I fill in the "new_personalization_input" field with "test"
      And I click on the "add_personalization_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
     Then the "personalization_list" list of elements is displayed
      And the "audience_selector" element is displayed
      And the text of the element "sorting_categories_text" is equal to "Sorting and categories"
      And the "new_category_name_input" element is displayed
      And the "services_list" list of elements is displayed
      And each item in the "services_list" list has the "icon" field
      And each item in the "services_list" list has the "name" field

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107992 |
          | o2uk    | 12.7    | QANOV-146434 |
          | moves   | 12.7    | QANOV-146435 |
          | blaude  | 13.9    | QANOV-274074 |
          | o2de    | 24.1    | QANOV-580079 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.with_category_1
  Scenario Outline: A user can select an audience for a personalization in the "Categories & sorting" screen of an entrypoints list with configured personalizations
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "with" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "audience_selector" element
      And I click on the "audience_selector_first_element" button
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Preview And Validate" page is loaded
     Then the text of the element "confirm_message" is equal to "List changes have been saved"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154316 |
          | o2uk    | 12.7    | QANOV-154317 |
          | moves   | 12.7    | QANOV-154318 |
          | blaude  | 13.9    | QANOV-274075 |
          | o2de    | 24.1    | QANOV-580080 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.with_category_1
  Scenario Outline: A user can add a category in the "Categories & sorting" screen of an entrypoints list with configured personalizations
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "with" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I fill in the "new_category_name_input" field with "category_test"
      And I click on the "add_category_button" button
     Then the element in "0" position in the "services_list" list with "category_test" text is displayed
      And the item with "category_test" text in "name" field in the "services_list" list has the "remove_icon" field

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107998 |
          | o2uk    | 12.7    | QANOV-146436 |
          | moves   | 12.7    | QANOV-146438 |
          | blaude  | 13.9    | QANOV-274076 |
          | o2de    | 24.1    | QANOV-580081 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.with_category_1
  Scenario Outline: A user can remove a category in the "Categories & sorting" screen of an entrypoints list with configured personalizations
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "with" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I fill in the "new_category_name_input" field with "new category"
      And I click on the "add_category_button" button
      And I click on the "remove_icon" button of the element with "new category" value in the "name" field of the "services_list" web list
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is visible
      And waits until the "accept" element is clickable
      And I click on the "accept" button
     Then the "Entrypoint List Categories And Sorting" page is loaded
      And the item with "new category" text in "name" field in the "services_list" list is not displayed
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And the text of the element "confirm_message" is equal to "List changes have been saved"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154319 |
          | o2uk    | 12.7    | QANOV-154320 |
          | moves   | 12.7    | QANOV-154321 |
          | blaude  | 13.9    | QANOV-274077 |
          | o2de    | 24.1    | QANOV-580082 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.DRAFT @fixture.cms.entrypoint.with_category_1
  Scenario Outline: A user can save an entrypoint list as DRAFT in the Categories And Sorting screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list in "DRAFT" status with services and "with" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I fill in the "new_category_name_input" field with "category_test"
      And I click on the "add_category_button" button
      And I click on the "save_draft_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And the text of the element "confirm_message" is equal to "List changes have been saved"
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And the item with "[CONTEXT:entrypoint_list_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Draft" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154322 |
          | o2uk    | 12.7    | QANOV-154323 |
          | moves   | 12.7    | QANOV-154324 |
          | blaude  | 13.9    | QANOV-274078 |
          | o2de    | 24.1    | QANOV-580083 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.with_category_1
  Scenario Outline: A user can access to the third step (Categories & sorting) for editing an entrypoints list having configured personalization previously
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "with" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
     Then the "Entrypoint List Categories And Sorting" page is loaded
      And the "new_personalization_input" element is displayed
      And the "personalization_list" list of elements is displayed
      And each item in the "personalization_list" list has the "icon" field
      And each item in the "personalization_list" list has the "name" field
      And each item in the "personalization_list" list has the "remove_icon" field
      And the "audience_selector" element is displayed
      And the text of the element "sorting_categories_text" is equal to "Sorting and categories"
      And the "new_category_name_input" element is displayed
      And the "services_list" list of elements is displayed
      And each item in the "services_list" list has the "icon" field
      And each item in the "services_list" list has the "name" field

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107986 |
          | o2uk    | 12.7    | QANOV-146432 |
          | moves   | 12.7    | QANOV-146433 |
          | blaude  | 13.9    | QANOV-274079 |
          | o2de    | 24.1    | QANOV-580084 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @manual @regression @web
  Scenario Outline: A user can reorder the entrypoints in the "Categories & sorting" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "with" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "add_entrypoint_button" button
      And the "Add Entrypoint" page is loaded
      And I click on the "entrypoint_selector" element
      And I click on the "entrypoint_selector_first_element" element
      And I click on the "add_entrypoint_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And moves some service in the "services_list" list
      And I click on the "save_draft_button" button
     Then the "services_list" list has the new order

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108004 |
          | o2uk    | 12.7    | QANOV-146439 |
          | moves   | 12.7    | QANOV-146440 |
          | blaude  | 13.9    | QANOV-274080 |
          | o2de    | 24.1    | QANOV-580085 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.with_category_1
  Scenario Outline: A user can remove a personalization in the "Categories & sorting" screen of an entrypoints list with configured personalization
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "with" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And clicks on the "remove_icon" button of "personalization_list" list with "0" index
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is visible
      And waits until the "accept" element is clickable
      And I click on the "accept" button
      And the "Entrypoint List Categories And Sorting" page is loaded
     Then the item with "test" text in "name" field in the "personalization_list" list is not displayed
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "save_and_publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And the text of the element "confirm_message" is equal to "List changes have been saved"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154325 |
          | o2uk    | 12.7    | QANOV-154326 |
          | moves   | 12.7    | QANOV-154327 |
          | blaude  | 13.9    | QANOV-274081 |
          | o2de    | 24.1    | QANOV-580086 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web @fixture.cms.entrypoint_list.basic
  @fixture.cms.entrypoint.basic
  Scenario Outline: A user can access to the fourth step (Preview & Validate) for editing an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there is an entrypoint list with services and "without" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
     Then the "Entrypoint List Preview And Validate" page is loaded
      And the "filter_audiences_by_id_input" element is displayed
      And the "available_audiences_list" element is displayed
      And the "selected_audiences_list" element is displayed
      And the "preview_image" element is displayed
      And the "preview_switch" element is displayed
      And the text of the element "back_button" is equal to "Back"
      And switches to iframe
      And the text of the element "entrypoint_list_preview" is equal to "Internal entrypoint list preview"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108010 |
          | o2uk    | 12.7    | QANOV-146441 |
          | moves   | 12.7    | QANOV-146442 |
          | blaude  | 13.9    | QANOV-274082 |
          | o2de    | 24.1    | QANOV-580087 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can close the Preview And Validate screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154328 |
          | o2uk    | 12.7    | QANOV-154329 |
          | moves   | 12.7    | QANOV-154330 |
          | blaude  | 13.9    | QANOV-274083 |
          | o2de    | 24.1    | QANOV-580088 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can go back from the Preview And Validate screen to the Categories And Sorting screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "back_button" web button
     Then the "Entrypoint List Categories And Sorting" page is loaded

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-154331 |
          | o2uk    | 12.7    | QANOV-154332 |
          | moves   | 12.7    | QANOV-154333 |
          | blaude  | 13.9    | QANOV-274084 |
          | o2de    | 24.1    | QANOV-580089 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint.basic
  Scenario Outline: A user can add a condition <condition> audience in the "Preview & Validate" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    The "preview_image" will be updated depending on the audience selected
    Given there is an entrypoint list with services and "without" personalization configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "add_categories_and_custom_sorting_button" button
      And I fill in the "new_personalization_input" field with "test"
      And I click on the "add_personalization_button" button
      And I click on the "add_condition_button" element
      And I click on the "condition_selector" element
      And I click on the "condition_<condition>" element
      And I click on the "audience_selector" element
      And I click on the "audience_selector_first_element" button
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "available_audiences_first_element" element
     Then the "selected_audiences_first_element" element is displayed
      And the "preview_image" element is displayed

    Examples:
          | product | version | condition | jira_id      |
          | vivobr  | 12.7    | with      | QANOV-283825 |
          | vivobr  | 13.9    | without   | QANOV-285799 |
          | o2uk    | 12.7    | with      | QANOV-283826 |
          | o2uk    | 13.9    | without   | QANOV-285800 |
          | moves   | 12.7    | with      | QANOV-283827 |
          | moves   | 13.9    | without   | QANOV-285801 |
          | blaude  | 13.9    | with      | QANOV-283828 |
          | blaude  | 13.9    | without   | QANOV-285802 |
          | o2de    | 24.1    | with      | QANOV-580090 |
          | o2de    | 24.1    | without   | QANOV-580091 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @sanity @web
  Scenario Outline: A user can save an entrypoint list as PAUSED in the "Preview & Validate" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "save_button" button
      And the text of the element "confirm_message" is equal to "List has been saved"
      And the text of the element "test_button" is equal to "Test"
      And the text of the element "publish_button" is equal to "Publish"
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And the item with "[CONTEXT:cms_unique_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Paused" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108016 |
          | o2uk    | 12.7    | QANOV-146443 |
          | moves   | 12.7    | QANOV-146444 |
          | blaude  | 13.9    | QANOV-274086 |
          | o2de    | 24.1    | QANOV-580093 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can see a confirmation popup if he wants to publish an entrypoint list in the "Preview & Validate" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "publish_button" button
     Then the "Confirm Changes Popup" page is loaded
      And the text of the element "message" is equal to "Publishing this list will affect production. Are you sure?"
      And the text of the element "cancel" is equal to "Cancel"
      And the text of the element "confirm" is equal to "Confirm"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108046 |
          | o2uk    | 12.7    | QANOV-146453 |
          | moves   | 12.7    | QANOV-146454 |
          | blaude  | 13.9    | QANOV-274087 |
          | o2de    | 24.1    | QANOV-580094 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @smoke @web
  Scenario Outline: A user can save an entrypoint list as PUBLISHED in the "Preview & Validate" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "publish_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And I click on the "confirm" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And the text of the element "confirm_message" is equal to "List has been published"
      And the text of the element "pause_button" is equal to "Pause"
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And the item with "[CONTEXT:cms_unique_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Published" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108052 |
          | o2uk    | 12.7    | QANOV-146455 |
          | moves   | 12.7    | QANOV-146456 |
          | blaude  | 13.9    | QANOV-274088 |
          | o2de    | 24.1    | QANOV-580095 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can access to test a DRAFT entrypoint list in the "Preview & Validate" screen of an entrypoints list if the list was previously saved
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "save_button" button
      And waits until the "test_button" element is visible
      And I click on the "test_button" button
     Then the "Create Test" page is loaded
      And the text of the element "test_title" is equal to "Create test"
      And the "test_description_input" element is displayed
      And the "test_user_id_input" element is displayed
      And the text of the element "create_test_button" is equal to "Launch test"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108064 |
          | o2uk    | 12.7    | QANOV-146459 |
          | moves   | 12.7    | QANOV-146460 |
          | blaude  | 13.9    | QANOV-274089 |
          | o2de    | 24.1    | QANOV-580096 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.<fixture> @fixture.cms.entrypoint.not_included_in_list
  Scenario Outline: A user can access to test a PUBLISHED or PAUSED entrypoint list in the "Preview & Validate" screen of an entrypoints list if the list is modified
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "<list_status>" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "add_entrypoint_button" button
      And the "Add Entrypoint" page is loaded
      And I click on the "entrypoint_selector" element
      And clicks on any element in the "entrypoints_list" list that contains the "[CONTEXT:entrypoint_public_id]" text
      And I click on the "add_entrypoint_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "<button_name>" button
     Then the "Create Test" page is loaded
      And the text of the element "test_title" is equal to "Create test"
      And the "test_description_input" element is displayed
      And the "test_user_id_input" element is displayed
      And the text of the element "create_test_button" is equal to "Launch test"

    Examples:
          | product | version | list_status | fixture     | button_name                | jira_id      |
          | vivobr  | 12.7    | PUBLISHED   | basic       | save_and_start_test_button | QANOV-108070 |
          | vivobr  | 12.7    | UNPUBLISHED | UNPUBLISHED | save_and_test_button       | QANOV-165218 |
          | o2uk    | 12.7    | PUBLISHED   | basic       | save_and_start_test_button | QANOV-146461 |
          | o2uk    | 12.7    | UNPUBLISHED | UNPUBLISHED | save_and_test_button       | QANOV-165220 |
          | moves   | 12.7    | PUBLISHED   | basic       | save_and_start_test_button | QANOV-146462 |
          | moves   | 12.7    | UNPUBLISHED | UNPUBLISHED | save_and_test_button       | QANOV-165222 |
          | blaude  | 13.9    | PUBLISHED   | basic       | save_and_start_test_button | QANOV-274090 |
          | blaude  | 13.9    | UNPUBLISHED | UNPUBLISHED | save_and_test_button       | QANOV-274091 |
          | o2de    | 24.1    | PUBLISHED   | basic       | save_and_start_test_button | QANOV-580097 |
          | o2de    | 24.1    | UNPUBLISHED | UNPUBLISHED | save_and_test_button       | QANOV-580098 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can confirm to test an entrypoint list in the "Preview & Validate" screen of an entrypoints list if the list is modified
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "create_list" button
      And the "Create New Entrypoint List" page is loaded
      And I fill in the "list_name" field with "[CONF:cms.entrypoint_list_name]"
      And I fill in the "list_id" field with an unique public id value
      And I click on the "create_list" web button
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "save_button" button
      And the text of the element "confirm_message" is equal to "List has been saved"
      And waits until the "confirm_message" element is not visible
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "test_button" button
      And the "Create Test" page is loaded
      And I fill in the "test_description_input" field with "QA Testing entrypoint list"
      And I click on the "create_test_button" button
     Then the "Entrypoint List Preview And Validate" page is loaded
      And the text of the element "confirm_message" is equal to "Test has been created"
      And the text of the element "delete_test_button" is equal to "Discard test"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108076 |
          | o2uk    | 12.7    | QANOV-146463 |
          | moves   | 12.7    | QANOV-146464 |
          | blaude  | 13.9    | QANOV-274092 |
          | o2de    | 24.1    | QANOV-580099 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic @fixture.cms.entrypoint_list_test.basic
  Scenario Outline: A user can discard an entrypoint list test in the "Preview & Validate" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in any of "PUBLISHED_WITH_TEST" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "delete_test_button" button
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is visible
      And waits until the "accept" element is clickable
      And I click on the "accept" button
      And the "Entrypoint List Preview And Validate" page is loaded
     Then the text of the element "confirm_message" is equal to "Test has been deleted"

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-153371 |
          | o2uk    | 12.7    | QANOV-153372 |
          | moves   | 12.7    | QANOV-153373 |
          | blaude  | 13.9    | QANOV-274093 |
          | o2de    | 24.1    | QANOV-580100 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @qa @regression @web @fixture.cms.entrypoint_list.DRAFT
  Scenario Outline: A user can perform several actions in a DRAFT entrypoint list from the Entrypoint List Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "DRAFT" status configured in CMS
      And the entrypoint list is of type "<type>"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "more_options" element on the configured entrypoints list
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_delete_button" is equal to "Delete"
      And the "more_options_publish_button" element is not displayed
      And the "more_options_pause_button" element is not displayed

    @automatic @ber
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154340 |
          | o2uk    | 12.7    | CMS  | QANOV-154341 |
          | moves   | 12.7    | CMS  | QANOV-154342 |
          | blaude  | 13.9    | CMS  | QANOV-274094 |
          | o2de    | 24.1    | CMS  | QANOV-580101 |

    @manual
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 24.0    | API  | QANOV-554922 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @qa @regression @web @fixture.cms.entrypoint_list.basic
  Scenario Outline: A user can perform several actions in a PUBLISHED entrypoint list from the Entrypoint List Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "PUBLISHED" status configured in CMS
      And the entrypoint list is of type "<type>"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "more_options" element on the configured entrypoints list
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_pause_button" is equal to "Pause"
      And the "more_options_publish_button" element is not displayed
      And the "more_options_delete_button" element is not displayed

    @automatic @ber
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154343 |
          | o2uk    | 12.7    | CMS  | QANOV-154344 |
          | moves   | 12.7    | CMS  | QANOV-154345 |
          | blaude  | 13.9    | CMS  | QANOV-274095 |
          | o2de    | 24.1    | CMS  | QANOV-580102 |

    @manual
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 24.0    | API  | QANOV-554923 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @qa @regression @web @fixture.cms.entrypoint_list.UNPUBLISHED
  Scenario Outline: A user can perform several actions in a PAUSED entrypoint list from the Entrypoint List Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "UNPUBLISHED" status configured in CMS
      And the entrypoint list is of type "<type>"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "more_options" element on the configured entrypoints list
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_publish_button" is equal to "Publish"
      And the text of the element "more_options_delete_button" is equal to "Delete"
      And the "more_options_pause_button" element is not displayed

    @automatic @ber
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154346 |
          | o2uk    | 12.7    | CMS  | QANOV-154347 |
          | moves   | 12.7    | CMS  | QANOV-154348 |
          | blaude  | 13.9    | CMS  | QANOV-274096 |
          | o2de    | 24.1    | CMS  | QANOV-580103 |

    @manual
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 24.0    | API  | QANOV-554924 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @qa @regression @web @fixture.cms.entrypoint_list.UNPUBLISHED
  @fixture.cms.entrypoint_list_test.basic
  Scenario Outline: A user can perform several actions in a PAUSED TEST entrypoint list from the Entrypoint List Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "UNPUBLISHED_WITH_TEST" status configured in CMS
      And the entrypoint list is of type "<type>"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "more_options" element on the configured entrypoints list
     Then the text of the element "more_options_edit_button" is equal to "Edit"
      And the text of the element "more_options_delete_button" is equal to "Delete"
      And the "more_options_publish_button" element is not displayed
      And the "more_options_pause_button" element is not displayed

    @automatic @ber
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154349 |
          | o2uk    | 12.7    | CMS  | QANOV-154350 |
          | moves   | 12.7    | CMS  | QANOV-154351 |
          | blaude  | 13.9    | CMS  | QANOV-274097 |
          | o2de    | 24.1    | CMS  | QANOV-580104 |

    @manual
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 24.0    | API  | QANOV-554925 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @qa @regression @web @fixture.cms.entrypoint_list.basic
  Scenario Outline: A user can access to edit an entrypoint list from the Entrypoint List Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in any of "DRAFT,PUBLISHED,UNPUBLISHED,UNPUBLISHED_WITH_TEST" status configured in CMS
      And the entrypoint list is of type "<type>"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "more_options" element on the configured entrypoints list
      And I click on the "more_options_edit_button" element
     Then the "Entrypoint List Overview" page is loaded
      And the text of the element "list_summary_title_input" is equal to "[CONTEXT:entrypoint_list_id]"

    @automatic @ber
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154352 |
          | o2uk    | 12.7    | CMS  | QANOV-154353 |
          | moves   | 12.7    | CMS  | QANOV-154354 |
          | blaude  | 13.9    | CMS  | QANOV-274098 |
          | o2de    | 24.1    | CMS  | QANOV-580105 |

    @manual
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 24.0    | API  | QANOV-554926 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @qa @regression @web @fixture.cms.entrypoint_list.UNPUBLISHED
  Scenario Outline: A user can publish an entrypoint list from the Entrypoint List Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "UNPUBLISHED" status configured in CMS
      And the entrypoint list is of type "<type>"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "more_options" element on the configured entrypoints list
      And I click on the "more_options_publish_button" element
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And waits until the "confirm" element is visible
      And waits until the "confirm" element is clickable
      And I click on the "confirm" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And waits until the "entrypoint_lists_list" list is stable
      And the item with "[CONTEXT:entrypoint_list_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Published" text

    @automatic @ber
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154358 |
          | o2uk    | 12.7    | CMS  | QANOV-154359 |
          | moves   | 12.7    | CMS  | QANOV-154360 |
          | blaude  | 13.9    | CMS  | QANOV-274099 |
          | o2de    | 24.1    | CMS  | QANOV-580106 |

    @manual
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 24.0    | API  | QANOV-554927 |

  @jira.<jira_id> @<product> @ber @e2e @jira.cv.<version> @qa @regression @web @fixture.cms.entrypoint_list.basic
  Scenario Outline: A user can pause an entrypoint list from the Entrypoint List Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "PUBLISHED" status configured in CMS
      And the entrypoint list is of type "<type>"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "more_options" element on the configured entrypoints list
      And I click on the "more_options_pause_button" element
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And waits until the "confirm" element is visible
      And waits until the "confirm" element is clickable
      And I click on the "confirm" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And waits until the "entrypoint_lists_list" list is stable
      And the item with "[CONTEXT:entrypoint_list_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Paused" text

    @automatic @ber
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154361 |
          | o2uk    | 12.7    | CMS  | QANOV-154362 |
          | moves   | 12.7    | CMS  | QANOV-154363 |
          | blaude  | 13.9    | CMS  | QANOV-274100 |
          | o2de    | 24.1    | CMS  | QANOV-580107 |

    @manual
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 24.0    | API  | QANOV-554928 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can filter by name in the Entrypoint List Management page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I fill in the "filter_by_name" field with "\"[CONTEXT:cms_entrypoint_lists.entrypoint_list0.metadata.internalName]\""
      And waits until the "entrypoint_lists_list" list is stable
     Then each element in the "entrypoint_lists_list" list has the "internal_name" field that contains "[CONTEXT:cms_entrypoint_lists.entrypoint_list0.metadata.internalName]" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-107948 |
          | o2uk    | 12.7    | QANOV-146416 |
          | moves   | 12.7    | QANOV-146417 |
          | blaude  | 13.9    | QANOV-274101 |
          | o2de    | 24.1    | QANOV-580108 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.0 @manual @qa @regression @web
  Scenario Outline: A user can filter by id in the Entrypoint List Management page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I fill in the "filter_by_name" field with "[CONTEXT:cms_entrypoint_lists.entrypoint_list0.metadata.id.id]"
      And waits until the "entrypoint_lists_list" list is stable
     Then each element in the "entrypoint_lists_list" list has the "id" field that contains "[CONTEXT:cms_entrypoint_lists.entrypoint_list0.metadata.id.id]" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-554929 |
          | o2uk    | QANOV-554930 |
          | moves   | QANOV-554931 |
          | blaude  | QANOV-554932 |
          | o2de    | QANOV-580109 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.0 @manual @qa @regression @web
  Scenario Outline: A user can filter by list type in the Entrypoint List Management page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists of type "CMS" configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I fill in the "filter_by_type" field with "CMS"
      And waits until the "entrypoint_lists_list" list is stable
     Then each element in the "entrypoint_lists_list" list has the "list_type" field that contains "CMS" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-554933 |
          | o2uk    | QANOV-554934 |
          | moves   | QANOV-554935 |
          | blaude  | QANOV-554936 |
          | o2de    | QANOV-580111 |

  @jira.<jira_id> @<product> @e2e @jira.cv.24.0 @manual @qa @regression @web
  Scenario Outline: A user can filter by display mode in the Entrypoint List Management page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I fill in the "filter_by_display_mode" field with "List - Full width"
      And waits until the "entrypoint_lists_list" list is stable
     Then each element in the "entrypoint_lists_list" list has the "display_mode" field that contains "List - Full width" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-554937 |
          | o2uk    | QANOV-554938 |
          | moves   | QANOV-554939 |
          | blaude  | QANOV-554940 |
          | o2de    | QANOV-580112 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  Scenario Outline: A user can filter by status in the Entrypoint List Management page
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are "several" entrypoints lists configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And I click on the "filter_by_status" element
      And I click on the element with "PUBLISHED" value in "data-value" attribute in the "filter_elements" list
      And I click on the "filter_by_status" web button
      And waits until the "entrypoint_lists_list" list is stable
     Then each element in the "entrypoint_lists_list" list has the "status" field with "Published" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-165228 |
          | o2uk    | 12.7    | QANOV-165229 |
          | moves   | 12.7    | QANOV-165230 |
          | blaude  | 13.9    | QANOV-274102 |
          | o2de    | 24.1    | QANOV-580114 |

  @jira.<jira_id> @<product> @automatic @ber @e2e @jira.cv.<version> @qa @regression @web
  @fixture.cms.entrypoint_list.basic
  Scenario Outline: A user can unpublish an entrypoint list in the "Preview & Validate" screen of an entrypoints list
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in "PUBLISHED" status configured in CMS
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the configured entrypoints list
      And the "Entrypoint List Overview" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Services" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Categories And Sorting" page is loaded
      And I click on the "continue_button" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And I click on the "pause_button" button
      And the "Confirm Changes Popup" page is loaded
      And I fill in the "changes_description_input" field with "QA testing purposes"
      And waits until the "confirm" element is visible
      And waits until the "confirm" element is clickable
      And I click on the "confirm" button
      And the "Entrypoint List Preview And Validate" page is loaded
      And the text of the element "confirm_message" is equal to "List has been paused"
      And the text of the element "publish_button" is equal to "Publish"
      And I click on the "close_button" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" list is stable
      And waits until the "entrypoint_lists_list" element is clickable
      And the item with "[CONTEXT:entrypoint_list_id]" text in "list_id" field in the "entrypoint_lists_list" list has the "status" field with "Paused" text

    Examples:
          | product | version | jira_id      |
          | vivobr  | 12.7    | QANOV-108058 |
          | o2uk    | 12.7    | QANOV-146457 |
          | moves   | 12.7    | QANOV-146458 |
          | blaude  | 13.9    | QANOV-274103 |
          | o2de    | 24.1    | QANOV-580115 |

  @jira.<jira_id> @<product> @e2e @jira.cv.<version> @qa @regression @web @fixture.cms.entrypoint_list.DRAFT
  Scenario Outline: A user can delete an entrypoint list from the Entrypoint List Management screen
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed in QA environment, so be sure to use the proper path.
    Given there are entrypoints lists in any of "DRAFT,UNPUBLISHED,UNPUBLISHED_WITH_TEST" status configured in CMS
      And the entrypoint list is of type "<type>"
     When I go to "[CONF:cms.base][CONF:cms.entrypoint_lists_management]" web page
      And the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And I click on the "more_options" element on the configured entrypoints list
      And I click on the "more_options_delete_button" element
      And the "Confirm Popup" page is loaded
      And waits until the "accept" element is visible
      And waits until the "accept" element is clickable
      And I click on the "accept" button
     Then the "Entrypoint List Management" page is loaded
      And waits until the "entrypoint_lists_list" element is clickable
      And waits until the "entrypoint_lists_list" list is stable
      And the item with "[CONTEXT:entrypoint_list_id]" text in "list_id" field in the "entrypoint_lists_list" list is not displayed

    @automatic @ber
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 12.7    | CMS  | QANOV-154355 |
          | o2uk    | 12.7    | CMS  | QANOV-154356 |
          | moves   | 12.7    | CMS  | QANOV-154357 |
          | blaude  | 13.9    | CMS  | QANOV-274104 |
          | o2de    | 24.1    | CMS  | QANOV-580116 |

    @manual
    Examples:
          | product | version | type | jira_id      |
          | vivobr  | 24.0    | API  | QANOV-554941 |
