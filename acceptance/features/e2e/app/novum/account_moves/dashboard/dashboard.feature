# -*- coding: utf-8 -*-
@jira.QANOV-1539
Feature: Dashboard


  @jira.QANOV-106746 @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-47665 @mobile @moves @no_automatable @regression
  Scenario: Legados user can see the dashboard of a postpay account with a MONOLINE plan
    commented_tags="@depends_on.NOV-47637"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "monoline" plan
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "subscription-description" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "smart-actions-legacy-postpay" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "agreement-details-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "support-card" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "plan_name" textfield is displayed
      And the "mobile_line_title_text" textfield is displayed
      And the "mobile_line_title_icon" icon is displayed
      And the "allowances_carousel" carousel is displayed
      And the "smart_actions.data_management" button with "Gestionar datos" text is displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed
      And the "tariff_details" module is displayed
      And the "services_module" module is displayed
      And the "diagnostics_module.title" textfield with "¿ALGO NO FUNCIONA BIEN?" text is displayed
      And the "diagnostics_module.subtitle" textfield with "Resolver problema técnico" text is displayed
      And the "diagnostics_module.description" textfield with "Soluciona de manera fácil y sencilla tu avería" text is displayed
      And the "diagnostics_module.image" image is displayed
      And the "diagnostics_module.button" button with "Solucionar avería" text is displayed

  @jira.QANOV-2113 @android @manual @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47681 @mobile @moves
  @smoke
  Scenario: User can see the days until his/her bill closes
    Given user has a "legado postpay" account type
      And user has the matching subscription selected in the account
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user is in the "Account" page
     Then the "billing_cycle.title" textfield with "Tu ciclo cierra en" text is displayed
      And the "billing_cycle.value" textfield with the "\d\d? [días|horas]" format is displayed

  @jira.QANOV-2148 @android @manual @cert2 @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-91953 @mobile @moves @regression @impeded_legacy
  Scenario: ADMIN postpay user with monoline plan can see all sections in Account tab
    The plan selector carousel will have just one entry if the user have just one plan / Line
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "monoline" plan
      And user has the matching subscription selected in the account
      And user has the "subscription-description" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "agreement-details-telco" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "support-card" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "plan_name" textfield is displayed
      And the "Mis Productos" header is displayed
      And the "allowances_carousel" elements are displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed
      And the "tariff_details" module is displayed
      And the "diagnostics_module.title" textfield with "¿ALGO NO FUNCIONA BIEN?" text is displayed
      And the "diagnostics_module.subtitle" textfield with "Resolver problema técnico" text is displayed
      And the "diagnostics_module.description" textfield with "Soluciona de manera fácil y sencilla tu avería" text is displayed
      And the "diagnostics_module.image" image is displayed
      And the "diagnostics_module.button" button with "Solucionar avería" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-91953 @mobile @moves @regression @impeded_legacy @manual
  Scenario Outline: ADMIN postpay user with <plan_type> plan can see all sections in Account tab
    The plan selector carousel will have just one entry if the user have just one plan / Line
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "<plan_type>" plan
      And user has the matching subscription selected in the account
      And user has the "<module>" module configured in CMS for "dashboard" page
      And user has the "unbilled-consumption" module configured in CMS for "dashboard" page
      And user has the "agreement-details-telco" module configured in CMS for "dashboard" page
      And user has the "support-card" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "plan_name" textfield is displayed
      And the "Mis Productos" header is displayed
      And the "<products>" elements are displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed
      And the "tariff_details" module is displayed
      And the "diagnostics_module.title" textfield with "¿ALGO NO FUNCIONA BIEN?" text is displayed
      And the "diagnostics_module.subtitle" textfield with "Resolver problema técnico" text is displayed
      And the "diagnostics_module.description" textfield with "Soluciona de manera fácil y sencilla tu avería" text is displayed
      And the "diagnostics_module.image" image is displayed
      And the "diagnostics_module.button" button with "Solucionar avería" text is displayed

    @automation.pending_mock @impeded_mock @manual
    Examples:
          | plan_type | products                                         | module                   | jira_id    |
          | duo       | internet.icon;landline.icon                      | non-mobile-subscriptions | QANOV-2149 |
          | trio      | tv.icon;landline.icon;internet.icon              | non-mobile-subscriptions | QANOV-2157 |
          | conecta   | mobile_line_carousel;landline.icon;internet.icon | non-mobile-subscriptions | QANOV-2165 |

  @jira.QANOV-96931 @android @impeded_legacy @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-67288 @manual @mobile
  @moves @regression
  Scenario: Postpay user with a FUSION plan with a renting device can see the "Device" roundel
    Legado
    Sin terminal R2R elegido: 53767270D (Shadow) - light: 615184326
    Con terminal R2R recibido: 49737985W (Shadow)
    other_affected_versions="2021-22"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan with a renting device
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     Then the "device.icon" icon is displayed
      And the "device.label" textfield with "Dispositivos" text is displayed

  @jira.QANOV-2194 @android @impeded_legacy @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-119857 @mobile @moves @no_automatable @regression
  Scenario: ADMIN Legados prepay user can see all sections in Account tab
    Given user has a "legado prepay" account type
      And user has "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "subscription-description" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "consumption-counters-mobile" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "smart-actions-legacy-prepay" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "balance" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "latest-movements" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user has the "support-card" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
     Then the "mobile_line_title_text" textfield is displayed
      And the "mobile_line_title_icon" icon is displayed
      And the "allowances_carousel" carousel is displayed
      And the "smart_actions.change_tariff" button with "Pásate a contrato" text is displayed
      And the "smart_actions.data_management_prepay" button with "Añadir Bonos" text is displayed
      And the "balance_module.title" textfield with "Saldo" text is displayed
      And the "balance_module.expiration_date" textfield with the "Caduca el (0?[1-9]|[12][0-9]|3[01]) [a-z]{3}" format is displayed
      And the "balance_module.amount" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "balance_module.button" button with "Recargar" text is displayed
      And the "balance_module.link" link with "Ver detalles de tu saldo" text is displayed
      And the "last_movements.title" textfield with "Últimos movimientos" text is displayed
      And the "last_movements.icon" icon is displayed
      And the "last_movements.chevron" icon is displayed
      And the "services_module" module is displayed
      And the "diagnostics_module.title" textfield with "¿ALGO NO FUNCIONA BIEN?" text is displayed
      And the "diagnostics_module.subtitle" textfield with "Resolver problema técnico" text is displayed
      And the "diagnostics_module.description" textfield with "Soluciona de manera fácil y sencilla tu avería" text is displayed
      And the "diagnostics_module.image" image is displayed
      And the "diagnostics_module.button" button with "Solucionar avería" text is displayed

  @jira.QANOV-35002 @android @impeded_legacy @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-28881 @mobile @moves
  @no_automatable @regression
  Scenario: Legados user with admin or admin-light role won't see the products and services carousel
    other_affected_versions="2020-46-B"
    Given user has a "legado" account type
      And user has a "any-admin" role
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     Then the "products_and_services" carousel is not displayed
      And the "plan_name" textfield is displayed
      And the "Mis Productos" header is displayed

  @jira.<jira_id> @android @impeded_mock @ios @jira.cv.11.6 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.QANOV-21052 @jira.link.relates_to.NOV-163907 @mobile @moves @no_automatable @regression
  Scenario Outline: <plan_type> Telco-in user who logged in before the migration to telco, cannot purchase any data bundle
    Given user has a "telco-in" account type
      And user has a "<plan_type>" plan
      And user is logged in before the migration to telco
      And user has the matching subscription selected in the account
      And user is in the "Data Management" page
     When purchases a "data" bundle
     Then receives a "operation_failed" notification

    Examples:
          | plan_type | depends_on | jira_id    |
          | fusion    | QANOV-2062 | QANOV-2080 |
          | monoline  | QANOV-2071 | QANOV-2091 |

  @jira.<jira_id> @android @impeded_legacy @ios @jira.cv.11.6 @jira.link.depends_on.QANOV-2135
  @jira.link.parent_test_plan.QANOV-21049 @jira.link.relates_to.NOV-194608 @mobile @moves @no_automatable @regression
  Scenario Outline: Telco-out user who logged in before the migration to legados, cannot activate/purchase
    Given user has a "telco-out" account type
      And user has logged in the app before the migration to legados
      And user has the matching subscription selected in the account
      And user is in the "<page>" page
     When purchases a "<product_type>" bundle
     Then the "operation_failed" notification is received

    Examples:
          | page            | product_type | jira_id    |
          | TV Management   | tv           | QANOV-2143 |
          | Data Management | data         | QANOV-2144 |

  @jira.QANOV-326024 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @ber @qa @cert2 @live @next @webapp
  Scenario: A user can see the "Te puede interesar" services module
    Given user is in the "Dashboard" page
      And user has the "services-summary" module configured in CMS for "dashboard-user" page
     Then the "services_module_title" textfield with "Te puede interesar" text is displayed
      And the "services_module" list is displayed
      And each element in the "services_module" list has the "title" field
      And each element in the "services_module" list has the "chevron" field
