# -*- coding: utf-8 -*-
@jira.QANOV-8108
Feature: Native Deeplinks

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page

  @jira.<jira_id> @<ber> @android @ios @jira.cv.<cv> @jira.link.relates_to.<relates_to> @mobile @har
  Scenario Outline: A user can open the "<deeplink_name>" deeplink
    Given user has a "<account_type>" account type
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    @automatic @cert2 @live @moves @next @sanity
    Examples:
          | cv   | relates_to | ber | account_type | deeplink_name   | page_name | jira_id      |
          | 10.6 | NOV-74360  |     | any          | Native.Account  | Dashboard | QANOV-8260   |
          | 13.8 |            |     | any          | Native.Invoices | Invoices  | QANOV-266823 |

    @automatic @cert2 @live @moves @next @smoke
    Examples:
          | cv   | relates_to | ber | account_type | deeplink_name   | page_name | jira_id      |
          | 10.6 | NOV-74358  |     | any          | Native.Explore  | Explore   | QANOV-8265   |
          | 10.2 | NOV-94404  |     | any          | Native.Settings | Profile   | QANOV-8277   |
          | 11.3 |            |     | telco        | Native.Start    | Start     | QANOV-273793 |

    @automatic @cert0 @cert1 @live @next @o2uk @sanity
    Examples:
          | cv   | relates_to | ber | account_type | deeplink_name   | page_name | jira_id    |
          | 10.2 | NOV-94412  |     | postpay      | Native.Aura     | Aura      | QANOV-8248 |
          | 10.6 | NOV-74360  |     | any          | Native.Account  | Account   | QANOV-8264 |
          | 10.6 | NOV-74358  |     | any          | Native.Explore  | Explore   | QANOV-8269 |
          | 10.2 | NOV-94404  |     | any          | Native.Settings | Profile   | QANOV-8291 |

    @automatic @cert0 @cert1 @jira.link.parent_test_plan.QANOV-254776 @live @next @o2uk
    @smoke
    Examples:
          | cv   | relates_to | ber | account_type | deeplink_name               | page_name    | jira_id    |
          | 10.2 | NOV-94410  |     | postpay      | Native.Support Conversation | Support Chat | QANOV-8257 |

    @automatic @live @next @qa @sanity @vivobr @old_app
    Examples:
          | cv   | relates_to | ber | account_type | deeplink_name   | page_name | jira_id      |
          | 10.6 | NOV-74360  |     | any          | Native.Account  | Account   | QANOV-8262   |
          | 10.6 | NOV-74358  |     | any          | Native.Explore  | Explore   | QANOV-8267   |
          | 10.2 | NOV-94404  |     | any          | Native.Settings | Profile   | QANOV-8283   |
          | 13.9 | NOV-138763 | ber | any          | Native.Tab mais | Tab Mais  | QANOV-287492 |

    @manual @sanity @vivobr @old_app
    Examples:
          | cv   | relates_to | ber | account_type | deeplink_name  | page_name | jira_id    |
          | 11.3 | NOV-138763 |     | any          | Native.Support | Tab Mais  | QANOV-8250 |

    @live @manual @next @qa @smoke @vivobr @old_app
    Examples:
          | cv   | relates_to | ber | account_type | deeplink_name | page_name | jira_id    |
          | 10.2 | NOV-80730  |     | any          | Native.Aura   | Aura      | QANOV-8247 |

    @automatic @blaude @cert3 @live @next @sanity
    Examples:
          | cv   | relates to | ber | account_type | deeplink_name  | page_name | jira_id      |
          | 13.9 |            | ber | any          | Native.Account | Account   | QANOV-269670 |

    @blaude @manual @sanity
    Examples:
          | cv   | relates to | ber | account_type | deeplink_name   | page_name | jira_id      |
          | 14.0 |            |     | any          | Native.Start    | Start     | QANOV-269669 |
          | 13.9 |            |     | any          | Native.Explore  | Explore   | QANOV-269671 |
          | 13.9 |            |     | any          | Native.Support  | Support   | QANOV-269672 |
          | 13.9 |            |     | any          | Native.Settings | Settings  | QANOV-269673 |

    @automatic @live @next @o2de @sanity
    Examples:
          | cv   | relates to | ber | account_type | deeplink_name  | page_name | jira_id      |
          | 14.6 |            |     | any          | Native.Account | Account   | QANOV-269697 |

    @jira.link.parent_test_plan.QANOV-437471 @manual @o2de @sanity
    Examples:
          | cv   | relates to | ber | account_type | deeplink_name   | page_name | jira_id      |
          | 14.6 |            |     | any          | Native.Start    | Start     | QANOV-269696 |
          | 14.6 |            |     | any          | Native.Explore  | Explore   | QANOV-269698 |
          | 14.6 |            |     | any          | Native.Support  | Support   | QANOV-269699 |
          | 14.6 |            |     | any          | Native.Settings | Settings  | QANOV-269700 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile @sanity
  @vivobr
  Scenario Outline: A user can open the "<deeplink_name>" deeplink
    Given opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | ber | deeplink_name   | page_name   | jira_id      |
          |     | Native.Account  | Assinaturas | QANOV-406577 |
          |     | Native.Explore  | Loja        | QANOV-406578 |
          |     | Native.Settings | Profile     | QANOV-406579 |
          | ber | Native.Tab mais | Menu Mais   | QANOV-406580 |
          |     | Native.Support  | Menu Mais   | QANOV-406581 |
          | ber | Native.Aura     | Aura        | QANOV-406582 |

  @jira.QANOV-8296 @android @ios @jira.cv.11.3 @jira.link.relates_to.NOV-150637 @live @manual @mobile @next @regression
  @vivobr @old_app
  Scenario: A VIVO user can navigate through the Tab mais after opening it from a deeplink
    Given user opens the "Native.Support" deeplink with the app in "killed" status
      And the "Tab Mais" page is displayed
     When clicks on the "quick_access_carousel.technical_support" entrypoint
     Then the "Plan Disambiguation" page is displayed

  @jira.QANOV-406583 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094
  @jira.link.relates_to.NOV-150637 @live @manual @mobile @next @regression @vivobr
  Scenario: A VIVO user can navigate through the Menu mais after opening it from a deeplink
    Given user opens the "Native.Support" deeplink with the app in "killed" status
      And the "Menu Mais" page is displayed
     When clicks on the "TBD" entrypoint
     Then the "Plan Disambiguation" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user can navigate through the support tab after opening it from a deeplink
    Given user opens the "Native.Support" deeplink with the app in "killed" status
      And the "Support" page is displayed
     When clicks on the "last" element in the "faqs_module.list" list
     Then the "All FAQs" page is displayed
      And the "FAQs" header is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-273794 |
          | o2de    | 14.6 | QANOV-273795 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-150635 @mobile @regression @har
  Scenario Outline: User can navigate through profile after opening it from a deeplink
    Given user opens the "Native.Settings" deeplink with the app in "killed" status
      And the "Profile" page is displayed
     When clicks on the "security_and_privacy_entrypoint" entrypoint
     Then the "Security And Privacy" page is displayed

    @automatic @cert0 @cert1 @cert2 @live @next
    Examples:
          | product | cv   | jira_id      |
          | vivobr  | 11.4 | QANOV-8302   |
          | moves   | 11.4 | QANOV-8303   |
          | o2uk    | 11.4 | QANOV-8307   |
          | blaude  | 13.9 | QANOV-273796 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.6 | QANOV-273797 |

  @jira.<jira_id> @android @ios @jira.cv.<cv> @jira.link.relates_to.<relates_to> @manual @mobile @moves @regression
  Scenario Outline: A user can see the no products available empty case when trying to open a deeplink not available for him/her
    internal_checkpoint="links with the /link/ path go through a disambiguation process and show an specific empty page
    different to the regular 'Not available' deeplinks empty page"
    Given user has a "<account_type>" account type
     When opens the "<deeplink_name>" deeplink with the app in "killed" status
     Then the "No Products Available" page is displayed
      And the "no_products_available_message" textfield with "No tienes disponible ningún producto para este proceso" text is displayed

    Examples:
          | relates_to | cv   | account_type | deeplink_name    | jira_id    |
          | NOV-186373 | 11.7 | prepay       | Account.Facturas | QANOV-8319 |

    @automation.pending_env
    Examples:
          | relates_to | cv   | account_type | deeplink_name           | jira_id    |
          | NOV-163908 | 11.6 | telco-in     | Account.TV Management   | QANOV-8321 |
          | NOV-163908 | 11.6 | telco-in     | Account.Data Management | QANOV-8322 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.relates_to.NOV-150333 @mobile @netcracker @regression
  Scenario Outline: A <product> user can navigate through the Account after opening it from a deeplink
    Given user opens the "Native.Account" deeplink with the app in "killed" status
      And the "Account" page is displayed
      And waits until the "<link>" element is visible
     When clicks on the "<link>" link
     Then the "<page>" page is displayed
      And the "<header>" header is displayed

    @automatic @cert0 @cert1 @live @next @<label>
    Examples:
          | product | cv   | link                         | header              | page     | detects   | jira_id      | label   |
          | vivobr  | 11.4 | bills.link                   | Minhas faturas      | Bills    |           | QANOV-8331   | old_app |
          | o2uk    | 11.4 | highlighted_services.see_all | Manage your account | Services |           | QANOV-8333   |         |
          | blaude  | 13.9 | highlighted_services.see_all | Dienstleistungen    | Services | O2DE-3095 | QANOV-273798 |         |

    @manual
    Examples:
          | product | cv   | link                      | header           | page     | detects | jira_id      | label |
          | o2de    | 14.6 | highlighted_services.link | Dienstleistungen | Services |         | QANOV-273799 |       |

  @jira.QANOV-406585 @TBD @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @regression @vivobr
  Scenario: A vivobr user can navigate through the Assinatura after opening it from a deeplink
    Given user opens the "Native.Account" deeplink with the app in "killed" status
      And the "Assinatura" page is displayed
     When clicks on the "TBD" link
     Then the "TBD" page is displayed

  @jira.QANOV-8329 @android @automatic @cert2 @ios @jira.cv.11.4 @jira.link.detects.IOS-6928
  @jira.link.detects.IOS-8966 @jira.link.relates_to.NOV-150333 @live @mobile @moves @next @regression
  Scenario: A moves user can navigate through the Dashboard after opening it from a deeplink
    Given user opens the "Native.Account" deeplink with the app in "killed" status
      And the "Dashboard" page is displayed
     When clicks on the "my_orders" entrypoint
     Then the internal webview is displayed
      And the "Mis pedidos" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.<jira_id> @<product> @android @automatic @ios @jira.cv.<cv> @jira.link.detects.IOS-8966
  @jira.link.relates_to.NOV-150628 @mobile @regression @har
  Scenario Outline: A user can navigate through the Explore tab after opening it from a deeplink
    Given user has a "featured content" module in the Explore content
      And user opens the "Native.Explore" deeplink with the app in "killed" status
      And the "Explore" page is displayed
     When searches the "card"
     Then the selected explore "card" has the "title" field with "[CONTEXT:card_title]" text
      And the selected explore "card" has the "description" field with "[CONTEXT:card_description]" text
      And the selected explore card has the "image_or_bumper" media field displayed

    @cert0 @cert1 @cert2 @live @next @qa
    Examples:
          | product | cv   | jira_id      |
          | moves   | 11.3 | QANOV-8335   |
          | vivobr  | 11.3 | QANOV-8337   |
          | o2uk    | 11.3 | QANOV-8339   |
          | blaude  | 13.9 | QANOV-273800 |

    @live @next
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.6 | QANOV-273801 |

  @jira.QANOV-406586 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @manual @mobile
  @regression @vivobr
  Scenario: A user can navigate through the Loja tab after opening it from a deeplink
    Given user has a "featured content" module in the Explore content
      And user opens the "Native.Explore" deeplink with the app in "killed" status
      And the "Loja" page is displayed
     When searches the "card"
      And opens the card
     Then the Loja card is opened

  @jira.QANOV-8344 @android @automatic @cert0 @cert1 @ios @jira.cv.11.0 @jira.link.detects.ANDROID-10517
  @jira.link.relates_to.NOV-101087 @live @mobile @next @o2uk @regression
  Scenario: MultiMSISDN user with postpay lines can open the "Aura Discoverability" deeplink
    Given user has "several" mobile lines
      And user has a "postpay" account type
     When opens the "Native.Discoverability in Aura" deeplink with the app in "killed" status
     Then the "Aura" page is displayed
      And the "alfred_generic_response" textfield that contains the "Some FAQs I can help you with" text is displayed
      And the "alfred_text_suggestion" list is displayed

  @jira.QANOV-8346 @android @automatic @cert0 @cert1 @ios @jira.cv.11.0 @jira.link.detects.ANDROID-10517
  @jira.link.relates_to.NOV-101087 @live @mobile @next @o2uk @regression
  Scenario: SingleMSISDN postpay user can open the "Aura Discoverability" deeplink
    Given user has "1" mobile lines
      And user has a "postpay" account type
     When opens the "Native.Discoverability in Aura" deeplink with the app in "killed" status
     Then the "Aura" page is displayed
      And the "alfred_main_topic_button" list is displayed
      And the "0" index in the "alfred_main_topic_button" list with "[LANG:aura.menu_first_level.billing]" text is displayed
      And the "1" index in the "alfred_main_topic_button" list with "[LANG:aura.menu_first_level.services]" text is displayed
      And the "2" index in the "alfred_main_topic_button" list with "[LANG:aura.menu_first_level.data_consumption]" text is displayed

  @jira.<jira_id> @<product> @android @automatic @cert0 @cert1 @cert2 @ios @jira.cv.11.3 @har
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-148236 @live @mobile @next @regression
  Scenario Outline: User can open a native Youtube deeplink
    internal_checkpoint="
    NOTE: Youtube video ID example:
    URL: https://www.youtube.com/watch?v=fjMu0EZ448k
    YOUTUBE_VIDEO_ID = fjMu0EZ448k"
     When opens the "Native.Youtube" deeplink with the app in "killed" status
     Then the "Youtube Player" page is displayed

    Examples:
          | product | parent_test_plan | jira_id    |
          | moves   |                  | QANOV-8348 |
          | vivobr  | QANOV-402094     | QANOV-8349 |
          | o2uk    |                  | QANOV-8350 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan>
  @jira.link.relates_to.NOV-38405 @mobile @regression
  Scenario Outline: User logged out from the app taps on a deeplink: the user will be redirected to the Splash screen in the app
    Given user is logged out
     When opens the "any" deeplink with the app in "killed" status
     Then the "Splash Screen" page is displayed

    @automatic @cert0 @cert1 @cert2 @live @next
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | moves   | 10.2 |                  | QANOV-8354   |
          | vivobr  | 10.2 | QANOV-402094     | QANOV-8355   |
          | o2uk    | 10.2 |                  | QANOV-8356   |
          | blaude  | 13.9 |                  | QANOV-273802 |

    @manual
    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | o2de    | 14.6 |                  | QANOV-273803 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.IOS-6823 @jira.link.relates_to.NOV-53639
  @mobile @regression
  Scenario Outline: A <product> user who comes from a deeplink logs in the app: the user will be redirected to the screen that the deeplink refers to
    Given user is logged out
     When opens the "Native.Explore" deeplink with the app in "killed" status
      And the "Splash Screen" page is displayed
      And logs in the application
     Then the "Explore" page is displayed

    @automatic @cert0 @cert1 @cert2 @live @next
    Examples:
          | product | cv   | jira_id      |
          | moves   | 10.2 | QANOV-8357   |
          | o2uk    | 10.2 | QANOV-8362   |
          | blaude  | 13.9 | QANOV-273804 |

    @manual
    Examples:
          | product | cv   | jira_id      |
          | o2de    | 14.6 | QANOV-273805 |

  @jira.QANOV-8361 @android @automatic @ios @jira.cv.10.2 @jira.link.relates_to.NOV-53639 @live @mobile @next @regression
  @vivobr @old_app @har
  Scenario: A vivobr user who comes from a deeplink logs in the app: the user will be redirected to the screen that the deeplink refers to
    Given user is logged out
     When opens the "Native.Support" deeplink with the app in "killed" status
      And the "Splash Screen" page is displayed
      And logs in the application
     Then the "Tab Mais" page is displayed

  @jira.QANOV-406587 @android @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-402094 @live @manual @mobile @next
  @regression @vivobr @har
  Scenario: A vivobr user who comes from a deeplink logs in the app: the user will be redirected to the screen that the deeplink refers to
    Given user is logged out
     When opens the "Native.Support" deeplink with the app in "killed" status
      And the "Splash Screen" page is displayed
      And logs in the application
     Then the "Menu Mais" page is displayed

  @jira.QANOV-127531 @android @automatic @cert2 @ios @jira.cv.12.5 @live @mobile @moves @next @sanity
  Scenario: MOVES user can access to the Terms & Conditions deeplink
    other_affected_versions="2020-33-B"
     When opens the "Native.Terms & Conditions" deeplink with the app in "killed" status
     Then the internal webview with "Términos y condiciones" header is displayed
      And the "Condiciones particulares" string in internal webview is displayed

  @jira.QANOV-127532 @android @automatic @cert2 @ios @jira.cv.12.5 @live @mobile @moves @next @regression
  Scenario: MOVES user can access to the Installation Details deeplink
    other_affected_versions="2021-33-B"
     When opens the "Native.Installation Details" deeplink with the app in "killed" status
     Then the internal webview with "Instalación de Fibra Óptica" header is displayed
      And the "Durante la instalación" string is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression @har
  Scenario Outline: A user with only one product can open the "Support.All Contact Channels" deeplink
    Given user has "1" products
     When opens the "Support.All Contact Channels" deeplink with the app in "killed" status
     Then the "Contact Reasons" page is displayed

    Examples:
          | product | cv   | parent_test_plan | jira_id      |
          | blaude  | 14.0 |                  | QANOV-269689 |
          | o2de    | 14.6 | QANOV-437471     | QANOV-269716 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user with several products can open the "Support.All Contact Channels" deeplink
    Given user has "several" products
     When opens the "Support.All Contact Channels" deeplink with the app in "killed" status
      And the "Choose Product" page is displayed
      And clicks on any element in the "products_list" list
     Then the "Contact Reasons" page is displayed

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 14.0 | QANOV-269690 |
          | o2de    | 14.6 | QANOV-269717 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile
  @regression @<har>
  Scenario Outline: A user with <num_appointments> appointment/s can open the "Support.Call Me Back" deeplink
    Given user has "<num_appointments>" pending appointments
     When opens the "Support.Call Me Back" deeplink with the app in "killed" status
     Then the "<page_name>" page is displayed

    Examples:
          | product | cv   | num_appointments | page_name                    | har | parent_test_plan | jira_id      |
          | blaude  | 14.0 | 0                | Call Me Back Info            | har |                  | QANOV-269691 |
          | blaude  | 14.0 | 1                | Call Me Back Scheduled Calls |     |                  | QANOV-269692 |
          | o2de    | 14.6 | 0                | Call Me Back Info            | har | QANOV-437471     | QANOV-269718 |
          | o2de    | 14.6 | 1                | Call Me Back Scheduled Calls |     | QANOV-437471     | QANOV-269719 |

  @jira.QANOV-532959 @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A user can open the "Support.Store Locator" deeplink
     When opens the "Support.Store Locator" deeplink with the app in "killed" status
     Then the external webview is displayed
      And the "o2 Shop suchen: Alle Filialen in der Nähe | o2" header is displayed

  @jira.QANOV-532960 @TBD @android @ios @jira.cv.24.0 @manual @mobile @o2de @regression
  Scenario: A user can open the "Support.Priority" deeplink
     When opens the "Support.Priority" deeplink with the app in "killed" status
     Then the external webview is displayed
      And the "TBD" header is displayed

  @jira.QANOV-558722 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression @har
  Scenario: A BOX7 user can open the "Support.Hotline" deeplink
    Given user has a "box7" account type
      And user has "1" products
     When opens the "Support.Hotline" deeplink with the app in "killed" status
     Then the "Click To Call Choose Topic" page is displayed

  @jira.QANOV-558723 @android @blaude @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario: A RAITT user can open the "Support.Hotline" deeplink
    Given user has a "raitt" account type
      And user has "1" products
     When opens the "Support.Hotline" deeplink with the app in "killed" status
     Then the "dialer" app is displayed

  @jira.QANOV-558724 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression @har
  Scenario: Any user can open the "Support.Hotline" deeplink
    Given user has a "any" account type
      And user has "1" products
     When opens the "Support.Hotline" deeplink with the app in "killed" status
     Then the "Click To Call Choose Language" page is displayed

  @jira.QANOV-558725 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: Any user can open the "Support.Hotline Turkish" deeplink
    Given user has a "any" account type
      And user has "1" products
     When opens the "Support.Hotline Turkish" deeplink with the app in "killed" status
     Then the "Click To Call Choose Language" page is displayed

  @jira.QANOV-558726 @android @ios @jira.cv.24.1 @manual @mobile @o2de @regression
  Scenario: Any user can open the "Support.Hotline English" deeplink
    Given user has a "any" account type
      And user has "1" products
     When opens the "Support.Hotline English" deeplink with the app in "killed" status
     Then the "Call Hotline" page is displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.1 @manual @mobile @regression
  Scenario Outline: Any user can open the "Support.<deeplink>" deeplink
    Given user has a "any" account type
      And user has all products in "active" status
      And user has "1" products
     When opens the "Support.<deeplink>" deeplink with the app in "killed" status
     Then the "Spatial Buzz" page is displayed
      And the "header" textfield with "<page_name>" text is displayed

    Examples:
          | product | deeplink             | page_name   | jira_id      |
          | blaude  | Speed-Check          | Speed-Check | QANOV-558728 |
          | blaude  | Network Coverage Map | Netzkarte   | QANOV-558729 |
          | o2de    | Speed-Check          | Speed-Check | QANOV-558730 |
          | o2de    | Network Coverage Map | Netzkarte   | QANOV-558732 |
