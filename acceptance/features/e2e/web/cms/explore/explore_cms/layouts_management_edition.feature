# -*- coding: utf-8 -*-
@jira.QANOV-322034 @not_hardening
Feature: Layouts edition


  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @jira.link.parent_test_plan.QANOV-386148 @manual
  @web
  Scenario Outline: A user can edit a layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has ">=1" "<layouts_type>" layouts created
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I store the text in the "first_layout_name" element in the context storage with key "layout_name"
      And I click on the "actions_button" button
      And I click on the "actions_edit_button" button
      And the "Edit Layout" page is loaded
      And the text of the element "page_title" contains "Editing: "
      And the text of the element "page_subtitle" is equal to "<subtitle>"
      And the "header_cancel_button" button is displayed
      And the "next_button" button is displayed
      And the "stepper_layout_list" module is displayed
      And the "stepper_layout_list" list with "Content;Modules" textfields is displayed
      And the text of the element "internal_name_input" is equal to "[CONTEXT:layout_name]"
      And I click on the "add_condition_button" button
      And I select the "is_option" option from "is_or_is_not_dropdown" field
      And I select the "first_option" option from "audience_dropdown" field
      And I click on the "next_button" button
      And the "Modules" page is loaded
      And I click on the "add_module_button" button
      And the "add_module_popup" popup is displayed
      And I click on the "add_module_popup_selector" element
      And I store the text in the "first_module" element in the context storage with key "first_module_name"
      And I select the "first_module" option from "add_module_popup_selector" field
      And I click on the "add_module_popup_button" button
      And I click on the "save_button" button
     Then the "Layouts Repository" page is loaded
      And any element in the "layouts_list" list has the "layout" textfield with the "[CONTEXT:layout_name]" text

    @ber @jira.cv.14.6 @sanity
    Examples:
          | product | layouts_type | subtitle | jira_id      |
          | blaude  | account      | Account  | QANOV-322048 |
          | o2de    | start        | Start    | QANOV-322044 |

    @ber @jira.cv.Future @sanity
    Examples:
          | product | layouts_type | subtitle | jira_id      |
          | vivobr  | account      | Account  | QANOV-322035 |
          | o2uk    | priority     | priority | QANOV-322040 |
          | moves   | explore      | Explore  | QANOV-322046 |
          | o2es    | explore      | Explore  | QANOV-374185 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | subtitle | jira_id      |
          | blaude  | explore      | Explore  | QANOV-322049 |
          | blaude  | start        | Start    | QANOV-322050 |
          | o2de    | account      | Account  | QANOV-322042 |
          | o2de    | explore      | Explore  | QANOV-322043 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | subtitle | jira_id      |
          | vivobr  | explore      | Explore  | QANOV-322036 |
          | vivobr  | start        | Start    | QANOV-322037 |
          | o2uk    | account      | Account  | QANOV-322038 |
          | o2uk    | explore      | Explore  | QANOV-322039 |
          | o2uk    | start        | Start    | QANOV-322041 |
          | moves   | account      | Account  | QANOV-322045 |
          | moves   | start        | Start    | QANOV-322047 |
          | o2es    | account      | Account  | QANOV-374186 |
          | o2es    | start        | Start    | QANOV-374187 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @jira.link.parent_test_plan.QANOV-386148 @manual
  @web
  Scenario Outline: A user can edit the order of the modules of a new layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I fill in the "internal_name_input" field with "Qa Test |new layout|"
      And I click on the "next_button" button
      And the "Modules" page is loaded
      And I click on the "add_module_button" button
      And I select the "first_option" option from "add_module_popup_selector" field
      And I click on the "add_module_popup_button" button
      And I click on the "add_module_button" button
      And I select the "first_option" option from "add_module_popup_selector" field
      And I click on the "add_module_popup_button" button
      And I click on the "add_module_button" button
      And I select the "first_option" option from "add_module_popup_selector" field
      And I click on the "add_module_popup_button" button
      And I drag one module to another position
      And the new module order in the "modules_section" is displayed

    @ber @jira.cv.14.6 @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-322064 |
          | o2de    | start        | QANOV-322060 |

    @ber @jira.cv.Future @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-322051 |
          | o2uk    | priority     | QANOV-322056 |
          | moves   | explore      | QANOV-322062 |
          | o2es    | explore      | QANOV-374188 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | explore      | QANOV-322065 |
          | blaude  | start        | QANOV-322066 |
          | o2de    | account      | QANOV-322058 |
          | o2de    | explore      | QANOV-322059 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | explore      | QANOV-322052 |
          | vivobr  | start        | QANOV-322053 |
          | o2uk    | account      | QANOV-322054 |
          | o2uk    | explore      | QANOV-322055 |
          | o2uk    | start        | QANOV-322057 |
          | moves   | account      | QANOV-322061 |
          | moves   | start        | QANOV-322063 |
          | o2es    | account      | QANOV-374189 |
          | o2es    | start        | QANOV-374190 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @jira.link.parent_test_plan.QANOV-386148 @manual
  @web
  Scenario Outline: A user can edit a module of a new layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I fill in the "internal_name_input" field with "Qa Test |new layout|"
      And I click on the "next_button" button
      And the "Modules" page is loaded
      And I click on the "add_module_button" button
      And I select the "first_option" option from "add_module_popup_selector" field
      And I click on the "add_module_popup_button" button
      And the "edit_module_button" button is displayed
      And the "delete_module_button" button is displayed
      And I click on the "edit_module_button" button
     Then the "edit_module_page" page is loaded

    @ber @jira.cv.14.6 @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-322080 |
          | o2de    | start        | QANOV-322076 |

    @ber @jira.cv.Future @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-322067 |
          | o2uk    | priority     | QANOV-322072 |
          | moves   | explore      | QANOV-322078 |
          | o2es    | explore      | QANOV-374191 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | explore      | QANOV-322081 |
          | blaude  | start        | QANOV-322082 |
          | o2de    | account      | QANOV-322074 |
          | o2de    | explore      | QANOV-322075 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | explore      | QANOV-322068 |
          | vivobr  | start        | QANOV-322069 |
          | o2uk    | account      | QANOV-322070 |
          | o2uk    | explore      | QANOV-322071 |
          | o2uk    | start        | QANOV-322073 |
          | moves   | account      | QANOV-322077 |
          | moves   | start        | QANOV-322079 |
          | o2es    | account      | QANOV-374192 |
          | o2es    | start        | QANOV-374193 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @jira.link.parent_test_plan.QANOV-386148 @manual
  @web
  Scenario Outline: A user can delete a layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a layout has been created in CMS
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I store the text in the "first_layout_name" element in the context storage with key "layout_name"
      And I click on the "actions_button" button
      And I click on the "actions_delete_button" button
      And the "delete_popup" page is displayed
      And I click on the "delete_popup_button" button
     Then the "Layouts Repository" page is loaded
      And no element in the "layouts_list" list has the value "[CONTEXT:layout_name]" in the "layout" field

    @ber @jira.cv.14.6 @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-322096 |
          | o2de    | start        | QANOV-322092 |

    @ber @jira.cv.Future @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-322083 |
          | o2uk    | priority     | QANOV-322088 |
          | moves   | explore      | QANOV-322094 |
          | o2es    | explore      | QANOV-374194 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | explore      | QANOV-322097 |
          | blaude  | start        | QANOV-322098 |
          | o2de    | account      | QANOV-322090 |
          | o2de    | explore      | QANOV-322091 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | explore      | QANOV-322084 |
          | vivobr  | start        | QANOV-322085 |
          | o2uk    | account      | QANOV-322086 |
          | o2uk    | explore      | QANOV-322087 |
          | o2uk    | start        | QANOV-322089 |
          | moves   | account      | QANOV-322093 |
          | moves   | start        | QANOV-322095 |
          | o2es    | account      | QANOV-374195 |
          | o2es    | start        | QANOV-374196 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user deactivate a layout that is "<status>"
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "<status>" layout has been created in the CMS
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "actions_icon" element with "status" field with "<status>" value of the "layouts_list" list
      And I store the text in the "edited_layout" element in the context storage with key "layout_name"
      And I click on the "actions_edit_button" button
      And I click on the "actions_deactivate_button" button
     Then no element with "[CONTEXT:layout_name]" name in the "layout" list has the value "<status>" in the "status" field

    @jira.cv.14.6
    Examples:
          | product | layouts_type | status    | jira_id      |
          | blaude  | account      | Published | QANOV-322125 |
          | blaude  | account      | Modified  | QANOV-322126 |
          | blaude  | explore      | Published | QANOV-322127 |
          | blaude  | explore      | Modified  | QANOV-322128 |
          | blaude  | start        | Published | QANOV-322129 |
          | blaude  | start        | Modified  | QANOV-322130 |
          | o2de    | account      | Published | QANOV-322113 |
          | o2de    | account      | Modified  | QANOV-322114 |
          | o2de    | explore      | Published | QANOV-322115 |
          | o2de    | explore      | Modified  | QANOV-322116 |
          | o2de    | start        | Published | QANOV-322117 |
          | o2de    | start        | Modified  | QANOV-322118 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | status    | jira_id      |
          | vivobr  | account      | Published | QANOV-322099 |
          | vivobr  | account      | Modified  | QANOV-322100 |
          | vivobr  | explore      | Published | QANOV-322101 |
          | vivobr  | explore      | Modified  | QANOV-322102 |
          | vivobr  | start        | Published | QANOV-322103 |
          | vivobr  | start        | Modified  | QANOV-322104 |
          | o2uk    | account      | Published | QANOV-322105 |
          | o2uk    | account      | Modified  | QANOV-322106 |
          | o2uk    | explore      | Published | QANOV-322107 |
          | o2uk    | explore      | Modified  | QANOV-322108 |
          | o2uk    | priority     | Published | QANOV-322109 |
          | o2uk    | priority     | Modified  | QANOV-322110 |
          | o2uk    | start        | Published | QANOV-322111 |
          | o2uk    | start        | Modified  | QANOV-322112 |
          | moves   | account      | Published | QANOV-322119 |
          | moves   | account      | Modified  | QANOV-322120 |
          | moves   | explore      | Published | QANOV-322121 |
          | moves   | explore      | Modified  | QANOV-322122 |
          | moves   | start        | Published | QANOV-322123 |
          | moves   | start        | Modified  | QANOV-322124 |
          | o2es    | account      | Published | QANOV-374197 |
          | o2es    | account      | Modified  | QANOV-374198 |
          | o2es    | explore      | Published | QANOV-374199 |
          | o2es    | explore      | Modified  | QANOV-374200 |
          | o2es    | start        | Published | QANOV-374201 |
          | o2es    | start        | Modified  | QANOV-374202 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user activate a layout that is inactive
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "<status>" layout has been created in the CMS
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "actions_icon" element with "status" field with "<status>" value of the "layouts_list" list
      And I store the text in the "edited_layout" element in the context storage with key "layout_name"
      And I click on the "actions_edit_button" button
      And I click on the "actions_activate_button" button of the element with ".*" value in the ".*" field
     Then no element with "[CONTEXT:layout_name]" name in the "layout" list has the value "<status>" in the "status" field

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-322144 |
          | blaude  | explore      | QANOV-322145 |
          | blaude  | start        | QANOV-322146 |
          | o2de    | account      | QANOV-322138 |
          | o2de    | explore      | QANOV-322139 |
          | o2de    | start        | QANOV-322140 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-322131 |
          | vivobr  | explore      | QANOV-322132 |
          | vivobr  | start        | QANOV-322133 |
          | o2uk    | account      | QANOV-322134 |
          | o2uk    | explore      | QANOV-322135 |
          | o2uk    | priority     | QANOV-322136 |
          | o2uk    | start        | QANOV-322137 |
          | moves   | account      | QANOV-322141 |
          | moves   | explore      | QANOV-322142 |
          | moves   | start        | QANOV-322143 |
          | o2es    | account      | QANOV-374203 |
          | o2es    | explore      | QANOV-374204 |
          | o2es    | start        | QANOV-374205 |
