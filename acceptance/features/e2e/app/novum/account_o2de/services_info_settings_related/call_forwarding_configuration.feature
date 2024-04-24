# -*- coding: utf-8 -*-
@jira.QANOV-215135
Feature: Call Forwarding Configuration

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line;home_spot" product in "active" status


  @jira.QANOV-215136 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44456
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A postpay user with "call forwarding" deactivated can access to the "Call Forwarding Configuration" screen
    Given user has the "call_forwarding" service in "deactivated" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "services.call_forwarding_configuration_entrypoint" entrypoint
     Then the "Call Forwarding Configuration" page is displayed
      And the "Anrufe weiterleiten" header is displayed
      And the "title" textfield with "Wähle die Art der Weiterleitung" text is displayed
      And the "description" textfield with "Du kannst deine Einstellungen jederzeit wieder ändern." text is displayed
      And the "call_forwarding.name" textfield with "Anrufe weiterleiten" text is displayed
      And the "call_forwarding.switch" switch is disabled
      And the "permanent_option.name" textfield is not displayed
      And the "permanent_option.radiobutton" button is not displayed
      And the "conditional_option.name" textfield is not displayed
      And the "conditional_option.radiobutton" button is not displayed
      And the "continue_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295722 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-44456
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity @ber
  Scenario: A postpay user with "call forwarding" activated can access to the "Call Forwarding Configuration" screen
    Given user has the "call_forwarding" service in "activated" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "highlighted_services_link" link
      And the "Services" page is displayed
      And clicks on the "services.call_forwarding_configuration_entrypoint" entrypoint
     Then the "Call Forwarding Configuration" page is displayed
      And the "Anrufe weiterleiten" header is displayed
      And the "title" textfield with "Wähle die Art der Weiterleitung" text is displayed
      And the "description" textfield with "Du kannst deine Einstellungen jederzeit wieder ändern." text is displayed
      And the "call_forwarding.name" textfield with "Anrufe weiterleiten" text is displayed
      And the "call_forwarding.switch" switch is enabled
      And the "permanent_option.name" textfield with "Immer weiterleiten" text is displayed
      And the "permanent_option.description" textfield with "Deine Anrufe werden an eine andere Rufnummer oder deine Mailbox weitergeleitet." text is displayed
      And the "permanent_option.radiobutton" button is displayed
      And the "conditional_option.name" textfield with "Bedingte Weiterleitung" text is displayed
      And the "conditional_option.description" textfield with "Abhängig von dem Grund, wieso du nicht erreichbar bist, können verschiedene Optionen zur Weiterleitung gewählt werden." text is displayed
      And the "conditional_option.radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295723 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A postpay user with "call forwarding" activated can deactivate it successfully
    Given user has the "call_forwarding" service in "activated" status
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Call Forwarding Configuration" page
     When clicks on the "call_forwarding.switch" switch
     Then the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine Einstellungen wurden gespeichert." text is displayed
      And the "title" textfield with "Wähle die Art der Weiterleitung" text is displayed
      And the "description" textfield with "Du kannst deine Einstellungen jederzeit wieder ändern." text is displayed
      And the "call_forwarding.name" textfield with "Anrufe weiterleiten" text is displayed
      And the "call_forwarding.switch" switch is disabled
      And the "permanent_option.name" textfield is not displayed
      And the "permanent_option.radiobutton" button is not displayed
      And the "conditional_option.name" textfield is not displayed
      And the "conditional_option.radiobutton" button is not displayed
      And the "continue_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295724 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @jira.link.depends_on.QANOV-44456
  @manual @mobile @o2de @regression
  Scenario: A postpay user tries to change the call forwarding switch but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to change the
    'call forwarding' switch without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has tried to change the call forwarding "0" times without success
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Call Forwarding Configuration" page
     When clicks on the "call_forwarding.switch" switch
      And there is an error changing the call forwarding
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-295725 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-295724 @manual @mobile @o2de @regression
  Scenario: Postpay user can close the error warning after trying to change the call forwarding switch without success
    Given user has tried to change the call forwarding "0" times without success
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Call Forwarding Configuration" page
     When clicks on the "call_forwarding.switch" switch
      And there is an error changing the call forwarding
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Call Forwarding Configuration" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-295726 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @jira.link.depends_on.QANOV-44456
  @manual @mobile @o2de @regression
  Scenario: A postpay user tries to change the call forwarding switch but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to change the
    'call forwarding' switch without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has tried to change the call forwarding "1" times without success
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Call Forwarding Configuration" page
     When clicks on the "call_forwarding.switch" switch
      And there is an error changing the call forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Ein allgemeiner Fehler ist aufgetreten" text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295731 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A postpay user who has never configured the permanent forwarding can access to the "Permanent forwarding" screen
    The API returns an is_editable field to indicate if the user can change the permanent forwarding.
    Given user has never configured the "permanent_forwarding" service
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "permanent_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "select_option_entrypoint" entrypoint with "Whähle eine Option" text is displayed

  @jira.QANOV-295732 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual
  @mobile @o2de @smoke
  Scenario: A postpay user who configured the permanent forwarding in the past but now it is deactivated can access to the "Permanent forwarding" screen
    If the last time that the permanent forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change the permanent forwarding.
    Given user has activated the "permanent_forwarding" service in the past
      And user has the "permanent_forwarding" service in "deactivated" status
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "permanent_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "permanent_forwarding.title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "permanent_forwarding.switch" switch is disabled
      And the "select_option_entrypoint" entrypoint with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-215138 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @sanity
  Scenario: A postpay user who has the permanent forwarding activated can access to the "Permanent forwarding" screen
    If the last time that the permanent forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change the permanent forwarding.
    Given user has the "permanent_forwarding" service in "activated" status
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "permanent_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "permanent_forwarding.title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "permanent_forwarding.switch" switch is enabled
      And the "select_option_entrypoint" entrypoint with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295733 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295731 @manual @mobile @o2de @regression
  Scenario: A postpay user can select the "another number" option when configuring the permanent forwarding for the first time
    Given user has never configured the "permanent_forwarding" service
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
     Then the "Immer weiterleiten" header is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Wohin sollen deine Anrufe weitergeleitet werden?" text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext with the "(Rufnummer \(optional\)|Rufnummer)" placeholder is displayed
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295734 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295733 @manual @mobile @o2de @regression
  Scenario: A postpay user can select the "mailbox" option when configuring the permanent forwarding for the first time
    Given user has never configured the "permanent_forwarding" service
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "mailbox_option.radiobutton" button
     Then the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Wohin sollen deine Anrufe weitergeleitet werden?" text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext is not displayed
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-215139 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295734 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: A postpay user who has never configured the "permanent_forwarding" service can set up the permanent forwarding to mailbox successfully
    If the permanent forwarding is activated, the conditional forwarding will be automatically deactivated by the OB.
    Given user has never configured the "permanent_forwarding" service
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "mailbox_option.radiobutton" button
      And clicks on the "save_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-215140 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295734 @manual @mobile @o2de @regression
  Scenario: A postpay user who has never configured the "permanent_forwarding" service can set up the permanent forwarding to mailbox unsuccessfully
    Given user has never configured the "permanent_forwarding" service
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "mailbox_option.radiobutton" button
      And clicks on the "save_button" button
      And there is an error setting up the permanent forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-215143 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295733 @manual @mobile @o2de @smoke
  Scenario: A postpay user who has never configured the "permanent_forwarding" service can set up the permanent forwarding to another number successfully
    If the permanent forwarding is activated, the conditional forwarding will be automatically deactivated by the OB.
    Given user has never configured the "permanent_forwarding" service
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-215144 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295733 @manual @mobile @o2de @regression
  Scenario: A postpay user who has never configured the "permanent_forwarding" service can set up the permanent forwarding to another number unsuccessfully
    Given user has never configured the "permanent_forwarding" service
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
      And there is an error setting up the permanent forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-295735 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215138 @manual @mobile @o2de @regression
  Scenario: A postpay user who configured the permanent forwarding in the past with the "mailbox" option can access to edit it
    Given user has configured the "permanent_forwarding" service in the past with the "mailbox" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
     Then the "Permanent Forwarding Select Option" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Wohin sollen deine Anrufe weitergeleitet werden?" text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext is not displayed
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Save" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295736 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215138 @manual @mobile @o2de @regression
  Scenario: A postpay user who configured the permanent forwarding in the past with the "another_number" option can access to edit it
    Given user has configured the "permanent_forwarding" service in the past with the "another_number" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
     Then the "Permanent Forwarding Select Option" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Wohin sollen deine Anrufe weitergeleitet werden?" text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext with the "Rufnummer" placeholder is displayed
      And the "another_number_option.phone_number_inputtext" inputtext is not empty
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Save" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-215179 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215138 @manual @mobile @o2de @regression
  Scenario: A postpay user who configured the permanent forwarding in the past cannot change it without making any change
    Given user has configured the "permanent_forwarding" service in the past with the "any" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "save_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.QANOV-215138 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user can tap on the back button after making a change in the Permanent Forwarding configuration: a popup is diplayed on <client> device
    Given user has configured the "permanent_forwarding" service in the past with the "any" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "00" text
      And clicks on the <back_button> button
     Then the "Call Forwarding Configuration Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen Ihre Eingaben verloren." text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | back_button                      | continue_button | cancel_button | jira_id      |
          | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-215181 |
          | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-215183 |

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user decides to continue with the "Permanent Forwarding Configuration" flow after seeing the cancellation popup on <client> device
    Given user has configured the "permanent_forwarding" service in the past with the "any" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "00" text
      And clicks on the <back_button> button
      And the "Call Forwarding Configuration Cancellation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Permanent Forwarding Select Option" page is displayed

    Examples:
          | client  | back_button                      | depends_on   | jira_id      |
          | android | native "back"                    | QANOV-215181 | QANOV-215185 |
          | ios     | "navigation_top_bar.back_button" | QANOV-215183 | QANOV-215187 |

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user decides to cancel the "Permanent Forwarding Configuration" flow after seeing the cancellation popup on <client> device
    Given user has configured the "permanent_forwarding" service in the past with the "any" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "00" text
      And clicks on the <back_button> button
      And the "Call Forwarding Configuration Cancellation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Permanent Forwarding Configuration" page is displayed

    Examples:
          | client  | back_button                      | depends_on   | jira_id      |
          | android | native "back"                    | QANOV-215181 | QANOV-215189 |
          | ios     | "navigation_top_bar.back_button" | QANOV-215183 | QANOV-295737 |

  @jira.QANOV-295738 @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295735
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: A postpay user who configured the permanent forwarding in the past with the "mailbox" option can change it to the "another_number" option successfully
    Given user has configured the "permanent_forwarding" service in the past with the "mailbox" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "continue_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-295739 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295735 @manual @mobile @o2de @regression
  Scenario: A postpay user who configured the permanent forwarding in the past with the "mailbox" option can change it to the "another_number" option unsuccessfully
    Given user has configured the "permanent_forwarding" service in the past with the "mailbox" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "continue_button" button
      And there is an error setting up the permanent forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-295740 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295736 @manual @mobile @o2de @smoke
  Scenario: A postpay user who configured the permanent forwarding in the past with the "another_number" option can change it to the "mailbox" option successfully
    Given user has configured the "permanent_forwarding" service in the past with the "another_number" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-295741 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295736 @manual @mobile @o2de @regression
  Scenario: A postpay user who configured the permanent forwarding in the past with the "another_number" option can change it to the "mailbox" option unsuccessfully
    Given user has configured the "permanent_forwarding" service in the past with the "another_number" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option.radiobutton" button
      And clicks on the "continue_button" button
      And there is an error setting up the permanent forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-295742 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295736 @manual @mobile @o2de @smoke
  Scenario: A postpay user who configured the permanent forwarding in the past with the "another_number" option can change the number successfully
    Given user has configured the "permanent_forwarding" service in the past with the "another_number" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And fills the "another_number_option.phone_number_inputtext" inputtext with another number
      And clicks on the "continue_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-295743 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295736 @manual @mobile @o2de @regression
  Scenario: A postpay user who configured the permanent forwarding in the past with the "another_number" option can change the number unsuccessfully
    Given user has configured the "permanent_forwarding" service in the past with the "another_number" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Permanent Forwarding Select Option" page is displayed
      And fills the "another_number_option.phone_number_inputtext" inputtext with another number
      And clicks on the "continue_button" button
      And there is an error setting up the permanent forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-215141 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295733 @jira.link.depends_on.QANOV-295736
  @manual @mobile @o2de @regression
  Scenario: A postpay user who is in the "Permanent Forwarding Select Option" screen cannot set up the permanent forwarding to another number without filling the phone number field
    Given the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "another_number_option.radiobutton" button
      And clears the "another_number_option.phone_number_inputtext" inputtext
      And clicks on the "save_button" button
     Then the "phone_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-215142 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295733 @jira.link.depends_on.QANOV-295736
  @jira.link.detects.O2DE-1634 @manual @mobile @o2de @regression
  Scenario: A postpay user who is in the "Permanent Forwarding Select Option" screen cannot set up the permanent forwarding to another number without inserting a valid phone number
    Given the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "0000" text
      And clicks on the "save_button" button
     Then the "phone_number_error_textfield" textfield with "Diese Telefonnummer ist ungültig. Gib eine gültige Nummer ein" text is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who configured the permanent forwarding in the past with the "<option>" option but now it is deactivated can activate it again successfully
    If the permanent forwarding is activated, the conditional forwarding will be automatically deactivated by the OB.
    Given user has configured the "permanent_forwarding" service in the past with the "<option>" option
      And user has the "permanent_forwarding" service in "deactivated" status
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "permanent_forwarding.switch" switch
     Then the "permanent_forwarding.switch" switch is enabled
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine Einstellungen wurden gespeichert." text is displayed

    Examples:
          | option         | jira_id      |
          | another_number | QANOV-215145 |
          | mailbox        | QANOV-215146 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who configured the permanent forwarding in the past with the "<option>" option but now it is deactivated can activate it again unsuccessfully
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has configured the "permanent_forwarding" service in the past with the "<option>" option
      And user has the "permanent_forwarding" service in "deactivated" status
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "permanent_forwarding.switch" switch
      And there is an error setting up the permanent forwarding
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | option         | jira_id      |
          | another_number | QANOV-295744 |
          | mailbox        | QANOV-295745 |

  @jira.QANOV-295746 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-295744 @jira.link.depends_on.QANOV-295745 @manual
  @mobile @o2de @regression
  Scenario: Postpay user can close the error warning after trying to activate the permanent forwarding without success
    Given user has configured the "permanent_forwarding" service in the past
      And the "permanent_forwarding" service is editable
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "permanent_forwarding.switch" switch
      And there is an error changing the call forwarding
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "error_warning" warning is not displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215138 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who has the permanent forwarding activated with the "<option>" option can deactivate it successfully
    Given user has the "permanent_forwarding" service in "activated" status
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "permanent_forwarding.switch" switch
     Then the "permanent_forwarding.switch" switch is disabled
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine Einstellungen wurden gespeichert." text is displayed

    Examples:
          | option         | jira_id      |
          | another_number | QANOV-295747 |
          | mailbox        | QANOV-295748 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215138 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has the permanent forwarding activated with the "<option>" option can deactivate it unsuccessfully
    Given user has the "permanent_forwarding" service in "activated" status
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "permanent_forwarding.switch" switch
      And there is an error setting up the permanent forwarding
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

    Examples:
          | option         | jira_id      |
          | another_number | QANOV-295749 |
          | mailbox        | QANOV-295750 |

  @jira.QANOV-295751 @android @jira.cv.14.2 @jira.link.depends_on.QANOV-295749 @jira.link.depends_on.QANOV-295750 @manual
  @mobile @o2de @regression
  Scenario: Postpay user can close the error warning after trying to deactivate the permanent forwarding without success
    Given user has the "permanent_forwarding" service in "activated" status
      And the "permanent_forwarding" service is editable
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "permanent_forwarding.switch" switch
      And there is an error changing the call forwarding
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "error_warning" warning is not displayed

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.detects.O2DE-2920 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user activates again the permanent forwarding but leaves the page before seeing the warning message: popup is displayed
    Given user has configured the "permanent_forwarding" service in the past
      And the "permanent_forwarding" service is editable
      And user has the "permanent_forwarding" service in "deactivated" status
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "permanent_forwarding_switch" switch
      And clicks on the <back_button> button
     Then the "Permanent Forwarding Cancellation" popup is displayed
      And the "popup.title" textfield with "Möchtest du wirklich zurückgehen?" text is displayed
      And the "popup.message" textfield with "Warte ein paar Sekunden. Wenn du jetzt zurückgehst, werden deine Änderungen vielleicht nicht gespeichert." text is displayed
      And the "popup.accept" button with "<cancel_button>" text is displayed
      And the "popup.cancel" button with "<continue_button>" text is displayed

    Examples:
          | client  | back_button                      | continue_button | cancel_button | jira_id      |
          | android | native "back"                    | JA              | NEIN          | QANOV-295727 |
          | ios     | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295728 |

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.QANOV-215138 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user deactivates the permanent forwarding but leaves the page before seeing the warning message: popup is displayed
    Given user has the "permanent_forwarding" service in "activated" status
      And the "permanent_forwarding" service is editable
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Permanent Forwarding Configuration" page
     When clicks on the "permanent_forwarding_switch" switch
      And clicks on the <back_button> button
     Then the "Permanent Forwarding Cancellation" popup is displayed
      And the "popup.title" textfield with "Möchtest du den Prozess wirklich abbrechen?" text is displayed
      And the "popup.message" textfield with "Änderungen können eventuell nicht gespeicht werden." text is displayed
      And the "popup.accept" button with "<cancel_button>" text is displayed
      And the "popup.cancel" button with "<continue_button>" text is displayed

    Examples:
          | client  | back_button                      | continue_button | cancel_button | jira_id      |
          | android | native "back"                    | JA              | NEIN          | QANOV-387900 |
          | ios     | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-387901 |

  @jira.QANOV-295729 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295727 @jira.link.depends_on.QANOV-295728
  @jira.link.depends_on.QANOV-387900 @jira.link.depends_on.QANOV-387901 @manual @mobile @o2de @regression
  Scenario: Postpay user decides to continue changing the permanent forwarding switch after seeing the Permanent Forwarding Cancellation popup
    Given user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Permanent Forwarding Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Permanent Forwarding Configuration" page is displayed

  @jira.QANOV-295730 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295727 @jira.link.depends_on.QANOV-295728
  @jira.link.depends_on.QANOV-387900 @jira.link.depends_on.QANOV-387901 @manual @mobile @o2de @regression
  Scenario: Postpay user decides to cancel changing the permanent forwarding switch after seeing the Permanent Forwarding Cancellation popup
    Given user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Permanent Forwarding Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Call Forwarding Configuration" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has never configured the <conditional_type> conditional forwarding can access to the "Conditional forwarding" screen
    The API returns an is_editable field to indicate if the user can change eachh of the conditional forwardings.
    Given user has never configured the "<conditional_type>_conditional_forwarding" service
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "conditional_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Bedingte Weiterleitung einstellen" text is displayed
      And the "<conditional_type>.title" textfield with "<title>" text is displayed
      And the "<conditional_type>.switch" switch is not displayed
      And the "<conditional_type>.select_option_entrypoint" entrypoint with "Wähle eine Option" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | conditional_type | title                    | jira_id      |
          | busy             | Wenn Handy besetzt...    | QANOV-215147 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295850 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295851 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has configured the <conditional_type> conditional forwarding in the past but now it is deactivated can access to the "Conditional forwarding" screen
    If the last time that the conditional forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change eachh of the conditional forwardings.
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And user has the "<conditional_type>_conditional_forwarding" service in "deactivated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "conditional_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Bedingte Weiterleitung einstellen" text is displayed
      And the "<conditional_type>.title" textfield with "<title>" text is displayed
      And the "<conditional_type>.switch_title" textfield with "Anrufe weiterleiten" text is displayed
      And the "<conditional_type>.switch" switch is disabled
      And the "<conditional_type>.select_option_entrypoint" entrypoint with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | conditional_type | title                    | jira_id      |
          | busy             | Wenn Handy besetzt...    | QANOV-295752 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295753 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295754 |

  @jira.<jira_id> @<test_priority> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile
  @o2de
  Scenario Outline: A postpay user who has the <conditional_type> conditional forwarding activated can access to the "Conditional forwarding" screen
    If the last time that the conditional forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change eachh of the conditional forwardings.
    Given user has the "<conditional_type>_conditional_forwarding" service in "activated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "conditional_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Bedingte Weiterleitung einstellen" text is displayed
      And the "<conditional_type>.title" textfield with "<title>" text is displayed
      And the "<conditional_type>.switch_title" textfield with "Anrufe weiterleiten" text is displayed
      And the "<conditional_type>.switch" switch is enabled
      And the "<conditional_type>.select_option_entrypoint" entrypoint with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | conditional_type | title                    | test_priority | jira_id      |
          | busy             | Wenn Handy besetzt...    | sanity        | QANOV-295755 |
          | no_available     | Wenn nicht erreichbar... | regression    | QANOV-295756 |
          | no_answer        | Wenn keine Antwort...    | regression    | QANOV-295757 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user can select the "another number" option when configuring the "<conditional_type>" conditional forwarding
    Given the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
     Then the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "<title>" text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext with the "Rufnummer" placeholder is displayed
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | conditional_type | title                                    | depends_on                             | jira_id      |
          | busy             | Bedingte Weiterleitung einstellen        | QANOV-215147:QANOV-295752:QANOV-295755 | QANOV-215148 |
          | no_available     | Anrufweiterleitung wenn nicht erreichbar | QANOV-215147:QANOV-295753:QANOV-295756 | QANOV-215149 |

  @jira.QANOV-215150 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215147 @jira.link.depends_on.QANOV-295754
  @jira.link.depends_on.QANOV-295757 @manual @mobile @o2de @regression
  Scenario: A postpay user can select the "another number" option when configuring the "no_answer" conditional forwarding
    Given the "no_answer_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "no_answer.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
     Then the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Anrufweiterleitung bei keiner Antwort" text is displayed
      And the "time_selector" selector is displayed
      And the "time_selector_placeholder" textfield with "Zeiteinstellung" text is displayed
      And the "time_selector_description" textfield with "Wähle aus, wann die Weiterleitung erfolgen soll." text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext with the "Rufnummer" placeholder is displayed
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user can select the "mailbox" option when configuring the "<conditional_type>" conditional forwarding
    Given the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option.radiobutton" button
     Then the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "<title>" text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext is not displayed
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | conditional_type | title                                    | depends_on                             | jira_id      |
          | busy             | Bedingte Weiterleitung einstellen        | QANOV-215147:QANOV-295752:QANOV-295755 | QANOV-215151 |
          | no_available     | Anrufweiterleitung wenn nicht erreichbar | QANOV-215147:QANOV-295753:QANOV-295756 | QANOV-215152 |

  @jira.QANOV-215153 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215147 @jira.link.depends_on.QANOV-295754
  @jira.link.depends_on.QANOV-295757 @manual @mobile @o2de @regression
  Scenario: A postpay user can select the "mailbox" option when configuring the "no_answer" conditional forwarding
    Given the "no_answer_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "no_answer.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option.radiobutton" button
     Then the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Anrufweiterleitung bei keiner Antwort" text is displayed
      And the "time_selector" selector is displayed
      And the "time_selector_placeholder" textfield with "Zeiteinstellung" text is displayed
      And the "time_selector_description" textfield with "Wähle aus, wann die Weiterleitung erfolgen soll." text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext is not displayed
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.<jira_id> @02de @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user who is in the "<conditional_type> Conditional Forwarding Select Option" screen cannot set up the conditional forwarding to another number without filling the phone number field
    Given the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And clears the "another_number_option.phone_number_inputtext" inputtext
      And clicks on the "save_button" button
     Then the "phone_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-215148 | QANOV-215161 |
          | no_available     | QANOV-215149 | QANOV-215162 |
          | no_answer        | QANOV-215150 | QANOV-215163 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who is in the "<conditional_type> Conditional Forwarding Select Option" screen cannot set up the conditional forwarding to another number without inserting a valid phone number
    Given the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "0000" text
      And clicks on the "save_button" button
     Then the "phone_number_error_textfield" textfield with "Diese Telefonnummer its ungültig. Gib eine gültige Nummer ein" text is displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-215148 | QANOV-215164 |
          | no_available     | QANOV-215149 | QANOV-215165 |
          | no_answer        | QANOV-215150 | QANOV-215166 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who has never configured the "<conditional_type> conditional forwarding" service can set up it to mailbox successfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "<conditional_type>_conditional_forwarding" service
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option.radiobutton" button
      And clicks on the "save_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-215147 | QANOV-215154 |
          | no_available     | QANOV-295850 | QANOV-215155 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has never configured the "<conditional_type> conditional forwarding" service can set up it to mailbox unsuccessfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "<conditional_type>_conditional_forwarding" service
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option.radiobutton" button
      And clicks on the "save_button" button
      And there is an error setting up the conditional forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-215147 | QANOV-215156 |
          | no_available     | QANOV-295850 | QANOV-215157 |

  @jira.QANOV-215159 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295851 @manual @mobile @o2de @smoke
  Scenario: A postpay user who has never configured the "no_answer conditional_forwarding" service can set up it to mailbox successfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "no_answer_conditional_forwarding" service
      And the "no_answer_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "no_answer.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And selects the "any" option in the "time_selector" select
      And clicks on the "mailbox_option.radiobutton" button
      And clicks on the "save_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-215160 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295851 @manual @mobile @o2de @regression
  Scenario: A postpay user who has never configured the "no_answer conditional_forwarding" service can set up it to mailbox unsuccessfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "no_answer_conditional_forwarding" service
      And the "no_answer_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "no_answer.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And selects the "any" option in the "time_selector" select
      And clicks on the "mailbox_option.radiobutton" button
      And clicks on the "save_button" button
      And there is an error setting up the conditional forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who has never configured the "<conditional_type> conditional forwarding" service can set up it to another number successfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "<conditional_type>_conditional_forwarding" service
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on   | parent_test_plan | jira_id      |
          | busy             | QANOV-215147 | QANOV-437471     | QANOV-215167 |
          | no_available     | QANOV-295850 |                  | QANOV-215168 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has never configured the "<conditional_type> conditional forwarding" service can set up it to another number unsuccessfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "<conditional_type>_conditional_forwarding" service
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
      And there is an error setting up the conditional forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-215147 | QANOV-215170 |
          | no_available     | QANOV-295850 | QANOV-215171 |

  @jira.QANOV-215169 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295851 @manual @mobile @o2de @smoke
  Scenario: A postpay user who has never configured the "no_answer conditional_forwarding" service can set up it to another number successfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "no_answer_conditional_forwarding" service
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "no_answer.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And selects the "any" option in the "time_selector" select
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-215172 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295851 @manual @mobile @o2de @regression
  Scenario: A postpay user who has never configured the "no_answer conditional_forwarding" service can set up it to another number unsuccessfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "no_answer_conditional_forwarding" service
      And the "no_answer_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "no_answer.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And selects the "any" option in the "time_selector" select
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
      And there is an error setting up the conditional forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past cannot change it without making any change
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "continue_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

    Examples:
          | conditional_type | depends_on                | jira_id      |
          | busy             | QANOV-295752:QANOV-295755 | QANOV-215180 |
          | no_available     | QANOV-295753:QANOV-295756 | QANOV-295758 |
          | no_answer        | QANOV-295754:QANOV-295757 | QANOV-295759 |

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user can tap on the back button after making a change in the <conditional_type> conditional forwarding configuration: a popup is diplayed on <client> device
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "00" text
      And clicks on the <back_button> button
     Then the "Call Forwarding Configuration Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | conditional_type | client  | back_button                      | continue_button | cancel_button | depends_on                | jira_id      |
          | busy             | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-295752:QANOV-295755 | QANOV-215182 |
          | busy             | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-295752:QANOV-295755 | QANOV-215184 |
          | no_available     | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-295753:QANOV-295756 | QANOV-295760 |
          | no_available     | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-295753:QANOV-295756 | QANOV-295761 |
          | no_answer        | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-295754:QANOV-295757 | QANOV-295762 |
          | no_answer        | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-295754:QANOV-295757 | QANOV-295763 |

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user decides to continue with the "<conditional_type> conditional forwarding configuration" flow after seeing the cancellation popup on <client> device
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "00" text
      And clicks on the <back_button> button
      And the "Call Forwarding Configuration Cancellation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Conditional Forwarding Select Option" page is displayed

    Examples:
          | conditional_type | client  | back_button                      | depends_on   | jira_id      |
          | busy             | android | native "back"                    | QANOV-215182 | QANOV-215186 |
          | busy             | ios     | "navigation_top_bar.back_button" | QANOV-215184 | QANOV-215188 |
          | no_available     | android | native "back"                    | QANOV-295760 | QANOV-295764 |
          | no_available     | ios     | "navigation_top_bar.back_button" | QANOV-295761 | QANOV-295765 |
          | no_answer        | android | native "back"                    | QANOV-295762 | QANOV-295766 |
          | no_answer        | ios     | "navigation_top_bar.back_button" | QANOV-295763 | QANOV-295767 |

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user decides to cancel the "<conditional_type> conditional forwarding configuration" flow after seeing the cancellation popup on <client> device
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "00" text
      And clicks on the <back_button> button
      And the "Call Forwarding Configuration Cancellation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Conditional Forwarding Configuration" page is displayed

    Examples:
          | conditional_type | client  | back_button                      | depends_on   | jira_id      |
          | busy             | android | native "back"                    | QANOV-215182 | QANOV-295768 |
          | busy             | ios     | "navigation_top_bar.back_button" | QANOV-215184 | QANOV-295769 |
          | no_available     | android | native "back"                    | QANOV-295760 | QANOV-295770 |
          | no_available     | ios     | "navigation_top_bar.back_button" | QANOV-295761 | QANOV-295771 |
          | no_answer        | android | native "back"                    | QANOV-295762 | QANOV-295772 |
          | no_answer        | ios     | "navigation_top_bar.back_button" | QANOV-295763 | QANOV-295773 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past with the "mailbox" option can change it to the "another_number" option successfully
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "mailbox" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "continue_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | ber | depends_on                | jira_id      |
          | busy             | ber | QANOV-295752:QANOV-295755 | QANOV-295774 |
          | no_available     |     | QANOV-295753:QANOV-295756 | QANOV-295775 |
          | no_answer        |     | QANOV-295754:QANOV-295757 | QANOV-295776 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past with the "mailbox" option can change it to the "another_number" option unsuccessfully
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "mailbox" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "continue_button" button
      And there is an error setting up the conditional forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on                | jira_id      |
          | busy             | QANOV-295752:QANOV-295755 | QANOV-295777 |
          | no_available     | QANOV-295753:QANOV-295756 | QANOV-295778 |
          | no_answer        | QANOV-295754:QANOV-295757 | QANOV-295779 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.parent_test_plan.<parent_test_plan>
  @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past with the "another_number" option can change it to the "mailbox" option successfully
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "another_number" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on                | parent_test_plan | jira_id      |
          | busy             | QANOV-295752:QANOV-295755 | QANOV-437471     | QANOV-295780 |
          | no_available     | QANOV-295753:QANOV-295756 |                  | QANOV-295781 |
          | no_answer        | QANOV-295754:QANOV-295757 |                  | QANOV-295782 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past with the "another_number" option can change it to the "mailbox" option unsuccessfully
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "another_number" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option.radiobutton" button
      And clicks on the "continue_button" button
      And there is an error setting up the conditional forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on                | jira_id      |
          | busy             | QANOV-295752:QANOV-295755 | QANOV-295783 |
          | no_available     | QANOV-295753:QANOV-295756 | QANOV-295784 |
          | no_answer        | QANOV-295754:QANOV-295757 | QANOV-295785 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past with the "another_number" option can change the number successfully
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "another_number" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And fills the "another_number_option.phone_number_inputtext" inputtext with another number
      And clicks on the "continue_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on                | jira_id      |
          | busy             | QANOV-295752:QANOV-295755 | QANOV-295786 |
          | no_available     | QANOV-295753:QANOV-295756 | QANOV-295787 |
          | no_answer        | QANOV-295754:QANOV-295757 | QANOV-295788 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past with the "another_number" option can change the number unsuccessfully
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "another_number" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And fills the "another_number_option.phone_number_inputtext" inputtext with another number
      And clicks on the "continue_button" button
      And there is an error setting up the conditional forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | conditional_type | depends_on                | jira_id      |
          | busy             | QANOV-295752:QANOV-295755 | QANOV-295789 |
          | no_available     | QANOV-295753:QANOV-295756 | QANOV-295790 |
          | no_answer        | QANOV-295754:QANOV-295757 | QANOV-295791 |

  @jira.QANOV-295792 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295754 @jira.link.depends_on.QANOV-295757
  @manual @mobile @o2de @smoke
  Scenario: A postpay user who configured the no_answer conditional forwarding in the past can change the time setting successfully
    Given user has configured the "no_answer_conditional_forwarding" service in the past with the "any" option
      And the "no_answer_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "no_answer.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And selects a different option in the "time_selector" select
      And clicks on the "continue_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-295793 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295754 @jira.link.depends_on.QANOV-295757
  @manual @mobile @o2de @regression
  Scenario: A postpay user who configured the no_answer conditional forwarding in the past can change the time setting unsuccessfully
    Given user has configured the "no_answer_conditional_forwarding" service in the past with the "any" option
      And the "no_answer_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "no_answer.select_option_entrypoint" entrypoint
      And the "Conditional Forwarding Select Option" page is displayed
      And selects a different option in the "time_selector" select
      And clicks on the "continue_button" button
      And there is an error setting up the conditional forwarding
     Then the "Call Forwarding Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past but now it is deactivated can activate it again successfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And user has the "<conditional_type>_conditional_forwarding" service in "deactivated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
     Then the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine Einstellungen wurden gespeichert." text is displayed

    Examples:
          | conditional_type | depends_on   | parent_test_plan | jira_id      |
          | busy             | QANOV-295752 | QANOV-437471     | QANOV-215173 |
          | no_available     | QANOV-295753 |                  | QANOV-215174 |
          | no_answer        | QANOV-295754 |                  | QANOV-215175 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past but now it is deactivated can activate it again unsuccessfully
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And user has the "<conditional_type>_conditional_forwarding" service in "deactivated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
      And there is an error setting up the conditional forwarding
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-295752 | QANOV-215176 |
          | no_available     | QANOV-295753 | QANOV-215177 |
          | no_answer        | QANOV-295754 | QANOV-215178 |

  @jira.<jira_id> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Postpay user can close the error warning after trying to activate the <conditional_type> conditional forwarding without success
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
      And there is an error setting up the conditional forwarding
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-215176 | QANOV-295794 |
          | no_available     | QANOV-215177 | QANOV-295795 |
          | no_answer        | QANOV-215178 | QANOV-295796 |

  @jira.<jira_id> @<ber> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @o2de @smoke
  Scenario Outline: A postpay user who has the <conditional_type> conditional forwarding activated can deactivate it successfully
    Given user has the "<conditional_type>_conditional_forwarding" service in "activated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
     Then the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine Einstellungen wurden gespeichert." text is displayed

    Examples:
          | conditional_type | ber | depends_on   | parent_test_plan | jira_id      |
          | busy             | ber | QANOV-295755 | QANOV-437471     | QANOV-295797 |
          | no_available     |     | QANOV-295756 |                  | QANOV-295798 |
          | no_answer        |     | QANOV-295757 |                  | QANOV-295799 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has the <conditional_type> conditional forwarding activated can deactivate it unsuccessfully
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has the "<conditional_type>_conditional_forwarding" service in "activated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
      And there is an error setting up the conditional forwarding
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "There was an error" text is displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-295755 | QANOV-295800 |
          | no_available     | QANOV-295756 | QANOV-295801 |
          | no_answer        | QANOV-295757 | QANOV-295802 |

  @jira.<jira_id> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: Postpay user can close the error warning after trying to deactivate the <conditional_type> conditional forwarding without success
    Given user has the "<conditional_type>_conditional_forwarding" service in "activated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
      And there is an error setting up the conditional forwarding
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-295800 | QANOV-295803 |
          | no_available     | QANOV-295801 | QANOV-295804 |
          | no_answer        | QANOV-295802 | QANOV-295805 |

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user activates again the <conditional_type> conditional forwarding but leaves the page before seeing the warning message: popup is displayed
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And user has the "<conditional_type>_conditional_forwarding" service in "deactivated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
      And clicks on the <back_button> button
     Then the "Conditional Forwarding Cancellation" popup is displayed
      And the "popup.title" textfield with "Möchtest du wirklich zurückgehen?" text is displayed
      And the "popup.message" textfield with "Warte ein paar Sekunden. Wenn du jetzt zurückgehst, werden deine Änderungen vielleicht nicht gespeichert." text is displayed
      And the "popup.accept" button with "<cancel_button>" text is displayed
      And the "popup.cancel" button with "<continue_button>" text is displayed

    Examples:
          | client  | conditional_type | back_button                      | continue_button | cancel_button | depends_on   | jira_id      |
          | android | busy             | native "back"                    | JA              | NEIN          | QANOV-295618 | QANOV-387902 |
          | ios     | busy             | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295618 | QANOV-387903 |
          | android | no_available     | native "back"                    | JA              | NEIN          | QANOV-295619 | QANOV-387904 |
          | ios     | no_available     | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295619 | QANOV-387905 |
          | android | no_answer        | native "back"                    | JA              | NEIN          | QANOV-295620 | QANOV-387906 |
          | ios     | no_answer        | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295620 | QANOV-387907 |

  @jira.<jira_id> @<client> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user deactivates the <conditional_type> conditional forwarding but leaves the page before seeing the warning message: popup is displayed
    Given user has the "<conditional_type>_conditional_forwarding" service in "activated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
      And clicks on the <back_button> button
     Then the "Conditional Forwarding Cancellation" popup is displayed
      And the "popup.title" textfield with "Möchtest du wirklich zurückgehen?" text is displayed
      And the "popup.message" textfield with "Warte ein paar Sekunden. Wenn du jetzt zurückgehst, werden deine Änderungen vielleicht nicht gespeichert." text is displayed
      And the "popup.accept" button with "<cancel_button>" text is displayed
      And the "popup.cancel" button with "<continue_button>" text is displayed

    Examples:
          | client  | conditional_type | back_button                      | continue_button | cancel_button | depends_on   | jira_id      |
          | android | busy             | native "back"                    | JA              | NEIN          | QANOV-295618 | QANOV-387908 |
          | ios     | busy             | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295618 | QANOV-387909 |
          | android | no_available     | native "back"                    | JA              | NEIN          | QANOV-295619 | QANOV-387910 |
          | ios     | no_available     | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295619 | QANOV-387911 |
          | android | no_answer        | native "back"                    | JA              | NEIN          | QANOV-295620 | QANOV-387912 |
          | ios     | no_answer        | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295620 | QANOV-387913 |

  @jira.QANOV-387914 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-387902 @jira.link.depends_on.QANOV-387903
  @jira.link.depends_on.QANOV-387904 @jira.link.depends_on.QANOV-387905 @jira.link.depends_on.QANOV-387906
  @jira.link.depends_on.QANOV-387907 @jira.link.depends_on.QANOV-387908 @jira.link.depends_on.QANOV-387909
  @jira.link.depends_on.QANOV-387910 @jira.link.depends_on.QANOV-387911 @jira.link.depends_on.QANOV-387912
  @jira.link.depends_on.QANOV-387913 @manual @mobile @o2de @regression
  Scenario: Postpay user decides to continue changing the conditional forwarding switch after seeing the Conditional Forwarding Cancellation popup
    Given user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Conditional Forwarding Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Conditional Forwarding Configuration" page is displayed

  @jira.QANOV-387915 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-387902 @jira.link.depends_on.QANOV-387903
  @jira.link.depends_on.QANOV-387904 @jira.link.depends_on.QANOV-387905 @jira.link.depends_on.QANOV-387906
  @jira.link.depends_on.QANOV-387907 @jira.link.depends_on.QANOV-387908 @jira.link.depends_on.QANOV-387909
  @jira.link.depends_on.QANOV-387910 @jira.link.depends_on.QANOV-387911 @jira.link.depends_on.QANOV-387912
  @jira.link.depends_on.QANOV-387913 @manual @mobile @o2de @regression
  Scenario: Postpay user decides to cancel changing the conditional forwarding switch after seeing the Conditional Forwarding Cancellation popup
    Given user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Conditional Forwarding Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Conditional Forwarding Configuration" page is displayed

  @jira.QANOV-215192 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215140 @jira.link.depends_on.QANOV-215144
  @jira.link.depends_on.QANOV-215156 @jira.link.depends_on.QANOV-215157 @jira.link.depends_on.QANOV-215160
  @jira.link.depends_on.QANOV-215170 @jira.link.depends_on.QANOV-215171 @jira.link.depends_on.QANOV-215172
  @jira.link.depends_on.QANOV-295726 @jira.link.depends_on.QANOV-295739 @jira.link.depends_on.QANOV-295741
  @jira.link.depends_on.QANOV-295743 @jira.link.depends_on.QANOV-295777 @jira.link.depends_on.QANOV-295778
  @jira.link.depends_on.QANOV-295779 @jira.link.depends_on.QANOV-295783 @jira.link.depends_on.QANOV-295784
  @jira.link.depends_on.QANOV-295785 @jira.link.depends_on.QANOV-295789 @jira.link.depends_on.QANOV-295790
  @jira.link.depends_on.QANOV-295791 @jira.link.depends_on.QANOV-295793 @manual @mobile @o2de @regression
  Scenario: A postpay user who is in the "Call Forwarding Error Feedback" screen can go back to dashboard
    Given user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Call Forwarding Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-215190 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-215139 @jira.link.depends_on.QANOV-215143
  @jira.link.depends_on.QANOV-215154 @jira.link.depends_on.QANOV-215155 @jira.link.depends_on.QANOV-215159
  @jira.link.depends_on.QANOV-215167 @jira.link.depends_on.QANOV-215168 @jira.link.depends_on.QANOV-215169
  @jira.link.depends_on.QANOV-295738 @jira.link.depends_on.QANOV-295740 @jira.link.depends_on.QANOV-295742
  @jira.link.depends_on.QANOV-295774 @jira.link.depends_on.QANOV-295775 @jira.link.depends_on.QANOV-295776
  @jira.link.depends_on.QANOV-295780 @jira.link.depends_on.QANOV-295781 @jira.link.depends_on.QANOV-295782
  @jira.link.depends_on.QANOV-295786 @jira.link.depends_on.QANOV-295787 @jira.link.depends_on.QANOV-295788
  @jira.link.depends_on.QANOV-295792 @manual @mobile @o2de @regression
  Scenario: A postpay user who is in the "Call Forwarding Success Feedback" screen can go back to the Services screen
    Given user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Call Forwarding Success Feedback" page
     When clicks on the "back_to_services_button" button
     Then the "Services" page is displayed

  @jira.QANOV-295806 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @regression
  Scenario: A postpay user who has never configured the permanent forwarding can access to the "Permanent forwarding" screen when this setting is not editable
    The API returns an is_editable field to indicate if the user can change the permanent forwarding.
    Given user has never configured the "permanent_forwarding" service
      And the "permanent_forwarding" service is not editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "permanent_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Permanent forwarding details" text is displayed
      And the "select_option_textfield" textfield with "Not configured" text is displayed
      And the "select_option_entrypoint" entrypoint is not displayed

  @jira.QANOV-295807 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @regression
  Scenario: A postpay user who configured the permanent forwarding in the past but now it is deactivated can access to the "Permanent forwarding" screen when this setting is not editable
    If the last time that the permanent forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change the permanent forwarding.
    Given user has configured the "permanent_forwarding" service in the past
      And user has the "permanent_forwarding" service in "deactivated" status
      And the "permanent_forwarding" service is not editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "permanent_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Permanent forwarding details" text is displayed
      And the "permanent_forwarding.tag" textfield with "Nicht aktiv" text is displayed
      And the "permanent_forwarding.title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "permanent_forwarding.switch" switch is not displayed
      And the "select_option_textfield" textfield with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed
      And the "select_option_entrypoint" entrypoint is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295808 @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @regression
  Scenario: A postpay user who has the permanent forwarding activated can access to the "Permanent forwarding" screen when this setting is not editable
    If the last time that the permanent forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change the permanent forwarding.
    Given user has the "permanent_forwarding" service in "activated" status
      And the "permanent_forwarding" service is not editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "permanent_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "title" textfield with "Permanent forwarding details" text is displayed
      And the "permanent_forwarding.tag" textfield with "Aktiv" text is displayed
      And the "permanent_forwarding.title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "permanent_forwarding.switch" switch is not displayed
      And the "select_option_textfield" textfield with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed
      And the "select_option_entrypoint" entrypoint is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has never configured the <conditional_type> conditional forwarding can access to the "Conditional forwarding" screen when this setting is not editable
    The API returns an is_editable field to indicate if the user can change eachh of the conditional forwardings.
    Given user has never configured the "<conditional_type>_conditional_forwarding" service
      And the "<conditional_type>_conditional_forwarding" service is not editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "conditional_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Conditional forwarding details" text is displayed
      And the "<conditional_type>.title" textfield with "<title>" text is displayed
      And the "<conditional_type>.switch" switch is not displayed
      And the "<conditional_type>.select_option_textfield" textfield with "Not configured" text is displayed
      And the "<conditional_type>.select_option_entrypoint" entrypoint is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | conditional_type | title                    | jira_id      |
          | busy             | Wenn Handy besetzt...    | QANOV-295809 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295810 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295811 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has configured the <conditional_type> conditional forwarding in the past but now it is deactivated can access to the "Conditional forwarding" screen when this setting is not editable
    If the last time that the conditional forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change eachh of the conditional forwardings.
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And user has the "<conditional_type>_conditional_forwarding" service in "deactivated" status
      And the "<conditional_type>_conditional_forwarding" service is not editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "conditional_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Conditional forwarding details" text is displayed
      And the "<conditional_type>.title" textfield with "<title>" text is displayed
      And the "<conditional_type>.tag" textfield with "Nicht aktiv" text is displayed
      And the "<conditional_type>.switch_title" textfield with "Anrufe Weiterleiten" text is displayed
      And the "<conditional_type>.switch" switch is not displayed
      And the "<conditional_type>.select_option_textfield" textfield with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed
      And the "<conditional_type>.select_option_entrypoint" entrypoint is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | conditional_type | title                    | jira_id      |
          | busy             | Wenn Handy besetzt...    | QANOV-295812 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295813 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295814 |

  @jira.<jira_id> @android @ios @jira.cv.14.2 @jira.link.depends_on.QANOV-295722 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user who has the <conditional_type> conditional forwarding activated can access to the "Conditional forwarding" screen when this setting is not editable
    If the last time that the conditional forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change eachh of the conditional forwardings.
    Given user has the "<conditional_type>_conditional_forwarding" service in "activated" status
      And the "<conditional_type>_conditional_forwarding" service is not editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Call Forwarding Configuration" page
     When selects the "call_forwarding.switch" switch
      And clicks on the "conditional_option.radiobutton" button
      And clicks on the "continue_button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Bedingte Weiterleitung einstellen" text is displayed
      And the "<conditional_type>.title" textfield with "<title>" text is displayed
      And the "<conditional_type>.tag" textfield with "Nicht aktiv" text is displayed
      And the "<conditional_type>.switch_title" textfield with "Anrufe Weiterleiten" text is displayed
      And the "<conditional_type>.switch" switch is not displayed
      And the "<conditional_type>.select_option_textfield" textfield with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed
      And the "<conditional_type>.select_option_entrypoint" entrypoint is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    Examples:
          | conditional_type | title                    | jira_id      |
          | busy             | Wenn Handy besetzt...    | QANOV-295815 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295816 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295817 |
