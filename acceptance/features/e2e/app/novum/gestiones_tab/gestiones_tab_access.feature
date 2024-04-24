# -*- coding: utf-8 -*-
@jira.QANOV-527555
Feature: Gestiones Tab Access


  @jira.<jira_id> @android @ios @jira.link.parent_test_plan.QANOV-525492 @mobile @moves @har
  Scenario Outline: ADMIN user who is in the <main_tab> tab can access to the Gestiones tab
    Given user is in the "<main_tab>" page
     When clicks on the "navigation_tab_bar.gestiones_tab" tab
     Then the "Gestiones" page is displayed
      And the "Gestiones" header is displayed

    @ber @har @sanity @jira.cv.24.1 @automatic @qa @next @live @cert2
    Examples:
          | main_tab     | jira_id      |
          | Start        | QANOV-527557 |

    @ber @smoke @jira.cv.Future @manual
    Examples:
          | main_tab     | jira_id      |
          | Consumptions | QANOV-527556 |

    @regression @jira.cv.24.1 @automatic @qa @next @live @cert2
    Examples:
          | main_tab | jira_id      |
          | Invoices | QANOV-527558 |

    @regression @jira.cv.Future @manual @har
    Examples:
          | main_tab | jira_id      |
          | Profile  | QANOV-527559 |

    @regression @jira.cv.24.1 @dv.Future @automatic @qa @next @live @cert2
    Examples:
          | main_tab  | jira_id      |
          | Dashboard | QANOV-619223 |
          | Explore   | QANOV-619224 |

  @jira.QANOV-527560 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: User without subscriptions and a plan order on track can access to the "Gestiones" tab: Zero case experience is displayed
    Given user has a "any_plan" order on track
      And user has "0" active subscriptions
      And user is in the "Gestiones" page
     Then the "main_procedures_header" textfield is not displayed
      And the "main_procedures" list is displayed
      And the "more_procedures_header" textfield with "GESTIONA TUS PRODUCTOS" text is displayed
      And the "zero_case_empty_case.icon" icon is displayed
      And the "zero_case_empty_case.title" textfield with "Aún no tienes productos" text is displayed
      And the "zero_case_empty_case.description" textfield with "A medida que vayamos instalando tus productos podrás verlos aquí" text is displayed
      And the "other_procedures_title" textfield with "¿Necesitas otra cosa?" text is displayed
      And the "other_procedures" carousel is displayed

  @jira.<jira_id> @android @ber @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @mobile @moves
  Scenario Outline: ADMIN user with '<product_type>' product can access to the "Gestiones" tab: '<entrypoint_text>' entrypoint is displayed
    Given user has a "admin" role
      And user has a "<account_type>" account type
      And user has a "<product_type>" product
      And user is in the "Gestiones" page
     Then the "main_procedures_header" textfield is not displayed
      And the "main_procedures" list is displayed
      And the "more_procedures_header" textfield with "GESTIONA TUS PRODUCTOS" text is displayed
      And the "<product_type>_entrypoint.title" entrypoint with "<entrypoint_text>" text is displayed

    @sanity @automatic @qa @cert2 @live @next @webapp
    Examples:
          | product_type  | account_type | entrypoint_text | jira_id      |
          | mobile_line   | postpay      | Línea móvil     | QANOV-527561 |
          | landline      | postpay      | Línea fija      | QANOV-527562 |
          | tv            | postpay      | Televisión      | QANOV-527564 |
          | internet      | postpay      | Internet        | QANOV-527565 |

    @smoke @automatic @qa @cert2 @live @next @webapp
    Examples:
          | product_type  | account_type | entrypoint_text | jira_id      |
          | mobile_line   | prepay       | Línea móvil     | QANOV-527566 |

    @regression @manual
    Examples:
          | product_type      | account_type | entrypoint_text | jira_id      |
          | movistar_plus_ott | postpay      | Televisión      | QANOV-527563 |

  @jira.QANOV-527567 @android @ber @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @mobile @moves
  @sanity @automatic @qa @cert2 @live @next @webapp
  Scenario: ADMIN-LIGHT user can access to the "Gestiones" tab
    Given user has a "admin-light" role
      And user has a "mobile_line" product
      And user is in the "Gestiones" page
     Then the "procedures_title" textfield with "Gestiones de línea móvil" text is displayed
      And the "main_procedures_header" textfield with "FRECUENTES" text is displayed
      And the "main_procedures" list is displayed
      And the "more_procedures_header" textfield with "MÁS GESTIONES" text is displayed
      And the "more_procedures" list is displayed
      And each element in the "more_procedures" list has the "icon" field
      And each element in the "more_procedures" list has the "chevron" field
      And the "other_procedures" carousel is not displayed

  @jira.QANOV-550613 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with other services products additional of the plan can access to the "Gestiones" tab: 'Otros servicios' entrypoint is displayed
    Given user has a "admin" role
      And user has "mobile_line;landline;tv;internet" products
      And user has any of the "movistar_prosegur;movistar_car;movistar_salud;seniors;xbox_game_pass" products
      And user is in the "Gestiones" page
     Then the "more_procedures_header" textfield with "GESTIONA TUS PRODUCTOS" text is displayed
      And the "other_services_entrypoint.title" entrypoint with "Otros servicios" text is displayed

  @jira.QANOV-550614 @android @ios @jira.cv.24.1 @jira.link.parent_test_plan.QANOV-525492 @manual @mobile @moves
  @regression
  Scenario: ADMIN user with just 'other services' products can access to the "Gestiones" tab: Entrypoint list is displayed
    Given user has a "admin" role
      And user has any of the "movistar_prosegur;movistar_car;movistar_salud;seniors;xbox_game_pass" products
      And user is in the "Gestiones" page
     Then the "main_procedures_header" textfield is not displayed
      And the "main_procedures" list is not displayed
      And the "procedures_title" textfield with "Gestiones de servicios digitales" text is displayed
      And the "more_procedures" list is displayed
      And each element in the "more_procedures" list has the "icon" field
      And each element in the "more_procedures" list has the "chevron" field
      And the "other_procedures_title" textfield with "¿Necesitas otra cosa?" text is displayed
      And the "other_procedures" carousel is displayed
