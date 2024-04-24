# -*- coding: utf-8 -*-
@jira.QANOV-417286
Feature: Pre Customers

  Actions Before the Feature:
    Given user is a pre customer


  @jira.QANOV-417287 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Pre customer user can access Explore tab: Empty state page is displayed
    Given user is in the "Explore" page
     Then the "empty_case_icon" icon is displayed
      And the "empty_case_title" textfield with "Para ti" text is displayed
      And the "empty_case_subtitle" textfield with "En este apartado te mostraremos todos nuestros productos para que puedas cambiar de tarifa o contratar otros servicios si los necesitas." text is displayed

  @jira.QANOV-417288 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Pre customer user can access Invoices tab: Empty state page is displayed
    Given user is in the "Invoices" page
     Then the "empty_case_icon" icon is displayed
      And the "empty_case_title" textfield with "Aún no tienes facturas" text is displayed
      And the "empty_case_subtitle" textfield with "Aquí verás tus facturas cada mes." text is displayed

  @jira.QANOV-417289 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Pre customer user can access to the Support tab
    Whatsapp support card is only displayed within support service time from 9 to 22 (Mon-Sun)
    Given user is in the "Support" page
     Then the "contact_methods" carousel is displayed
      And each card in the "contact_methods" carousel has the "icon" field
      And each card in the "contact_methods" carousel has the "text" field
      And the "contact_methods.phone" card is displayed
      And the "contact_methods.whatsapp" card is displayed
      And the "contact_methods.email" card is displayed
      And the "first_steps" module is displayed
      And the "first_steps.title" textfield is displayed
      And the "first_steps.description" textfield is displayed
      And the "first_steps.chevron" element is on display
      And the "new_incidence_module" module is not displayed
      And the "incidences_module" module is not displayed
      And the "whatsapp_availabilty_times_title" textfield is displayed
      And the "whatsapp_availabilty_times_description" textfield is displayed

  @jira.QANOV-417290 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: Pre customer user selects Profile icon: Profile screen is opened with all options enabled
    Given user is in the "Profile" page
     Then the "settings" list with "[LANG:profile.dashboard.personal_data.entrypoint];[LANG:profile.dashboard.my_orders];[LANG:profile.dashboard.biometric_access];[LANG:profile.dashboard.my_information.change_password.entrypoint]" textfields is displayed
      And the "rate_app" entrypoint is not displayed
      And the "notifications_management" entrypoint is not displayed
      And the "log_out_button" entrypoint with "[LANG:profile.dashboard.log_out]" text is displayed

  @jira.QANOV-417291 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A pre customer can not edit fields from the "Personal data" screen
    Given user is in the "Profile" page
     When clicks on the "personal_data" entrypoint
     Then the "Personal Data" page is displayed
      And the "Datos personales" header is displayed
      And the "contact_data_title" textfield with "DATOS DE CONTACTO" text is displayed
      And the "personal_data_list" list with "[LANG:profile.dashboard.personal_data.phone_number];[LANG:profile.dashboard.personal_data.email_address]" entrypoints is displayed
      And the "bank_data_title" textfield with "DATOS BANCARIOS" text is displayed
      And the "bank_account" entrypoint with "Cuenta bancaria" text is displayed
      And the entrypoints are not clickable
      And clicks on the "navigation_top_bar.back_button" button
      And the "Profile" page is displayed

  @jira.QANOV-417292 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A pre customer can see an error in Account screen when its order can not be retreived
    Given user is in the "Account" page
      And there is an error retreiving user's order
     Then the "error_icon" icon is displayed
      And the "error_title" textfield with "Algo ha ido mal" text is displayed
      And the "error_description" textfield with "El contenido de esta página no se puede mostrar. por favor, inténtalo de nuevo más tarde." text is displayed

  @jira.QANOV-417293 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A pre customer with only 1 hired plan can see the account chooser module in Account screen
    Given user has "1" plans
      And user is in the "Account" page
     Then the "account_chooser" module is displayed
      And the "account_chooser.icon" icon is displayed
      And the "account_chooser.title" textfield with "En proceso de activación" text is displayed
      And the "account_chooser.plan_name" textfield is displayed
      And the "account_chooser.chevron" element is not on display

  @jira.QANOV-417294 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A pre customer with > 1 hired plans can see the account chooser module in Account screen
    Given user has ">1" plans
      And user is in the "Account" page
     Then the "account_chooser" module is displayed
      And the "account_chooser.icon" icon is displayed
      And the "account_chooser.title" textfield with "En proceso de activación" text is displayed
      And the "account_chooser.plan_name" textfield is displayed
      And the "account_chooser.chevron" element is on display

  @jira.QANOV-417295 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A pre customer with >1 hired plans can change the selected plan in Account screen
    Given user has ">1" plans
      And user is in the "Account" page
     When clicks on the "account_chooser" module
      And clicks on the "account_chooser.other_plan" button
     Then the information in Account screen is updated with the selected plan's info

  @jira.QANOV-417296 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A pre customer can access the Account screen
    Given user is in the "Account" page
     Then the "account_chooser" module is displayed
      And the "tariff_card" module is displayed
      And the "help_module_title" textfield with "Ayuda" text is displayed
      And the "help_module" module is displayed

  @jira.QANOV-417297 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A pre customer can see a tariff module in the Account screen
    Given user is in the "Account" page
     Then the "tariff_card" module is displayed
      And the "tariff_card.icon" icon is displayed
      And the "tariff_card.tag" textfield with "En proceso de activación" text is displayed
      And the "tariff_card.title" textfield is displayed
      And the "tariff_card.date" textfield with the "Fecha de contratación: \d\d\/\d\d\/\d\d\d\d" format is displayed
      And the "tariff_card.button" button with "Ver detalle" text is displayed

  @jira.QANOV-417298 @android @ios @jira.cv.Future @manual @mobile @o2es @regression @tbd
  Scenario: A pre customer can go to the order details OB webview form the tariff module in Account page
    Given user is in the "Account" page
     When clicks on the "tariff_card.button" button
     Then the browser webview is displayed

  @jira.QANOV-417299 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A pre customer can see a help module in the Account screen
    Given user is in the "Account" page
     Then the "help_module" module is displayed
      And the "help_module.icon" icon is displayed
      And the "help_module.title" textfield is displayed
      And the "help_module.description" textfield is displayed
      And the "help_module.button" button is displayed

  @jira.QANOV-417300 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A pre customer can access the O2 whatsapp chat from the help module in Account screen
    Given user is in the "Account" page
      And user is logged in the "WhatsApp" app
     When clicks on the "help_module.button" button
     Then the "WhatsApp" app is displayed
      And the O2 Guru conversation will be displayed on the WhatsApp app
