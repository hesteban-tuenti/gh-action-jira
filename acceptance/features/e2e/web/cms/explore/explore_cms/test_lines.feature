# -*- coding: utf-8 -*-
@jira.QANOV-27190 @not_hardening
Feature: Test lines


  @jira.<jira_id> @<product> @smoke @web
  Scenario Outline: A user can see the existing list of test lines repository
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
     When I go to "[CONF:cms.base][CONF:cms.test_lines]" web page
      And the "Test Lines Repository" page is loaded
     Then the "create_test_lines_button" element is displayed
      And the "test_lines_list" list is displayed
      And each item in the "test_lines_list" list has the "phone_numbers" field
      And each item in the "test_lines_list" list has the "status" field
      And each item in the "test_lines_list" list has the "layouts" field
      And each item in the "test_lines_list" list has the "new layouts" field
      And each item in the "test_lines_list" list has the "edit_button" field
      And each item in the "test_lines_list" list has the "delete_button" field

    @automatic @jira.cv.10.5 @qa
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-9843 |
          | o2uk    | QANOV-9851 |
          | moves   | QANOV-9856 |

    @jira.cv.14.3 @manual
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-384322 |
          | o2de    | QANOV-384323 |

    @jira.cv.Future @manual
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384324 |

  @jira.<jira_id> @<product> @smoke @web
  Scenario Outline: A user can access to the create new test line
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
     When I go to "[CONF:cms.base][CONF:cms.test_lines]" web page
      And the "Test Lines Repository" page is loaded
      And I click on the "header_create_test_lines_button" button
     Then the "Edit Test Line" page is loaded
      And the text of the element "page_title" is equal to "Edit test line"
      And the "header_cancel_button" element is displayed
      And the "header_save_button" element is displayed
      And the text of the element "user_id_title" is equal to "User Id"
      And the "user_id_input" placeholder with "User Id" text is displayed
      And the text of the element "layouts_title" is equal to "Layouts"
      And the "layout_type_selector" element is displayed
      And the text of the element "layouts_status_title" is equal to "Layout status"
      And the text of the element "layouts_status_desc" is equal to "Choose the status where you want to test. Published: You'll see the layout exactly as real users are seeing it right now. Draft: You'll see the layout as it's currently saved in the CMS."
      And the text of the element "layouts_status_warning" is equal to "Warning: Card tapping behavior is not guaranteed while the line or user is in test line mode. Test lines are only intended for Explore viewing purposes."
      And the "layouts_status_selector" element is displayed
      And the text of the element "layouts_scope_title" is equal to "Layouts by scope"
      And the "layout_scope_explore_selector" element is displayed
      And the "layout_scope_account_selector" element is displayed

    @automatic @jira.cv.10.5 @qa
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-9861 |
          | o2uk    | QANOV-9866 |
          | moves   | QANOV-9867 |

    @jira.cv.14.3 @manual
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-384325 |
          | o2de    | QANOV-384326 |

    @jira.cv.Future @manual
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384327 |

  @jira.<jira_id> @<product> @regression @smoke @web
  Scenario Outline: A user can cancel the process to create a test line
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
     When I go to "[CONF:cms.base][CONF:cms.test_lines]" web page
      And the "Test Lines Repository" page is loaded
      And I click on the "create_test_lines_button" button
      And the "Edit Test Line" page is loaded
      And I click on the "cancel_button" button
     Then the "Test Lines Repository" page is loaded

    @automatic @jira.cv.10.5 @qa
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-9861 |
          | o2uk    | QANOV-9866 |
          | moves   | QANOV-9867 |

    @jira.cv.14.3 @manual
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-384328 |
          | o2de    | QANOV-384329 |

    @jira.cv.Future @manual
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384330 |

  @jira.<jira_id> @<product> @ber @sanity @web
  Scenario Outline: A user can create a test line
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
     When I go to "[CONF:cms.base][CONF:cms.test_lines]" web page
      And the "Test Lines Repository" page is loaded
      And I click on the "create_test_lines_button" button
      And the "Edit Test Line" page is loaded
      And I fill in the "user_id_input" field with "876587687"
      And I select the "android_postpay" option from "layouts_type_selector" field
      And I click on the "header_save_button" button
     Then the "Test Lines Repository" page is loaded

    @automatic @jira.cv.10.5 @qa
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-9861 |
          | o2uk    | QANOV-9866 |
          | moves   | QANOV-9867 |

    @jira.cv.14.3 @manual
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-384331 |
          | o2de    | QANOV-384332 |

    @jira.Future @manual
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384333 |

  @jira.<jira_id> @<product> @no_automatable @regression @web
  Scenario Outline: A user can edit a test line
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
     When I go to "[CONF:cms.base][CONF:cms.test_lines]" web page
      And the "Test Lines" page is loaded
      And I click on the "edit_test_line_button" button
      And I select the "ios_postpay" option by value from "layouts_type_selector" field
      And the "layout_status_selector" element is displayed
      And I click on the "layout_status_selector" element
      And the "published_button_status" element is displayed
      And the "draft_button_status" element is displayed
      And I click on the "draft_button_status" button
      And I click on the "header_save_button" button
     Then the "Test Lines" page is loaded
      And the test line is properly edited

    @jira.cv.10.5
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-9868 |
          | o2uk    | QANOV-9869 |
          | moves   | QANOV-9870 |

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-384334 |
          | o2de    | QANOV-384335 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384336 |

  @jira.<jira_id> @<product> @no_automatable @regression @web
  Scenario Outline: A user can delete a test line
    internal_checkpoint="WARNING: the paths defined in this test correspond to the PROD environment.
    However, this test must be executed in DEV/CERT environment, so be sure to use the proper path"
     When I go to "[CONF:cms.base][CONF:cms.test_lines]" web page
      And the "Test Lines" page is loaded
      And I click on the "delete_test_line_button" button
      And the "delete_test_line_popup" popup is displayed
      And I click on the "delete_test_line_popup.accept" button
     Then the test line is not in the test lines list

    @jira.cv.10.5
    Examples:
          | product | jira_id    |
          | vivobr  | QANOV-9871 |
          | o2uk    | QANOV-9872 |
          | moves   | QANOV-9873 |

    @jira.cv.14.3
    Examples:
          | product | jira_id      |
          | blaude  | QANOV-384337 |
          | o2de    | QANOV-384338 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-384339 |
