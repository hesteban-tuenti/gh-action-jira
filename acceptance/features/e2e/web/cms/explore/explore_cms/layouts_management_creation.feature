# -*- coding: utf-8 -*-
@jira.QANOV-321889 @not_hardening
Feature: Layouts creation


  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @web
  Scenario Outline: A user can access to first step of create a new layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
     Then the "New Layout" page is loaded
      And the text of the element "page_title" is equal to "New Layout"
      And the text of the element "page_subtitle" is equal to "<layout_subtitle>"
      And the "header_cancel_button" button is displayed
      And the "stepper_layout_list" module is displayed
      And the "stepper_layout_list" list with "Content;Modules" textfields is displayed
      And the text of the element "content_title" is equal to "Content"
      And the text of the element "name_subtitle" is equal to "Name"
      And the text of the element "name_description" is equal to "The text won't be visible for users. It will be used to identify the module internally in the CMS."
      And the "internal_name_input" inputtext with the "Name" placeholder is displayed
      And the text of the element "Status_subtitle" is equal to "Status"
      And the "status_switch" element is displayed
      And the "status_switch" switch is enabled
      And the text of the element "status_switch_text" is equal to "Activated"
      And the text of the element "add_conditions_subtitle" is equal to "Select your audiences (optional)"
      And the "add_condition_button" button is displayed
      And the "next_button" button is displayed

    @ber @jira.cv.14.6 @smoke
    Examples:
          | product | layouts_type | layout_subtitle | jira_id      |
          | blaude  | start        | Start           | QANOV-321905 |
          | o2de    | start        | Start           | QANOV-321899 |

    @ber @jira.cv.Future @smoke
    Examples:
          | product | layouts_type | layout_subtitle | jira_id      |
          | vivobr  | account      | Account         | QANOV-321890 |
          | o2uk    | explore      | Explore         | QANOV-321894 |
          | moves   | explore      | Explore         | QANOV-321901 |
          | o2es    | account      | Account         | QANOV-374126 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | layout_subtitle | jira_id      |
          | blaude  | account      | Account         | QANOV-321903 |
          | blaude  | explore      | Explore         | QANOV-321904 |
          | o2de    | account      | Account         | QANOV-321897 |
          | o2de    | explore      | Explore         | QANOV-321898 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | layout_subtitle | jira_id      |
          | vivobr  | offers       | Explore         | QANOV-321891 |
          | vivobr  | start        | Start           | QANOV-321892 |
          | o2uk    | account      | Account         | QANOV-321893 |
          | o2uk    | priority     | priority        | QANOV-321895 |
          | o2uk    | start        | Start           | QANOV-321896 |
          | moves   | account      | Account         | QANOV-321900 |
          | moves   | start        | Start           | QANOV-321902 |
          | o2es    | explore      | Explore         | QANOV-374127 |
          | o2es    | start        | Start           | QANOV-374128 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user can cancel in the first step of create a new layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And the "explore" tab is selected
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I click on the "header_cancel_button" button
     Then the "Layouts Repository" page is loaded
      And the "explore" tab is selected

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-321919 |
          | blaude  | explore      | QANOV-321920 |
          | blaude  | start        | QANOV-321921 |
          | o2de    | account      | QANOV-321913 |
          | o2de    | explore      | QANOV-321914 |
          | o2de    | start        | QANOV-321915 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-321906 |
          | vivobr  | explore      | QANOV-321907 |
          | vivobr  | start        | QANOV-321908 |
          | o2uk    | account      | QANOV-321909 |
          | o2uk    | explore      | QANOV-321910 |
          | o2uk    | priority     | QANOV-321911 |
          | o2uk    | start        | QANOV-321912 |
          | moves   | account      | QANOV-321916 |
          | moves   | explore      | QANOV-321917 |
          | moves   | start        | QANOV-321918 |
          | o2es    | account      | QANOV-374129 |
          | o2es    | explore      | QANOV-374130 |
          | o2es    | start        | QANOV-374131 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @web
  Scenario Outline: A user can access to second step of create a new layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I fill in the "internal_name_input" field with "Qa Test |not save|"
      And the "status_switch" switch is enabled
      And I click on the "next_button" button
     Then the "Modules" page is loaded
      And the "header_cancel_button" button is displayed
      And the "add_module_button" button is displayed
      And the "back_button" button is displayed
      And the "save_button" button is displayed

    @ber @jira.cv.14.6 @smoke
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | start        | QANOV-321937 |
          | o2de    | explore      | QANOV-321930 |

    @ber @jira.cv.Future @smoke
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-321922 |
          | o2uk    | priority     | QANOV-321927 |
          | moves   | explore      | QANOV-321933 |
          | o2es    | start        | QANOV-374132 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-321935 |
          | blaude  | explore      | QANOV-321936 |
          | o2de    | account      | QANOV-321929 |
          | o2de    | start        | QANOV-321931 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | explore      | QANOV-321923 |
          | vivobr  | start        | QANOV-321924 |
          | o2uk    | account      | QANOV-321925 |
          | o2uk    | explore      | QANOV-321926 |
          | o2uk    | start        | QANOV-321928 |
          | moves   | account      | QANOV-321932 |
          | moves   | start        | QANOV-321934 |
          | o2es    | account      | QANOV-374133 |
          | o2es    | explore      | QANOV-374134 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user can cancel in the second step of create a new layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I fill in the "internal_name_input" field with "Qa Test |not save|"
      And I click on the "next_button" button
      And the "Modules" page is loaded
      And I click on the "cancel_button" button
     Then the "Layouts Repository" page is loaded
      And the "explore" tab is selected

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-321951 |
          | blaude  | explore      | QANOV-321952 |
          | blaude  | start        | QANOV-321953 |
          | o2de    | account      | QANOV-321945 |
          | o2de    | explore      | QANOV-321946 |
          | o2de    | start        | QANOV-321947 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-321938 |
          | vivobr  | explore      | QANOV-321939 |
          | vivobr  | start        | QANOV-321940 |
          | o2uk    | account      | QANOV-321941 |
          | o2uk    | explore      | QANOV-321942 |
          | o2uk    | priority     | QANOV-321943 |
          | o2uk    | start        | QANOV-321944 |
          | moves   | account      | QANOV-321948 |
          | moves   | explore      | QANOV-321949 |
          | moves   | start        | QANOV-321950 |
          | o2es    | account      | QANOV-374135 |
          | o2es    | explore      | QANOV-374136 |
          | o2es    | start        | QANOV-374137 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user can add an audience in the first step of create a new layout
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I fill in the "internal_name_input" field with "Qa Test |new layout|"
      And I click on the "add_condition_button" button
      And I select the "is_option" option from "is_or_is_not_dropdown" field
      And I click on the "audience_dropdown" element
      And I store the text in the "first_option" element in the context storage with key "first_option"
      And I click on the "first_option" element
     Then the "audiences_list" elements list contains the text "[CONTEXT:first_option]"

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-374151 |
          | blaude  | explore      | QANOV-374152 |
          | blaude  | start        | QANOV-374153 |
          | o2de    | account      | QANOV-374145 |
          | o2de    | explore      | QANOV-374146 |
          | o2de    | start        | QANOV-374147 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-374138 |
          | vivobr  | explore      | QANOV-374139 |
          | vivobr  | start        | QANOV-374140 |
          | o2uk    | account      | QANOV-374141 |
          | o2uk    | explore      | QANOV-374142 |
          | o2uk    | priority     | QANOV-374143 |
          | o2uk    | start        | QANOV-374144 |
          | moves   | account      | QANOV-374148 |
          | moves   | explore      | QANOV-374149 |
          | moves   | start        | QANOV-374150 |
          | o2es    | account      | QANOV-374154 |
          | o2es    | explore      | QANOV-374155 |
          | o2es    | start        | QANOV-374156 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @jira.link.parent_test_plan.QANOV-386148 @manual
  @regression @web
  Scenario Outline: A user can add a module in the second step of create a new layout
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
      And the "add_module_popup" popup is displayed
      And I click on the "add_module_popup_selector" element
      And I store the text in the "first_module" element in the context storage with key "first_module_name"
      And I select the "first_module" option from "add_module_popup_selector" field
      And I click on the "add_module_popup_button" button
     Then any element in the "modules_list" list has the "module_name" textfield with the "first_module_name" text

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-374170 |
          | blaude  | explore      | QANOV-374171 |
          | blaude  | start        | QANOV-374172 |
          | o2de    | account      | QANOV-374164 |
          | o2de    | explore      | QANOV-374165 |
          | o2de    | start        | QANOV-374166 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-374157 |
          | vivobr  | explore      | QANOV-374158 |
          | vivobr  | start        | QANOV-374159 |
          | o2uk    | account      | QANOV-374160 |
          | o2uk    | explore      | QANOV-374161 |
          | o2uk    | priority     | QANOV-374162 |
          | o2uk    | start        | QANOV-374163 |
          | moves   | account      | QANOV-374167 |
          | moves   | explore      | QANOV-374168 |
          | moves   | start        | QANOV-374169 |
          | o2es    | account      | QANOV-374173 |
          | o2es    | explore      | QANOV-374174 |
          | o2es    | start        | QANOV-374175 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @jira.link.parent_test_plan.QANOV-386148 @manual
  @web
  Scenario Outline: A user can create a new layout with an audience
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I fill in the "internal_name_input" field with "Qa Test |new layout + audience|"
      And I click on the "add_condition_button" button
      And I select the "is_option" option from "is_or_is_not_dropdown" field
      And I select the "first_option" option from "audience_dropdown" field
      And I click on the "next_button" button
      And the "Modules" page is loaded
      And I click on the "add_module_button" button
      And I select the "first_option" option from "add_module_popup_selector" field
      And I click on the "add_module_popup_button" button
      And I click on the "save_button" button
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
     Then any element in the "layouts_list" list has the "layout" textfield with the "Qa Test |new layout + audience|" text

    @ber @jira.cv.14.6 @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-321967 |
          | o2de    | explore      | QANOV-321962 |

    @ber @jira.cv.Future @sanity
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-321954 |
          | o2uk    | priority     | QANOV-321959 |
          | moves   | start        | QANOV-321966 |
          | o2es    | account      | QANOV-374176 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | explore      | QANOV-321968 |
          | blaude  | start        | QANOV-321969 |
          | o2de    | account      | QANOV-321961 |
          | o2de    | start        | QANOV-321963 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | explore      | QANOV-321955 |
          | vivobr  | start        | QANOV-321956 |
          | o2uk    | account      | QANOV-321957 |
          | o2uk    | explore      | QANOV-321958 |
          | o2uk    | start        | QANOV-321960 |
          | moves   | account      | QANOV-321964 |
          | moves   | explore      | QANOV-321965 |
          | o2es    | explore      | QANOV-374177 |
          | o2es    | start        | QANOV-374178 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @smoke @web
  Scenario Outline: A user can create a new layout by default
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I fill in the "internal_name_input" field with "Qa Test |by default - no audience|"
      And I click on the "next_button" button
      And the "Modules" page is loaded
      And I click on the "add_module_button" button
      And I select the "first_option" option from "add_module_popup_selector" field
      And I click on the "add_module_button" button
      And I click on the "save_button" button
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
     Then any element in the "layouts_list" list has the "layout" textfield with the "Qa Test |by default - no audience|" text

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-321983 |
          | blaude  | explore      | QANOV-321984 |
          | blaude  | start        | QANOV-321985 |
          | o2de    | account      | QANOV-321977 |
          | o2de    | explore      | QANOV-321978 |
          | o2de    | start        | QANOV-321979 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-321970 |
          | vivobr  | explore      | QANOV-321971 |
          | vivobr  | start        | QANOV-321972 |
          | o2uk    | account      | QANOV-321973 |
          | o2uk    | explore      | QANOV-321974 |
          | o2uk    | priority     | QANOV-321975 |
          | o2uk    | start        | QANOV-321976 |
          | moves   | account      | QANOV-321980 |
          | moves   | explore      | QANOV-321981 |
          | moves   | start        | QANOV-321982 |
          | o2es    | account      | QANOV-374179 |
          | o2es    | explore      | QANOV-374180 |
          | o2es    | start        | QANOV-374181 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @smoke @web
  Scenario Outline: A user can create a new deactivated layout with an audience and a module
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And I click on the "add_button" button
      And the "New Layout" page is loaded
      And I fill in the "internal_name_input" field with "Qa Test |deactivate - audiente + module|"
      And I click on the "status_switch" element
      And the "deactivate_layout_popup" popup is displayed
      And the "cancel_button" button is displayed
      And the "activated_switch" switch is enabled
      And I click on the "activated_switch" button
      And the "activated_switch" switch is disabled
      And I click on the "next_button" button
      And the "Modules" page is loaded
      And I click on the "add_module_button" button
      And I select the "first_option" option from "select_a_mobile_dropdown" field
      And I click on the "next_button" button
      And the "Modules" page is loaded
      And I click on the "add_module_button" button
      And I select the "first_option" option from "add_module_popup_selector" field
      And I click on the "add_module_button" button
      And I click on the "save_button" button
     Then the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And any element in the "layouts_list" list has the "layout" textfield with the "Qa Test |deactivate - audiente + module|" text

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-321999 |
          | blaude  | explore      | QANOV-322000 |
          | blaude  | start        | QANOV-322001 |
          | o2de    | account      | QANOV-321993 |
          | o2de    | explore      | QANOV-321994 |
          | o2de    | start        | QANOV-321995 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-321986 |
          | vivobr  | explore      | QANOV-321987 |
          | vivobr  | start        | QANOV-321988 |
          | o2uk    | account      | QANOV-321989 |
          | o2uk    | explore      | QANOV-321990 |
          | o2uk    | priority     | QANOV-321991 |
          | o2uk    | start        | QANOV-321992 |
          | moves   | account      | QANOV-321996 |
          | moves   | explore      | QANOV-321997 |
          | moves   | start        | QANOV-321998 |
          | o2es    | account      | QANOV-374182 |
          | o2es    | explore      | QANOV-374183 |
          | o2es    | start        | QANOV-374184 |
