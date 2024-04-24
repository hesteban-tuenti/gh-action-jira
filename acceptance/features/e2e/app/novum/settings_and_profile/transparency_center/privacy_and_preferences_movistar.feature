# -*- coding: utf-8 -*-
@jira.QANOV-8216
Feature: Privacy and preferences Movistar

  Actions Before each Scenario:
    Given user is in the "Privacy Preferences" page


  @jira.QANOV-8217 @android @automatic @cert2 @ios @jira.cv.11.6 @jira.link.detects.MOVES-4890
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.relates_to.NOV-161253 @live @mobile @moves @next @sanity
  Scenario: TELCO user can see his/her consents
    Given user has a "telco" account type
     When clicks on the "privacy_preferences_movistar_entrypoint" entrypoint
     Then the "Privacy Preferences Movistar" internal webview is displayed
      And the "Preferencias de privacidad" header is displayed
      And waits until the "loading_spinner" element is not visible
      And the "consents_list" list is displayed
      And each element in the "consents_list" list has the "title" field
      And each element in the "consents_list" list has the "description" field
      And each element in the "consents_list" list has the "link" field with "Más info" text
      And clicks on the "navigation_top_bar.back_button" button
      And the "Privacy Preferences" page is displayed

  @jira.<jira_id> @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120455 @jira.link.relates_to.NOV-148151 @mobile @moves @no_automatable @regression
  Scenario Outline: A Legado user without pending consents will see all the consents after accessing to the Privacy preferences screen
    Given user has a "legado" account type
      And user has a "<role_type>" role
      And user does not have any "pending" consent
     Then the "Preferencias de privacidad" header is displayed
      And the "consents_description" textfield with "<description>" text is displayed
      And the "privacy" link with "www.movistar.es/privacidad" text is displayed
      And the "consents_list" list is displayed
      And each element in the "consents_list" list has the "title" field
      And each element in the "consents_list" list has the "description" field
      And each element in the "consents_list" list has the "switch" field
      And each element in the "consents_list" list has the "link" link with "Más información" text

    Examples:
          | role_type   | description                                                                                                                                                                                                                                                                                    | jira_id    |
          | admin       | En Movistar nos importa la seguridad de tus datos y el control de tu privacidad, por ello puedes decidir con qué finalidad quieres que tratemos tu información. Más información sobre privacidad en www.movistar.es/privacidad                                                                 | QANOV-8219 |
          | admin-light | En Movistar nos importa la seguridad de tus datos y el control de tu privacidad, por ello puedes decidir con qué finalidad quieres que tratemos tu información. Configura aquí la privacidad de los datos asociados a tu línea. Más información sobre privacidad en www.movistar.es/privacidad | QANOV-8220 |

  @jira.QANOV-27035 @android @deprecate_profile_moves @ios @jira.cv.11.2 @jira.dv.Future @jira.link.relates_to.NOV-129713
  @mobile @moves @no_automatable @regression
  Scenario: A Legado user can see more information about privacy Profile
    Given user has a "legado" account type
     When waits until the "privacy_area_link" element is visible
      And clicks on the "privacy_area_link" link
     Then the external webview is displayed
      And clicks on the native "back" button
      And the "Privacy Preferences" internal webview is displayed

  @jira.QANOV-8222 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120456 @mobile @moves @no_automatable @regression
  Scenario: A Legado user with pending consents will see them within the consents list
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "pending" consent
     Then looks for an element in the "consents_list" list having the "label" field with "PENDIENTE" text and "orange" color
      And the "[CONTEXT:consents_list.element.manage]" button with "Gestionar" text is displayed

  @jira.QANOV-8223 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120457 @mobile @moves @no_automatable @regression
  Scenario: A Legado user can manage a pending consent
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "pending" consent
     When looks for an element in the "consents_list" list having the "label" field with "PENDIENTE" text and "orange" color
      And clicks on the "[CONTEXT:consents_list.element.manage]" button
     Then the "Preference Detail" internal webview is displayed
      And the "Detalle de la preferencia" header is displayed
      And the "description" textfield is displayed
      And the "accept" button with "Si" text is displayed
      And the "cancel" button with "No" text is displayed

  @jira.QANOV-8224 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120466 @mobile @moves @no_automatable @regression
  Scenario: A Legado user can deactivate a pending consent
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "pending" consent
     When looks for an element in the "consents_list" list having the "label" field with "PENDIENTE" text and "orange" color
      And clicks on the "[CONTEXT:consents_list.element.manage]" button
      And the "Preference Detail" internal webview is displayed
      And clicks on the "cancel" button
     Then the "Privacy Preferences" internal webview is displayed
      And the "[CONTEXT:consents_list.element.label]" textfield with "PENDIENTE" text is not displayed
      And the "[CONTEXT:consents_list.element.switch]" switch is disabled
      And the "save" button with "Guardar cambios" text is displayed

  @jira.QANOV-8225 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120458 @mobile @moves @no_automatable @regression
  Scenario: A Legado user can activate a pending consent
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "pending" consent
     When looks for an element in the "consents_list" list having the "label" field with "PENDIENTE" text and "orange" color
      And clicks on the "[CONTEXT:consents_list.element.manage]" button
      And the "Preference Detail" internal webview is displayed
      And clicks on the "accept" button
     Then the "Privacy Preferences" internal webview is displayed
      And the "[CONTEXT:consents_list.element.label]" textfield with "PENDIENTE" text is not displayed
      And the "[CONTEXT:consents_list.element.switch]" switch is enabled
      And the "save" button with "Guardar cambios" text is displayed

  @jira.<jira_id> @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120459 @mobile @moves @no_automatable @regression
  Scenario Outline: Update of consent is done successfully: confirmation screen is displayed
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "pending" consent
     When looks for an element in the "consents_list" list having the "label" field with "PENDIENTE" text and "orange" color
      And clicks on the "[CONTEXT:consents_list.element.manage]" button
      And the "Preference Detail" internal webview is displayed
      And clicks on the "<button>" button
      And clicks on the "save" button
     Then the "Confirmation Success" page is displayed
      And the "Confirmación" header is displayed
      And the "success_message" textfield with "Cambios realizados correctamente" text is displayed
      And the "back_to_preferences" button with "Volver a las preferencias" text is displayed
      And the "details_link" link with "Ver detalle de los cambios" text is displayed

    Examples:
          | button | jira_id    |
          | accept | QANOV-8226 |
          | cancel | QANOV-8227 |

  @jira.QANOV-8229 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120464 @mobile @moves @no_automatable @regression
  Scenario: User can see the details of the last consent changes
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "pending" consent
     When looks for an element in the "consents_list" list having the "label" field with "PENDIENTE" text and "orange" color
      And clicks on the "[CONTEXT:consents_list.element.manage]" button
      And the "Preference Detail" internal webview is displayed
      And clicks on the "accept" button
      And clicks on the "save" button
      And the "Confirmation Success" page is displayed
      And clicks on the "details_link" link
     Then the "Change Details" page is displayed
      And the "Detalle de los cambios" header is displayed
      And the "description" textfield is displayed

  @jira.QANOV-8230 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120463 @mobile @moves @no_automatable @regression
  Scenario: User goes back to privacy preferences screen from confirmation screen
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "pending" consent
     When looks for an element in the "consents_list" list having the "label" field with "PENDIENTE" text and "orange" color
      And clicks on the "[CONTEXT:consents_list.element.manage]" button
      And the "Preference Detail" internal webview is displayed
      And clicks on the "accept" button
      And clicks on the "save" button
      And the "Confirmation Success" page is displayed
      And clicks on the "back_to_preferences" link
     Then the "Privacy Preferences Movistar" internal webview is displayed

  @jira.QANOV-8231 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120465 @mobile @moves @no_automatable @regression
  Scenario: Update of consent fails: error screen is displayed
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "any" consent
     When looks for an element in the "consents_list" list having the "label" field with "PENDIENTE" text and "orange" color
      And clicks on the "[CONTEXT:consents_list.element.manage]" button
      And the "Preference Detail" internal webview is displayed
      And clicks on the "accept" button
      And clicks on the "save" button
      And there is a general server error
     Then the "Confirmation Error" page is displayed
      And the "Confirmación" header is displayed
      And the "error_message" textfield with "Los cambios no se han podido guardar" text is displayed
      And the "back_to_preferences" button with "Volver a las preferencias" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-8233 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120468 @mobile @moves @no_automatable @regression
  Scenario: A Legado user can deactivate an enabled consent
    Given user has a "legado" account type
      And user has a "activated" consent
     When looks for an element in the "consents_list" list having the "switch" switch enabled
      And clicks on the "[CONTEXT:consents_list.element.switch]" switch
     Then the "[CONTEXT:consents_list.element.switch]" switch is disabled
      And the "save" button is enabled

  @jira.QANOV-8234 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120467 @mobile @moves @no_automatable @regression
  Scenario: A Legado user can activate a disabled consent
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "deactivated" consent
     When looks for an element in the "consents_list" list having the "switch" switch disabled
      And clicks on the "[CONTEXT:consents_list.element.switch]" switch
     Then the "[CONTEXT:consents_list.element.switch]" switch is enabled
      And the "save" button is enabled

  @jira.QANOV-8235 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120491 @mobile @moves @no_automatable @regression
  Scenario: A Legado user can see more information about a consent
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "not pending" consent
     When clicks on the "link" field of the element in the "any" position of the "consents_list" list
     Then the "Preference Detail" internal webview is displayed
      And the "Detalle de la preferencia" header is displayed
      And the "description" textfield is displayed

  @jira.<jira_id> @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120469 @mobile @moves @no_automatable @regression
  Scenario Outline: Save button is only enabled when there is a change in any consent switch
    Given user has a "legado" account type
      And user has a "admin" role
      And user has a "<status>" consent
     When looks for an element in the "consents_list" list having the "switch" switch "<switch_status>"
      And clicks on the "[CONTEXT:consents_list.element.switch]" switch
      And the "save" button is enabled
      And clicks on the "[CONTEXT:consents_list.element.switch]" switch
     Then the "save" button is disabled

    Examples:
          | switch_status | jira_id    |
          | enabled       | QANOV-8237 |
          | disabled      | QANOV-8239 |

  @jira.QANOV-8240 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-120493 @mobile @moves @no_automatable @regression
  Scenario: Minor user can't see the options to manage consents
    Given user has a "legado" account type
      And user has a "admin-light" role
      And user is "under-age"
     Then the "User Escalation" page is displayed
      And the "message" textfield with "Esta opción no la tienes habilitada. Para cualquier gestión relativa al tratamiento de tus datos debe hacerlo el responsable de esta línea, llamando desde su línea al 224407 o enviando un email a la dirección TE_datos@telefónica.com" text is displayed
      And the "accept" button with "Accede como titular" text is displayed

  @jira.QANOV-8241 @android @deprecate_profile_moves @impeded_legacy @ios @jira.cv.11.2 @jira.dv.Future
  @jira.link.relates_to.NOV-162006 @mobile @moves @no_automatable @regression
  Scenario: A Legado user without consents will see the empty case when accessing to the Privacy preferences screen
    Given user has a "legado" account type
      And user has a "admin" role
      And user does not have consents
     Then the "Privacy Preferences Empty" page is displayed
      And the "Preferencias de privacidad" header is displayed
      And the "consents_title" textfield with "No tienes preferencias que gestionar" text is displayed
      And the "consents_body" textfield with "Cuando tengas preferencias que gestionar, podrás hacerlo aquí" text is displayed
      And the "consents_list" list is not displayed
