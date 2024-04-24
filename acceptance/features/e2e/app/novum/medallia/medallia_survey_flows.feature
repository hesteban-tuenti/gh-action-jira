# -*- coding: utf-8 -*-
@jira.QANOV-109113 @not_hardening
Feature: Medallia Survey Flows


  @jira.QANOV-109114 @no_automatable @android @ios @mobile @jira.cv.12.5 @moves
  @sanity @impeded_mock
  Scenario: A moves user who was on the Medallia Survey Popup can see all the survey options
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    Given user has a "telco" account type
      And user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     Then the "title" textfield with "Tu opinión importa" text is displayed
      And the "message" textfield with "Para mejorar nuestro servicio nos gustaría saber tu opinión, tan sólo te llevará dos minutos. ¡Muchas gracias!" text is displayed
      And the "give_feedback" button with "Dar mi opinión" text is displayed
      And the "not_now" button with "Más tarde" text is displayed
      And the "close" button with "No, gracias" text is displayed

  @jira.QANOV-109115 @android @impeded_mock @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression
  Scenario: A moves user who was on the Medallia Survey Popup taps on the "Más tarde" option but there is an API error: Pup up will be closed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    Given user has a "telco" account type
      And user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "not_now" button
     Then the "Previous" page is displayed
      And the "Medallia Survey" popup is not displayed

  @jira.QANOV-109116 @android @impeded_mock @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression
  Scenario: A moves user who was on the Medallia Survey Popup taps on the "No, gracias" option: Pup up will be closed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    Given user has a "telco" account type
      And user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "close" button
     Then the "Previous" page is displayed
      And the "Medallia Survey" popup is not displayed

  @jira.QANOV-109117 @android @impeded_mock @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression
  Scenario: A moves user who was on the Medallia Survey Popup taps on the "Dar mi opinión" option but there is an API error: Negative Feedback page is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    Given user has a "telco" account type
      And user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "give_feedback" button
      And there is an API error
     Then the "Feedback Error" page is displayed
      And the "error_title" textfield with "Algo ha ido mal" text is displayed
      And the "error_message" textfield with "No se ha podido cargar el contenido" text is displayed
      And the "retry" button with "Reintentar" text is displayed

  @jira.QANOV-109118 @android @impeded_mock @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression
  Scenario: A moves user who accessed to the Negative Feedback page from the Medallia Survey popup taps on the Retry button: Medallia Survey page is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    Given user has a "telco" account type
      And user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "give_feedback" button
      And there is an API error
      And the "Feedback Error" page is displayed
      And clicks on the "retry" button
     Then the "Medallia Survey" page is displayed
      And the "Tu opinión nos importa" header is displayed

  @jira.QANOV-109119 @android @impeded_mock @ios @jira.cv.12.5 @mobile @moves @no_automatable @smoke
  Scenario: A moves user who was on the Medallia Survey Popup taps on the "Dar mi opinión" option: Medallia Survey page is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    Given user has a "telco" account type
      And user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "give_feedback" button
     Then the "Medallia Survey" page is displayed
      And the "Tu opinión nos importa" header is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-109120 @android @impeded_mock @ios @jira.cv.12.5 @mobile @moves @no_automatable @regression
  Scenario: A moves user who was on the Medallia Survey page can leave the flow in any moment without saving changes
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    Given user has a "telco" account type
      And user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "give_feedback" button
      And the "Medallia Survey" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Previous" page is displayed
      And the "Medallia Survey" popup is not displayed

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @sanity
  Scenario Outline: A <product> user who was on the Medallia Survey popup can see all the survey options
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated.
    Given user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     Then the "title" textfield with "Let us know what you think" text is displayed
      And the "message" textfield with "It only takes aminute and will help us to improve our app" text is displayed
      And the "give_feedback" button with "Provide Feedback" text is displayed
      And the "not_now" button with "Maybe Later" text is displayed
      And the "close" button with "No Thanks" text is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271541 |
          | o2de    | Future | QANOV-271542 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A <product> user who was on the Medallia Survey popup taps on the "<option>" option: Popup will be closed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated.
    Given user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "<button>" button
     Then the "Medallia Survey" popup is not displayed

    Examples:
          | product | cv     | option      | button  | jira_id      |
          | blaude  | 14.3   | Maybe Later | not_now | QANOV-271543 |
          | blaude  | 14.3   | No Thanks   | close   | QANOV-271544 |
          | o2de    | Future | Maybe Later | not_now | QANOV-271545 |
          | o2de    | Future | No Thanks   | close   | QANOV-271546 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A <product> user who was on the Medallia Survey Popup taps on the "Provide Feedback" option but there is an API error: Error Feedback page is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated.
    Given user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "give_feedback" button
      And there is an API error
     Then the "Feedback Error" page is displayed
      And the "error_title" textfield with "Something went wrong" text is displayed
      And the "error_message" textfield with "The content couldn't be loaded" text is displayed
      And the "retry" button with "Retry" text is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271547 |
          | o2de    | Future | QANOV-271548 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @mobile @no_automatable @regression
  Scenario Outline: A <product> user who accessed to the Error Feedback page from the Medallia Survey popup taps on the Retry button: Medallia Survey page is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated
    Given user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "give_feedback" button
      And there is an API error
      And the "Feedback Error" page is displayed
      And clicks on the "retry" button
     Then the "Medallia Survey" page is displayed
      And the "TBD" header is displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271549 |
          | o2de    | Future | QANOV-271550 |

  @jira.<jira_id> @<product> @TBD @android @ios @jira.cv.<cv> @mobile @no_automatable @smoke
  Scenario Outline: A <product> user who was on the Medallia Survey Popup taps on the "Provide Feedback" option: Medallia Survey page is displayed
    Keep in mind that this surveys just will be displayed if the user is on an environment with the quarantine deactivated.
    Given user makes an action that triggers a medallia survey
      And user is in the "Medallia Survey" popup
     When clicks on the "give_feedback" button
     Then the "Medallia Survey" page is displayed
      And the "TBD" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Previous" page is displayed
      And the "Medallia Survey" popup is not displayed

    Examples:
          | product | cv     | jira_id      |
          | blaude  | 14.3   | QANOV-271551 |
          | o2de    | Future | QANOV-271552 |
