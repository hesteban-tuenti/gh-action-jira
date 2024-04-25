# -*- coding: utf-8 -*-
@jira.QANOV-4486 @not_hardening
Feature: In-App Messages Creation


  @jira.<jira_id> @<product> @ber @jira.cv.11.6 @manual @qa @sanity @web
  Scenario Outline: An editor can access to "In-app creation" screen
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages" page is loaded
      And I click on the "create_in_app_button" button
     Then the "In App Messages Type" page is loaded
      And waits until the "in_app_messages_types_list" list is displayed
      And the text of the element "page_title" is equal to "Create New In-app"
      And the text of the element "page_subtitle" is equal to "Create a In-app message"
      And the "header_cancel_button" button is displayed
      And the "header_continue_button" button is displayed
      And the text of the element "name_title" is equal to "Name"
      And the text of the element "name_desc" is equal to "This text won't be visible for users. It will be used to identify the module internally in the CMS."
      And the "name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "type_title" is equal to "Type of in-app"
      And the text of the element "name_desc" is equal to "Select the type of module you want to create. The type of module defines the way the content will be displayed."
      And there are "3" elements on the "in_app_messages_types_list" elements list
      And the "in_app_messages_types_list" elements list contains the text "Localized"
      And the "in_app_messages_types_list" elements list contains the text "Onboarding"
      And the "in_app_messages_types_list" elements list contains the text "Linked"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4635   |
          | moves   | QANOV-4637   |
          | o2uk    | QANOV-4638   |
          | blaude  | QANOV-446889 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @smoke @web @e2e
  Scenario Outline: An editor can select a classic or webview in-app when selecting a "<in-app_type>" in-app
     When I go to "[CONF:cms.base][CONF:in_app_cms.in_app_messages_module]" web page
      And the "In App Messages" page is loaded
      And I click on the "create_in_app_button" button
      And the "In App Messages Type" page is loaded
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
     Then the text of the element "subtype_title" is equal to "Type of <in-app_type_text> In-app"
      And the text of the element "classic_radio" is equal to "Classic In-app"
      And the text of the element "webview_radio" is equal to "Webview"
      And the "classic_radio" checkbox is enabled

    Examples:
          | product | in-app_type | in-app_type_text | jira_id      |
          | vivobr  | Localized   | localized        | QANOV-570454 |
          | vivobr  | Onboarding  | onboarding       | QANOV-570455 |
          | moves   | Localized   | localized        | QANOV-570456 |
          | moves   | Onboarding  | onboarding       | QANOV-570457 |
          | o2uk    | Localized   | localized        | QANOV-570458 |
          | o2uk    | Onboarding  | onboarding       | QANOV-570459 |
          | blaude  | Localized   | localized        | QANOV-570460 |
          | blaude  | Onboarding  | onboarding       | QANOV-570461 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @web
  Scenario Outline: An editor is redirected to the Overview page after selecting a classic <in_app_type> In-App Message
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Type" page is loaded
      And I fill in the "name_input" field with "QA classic <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And I click on the "classic_radio" button
      And I click on the "continue_button" button
     Then the "In App Message Overview" page is loaded
      And the text of the element "page_title" is equal to "QA classic <in_app_type> In-App Message"
      And the text of the element "page_subtitle" is equal to "<in_app_type>"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Target;Preview" textfields is displayed
      And the "name_input" element is displayed
      And the "description_input" element is displayed
      And the text of the element "os_title" is equal to "Operating system (OS)"
      And the text of the element "all_os_radio" is equal to "All OS (Android & iOS)"
      And the text of the element "android_radio" is equal to "Android"
      And the text of the element "ios_radio" is equal to "iOS"
      And the "all_os_radio" checkbox is enabled

    @sanity
    Examples:
          | product | in_app_type | jira_id    |
          | vivobr  | Localized   | QANOV-4487 |
          | moves   | Localized   | QANOV-4491 |
          | o2uk    | Localized   | QANOV-4495 |
          | blaude  | Localized   | QANOV-4495 |

    @smoke
    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Onboarding  | QANOV-4488   |
          | moves   | Onboarding  | QANOV-4492   |
          | o2uk    | Onboarding  | QANOV-4497   |
          | blaude  | Onboarding  | QANOV-446848 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @manual @qa @smoke @web
  Scenario Outline: An editor is redirected to the Overview page after selecting a Linked In-App Message
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Type" page is loaded
      And I fill in the "name_input" field with "QA Linked In-App Message"
      And I click the item with "Linked" text from "in_app_messages_types_list" elements list
      And I click on the "continue_button" button
     Then the "In App Message Overview" page is loaded
      And the text of the element "page_title" is equal to "QA Linked In-App Message"
      And the text of the element "page_subtitle" is equal to "Linked"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Preview" textfields is displayed
      And the "name_input" element is displayed
      And the "description_input" element is displayed
      And the text of the element "os_title" is equal to "Operating system (OS)"
      And the text of the element "all_os_radio" is equal to "All OS (Android & iOS)"
      And the text of the element "android_radio" is equal to "Android"
      And the text of the element "ios_radio" is equal to "iOS"
      And the "all_os_radio" checkbox is enabled

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Linked      | QANOV-4490   |
          | moves   | Linked      | QANOV-4494   |
          | o2uk    | Linked      | QANOV-4500   |
          | blaude  | Linked      | QANOV-446850 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @qa @web @e2e
  Scenario Outline: An editor is redirected to the Overview page after selecting a webview <in_app_type> In-App Message
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Type" page is loaded
      And I fill in the "name_input" field with "QA webview <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And I click on the "webview_radio" button
      And I click on the "continue_button" button
     Then the "In App Message Overview" page is loaded
      And the text of the element "page_title" is equal to "QA webview <in_app_type> In-App Message"
      And the text of the element "page_subtitle" is equal to "<in_app_type>"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Target;Preview" textfields is displayed
      And the "name_input" element is displayed
      And the "description_input" element is displayed
      And the text of the element "os_title" is equal to "Operating system (OS)"
      And the text of the element "all_os_radio" is equal to "All OS (Android & iOS)"
      And the text of the element "android_radio" is equal to "Android"
      And the text of the element "ios_radio" is equal to "iOS"
      And the "all_os_radio" checkbox is enabled

    @sanity
    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-570462 |
          | moves   | Localized   | QANOV-570463 |
          | o2uk    | Localized   | QANOV-570464 |
          | blaude  | Localized   | QANOV-570465 |

    @smoke
    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Onboarding  | QANOV-570466 |
          | moves   | Onboarding  | QANOV-570467 |
          | o2uk    | Onboarding  | QANOV-570468 |
          | blaude  | Onboarding  | QANOV-570469 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor fills the Overview step to create a classic "<in_app_type>" In-App Message and sees the Content step
    internal_checkpoint="both_os is the default option for the operation_system_check. User can select other OS.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be
    executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA classic <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And I click on the "classic_radio" button
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill in the "in_app_name" field with "Qsys creation test"
      And I fill in the "in_app_description" field with "Qsys creation test"
      And I click on the "continue" button
     Then the "In App Message Content" page is loaded
      And the text of the element "page_title" is equal to "QA classic <in_app_type> In-App Message"
      And the text of the element "page_subtitle" is equal to "<in_app_type>"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Target;Preview" textfields is displayed
      And the selected option of the element "stepper_module.steps_list" is equal to "Content"
      And the text of the element "pages_title" is equal to "Pages"
      And the text of the element "pages_subtitle" is equal to "Select the number of pages you want your In-app to have."
      And the "pages_select" element is displayed

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-4501   |
          | vivobr  | Onboarding  | QANOV-4504   |
          | moves   | Localized   | QANOV-4505   |
          | moves   | Onboarding  | QANOV-4508   |
          | o2uk    | Localized   | QANOV-4510   |
          | o2uk    | Onboarding  | QANOV-4512   |
          | blaude  | Localized   | QANOV-446851 |
          | blaude  | Onboarding  | QANOV-446853 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor fills the Overview step to create a webview "<in_app_type>" In-App Message and sees the Content step
    internal_checkpoint="both_os is the default option for the operation_system_check. User can select other OS.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be
    executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA webview <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And I click on the "webview_radio" button
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill in the "in_app_name" field with "Qsys creation test"
      And I fill in the "in_app_description" field with "Qsys creation test"
      And I click on the "continue" button
     Then the "In App Message Content" page is loaded
      And the text of the element "page_title" is equal to "QA webview <in_app_type> In-App Message"
      And the text of the element "page_subtitle" is equal to "<in_app_type>"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Target;Preview" textfields is displayed
      And the selected option of the element "stepper_module.steps_list" is equal to "Content"
      And the text of the element "webview_title" is equal to "Webview page"
      And the text of the element "webview_subtitle" is equal to "Select the webview page you want your In-app to have."
      And the "refresh_button" button is displayed
      And the "webview_select" element is displayed
      And the "dinamic_content_link" link is displayed

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-570470 |
          | vivobr  | Onboarding  | QANOV-570471 |
          | moves   | Localized   | QANOV-570472 |
          | moves   | Onboarding  | QANOV-570473 |
          | o2uk    | Localized   | QANOV-570474 |
          | o2uk    | Onboarding  | QANOV-570475 |
          | blaude  | Localized   | QANOV-570476 |
          | blaude  | Onboarding  | QANOV-570477 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: An editor creating a "<in_app_type>" in-app cannot continue to the Content step if the mandatory fields are left empty
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA <in_app_type> In-App Message"
      And I click on the "continue_button" button
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I click on the "continue" button
     Then the "validation_error" element is under "in_app_name" element
      And the "validation_error" element is under "in_app_description" element

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-4513   |
          | vivobr  | Onboarding  | QANOV-4516   |
          | vivobr  | Linked      | QANOV-4530   |
          | moves   | Localized   | QANOV-4518   |
          | moves   | Onboarding  | QANOV-4520   |
          | moves   | Linked      | QANOV-4531   |
          | o2uk    | Localized   | QANOV-4522   |
          | o2uk    | Onboarding  | QANOV-4524   |
          | o2uk    | Linked      | QANOV-4528   |
          | blaude  | Localized   | QANOV-446854 |
          | blaude  | Onboarding  | QANOV-446856 |
          | blaude  | Linked      | QANOV-446857 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @manual @regression @web
  Scenario Outline: An editor fills the Overview step to create an In-App Message and sees the Content step for Linked In-App message
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA Linked In-App Message"
      And I click the item with "Linked" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill in the "in_app_name" field with "Qsys creation test"
      And I fill in the "in_app_description" field with "Qsys creation test"
      And I click on the "continue" button
     Then the "In App Messages Content" page is loaded
      And the selected option of the element "stepper_module.steps_list" is equal to "Content"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4525   |
          | moves   | QANOV-4527   |
          | o2uk    | QANOV-4528   |
          | blaude  | QANOV-446857 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor creating a classic "<in_app_type>" in-app fills the Content step with only one card and sees the Target step
    internal_checkpoint="include_closing_icon is the default option for the dismiss_content.
    User can select not_include_closing_option too
    paragraph is the default option for the description_type. User can select checklist too
    one_button is the default option for the button_list. User can select two_button and button_and_link too.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed
    in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA classic <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And I click on the "classic_radio" button
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill in the "in_app_name" field with "Qsys creation test"
      And I fill in the "in_app_description" field with "Qsys creation test"
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I select the "1" option by value from "pages_select" field
      And I fill in the "page_1_in_app_card_title" field with "Qsys creation test"
      And I fill in the "page_1_in_app_card_description" field with "Qsys creation test"
      And I upload an "page_1_image" in the "media_field" field
      And I fill in the "page_1_alternative_image_text" field with "Qsys creation test image"
      And I fill in the "page_1_button1_text" field with "Confirm"
      And I click on the "continue" button
     Then the "In App Messages Target" page is loaded
      And the text of the element "page_title" is equal to "QA classic <in_app_type> In-App Message"
      And the text of the element "page_subtitle" is equal to "<in_app_type>"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Target;Preview" textfields is displayed
      And the selected option of the element "stepper_module.steps_list" is equal to "Target"

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-4534   |
          | vivobr  | Onboarding  | QANOV-4535   |
          | moves   | Localized   | QANOV-4537   |
          | moves   | Onboarding  | QANOV-4538   |
          | o2uk    | Localized   | QANOV-4540   |
          | o2uk    | Onboarding  | QANOV-4541   |
          | blaude  | Localized   | QANOV-446859 |
          | blaude  | Onboarding  | QANOV-446860 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor creating a webview "<in_app_type>" in-app fills the Content step and sees the Target step
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA webview <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And I click on the "webview_radio" button
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill in the "in_app_name" field with "Qsys creation test"
      And I fill in the "in_app_description" field with "Qsys creation test"
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I select the "first" option from "webview_select" field
      And I click on the "continue" button
     Then the "In App Messages Target" page is loaded
      And the text of the element "page_title" is equal to "QA webview <in_app_type> In-App Message"
      And the text of the element "page_subtitle" is equal to "<in_app_type>"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Target;Preview" textfields is displayed
      And the selected option of the element "stepper_module.steps_list" is equal to "Target"

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-570478 |
          | vivobr  | Onboarding  | QANOV-570479 |
          | moves   | Localized   | QANOV-570480 |
          | moves   | Onboarding  | QANOV-570481 |
          | o2uk    | Localized   | QANOV-570482 |
          | o2uk    | Onboarding  | QANOV-570483 |
          | blaude  | Localized   | QANOV-570484 |
          | blaude  | Onboarding  | QANOV-570485 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web
  Scenario Outline: An editor creating a classic in-app cannot continue to the Target step if the mandatory fields are left empty
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA classic <in_app_type> In-App Message"
      And I click the item with "Localized" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill in the "in_app_name" field with "Qsys creation test"
      And I fill in the "in_app_description" field with "Qsys creation test"
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I select the "1" option by value from "pages_select" field
      And I click on the "continue" button
     Then the "validation_error" element is under "in_app_card_title" element
      And the "validation_error" element is under "in_app_card_description" element
      And the "validation_error" element is under "media_field" element
      And the "validation_error" element is under "button1_text" element

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4542   |
          | moves   | QANOV-4547   |
          | o2uk    | QANOV-4551   |
          | blaude  | QANOV-446861 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor creating a webview in-app cannot continue to the Target step if the mandatory fields are left empty
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA webview In-App Message"
      And I click the item with "Localized" text from "in_app_messages_types_list" elements list
      And I click on the "webview_radio" button
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill in the "in_app_name" field with "Qsys creation test"
      And I fill in the "in_app_description" field with "Qsys creation test"
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I click on the "continue" button
     Then the "validation_error" element is under "webview_select" element

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4568   |
          | moves   | QANOV-4569   |
          | o2uk    | QANOV-4570   |
          | blaude  | QANOV-446868 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor creating a classic "<in_app_type>" in-app fills the Content step to create an In-App Message with several cards and sees the Target step
    internal_checkpoint="include_closing_icon is the default option for the dismiss_content.
    User can select not_include_closing_option too
    no_button is the default option for the navigation_configuration. User can select button_as_next too
    paragraph is the default option for the description_type. User can select checklist too
    one_button is the default option for the button_list. User can select two_button and button_and_link too.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed
    in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA classic <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I select the "2" option by value from "pages_select" field
      And for each card I fill in the "in_app_card_title" field with "Qsys creation test card index"
      And for each card I fill in the "in_app_card_description" field with "Qsys creation test card index"
      And for each card I upload an "image" in the "media_field" field
      And for each card I fill in the "alternative_image_text" field with "Qsys creation test image"
      And for each card I fill in the "button1_text" field with "Confirm"
      And I click on the "continue" button
     Then the "In App Messages Target" page is loaded
      And the selected option of the element "stepper_module.steps_list" is equal to "Target"

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-4555   |
          | vivobr  | Onboarding  | QANOV-4557   |
          | moves   | Localized   | QANOV-4558   |
          | moves   | Onboarding  | QANOV-4559   |
          | o2uk    | Localized   | QANOV-4561   |
          | o2uk    | Onboarding  | QANOV-4562   |
          | blaude  | Localized   | QANOV-446864 |
          | blaude  | Onboarding  | QANOV-446865 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @manual @regression @web
  Scenario Outline: An editor fills the Content step to create a Linked In-App Message and sees the Preview step
    internal_checkpoint="include_closing_icon is the default option for the dismiss_content.
    User can select not_include_closing_option too
    paragraph is the default option for the description_type. User can select checklist too
    one_button is the default option for the button_list. User can select two_button and button_and_link too
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed
    in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA Linked In-App Message"
      And I click the item with "Linked" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I select the "1" option by value from "pages_select" field
      And I fill in the "page_1_in_app_card_title" field with "Qsys creation test"
      And I fill in the "page_1_in_app_card_description" field with "Qsys creation test"
      And I upload an "page_1_image" in the "media_field" field
      And I fill in the "page_1_alternative_image_text" field with "Qsys creation test image"
      And I fill in the "page_1_button1_text" field with "Confirm"
      And I click on the "continue" button
     Then the "In App Message Preview" page is loaded
      And the text of the element "page_title" is equal to "QA Linked In-App Message"
      And the text of the element "page_subtitle" is equal to "Linked"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Preview" textfields is displayed
      And the selected option of the element "stepper_module.steps_list" is equal to "Preview"
      And the "title" textfield is displayed
      And the "description" textfield is displayed
      And the "os" textfield is displayed
      And the text of the element "google_analytics_title" is equal to "Google Analytics"
      And the text of the element "screen_name_title" is equal to "Screen name"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4568   |
          | moves   | QANOV-4569   |
          | o2uk    | QANOV-4570   |
          | blaude  | QANOV-446868 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @manual @regression @web
  Scenario Outline: An editor cannot see the Preview step for Linked In-App Message if the mandatory fields are left empty
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA Linked In-App Message"
      And I click the item with "Linked" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I click on the "continue" button
     Then the "validation_error" element is under "in_app_card_title" element
      And the "validation_error" element is under "in_app_card_description" element
      And the "validation_error" element is under "media_field" element
      And the "validation_error" element is under "button1_text" element

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4572   |
          | moves   | QANOV-4573   |
          | o2uk    | QANOV-4575   |
          | blaude  | QANOV-446869 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor creating a classic "<in_app_type>" in-app fills the Target fields and sees the Preview step
    internal_checkpoint="The editor can select app_access for the display options instead tab_access for Localized In-App Message
    app_version is an optional field. The editor can select start version, end version or both.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed
    in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA classic <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Messages Target" page is loaded
      And I click on the "continue" button
     Then the "In App Messages Preview" page is loaded
      And the selected option of the element "stepper_module.steps_list" is equal to "Preview"
      And the "title" textfield is displayed
      And the "description" textfield is displayed
      And the "os" textfield is displayed
      And the "app_version" textfield is displayed
      And the "layout" textfield is displayed
      And the "display_options" textfield is displayed
      And the "audience" textfield is displayed
      And the text of the element "dates_title" is equal to "Specific dates"
      And the text of the element "dates_subtitle" is equal to "You can set dates to speficy a range of dates when the message will appear. By default, the time is between 00:00am and 06:00am."
      And the "start_date_select" element is displayed
      And the "finish_date_select" element is displayed
      And the text of the element "google_analytics_title" is equal to "Google Analytics"
      And the text of the element "screen_name_title" is equal to "Screen name"

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-4576   |
          | vivobr  | Onboarding  | QANOV-4577   |
          | moves   | Localized   | QANOV-4578   |
          | moves   | Onboarding  | QANOV-4580   |
          | o2uk    | Localized   | QANOV-4581   |
          | o2uk    | Onboarding  | QANOV-4583   |
          | blaude  | Localized   | QANOV-446870 |
          | blaude  | Onboarding  | QANOV-446871 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor creating a webview "<in_app_type>" in-app fills the Target fields and sees the Preview step
    internal_checkpoint="The editor can select app_access for the display options instead tab_access for Localized In-App Message
    app_version is an optional field. The editor can select start version, end version or both.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this test must be executed
    in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA webview <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And I click on the "webview_radio" button
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Messages Target" page is loaded
      And I click on the "continue" button
     Then the "In App Messages Preview" page is loaded
      And the text of the element "page_title" is equal to "QA webview <in_app_type> In-App Message"
      And the text of the element "page_subtitle" is equal to "<in_app_type>"
      And the "header_cancel_button" button is displayed
      And the "header_save_button" button is displayed
      And the "stepper_module" module is displayed
      And the "stepper_module.steps_list" list with "Overview;Content;Target;Preview" textfields is displayed
      And the selected option of the element "stepper_module.steps_list" is equal to "Preview"
      And the text of the element "preview_title" is equal to "Preview"
      And the "title" textfield is displayed
      And the "description" textfield is displayed
      And the "os" textfield is displayed
      And the "app_version" textfield is displayed
      And the "url" textfield is displayed
      And the "display_options" textfield is displayed
      And the "audience" textfield is displayed
      And the text of the element "dates_title" is equal to "Specific dates"
      And the text of the element "dates_subtitle" is equal to "You can set dates to speficy a range of dates when the message will appear. By default, the time is between 00:00am and 06:00am."
      And the "start_date_select" element is displayed
      And the "finish_date_select" element is displayed
      And the text of the element "google_analytics_title" is equal to "Google Analytics"
      And the text of the element "screen_name_title" is equal to "Screen name"

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-4576   |
          | vivobr  | Onboarding  | QANOV-4577   |
          | moves   | Localized   | QANOV-4578   |
          | moves   | Onboarding  | QANOV-4580   |
          | o2uk    | Localized   | QANOV-4581   |
          | o2uk    | Onboarding  | QANOV-4583   |
          | blaude  | Localized   | QANOV-446870 |
          | blaude  | Onboarding  | QANOV-446871 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @smoke @web @e2e
  Scenario Outline: An editor creating a classic "<in_app_type>" in-app who fills the Preview step and publish will see it in the list
    internal_checkpoint="schedule in optional. The editor can select start date and finish date to show the
    In-App Message.
    WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I fill in the "name_input" field with "QA classic <in_app_type> In-App Message"
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Message Target" page is loaded
      And I fill all the mandatory items of the "Target" form
      And I click on the "continue" button
      And the "In App Message Preview" page is loaded
      And I fill in the "google_analytics" field with "Analytics Test"
      And I click on the "publish" button
     Then the "In App Messages CMS" page is loaded
      And the "in_app_messages_list" list of elements is displayed
      And the value of "first" cell of table "in_app_messages_list" contains "PUBLISHED"
      And the text of the element "confirmation_message" is equal to "Published successfully"

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-4600   |
          | vivobr  | Onboarding  | QANOV-4602   |
          | moves   | Localized   | QANOV-4604   |
          | moves   | Onboarding  | QANOV-4606   |
          | o2uk    | Localized   | QANOV-4609   |
          | o2uk    | Onboarding  | QANOV-4610   |
          | blaude  | Localized   | QANOV-446876 |
          | blaude  | Onboarding  | QANOV-446877 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @manual @regression @web
  Scenario Outline: An editor creating a "<in_app_type>" in-app cannot publish if the mandatory fields are left empty
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I click the item with "<in_app_type>" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Message Target" page is loaded
      And I fill all the mandatory items of the "Target" form
      And I click on the "continue" button
      And the "In App Message Preview" page is loaded
      And I click on the "publish" button
     Then the "validation_error" element is under "google_analytics" element

    Examples:
          | product | in_app_type | jira_id      |
          | vivobr  | Localized   | QANOV-4613   |
          | vivobr  | Onboarding  | QANOV-4614   |
          | moves   | Localized   | QANOV-4617   |
          | moves   | Onboarding  | QANOV-4618   |
          | o2uk    | Localized   | QANOV-4621   |
          | o2uk    | Onboarding  | QANOV-4622   |
          | blaude  | Localized   | QANOV-446879 |
          | blaude  | Onboarding  | QANOV-446880 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @manual @smoke @web
  Scenario Outline: An editor fills the Preview step to create an In-App Message and can see it in the list for Linked In-App Onboarding
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And I click the item with "Linked" text from "in_app_messages_types_list" elements list
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I click on the "continue" button
      And the "In App Message Preview" page is loaded
      And I fill in the "google_analytics" field with "Analytics Test"
      And I click on the "publish" button
     Then the "In App Messages CMS" page is loaded
      And the "in_app_messages_list" list of elements is displayed
      And the value of "first" cell of table "in_app_messages_list" contains "PUBLISHED"
      And the text of the element "confirmation_message" is equal to "Published successfully"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4625   |
          | moves   | QANOV-4627   |
          | o2uk    | QANOV-4628   |
          | blaude  | QANOV-446882 |

  @jira.<jira_id> @<product> @jira.cv.11.6 @manual @regression @web
  Scenario Outline: An editor cannot publish an In-App message if the mandatory fields are left empty for Linked In-App Onboarding
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment. However, this
    test must be executed in DEV/CERT environment, so be sure to use the proper path."
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Creation" page is loaded
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I click on the "continue" button
      And the "In App Message Preview" page is loaded
      And I click on the "publish" button
     Then the "validation_error" element is under "google_analytics" element

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-4630   |
          | moves   | QANOV-4631   |
          | o2uk    | QANOV-4632   |
          | blaude  | QANOV-446883 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor can who saves the In-App Message will see a confirmation popup
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Type" page is loaded
      And I fill in the "name_input" field with "QA classic Localized In-App Message"
      And I click the item with "Localized" text from "in_app_messages_types_list" elements list
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Messages Target" page is loaded
      And I click on the "continue" button
      And the "In App Messages Preview" page is loaded
      And I click on the "save" button
     Then the "save_in-app_draft_popup" element is displayed
      And the text of the element "popup_title" is equal to "Save In-App as draft"
      And the text of the element "popup_text" is equal to "Save the In-App as draft and you can publish it whenever you want."
      And the text of the element "save_draft_button" is equal to "Save draft"
      And the text of the element "save_publish_button" is equal to "Cancel"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-570486 |
          | moves   | QANOV-570487 |
          | o2uk    | QANOV-570488 |
          | blaude  | QANOV-570489 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor can who cancels the Save as draft popup will remain in the same screen
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Type" page is loaded
      And I fill in the "name_input" field with "QA classic Localized In-App Message"
      And I click the item with "Localized" text from "in_app_messages_types_list" elements list
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Messages Target" page is loaded
      And I click on the "continue" button
      And the "In App Messages Preview" page is loaded
      And I click on the "save" button
      And the "save_in-app_draft_popup" element is displayed
      And I click on the "cancel" button
     Then the "In App Messages Preview" page is loaded

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-570490 |
          | moves   | QANOV-570491 |
          | o2uk    | QANOV-570492 |
          | blaude  | QANOV-570493 |

  @jira.<jira_id> @<product> @jira.cv.24.2 @jira.link.parent_test_plan.QANOV-554878 @manual @regression @web @e2e
  Scenario Outline: An editor can who saves the in-app as draft will see it in the In App Messages page
     When I go to "[CONF:cms.base][CONF:in_app_cms.create]" web page
      And the "In App Messages Type" page is loaded
      And I fill in the "name_input" field with "QA Localized In-App Message draft"
      And I click the item with "Localized" text from "in_app_messages_types_list" elements list
      And I click on the "continue_button" button
      And the "In App Message Overview" page is loaded
      And I fill all the mandatory items of the "Overview" form
      And I click on the "continue" button
      And the "In App Message Content" page is loaded
      And I fill all the mandatory items of the "Content" form
      And I click on the "continue" button
      And the "In App Messages Target" page is loaded
      And I click on the "continue" button
      And the "In App Messages Preview" page is loaded
      And I click on the "save" button
      And the "save_in-app_draft_popup" element is displayed
      And I click on the "save_draft_button" button
     Then the "In App Messages" page is loaded
      And the "in_app_messages_list" list of elements is displayed
      And the element in "0" position in the "in_app_messages_list" list has the "status" textfield with the "Pending publication" text

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-570494 |
          | moves   | QANOV-570495 |
          | o2uk    | QANOV-570496 |
          | blaude  | QANOV-570497 |
