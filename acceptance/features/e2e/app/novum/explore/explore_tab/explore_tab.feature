# -*- coding: utf-8 -*-
@jira.QANOV-9915
Feature: Explore tab


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-21432 @mobile @smoke
  Scenario Outline: User can access to the Explore page
    Given user is in the "[CONF:landing_tab]" page
     When clicks on the "navigation_tab_bar.explore_tab" button
     Then the "Explore" page is displayed
      And the "[LANG:explore.explore_name]" header is displayed

    @automatic @cert0 @cert1 @jira.link.parent_test_plan.QANOV-35253 @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 13.3 | QANOV-9917 |

    @automatic @jira.link.parent_test_plan.QANOV-200803
    @jira.link.parent_test_plan.QANOV-319348 @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 13.3 | QANOV-9916 |

    @automatic @cert3 @live @next @qa @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228245 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | o2de    | 14.2   | QANOV-49092  |
          | o2es    | Future | QANOV-417755 |

  @jira.QANOV-297827 @android @automatic @cert2 @ios @jira.cv.14.4 @jira.link.parent_test_plan.QANOV-293817 @live @mobile
  @moves @next @qa @smoke
  Scenario: A Moves user can access to the Explore page
    Given user is in the "Dashboard" page
     When clicks on the "navigation_tab_bar.explore_tab" button
     Then the "Explore" page is displayed
      And the "[LANG:explore.explore_name]" header is displayed
      And the "subtitle_text" textfield with "Todo lo que te imaginas está en Movistar" text is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-92018 @mobile @no_automatable @smoke
  Scenario Outline: User can see the modules in the order configured in the CMS
    internal_checkpoint="You can see the order of the modules in the Layout section of the CMS"
    Given user is in the "Explore" page
     Then the Explore modules are displayed in the order configured in the CMS

    @raitt_drop1
    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-228246 |

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 13.3   | QANOV-9919   |
          | o2uk    | 13.3   | QANOV-9920   |
          | moves   | 13.3   | QANOV-9921   |
          | o2de    | 14.2   | QANOV-49093  |
          | o2es    | Future | QANOV-417756 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @sanity
  @vivobr @<har>
  Scenario Outline: A vivobr user who is in the <main_tab> tab can access to the Explore page in Novo App
    Grey means alternative color in the CMS configuration
    Given user is in the "<main_tab>" page
      And user has any "any" account types
      And there are "1" modules configured in the header of the modular page
      And the "tabs" module is configured in CMS for "explore" page
     When clicks on the "navigation_tab_bar.explore_tab" button
     Then the "Explore" page is displayed
      And the "header" section is configured in "grey" color
      And the "navigation_top_bar.menu_mais" icon is displayed
      And the "header.tabs" module is displayed
      And the "header.tabs.assinar_entrypoint" tab is selected
      And the "header.tabs.comprar_entrypoint" tab is displayed

    Examples:
          | main_tab   | ber | har | jira_id      |
          | Assinatura | ber |     | QANOV-388373 |
          | Pra Voce   |     | har | QANOV-388374 |
          | Beneficios |     |     | QANOV-388375 |
          | Financas   |     |     | QANOV-388376 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr
  Scenario Outline: A vivobr user who is in "<explore_tab>" Explore tab can see the categories carousel
    Given user is in the "Explore" page
      And user has any "any" account types
      And there are "1" modules configured in the header of the modular page
      And the "tabs" module is configured in CMS for "explore" page
      And user has the "services-summary" module configured in CMS for "exlore-<explore_tab>" page
     When clicks on the "header.tabs.<explore_tab>_entrypoint" tab
     Then the "categories_carousel" carousel is displayed

    Examples:
          | explore_tab | jira_id      |
          | assinar     | QANOV-493052 |
          | comprar     | QANOV-493053 |

  @jira.<jira_id> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr
  Scenario Outline: A vivobr user can access to the <explore_tab> Explore tab via a deeplink
    Given user has any "any" account types
     When user opens the "Explore.<explore_tab>" deeplink with the app in "killed" status
     Then the "Explore" page is displayed
      And the "header.tabs.<explore_tab>_entrypoint" tab is selected

    Examples:
          | explore_tab | jira_id      |
          | assinar     | QANOV-417463 |
          | comprar     | QANOV-417464 |

  @jira.QANOV-417465 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr
  Scenario Outline: A vivobr user see that every item in the categories carousel has a name and an image
    internal_checkpoint="Explore categories can change since they are managed by the OB. Check current categories:
    ExplorePublishing.1.getCategories or in the CMS"
    Given user is in the "Explore" page
      And user has any "any" account types
      And there are "1" modules configured in the header of the modular page
      And the "tabs" module is configured in CMS for "explore" page
      And user has the "services-summary" module configured in CMS for "exlore-<explore_tab>" page
     When clicks on the "header.tabs.<explore_tab>_entrypoint" tab
     Then each element in the "header.categories_carousel" list has the "name" field
      And each element in the "header.categories_carousel" list has the "icon" field

    Examples:
          | explore_tab | jira_id      |
          | assinar     | QANOV-417465 |
          | comprar     | QANOV-417465 |

  @jira.QANOV-417466 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @smoke @vivobr
  Scenario Outline: A vivobr who is in the <explore_tab> Explore tab can select any category from the categories selector
    Given user is in the "Explore" page
      And user has any "any" account types
     When clicks on the "header.tabs.<explore_tab>_entrypoint" tab
      And clicks on any element in the "categories_carousel" list
     Then the internal webview with "[CONTEXT:category_name]" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Explore" page is displayed
      And the "header.tabs.<explore_tab>_entrypoint" tab is selected

    Examples:
          | explore_tab | jira_id      |
          | assinar     | QANOV-417466 |
          | comprar     | QANOV-417466 |

  @jira.QANOV-417467 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @regression
  @vivobr
  Scenario: A vivobr user will see the last element in the categories carousel with the text "more info" when there are more than 6 categories
    Given user has the "service-summary" module configured in CMS for "explore-assinar" page
      And user has any "any" account types
      And the "service-summary" module for the "exlore-assinar" page contains ">6" elements
      And the user is in the "Explore" page
      And the element in "name" position in the "categories_carousel" list with "Mais" text is displayed

  @jira.QANOV-417468 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @regression
  @vivobr
  Scenario: A vivobr user can see the rest of categories not shown in the carousel when there are more than 6 categories
    More Explore Categories page is the full view of the Entrypoint list
    Given user has the "service-summary" module configured in CMS for "explore-assinar" page
      And user has any "any" account types
      And the "service-summary" module for the "exlore-assinar" page contains ">6" elements
      And the user is in the "Explore" page
     When clicks on the element with "name" field with "Mais" value of the "categories_carousel" list
     Then the "More Explore Categories" page is displayed
      And the "more_loja_categories" module is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Explore" page is displayed

  @jira.QANOV-493054 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-374009 @manual @mobile @regression
  @vivobr
  Scenario: A vivobr user can access to a category from the "More Explore Categories" page
    More Explore Categories page is the full view of the Entrypoint list
    Given user has the "service-summary" module configured in CMS for "explore-assinar" page
      And the "service-summary" module for the "exlore-assinar" page contains ">6" elements
      And the user is in the "Explore" page
      And clicks on the element with "name" field with "Mais" value of the "categories_carousel" list
      And the "More Loja Categories" page is displayed
     When clicks on any element in the "more_loja_categories" list
     Then the "Explore Category" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "More Explore Categories" page is displayed


  @jira.<jira_id> @<product> @jira.cv.<cv> @jira.link.relates_to.NOV-39064 @mobile @regression
  Scenario Outline: Page is scrolled up when user taps on the Explore tab button after scrolling down
    Given user is in the "Explore" page
     When clicks on the "navigation_tab_bar.explore_tab" button
      And waits "2" seconds
      And takes a screenshot
      And I do "1" swipes from bottom to top
      And clicks on the "navigation_tab_bar.explore_tab" button
      And waits "2" seconds
     Then check that the screen is in the previous state with threshold "0.05"

    @android @automatic @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 13.3 | QANOV-9931 |

    @android @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 13.3 | QANOV-9932 |

    @android @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | moves   | 13.3 | QANOV-9933 |

    @ios @jira.link.detects.IOS-7386 @no_automatable
    Examples:
          | product | cv   | jira_id      |
          | o2uk    | 13.3 | QANOV-207579 |
          | moves   | 13.3 | QANOV-207580 |
          | vivobr  | 13.3 | QANOV-207581 |

    @android @ios @manual
    Examples:
          | product | cv     | jira_id      |
          | blaude  | 13.9   | QANOV-49097  |
          | o2de    | 14.2   | QANOV-207578 |
          | o2es    | Future | QANOV-417757 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-42227 @mobile @regression
  Scenario Outline: Explore tab maintains scroll position after navigate between tabs
    Given user is in the "Explore" page
     When I do "1" swipes from bottom to top
      And waits "2" seconds
      And takes a screenshot
      And user is in the "[CONF:landing_tab]" page
      And clicks on the "navigation_tab_bar.explore_tab" button
      And waits "2" seconds
     Then check that the screen is in the previous state with threshold "0.07"

    @automatic @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | vivobr  | 13.3 | QANOV-9934 |

    @automatic @cert0 @cert1 @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | o2uk    | 13.3 | QANOV-9935 |

    @automatic @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id    |
          | moves   | 13.3 | QANOV-9936 |

    @manual
    Examples:
          | product | cv     | jira_id      |
          | blaude  | 13.9   | QANOV-228247 |
          | o2de    | 14.2   | QANOV-49099  |
          | o2es    | Future | QANOV-417758 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.IOS-6937 @jira.link.relates_to.NOV-29329
  @manual @mobile @regression
  Scenario Outline: User selects Explore but content request fails completely or is empty: error message will be shown
    internal_checkpoint="This can be tested by introducing a wrong API endpoint"
    Given user is in the "Explore" page
     When terminates the app
      And launches the app
      And clicks on the "navigation_tab_bar.explore_tab" button
      And the "Explore" content request fails
     Then the "Explore No Connectivity" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:explore.no_connectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_body" textfield with "[LANG:explore.no_connectivity.no_connectivity_body]" text is displayed
      And the "retry_button" button with "[LANG:explore.no_connectivity.retry_button]" text is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 13.3   | QANOV-9940   |
          | o2uk    | 13.3   | QANOV-9941   |
          | moves   | 13.3   | QANOV-9942   |
          | blaude  | 13.9   | QANOV-228248 |
          | o2de    | 14.2   | QANOV-49100  |
          | o2es    | Future | QANOV-417759 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-195216 @mobile @no_automatable @smoke
  Scenario Outline: A user of given audience will not see the Explore cards configured for other audience
    You can test this with any of the audiences available in the Audience Catalogue section of the cms,
    this ones here are just an example.
    See the Explore How To doc in our Sharepoint to check how to know a user's audiences.
    Given user has no "<audience>" audience
      And there is a "<audience>" audience configured in a Explore card
      And user is in the "Explore" page
     Then the Explore card is not displayed

    @raitt_drop1
    Examples:
          | audience | product | cv   | parent_test_plan | jira_id      |
          | box7     | blaude  | 13.9 |                  | QANOV-228250 |

    Examples:
          | audience | product | cv   | parent_test_plan | jira_id      |
          | legado   | moves   | 13.3 |                  | QANOV-9962   |
          | control  | vivobr  | 13.3 |                  | QANOV-38289  |
          | AO2      | o2uk    | 13.3 | QANOV-77438      | QANOV-47858  |
          | postpay  | o2de    | 14.2 |                  | QANOV-215933 |

  @jira.<jira_id> @<ber> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-195215 @mobile @sanity
  Scenario Outline: A user of given audience will see the Explore cards configured for the given audience
    You can test this with any of the audiences available in the Audience Catalogue section of the cms,
    this ones here are just an example.
    See the Explore How To doc in our Sharepoint to check how to know a user's audience.
    Given user has content for the "<audience>" audience configured in a Explore card
      And user belongs to the "<audience>" audience
      And user is in the "Explore" page
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text

    @automatic @qa @webapp
    Examples:
          | audience | product | cv   | ber | parent_test_plan | jira_id     |
          | control  | vivobr  | 13.3 | ber |                  | QANOV-38290 |

    @automatic @qa @webapp
    Examples:
          | audience | product | cv   | ber | parent_test_plan | jira_id    |
          | telco    | moves   | 13.3 | ber |                  | QANOV-9968 |

    @automatic @qa @webapp
    Examples:
          | audience | product | cv   | ber | parent_test_plan | jira_id     |
          | legacy   | o2uk    | 13.3 | ber |                  | QANOV-47861 |

    @automatic @qa @raitt_drop1 @webapp
    Examples:
          | audience | product | cv    | ber | parent_test_plan | jira_id      |
          | postpay  | blaude  | 14.10 | ber |                  | QANOV-228251 |

    @manual
    Examples:
          | audience | product | cv   | ber | parent_test_plan | jira_id      |
          | prepay   | o2de    | 14.2 | ber |                  | QANOV-215934 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user of a given audience will see the links configured with a audience also included in the Banner explore card
    You can test this with any of the audiences available in the Audience Catalogue section of the cms,
    this ones here are just an example.
    Given user belongs to the "<audience>" audience
      And user has a "banner" module with a "<audience>" audience configured and with links in the Explore content
      And there is a "<audience>" audience configured in the selected link
      And user is in the "Explore" page
     When searches the banner module with link
     Then the selected explore "module" has the "link" field displayed

    Examples:
          | audience | product | cv   | jira_id      |
          | legado   | moves   | 13.3 | QANOV-215935 |
          | postpay  | vivobr  | 13.3 | QANOV-215936 |
          | ao2      | o2uk    | 13.3 | QANOV-215937 |
          | legacy   | o2uk    | 13.3 | QANOV-215938 |
          | postpay  | blaude  | 13.9 | QANOV-228252 |
          | postpay  | o2de    | 14.2 | QANOV-215939 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user of given audience will see the links configured with an empty audience in Banner explore card
    You can test this with any of the audiences available in the Audience Catalogue section of the cms,
    this ones here are just an example.
    Given user belongs to the "<audience>" audience
      And user has a "banner" module with "<audience>" audience configured and with links in the Explore content
      And there is a "empty" audience configured in the selected link
      And user is in the "Explore" page
     When searches the banner module with link
     Then the selected explore "module" has the "link" field displayed

    Examples:
          | audience | product | cv   | jira_id      |
          | legado   | moves   | 13.3 | QANOV-215940 |
          | postpay  | vivobr  | 13.3 | QANOV-215941 |
          | ao2      | o2uk    | 13.3 | QANOV-215942 |
          | legacy   | o2uk    | 13.3 | QANOV-215943 |
          | postpay  | blaude  | 13.9 | QANOV-228253 |
          | postpay  | o2de    | 14.2 | QANOV-215944 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user of given audience won't see the links configured with a audience not included in the Banner explore card
    You can test this with any of the audiences available in the Audience Catalogue section of the cms,
    this ones here are just an example.
    Given user belongs to the "<audience>" audience
      And user has a "banner" module with "<audience>" audience configured and with links in the Explore content
      And there is a "<link_audience>" audience configured in the selected link
      And user is in the "Explore" page
     When searches the banner module with link
     Then the selected explore "module" does not have the "link" field displayed

    Examples:
          | audience | link_audience | product | cv   | jira_id      |
          | legado   | telco         | moves   | 13.3 | QANOV-215945 |
          | postpay  | prepay        | vivobr  | 13.3 | QANOV-215946 |
          | ao2      | legacy        | o2uk    | 13.3 | QANOV-215947 |
          | legacy   | ao2           | o2uk    | 13.3 | QANOV-215948 |
          | postpay  | prepay        | blaude  | 13.9 | QANOV-228254 |
          | postpay  | prepay        | o2de    | 14.2 | QANOV-215949 |

  @jira.<jira_id> @<ber> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.<relates_to> @mobile @no_automatable @smoke
  Scenario Outline: Explore modules shown to the user depend on the account type
    other_affected_versions="2021-07, 2022-23"
    If user has several account types, then the modules for all the account types that apply to that user are displayed
    Zero Case test plan - Cover the US: 0.1.1 , 1.1, 1.2
    Given user has a "<account_type>" account type
      And user is in the "Explore" page
     Then only the modules in the "<account_type>" layout are displayed

    @raitt_drop1
    Examples:
          | product | account_type | relates_to | cv   | parent_test_plan | ber | jira_id      |
          | blaude  | prepay       |            | 13.9 |                  | ber | QANOV-228255 |
          | blaude  | postpay      |            | 13.9 |                  |     | QANOV-228256 |

    Examples:
          | product | account_type    | relates_to | cv     | parent_test_plan                                 | ber | jira_id      |
          | vivobr  | legacy prepay   | NOV-80090  | 13.3   |                                                  | ber | QANOV-9970   |
          | vivobr  | legacy postpay  | NOV-80090  | 13.3   |                                                  |     | QANOV-9972   |
          | vivobr  | legacy control  | NOV-80090  | 13.3   |                                                  |     | QANOV-9974   |
          | vivobr  | beatrix postpay | NOV-80090  | 13.3   |                                                  |     | QANOV-9976   |
          | vivobr  | beatrix control | NOV-80090  | 13.3   |                                                  |     | QANOV-9978   |
          | vivobr  | landline        | NOV-80090  | 13.3   | QANOV-21791                                      |     | QANOV-25199  |
          | vivobr  | internet        | NOV-80090  | 13.3   | QANOV-21791                                      |     | QANOV-25200  |
          | vivobr  | tv              | NOV-80090  | 13.3   | QANOV-21791                                      |     | QANOV-25201  |
          | vivobr  | jeri            |            | 13.5   | QANOV-200803:QANOV-226748                        | ber | QANOV-203776 |
          | vivobr  | control_n       |            | 13.5   | QANOV-200803                                     | ber | QANOV-203777 |
          | o2uk    | legacy prepay   | NOV-80090  | 13.3   | QANOV-24141                                      |     | QANOV-9980   |
          | o2uk    | legacy postpay  | NOV-80090  | 13.3   |                                                  |     | QANOV-9983   |
          | o2uk    | ao2 postpay     |            | 13.3   | QANOV-24140                                      |     | QANOV-120815 |
          | o2uk    | device          |            | 13.3   | QANOV-35253:QANOV-24141:QANOV-77438:QANOV-178803 |     | QANOV-37490  |
          | moves   | legado prepay   | NOV-80090  | 13.3   |                                                  |     | QANOV-9986   |
          | moves   | legado postpay  | NOV-80090  | 13.3   |                                                  |     | QANOV-9988   |
          | moves   | legado priority | NOV-80090  | 13.3   |                                                  |     | QANOV-9990   |
          | moves   | telco postpay   | NOV-80090  | 13.3   |                                                  |     | QANOV-9992   |
          | moves   | telco priority  | NOV-80090  | 13.3   |                                                  |     | QANOV-9994   |
          | moves   | no subscription |            | 12.9   | QANOV-131587                                     |     | QANOV-9996   |
          | o2de    | prepay          |            | 14.2   |                                                  |     | QANOV-228257 |
          | o2de    | postpay         |            | 14.2   |                                                  | ber | QANOV-228258 |
          | o2es    | postpay         |            | Future |                                                  |     | QANOV-417760 |

  @jira.<jira_id> @<client> @<product> @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.relates_to.NOV-80090 @mobile @no_automatable @smoke
  Scenario Outline: Explore modules shown to the user depend on the device type
    Given user is in the "Explore" page
     Then only the modules in the "<client>" layout are displayed

    @raitt_drop1
    Examples:
          | product | cv   | client  | jira_id      |
          | blaude  | 13.9 | android | QANOV-228259 |
          | blaude  | 13.9 | ios     | QANOV-228260 |

    Examples:
          | product | cv     | client  | jira_id      |
          | vivobr  | 13.3   | android | QANOV-9998   |
          | vivobr  | 13.3   | ios     | QANOV-10000  |
          | o2uk    | 13.3   | android | QANOV-10002  |
          | o2uk    | 13.3   | ios     | QANOV-10005  |
          | moves   | 13.3   | android | QANOV-10008  |
          | moves   | 13.3   | ios     | QANOV-10010  |
          | o2de    | 14.2   | android | QANOV-228261 |
          | o2de    | 14.2   | ios     | QANOV-228262 |
          | o2es    | Future | android | QANOV-417761 |
          | o2es    | Future | ios     | QANOV-417762 |

  @jira.QANOV-56659 @android @ios @jira.cv.13.3 @jira.link.parent_test_plan.QANOV-56585 @manual @mobile @regression
  @vivobr @old_app
  Scenario: User with a soft bundle offer in pending installation status sees an empty case massage
    Given user has a "convergente" account type
      And user has a "soft convergente" plan in "pending" status
      And user is in the "Explore" page
     Then the "empty_case_bundle_title" textfield with "Falta pouco!" text is displayed
      And the "empty_case_bundle_text" textfield with "Você vai ter acesso às novidades e promoções da Vivo assim que seu produto for instalado"
      And the "go_to_account" button with "Ir pro Meu Plano" is displayed

  @jira.QANOV-56660 @android @ios @jira.cv.13.3 @jira.link.depends_on.QANOV-56659 @jira.link.parent_test_plan.QANOV-56585
  @manual @mobile @regression @vivobr @old_app
  Scenario: User with a soft bundle offer in pending installation status can go to Meu Plano from the Explore page
    Given user has a "convergente" account type
      And user has a "soft convergente" plan in "pending" status
      And user is in the "Explore" page
     When clicks on the "go_to_account" button
     Then the "Account" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.IOS-6613
  @jira.link.parent_test_plan.QANOV-66641 @manual @mobile @regression @old_app
  Scenario Outline: A user without content in all categories will see the empty case message
    Given user has no content in the "all" categories
      And user is in the "Explore" page
     Then the "category_empty_case_title" textfield with "[LANG:explore.categories.category_empty_case_title]" text is displayed
      And the "category_empty_case_text" textfield with "[LANG:explore.categories.category_empty_case_text]" text is displayed
      And the "categories" carousel is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 12.2   | QANOV-67279  |
          | o2uk    | 12.2   | QANOV-67280  |
          | moves   | 12.2   | QANOV-67281  |
          | blaude  | 13.9   | QANOV-228267 |
          | o2de    | 14.2   | QANOV-228268 |
          | o2es    | Future | QANOV-417763 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: Explore content is refreshed when user kills the app
    Given user has new Explore content
     When terminates the app
      And launches the app
      And clicks on the "Explore" tab
     Then the new content is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 13.3   | QANOV-99386  |
          | o2uk    | 13.3   | QANOV-99387  |
          | moves   | 13.3   | QANOV-99388  |
          | blaude  | 13.9   | QANOV-228269 |
          | o2de    | 14.2   | QANOV-228270 |
          | o2es    | Future | QANOV-417764 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: Explore content is refreshed after a configured time when the users access to the Explore page
    Starting the app at the begining will bring all the Explore content and restart the counter time between queries.
    Configured time between queries is set to 4 minutes.
    Given terminates the app
      And launches the app
      And user is in the "<page>" page
      And user has new Explore content
     When waits "250" seconds
      And clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
     Then the new content is displayed

    Examples:
          | product | page      | cv     | jira_id      |
          | o2uk    | Account   | 13.4   | QANOV-223814 |
          | moves   | Dashboard | 13.4   | QANOV-223815 |
          | vivobr  | Account   | 13.4   | QANOV-223816 |
          | blaude  | Account   | 13.9   | QANOV-228271 |
          | o2de    | Account   | 14.2   | QANOV-223817 |
          | o2es    | Account   | Future | QANOV-417765 |

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: Explore content is not refreshed in <product> when the users access to the Explore page not waiting for the configured time
    Starting the app at the begining will bring all the Explore content and restart the counter time between queries.
    Configured time between queries is set to 4 minutes.
    Given terminates the app
      And launches the app
      And user is in the "Support" page
      And user has new Explore content
     When waits "120" seconds
      And clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
     Then the new content is not displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 13.4   | QANOV-223818 |
          | vivobr  | 13.4   | QANOV-223820 |
          | blaude  | 13.9   | QANOV-228272 |
          | o2de    | 14.2   | QANOV-223821 |
          | o2es    | Future | QANOV-417766 |

  @jira.QANOV-223819 @moves @android @automation.hard @ios @jira.cv.13.4 @manual @mobile @regression
  Scenario: Explore content is not refreshed in moves when the users access to the Explore page not waiting for the configured time
    Starting the app at the begining will bring all the Explore content and restart the counter time between queries.
    Configured time between queries is set to 4 minutes.
    Given terminates the app
      And launches the app
      And user is in the "Start" page
      And user has new Explore content
     When waits "120" seconds
      And clicks on the "navigation_tab_bar.explore_tab" tab
      And the "Explore" page is displayed
     Then the new content is not displayed

  @jira.<jira_id> @<product> @android @automation.hard @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: Explore content is not refreshed when user doesn't leave the Explore page
    Starting the app at the begining will bring all the Explore content and restart the counter time between queries.
    Configured time between queries is set to 4 minutes.
    Given terminates the app
      And launches the app
      And user is in the "Explore" page
      And user has new Explore content
     When waits "250" seconds
     Then the new content is not displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 13.4   | QANOV-223822 |
          | moves   | 13.4   | QANOV-223823 |
          | vivobr  | 13.4   | QANOV-223824 |
          | blaude  | 13.9   | QANOV-228273 |
          | o2de    | 14.2   | QANOV-223825 |
          | o2es    | Future | QANOV-417767 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @smoke
  Scenario Outline: Page is refreshed when user pulls down the Explore page
    Given user is in the "Explore" page
     When pulls down the page to refresh
      And waits until the "skeleton" element is not visible
      And the "error_loading_text" textfield is not displayed
     Then the "Explore" page is displayed
      And the "[LANG:explore.explore_name]" header is displayed

    Examples:
          | product | cv     | jira_id      |
          | vivobr  | 14.1   | QANOV-311173 |
          | o2uk    | 14.1   | QANOV-311174 |
          | moves   | 14.1   | QANOV-311175 |
          | blaude  | 14.1   | QANOV-311176 |
          | o2de    | 14.2   | QANOV-311177 |
          | o2es    | Future | QANOV-417768 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke
  Scenario Outline: Explore screen is refreshed when you click on the Explore tab being in Account
    Explore content is updated after 4 min in another tab
    Given user is in the "<page>" page
      And waits "240" seconds
     When clicks on the "navigation_tab_bar.explore_tab" tab
     Then the "Explore" page is autorefreshed
      And the "Explore" page is displayed

    @jira.cv.14.4
    Examples:
          | product | page      | jira_id      |
          | vivobr  | Account   | QANOV-363395 |
          | o2uk    | Account   | QANOV-363396 |
          | moves   | Dashboard | QANOV-360496 |
          | blaude  | Account   | QANOV-363397 |
          | o2de    | Account   | QANOV-363398 |

    @jira.cv.Future
    Examples:
          | product | page    | jira_id      |
          | o2es    | Account | QANOV-427900 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke
  Scenario Outline: Explore screen is refreshed when user has the app in background status
    Given user is in the "Explore" page
      And user has the app in "background" status
     When launches the app
     Then the "Explore" page is autorefreshed
      And the "Explore" page is displayed

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-363399 |
          | o2uk    | QANOV-363400 |
          | moves   | QANOV-360497 |
          | blaude  | QANOV-363401 |
          | o2de    | QANOV-363402 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-427901 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke
  Scenario Outline: Explore screen is autorefreshed
    Given user is in the "<page>" page
     When clicks on the "navigation_tab_bar.explore_tab" tab
     Then the "Explore" page is autorefreshed
      And the "Explore" page is displayed

    @jira.cv.14.4
    Examples:
          | product | page      | jira_id      |
          | vivobr  | Account   | QANOV-363395 |
          | o2uk    | Account   | QANOV-363396 |
          | moves   | Dashboard | QANOV-360496 |
          | blaude  | Account   | QANOV-363397 |
          | o2de    | Account   | QANOV-363398 |

    @jira.cv.Future
    Examples:
          | product | page    | jira_id      |
          | o2es    | Account | QANOV-427902 |

  @jira.<jira_id> @<product> @android @ios @jira.link.parent_test_plan.QANOV-360452 @manual @mobile @smoke
  Scenario Outline: Explore screen is autorefreshed when user has the app in background status
    Given user is in the "Explore" page
      And user has the app in "background" status
     When launches the app
     Then the "Explore" page is autorefreshed
      And the "Explore" page is displayed

    @jira.cv.14.4
    Examples:
          | product | jira_id      |
          | vivobr  | QANOV-363399 |
          | o2uk    | QANOV-363400 |
          | moves   | QANOV-360497 |
          | blaude  | QANOV-363401 |
          | o2de    | QANOV-363402 |

    @jira.cv.Future
    Examples:
          | product | jira_id      |
          | o2es    | QANOV-427903 |

  @jira.QANOV-517446 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-492945 @mobile @smoke @vivobr
  Scenario: User can access to the Explore page during a maintenance window
    Given there is a maintenance window
      And user is in the "Assinatura" page
     When clicks on the "navigation_tab_bar.explore_tab" button
     Then the "Explore" page is displayed
      And the "[LANG:explore.explore_name]" header is displayed
