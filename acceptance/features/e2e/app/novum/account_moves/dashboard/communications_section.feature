# -*- coding: utf-8 -*-
@jira.QANOV-323139
Feature: Communications section

  Actions Before each Scenario:
    Given user is in the "Dashboard" page


  @jira.<jira_id> @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  Scenario Outline: User can see the communications module in the main dashboard page
    Given user is in the "Dashboard" page
      And user has "<num_products>" products of "internet;landline;mobile_line;activatable_mobile_line" type
     Then the "communications_section" module is displayed
      And the "communications_section.title" textfield is displayed
      And the "communications_section.products_list" list has "<num_rows>" entries
      And the "communications_section.link" link with the "<link_text>" format is displayed

    @smoke @automatic @qa @webapp
    Examples:
          | num_products | num_rows | link_text       | jira_id      |
          | 2            | 2        | Más información | QANOV-323140 |
          | 3            | 3        | Más información | QANOV-323141 |

    @ber @sanity @automatic @qa @live @cert2 @next @webapp
    Examples:
          | num_products | num_rows | link_text           | jira_id      |
          | >3           | 3        | Ver todos \(\d+\)   | QANOV-323142 |

  @jira.QANOV-323143 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see the communications module title for a plan with only internet and landline
    Given user has a "landline" product
      And user has a "internet" product
      And user has "0" products of "mobile_line" type
     Then the "communications_section" module is displayed
      And the "communications_section.title" textfield with "Internet y fijo" text is displayed

  @jira.QANOV-323144 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see the communications module title for a plan with internet, landline and mobile line
    Given user has a "landline" product
      And user has a "internet" product
      And user has a "mobile_line" product
     Then the "communications_section" module is displayed
      And the "communications_section.title" textfield with "Internet, fijo y móvil" text is displayed

  @jira.QANOV-323145 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @sanity @qa @live @cert2 @next @automatic @webapp
  Scenario: User can access the Communications Dashboard page
    Given user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
     When clicks on the "communications_section.link" link
     Then the "Communications Dashboard" page is displayed
      And the "Comunicaciones" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-323146 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see an internet product in the communications module
    The subtitle text comes from API
    Given user has a "internet" product
      And waits until the "communications_section.internet_row" element is present
     Then the "communications_section.internet_row" entrypoint is displayed
      And the "communications_section.internet_row.icon" icon is displayed
      And the "communications_section.internet_row.title" textfield with "Internet" text is displayed
      And the "communications_section.internet_row.subtitle" textfield is displayed
      And the "communications_section.internet_row.chevron" icon is displayed

  @jira.QANOV-323147 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see an active mobile line in the communications module
    The subtitle text comes from API
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "activated" status
      And user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
      And waits until the "communications_section.activated_mobile_row" element is present
     Then the "communications_section.activated_mobile_row" entrypoint is displayed
      And the "communications_section.activated_mobile_row.icon" icon is displayed
      And the "communications_section.activated_mobile_row.title" textfield with the "\d{3} \d{2} \d{2} \d{2}" format is displayed
      And the "communications_section.activated_mobile_row.subtitle" textfield is displayed
      And the "communications_section.activated_mobile_row.chevron" icon is displayed

  @jira.QANOV-323148 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @jira.link.parent_test_plan.QANOV-385896 @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see a pending to activate mobile line in the communications module
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "deactivated" status
      And user has "<2" mobile lines in "activated" status
      And user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
      And waits until the "communications_section.deactivated_mobile_row" element is present
     Then the "communications_section.deactivated_mobile_row" entrypoint is displayed
      And the "communications_section.deactivated_mobile_row.icon" icon is displayed
      And the "communications_section.deactivated_mobile_row.label" textfield with "Pendiente de activar" text is displayed
      And the "communications_section.deactivated_mobile_row.subtitle" textfield is displayed
      And the "communications_section.deactivated_mobile_row.chevron" icon is displayed

  @jira.QANOV-323149 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see a landline product in the communications module
    The subtitle text comes from API
    Given user has a "landline" product
      And user has "<3" products of "internet;mobile_line" type
      And user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
     Then the "communications_section.landline_row" entrypoint is displayed
      And the "communications_section.landline_row.icon" icon is displayed
      And the "communications_section.landline_row.title" textfield with the "9\d{2} \d{2} \d{2} \d{2}" format is displayed
      And the "communications_section.landline_row.subtitle" textfield is displayed
      And the "communications_section.landline_row.chevron" icon is displayed

  @jira.QANOV-323150 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User with an internet product can access the internet dashboard from the communications module in the dashboard page
    Given user has a "internet" product
     When clicks on the "communications_section.internet_row" entrypoint
     Then the "Internet Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-323151 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User with an activated mobile line can access the mobile dashboard from the communications module in the dashboard page
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "activated" status
      And user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
      And waits until the "communications_section.activated_mobile_row" element is present
     When clicks on the "communications_section.activated_mobile_row" entrypoint
     Then the "Mobile Line Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-323152 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-385896 @manual @mobile @moves @smoke @tbd
  Scenario: User with a pending to activate mobile line can access the activate mobile line OB webview from the communications module in the dashboard page
    TBD the ob webview to activate line
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "deactivated" status
      And user has "<2" mobile lines in "activated" status
      And user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
     When clicks on the "communications_section.deactivated_mobile_row" entrypoint
     Then the internal webview with "Línea móvil" header is displayed
      And the "Activar línea" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Dashboard" page is displayed

  @jira.QANOV-323153 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User with a landline product can access the landline dashboard from the communications module in the dashboard page
    Given user has a "landline" product
      And user has "<3" products of "internet;mobile_line" type
      And user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
     When clicks on the "communications_section.landline_row" entrypoint
     Then the "Landline Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-323154 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: Monoplan user with internet and landline products can see them in the correct order in the communications module
    Given user has "1" plans
      And user has a "internet" product
      And user has a "landline" product
      And user has "0" products of "mobile_line" type
     Then the "landline_row" row is under the "internet_row" row

  @jira.QANOV-323155 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: Monoplan user with internet and mobile line products can see them in the correct order in the communications module
    Given user has "1" plans
      And user has a "internet" product
      And user has ">0" products of "mobile_line" type
     Then the "activated_mobile_row" row is under the "internet_row" row

  @jira.QANOV-323156 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: Monoplan user with mobile line and landline products can see them in the correct order in the communications module
    Given user has "1" plans
      And user has "<4" products of "mobile_line;landline;internet" type
      And user has a "landline" product
      And user has a "mobile_line" product
     Then the "landline_row" row is under the "mobile_row" row

  @jira.QANOV-323157 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-385896 @manual @mobile @moves @regression
  Scenario: Monoplan user with active mobile line and pending to activate mobile lines can see them in the correct order in the communications module
    Given user has "1" plans
      And user has ">0" mobile lines in "deactivated" status
      And user has "1" mobile lines in "activated" status
     Then the "deactivated_mobile_row" row is under the "activated_mobile_row" row

  @jira.QANOV-323158 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @sanity @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see the products module in the Communications dashboard page
    Given user has ">1" products of "internet;landline;mobile_line" type
      And user is in the "Communications Dashboard" page
     Then the "products_section" module is displayed
      And the "products_section.title" textfield that contains the "PRODUCTOS EN CONFIGURACIÓN" text is displayed
      And the "products_section.products_list" list has ">1" entries

  @jira.QANOV-323159 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see the communications dashboard title for a plan with only internet and landline
    Given user has a "landline" product
      And user has a "internet" product
      And user has "0" products of "mobile_line" type
      And user is in the "Communications Dashboard" page
     Then the "title" textfield with "Internet y fijo" text is displayed

  @jira.QANOV-323160 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User can see the communications dashboard title for a plan with internet, landline and mobile line
    Given user has a "landline" product
      And user has a "internet" product
      And user has a "mobile_line" product
      And user is in the "Communications Dashboard" page
     Then the "title" textfield with "Internet, fijo y móvil" text is displayed

  @jira.QANOV-323161 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see an internet product in the Communications dashboard page
    The subtitle text comes from API
    Given user has a "internet" product
      And user has ">1" products of "internet;landline;mobile_line" type
      And user is in the "Communications Dashboard" page
     Then the "internet_row" entrypoint is displayed
      And the "internet_row.icon" icon is displayed
      And the "internet_row.title" textfield with "Internet" text is displayed
      And the "internet_row.subtitle" textfield is displayed
      And the "internet_row.chevron" icon is displayed

  @jira.QANOV-323162 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see an active mobile line in the Communications dashboard page
    The subtitle text comes from API
    Given user has a "mobile_line" product
      And user has ">1" products of "internet;landline;mobile_line" type
      And user is in the "Communications Dashboard" page
     Then the "activated_mobile_row" entrypoint is displayed
      And the "activated_mobile_row.icon" icon is displayed
      And the "activated_mobile_row.title" textfield with the "\d{3} \d{2} \d{2} \d{2}" format is displayed
      And the "activated_mobile_row.subtitle" textfield is displayed
      And the "activated_mobile_row.chevron" icon is displayed

  @jira.QANOV-323163 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @jira.link.parent_test_plan.QANOV-385896 @qa @automatic @webapp
  Scenario: User can see a pending to activate mobile line in Communications dashboard page
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "deactivated" status
      And user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
      And user is in the "Communications Dashboard" page
     Then the "deactivated_mobile_row" entrypoint is displayed
      And the "deactivated_mobile_row.icon" icon is displayed
      And the "deactivated_mobile_row.label" textfield with "Pendiente de activar" text is displayed
      And the "deactivated_mobile_row.title" textfield is displayed
      And the "deactivated_mobile_row.chevron" icon is displayed

  @jira.QANOV-323164 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see a landline product in Communications dashboard page
    The subtitle text comes from API
    Given user has a "landline" product
      And user has ">1" products of "internet;landline;mobile_line" type
      And user is in the "Communications Dashboard" page
     Then the "landline_row" entrypoint is displayed
      And the "landline_row.icon" icon is displayed
      And the "landline_row.title" textfield with the "\d{3} \d{2} \d{2} \d{2}" format is displayed
      And the "landline_row.subtitle" textfield is displayed
      And the "landline_row.chevron" icon is displayed

  @jira.QANOV-323165 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User that has consumed all data for a mobile line can see it in the communications dashboard
    The first two elements of the list are the Internet product and a mobile line, then the rest of mobile lines are prioritised over the landline
    Given user has ">1" products of "internet;landline;mobile_line" type
      And user has at least one line which has consumed "100%" of the data
      And user is in the "Communications Dashboard" page
     Then any element in the "products_list" list has the "label" textfield with the "Sin datos" text

  @jira.QANOV-402974 @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with Segunda Fibra can see the product in the Communications Dashboard
    The first two elements of the list are the Internet product and a mobile line, then the rest of mobile lines are prioritised over the landline
    Given user has ">1" products of "internet;landline;mobile_line" type
      And user has a "segunda_fibra" product
      And user is in the "Communications Dashboard" page
     Then the "segunda_fibra_row" entrypoint is displayed
      And the "segunda_fibra_row.icon" icon is displayed
      And the "segunda_fibra_row.title" textfield with "Segunda Fibra" text is displayed
      And the "segunda_fibra_row.subtitle" textfield is displayed
      And the "segunda_fibra.chevron" icon is displayed

  @jira.QANOV-402975 @android @ios @jira.cv.14.6 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with a Segunda fibra product can access the Segunda Fibra webview from the communications dashboard page
    Given user has a "segunda_fibra" product
      And user is in the "Communications Dashboard" page
     When clicks on the "segunda_fibra_row" entrypoint
     Then the internal webview with "Área privada Movistar" header is displayed
      And the "Segunda Fibra" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Communications Dashboard" page is displayed

  @jira.QANOV-323166 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @smoke
  @qa @live @cert2 @next @automatic @webapp
  Scenario: User with an internet product can access the internet dashboard from the communications dashboard page
    Given user has a "internet" product
      And user is in the "Communications Dashboard" page
     When clicks on the "internet_row" entrypoint
     Then the "Internet Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Communications Dashboard" page is displayed

  @jira.QANOV-323167 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User with an activated mobile line can access the mobile dashboard from the communications dashboard page
    Given user has a "mobile_line" product
      And user has ">1" products of "internet;landline;mobile_line" type
      And user is in the "Communications Dashboard" page
     When clicks on the "activated_mobile_row" entrypoint
     Then the "Mobile Line Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Communications Dashboard" page is displayed

  @jira.QANOV-323168 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-385896 @manual @mobile @moves @smoke @tbd
  Scenario: User with a pending to activate mobile line can access the activate mobile line OB webview from the communications dashboard page
    TBD the ob webview to activate line
    Given user has a "mobile_line" product
      And user has ">0" mobile lines in "deactivated" status
      And user has ">1" products of "internet;landline;mobile_line;activatable_mobile_line" type
      And user is in the "Communications Dashboard" page
     When clicks on the "deactivated_mobile_row" entrypoint
     Then the internal webview with "TBD" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Communications Dashboard" page is displayed

  @jira.QANOV-323169 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @smoke
  @qa @live @cert2 @next @automatic @webapp
  Scenario: User with a landline product can access the landline dashboard from the communications dashboard page
    Given user has a "landline" product
      And user has ">1" products of "internet;landline;mobile_line" type
      And user is in the "Communications Dashboard" page
     When clicks on the "landline_row" entrypoint
     Then the "Landline Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Communications Dashboard" page is displayed

  @jira.QANOV-370230 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with a radio product can access the Radio dashboard from the communications dashboard page
    Given user has a "radio" product
      And user is in the "Communications Dashboard" page
     When clicks on the "radio_row" entrypoint
     Then the "Radio Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Communications Dashboard" page is displayed

  @jira.QANOV-323170 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: Monoplan user with internet and landline products can see them in the correct order in the communications dashboard page
    Given user is in the "Communications Dashboard" page
      And user has "1" plans
      And user has a "internet" product
      And user has a "landline" product
     Then the "landline_row" row is under the "internet_row" row

  @jira.QANOV-323171 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: Monoplan user with internet and mobile lines products can see them in the correct order in the communications dashboard page
    Given user is in the "Communications Dashboard" page
      And user has "1" plans
      And user has a "internet" product
      And user has ">0" products of "mobile_line" type
     Then the "activated_mobile_row" row is under the "internet_row" row

  @jira.QANOV-323172 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: Monoplan user with mobile line and landline products can see them in the correct order in the communications dashboard page
    Given user is in the "Communications Dashboard" page
      And user has "1" plans
      And user has a "landline" product
      And user has a "mobile_line" product
     Then the "landline_row" row is under the "mobile_row" row

  @jira.QANOV-323173 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817
  @jira.link.parent_test_plan.QANOV-385896 @manual @mobile @moves @regression
  Scenario: Monoplan user with active mobile line and pending to activate mobile lines can see them in the correct order in the communications dashboard page
    Given user is in the "Communications Dashboard" page
      And user has "1" plans
      And user has ">0" mobile lines in "deactivated" status
      And user has ">0" mobile lines in "activated" status
     Then the "deactivated_mobile_row" row is under the "activated_mobile_row" row

  @jira.QANOV-323174 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: User can see the services modules in the communications dashboard
    Given user is in the "Communications Dashboard" page
     Then the "interest_services_title" textfield with "Te puede interesar" text is displayed
      And the "interest_services_carousel" carousel is displayed
      And the "management_services_title" textfield with "Gestiones" text is displayed
      And the "management_services_carousel" carousel is displayed

  @jira.QANOV-323175 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @sanity @qa @live @cert2 @next @automatic @webapp
  Scenario: Monoplan prepay user can see the communications module in the dashboard page
    Given user has "1" plans
      And user has a "telco prepay" account type
     Then the "communications_title" textfield with "Comunicaciones" text is displayed
      And the "communications_product_card" module is displayed
      And the "communications_product_card.phone_icon" icon is displayed
      And the "communications_product_card.msisdn" textfield with the "6\d{2} \d{2} \d{2} \d{2}" format is displayed
      And the "communications_product_card.link" link with "Más información" text is displayed

  @jira.QANOV-323176 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @smoke
  @qa @live @cert2 @next @automatic @webapp
  Scenario: Monoplan prepay user can access the mobile dashboard from the communications module
    Given user has "1" plans
      And user has a "telco prepay" account type
      And the "communications_product_card" module is displayed
     When clicks on the "communications_product_card.link" link
     Then the "Mobile Line Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-323177 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @sanity @qa @live @cert2 @next @automatic @webapp
  Scenario: Monoplan postpay mobile user can see the communications module in the dashboard page
    Given user has "1" plans
      And user has a "telco postpay" account type
      And user has a "monoline" plan
     Then the "communications_title" textfield with "Comunicaciones" text is displayed
      And the "communications_product_card" module is displayed
      And the "communications_product_card.phone_icon" icon is displayed
      And the "communications_product_card.msisdn" textfield with the "6\d{2} \d{2} \d{2} \d{2}" format is displayed
      And the "communications_product_card.link" link with "Más información" text is displayed

  @jira.QANOV-323178 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: Monoplan postpay mobile user can access the mobile dashboard from the communications module
    Given user has "1" plans
      And user has a "telco postpay" account type
      And user has a "monoline" plan
      And the "communications_product_card" module is displayed
     When clicks on the "communications_product_card.link" link
     Then the "Mobile Line Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-323179 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves
  @smoke @qa @live @cert2 @next @automatic @webapp
  Scenario: Monoplan landline user can see the communications module in the dashboard page
    Given user has "1" plans
      And user has a "landline" plan
     Then the "communications_title" textfield with "Comunicaciones" text is displayed
      And the "communications_product_card" module is displayed
      And the "communications_product_card.phone_icon" icon is displayed
      And the "communications_product_card.msisdn" textfield with the "9\d{2} \d{2} \d{2} \d{2}" format is displayed
      And the "communications_product_card.link" link with "Más información" text is displayed

  @jira.QANOV-323180 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @smoke
  @qa @live @cert2 @next @automatic @webapp
  Scenario: Monoplan landline user can access the landline dashboard from the communications module
    Given user has "1" plans
      And user has a "landline" plan
      And the "communications_product_card" module is displayed
     When clicks on the "communications_product_card.link" link
     Then the "Landline Dashboard" page is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Dashboard" page is displayed

  @jira.QANOV-323181 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @mobile @moves @smoke
  @qa @live @cert2 @next @automatic @webapp
  Scenario: Multiplan user can access the communications dashboard page
    There will be a section for each plan the user has
    Given user has "several" plans
      And the "communications_section" module is displayed
     When clicks on the "communications_section.link" link
     Then the "Communications Dashboard" page is displayed
      And the "products_section_plan1" module is displayed
      And the "products_section_plan2" module is displayed
