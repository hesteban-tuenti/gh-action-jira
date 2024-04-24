# -*- coding: utf-8 -*-
@jira.QANOV-126736
Feature: Mobile Line Dashboard


  @jira.QANOV-325827 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @qa @cert2 @next @live @webapp
  Scenario: A user with a mobile postpay product can see the "Mobile Dashboard" page
    Given user has a "telco postpay" account type
      And user has ">0" mobile lines in "activated" status included in the associated fusion plan
      And user is in the "Mobile Line Dashboard" page for the matching line
      And user has the "counters-carousel" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "unbilled-consumption" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "mobile" page for the "mobile" product
      And user has the "plan-data-card" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "Línea móvil" header is displayed
      And the "mobile_line_title_icon" icon is displayed
      And the "mobile_line_title_text" textfield is displayed
      And the "allowances_carousel.list" carousel is displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed
      And the "services_module" carousel is displayed
      And the "plan_data" module is displayed

  @jira.QANOV-2430 @android @automation.pending_mock @ios @jira.cv.11.8 @jira.link.depends_on.QANOV-2428
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-194546 @manual @mobile @moves @regression
  Scenario: An admin user can see the Pay per use module in mobile line dashboard
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has a "Movistar Plus+ Lite; Tarifa 0" tariff
      And user has "pay_per_use" service in "activated" status
      And user has made consumption on the "data-ppu" allowances in the "mobile_line" product
      And user has the "pay-per-use-counters" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "pay_per_use.icon" icon is displayed
      And the "pay_per_use.title" textfield with the "X {GB/MB} de X {GB/MB}" format is displayed
      And the "pay_per_use.subtitle" textfield with "Datos en pago por uso" text is displayed
      And the "pay_per_use.chevron" icon is displayed

  @jira.QANOV-2015 @android @ios @jira.cv.11.2 @jira.link.relates_to.NOV-193965 @manual @mobile @moves @regression
  Scenario: User can see the consumption counters ordered correctly
    internal_checkpoint="ORDER DEFINED in:
    - unified_config/environment/novum/movistar-es/account/bundleCountersSorterConfig.yaml"
    commented_tags="@depends_on.NOV-30 @depends_on.NOV-164124 @depends_on.NOV-174540"
    Given user has a "postpay" account type
      And user has "data;minutes;sms" allowances in the "mobile_line" product
      And user has the "pay-per-use-counters" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "mobile_line_roundels" carousel is ordered by the "MBs;min;SMS" priorities

  @jira.<jira_id> @<execution_mode> @<test_priority> @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-2429
  @jira.link.relates_to.NOV-47918 @mobile @moves
  Scenario Outline: User with a limited allowance sees the mobile line allowance counters
    TELCO POSTPAY Plan "Contrato 2" with data and minutes (Live): FIC072543F
    LEGADO PREPAY Plan "Prepago Premium" with data and minutes (Live): PRUEBA00029050
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<allowance_roundel>" allowance roundel is displayed
      And the "<allowance_roundel>.title" textfield with the "Llevas" format is displayed
      And the "<allowance_roundel>.amount" textfield with the "\d*(\,\d{1,2})? <units>" format is displayed
      And the "<allowance_roundel>.subtitle" textfield with the "de \d*(\,\d{1,2})? <units>" format is displayed

    @ber @cert2 @jira.link.parent_test_plan.QANOV-189597 @live @next @qa @webapp
    Examples:
          | account_type | allowance_type | allowance_roundel | units    | test_priority | execution_mode | jira_id    |
          | postpay      | data           | data_roundel      | [GB\|MB] | smoke         | automatic      | QANOV-2334 |

    @jira.link.parent_test_plan.QANOV-189597
    Examples:
          | account_type | allowance_type | allowance_roundel | units | test_priority | execution_mode | jira_id    |
          | postpay      | minutes        | minutes_roundel   | min   | regression    | manual         | QANOV-2336 |

    @jira.link.parent_test_plan.QANOV-189597
    Examples:
          | account_type | allowance_type | allowance_roundel | units | test_priority | execution_mode | jira_id    |
          | postpay      | messages       | messages_roundel  | SMS   | regression    | manual         | QANOV-2338 |

    @impeded_legacy
    Examples:
          | account_type  | allowance_type | allowance_roundel | units    | test_priority | execution_mode | jira_id    |
          | legado prepay | data           | data_roundel      | [GB\|MB] | regression    | no_automatable | QANOV-2340 |
          | legado prepay | minutes        | minutes_roundel   | min      | regression    | no_automatable | QANOV-2342 |
          | legado prepay | messages       | messages_roundel  | SMS      | regression    | no_automatable | QANOV-2344 |

  @jira.<jira_id> @<execution_mode> @<test_priority> @android @cert2 @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-2429
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-47918 @live @mobile @moves @next
  Scenario Outline: User with a unlimited allowance with data sharing sees the mobile line allowance counters
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has "data_sharing" service in "activated" status
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<allowance_roundel>" allowance roundel is displayed
      And the "<allowance_roundel>.title" textfield with the "Llevas" format is displayed
      And the "<allowance_roundel>.amount" textfield with the "\d* <units>" format is displayed
      And the "<allowance_roundel>.subtitle" textfield with the "de \d* <units>" format is displayed

    @webapp
    Examples:
          | account_type | allowance_type | allowance_roundel | units    | test_priority | execution_mode | jira_id      |
          | postpay      | data           | data_roundel      | [GB\|MB] | smoke         | automatic      | QANOV-106116 |

    Examples:
          | account_type | allowance_type | allowance_roundel | units | test_priority | execution_mode | jira_id      |
          | postpay      | minutes        | minutes_roundel   | min   | regression    | manual         | QANOV-106117 |
          | postpay      | messages       | messages_roundel  | SMS   | regression    | manual         | QANOV-106118 |

  @jira.<jira_id> @android @ios @jira.cv.10.6 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-64349 @mobile
  @moves @regression
  Scenario Outline: User who has consumed less than 100% of his/her allowance can see the roundel in blue
    LEGADO PREPAY with data and minutes (Dev): 656874631
    TELCO POSTPAY with data (Dev): moves-4
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is limited in the "mobile_line" product
      And user has consumed "<100%" of the "<allowance_type>" allowance in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<allowance_roundel>_color" allowance roundel is displayed in "blue" colour

    @automation.pending_mock @jira.link.parent_test_plan.QANOV-189597 @manual
    Examples:
          | account_type | allowance_type | allowance_roundel | depends_on | jira_id    |
          | postpay      | data           | data_roundel      | QANOV-2334 | QANOV-2346 |
          | postpay      | minutes        | minutes_roundel   | QANOV-2336 | QANOV-2348 |

    @automation.pending_mock @impeded_mock @jira.link.parent_test_plan.QANOV-189597
    @manual
    Examples:
          | account_type | allowance_type | allowance_roundel | depends_on | jira_id    |
          | postpay      | messages       | messages_roundel  | QANOV-2338 | QANOV-2350 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type  | allowance_type | allowance_roundel | depends_on | jira_id    |
          | legado prepay | data           | data_roundel      | QANOV-2340 | QANOV-2352 |
          | legado prepay | minutes        | minutes_roundel   | QANOV-2342 | QANOV-2355 |
          | legado prepay | messages       | messages_roundel  | QANOV-2344 | QANOV-2357 |

  @jira.<jira_id> @android @ios @jira.cv.10.6 @jira.link.depends_on.<depends_on> @jira.link.relates_to.NOV-64351 @mobile
  @moves @regression
  Scenario Outline: User who has not made any consumption of his/her allowance, can see the roundel in gray
    TELCO POSTPAY Plan "Contrato 2" with data and minutes (Live): FIC072543F
    LEGADO PREPAY Plan "Prepago Premium" with data and minutes (Live): PRUEBA00029050
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And user has consumed "0%" of the "<allowance_type>" allowance in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<allowance_roundel>_color" allowance roundel is displayed in "gray" colour

    @manual
    Examples:
          | account_type | allowance_type | allowance_roundel | depends_on | jira_id    |
          | postpay      | data           | data_roundel      | QANOV-2334 | QANOV-2371 |
          | postpay      | minutes        | minutes_roundel   | QANOV-2336 | QANOV-2373 |

    @impeded_mock @manual
    Examples:
          | account_type | allowance_type | allowance_roundel | depends_on | jira_id    |
          | postpay      | messages       | messages_roundel  | QANOV-2338 | QANOV-2375 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type  | allowance_type | allowance_roundel | depends_on | jira_id    |
          | legado prepay | data           | data_roundel      | QANOV-2340 | QANOV-2377 |
          | legado prepay | minutes        | minutes_roundel   | QANOV-2342 | QANOV-2379 |
          | legado prepay | messages       | messages_roundel  | QANOV-2344 | QANOV-2381 |

  @jira.<jira_id> @<execution_mode> @<test_priority> @android @cert2 @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-2429
  @live @mobile @moves @next
  Scenario Outline: User with an unlimited allowance sees the mobile line allowance counters
    LEGADO POSTPAY (Live): 05960856S
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has "data_sharing" service in "deactivated" status
      And user has "pay_per_use" service in "deactivated" status
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<allowance_roundel>" allowance roundel is displayed
      And the "<allowance_roundel>.title" textfield with the "Llevas" format is displayed
      And the "<allowance_roundel>.amount" textfield with the "\d* (MB|GB|SMS|minutos)" format is displayed
      And the "<allowance_roundel>.subtitle" textfield with the "de ilimitados" format is displayed

    @ber @qa @webapp
    Examples:
          | allowance_type | allowance_roundel | execution_mode | test_priority | jira_id    |
          | data           | data_roundel      | automatic      | smoke         | QANOV-2383 |

    Examples:
          | allowance_type | allowance_roundel | execution_mode | test_priority | jira_id    |
          | minutes        | minutes_roundel   | manual         | regression    | QANOV-2385 |
          | messages       | messages_roundel  | manual         | regression    | QANOV-2386 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.QANOV-189597
  @jira.link.relates_to.NOV-64352 @manual @mobile @moves @regression
  Scenario Outline: User with an unlimited allowance sees the mobile line allowance counters in blue colour
    LEGADO POSTPAY (Live): 05960856S
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has "<allowance_type>" allowances in the "mobile_line" product
      And the "<allowance_type>" allowance is unlimited in the "mobile_line" product
      And user has "data_sharing" service in "deactivated" status
      And user has "pay_per_use" service in "deactivated" status
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<allowance_roundel>_color" allowance roundel is displayed in "blue" colour

    Examples:
          | allowance_type | allowance_roundel | depends_on | jira_id    |
          | data           | data_roundel      | QANOV-2383 | QANOV-2388 |
          | minutes        | minutes_roundel   | QANOV-2385 | QANOV-2389 |
          | messages       | messages_roundel  | QANOV-2386 | QANOV-2390 |

  @jira.QANOV-2391 @android @automation.hard @ios @jira.cv.10.6 @jira.link.depends_on.QANOV-2334
  @jira.link.depends_on.QANOV-2336 @jira.link.depends_on.QANOV-2338 @jira.link.depends_on.QANOV-2340
  @jira.link.depends_on.QANOV-2342 @jira.link.depends_on.QANOV-2344 @jira.link.relates_to.NOV-64354 @manual @mobile @moves
  @regression
  Scenario: Shared data is represented in the roundel with the same color
    internal_checkpoint="MOVES DEV: moves-4 -> First line"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has "data_sharing" service in "activated" status
      And user has "data" allowances in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user has the "shared-counters" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "data_roundel_color" allowance roundel is displayed in "blue" colour
      And the "data_sharing" entrypoint is displayed
      And the "data_sharing.icon" icon is displayed
      And the "data_sharing.title" textfield with the "\d GB de \d GB" format is displayed
      And the "data_sharing.subtitle" textfield with the "Datos compartidos por X líneas" format is displayed

  @jira.<jira_id> @android @automation.pending_mock @ios @jira.cv.10.6 @jira.link.depends_on.QANOV-2334
  @jira.link.depends_on.QANOV-2336 @jira.link.depends_on.QANOV-2338 @jira.link.depends_on.QANOV-2340
  @jira.link.depends_on.QANOV-2342 @jira.link.depends_on.QANOV-2344 @jira.link.relates_to.NOV-193910 @manual @mobile
  @moves @regression
  Scenario Outline: User who purchased a temporal data bundle data can see its amount aggregated to the data counter in dashboard
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has "pay_per_use" service in "deactivated" status
      And user has the "<nt_data_bundle>" data bundle purchased
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<nt_data_bundle_amount>" is shown aggreagated to the total of the data roundel

    Examples:
          | nt_data_bundle                           | nt_data_bundle_amount | jira_id    |
          | Ilimitado de 48 horas renovable          | Ilimitado             | QANOV-2392 |
          | Limitado de 1 GB por 7 días no renovable | 1 GB                  | QANOV-2393 |

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.10.4 @jira.link.relates_to.NOV-73392 @mobile @moves @regression
  Scenario Outline: User who has at least one unlimited allowance without consumptions and other limited allowance will see just the limited roundel
    commented_tags="@depends_on.NOV-47662"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "<allowance_type_unlimited>;<allowance_type_limited>" allowances in the "mobile_line" product
      And the "<allowance_type_unlimited>" allowance is unlimited in the "mobile_line" product
      And the "<allowance_type_limited>" allowance is limited in the "mobile_line" product
      And user has consumed "0%" of the "<allowance_type_unlimited>" allowance in the "mobile_line" product
      And user has the "counters-carousel" module configured in CMS for any of the "mobile,dashboard" pages for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     Then the "<allowance_roundel_unlimited>" allowance roundel is not displayed
      And the "<allowance_roundel_limited>" allowance roundel is displayed

    @automation.pending_mock @manual
    Examples:
          | account_type | allowance_type_unlimited | allowance_roundel_unlimited | allowance_type_limited | allowance_roundel_limited | jira_id    |
          | postpay      | data                     | data_roundel                | minutes                | minutes_roundel           | QANOV-2394 |
          | postpay      | data                     | data_roundel                | messages               | messages_roundel          | QANOV-2395 |
          | postpay      | minutes                  | minutes_roundel             | data                   | data_roundel              | QANOV-2396 |
          | postpay      | minutes                  | minutes_roundel             | messages               | messages_roundel          | QANOV-2397 |
          | postpay      | messages                 | messages_roundel            | data                   | data_roundel              | QANOV-2398 |
          | postpay      | messages                 | messages_roundel            | minutes                | minutes_roundel           | QANOV-2399 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type  | allowance_type_unlimited | allowance_roundel_unlimited | allowance_type_limited | allowance_roundel_limited | jira_id    |
          | legado prepay | data                     | data_roundel                | minutes                | minutes_roundel           | QANOV-2400 |
          | legado prepay | data                     | data_roundel                | messages               | messages_roundel          | QANOV-2401 |
          | legado prepay | minutes                  | minutes_roundel             | data                   | data_roundel              | QANOV-2402 |
          | legado prepay | minutes                  | minutes_roundel             | messages               | messages_roundel          | QANOV-2403 |
          | legado prepay | messages                 | messages_roundel            | data                   | data_roundel              | QANOV-2404 |
          | legado prepay | messages                 | messages_roundel            | minutes                | minutes_roundel           | QANOV-2409 |

  @jira.QANOV-2024 @android @ios @jira.cv.11.6 @jira.link.parent_test_plan.QANOV-21052 @jira.link.relates_to.NOV-163899
  @mobile @moves @no_automatable @regression
  Scenario: Telco-in FUSION user who logged in during the migration to telco, can access to Mobile line dashboard
    Given user has a "telco-in" account type
      And user has a "fusion" plan
      And user is logged in during the migration to telco
      And user is in the "Mobile Line Dashboard" page
     Then the "data_quick_actions" carousel is not displayed
      And the "diagnostics_module" module is not displayed

  @jira.QANOV-2062 @android @impeded_mock @ios @jira.cv.11.6 @jira.link.relates_to.NOV-163905 @mobile @moves
  @no_automatable @regression
  Scenario: Telco-in FUSION user who logged in before the migration to telco, can access to Mobile line dashboard
    Given user has a "telco-in" account type
      And user has a "fusion" plan
      And user is logged in before the migration to telco
      And user is in the "Mobile Line Dashboard" page
     Then the "data_quick_actions" carousel is not displayed
      And the "diagnostics_module.title" textfield with "¿ALGO NO FUNCIONA BIEN?" text is displayed
      And the "diagnostics_module.subtitle" textfield with "Resolver problema técnico" text is displayed
      And the "diagnostics_module.description" textfield with "Soluciona de manera fácil y sencilla tu avería" text is displayed
      And the "diagnostics_module.image" image is displayed
      And the "diagnostics_module.button" button with "Solucionar avería" text is displayed

  @jira.QANOV-2145 @android @ios @jira.cv.11.8 @jira.link.parent_test_plan.QANOV-21049 @jira.link.relates_to.NOV-194610
  @mobile @moves @no_automatable @regression
  Scenario: Telco-out FUSION or PIKOLIN user who logged in during the migration to legados, can access to Mobile line dashboard
    Given user has a "telco-out" account type
      And user has a "fusion;pikolin" plan
      And user is logged in during the migration to legados
      And user is in the "Mobile Line Dashboard" page
     Then the "data_quick_actions" carousel is not displayed
      And the "diagnostics_module" module is not displayed
      And the "mobile_line_roundels" carousel is displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed

  @jira.QANOV-325828 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves @smoke
  Scenario: User with only mobile product can see a card to add extra lines in the mobile dashboard page
    Given user has the "plan-data-card" module configured in CMS for "mobile" page for the "mobile" product
      And user has "1" plans
      And user has "1" products of "mobile_line" type
      And user has "0" products of "landline;internet" type
      And user is in the "Mobile Dashboard" page
     Then the "extra_lines_module_title" textfield with "Líneas extra" text is displayed
      And the "extra_lines_module" module is displayed
      And the "extra_lines_module.title" textfield with "¿Necesitas otra línea móvil?" text is displayed
      And the "extra_lines_module.subtitle" textfield with "Añade ahora una nueva línea móvil extra con las características que mejor se adapten a ti" text is displayed
      And the "extra_lines_module.button" button with "Añadir línea" text is displayed

  @jira.QANOV-325829 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @manual @mobile @moves
  @regression
  Scenario: User with only mobile product can access the OB webview to add lines from the mobile dashboard page
    Given user has the "plan-data-card" module configured in CMS for "mobile" page for the "mobile" product
      And user has "1" plans
      And user has "1" products of "mobile_line" type
      And user is in the "Mobile Dashboard" page
     When clicks on the "extra_lines_module.button" link
     Then the browser webview is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Mobile Dashboard" page is displayed

  @jira.QANOV-373978 @android @ios @jira.cv.14.4 @manual @mobile @moves @regression
  Scenario: Admin-light user cannot access to the "Gestionar datos" flow: Login Escalation Required page is displayed
    other_affected_versions="2021-38"
    Given user has a "admin-light" role
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "services_data_management" button
     Then the "Login Escalation Required" page is displayed
      And the "Accede como titular" header is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed
