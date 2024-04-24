# -*- coding: utf-8 -*-
@jira.QANOV-2163
Feature: Access to ticketing


  @jira.QANOV-3478 @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-124925 @mobile @moves @no_automatable @regression
  Scenario: A Legado user can access to the OB's auto-diagnosis webview from the Support tab
    Given user has a "legado" account type
      And user has a "admin" role
      And user is in the "Support" page
     When clicks on the "diagnostics_module.button" button
     Then the browser webview is displayed
      And the header that contains the "Solucionar avería" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Support" page is displayed

  @jira.QANOV-129593 @android @cert2 @impeded_legacy @ios @jira.cv.12.5 @live @mobile @moves @next @no_automatable
  @regression
  Scenario: Admin-light legacy prepay user can tap on the diagnostics button: "Login Escalation Required" page is displayed
    other_affected_versions="2021-34-B"
    Given user has a "admin-light" role
      And user has a "legado" account type
      And user has the matching subscription selected in the account
      And user is in the "Support" page
     When clicks on the "diagnostics_module.button" button
     Then the "Login Escalation Required" page is displayed
      And the header that contains the "Accede como titular" text is displayed
      And the "title" textfield with "Inicia sesión con contraseña" text is displayed
      And the "info" textfield with "Para consultar esta información necesitas acceder con el documento de identidad del titular y su contraseña." text is displayed
      And the "access_with_password" button with "Inicia sesión con contraseña" text is displayed

  @jira.QANOV-408263 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: An o2es user can open an incidence
    Given user is in the "Support" page
      And user has the "New Incidence" module configured in CMS for "Support" page
     When clicks on the "new_incidence_module.button" button
     Then the internal webview with "Resuelve tu incidencia" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Support" page is displayed

  @jira.QANOV-408264 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es user without open issues can not see the incidences historical module
    Given user is in the "Support" page
      And user has the "Historical incidences" module configured in CMS for "Support" page
      And user does not have tickets created
     Then the "historical_incidences" module is not displayed

  @jira.QANOV-408266 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es user with open issues can see the incidences historical module
    Given user is in the "Support" page
      And user has the "Historical incidences" module configured in CMS for "Support" page
      And user has tickets created
     Then the "historical_incidences" module is displayed
      And the "historical_incidences.title" textfield with "Histórico de incidencias" text is displayed

  @jira.QANOV-408267 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An o2es user with open issues can open the incidences historical module
    Given user is in the "Support" page
      And user has the "Historical incidences" module configured in CMS for "Support" page
      And user has tickets created
      And clicks on the "historical_incidences" module
     Then the internal webview is displayed

  @jira.QANOV-408268 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: An o2es user without incidences can see the incidences module
    Given user is in the "Support" page
      And user has the "Incidences" module configured in CMS for "Support" page
      And user does not have tickets created
     Then the "incidences_module" module is displayed
      And the "incidences_module.title" textfield with "Incidencias" text is displayed
      And the "incidences_module.description" textfield with "No tienes incidencias abiertas" text is displayed

  @jira.<jira_id> @<ber> @<priority> @android @ios @jira.cv.Future @manual @mobile @o2es
  Scenario Outline: An o2es user with an open incidence can see the incidences module
    Given user is in the "Support" page
      And user has the "Incidences" module configured in CMS for "Support" page
      And user has "1" tickets in "<status>" status
     Then the "incidences_module" module is displayed
      And the "incidences_module.incidence_card.tag" tag with "<tag_text>" text is displayed
      And the "incidences_module.incidence_card.title" textfield is displayed
      And the "incidences_module.incidence_card.description" textfield is displayed
      And the "incidences_module.incidence_card.creation_date" textfield with the "Creada el \d\d/\d\d/20\d\d" format is displayed
      And the "incidences_module.incidence_card.chevron" element is on display

    Examples:
          | status   | tag_text    | priority | ber | jira_id      |
          | received | Recibida    | sanity   | ber | QANOV-408269 |
          | ongoing  | En revisión | smoke    |     | QANOV-408270 |

  @jira.QANOV-408271 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: An o2es user with >1 incidences can see the incidences module
    The max num of cards to be displayed is 15
    Given user is in the "Support" page
      And user has the "Incidences" module configured in CMS for "Support" page
      And user has ">1" tickets in "open" status
     Then the "incidences_module" module is displayed
      And the "incidences_module" carousel has "[CONTEXT:user.open_incidences]" cards

  @jira.QANOV-408272 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: An o2es user can open the incidences OB webview from the incidences module
    Given user is in the "Support" page
      And user has the "Incidences" module configured in CMS for "Support" page
     When clicks on the "incidences_module" module
     Then the internal webview with "Tus incidencias" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Support" page is displayed

  @jira.QANOV-408273 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke @tbd
  Scenario: An o2es user with tickets can see an incidence detail from the OB webview
    Given user is in the "Support" page
      And user has the "Incidences" module configured in CMS for "Support" page
      And user has tickets created
     When clicks on the "incidences_module" module
      And the "Incidences" internal webview is displayed
      And clicks on any element in the "incidences" list
     Then the internal webview with "tbd" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Incidences" internal webview is displayed
