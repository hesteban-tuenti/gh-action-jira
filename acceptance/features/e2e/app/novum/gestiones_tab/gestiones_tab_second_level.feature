# -*- coding: utf-8 -*-
@jira.QANOV-527597
Feature: Gestiones Tab Second Level


  @jira.<jira_id> @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @mobile @moves
  Scenario Outline: ADMIN user with '<product_type>' product taps on the '<entrypoint_text>' entrypoint: Secondary level is displayed
    Given user has a "admin" role
      And user has a "postpay" account type
      And user has a "<product_type>" product
      And user is in the "Gestiones" page
     When clicks on the "<product_type>_entrypoint" entrypoint
     Then the "Gestiones <page_object>" page is displayed
      And the "Gestiones" header is displayed
      And the "procedures_title" textfield with "Gestiones de <entrypoint_text>" text is displayed
      And the "main_procedures" list is not displayed
      And the "more_procedures" list is displayed
      And each element in the "more_procedures" list has the "icon" field
      And each element in the "more_procedures" list has the "chevron" field
      And the "other_procedures_title" textfield with "¿Necesitas otra cosa?" text is displayed
      And the "other_procedures" carousel is displayed

    @ber @sanity @automatic @qa @cert2 @next @live @webapp
    Examples:
          | product_type | entrypoint_text | page_object | jira_id      |
          | landline     | línea fija      | Landline    | QANOV-527598 |
          | tv           | Televisión      | Television  | QANOV-527599 |
          | internet     | Internet        | Internet    | QANOV-527600 |

    @regression @manual
    Examples:
          | product_type      | entrypoint_text | page_object | jira_id      |
          | movistar_plus_ott | Televisión      | Television  | QANOV-527601 |

  @jira.QANOV-527602 @android @ber @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @mobile @moves
  @sanity @automatic @qa @cert2 @next @live @webapp
  Scenario: ADMIN user with 'mobile_line' products taps on the: 'mobile_line' entrypoint: Secondary level is displayed
    Given user has a "admin" role
      And user has a "postpay" account type
      And user has a "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "mobile_line_entrypoint" entrypoint
     Then the "Gestiones Mobile" page is displayed
      And the "Gestiones" header is displayed
      And the "procedures_title" textfield with "Gestiones de línea móvil" text is displayed
      And the "main_procedures_header" textfield with "FRECUENTES" text is displayed
      And the "main_procedures" list is displayed
      And the "more_procedures_header" textfield with "MÁS GESTIONES" text is displayed
      And the "more_procedures" list is displayed
      And each element in the "more_procedures" list has the "icon" field
      And each element in the "more_procedures" list has the "chevron" field
      And the "other_procedures_title" textfield with "¿Necesitas otra cosa?" text is displayed
      And the "other_procedures" carousel is displayed

  @jira.QANOV-572048 @android @ber @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @mobile @moves
  @sanity @automatic @qa @cert2 @next @live @webapp
  Scenario: ADMIN user with just mobile line prepay products can access to the "Gestiones" tab
    Given user has a "admin" role
      And user has a "prepay" account type
      And user has a "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "mobile_line_entrypoint" entrypoint
     Then the "Gestiones Mobile" page is displayed
      And the "Gestiones" header is displayed
      And the "procedures_title" textfield with "Gestiones de línea móvil" text is displayed
      And the "main_procedures_header" textfield is not displayed
      And the "main_procedures" list is not displayed
      And the "more_procedures_header" textfield is not displayed
      And the "more_procedures" list is displayed
      And each element in the "more_procedures" list has the "icon" field
      And each element in the "more_procedures" list has the "chevron" field
      And the "other_procedures_title" textfield with "¿Necesitas otra cosa?" text is displayed
      And the "other_procedures" carousel is displayed

  @jira.QANOV-550615 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves @smoke
  Scenario: ADMIN user with digital products can access to the "Gestiones" tab: Entrypoint list is displayed
    Given user has a "admin" role
      And user has "mobile_line;landline;tv;internet" products
      And user has any of the "movistar_prosegur;movistar_car;qustodio;movistar_salud;seniors;movistar_cloud;conexion_segura;smart_wifi;mobile_insurance;device_insurance;home_insurance;movistar_money;xbox_game_pass;solar" products
      And user is in the "Gestiones" page
     When clicks on the "other_services_entrypoint" entrypoint
     Then the "Gestiones Others" page is displayed
      And the "main_procedures" list is not displayed
      And the "procedures_title" textfield with "Gestiones de servicios digitales" text is displayed
      And the "more_procedures" list is displayed
      And each element in the "more_procedures" list has the "icon" field
      And each element in the "more_procedures" list has the "chevron" field
      And the "other_procedures_title" textfield with "¿Necesitas otra cosa?" text is displayed
      And the "other_procedures" carousel is displayed
