# -*- coding: utf-8 -*-
@jira.QANOV-9156
Feature: Detailed TV plan info


  @jira.QANOV-2107 @android @impeded_mock @ios @jira.cv.11.6 @jira.link.depends_on.QANOV-2101 @mobile @moves
  @no_automatable @regression
  Scenario: Telco-in user who logged in before the migration to telco, cannot modify her TV products
    Given user has a "telco-in" account type
      And user has a "fusion;pikolin" plan
      And user has logged in the app before the migration to telco
      And user has the matching subscription selected in the account
      And user is in the "TV Management" page
     When purchases a "tv" bundle
     Then the "operation_failed" notification is received

  @jira.QANOV-250953 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-9157 @jira.link.detects.MOVES-6890
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-52861 @mobile @moves @impeded_legacy @no_automatable
  @regression
  Scenario Outline: User can access to the TV dashboard
    internal_checkpoint="The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "tv" product
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user has the "smart-actions-<account_type>" module configured in CMS for "tv" page for the "tv" product
      And user has the "unbilled-consumption" module configured in CMS for "tv" page for the "tv" product
      And user has the "tv-functionalities" module configured in CMS for "tv" page for the "tv" product
      And user has the "support-card" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Account" page
      And user has the communications and leisure content displayed
     When clicks on the "tv.icon" icon
     Then the "Television" page is displayed
      And the "Televisión" header is displayed
      And the "tv_plan_name" textfield is displayed
      And the "tv_products_title" textfield with "Productos contratados" text is displayed
      And the "tv_products" module is displayed
      And the "manage_tv" button with "Alta y baja de contenidos" text is displayed
      And the "billing_cycle" module is displayed
      And the "extra_charges" module is displayed
      And the "services_modules" module is displayed
      And the "included_functionalities" module is displayed
      And the "diagnostics_module.title" textfield with "¿ALGO NO FUNCIONA BIEN?" text is displayed
      And the "diagnostics_module.subtitle" textfield with "Resolver problema técnico" text is displayed
      And the "diagnostics_module.description" textfield with "Soluciona de manera fácil y sencilla tu avería" text is displayed
      And the "diagnostics_module.image" image is displayed
      And the "diagnostics_module.button" button with "Solucionar avería" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21055 @jira.link.relates_to.NOV-195370
  @manual @mobile @moves @regression
  Scenario Outline: User who buys a pack that includes Disney+ will see the pack in the TV dashboard
    internal_checkpoint="Users:
    Cine con Disney+ not activated: FIC055532F
    Cine con Disney+ activated: FIC052358F
    Movistar+ Premium con Disney+ activated: FIC28513"
    other_affected_versions="2022-03"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user is subscribed to the "<pack_with_disney>" TV pack
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     Then the "<pack_with_disney>" TV product is displayed in the purchased products carousel

    Examples:
          | account_type  | pack_with_disney              | jira_id    |
          | postpay       | Cine con Disney+              | QANOV-9169 |
          | telco postpay | Movistar+ Premium con Disney+ | QANOV-9170 |
          | postpay       | Premium con Disney+           | QANOV-9171 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21055
  @jira.link.parent_test_plan.QANOV-51351 @jira.link.relates_to.NOV-195372 @manual @mobile @moves @regression
  Scenario Outline: User who bought a pack that includes Disney+ and it is activated will see the access to Disney+ webview in the pack details screen
    internal_checkpoint="Users:
    Cine con Disney+ not activated: FIC055532F
    Cine con Disney+ activated: FIC052358F
    Movistar+ Premium con Disney+ activated: FIC28513"
    other_affected_versions="2021-05-B"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user is subscribed to the "<pack_with_disney>" TV pack
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "<pack_with_disney>" TV product in the purchased products carousel
      And clicks on the "disney_channel" icon
     Then the "play_disney" button with "Ver Disney+" text is displayed

    Examples:
          | account_type  | pack_with_disney              | jira_id    |
          | postpay       | Cine+Disney                   | QANOV-9181 |
          | telco postpay | Movistar+ Premium con Disney+ | QANOV-9182 |
          | postpay       | Premium con Disney+           | QANOV-9183 |

  @jira.<jira_id> @android @ios @jira.cv.12.0 @jira.link.parent_test_plan.QANOV-21055
  @jira.link.parent_test_plan.QANOV-51351 @jira.link.relates_to.NOV-195372 @manual @mobile @moves @regression
  Scenario Outline: User who bought a pack that includes Disney+ and it is not activated will see the access to enable Disney+ in the pack details screen
    internal_checkpoint="Users:
    Cine con Disney+ not activated: FIC055532F
    Cine con Disney+ activated: FIC052358F
    Movistar+ Premium con Disney+ activated: FIC28513"
    other_affected_versions="2021-05-B"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has "disney" television service in "deactivated" status
      And user is subscribed to the "<pack_with_disney>" TV pack
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "<pack_with_disney>" TV product in the purchased products carousel
      And clicks on the "disney_channel" icon
     Then the "enable_disney" button with "Activar Disney+" text is displayed

    Examples:
          | account_type  | pack_with_disney              | jira_id     |
          | postpay       | Cine+Disney                   | QANOV-55701 |
          | telco postpay | Movistar+ Premium con Disney+ | QANOV-55702 |
          | postpay       | Premium con Disney+           | QANOV-55703 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.0 @jira.link.parent_test_plan.QANOV-98837 @mobile
  @moves @regression
  Scenario Outline: A <account_type> user with a plan with Motor / Deportes TV pack can see the DAZN icon in the second level carousel
    The step 'user has the communications and leisure content displayed' just apply to TELCO users because in this Account steps
    is needed that the 'Comunicaciones y ocio' vertical is selected
    TV channel in tariff hard to automate cause the MOVES team is harcoding this info in this repo and is hard to check: https://github.com/Telefonica/tv-catalogue
    other_affected_versions="2021-05-B 2022-03"
    Given user has a "<account_type>" account type
      And user has a "any_admin" role
      And user has the "Deportes;Motor" TV channel in tariff
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "Deportes;Motor" TV product in the purchased products carousel
     Then the "DAZN" TV product is displayed in the channels tab

    @manual
    Examples:
          | account_type | jira_id     |
          | telco        | QANOV-99238 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | jira_id     |
          | legado       | QANOV-99239 |

  @jira.QANOV-99240 @android @automation.hard @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-98837 @manual @mobile
  @moves @regression
  Scenario: ADMIN can access to the "DAZN details" screen from the purchased products carousel
    TV channel in tariff hard to automate cause the MOVES team is harcoding this info in this repo and is hard to check: https://github.com/Telefonica/tv-catalogue
    Given user has a "any_admin" role
      And user has the "DAZN" TV channel in tariff
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "DAZN" TV product in the purchased products carousel
     Then the "DAZN details" page is displayed
      And the "title" textfield with "DAZN" text is displayed
      And the "included" textfield with "INCLUIDO" text is displayed
      And the "dazn_icon" icon is displayed
      And the "description" textfield is displayed
      And the "button" button with "Entrar en DAZN" text is displayed

  @jira.QANOV-99242 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-98837 @manual @mobile @moves @regression
  Scenario: ADMIN user with DAZN deactivated can access to the DAZN activation OB webview from the button in the DAZN details page
    Given user has a "admin" role
      And user has the "DAZN" TV channel
      And user has "dazn" television service in "deactivated" status
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "DAZN details" page
     When clicks on the "button" button
     Then the browser webview is displayed
      And the "DAZN" string is displayed
      And the "Activar cuenta DAZN" string is displayed

  @jira.QANOV-99243 @android @ios @jira.cv.12.3 @jira.link.parent_test_plan.QANOV-98837 @manual @mobile @moves @regression
  Scenario: ADMIN user with DAZN activated can access to the See DAZN OB webview from the button in the DAZN details page
    Given user has a "admin" role
      And user has the "DAZN" TV channel
      And user has "dazn" television service in "activated" status
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "tv-header" module configured in CMS for "tv" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "DAZN details" page
     When clicks on the "button" button
     Then the browser webview is displayed
      And the "DAZN" string is displayed
      And the "Ver DAZN en app" string is displayed

  @jira.QANOV-292117 @android @ios @jira.cv.13.10 @manual @mobile @moves @smoke
  Scenario: Telco user with a "Fusión" plan who accessed to the TV dashboard taps on the "alta y baja de contenidos" button: Dynamic page to call to a 900 is displayed
    other_affected_versions="2022-49"
    Given user has a "telco postpay" account type
      And user has a "fusion" plan
      And user has the matching subscription selected in the account
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "smart-actions-telco" module configured in CMS for "tv" page for the "tv" product
      And user is in the "Television" page
     When clicks on the "manage_tv" button
     Then the "Dynamic Cms" page is displayed
      And the "Alta y baja de contenidos" header is displayed
      And the "image" image is displayed
      And the "title" textfield is displayed
      And the "button" button with "Llamar" text is displayed

  @jira.QANOV-9067 @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.relates_to.NOV-127339 @mobile @moves
  @no_automatable @smoke
  Scenario: Legados user can access to the 'Alta y baja de contenidos' screen
    The OB webview will contain:
    - current user's plan (plan's name and monthly price)
    - list with other possible plans (each plan will have a name, price and a checkbox to select it)
    - list with all the packages for the existing plan (included/purchased) and the packages that the user could add to the plan (with a selector to purchase them)
    - list with all the channels for the existing plan (included/purchased) and the channels that the user could add to the plan (with a selector to purchase them)
    commented_tags="@depends_on.NOV-52861"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "smart-actions-legado" module configured in CMS for "tv" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "manage_tv" button
     Then the browser webview is displayed
      And the "Configurar mi TV" header is displayed

  @jira.QANOV-44597 @android @impeded_legacy @ios @jira.cv.11.15 @mobile @moves @no_automatable @regression
  Scenario: Legados user with a tariff not eligible to an update cannot access to the Alta y baja de contenidos view
    Users that the /product/tv/setup endpoint returns NONE
    other_affected_versions="2020-48"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "fusion" plan
      And user has a tariff not eligible to an update
      And user has the "non-mobile-subscriptions" module configured in CMS for "dashboard" page
      And user has the "smart-actions-legado" module configured in CMS for "tv" page for the "tv" product
      And user has the matching subscription selected in the account
      And user is in the "Television" page
     When clicks on the "manage_tv" button
     Then the browser webview is displayed
      And the "Alta y baja de contenidos" header is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Alta y baja de contenidos" text is displayed
      And the "informative_message" textfield with "Tu Fusión actual no permite contratar contenidos de TV desde aquí, en el 900 200 445 te decimos cómo hacerlo." text is displayed
      And the "informative_button" button with "Llamar" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Television" page is displayed
