# -*- coding: utf-8 -*-
@jira.QANOV-184131
Feature: OB webviews


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression @har
  Scenario Outline: As DA OB <product> team, I want to have two Query Params in OB entry points from Explore in order to identify origin
    Given user has a "featured content" module in the Explore content
      And user is in the "Explore" page
     When searches the card
      And clicks on the "featured_content_card" card
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=Explore_home" is sent in the OB URL

    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.1 | QANOV-184132 |
          | o2uk    | 13.1 | QANOV-184133 |
          | vivobr  | 13.1 | QANOV-184134 |
          | blaude  | 13.9 | QANOV-260018 |
          | o2de    | 14.2 | QANOV-260019 |

  @jira.QANOV-184135 @android @ios @jira.cv.13.1 @manual @mobile @moves @regression
  Scenario: As DA OB moves team, I want to have two Query Params in OB entry points from Explore Likes tokens in order to identify origin
    Given user is in the "Explore" page
     When clicks on the "categories_carousel_parent.loyalty_category" button
      And open the tokens card
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=Explore/loyalty" is sent in the OB URL

  @jira.QANOV-184136 @android @ios @jira.cv.13.1 @manual @mobile @moves @regression
  Scenario: As DA OB moves team, I want to have two Query Params in OB entry points from Explore Likes in order to identify origin
    Given user has a "informative" Movistar Likes card
     When opens the Movistar Likes card
      And the "Promotion Detail" page is displayed
      And clicks on the "legal_bases_link" link
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=loyalty-promo/detail/informative/.*" is sent in the OB URL

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.detects.<bug_id> @manual @mobile @regression
  Scenario Outline: As DA OB <product> team, I want to have two Query Params in OB entry points from Explore <category> in order to identify origin
    Given user has "<category>" category in Explore
      And user is in the "Explore" page
      And clicks on the "categories_carousel_parent.<category>_category" button
      And clicks on the "categories_carousel_parent.<category_id>_category" button with "<category>" text
     When opens a card with a OB deeplink
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=Explore_<category_id>" is sent in the OB URL

    Examples:
          | product | category_id         | category      | bug_id   | cv   | jira_id      |
          | moves   | bundle              | Fusión        |          | 13.1 | QANOV-184137 |
          | moves   | device              | Móviles       |          | 13.1 | QANOV-184138 |
          | moves   | tv                  | TV            |          | 13.1 | QANOV-184139 |
          | moves   | promotion           | Ofertas       |          | 13.1 | QANOV-184140 |
          | moves   | value_added_service | Servicios     |          | 13.1 | QANOV-184141 |
          | moves   | livingapps          | Living Apps   |          | 13.1 | QANOV-184142 |
          | o2uk    | promotion           | Promotions    |          | 13.1 | QANOV-184143 |
          | o2uk    | phones              | Phones        |          | 13.1 | QANOV-184144 |
          | o2uk    | tablets             | Tablets       |          | 13.1 | QANOV-184145 |
          | o2uk    | accessory           | Accessories   |          | 13.1 | QANOV-184146 |
          | o2uk    | techplans           | Tech Plans    |          | 13.1 | QANOV-184147 |
          | o2uk    | simplans            | Sim Plans     |          | 13.1 | QANOV-184148 |
          | o2uk    | value_added_service | O2 Extras     |          | 13.1 | QANOV-184149 |
          | o2uk    | news                | News          |          | 13.1 | QANOV-184150 |
          | vivobr  | loja-vivo           | Shopping      |          | 13.1 | QANOV-184151 |
          | vivobr  | services            | Apps          |          | 13.1 | QANOV-184152 |
          | vivobr  | vivo-play           | Vivo Play     |          | 13.1 | QANOV-184153 |
          | vivobr  | financas            | Finanças      |          | 13.1 | QANOV-184154 |
          | vivobr  | loyalty             | Vivo Valoriza | IOS-7296 | 13.1 | QANOV-184155 |
          | vivobr  | plan                | Planos Vivo   |          | 13.1 | QANOV-184156 |
          | vivobr  | mais                | Mais          |          | 13.1 | QANOV-184157 |
          | blaude  | TBD                 | TBD           |          | 13.9 | QANOV-260020 |
          | o2de    | priority            | Priority      |          | 14.2 | QANOV-260021 |

  @jira.QANOV-184158 @android @ios @jira.cv.13.1 @manual @mobile @moves @regression
  Scenario: As DA OB moves team, I want to have two Query Params in OB entry points from Account dashboard in order to identify origin
    Given user has a "postpay" account type
      And user is in the "Account" page
     When clicks on the "diagnostics_module.button" button
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=dashboard" is sent in the OB URL

  @jira.QANOV-184159 @android @ios @jira.cv.13.1 @manual @mobile @moves @regression
  Scenario: As DA OB moves team, I want to have two Query Params in OB entry points from Mobile Line Consumption in order to identify origin
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user is in the "Mobile Line Consumption" page
     When clicks on the "diagnostics_module.button" button
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=mobile" is sent in the OB URL

  @jira.QANOV-184160 @android @ios @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: As DA OB vivobr team, I want to have two Query Params in OB entry points from Account dashboard in order to identify origin
    Given user has a "beatrix" account type
      And user has a "monoplan" plan
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "plan_details.details_link" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=dashboard" is sent in the OB URL

  @jira.QANOV-184161 @android @ios @jira.cv.13.1 @manual @mobile @o2uk @regression
  Scenario: As DA OB o2uk team, I want to have two Query Params in OB entry points from Account dashboard in order to identify origin
    Given user has a "AO2 postpay" account type
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "quick_actions.upgrade" icon
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=dashboard" is sent in the OB URL

  @jira.QANOV-184162 @android @ios @jira.cv.13.1 @manual @mobile @o2uk @regression
  Scenario: As DA OB o2uk team, I want to have two Query Params in OB entry points from Account services in order to identify origin
    Given user is in the "Services" page
     When clicks on the "view_your_bolt_ons" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=services" is sent in the OB URL

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: As DA OB <product> team, I want to have two Query Params in OB entry points from Account dashboard in order to identify origin
    Given user has a "postpay" account type
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "Tariff Card" module configured in CMS for "Account" page
      And user is in the "Account" page
     When clicks on the "tariff_card.button_primary" link
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=Account_agreement-details" is sent in the OB URL

    Examples:
          | product | cv   | jira_id      |
          | blaude  | 13.9 | QANOV-260024 |
          | o2de    | 14.2 | QANOV-260025 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: As DA OB <product> team, I want to have two Query Params in OB entry points from Account services in order to identify origin
    Given user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Porting" entrypoint configured in CMS for the "subscription-contract-dashboard" list
      And user is in the "Services" page
     When clicks on the "services.<service>" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=services" is sent in the OB URL

    Examples:
          | product | cv   | service        | jira_id      |
          | blaude  | 13.9 | porting        | QANOV-260026 |
          | o2de    | 14.2 | sim-activation | QANOV-260027 |

  @jira.QANOV-184163 @android @ios @jira.cv.13.1 @manual @mobile @moves @regression
  Scenario: As DA OB moves team, I want to have two Query Params in OB entry points from Start tab - Appointment booking in order to identify origin
    Given user has a "telco" account type
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "appointment_booking.appointment_button" button
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=start-tab" is sent in the OB URL

  @jira.QANOV-184164 @android @ios @jira.cv.13.1 @manual @mobile @moves @regression
  Scenario: As DA OB moves team, I want to have two Query Params in OB entry points from Start tab - Order Traking in order to identify origin
    Given user has a "telco" account type
      And user has a "any_admin" role
      And user has ">0" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "title" field of "order_tracking.list" list with "0" index
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=start-tab" is sent in the OB URL

  @jira.QANOV-184165 @android @ios @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: As DA OB vivobr team, I want to have two Query Params in OB entry points from Start tab - Autodiagnostic in order to identify origin
    Given user has a "beatrix" account type
      And user has "1" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "autodiagnostic.button" button
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=start-tab" is sent in the OB URL

  @jira.QANOV-184166 @android @ios @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: As DA OB vivobr team, I want to have two Query Params in OB entry points from Start tab - Appointment booking in order to identify origin
    Given user has a "beatrix" account type
      And user has "1" plans
      And user has a "any" plan in "active" status
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "appointment_booking.appointment_button" button
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=start-tab" is sent in the OB URL

  @jira.QANOV-260028 @android @blaude @ios @jira.cv.Future @manual @mobile @regression
  Scenario: As DA OB blaude team, I want to have two Query Params in OB entry points from Start tab - Order Traking in order to identify origin
    Given user has ">0" orders on track
      And user is in the "Start" page
      And waits until the "skeleton" element is not visible
     When clicks on the "title" field of "order_tracking.list" list with "0" index
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=start-tab" is sent in the OB URL

  @jira.QANOV-184168 @android @ios @jira.cv.13.1 @manual @mobile @o2uk @regression
  Scenario: As DA OB o2uk team, I want to have two Query Params in OB entry points from Support in order to identify origin
    Given user has a "postpay" account type
      And user is in the "Support" page
     When clicks on the "how_to_pay" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=SupportArea" is sent in the OB URL

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: As DA OB <product> team, I want to have two Query Params in OB entry points from Support in order to identify origin
    Given user has the "Entrypoint list" module configured in CMS for "Support" page
      And user has the "Click To Call Choose Language" module configured in CMS for "Click To Call Choose Language" page
      And user is in the "Support" page
     When clicks on the "contact.<link>" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=support" is sent in the OB URL

    Examples:
          | product | cv   | link          | jira_id      |
          | blaude  | 13.9 | click_to_call | QANOV-260029 |
          | o2de    | 14.2 | faqs          | QANOV-260030 |

  @jira.QANOV-184169 @android @ios @jira.cv.13.1 @manual @mobile @moves @regression
  Scenario: As DA OB moves team, I want to have two Query Params in OB entry points from Settings in order to identify origin
    Given user has a "telco" account type
      And user is in the "Profile" page
     When clicks on the "personal_data_entrypoint" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=Settings" is sent in the OB URL

  @jira.QANOV-184170 @android @ios @jira.cv.13.1 @manual @mobile @moves @regression
  Scenario: As DA OB moves team, I want to have two Query Params in OB entry points from Security & Privacy in order to identify origin
    Given user has a "telco" account type
      And user is in the "Security And Privacy" page
     When clicks on the "terms_and_conditions_entrypoint" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=SecurityPrivacy" is sent in the OB URL

  @jira.QANOV-184171 @android @ios @jira.cv.13.1 @manual @mobile @o2uk @regression
  Scenario: As DA OB o2uk team, I want to have two Query Params in OB entry points from Security & Privacy in order to identify origin
    Given user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
      And user is in the "Security And Privacy" page
     When clicks on the "terms_and_conditions_entrypoint" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=SecurityPrivacy" is sent in the OB URL

  @jira.QANOV-260031 @android @blaude @ios @jira.cv.13.9 @manual @mobile @regression
  Scenario: As DA OB blaude team, I want to have two Query Params in OB entry points from Security & Privacy in order to identify origin
    Given user has the "Security And Privacy" module configured in CMS for "Security And Privacy" page
      And user is in the "Security And Privacy" page
     When clicks on the "terms_of_use_entrypoint" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=SecurityPrivacy" is sent in the OB URL

  @jira.QANOV-260032 @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario: As DA OB o2de team, I want to have two Query Params in OB entry points from Profile in order to identify origin
    Given user is in the "Profile" page
     When clicks on the "data_protection_entrypoint" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=profile" is sent in the OB URL

  @jira.QANOV-184172 @android @ios @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: As DA OB vivobr team, I want to have two Query Params in OB entry points from Settings in order to identify origin
    Given user has a "beatrix" account type
      And user has a "any" plan in "active" status
      And user is in the "Profile" page
     When clicks on the "personal_information_entrypoint" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=Settings" is sent in the OB URL

  @jira.QANOV-184173 @android @ios @jira.cv.13.1 @manual @mobile @regression @vivobr
  Scenario: As DA OB vivobr team, I want to have two Query Params in OB entry points from Security & Privacy in order to identify origin
    Given user has a "beatrix" account type
      And user is in the "Security And Privacy" page
     When clicks on the "terms_and_conditions_entrypoint" entrypoint
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=SecurityPrivacy" is sent in the OB URL

  @jira.QANOV-184174 @android @ios @jira.cv.13.1 @jira.link.detects.ANDROID-10410 @manual @mobile @regression @vivobr
  Scenario: As DA OB vivobr team, I want to have two Query Params in OB entry points from Valoriza in order to identify origin
    Given user has a "beatrix" account type
      And user is in the "Account" page
     When clicks on the "navigation_tab_bar.valoriza_tab" button
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=valoriza-tab" is sent in the OB URL

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: As DA OB <product> team, I want to have two Query Params in OB entry points from Notification Inbox in order to identify origin
    Given user is in the "Notification Inbox" page
      And user has received notifications with OB entry points
     When clicks on the "1" element in the "inbox_list" list
     Then the query param "platform_nv=NovumApp" is sent in the OB URL
      And the query param "origin_nv=Inbox" is sent in the OB URL

    Examples:
          | product | cv   | jira_id      |
          | moves   | 13.1 | QANOV-184175 |
          | o2uk    | 13.1 | QANOV-184176 |
          | vivobr  | 13.1 | QANOV-184177 |
          | blaude  | 13.9 | QANOV-260033 |
          | o2de    | 14.2 | QANOV-260034 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @manual @mobile @regression
  Scenario Outline: Usercentrics webview popup to manage cookies is displayed when the user opens an OB webview just installed the app in <product>
    The popup can appear on external or internal OB webviews
    Given user just installed the application
      And user is logged in
     When opens an OB webview
     Then the external webview is displayed
      And the "Cookies Webview Permissions" popup is displayed
      And the "title" textfield is displayed
      And the "description" textfield is displayed
      And the "accept_all" button is displayed
      And the "reject_all" button is displayed

    Examples:
          | product | jira_id      |
          | blaude  | QANOV-545673 |
          | o2de    | QANOV-545674 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.24.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: User who accepts the Usercentrics webview popup won't see it again in <product>
    The popup can appear on external or internal OB webviews. For internal OB webviews, reload button is not available,
      But can be reproduced navigation through the webview.
    Given user just installed the application
      And user is logged in
     When opens an OB webview
      And the external webview is displayed
      And the "Cookies Webview Permissions" popup is displayed
      And clicks on the "accept_all" button
      And the "Cookies Webview Permissions" popup is not displayed
      And clicks on the "navigation_top_bar.reload_button" button
     Then the "Cookies Webview Permissions" popup is not displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-545673 | QANOV-545675 |
          | o2de    | QANOV-545674 | QANOV-545677 |
