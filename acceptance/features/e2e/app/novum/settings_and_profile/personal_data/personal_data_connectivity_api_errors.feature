# -*- coding: utf-8 -*-
@jira.QANOV-126728
Feature: Personal data with connectivity or API errors

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
