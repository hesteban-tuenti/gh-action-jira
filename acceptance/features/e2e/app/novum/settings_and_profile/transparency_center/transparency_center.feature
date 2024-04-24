# -*- coding: utf-8 -*-
@jira.QANOV-309086
Feature: Transparency Center

  Actions Before each Scenario:
    Given user is in the "Transparency Center" page


  @jira.QANOV-8242 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.11.12 @jira.dv.Future
  @jira.link.relates_to.NOV-185536 @jira.link.relates_to.NOV-185537 @live @mobile @moves @next @smoke
  Scenario: TELCO user can access to data download
    other_affected_versions="2020-38"
    Note: Webview will display different content per customer role (admin, admin light or user),
    this is something that is not controlled by Novum but by the Aura/4P team.
    Given user has a "telco" account type
     When clicks on the "ask_and_download_entrypoint" entrypoint
     Then the "Ask And Download" internal webview is displayed
      And the "Consulta y descarga de datos" header is displayed
      And the "ask_data_textfield" textfield with "Consulta tus datos" text is displayed
      And the "download_data_button" button with "Descarga tus datos" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Transparency Center" page is displayed

  @jira.QANOV-309087 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.11.12 @jira.dv.Future @live @mobile
  @moves @next @smoke
  Scenario: TELCO user can access to the "Términos y condiciones" page
    other_affected_versions="2020-38"
    internal_checkpoint="Note: Webview will display different content per customer role (admin, admin light or user),
    this is something that is not controlled by Novum but by the Aura/4P team."
    Given user has a "telco" account type
     When clicks on the "terms_and_conditions_entrypoint" entrypoint
     Then the "Terms And Conditions Settings" internal webview is displayed
      And the "Términos y condiciones" header is displayed
      And the "CONDICIONES" string is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Transparency Center" page is displayed

  @jira.QANOV-309088 @android @deprecate_profile_moves @ios @jira.cv.14.3 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-304207 @manual @mobile @moves @smoke
  Scenario: User can acces to the "Preferencias de privacidad" internal webview
    Given user has a "telco" account type
     When clicks on the "privacy_preferences_entrypoint" entrypoint
     Then the "Privacy Preferences" internal webview is displayed
      And the "Preferencias de privacidad" header is displayed
      And the "privacy_preferences_movistar_entrypoint" entrypoint with "Preferencias Movistar" text is displayed
      And the "third_party_consents_entrypoint" entrypoint with "Otras políticas de privacidad" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Transparency Center" page is displayed
