# -*- coding: utf-8 -*-
@jira.QANOV-405456
Feature: Maintenance mode


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.<relates_to> @manual @mobile
  Scenario Outline: User with <account_type> account type reloads the <tab> screen during a maintenance window in the <tab> tab: maintenance screen is displayed
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the user or the app reloads the "<tab>" page.
    If the app reloads the content or the user was in other tab and switch to the "<tab>" tab, if that action
    reloads the "<tab>" page, the maintenance window will be displayed.
    Support, login and profile are out of this scenario because "scrolls down to refresh" cannot be done.
    Given user has a "<account_type>" account type
      And user is in the "<tab>" page
      And there is a maintenance window in the "<tab>" page
     When scrolls down
     Then the "Maintenance mode" page is displayed
      And the "navigation_top_bar" element is displayed
      And the "header" element is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "icon" icon is displayed
      And the "title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "subtitle" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "button" button with "[LANG:maintenance_mode.maintenance_window_button_text]" text is displayed
      And the "navigation_tab_bar" element is not displayed

    @automation.hard @sanity @har
    Examples:
          | product | tab       | account_type | cv     | parent_test_plan | relates_to   | jira_id      |
          | blaude  | Account   | any          | 14.1   | QANOV-203299     | QANOV-203308 | QANOV-295129 |
          | o2de    | Start     | any          | 14.2   | QANOV-312796     |              | QANOV-405457 |
          | moves   | Dashboard | telco        | 14.1   | QANOV-126319     |              | QANOV-405458 |
          | o2uk    | Explore   | any          | 14.1   | QANOV-9915       |              | QANOV-405459 |
          | o2es    | Account   | any          | Future |                  |              | QANOV-416773 |

    @regression
    Examples:
          | product | tab      | account_type | cv     | parent_test_plan | relates_to  | jira_id      |
          | blaude  | Start    | any          | 14.1   | QANOV-257942     |             | QANOV-405461 |
          | blaude  | Explore  | any          | 14.1   | QANOV-9915       |             | QANOV-405462 |
          | o2de    | Account  | any          | 14.2   |                  | QANOV-38090 | QANOV-295148 |
          | o2de    | Explore  | any          | 14.2   | QANOV-9915       |             | QANOV-405463 |
          | moves   | Account  | legado       | 14.1   | QANOV-126319     | NOV-112058  | QANOV-311170 |
          | moves   | Start    | telco        | 14.1   | QANOV-674        | NOV-194531  | QANOV-678    |
          | moves   | Invoices | telco        | 14.1   | QANOV-260649     |             | QANOV-405464 |
          | moves   | Explore  | legado       | 14.1   | QANOV-9915       | NOV-112058  | QANOV-405465 |
          | moves   | Explore  | telco        | 14.1   | QANOV-9915       | NOV-112058  | QANOV-405466 |
          | o2uk    | Account  | any          | 14.1   | QANOV-126732     | NOV-112058  | QANOV-295139 |
          | o2uk    | Start    | postpay      | 14.1   | QANOV-267990     |             | QANOV-405467 |
          | o2es    | Explore  | any          | Future |                  |             | QANOV-416774 |
          | o2es    | Invoices | any          | Future |                  |             | QANOV-416775 |
          | o2es    | Support  | any          | Future |                  |             | QANOV-416776 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile
  Scenario Outline: User with <account_type> account type is in the <origin_tab> tab and click on the <tab> tab during a maintenance window in the <tab> tab: maintenance screen is displayed
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the user or the app reloads the "<tab>" page.
    If the app reloads the content or the user was in other tab and switch to the "<tab>" tab, if that action
    reloads the "<tab>" page, the maintenance window will be displayed.
    Given user has a "<account_type>" account type
      And user is in the "<origin_tab>" page
      And there is a maintenance window in the "<tab>" page
     When clicks on the "<tab>" tab
     Then the "Maintenance" page is displayed
      And the "navigation_top_bar" element is displayed
      And the "header" element is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "icon" icon is displayed
      And the "title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "subtitle" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "button" button with "[LANG:maintenance_mode.maintenance_window_button_text]" text is displayed
      And the "navigation_tab_bar" element is not displayed

    @smoke
    Examples:
          | product | tab       | origin_tab | account_type | cv   | parent_test_plan | jira_id      |
          | blaude  | Account   | Start      | any          | 14.1 | QANOV-203299     | QANOV-405468 |
          | o2de    | Start     | Explore    | any          | 14.2 | QANOV-312796     | QANOV-405469 |
          | moves   | Dashboard | Start      | telco        | 14.1 | QANOV-126319     | QANOV-405470 |
          | o2uk    | Explore   | Account    | any          | 14.1 | QANOV-9915       | QANOV-405471 |
          | blaude  | Support   | Explore    | any          | 14.1 | QANOV-3149       | QANOV-405472 |
          | moves   | Invoices  | Explore    | telco        | 14.1 | QANOV-260649     | QANOV-405473 |

    @regression
    Examples:
          | product | tab      | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | blaude  | Start    | Account    | any          | 14.1   | QANOV-257942     | QANOV-405474 |
          | blaude  | Explore  | Start      | any          | 14.1   | QANOV-9915       | QANOV-405475 |
          | o2de    | Account  | Start      | any          | 14.2   |                  | QANOV-405476 |
          | o2de    | Explore  | Account    | any          | 14.2   | QANOV-9915       | QANOV-405477 |
          | o2de    | Support  | Start      | any          | 14.2   | QANOV-3149       | QANOV-405478 |
          | moves   | Account  | Explore    | legado       | 14.1   | QANOV-126319     | QANOV-405479 |
          | moves   | Start    | Dashboard  | telco        | 14.1   | QANOV-674        | QANOV-405480 |
          | moves   | Explore  | Account    | legado       | 14.1   | QANOV-9915       | QANOV-405481 |
          | moves   | Explore  | Invoices   | telco        | 14.1   | QANOV-9915       | QANOV-405482 |
          | moves   | Support  | Account    | legado       | 14.1   | QANOV-3149       | QANOV-405483 |
          | moves   | Support  | Start      | telco        | 14.1   | QANOV-3149       | QANOV-405484 |
          | o2uk    | Account  | Start      | any          | 14.1   | QANOV-126732     | QANOV-405485 |
          | o2uk    | Start    | Explore    | postpay      | 14.1   | QANOV-267990     | QANOV-405486 |
          | o2uk    | Support  | Account    | any          | 14.1   | QANOV-3149       | QANOV-405487 |
          | o2es    | Invoices | Explore    | any          | Future |                  | QANOV-416777 |
          | o2es    | Account  | Support    | any          | Future |                  | QANOV-416778 |
          | o2es    | Support  | Invoices   | any          | Future |                  | QANOV-416779 |
          | o2es    | Explore  | Account    | any          | Future |                  | QANOV-416780 |

    @old_app @regression
    Examples:
          | product | tab      | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | vivobr  | Tab Mais | Account    | any          | 14.2   | QANOV-249080     | QANOV-323136 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile
  Scenario Outline: User with <account_type> account type is in the <origin_tab> tab and clicks on the profile icon during a maintenance window in the Profile page: maintenance screen is displayed
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the user or the app reloads the "Profile" page.
    If the app reloads the content or the user was in other tab and switch to the "Profile" tab, if that action
    reloads the "Profile" page, the maintenance window will be displayed.
    Given user has a "<account_type>" account type
      And user is in the "<origin_tab>" page
      And there is a maintenance window in the "Profile" page
     When clicks on the "notification_top_bar.profile_icon" button
     Then the "Maintenance" page is displayed
      And the "navigation_top_bar" element is displayed
      And the "header" element is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "icon" icon is displayed
      And the "title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "subtitle" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "button" button with "[LANG:maintenance_mode.maintenance_window_button_text]" text is displayed
      And the "navigation_tab_bar" element is not displayed

    @smoke
    Examples:
          | product | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | blaude  | Account    | any          | 14.1   | QANOV-203299     | QANOV-405488 |
          | o2de    | Start      | any          | 14.2   | QANOV-312796     | QANOV-405489 |
          | moves   | Dashboard  | telco        | 14.1   | QANOV-126319     | QANOV-405490 |
          | moves   | Account    | legado       | 14.1   | QANOV-126319     | QANOV-405491 |
          | o2uk    | Explore    | any          | 14.1   | QANOV-9915       | QANOV-405492 |
          | o2es    | Account    | any          | Future |                  | QANOV-416781 |

    @old_app
    Examples:
          | product | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | vivobr  | Tab Mais   | any          | 14.2   | QANOV-249080     | QANOV-323134 |

    @regression
    Examples:
          | product | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | blaude  | Start      | any          | 14.1   | QANOV-257942     | QANOV-405493 |
          | blaude  | Explore    | any          | 14.1   | QANOV-9915       | QANOV-405494 |
          | blaude  | Support    | any          | 14.1   | QANOV-3149       | QANOV-405495 |
          | o2de    | Account    | any          | 14.2   |                  | QANOV-405496 |
          | o2de    | Explore    | any          | 14.2   | QANOV-9915       | QANOV-405497 |
          | o2de    | Support    | any          | 14.2   | QANOV-3149       | QANOV-405498 |
          | moves   | Invoices   | telco        | 14.1   | QANOV-260649     | QANOV-405499 |
          | moves   | Start      | telco        | 14.1   | QANOV-674        | QANOV-405500 |
          | moves   | Explore    | legado       | 14.1   | QANOV-9915       | QANOV-405501 |
          | moves   | Explore    | telco        | 14.1   | QANOV-9915       | QANOV-405502 |
          | moves   | Support    | legado       | 14.1   | QANOV-3149       | QANOV-405503 |
          | moves   | Gestiones  | telco        | 24.1   | QANOV-3149       | QANOV-405504 |
          | o2uk    | Account    | any          | 14.1   | QANOV-126732     | QANOV-405505 |
          | o2uk    | Start      | postpay      | 14.1   | QANOV-267990     | QANOV-405506 |
          | o2uk    | Support    | any          | 14.1   | QANOV-3149       | QANOV-405507 |
          | o2es    | Explore    | any          | Future |                  | QANOV-416782 |
          | o2es    | Invoices   | any          | Future |                  | QANOV-416783 |
          | o2es    | Support    | any          | Future |                  | QANOV-416784 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-5195 @manual
  @mobile @smoke @har
  Scenario Outline: User wants to log in during a maintenance window in the "Splash Screen": maintenance screen is displayed
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the app or the user perfoms any action that reloads the Splash Screen page.
    Given user is in the "Splash Screen" page
      And there is a maintenance window in the "Splash Screen" page
     When clicks on the "login_button" button
     Then the "Maintenance" page is displayed
      And the "navigation_top_bar" element is displayed
      And the "header" element is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "icon" icon is displayed
      And the "title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "subtitle" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "button" button with "[LANG:maintenance_mode.maintenance_window_button_text]" text is displayed
      And the "navigation_tab_bar" element is not displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.1 | QANOV-405508 |
          | o2de    | 14.2 | QANOV-405509 |
          | moves   | 14.1 | QANOV-405510 |
          | o2uk    | 14.1 | QANOV-405511 |
          | vivobr  | 14.2 | QANOV-405512 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-5195 @manual @mobile
  @regression @har
  Scenario Outline: User wants to log in during a general maintenance window: maintenance screen is displayed
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the app or the user perfoms any action that reloads the Splash Screen page.
    Given user is in the "Splash Screen" page
      And there is a general maintenance window
     When clicks on the "login_button" button
     Then the "Maintenance" page is displayed
      And the "navigation_top_bar" element is displayed
      And the "header" element is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "icon" icon is displayed
      And the "title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "subtitle" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "navigation_tab_bar" element is not displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.1   | QANOV-405513 |
          | o2de    | 14.2   | QANOV-405514 |
          | moves   | 14.1   | QANOV-405515 |
          | o2uk    | 14.1   | QANOV-405516 |
          | vivobr  | 14.2   | QANOV-405517 |
          | o2es    | Future | QANOV-416785 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual
  @mobile
  Scenario Outline: User with <account_type> account type is in <origin_tab> during a general maintenance window: maintenance screen is displayed
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the user or the app reloads the "<tab>" page.
    If the app reloads the content or the user was in other tab and switch to the "<tab>" tab, if that action
    reloads the "<tab>" page, the maintenance window will be displayed.
    Given user has a "<account_type>" account type
      And user is in the "<origin_tab>" page
      And there is a general maintenance window
     When clicks on the "<tab>" tab
     Then the "Maintenance" page is displayed
      And the "navigation_top_bar" element is displayed
      And the "header" element is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "icon" icon is displayed
      And the "title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "subtitle" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "button" button is not displayed
      And the "navigation_tab_bar" element is not displayed

    @smoke
    Examples:
          | product | tab       | origin_tab | account_type | cv   | parent_test_plan | jira_id      |
          | blaude  | Account   | Start      | any          | 14.1 | QANOV-203299     | QANOV-405519 |
          | o2de    | Start     | Explore    | any          | 14.2 | QANOV-312796     | QANOV-405520 |
          | moves   | Dashboard | Start      | telco        | 14.1 | QANOV-126319     | QANOV-405521 |
          | o2uk    | Explore   | Account    | any          | 14.1 | QANOV-9915       | QANOV-405522 |
          | blaude  | Support   | Explore    | any          | 14.1 | QANOV-3149       | QANOV-405523 |
          | moves   | Invoices  | Explore    | telco        | 14.1 | QANOV-260649     | QANOV-405524 |

    @old_app
    Examples:
          | product | tab       | origin_tab | account_type | cv   | parent_test_plan | jira_id      |
          | vivobr  | Tab Mais  | Account    | any          | 14.2 | QANOV-249080     | QANOV-405525 |

    @regression
    Examples:
          | product | tab       | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | blaude  | Start     | Account    | any          | 14.1   | QANOV-257942     | QANOV-405526 |
          | blaude  | Explore   | Start      | any          | 14.1   | QANOV-9915       | QANOV-405527 |
          | o2de    | Account   | Start      | any          | 14.2   |                  | QANOV-405528 |
          | o2de    | Explore   | Account    | any          | 14.2   | QANOV-9915       | QANOV-405529 |
          | o2de    | Support   | Start      | any          | 14.2   | QANOV-3149       | QANOV-405530 |
          | moves   | Account   | Explore    | legado       | 14.1   | QANOV-126319     | QANOV-405531 |
          | moves   | Start     | Dashboard  | telco        | 14.1   | QANOV-674        | QANOV-405532 |
          | moves   | Explore   | Account    | legado       | 14.1   | QANOV-9915       | QANOV-405533 |
          | moves   | Explore   | Invoices   | telco        | 14.1   | QANOV-9915       | QANOV-405534 |
          | moves   | Support   | Account    | legado       | 14.1   | QANOV-3149       | QANOV-405535 |
          | moves   | Gestiones | Start      | telco        | 24.1   | QANOV-3149       | QANOV-405536 |
          | o2uk    | Account   | Explore    | any          | 14.1   | QANOV-126732     | QANOV-405537 |
          | o2uk    | Start     | Explore    | postpay      | 14.1   | QANOV-267990     | QANOV-405538 |
          | o2uk    | Support   | Account    | any          | 14.1   | QANOV-3149       | QANOV-405539 |
          | o2es    | Invoices  | Explore    | any          | Future |                  | QANOV-416786 |
          | o2es    | Account   | Support    | any          | Future |                  | QANOV-416787 |
          | o2es    | Support   | Invoices   | any          | Future |                  | QANOV-416788 |
          | o2es    | Explore   | Account    | any          | Future |                  | QANOV-416789 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual
  @mobile
  Scenario Outline: User with <account_type> account type wants to open the Profile page during a general maintenance window: maintenance screen is displayed
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the user or the app reloads the "Profile" page.
    If the app reloads the content or the user was in other tab and switch to the "Profile" tab, if that action
    reloads the "Profile" page, the maintenance window will be displayed.
    Given user has a "<account_type>" account type
      And user is in the "<origin_tab>" page
      And there is a general maintenance window
     When clicks on the "notification_top_bar.profile_icon" button
     Then the "Maintenance" page is displayed
      And the "navigation_top_bar" element is displayed
      And the "header" element is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "icon" icon is displayed
      And the "title" textfield with "[LANG:maintenance_mode.maintenance_window_title]" text is displayed
      And the "subtitle" textfield with "[LANG:maintenance_mode.maintenance_window_subtitle]" text is displayed
      And the "button" button is not displayed
      And the "navigation_tab_bar" element is not displayed

    @smoke
    Examples:
          | product | origin_tab | account_type | cv   | parent_test_plan | jira_id      |
          | blaude  | Account    | any          | 14.1 | QANOV-203299     | QANOV-405540 |
          | o2de    | Start      | any          | 14.2 | QANOV-312796     | QANOV-405541 |
          | moves   | Dashboard  | telco        | 14.1 | QANOV-126319     | QANOV-405542 |
          | moves   | Account    | legado       | 14.1 | QANOV-126319     | QANOV-405543 |
          | o2uk    | Explore    | any          | 14.1 | QANOV-9915       | QANOV-405544 |

    @old_app
    Examples:
          | product | origin_tab | account_type | cv   | parent_test_plan | jira_id      |
          | vivobr  | Tab Mais   | any          | 14.2 | QANOV-249080     | QANOV-405545 |

    @regression
    Examples:
          | product | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | blaude  | Start      | any          | 14.1   | QANOV-257942     | QANOV-405546 |
          | blaude  | Explore    | any          | 14.1   | QANOV-9915       | QANOV-405547 |
          | blaude  | Support    | any          | 14.1   | QANOV-3149       | QANOV-405548 |
          | o2de    | Account    | any          | 14.2   |                  | QANOV-405549 |
          | o2de    | Explore    | any          | 14.2   | QANOV-9915       | QANOV-405550 |
          | o2de    | Support    | any          | 14.2   | QANOV-3149       | QANOV-405551 |
          | moves   | Start      | telco        | 14.1   | QANOV-674        | QANOV-405552 |
          | moves   | Invoices   | telco        | 14.1   | QANOV-260649     | QANOV-405553 |
          | moves   | Explore    | legado       | 14.1   | QANOV-9915       | QANOV-405554 |
          | moves   | Explore    | telco        | 14.1   | QANOV-9915       | QANOV-405555 |
          | moves   | Support    | legado       | 14.1   | QANOV-3149       | QANOV-405556 |
          | moves   | Gestiones  | telco        | 24.1   | QANOV-3149       | QANOV-405557 |
          | o2uk    | Account    | any          | 14.1   | QANOV-126732     | QANOV-405558 |
          | o2uk    | Start      | postpay      | 14.1   | QANOV-267990     | QANOV-405559 |
          | o2uk    | Support    | any          | 14.1   | QANOV-3149       | QANOV-405560 |
          | o2es    | Account    | any          | Future |                  | QANOV-416790 |
          | o2es    | Explore    | any          | Future |                  | QANOV-416791 |
          | o2es    | Invoices   | any          | Future |                  | QANOV-416792 |
          | o2es    | Support    | any          | Future |                  | QANOV-416793 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile
  Scenario Outline: User with <account_type> account type is in the <origin_tab> tab, clicks on the <tab> tab during a maintenance window in the <tab> tab and clicks on the maintenance page button: user is redirected to the <origin_tab> tab
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the user or the app reloads the "<tab>" page.
    If the app reloads the content or the user was in other tab and switch to the "<tab>" tab, if that action
    reloads the "<tab>" page, the maintenance window will be displayed.
    Given user has a "<account_type>" account type
      And user is in the "<origin_tab>" page
      And there is a maintenance window in the "<tab>" page
      And clicks on the "<tab>" tab
      And the "Maintenance" page is displayed
     When clicks on the "button" button
     Then the "<origin_tab>" tab is displayed

    @smoke
    Examples:
          | product | tab       | origin_tab | account_type | cv   | parent_test_plan | jira_id      |
          | blaude  | Account   | Start      | any          | 14.1 | QANOV-203299     | QANOV-405561 |
          | o2de    | Start     | Explore    | any          | 14.2 | QANOV-312796     | QANOV-405562 |
          | moves   | Dashboard | Start      | telco        | 14.1 | QANOV-126319     | QANOV-405563 |
          | o2uk    | Explore   | Account    | any          | 14.1 | QANOV-9915       | QANOV-405564 |
          | blaude  | Support   | Explore    | any          | 14.1 | QANOV-3149       | QANOV-405565 |
          | o2de    | Profile   | Support    | any          | 14.2 | QANOV-126429     | QANOV-405566 |
          | moves   | Invoices  | Explore    | telco        | 14.1 | QANOV-260649     | QANOV-405567 |

    @regression
    Examples:
          | product | tab      | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | blaude  | Start    | Account    | any          | 14.1   | QANOV-257942     | QANOV-405568 |
          | blaude  | Explore  | Start      | any          | 14.1   | QANOV-9915       | QANOV-405569 |
          | blaude  | Profile  | Support    | any          | 14.1   | QANOV-126429     | QANOV-405570 |
          | o2de    | Account  | Start      | any          | 14.2   |                  | QANOV-405571 |
          | o2de    | Explore  | Account    | any          | 14.2   | QANOV-9915       | QANOV-405572 |
          | o2de    | Support  | Start      | any          | 14.2   | QANOV-3149       | QANOV-405573 |
          | moves   | Account  | Explore    | legado       | 14.1   | QANOV-126319     | QANOV-405574 |
          | moves   | Start    | Dashboard  | telco        | 14.1   | QANOV-674        | QANOV-405575 |
          | moves   | Explore  | Account    | legado       | 14.1   | QANOV-9915       | QANOV-405576 |
          | moves   | Explore  | Invoices   | telco        | 14.1   | QANOV-9915       | QANOV-405577 |
          | moves   | Support  | Account    | legado       | 14.1   | QANOV-3149       | QANOV-405579 |
          | moves   | Support  | Start      | telco        | 14.1   | QANOV-3149       | QANOV-405580 |
          | moves   | Profile  | Support    | legado       | 14.1   | QANOV-126429     | QANOV-405581 |
          | moves   | Profile  | Support    | telco        | 14.1   | QANOV-126429     | QANOV-405582 |
          | o2uk    | Account  | Explore    | any          | 14.1   | QANOV-126732     | QANOV-405583 |
          | o2uk    | Start    | Explore    | postpay      | 14.1   | QANOV-267990     | QANOV-405584 |
          | o2uk    | Support  | Account    | any          | 14.1   | QANOV-3149       | QANOV-405585 |
          | o2uk    | Profile  | Support    | any          | 14.1   | QANOV-126429     | QANOV-405586 |
          | o2es    | Invoices | Explore    | any          | Future |                  | QANOV-416794 |
          | o2es    | Account  | Support    | any          | Future |                  | QANOV-416795 |
          | o2es    | Support  | Invoices   | any          | Future |                  | QANOV-416796 |
          | o2es    | Explore  | Account    | any          | Future |                  | QANOV-416797 |

    @old_app @regression
    Examples:
          | product | tab      | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | vivobr  | Tab Mais | Account    | any          | 14.2   | QANOV-249080     | QANOV-323137 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile
  Scenario Outline: User with <account_type> account type is in the <origin_tab> tab, clicks on the Profile icon during a maintenance window in the Profile page and clicks on the maintenance page button: user is in the <origin_tab> tab
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the user or the app reloads the "Profile" page.
    If the app reloads the content or the user was in other tab and switch to the "Profile" tab, if that action
    reloads the "Profile" page, the maintenance window will be displayed.
    Given user has a "<account_type>" account type
      And user is in the "<origin_tab>" page
      And there is a maintenance window in the "Profile" page
      And clicks on the "notification_top_bar.profile_icon" button
      And the "Maintenance" page is displayed
     When clicks on the "button" button
     Then the "<origin_tab>" tab is displayed

    @smoke
    Examples:
          | product | origin_tab | account_type | cv   | parent_test_plan | jira_id      |
          | blaude  | Account    | any          | 14.1 | QANOV-203299     | QANOV-405587 |
          | o2de    | Start      | any          | 14.2 | QANOV-312796     | QANOV-405588 |
          | moves   | Dashboard  | telco        | 14.1 | QANOV-126319     | QANOV-405589 |
          | moves   | Account    | legado       | 14.1 | QANOV-126319     | QANOV-405590 |
          | o2uk    | Explore    | any          | 14.1 | QANOV-9915       | QANOV-405591 |

    @old_app
    Examples:
          | product | origin_tab | account_type | cv   | parent_test_plan | jira_id      |
          | vivobr  | Tab Mais   | any          | 14.2 | QANOV-249080     | QANOV-323135 |

    @regression
    Examples:
          | product | origin_tab | account_type | cv     | parent_test_plan | jira_id      |
          | blaude  | Start      | any          | 14.1   | QANOV-257942     | QANOV-405594 |
          | blaude  | Explore    | any          | 14.1   | QANOV-9915       | QANOV-405595 |
          | blaude  | Support    | any          | 14.1   | QANOV-3149       | QANOV-405596 |
          | o2de    | Account    | any          | 14.2   |                  | QANOV-405597 |
          | o2de    | Explore    | any          | 14.2   | QANOV-9915       | QANOV-405598 |
          | o2de    | Support    | any          | 14.2   | QANOV-3149       | QANOV-405599 |
          | moves   | Invoices   | telco        | 14.1   | QANOV-260649     | QANOV-405601 |
          | moves   | Start      | telco        | 14.1   | QANOV-674        | QANOV-405602 |
          | moves   | Explore    | legado       | 14.1   | QANOV-9915       | QANOV-405603 |
          | moves   | Explore    | telco        | 14.1   | QANOV-9915       | QANOV-405604 |
          | moves   | Support    | legado       | 14.1   | QANOV-3149       | QANOV-405605 |
          | moves   | Gesiones   | telco        | 14.1   | QANOV-3149       | QANOV-405606 |
          | o2uk    | Account    | any          | 14.1   | QANOV-126732     | QANOV-405607 |
          | o2uk    | Start      | postpay      | 14.1   | QANOV-267990     | QANOV-405608 |
          | o2uk    | Support    | any          | 14.1   | QANOV-3149       | QANOV-405609 |
          | o2es    | Account    | any          | Future |                  | QANOV-416798 |
          | o2es    | Explore    | any          | Future |                  | QANOV-416799 |
          | o2es    | Invoices   | any          | Future |                  | QANOV-416800 |
          | o2es    | Support    | any          | Future |                  | QANOV-416801 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-5195 @manual
  @mobile @smoke @har
  Scenario Outline: User with <account_type> account type log in during a maintenance window in the <landing_tab> tab: maintenance screen is displayed and user is redirected to <tab> when clicks the maintenance button
    To test this you have to activate the general maintenance mode or the corresponding tab through the developer settings.
    The maintenance window will be displayed if the app or the user perfoms any action that reloads the Splash Screen page.
    Given user has a "<account_type>" account type
      And user is in the "Splash Screen" page
      And there is a maintenance window in the "<landing_tab>" page
      And clicks on the "login_button" button
      And logs in the application
      And the "Maintenance" page is displayed
     When clicks on the "button" button
     Then the "<tab>" page is displayed

    Examples:
          | product | cv   | landing_tab | tab       | account_type | jira_id      |
          | blaude  | 14.1 | Start       | Account   | any          | QANOV-405610 |
          | o2de    | 14.2 | Start       | Account   | any          | QANOV-405611 |
          | moves   | 14.1 | Start       | Dashboard | telco        | QANOV-405612 |
          | moves   | 14.1 | Account     | Explore   | legado       | QANOV-405613 |
          | o2uk    | 14.1 | Start       | Account   | postpay      | QANOV-405614 |
          | o2es    | 14.1 | Account     | Explore   | any          | QANOV-405614 |
