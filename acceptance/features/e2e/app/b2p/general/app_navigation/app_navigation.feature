# -*- coding: utf-8 -*-
@jira.QABP-121
Feature: App Navigation


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can see the tabs with text
    Tabs are defined by the OB with Adobe CMS. To check this configuration see Visual Modes API
    Given the tabs are configured "with" text in the CMS
      And user is in the "Any Tab" page
     Then the "navigation_tab_bar.icon_list" list is displayed
      And the "navigation_tab_bar.textfield_list" list is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-122 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can see the tabs without text
    Tabs are defined by the OB with Adobe CMS. To check this configuration see Visual Modes API
    Given the tabs are configured "without" text in the CMS
      And user is in the "Any Tab" page
     Then the "navigation_tab_bar.icon_list" list is displayed
      And the "navigation_tab_bar.textfield_list" list is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-123 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can reload a tab scrolling down
    Given user is in the "Any Tab" page
     When pulls down the page to refresh
     Then the "loading" icon is displayed
      And the "Any Tab" page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-124 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user will see 5 tabs if there are more than 5 configured in CMS
    Given there are ">5" tabs configured in CMS
      And user is in the "Any Tab" page
     Then the "navigation_tab_bar.icon_list" list has "5" elements

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-125 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user will see less than 6 tabs
    Given user is in the "Any Tab" page
     Then the "navigation_tab_bar.icon_list" list has "<6" elements

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-126 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can see the top bar
    Top bar elements are defined by the OB with Adobe CMS.
    Given there are icons configured in CMS for the top bar
      And user is in the "Any Tab" page
     Then the "navigation_top_bar" element is displayed
      And the "navigation_top_bar.icon_list" list is displayed
      And the "navigation_top_bar.title" textfield is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-127 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user won't see icons in the top bar if are not configured in CMS
    Top bar elements are defined by the OB with Adobe CMS.
    Given there are not icons configured in CMS for the top bar
      And user is in the "Any Tab" page
     Then the "navigation_top_bar" element is displayed
      And the "navigation_top_bar.icon_list" list is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-128 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can see the title in large mode
    Top bar elements are defined by the OB with Adobe CMS.
    Given user is in the "Large Tab" page
     Then the "navigation_top_bar.title" element is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-129 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can see the title in standard mode after scrolling
    Top bar elements are defined by the OB with Adobe CMS.
    Given user is in the "Large Tab" page
     When scrolls down
     Then the "navigation_top_bar.title" element is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-130 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can open a modal webview from top bar icon on iOS devices
    Top bar elements are defined by the OB with Adobe CMS.
    Given a modal webview is configured in CMS for a top bar icon
      And user is in the "Any Tab" page
     When clicks on the "navigation_top_bar.icon" icon
     Then the internal modal webview is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.title" textfield is displayed
      And the "navigation_tab_bar" element is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-131 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A <product> user can open a flow webview from top bar icon on Android devices
    Top bar elements are defined by the OB with Adobe CMS.
    Given a flow webview is configured in CMS for a top bar icon
      And user is in the "Any Tab" page
     When clicks on the "navigation_top_bar.icon" icon
     Then the internal flow webview is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "navigation_top_bar.title" textfield is displayed
      And the "navigation_tab_bar" element is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-132 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can open a modal webview from OB webview
    Given user is in the "Test Webview Modes" page
     When clicks on the "test_modal_link" link
     Then the internal modal webview is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.title" textfield is displayed
      And the "navigation_tab_bar" element is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-133 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can open a flow webview from OB webview on iOS devices
    Given user is in the "Test Webview Modes" page
     When clicks on the "test_flow_link" link
     Then the internal flow webview is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "navigation_top_bar.title" textfield is displayed
      And the "navigation_tab_bar" element is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-134 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @manual @mobile @sanity
  Scenario Outline: A <product> user can open a flow webview from OB webview on Android devices
    Given user is in the "Test Webview Modes" page
     When clicks on the "test_flow_link" link
     Then the internal flow webview is displayed
      And the "navigation_top_bar.back_button" button is displayed
      And the "navigation_top_bar.title" textfield is displayed
      And the "navigation_tab_bar" element is not displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-135 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> user can open a browser from OB webview link
    Given user is in the "Test Webview Modes" page
     When clicks on the "test_browser_link" link
     Then the browser webview is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-136 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: A <product> logged user opens the app: Landing Tab page is displayed
     When terminates the app
      And launches the app
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id  |
          | was     | Future | QABP-137 |
