# -*- coding: utf-8 -*-
@jira.QANOV-10166
Feature: Categories and filters

  Actions Before each Scenario:
    Given user is in the "Explore" page

  Actions After the feature:
     Then user is in the "Explore" page

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<bug_id>
  @jira.link.relates_to.NOV-174735 @mobile @smoke
  Scenario Outline: A user in Explore page can see the product categories
    Explore categories can change since they are managed by the OB. Check current categories:
    ExplorePublishing.1.getCategories or in the CMS
     Then the "categories_carousel" carousel is displayed

    @automatic @live @next @qa @webapp @old_app
    Examples:
          | product | bug_id   | cv   | jira_id     |
          | vivobr  | IOS-7294 | 13.3 | QANOV-10333 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | bug_id | cv   | jira_id     |
          | o2uk    |        | 13.3 | QANOV-10335 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | bug_id | cv   | jira_id     |
          | moves   |        | 13.3 | QANOV-10337 |

    @automatic @cert3 @live @next @qa @raitt_drop1 @webapp
    Examples:
          | product | bug_id | cv   | jira_id      |
          | blaude  |        | 13.9 | QANOV-228128 |

    @manual
    Examples:
          | product | bug_id | cv   | jira_id     |
          | o2de    |        | 14.2 | QANOV-49132 |

  @jira.<jira_id> @<client> @<product> @ber @jira.cv.<cv> @jira.link.depends_on.<depends_on> @mobile @sanity
  Scenario Outline: Each category in the categories carousel has a name and an image
    Explore categories can change since they are managed by the OB. Check current categories:
    ExplorePublishing.1.getCategories or in the CMS
     Then each element in the "categories_carousel" list has the "name" field
      And each element in the "categories_carousel" list has the "icon" field

    @automatic @live @next @qa @webapp @old_app
    Examples:
          | product | client  | depends_on  | cv   | jira_id      |
          | vivobr  | android | QANOV-10333 | 13.3 | QANOV-98233  |
          | vivobr  | ios     | QANOV-10333 | 13.3 | QANOV-135205 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | client  | depends_on  | cv   | jira_id      |
          | o2uk    | android | QANOV-10335 | 13.3 | QANOV-98234  |
          | o2uk    | ios     | QANOV-10335 | 13.3 | QANOV-135206 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | client  | depends_on  | cv   | jira_id      |
          | moves   | android | QANOV-10337 | 13.3 | QANOV-98235  |
          | moves   | ios     | QANOV-10337 | 13.3 | QANOV-135207 |

    @automatic @cert3 @live @next @qa @raitt_drop1 @webapp
    Examples:
          | product | client  | depends_on   | cv   | jira_id      |
          | blaude  | android | QANOV-228128 | 13.9 | QANOV-228133 |
          | blaude  | ios     | QANOV-228128 | 13.9 | QANOV-228134 |

    @manual
    Examples:
          | product | client  | depends_on  | cv   | jira_id      |
          | o2de    | android | QANOV-49132 | 14.2 | QANOV-207576 |
          | o2de    | ios     | QANOV-49132 | 14.2 | QANOV-207577 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-174756 @mobile @regression
  Scenario Outline: Categories with no content won't be shown in the carousel
    Given user has no content for some Explore category
     Then the category with no content is not displayed in the the categories carousel

    @automatic @qa @webapp @old_app
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10333 | 13.3 | QANOV-10339 |

    @automatic @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10335 | 13.3 | QANOV-10341 |

    @automatic @qa @webapp
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10337 | 13.3 | QANOV-10343 |

    @automatic @qa @webapp
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228128 | 13.9 | QANOV-228135 |

    @manual
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2de    | QANOV-49132 | 14.2 | QANOV-49133 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-174776 @mobile @no_automatable @regression
  Scenario Outline: A user can tap on a category not entirely included in the screen
    Given the category at the "<position>" position is only partially displayed on the screen
     When clicks on the partially-displayed category
     Then "Explore Category" page is displayed

    Examples:
          | product | position | depends_on   | cv   | jira_id      |
          | vivobr  | left     | QANOV-10333  | 13.3 | QANOV-10455  |
          | vivobr  | right    | QANOV-10333  | 13.3 | QANOV-10457  |
          | o2uk    | left     | QANOV-10335  | 13.3 | QANOV-10459  |
          | o2uk    | right    | QANOV-10335  | 13.3 | QANOV-10461  |
          | moves   | left     | QANOV-10337  | 13.3 | QANOV-10463  |
          | moves   | right    | QANOV-10337  | 13.3 | QANOV-10465  |
          | blaude  | left     | QANOV-228128 | 13.9 | QANOV-228137 |
          | blaude  | right    | QANOV-228128 | 13.9 | QANOV-228138 |
          | o2de    | left     | QANOV-49132  | 14.2 | QANOV-49151  |
          | o2de    | right    | QANOV-49132  | 14.2 | QANOV-49152  |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-174760 @mobile @regression
  Scenario Outline: The list of categories won't scroll with the Explore content
     When I do "2" swipes from bottom to top
     Then the Explore categories carousel is not displayed

    @automatic @live @next @qa @old_app
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10333 | 13.3 | QANOV-10479 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2uk    | QANOV-10335 | 13.3 | QANOV-10480 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | moves   | QANOV-10337 | 13.3 | QANOV-10481 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | jira_id      |
          | blaude  | QANOV-228128 | 13.9 | QANOV-228139 |

    @manual
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | o2de    | QANOV-49132 | 14.2 | QANOV-49156 |

  @jira.<jira_id> @<exec_mode> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-174755 @mobile @regression
  Scenario Outline: A user can navigate through the carousel of categories
     When takes a screenshot
      And swipes the categories carousel
      And waits "2" seconds
     Then check that the screen is not in the previous state with threshold "0"

    @live @next @qa @old_app
    Examples:
          | product | depends_on  | cv   | exec_mode | jira_id     |
          | vivobr  | QANOV-10333 | 13.3 | manual    | QANOV-10482 |

    @cert0 @cert1 @live @next @qa
    Examples:
          | product | depends_on  | cv   | exec_mode | jira_id     |
          | o2uk    | QANOV-10335 | 13.3 | manual    | QANOV-10483 |

    @cert2 @live @next @qa
    Examples:
          | product | depends_on  | cv   | exec_mode | jira_id     |
          | moves   | QANOV-10337 | 13.3 | manual    | QANOV-10484 |

    @cert3 @live @next @qa
    Examples:
          | product | depends_on   | cv   | exec_mode | jira_id      |
          | blaude  | QANOV-228128 | 13.9 | manual    | QANOV-228140 |

    Examples:
          | product | depends_on  | cv   | exec_mode | jira_id     |
          | o2de    | QANOV-49132 | 14.2 | manual    | QANOV-49157 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-174794 @mobile @no_automatable @regression
  Scenario Outline: A user can see a empty-case message when tapping on a category that has just got empty
    internal_checkpoint="
    - Modify content in CMS so that there's a category with only one card, set an expiration date for that card a couple of minutes in the future to so you can see it expire while navigating through the app
    - Login and navigate to Explore tab
    - Select the category that has only one card about to expire, the card should be displayed
    - Wait until the expiration date arrives, card should still be there if you don't navigate through the app
    - Select a different category and switch back to the previous category, card should not be there any more and an empty case should be displayed"
    Given one of the categories in the carousel gets empty right now
     When clicks on the empty category in the carousel
     Then the "Explore Category" page is displayed
      And the "category_empty_case_title" textfield with "[LANG:explore.categories.category_empty_case_title]" text is displayed
      And the "category_empty_case_text" textfield with "[LANG:explore.categories.category_empty_case_text]" text is displayed

    @old_app
    Examples:
          | product | depends_on  | cv   | jira_id     |
          | vivobr  | QANOV-10373 | 13.3 | QANOV-10485 |

    Examples:
          | product | depends_on   | cv   | jira_id      |
          | o2uk    | QANOV-10386  | 13.3 | QANOV-10486  |
          | moves   | QANOV-10399  | 13.3 | QANOV-10487  |
          | blaude  | QANOV-228128 | 13.9 | QANOV-228141 |
          | o2de    | QANOV-49132  | 14.2 | QANOV-49158  |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.IOS-6972 @jira.link.parent_test_plan.QANOV-66641 @mobile @sanity
  Scenario Outline: A user can select a category from the categories selector
     When opens an Explore category
     Then the "Explore Category" page is displayed
      And waits "2" seconds
      And the header that contains the "[CONTEXT:category_name]" text is displayed
      And the "navigation_top_bar.profile_icon" icon is not displayed
      And the "back_button" button is displayed
      And clicks on the "back_button" button
     Then the "Explore" page is displayed

    @automatic @live @next @qa @old_app
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | vivobr  | 13.3 | QANOV-10333 | QANOV-67249 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | o2uk    | 13.3 | QANOV-10335 | QANOV-67250 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | moves   | 13.3 | QANOV-10337 | QANOV-67251 |

    @automatic @cert3 @live @next @qa @raitt_drop1
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-228128 | QANOV-228142 |

    @manual
    Examples:
          | product | cv   | depends_on  | jira_id      |
          | o2de    | 14.2 | QANOV-49132 | QANOV-228143 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-66641 @mobile @smoke
  Scenario Outline: Only the cards belonging to the selected category are displayed in the given Category page
    Given opens an Explore category
      And the "Explore Category" page is displayed
      And waits "1" seconds
     Then only the cards belonging to that category are displayed

    @automatic @live @next @qa @webapp @old_app
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | vivobr  | 13.3 | QANOV-67249 | QANOV-98236 |

    @automatic @cert0 @cert1 @live @next @qa @webapp
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | o2uk    | 13.3 | QANOV-67250 | QANOV-98237 |

    @automatic @cert2 @live @next @qa @webapp
    Examples:
          | product | cv   | depends_on  | jira_id     |
          | moves   | 13.3 | QANOV-67251 | QANOV-98238 |

    @automatic @cert3 @live @next @qa @raitt_drop1 @webapp
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-228142 | QANOV-228145 |

    @manual
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-228143 | QANOV-228146 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.detects.ANDROID-13638
  @jira.link.parent_test_plan.QANOV-66641 @mobile @regression
  Scenario Outline: A user can access an explore category via deeplink in Android devices
    The deeplink for a category follows this format https://web.vivo.com.br/explore?categoryId=[categoryID]
    The webviews will be opened in flow mode, so the navigation top bar is different than when opening it
    from the categories carousel
    Given user has content for some Explore category
     When opens the "Explore.[CONTEXT:category_name]" deeplink with the app in "killed" status
     Then the internal webview with "[CONTEXT:category_name]" header is displayed
      And waits "2" seconds
      And clicks on the "navigation_top_bar.back_button" button
      And the app is in "background" status
      And goes back to the app

    @automatic @live @next @qa @old_app
    Examples:
          | product | cv   | jira_id     |
          | vivobr  | 13.3 | QANOV-67273 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | o2uk    | 13.3 | QANOV-67274 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id     |
          | moves   | 13.3 | QANOV-67275 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228151 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-228152 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.detects.IOS-6972 @jira.link.detects.IOS-7794
  @jira.link.parent_test_plan.QANOV-66641 @mobile @regression
  Scenario Outline: A user can access an explore category via deeplink in iOS devices
    The deeplink for a category follows this format https://web.vivo.com.br/explore?categoryId=[categoryID]
    The webviews will be opened in flow mode, so the navigation top bar is different than when opening it
    from the categories carousel.
    Given user has content for some Explore category
     When opens the "Explore.[CONTEXT:category_name]" deeplink with the app in "killed" status
     Then the internal webview with "[CONTEXT:category_name]" header is displayed
      And waits "2" seconds
      And clicks on the "navigation_top_bar.back_button" button
      And the "[CONF:landing_tab]" page is displayed

    @automatic @live @next @qa @old_app
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 13.3 | QANOV-594301 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 13.3 | QANOV-594302 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.3 | QANOV-594303 |

    @automatic @cert3 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-594304 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.2 | QANOV-594305 |
