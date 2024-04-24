# -*- coding: utf-8 -*-
@jira.QANOV-126728
Feature: Personal data with connectivity or API errors


  @jira.QANOV-7437 @android @cert2 @deprecate_profile_moves @impeded_mock @ios @jira.cv.10.6 @jira.dv.Future
  @jira.link.relates_to.NOV-91235 @live @mobile @moves @next @no_automatable @regression
  Scenario: A user access to "Contact method" screen and API error occurs: API error screen will be shown
    commented_tags="@depends_on.NOV-47205"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user is in the "Security And Privacy" page
     When clicks on the "contact_method" entrypoint
      And there is an API error
     Then the "api_error_message" textfield with "[LANG:profile.security_and_privacy.contact_method.api_error_message]" text is displayed
      And the "reload" button is displayed

  @jira.QANOV-7446 @android @automatic @cert2 @deprecate_profile_moves @jira.cv.10.6 @jira.dv.Future
  @jira.link.relates_to.NOV-81207 @live @mobile @moves @next @regression
  Scenario: A user without data connectivity cannot access to "Contact method" screen in Android devices
    commented_tags="@depends_on.NOV-47205"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user turns on the Airplane mode
      And waits until the "No Connectivity Warning" warning is not displayed
      And user is in the "Security And Privacy" page
     When clicks on the "contact_method_entrypoint" entrypoint
     Then the "No Connectivity Webview" internal webview is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-169536 @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.6 @jira.dv.Future
  @jira.link.relates_to.NOV-81207 @live @mobile @moves @next @regression
  Scenario: A user without data connectivity cannot access to "Contact method" screen in iOS devices
    commented_tags="@depends_on.NOV-47205"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user turns on the Airplane mode
      And user is in the "Security And Privacy" page
     When clicks on the "contact_method_entrypoint" entrypoint
     Then the "No Connectivity Webview" page is displayed
      And the "no_connectivity_title" textfield with "[LANG:noconnectivity.no_connectivity_title]" text is displayed
      And the "no_connectivity_text" textfield with "[LANG:noconnectivity.no_connectivity_text]" text is displayed
      And the "retry_button" button with "[LANG:noconnectivity.retry_button]" text is displayed

  @jira.QANOV-59918 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.1
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @manual @mobile @moves @regression
  Scenario: A telco admin user cannot modify the email if an error happens
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Profile" page
     When clicks on the "email_address_entrypoint" entrypoint
      And the "Email Contact" page is displayed
      And fills the "email_input_field" inputtext with the "abc1@gmail.com" text
      And clicks on the "email_save" button
      And there is an API error
     Then the "Feedback Ko" page is displayed
      And the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield with "Tu solicitud no ha podido ser enviada" text is displayed
      And the "negative_feedback_subtitle" textfield with "Vuelve a intentarlo en unos minutos. Disculpa las molestias." text is displayed
      And the "retry_button" button with "Reintentar" text is displayed
      And the "back_button" button with "Volver a mi perfil" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-59940 @android @automation.pending_mock @impeded_mock @ios @jira.cv.12.1
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.parent_test_plan.QANOV-56957 @mobile @moves @no_automatable
  @regression
  Scenario: A user cannot modify the phone number if an error happens
    internal_checkpoint="If the user does not have a contact email saved, he will not be able to make any management on their contact phones (or even consult)."
    other_affected_versions="2021-09"
    Given user has a "telco" account type
      And user has a "admin" role
      And user is in the "Profile" page
      And user has an email stored in the personal information
     When clicks on the "phone_number_entrypoint" entrypoint
      And the "Phone Number Contact" page is displayed
      And fills the "phone_input_field" inputtext with the "675877999" text
      And clicks on the "phone_save" button
      And there is an API error
     Then the "Feedback Ko" page is displayed
      And the "error_title" textfield with "Tu solicitud no ha podido ser enviada" text is displayed
      And the "error_message" textfield with "Vuelve a intentarlo en unos minutos. Disculpa las molestias" text is displayed
      And the "retry_button" button with "Reintentar" text is displayed
      And the "back_to_account" button with "Volver a mi perfil" text is displayed
      And the "navigation_top_bar.back_button" button is displayed
