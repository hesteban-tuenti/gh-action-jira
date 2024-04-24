# -*- coding: utf-8 -*-
@jira.QANOV-215195
Feature: Call Forwarding Configuration

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status


  @jira.QANOV-295568 @android @automatic @blaude @cert3 @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-202565
  @jira.link.detects.OBO2DE-436 @live @mobile @next @sanity @raitt_drop1 @webapp @qa
  Scenario: A postpay user with "call forwarding" deactivated can access to the "Call Forwarding Configuration" screen
    Given user has the "call_forwarding" service in "deactivated" status
      And user has the "Entrypoint list" module configured in CMS for "Account" page
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And waits until the "highlighted_services.see_all" element is visible
     When clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
     Then the "Call Forwarding Configuration" page is displayed
      And the "Anrufe weiterleiten" header is displayed
      And the "header.title" textfield with "Wähle die Art der Weiterleitung" text is displayed
      And the "header.description" textfield with "Du kannst deine Einstellungen jederzeit wieder ändern." text is displayed
      And the "call_forwarding_name" textfield with "Anrufe weiterleiten" text is displayed
      And the "call_forwarding_switch" switch is disabled
      And the "permanent_option_name" textfield is not displayed
      And the "permanent_option_radiobutton" button is not displayed
      And the "conditional_option_name" textfield is not displayed
      And the "conditional_option_radiobutton" button is not displayed
      And the "continue_button" button is not displayed

  @jira.QANOV-295570 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-202565 @jira.link.detects.O2DE-3459
  @manual @mobile @smoke @ber @raitt_drop1
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

  @jira.QANOV-295571 @android @ber @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570
  @jira.link.detects.OBO2DE-436 @mobile @no_automatable @smoke @raitt_drop1
  Scenario: A postpay user with "call forwarding" activated can deactivate it successfully
    Given user has the "call_forwarding" service in "activated" status
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Account" page
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
     When clicks on the "call_forwarding_switch" switch
     Then the "success_warning" textfield with "Deine Einstellungen wurden gespeichert." text is displayed
      And the "title" textfield with "Wähle die Art der Weiterleitung" text is displayed
      And the "description" textfield with "Du kannst deine Einstellungen jederzeit wieder ändern." text is displayed
      And the "call_forwarding_name" textfield with "Anrufe weiterleiten" text is displayed
      And the "call_forwarding_switch" switch is disabled
      And the "permanent_option_name" textfield is not displayed
      And the "permanent_option_radiobutton" button is not displayed
      And the "conditional_option_name" textfield is not displayed
      And the "conditional_option_radiobutton" button is not displayed
      And the "continue_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295572 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295568
  @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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

  @jira.QANOV-295573 @android @blaude @jira.cv.14.0 @jira.link.depends_on.QANOV-295572 @manual @mobile @regression
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

  @jira.QANOV-295574 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295568
  @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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

  @jira.QANOV-295579 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @jira.link.detects.LOC-1044
  @manual @mobile @smoke
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

  @jira.QANOV-295580 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @jira.link.detects.LOC-1044
  @manual @mobile @smoke
  Scenario: A postpay user who configured the permanent forwarding in the past but now it is deactivated can access to the "Permanent forwarding" screen
    If the last time that the permanent forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change the permanent forwarding.
    Given user has configured the "permanent_forwarding" service in the past
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

  @jira.QANOV-295581 @android @automatic @blaude @cert3 @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570
  @jira.link.detects.LOC-1044 @live @mobile @next @sanity @webapp @qa
  Scenario: A postpay user who has the permanent forwarding activated can access to the "Permanent forwarding" screen
    If the last time that the permanent forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change the permanent forwarding.
    Given user has the "permanent_forwarding" service in "activated" status
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Account" page
      And waits until the "highlighted_services.see_all" element is visible
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
     When selects the "call_forwarding_switch" switch
      And waits until the "permanent_option_radiobutton" element is visible
      And clicks on the "permanent_option_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Permanent Forwarding Configuration" page is displayed
      And the "Immer weiterleiten" header is displayed
      And the "header.title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "permanent_forwarding_title" textfield with "Anrufe immer weiterleiten" text is displayed
      And the "permanent_forwarding_switch" switch is checked
      And the "select_option_entrypoint" entrypoint with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed

  @jira.QANOV-295582 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295579 @manual @mobile @regression
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
      And the "title" textfield with "Wohin sollen deine Anrufe weitergeleitet werden?" text is displayed
      And the "another_number_option.title" textfield with "Weiterleitung an andere Rufnummer" text is displayed
      And the "another_number_option.description" textfield with "Gib deine Rufnummer ein, an die deine Anrufe weitergeleitet werden sollen." text is displayed
      And the "another_number_option.radiobutton" button is displayed
      And the "another_number_option.phone_number_inputtext" inputtext with the "Rufnummer" placeholder is displayed
      And the "another_number_option.phone_number_inputtext" inputtext is empty
      And the "mailbox_option.title" textfield with "Weiterleiten zur Mailbox" text is displayed
      And the "mailbox_option.description" textfield with "Der Anruf wird an die Mailbox weitergeleitet." text is displayed
      And the "mailbox_option.radiobutton" button is displayed
      And the "save_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295583 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295582 @manual @mobile @regression
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
      And the "save_button" button with "Save" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295584 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295583 @jira.link.detects.LOC-1044
  @jira.link.detects.OBO2DE-448 @manual @mobile @smoke @raitt_drop1
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

  @jira.QANOV-295585 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295583 @manual @mobile @regression
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

  @jira.QANOV-295586 @android @automatic @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295582
  @jira.link.detects.LOC-1044 @jira.link.detects.OBO2DE-448 @mobile @qa @smoke
  Scenario: A postpay user who has never configured the "permanent_forwarding" service can set up the permanent forwarding to another number successfully
    If the permanent forwarding is activated, the conditional forwarding will be automatically deactivated by the OB.
    Given user has never configured the "permanent_forwarding" service
      And user has the "permanent_forwarding" service in "deactivated" status
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Account" page
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
      And selects the "call_forwarding_switch" switch
      And clicks on the "permanent_option_radiobutton" button
      And clicks on the "continue_button" button
      And the "Permanent Forwarding Configuration" page is displayed
      And clicks on the "select_option_entrypoint" button
      And the "Call Forwarding Select Option" page is displayed
     When clicks on the "another_number_radiobutton" button
      And fills the "another_number_phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "main_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295587 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295582 @manual @mobile @regression
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

  @jira.QANOV-295588 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295580
  @jira.link.depends_on.QANOV-295581 @manual @mobile @regression
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

  @jira.QANOV-295589 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295580
  @jira.link.depends_on.QANOV-295581 @manual @mobile @regression
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

  @jira.QANOV-295590 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295580
  @jira.link.depends_on.QANOV-295581 @manual @mobile @regression
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

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | client  | back_button                      | continue_button | cancel_button | depends_on   | jira_id      |
          | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-295580 | QANOV-295591 |
          | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-295581 | QANOV-295592 |

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | android | native "back"                    | QANOV-295591 | QANOV-295593 |
          | ios     | "navigation_top_bar.back_button" | QANOV-295592 | QANOV-295594 |

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | android | native "back"                    | QANOV-295591 | QANOV-295595 |
          | ios     | "navigation_top_bar.back_button" | QANOV-295592 | QANOV-295596 |

  @jira.QANOV-295597 @android @automatic @ber @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295588
  @jira.link.detects.LOC-1044 @jira.link.detects.OBO2DE-448 @mobile @qa @smoke @raitt_drop1
  Scenario: A postpay user who configured the permanent forwarding in the past with the "mailbox" option can change it to the "another_number" option successfully
    Given user has configured the "permanent_forwarding" service in the past with the "mailbox" option
      And the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Account" page
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
      And selects the "call_forwarding_switch" switch
      And clicks on the "permanent_option_radiobutton" button
      And clicks on the "continue_button" button
      And the "Permanent Forwarding Configuration" page is displayed
     When clicks on the "select_option_entrypoint" entrypoint
      And the "Call Forwarding Select Option" page is displayed
      And clicks on the "another_number_radiobutton" button
      And fills the "another_number_phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "main_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

  @jira.QANOV-295598 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295588 @manual @mobile @regression
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

  @jira.QANOV-295599 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295589 @jira.link.detects.LOC-1044
  @jira.link.detects.OBO2DE-448 @manual @mobile @smoke
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

  @jira.QANOV-295600 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295589 @manual @mobile @regression
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

  @jira.QANOV-295601 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295589 @jira.link.detects.LOC-1044
  @jira.link.detects.OBO2DE-448 @manual @mobile @smoke
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

  @jira.QANOV-295602 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295589 @manual @mobile @regression
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

  @jira.QANOV-295603 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295582
  @jira.link.depends_on.QANOV-295589 @manual @mobile @regression
  Scenario: A postpay user who is in the "Permanent Forwarding Select Option" screen cannot set up the permanent forwarding to another number without filling the phone number field
    Given the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "another_number_option.radiobutton" button
      And clears the "another_number_option.phone_number_inputtext" inputtext
      And clicks on the "save_button" button
     Then the "phone_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-295604 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295582
  @jira.link.depends_on.QANOV-295589 @manual @mobile @regression
  Scenario: A postpay user who is in the "Permanent Forwarding Select Option" screen cannot set up the permanent forwarding to another number without inserting a valid phone number
    Given the "permanent_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Select Option" module configured in CMS for "Permanent Forwarding Select Option" page
      And user is in the "Permanent Forwarding Select Option" page
     When clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "0000" text
      And clicks on the "save_button" button
     Then the "phone_number_error_textfield" textfield with "Diese Telefonnummer ist ungültig. Gib eine gültige Nummer ein" text is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295580
  @jira.link.detects.OBO2DE-435 @mobile @no_automatable @smoke @raitt_drop1
  Scenario Outline: A postpay user who configured the permanent forwarding in the past with the "<option>" option but now it is deactivated can activate it again successfully
    If the permanent forwarding is activated, the conditional forwarding will be automatically deactivated by the OB.
    Given user has configured the "permanent_forwarding" service in the past with the "<option>" option
      And the "permanent_forwarding" service is editable
      And user has the "permanent_forwarding" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Account" page
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
      And selects the "call_forwarding_switch" switch
      And clicks on the "permanent_option_radiobutton" button
      And clicks on the "continue_button" button
      And the "Permanent Forwarding Configuration" page is displayed
     When clicks on the "permanent_forwarding_switch" switch
     Then the "permanent_forwarding_switch" switch is enabled
      And the "success_warning" textfield with "Deine Einstellungen wurden gespeichert." text is displayed

    Examples:
          | option         | jira_id      |
          | another_number | QANOV-295605 |
          | mailbox        | QANOV-295606 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295580 @manual @mobile @regression
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
          | another_number | QANOV-295607 |
          | mailbox        | QANOV-295608 |

  @jira.QANOV-295609 @android @blaude @jira.cv.14.0 @jira.link.depends_on.QANOV-295607 @jira.link.depends_on.QANOV-295608
  @manual @mobile @regression
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

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295581 @manual @mobile @smoke
  @raitt_drop1
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
          | another_number | QANOV-295610 |
          | mailbox        | QANOV-295611 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295581 @manual @mobile @regression
  Scenario Outline: A postpay user who has the permanent forwarding activated with the "<option>" option can deactivate it unsuccessfully
    Given user has the "permanent_forwarding" service in "activated" status
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
          | another_number | QANOV-295612 |
          | mailbox        | QANOV-295613 |

  @jira.QANOV-295614 @android @blaude @jira.cv.14.0 @jira.link.depends_on.QANOV-295612 @jira.link.depends_on.QANOV-295613
  @manual @mobile @regression
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

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.QANOV-295580 @manual @mobile @regression
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
          | android | native "back"                    | JA              | NEIN          | QANOV-295575 |
          | ios     | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295576 |

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.QANOV-295581 @manual @mobile @regression
  Scenario Outline: A postpay user deactivates the permanent forwarding but leaves the page before seeing the warning message: popup is displayed
    Given user has the "permanent_forwarding" service in "activated" status
      And the "permanent_forwarding" service is editable
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
          | android | native "back"                    | JA              | NEIN          | QANOV-387884 |
          | ios     | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-387885 |

  @jira.QANOV-295577 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295575
  @jira.link.depends_on.QANOV-295576 @jira.link.depends_on.QANOV-387884 @jira.link.depends_on.QANOV-387885 @manual @mobile
  @regression
  Scenario: Postpay user decides to continue changing the permanent forwarding switch after seeing the Permanent Forwarding Cancellation popup
    Given user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Permanent Forwarding Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Permanent Forwarding Configuration" page is displayed

  @jira.QANOV-295578 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295575
  @jira.link.depends_on.QANOV-295576 @jira.link.depends_on.QANOV-387884 @jira.link.depends_on.QANOV-387885 @manual @mobile
  @regression
  Scenario: Postpay user decides to cancel changing the permanent forwarding switch after seeing the Permanent Forwarding Cancellation popup
    Given user has the "Permanent Forwarding Configuration" module configured in CMS for "Permanent Forwarding Configuration" page
      And user is in the "Permanent Forwarding Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Call Forwarding Configuration" page is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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
          | busy             | Wenn Handy besetzt...    | QANOV-295615 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295616 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295617 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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
          | busy             | Wenn Handy besetzt...    | QANOV-295618 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295619 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295620 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | Bedingte Weiterleitung einstellen        | QANOV-295615:QANOV-295618:QANOV-295621 | QANOV-295624 |
          | no_available     | Anrufweiterleitung wenn nicht erreichbar | QANOV-295616:QANOV-295619:QANOV-295622 | QANOV-295625 |

  @jira.QANOV-295626 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295617
  @jira.link.depends_on.QANOV-295620 @jira.link.depends_on.QANOV-295623 @manual @mobile @regression
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

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | Bedingte Weiterleitung einstellen        | QANOV-295615:QANOV-295618:QANOV-295621 | QANOV-295627 |
          | no_available     | Anrufweiterleitung wenn nicht erreichbar | QANOV-295616:QANOV-295619:QANOV-295622 | QANOV-295628 |

  @jira.QANOV-295629 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295617
  @jira.link.depends_on.QANOV-295620 @jira.link.depends_on.QANOV-295623 @jira.link.detects.OBO2DE-444 @manual @mobile
  @regression
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

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295624 | QANOV-295630 |
          | no_available     | QANOV-295625 | QANOV-295631 |
          | no_answer        | QANOV-295626 | QANOV-295632 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295624 | QANOV-295633 |
          | no_available     | QANOV-295625 | QANOV-295634 |
          | no_answer        | QANOV-295626 | QANOV-295635 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @mobile @smoke
  Scenario Outline: A postpay user who has never configured the "<conditional_type> conditional forwarding" service can set up it to mailbox successfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has never configured the "<conditional_type>_conditional_forwarding" service
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Account" page
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
      And selects the "call_forwarding_switch" switch
      And clicks on the "conditional_option_radiobutton" button
      And clicks on the "continue_button" button
      And the "Conditional Forwarding Configuration" page is displayed
     When clicks on the "<conditional_type>_select_option_entrypoint" entrypoint
      And the "Call Forwarding Select Option" page is displayed
      And clicks on the "mailbox_option_radiobutton" button
      And clicks on the "save_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "main_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    @automatic @qa @raitt_drop1
    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-295615 | QANOV-295636 |

    @manual
    Examples:
          | conditional_type | depends_on   | jira_id      |
          | no_available     | QANOV-295616 | QANOV-295637 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295615 | QANOV-295638 |
          | no_available     | QANOV-295616 | QANOV-295639 |

  @jira.QANOV-295640 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295617 @manual @mobile @smoke
  Scenario: A postpay user who has never configured the "no_answer conditional forwarding" service can set up it to mailbox successfully
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

  @jira.QANOV-295641 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295617 @manual @mobile @regression
  Scenario: A postpay user who has never configured the "no_answer conditional forwarding" service can set up it to mailbox unsuccessfully
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

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
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
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-295615 | QANOV-295642 |
          | no_available     | QANOV-295616 | QANOV-295643 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295615 | QANOV-295644 |
          | no_available     | QANOV-295616 | QANOV-295645 |

  @jira.QANOV-295646 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295617 @manual @mobile @smoke
  Scenario: A postpay user who has never configured the "no_answer conditional_forwarding" service can set up it to another number successfully
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
      And clicks on the "another_number_option.radiobutton" button
      And fills the "another_number_option.phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
     Then the "Call Forwarding Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "success_message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "back_to_services_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-295647 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295617 @manual @mobile @regression
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

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295618:QANOV-295621 | QANOV-295648 |
          | no_available     | QANOV-295619:QANOV-295622 | QANOV-295649 |
          | no_answer        | QANOV-295620:QANOV-295623 | QANOV-295650 |

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-295618:QANOV-295621 | QANOV-295651 |
          | busy             | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-295618:QANOV-295621 | QANOV-295652 |
          | no_available     | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-295619:QANOV-295622 | QANOV-295653 |
          | no_available     | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-295619:QANOV-295622 | QANOV-295654 |
          | no_answer        | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-295620:QANOV-295623 | QANOV-295655 |
          | no_answer        | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-295620:QANOV-295623 | QANOV-295656 |

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | android | native "back"                    | QANOV-295651 | QANOV-295657 |
          | busy             | ios     | "navigation_top_bar.back_button" | QANOV-295652 | QANOV-295658 |
          | no_available     | android | native "back"                    | QANOV-295653 | QANOV-295659 |
          | no_available     | ios     | "navigation_top_bar.back_button" | QANOV-295654 | QANOV-295660 |
          | no_answer        | android | native "back"                    | QANOV-295655 | QANOV-295661 |
          | no_answer        | ios     | "navigation_top_bar.back_button" | QANOV-295656 | QANOV-295662 |

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | android | native "back"                    | QANOV-295651 | QANOV-295663 |
          | busy             | ios     | "navigation_top_bar.back_button" | QANOV-295652 | QANOV-295664 |
          | no_available     | android | native "back"                    | QANOV-295653 | QANOV-295665 |
          | no_available     | ios     | "navigation_top_bar.back_button" | QANOV-295654 | QANOV-295666 |
          | no_answer        | android | native "back"                    | QANOV-295655 | QANOV-295667 |
          | no_answer        | ios     | "navigation_top_bar.back_button" | QANOV-295656 | QANOV-295668 |

  @jira.<jira_id> @<ber> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @mobile @smoke
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past with the "mailbox" option can change it to the "another_number" option successfully
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "mailbox" option
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the "Conditional Forwarding Select Option" module configured in CMS for "Conditional Forwarding Select Option" page
      And user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user is in the "Account" page
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
      And clicks on the "conditional_option_radiobutton" button
      And clicks on the "continue_button" button
      And the "Conditional Forwarding Configuration" page is displayed
     When clicks on the "<conditional_type>_select_option_entrypoint" entrypoint
      And the "Call Forwarding Select Option" page is displayed
      And clicks on the "another_number_radiobutton" button
      And fills the "another_number_phone_number_inputtext" inputtext with the "633999222" text
      And clicks on the "save_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Wir haben deine Anfrage zur Anrufweiterleitung erhalten." text is displayed
      And the "message" textfield with "Diese werden in Kürze aktualisiert." text is displayed
      And the "main_button" button with "Zurück" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Services" page is displayed

    @automatic @qa @raitt_drop1
    Examples:
          | conditional_type | ber | depends_on                | jira_id      |
          | busy             | ber | QANOV-295618:QANOV-295621 | QANOV-295669 |

    @manual
    Examples:
          | conditional_type | ber | depends_on                | jira_id      |
          | no_available     |     | QANOV-295619:QANOV-295622 | QANOV-295670 |
          | no_answer        |     | QANOV-295620:QANOV-295623 | QANOV-295671 |

  @jira.<jira_id> @<test_priority> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @mobile
  Scenario Outline: A postpay user who has the <conditional_type> conditional forwarding activated can access to the "Conditional forwarding" screen
    If the last time that the conditional forwarding was configured the user selected the 'to another number' option, then
    the phone number configured will be displayed under the 'select_option' entrypoint.
    The API returns an is_editable field to indicate if the user can change eachh of the conditional forwardings.
    Given user has the "<conditional_type>_conditional_forwarding" service in "activated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Call Forwarding Configuration" module configured in CMS for "Call Forwarding Configuration" page
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Account" page
      And waits until the "highlighted_services.see_all" element is visible
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
     When selects the "call_forwarding_switch" switch
      And clicks on the "conditional_option_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Conditional Forwarding Configuration" page is displayed
      And the "Bedingte Weiterleitung" header is displayed
      And the "title" textfield with "Bedingte Weiterleitung einstellen" text is displayed
      And the "<conditional_type>_title" textfield with "<title>" text is displayed
      And the "<conditional_type>_switch_title" textfield with "Anrufe weiterleiten" text is displayed
      And the "<conditional_type>_switch" switch is checked
      And the "<conditional_type>_select_option_entrypoint" entrypoint with the "(Weiterleitung an andere Rufnummer|Weiterleiten zur Mailbox)" format is displayed

    @automatic @cert3 @live @next @webapp @qa
    Examples:
          | conditional_type | title                 | test_priority | jira_id      |
          | busy             | Wenn Handy besetzt... | smoke         | QANOV-295621 |

    @manual
    Examples:
          | conditional_type | title                    | test_priority | jira_id      |
          | no_available     | Wenn nicht erreichbar... | regression    | QANOV-295622 |
          | no_answer        | Wenn keine Antwort...    | regression    | QANOV-295623 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295618:QANOV-295621 | QANOV-295672 |
          | no_available     | QANOV-295619:QANOV-295622 | QANOV-295673 |
          | no_answer        | QANOV-295620:QANOV-295623 | QANOV-295674 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
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
          | conditional_type | depends_on                | jira_id      |
          | busy             | QANOV-295618:QANOV-295621 | QANOV-295675 |
          | no_available     | QANOV-295619:QANOV-295622 | QANOV-295676 |
          | no_answer        | QANOV-295620:QANOV-295623 | QANOV-295677 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295618:QANOV-295621 | QANOV-295678 |
          | no_available     | QANOV-295619:QANOV-295622 | QANOV-295679 |
          | no_answer        | QANOV-295620:QANOV-295623 | QANOV-295680 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
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
          | busy             | QANOV-295618:QANOV-295621 | QANOV-295681 |
          | no_available     | QANOV-295619:QANOV-295622 | QANOV-295682 |
          | no_answer        | QANOV-295620:QANOV-295623 | QANOV-295683 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295618:QANOV-295621 | QANOV-295684 |
          | no_available     | QANOV-295619:QANOV-295622 | QANOV-295685 |
          | no_answer        | QANOV-295620:QANOV-295623 | QANOV-295686 |

  @jira.QANOV-295687 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295620
  @jira.link.depends_on.QANOV-295623 @manual @mobile @smoke
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

  @jira.QANOV-295688 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295620
  @jira.link.depends_on.QANOV-295623 @manual @mobile @regression
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
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on>
  @jira.link.detects.OBO2DE-435 @mobile @no_automatable @smoke
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past but now it is deactivated can activate it again successfully
    If the conditional forwarding is activated, the permanent forwarding will be automatically deactivated by the OB.
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And user has the "<conditional_type>_conditional_forwarding" service in "deactivated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the matching subscription selected in the account
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Account" page
      And clicks on the "highlighted_services.see_all" link
      And the "Services" page is displayed
      And clicks on the "call_forwarding_configuration" entrypoint
      And the "Call Forwarding Configuration" page is displayed
      And clicks on the "conditional_option_radiobutton" button
      And clicks on the "continue_button" button
      And the "Conditional Forwarding Configuration" page is displayed
     When clicks on the "<conditional_type>.switch" switch
     Then the "success_warning" textfield with "Deine Einstellungen wurden gespeichert." text is displayed

    @raitt_drop1
    Examples:
          | conditional_type | depends_on   | jira_id      |
          | busy             | QANOV-295618 | QANOV-295689 |

    Examples:
          | conditional_type | depends_on   | jira_id      |
          | no_available     | QANOV-295619 | QANOV-295690 |
          | no_answer        | QANOV-295620 | QANOV-295691 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user who configured the <conditional_type> conditional forwarding in the past but now it is deactivated can activate it again unsuccessfully
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has configured the "<conditional_type>_conditional_forwarding" service in the past with the "any" option
      And user has the "<conditional_type>_conditional_forwarding" service in "deactivated" status
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
          | busy             | QANOV-295618 | QANOV-295692 |
          | no_available     | QANOV-295619 | QANOV-295693 |
          | no_answer        | QANOV-295620 | QANOV-295694 |

  @jira.<jira_id> @android @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295692 | QANOV-295695 |
          | no_available     | QANOV-295693 | QANOV-295696 |
          | no_answer        | QANOV-295694 | QANOV-295697 |

  @jira.<jira_id> @<ber> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @mobile @no_automatable
  @smoke
  Scenario Outline: A postpay user who has the <conditional_type> conditional forwarding activated can deactivate it successfully
    Given user has the "<conditional_type>_conditional_forwarding" service in "activated" status
      And the "<conditional_type>_conditional_forwarding" service is editable
      And user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user has the matching subscription selected in the account
      And user is in the "Conditional Forwarding Configuration" page
     When clicks on the "<conditional_type>.switch" switch
     Then the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine Einstellungen wurden gespeichert." text is displayed

    @raitt_drop1
    Examples:
          | conditional_type | ber | depends_on   | jira_id      |
          | busy             | ber | QANOV-295621 | QANOV-295698 |

    Examples:
          | conditional_type | ber | depends_on   | jira_id      |
          | no_available     |     | QANOV-295622 | QANOV-295699 |
          | no_answer        |     | QANOV-295623 | QANOV-295700 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295621 | QANOV-295701 |
          | no_available     | QANOV-295622 | QANOV-295702 |
          | no_answer        | QANOV-295623 | QANOV-295703 |

  @jira.<jira_id> @android @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | busy             | QANOV-295701 | QANOV-295704 |
          | no_available     | QANOV-295702 | QANOV-295705 |
          | no_answer        | QANOV-295703 | QANOV-295706 |

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | android | busy             | native "back"                    | JA              | NEIN          | QANOV-295618 | QANOV-387886 |
          | ios     | busy             | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295618 | QANOV-387887 |
          | android | no_available     | native "back"                    | JA              | NEIN          | QANOV-295619 | QANOV-387888 |
          | ios     | no_available     | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295619 | QANOV-387889 |
          | android | no_answer        | native "back"                    | JA              | NEIN          | QANOV-295620 | QANOV-387890 |
          | ios     | no_answer        | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295620 | QANOV-387891 |

  @jira.<jira_id> @<client> @blaude @jira.cv.14.0 @jira.link.depends_on.<depends_on> @manual @mobile @regression
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
          | android | busy             | native "back"                    | JA              | NEIN          | QANOV-295618 | QANOV-387892 |
          | ios     | busy             | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295618 | QANOV-387893 |
          | android | no_available     | native "back"                    | JA              | NEIN          | QANOV-295619 | QANOV-387894 |
          | ios     | no_available     | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295619 | QANOV-387895 |
          | android | no_answer        | native "back"                    | JA              | NEIN          | QANOV-295620 | QANOV-387896 |
          | ios     | no_answer        | "navigation_top_bar.back_button" | Ja              | Nein          | QANOV-295620 | QANOV-387897 |

  @jira.QANOV-387898 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-387886
  @jira.link.depends_on.QANOV-387887 @jira.link.depends_on.QANOV-387888 @jira.link.depends_on.QANOV-387889
  @jira.link.depends_on.QANOV-387890 @jira.link.depends_on.QANOV-387891 @jira.link.depends_on.QANOV-387892
  @jira.link.depends_on.QANOV-387893 @jira.link.depends_on.QANOV-387894 @jira.link.depends_on.QANOV-387895
  @jira.link.depends_on.QANOV-387896 @jira.link.depends_on.QANOV-387897 @manual @mobile @regression
  Scenario: Postpay user decides to continue changing the conditional forwarding switch after seeing the Conditional Forwarding Cancellation popup
    Given user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Conditional Forwarding Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Conditional Forwarding Configuration" page is displayed

  @jira.QANOV-387899 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-387886
  @jira.link.depends_on.QANOV-387887 @jira.link.depends_on.QANOV-387888 @jira.link.depends_on.QANOV-387889
  @jira.link.depends_on.QANOV-387890 @jira.link.depends_on.QANOV-387891 @jira.link.depends_on.QANOV-387892
  @jira.link.depends_on.QANOV-387893 @jira.link.depends_on.QANOV-387894 @jira.link.depends_on.QANOV-387895
  @jira.link.depends_on.QANOV-387896 @jira.link.depends_on.QANOV-387897 @manual @mobile @regression
  Scenario: Postpay user decides to cancel changing the conditional forwarding switch after seeing the Conditional Forwarding Cancellation popup
    Given user has the "Conditional Forwarding Configuration" module configured in CMS for "Conditional Forwarding Configuration" page
      And user is in the "Conditional Forwarding Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Conditional Forwarding Configuration" page is displayed

  @jira.QANOV-295707 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295574
  @jira.link.depends_on.QANOV-295585 @jira.link.depends_on.QANOV-295587 @jira.link.depends_on.QANOV-295598
  @jira.link.depends_on.QANOV-295600 @jira.link.depends_on.QANOV-295602 @jira.link.depends_on.QANOV-295638
  @jira.link.depends_on.QANOV-295639 @jira.link.depends_on.QANOV-295641 @jira.link.depends_on.QANOV-295644
  @jira.link.depends_on.QANOV-295645 @jira.link.depends_on.QANOV-295647 @jira.link.depends_on.QANOV-295672
  @jira.link.depends_on.QANOV-295673 @jira.link.depends_on.QANOV-295674 @jira.link.depends_on.QANOV-295678
  @jira.link.depends_on.QANOV-295679 @jira.link.depends_on.QANOV-295680 @jira.link.depends_on.QANOV-295684
  @jira.link.depends_on.QANOV-295685 @jira.link.depends_on.QANOV-295686 @jira.link.depends_on.QANOV-295688 @manual @mobile
  @regression
  Scenario: A postpay user who is in the "Call Forwarding Error Feedback" screen can go back to dashboard
    Given user has the "Call Forwarding Error Feedback" module configured in CMS for "Call Forwarding Error Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Call Forwarding Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-295708 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295584
  @jira.link.depends_on.QANOV-295586 @jira.link.depends_on.QANOV-295597 @jira.link.depends_on.QANOV-295599
  @jira.link.depends_on.QANOV-295601 @jira.link.depends_on.QANOV-295636 @jira.link.depends_on.QANOV-295637
  @jira.link.depends_on.QANOV-295640 @jira.link.depends_on.QANOV-295642 @jira.link.depends_on.QANOV-295643
  @jira.link.depends_on.QANOV-295646 @jira.link.depends_on.QANOV-295669 @jira.link.depends_on.QANOV-295670
  @jira.link.depends_on.QANOV-295671 @jira.link.depends_on.QANOV-295675 @jira.link.depends_on.QANOV-295676
  @jira.link.depends_on.QANOV-295677 @jira.link.depends_on.QANOV-295681 @jira.link.depends_on.QANOV-295682
  @jira.link.depends_on.QANOV-295683 @jira.link.depends_on.QANOV-295687 @manual @mobile @regression
  Scenario: A postpay user who is in the "Call Forwarding Success Feedback" screen can go back to the Services screen
    Given user has the "Call Forwarding Success Feedback" module configured in CMS for "Call Forwarding Success Feedback" page
      And user has the matching subscription selected in the account
      And user is in the "Call Forwarding Success Feedback" page
     When clicks on the "back_to_services_button" button
     Then the "Services" page is displayed

  @jira.QANOV-295709 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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

  @jira.QANOV-295710 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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

  @jira.QANOV-295711 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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
          | busy             | Wenn Handy besetzt...    | QANOV-295712 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295713 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295714 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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
          | busy             | Wenn Handy besetzt...    | QANOV-295715 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295716 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295717 |

  @jira.<jira_id> @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-295570 @manual @mobile @regression
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
          | busy             | Wenn Handy besetzt...    | QANOV-295718 |
          | no_available     | Wenn nicht erreichbar... | QANOV-295719 |
          | no_answer        | Wenn keine Antwort...    | QANOV-295720 |
