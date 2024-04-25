# -*- coding: utf-8 -*-
@jira.QANOV-322212 @not_hardening
Feature: Layouts validation


  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @web
  Scenario Outline: A user with layouts can see the existing layouts in the layouts repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has ">=1" "<layouts_type>" layouts created
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And the "tabs_list" list with "Explore;Account;Start" textfields is displayed
      And the "explore_tab" tab is selected
      And I click on the "<layouts_type>" element
     Then the "Layouts Repository" page is loaded
      And the "<layouts_type>_tab" tab is selected
      And the text of the element "page_title" is equal to "Layouts"
      And the "header_publish_button" element is displayed
      And the "<layouts_type>" tab with "<tab_name>" text is displayed
      And each item in the "layouts_list" list has the "layout" field
      And each item in the "layouts_list" list has the "status" field
      And each item in the "layouts_list" list has the "audiences" field
      And each item in the "layouts_list" list has the "actions_icon" field
      And the "add_layout" button with "+ Add layout" text is displayed

    @ber @jira.cv.14.6 @sanity
    Examples:
          | product | layouts_type | tab_name  | jira_id      |
          | blaude  | account      | Account   | QANOV-322226 |
          | o2de    | start        | Start Tab | QANOV-322222 |

    @ber @jira.cv.Future @sanity
    Examples:
          | product | layouts_type | tab_name | jira_id      |
          | vivobr  | account      | Account  | QANOV-322213 |
          | o2uk    | priority     | Priority | QANOV-322218 |
          | moves   | explore      | Offers   | QANOV-322224 |
          | o2es    | explore      | Offers   | QANOV-374209 |

    @jira.cv.14.6 @regression
    Examples:
          | product | layouts_type | tab_name  | jira_id      |
          | blaude  | explore      | Offers    | QANOV-322227 |
          | blaude  | start        | Start Tab | QANOV-322228 |
          | o2de    | account      | Account   | QANOV-322220 |
          | o2de    | explore      | Offers    | QANOV-322221 |

    @jira.cv.Future @regression
    Examples:
          | product | layouts_type | tab_name  | jira_id      |
          | vivobr  | explore      | Offers    | QANOV-322214 |
          | vivobr  | start        | Start Tab | QANOV-322215 |
          | o2uk    | account      | Account   | QANOV-322216 |
          | o2uk    | explore      | Offers    | QANOV-322217 |
          | o2uk    | start        | Start Tab | QANOV-322219 |
          | moves   | account      | Account   | QANOV-322223 |
          | moves   | start        | Start Tab | QANOV-322225 |
          | o2es    | account      | Account   | QANOV-374210 |
          | o2es    | start        | Start Tab | QANOV-374211 |

  @jira.<jira_id> @<product> @ber @jira.link.parent_test_plan.QANOV-370231 @manual @sanity @web
  Scenario Outline: A user can expand the options of the actions icon of a layout in the layouts repository
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has ">=1" "explore" layouts created
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And the "explore_tab" tab is selected
      And I click on the "actions_icon" element
     Then the "actions_button_list" list with "Edit;Deactivate;Delete" textfields is displayed

    @jira.cv.14.6
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-374216 |
          | o2de    | QANOV-374214 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-374212 |
          | o2uk    | QANOV-374213 |
          | moves   | QANOV-374215 |
          | o2es    | QANOV-374217 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user can order the layouts with drag and drop
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has ">1" "any" layouts created
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And I click on the "<layouts_type>" element
      And the "Layouts Repository" page is loaded
      And I drag one layout to another position
     Then the "crouton_message" textfield with "Layouts sorted successfully" text is displayed

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-322274 |
          | blaude  | explore      | QANOV-322275 |
          | blaude  | start        | QANOV-322276 |
          | o2de    | account      | QANOV-322268 |
          | o2de    | explore      | QANOV-322269 |
          | o2de    | start        | QANOV-322270 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-322261 |
          | vivobr  | explore      | QANOV-322262 |
          | vivobr  | start        | QANOV-322263 |
          | o2uk    | account      | QANOV-322264 |
          | o2uk    | explore      | QANOV-322265 |
          | o2uk    | priority     | QANOV-322266 |
          | o2uk    | start        | QANOV-322267 |
          | moves   | account      | QANOV-322271 |
          | moves   | explore      | QANOV-322272 |
          | moves   | start        | QANOV-322273 |
          | o2es    | account      | QANOV-374218 |
          | o2es    | explore      | QANOV-374219 |
          | o2es    | start        | QANOV-374220 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user with no layouts will see the empty case when accessing to the layouts screen
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has "0" "any" layouts created
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
     Then the "Layouts Repository" page is loaded
      And the "tabs_list" list with "Explore;Account;Start" textfields is displayed
      And the "explore_tab" tab is selected
      And the text of the element "page_title" is equal to "Layouts"
      And the "header_publish_button" element is displayed
      And the text of the element "empty_layout_title" is equal to "Create your first Layout"
      And the text of the element "empty_layout_description" is equal to "Click on \"create\" to set up a layout."
      And the "empty_create_button" element is displayed

    @jira.cv.14.6
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-322281 |
          | o2de    | QANOV-322279 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-322277 |
          | o2uk    | QANOV-322278 |
          | moves   | QANOV-322280 |
          | o2es    | QANOV-374221 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user with no layouts created in a specific section can access to the layouts screen
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
    Given the CMS has "0" "<layouts_type>" layouts created
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And the "tabs_list" list with "Explore;Account;Start" textfields is displayed
      And the "explore_tab" tab is selected
      And I click on the "<layouts_type>" element
     Then the "Layouts Repository" page is loaded
      And the "<layouts_type>_tab" tab is selected
      And the text of the element "page_title" is equal to "Layouts"
      And the "header_publish_button" element is displayed
      And the "<layouts_type>" tab with "<tab_name>" text is displayed
      And the text of the element "empty_layout_title" is equal to "Your layout list is empty"
      And the text of the element "empty_layout_description" is equal to "Click on \"create\" to start and create your new layout."
      And the "empty_create_button" element is displayed

    @jira.cv.14.6
    Examples:
          | product | layouts_type | tab_name  | jira_id      |
          | blaude  | account      | Account   | QANOV-322295 |
          | blaude  | explore      | Offers    | QANOV-322296 |
          | blaude  | start        | Start Tab | QANOV-322297 |
          | o2de    | account      | Account   | QANOV-322289 |
          | o2de    | explore      | Offers    | QANOV-322290 |
          | o2de    | start        | Start Tab | QANOV-322291 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | tab_name  | jira_id      |
          | vivobr  | account      | Account   | QANOV-322282 |
          | vivobr  | explore      | Offers    | QANOV-322283 |
          | vivobr  | start        | Start Tab | QANOV-322284 |
          | o2uk    | account      | Account   | QANOV-322285 |
          | o2uk    | explore      | Offers    | QANOV-322286 |
          | o2uk    | priority     | Priority  | QANOV-322287 |
          | o2uk    | start        | Start Tab | QANOV-322288 |
          | moves   | account      | Account   | QANOV-322292 |
          | moves   | explore      | Offers    | QANOV-322293 |
          | moves   | start        | Start Tab | QANOV-322294 |
          | o2es    | account      | Account   | QANOV-374222 |
          | o2es    | explore      | Offers    | QANOV-374223 |
          | o2es    | start        | Start Tab | QANOV-374224 |

  @jira.<jira_id> @<product> @jira.link.parent_test_plan.QANOV-370231 @manual @regression @web
  Scenario Outline: A user can not create a new layout if the mandatory fields are empty
    WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path
     When I go to "[CONF:cms.base][CONF:cms.layouts_repo]" web page
      And the "Layouts Repository" page is loaded
      And the "tabs_list" list with "Explore;Account;Start" textfields is displayed
      And the "explore_tab" tab is selected
      And I click on the "<layouts_type>" element
      And I click on the "header_create_layout" button
      And the "Create Layout" page is loaded
      And I click on the "next_button" button
     Then the "validation_error" element is under "internal_name_input" element
      And the "validation_error" textfield with "This field is required" text is displayed

    @jira.cv.14.6
    Examples:
          | product | layouts_type | jira_id      |
          | blaude  | account      | QANOV-322311 |
          | blaude  | explore      | QANOV-322312 |
          | blaude  | start        | QANOV-322313 |
          | o2de    | account      | QANOV-322305 |
          | o2de    | explore      | QANOV-322306 |
          | o2de    | start        | QANOV-322307 |

    @jira.cv.Future
    Examples:
          | product | layouts_type | jira_id      |
          | vivobr  | account      | QANOV-322298 |
          | vivobr  | explore      | QANOV-322299 |
          | vivobr  | start        | QANOV-322300 |
          | o2uk    | account      | QANOV-322301 |
          | o2uk    | explore      | QANOV-322302 |
          | o2uk    | priority     | QANOV-322303 |
          | o2uk    | start        | QANOV-322304 |
          | moves   | account      | QANOV-322308 |
          | moves   | explore      | QANOV-322309 |
          | moves   | start        | QANOV-322310 |
          | o2es    | account      | QANOV-374225 |
          | o2es    | explore      | QANOV-374226 |
          | o2es    | start        | QANOV-374227 |
