# -*- coding: utf-8 -*-
@jira.QANOV-531861 @not_hardening
Feature: Pending publication


  @jira.<jira_id> @<product> @ber @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @sanity @web
  Scenario Outline: A user can access to the Pending publication page and see the elements in draft status
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
     Then the "Pending Publication" page is loaded
      And the "Pending Publication" header is displayed
      And the "filter_by_type_selector" element is displayed
      And the "filter_by_subtype_selector" element is displayed
      And the "filter_by_search_criteria" inputtext with the "Search" placeholder is displayed
      And the "header_select_all" button with "Select all" text is displayed
      And the "header_publish" button with "Publish" text is displayed
      And the "pending_publication_list" list is displayed
      And each item in the "pending_publication_list" list has the "checkbox" field
      And each item in the "pending_publication_list" list has the "name" field
      And each item in the "pending_publication_list" list has the "type" field
      And each item in the "pending_publication_list" list has the "subtype" field
      And each item in the "pending_publication_list" list has the "actions" field

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531862 |
          | o2uk    | QANOV-531863 |
          | moves   | QANOV-531864 |
          | blaude  | QANOV-531865 |
          | o2de    | QANOV-531866 |
          | o2es    | QANOV-531867 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can access to the Pending publication page and see the empty case when there aren't any elements in draft status
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "none" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
     Then the "Pending Publication" page is loaded
      And the "Pending Publication" header is displayed
      And the text of the element "empty_case_title" is equal to "Congratulations"
      And the text of the element "empty_case_text" is equal to "You have nothing to publish, you are up to date."
      And the "empty_case_icon" element is displayed
      And the "pending_publication_list" list is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531868 |
          | o2uk    | QANOV-531869 |
          | moves   | QANOV-531870 |
          | blaude  | QANOV-531871 |
          | o2de    | QANOV-531872 |
          | o2es    | QANOV-531873 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can see the actions menu when selecting a "<element_type>" element in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "<element_type>" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And I click on the "edit_actions" button of the element with "<element_type>" value in the "type" field of the "pending_publication_list" web list
     Then the "publish_menu" element is displayed
      And the "publish_menu_list" list with "<actions_list>" textfields is displayed

    @jira.cv.Future
    Examples:
          | product | element_type | actions_list  | jira_id      |
          | vivobr  | Layout       | Edit, Publish | QANOV-531874 |
          | o2uk    | Layout       | Edit, Publish | QANOV-531877 |
          | moves   | Layout       | Edit, Publish | QANOV-531880 |
          | blaude  | Layout       | Edit, Publish | QANOV-531883 |
          | o2de    | Layout       | Edit, Publish | QANOV-531886 |
          | o2es    | Layout       | Edit, Publish | QANOV-531889 |

    @jira.cv.24.0
    Examples:
          | product | element_type | actions_list  | jira_id      |
          | vivobr  | Module       | Edit, Publish | QANOV-531875 |
          | vivobr  | Card         | Publish       | QANOV-531876 |
          | o2uk    | Module       | Edit, Publish | QANOV-531878 |
          | o2uk    | Card         | Publish       | QANOV-531879 |
          | moves   | Module       | Edit, Publish | QANOV-531881 |
          | moves   | Card         | Publish       | QANOV-531882 |
          | blaude  | Module       | Edit, Publish | QANOV-531884 |
          | blaude  | Card         | Publish       | QANOV-531885 |
          | o2de    | Module       | Edit, Publish | QANOV-531887 |
          | o2de    | Card         | Publish       | QANOV-531888 |
          | o2es    | Module       | Edit, Publish | QANOV-531890 |
          | o2es    | Card         | Publish       | QANOV-531891 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user will see a confirmation popup when publishing and "<element_type>" element in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "<element_type>" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And I click on the "edit_actions" button of the element with "<element_type>" value in the "type" field of the "pending_publication_list" web list
      And I click on the "publish" button of the "publish_menu" element
     Then the "publish_items_popup" element is displayed
      And the text of the element "popup_title" is equal to "Publish item?"
      And the text of the element "popup_text" is equal to "If you publish these items they will be visible to users."
      And the text of the element "popup_cancel" is equal to "Cancel"
      And the text of the element "popup_confirm" is equal to "Publish"

    @jira.cv.Future
    Examples:
          | product | element_type | jira_id      |
          | vivobr  | Layout       | QANOV-531892 |
          | blaude  | Layout       | QANOV-531895 |

    @jira.cv.24.0
    Examples:
          | product | element_type | jira_id      |
          | vivobr  | Module       | QANOV-555417 |
          | vivobr  | Card         | QANOV-555418 |
          | o2uk    | Module       | QANOV-531893 |
          | moves   | Card         | QANOV-531894 |
          | o2de    | Module       | QANOV-531896 |
          | o2es    | Card         | QANOV-531897 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-529838 @manual @smoke @web
  Scenario Outline: A user can publish and "<element_type>" element after accepting the confirmation popup in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "<element_type>" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And stores the index of the "type" field with "<element_type>" value in the "pending_publication_list" list
      And stores the text value from the "element_name" field of "pending_publication_list" list with "[CONTEXT:element_name_index]" index
      And I click on the "[CONTEXT:element_name_index]" element in the "pending_publication_list" list
      And I click on the "publish" button of the "publish_menu" element
      And I click on the "popup_confirm" button
     Then the "crouton_message" textfield with "1 item published" text is displayed
      And the element in "[CONTEXT:element_name_index]" position of the "pending_publication_list" list has not the "[CONTEXT:element_name]" textfield

    @jira.cv.Future
    Examples:
          | product | element_type | jira_id      |
          | vivobr  | Layout       | QANOV-531898 |
          | blaude  | Layout       | QANOV-531901 |

    @jira.cv.24.0
    Examples:
          | product | element_type | jira_id      |
          | vivobr  | Module       | QANOV-555419 |
          | vivobr  | Card         | QANOV-555420 |
          | o2uk    | Module       | QANOV-531899 |
          | moves   | Card         | QANOV-531900 |
          | o2de    | Module       | QANOV-531902 |
          | o2es    | Card         | QANOV-531903 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can cancel the confirmation popup in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "<element_type>" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And stores the index of the "type" field with "<element_type>" value in the "pending_publication_list" list
      And stores the text value from the "element_name" field of "pending_publication_list" list with "[CONTEXT:element_name_index]" index
      And I click on the "[CONTEXT:element_name_index]" element in the "pending_publication_list" list
      And I click on the "publish" button of the "publish_menu" element
      And I click on the "popup_cancel" button
     Then the element in "[CONTEXT:element_name_index]" position of the "pending_publication_list" list has the "[CONTEXT:element_name]" textfield

    @jira.cv.Future
    Examples:
          | product | element_type | jira_id      |
          | vivobr  | Layout       | QANOV-531904 |
          | blaude  | Layout       | QANOV-531907 |

    @jira.cv.24.0
    Examples:
          | product | element_type | jira_id      |
          | vivobr  | Module       | QANOV-555421 |
          | vivobr  | Card         | QANOV-555422 |
          | o2uk    | Module       | QANOV-531905 |
          | moves   | Card         | QANOV-531906 |
          | o2de    | Module       | QANOV-531908 |
          | o2es    | Card         | QANOV-531909 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can select several elements in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And I click on the "0" element in the "pending_publication_checkbox_list" list
      And I click on the "1" element in the "pending_publication_checkbox_list" list
     Then the text of the element "header_publish" is equal to "Publish (2)"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531910 |
          | o2uk    | QANOV-531911 |
          | moves   | QANOV-531912 |
          | blaude  | QANOV-531913 |
          | o2de    | QANOV-531914 |
          | o2es    | QANOV-531915 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can filter the elements by "<option>" type in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "<option>" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And I select the "<option>" option from "filter_by_type_selector" field
     Then each element in the "pending_publication_list" list has the "type" field with the "<value>" value

    @jira.cv.Future
    Examples:
          | product | option  | value  | jira_id      |
          | moves   | Layouts | LAYOUT | QANOV-531918 |
          | o2es    | Layouts | LAYOUT | QANOV-531921 |

    @jira.cv.24.0
    Examples:
          | product | option  | value  | jira_id      |
          | vivobr  | Cards   | CARD   | QANOV-531916 |
          | o2uk    | Modules | MODULE | QANOV-531917 |
          | blaude  | Cards   | CARD   | QANOV-531919 |
          | o2de    | Modules | MODULE | QANOV-531920 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can filter the elements by subtype in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "<option>" subtype is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And I select the "<option>" option from "filter_by_subtype_selector" field
     Then each element in the "pending_publication_list" list has the "subtype" field with the "<value>" value

    Examples:
          | product | option           | value            | jira_id      |
          | vivobr  | Featured content | Featured content | QANOV-531922 |
          | o2uk    | Vertical cards   | Vertical cards   | QANOV-531923 |
          | moves   | Data cards       | Data cards       | QANOV-531924 |
          | blaude  | Banner hero      | Banner hero      | QANOV-531925 |
          | o2de    | Banner           | Banner           | QANOV-531926 |
          | o2es    | Naked cards      | Naked cards      | QANOV-531927 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can filter the elements by search criteria in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And stores the text value from the "name" field of "pending_publication_list" list with "0" index
      And I fill the "name" field in the "firs_elelement" element with "[CONTEXT:name]"
     Then each element in the "pending_publication_list" list has the "name" field contains the "[CONTEXT:name]" value

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531928 |
          | o2uk    | QANOV-531929 |
          | moves   | QANOV-531930 |
          | blaude  | QANOV-531931 |
          | o2de    | QANOV-531932 |
          | o2es    | QANOV-531933 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can select all elements in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And I click on the "header_select_all" element
     Then each element in the "pending_publication_list" list has the "checkbox" field "enabled"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531934 |
          | o2uk    | QANOV-531935 |
          | moves   | QANOV-531936 |
          | blaude  | QANOV-531937 |
          | o2de    | QANOV-531938 |
          | o2es    | QANOV-531939 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user can deselect all elements in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given a "any" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And I click on the "header_select_all" button
      And I click on the "deselect_all" button
     Then each element in the "pending_publication_list" list has the "checkbox" field "disabled"

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531940 |
          | o2uk    | QANOV-531941 |
          | moves   | QANOV-531942 |
          | blaude  | QANOV-531943 |
          | o2de    | QANOV-531944 |
          | o2es    | QANOV-531945 |

  @jira.<jira_id> @<product> @jira.cv.24.0 @jira.link.parent_test_plan.QANOV-529838 @manual @regression @web
  Scenario Outline: A user who publishes all elements will see the empty case in the Pending publication page
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Take into considation that more than than one select all items and publish might be needed until the empty case is displayed
    because in some corner cases, after publishing card elements, modules might be detected as modified.
    Given a "any" type is in draft status in the CMS
     When I go to "[CONF:cms.base][CONF:cms.pending_publication]" web page
      And the "Pending Publication" page is loaded
      And I click on the "header_select_all" button
      And I click on the "header_publish" button
      And I click on the "popup_confirm" button
     Then the text of the element "empty_case_title" is equal to "Congratulations"
      And the text of the element "empty_case_text" is equal to "You have nothing to publish, you are up to date."
      And the "empty_case_icon" element is displayed
      And the "pending_publication_list" list is not displayed

    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-531946 |
          | o2uk    | QANOV-531947 |
          | moves   | QANOV-531948 |
          | blaude  | QANOV-531949 |
          | o2de    | QANOV-531950 |
          | o2es    | QANOV-531951 |
