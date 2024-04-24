# -*- coding: utf-8 -*-
@jira.QANOV-204677
Feature: Digital Bill setting

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has invoices
      And user has the matching subscription selected in the account
      And user has the "Bills settings" module configured in CMS for "Bills" page


  @jira.<jira_id> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204367 @jira.link.detects.OBO2DE-190 @mobile
  @raitt_drop2 @regression
  Scenario Outline: Postpay user can see the "digital bill" setting in the Bills screen when it's deactivated
    Given user has "digital_bill" service in "deactivated" status
      And user is in the "Bills" page
     Then the "digital_bill_entrypoint.title" textfield with "Online-Rechnung" text is displayed
      And the "digital_bill_entrypoint.subtitle" textfield with "E-Mail-Adresse hinterlegen" text is displayed
      And the "digital_bill_entrypoint.tag" textfield with "Aktivieren" text is displayed

    @android @automatic @qa @webapp
    Examples:
          | jira_id      |
          | QANOV-204678 |

    @ios @manual
    Examples:
          | jira_id      |
          | QANOV-493669 |

  @jira.<jira_id> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204367 @mobile @raitt_drop2 @regression
  Scenario Outline: Postpay user can see the "digital bill" setting in the Bills screen when it's activated
    If the digital bill setting is active, the email will be displayed under the entrypoint.
    Given user has "digital_bill" service in "activated" status
      And user is in the "Bills" page
     Then the "digital_bill_entrypoint.title" textfield with "Online-Rechnung" text is displayed
      And the "digital_bill_entrypoint.subtitle" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "digital_bill_entrypoint.tag" textfield is not displayed

    @android @automatic @qa @webapp
    Examples:
          | jira_id      |
          | QANOV-204679 |

    @ios @manual
    Examples:
          | jira_id      |
          | QANOV-493670 |

  @jira.<jira_id> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204678 @jira.link.detects.OBO2DE-178 @mobile @qa
  @raitt_drop2 @sanity
  Scenario Outline: Postpay user can access to activate the digital bill from the settings section in the Bills screen
    Once user changes to digital bill, he/she cannot undo this action.
    Given user has "digital_bill" service in "deactivated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Bills" page
     When clicks on the "digital_bill_entrypoint" entrypoint
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed
      And the "title" textfield with "Online-Rechnung aktivieren" text is displayed
      And the "description" textfield with "Füge eine E-Mail Adresse hinzu, um deine Online-Rechnung in Zukunft per E-Mail und nicht mehr per Post zu erhalten." text is displayed
      And the "email.placeholder" textfield with "E-Mail-Adresse" text is displayed
      And the "email" inputtext is empty
      And the "email.example" textfield with "name@domain.com" text is displayed
      And the "activation_info.title" textfield with "AKTIVIERUNG DER ONLINE-RECHNUNG" text is displayed
      And the "activation_info.description_1" textfield with "Zusätzlich zur E-Mail können wir dich auch per SMS an deine neue Rechnung erinnern." text is displayed
      And the "activation_info.description_2" textfield with "Sobald die digitale Rechnung aktiviert ist, kann dieser Prozess nicht mehr rückgängig gemacht werden." text is displayed
      And the "billing_sms_notifications_entrypoint" entrypoint is not displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "activate_digital_bill_button" button with "Jetzt aktivieren" text is displayed

    @android @automatic @webapp
    Examples:
          | jira_id      |
          | QANOV-204680 |

    @ios @manual
    Examples:
          | jira_id      |
          | QANOV-358827 |

  @jira.<jira_id> @ber @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204679 @live @mobile @next @raitt_drop2 @smoke
  Scenario Outline: Postpay user can access to change the digital bill email from the settings section in the Bills screen
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Bills" page
     When clicks on the "digital_bill_entrypoint" entrypoint
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed
      And the "title" textfield with "E-Mail für Online-Rechnung" text is displayed
      And the "description" textfield with "Sobald eine neue Rechnung vorliegt, informieren wir dich per E-Mail an folgende Adresse:" text is displayed
      And the "email.placeholder" textfield with "E-Mail-Adresse" text is displayed
      And the "email" inputtext with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email.example" textfield with "name@domain.com" text is displayed
      And the "activation_info.title" textfield with "AKTIVIERUNG DER ONLINE-RECHNUNG" text is displayed
      And the "activation_info.description" textfield with "Zusätzlich zur E-Mail können wir dich auch per SMS an deine neue Rechnung erinnern." text is displayed
      And the "billing_sms_notifications_entrypoint" entrypoint is displayed
      And the "billing_sms_notifications_entrypoint.title" textfield with "Rechnungs-Benachrichtigung per SMS" text is displayed
      And the "billing_sms_notifications_entrypoint.chevron" icon is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "change_digital_bill_email_button" button with "Sichern" text is displayed

    @android @automatic @qa @webapp
    Examples:
          | jira_id      |
          | QANOV-204681 |

    @ios @manual
    Examples:
          | jira_id      |
          | QANOV-344060 |

  @jira.QANOV-204682 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204680
  @jira.link.depends_on.QANOV-204681 @jira.link.detects.OBO2DE-183 @manual @mobile @regression
  Scenario: Postpay user can access to the data protection info from the "Digital Bill" screen
    Given user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "Datenschutz bei Blau" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bills" page is displayed

  @jira.<jira_id> @<client> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204680 @jira.link.depends_on.QANOV-204681
  @manual @mobile @regression
  Scenario Outline: Postpay user can tap on back button after filling the email field: a popup is displayed on <client> device
    Given user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When fills the "email_inputtext" inputtext with the "editing_email" text
      And clicks on the <button> button
     Then the "Digital Bill Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | client  | button                           | continue_button | cancel_button | jira_id      |
          | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-204683 |
          | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-214322 |

  @jira.QANOV-204684 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204683
  @jira.link.depends_on.QANOV-214322 @manual @mobile @regression
  Scenario: Postpay user decides to continue with the digital bill flow after seeing the Digital Bill Cancellation popup
    Given user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed

  @jira.QANOV-204685 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204683
  @jira.link.depends_on.QANOV-214322 @manual @mobile @regression
  Scenario: Postpay user decides to cancel the digital bill flow after seeing the Digital Bill Cancellation popup
    Given user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

  @jira.QANOV-204686 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204680 @manual @mobile @regression
  Scenario: Postpay user cannot activate the digital bill without filling the email field
    Given user has "digital_bill" service in "deactivated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clicks on the "activate_digital_bill_button" button
     Then the "email_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-204687 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204680 @manual @mobile @regression
  Scenario: Postpay user cannot activate the digital bill without inserting a valid email
    Given user has "digital_bill" service in "deactivated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When fills the "email_inputtext" inputtext with the "invalid.email" text
      And clicks on the "activate_digital_bill_button" button
     Then the "email_error_textfield" textfield with "Falsche E-Mail-Adresse" text is displayed

  @jira.QANOV-204688 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204681 @manual @mobile @regression
  Scenario: Postpay user cannot change the digital bill email after removing the previous email
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clears the "email_inputtext" inputtext
      And clicks on the "change_digital_bill_email_button" button
     Then the "email_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-204689 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204681 @manual @mobile @regression
  Scenario: Postpay user cannot change the digital bill email without inserting a new valid email
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clears the "email_inputtext" inputtext
      And fills the "email_inputtext" inputtext with the "invalid@email" text
      And clicks on the "change_digital_bill_email_button" button
     Then the "email_error_textfield" textfield with "Falsche E-Mail-Adresse" text is displayed

  @jira.QANOV-204690 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204681 @manual @mobile @regression
  Scenario: Postpay user cannot change the digital bill email without making any change in the email
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clicks on the "change_digital_bill_email_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

  @jira.<jira_id> @ber @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204680 @jira.link.detects.OBO2DE-193 @mobile @qa
  @raitt_drop2 @smoke
  Scenario Outline: Postpay user can activate the digital bill successfully
    Once user changes to digital bill, he/she cannot undo this action.
    A "close" button will be displayed in the header of the Feedack screen.
    NOTE: if the digital bill activation takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has "digital_bill" service in "deactivated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When fills the "email" inputtext with the "user@mail.com" text
      And clicks on the "activate_digital_bill_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Deine Anfrage ist bei uns eingegangen." text is displayed
      And the "message" textfield with "Deine Änderungen werden in Kürze übernommen." text is displayed
      And the "main_button" button with "Schließen" text is displayed

    @android @automatic @webapp
    Examples:
          | jira_id      |
          | QANOV-204691 |

    @ios @manual
    Examples:
          | jira_id      |
          | QANOV-344061 |

  @jira.QANOV-204692 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204681 @manual @mobile @regression
  Scenario: Postpay user can change the digital bill email: a confirmation popup is displayed
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clears the "email_inputtext" inputtext
      And fills the "email_inputtext" inputtext with the "correct.email2@gmail.com" text
      And clicks on the "change_digital_bill_email_button" button
     Then the "Change Digital Bill Email Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen an der E-Mail Adresse übernehmen?" text is displayed
      And the "popup.message" textfield with "Die E-Mail Adresse kann danach erneut bearbeitet werden." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-204693 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204692 @manual @mobile @regression
  Scenario: Postpay user cancels to change the digital bill email
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clears the "email_inputtext" inputtext
      And fills the "email_inputtext" inputtext with the "correct.email2@gmail.com" text
      And clicks on the "change_digital_bill_email_button" button
      And the "Change Digital Bill Email Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed

  @jira.QANOV-204694 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204692 @manual @mobile @raitt_drop2
  @smoke
  Scenario: Postpay user confirms to change the digital bill email: digital bill email changed successfully
    NOTE: if the digital bill change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user has the "Digital Bill Success Feedback" module configured in CMS for "Digital Bill Success Feedback" page
      And user is in the "Digital Bill" page
     When clears the "email_inputtext" inputtext
      And fills the "email_inputtext" inputtext with the "correct.email2@gmail.com" text
      And clicks on the "change_digital_bill_email_button" button
      And the "Change Digital Bill Email Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Digital Bill Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Deine Anfrage ist bei uns eingegangen." text is displayed
      And the "success_message" textfield with "Deine Änderungen werden in Kürze übernommen." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204691
  @jira.link.depends_on.QANOV-204694 @manual @mobile @regression
  Scenario Outline: A postpay user who is in the "Digital Bill Success Feedback" screen can tap on the "<button_name>" button
    User can arrive to this Success Feedback screen by activating the digital bill or by changing the digital bill email.
    Given user has the "Digital Bill Success Feedback" module configured in CMS for "Digital Bill Success Feedback" page
      And user is in the "Digital Bill Success Feedback" page
     When clicks on the "<button_id>" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

    Examples:
          | button_name | button_id                       | jira_id      |
          | Exit        | exit_button                     | QANOV-204695 |
          | Close       | navigation_top_bar.close_button | QANOV-204696 |

  @jira.QANOV-620343 @android @blaude @e2e @ios @jira.cv.24.2 @jira.link.depends_on.QANOV-204692 @manual @mobile
  @regression
  Scenario: Postpay user changes the digital bill but the confirmation takes too long: an informative screen is displayed
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When fills the "email" inputtext with the "user@mail.com" text
      And clicks on the "change_digital_bill_email_button" button
      And the "Change Digital Bill Email Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And the digital bill change takes too long
     Then the "Digital Bill Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "main_button" button with "Schließen" text is displayed

  @jira.QANOV-620344 @android @blaude @e2e @ios @jira.cv.24.2 @jira.link.depends_on.QANOV-620343 @manual @mobile
  @regression
  Scenario: Postpay user can go back to "Bills" screen from the "Digital Bill Informative Feedback" screen
    Given user has the "Digital Bill Informative Feedback" module configured in CMS for "Digital Bill Informative Feedback" page
      And user is in the "Digital Bill Informative Feedback" page
     When clicks on the "main_button" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

  @jira.QANOV-204697 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204680 @manual @mobile @regression
  Scenario: Postpay user tries to activate the digital bill but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to activate the
    digital bill without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "digital_bill" service in "deactivated" status
      And user has tried to activate the digital bill "0" times without success
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When fills the "email_inputtext" inputtext with the "correct.email@gmail.com" text
      And clicks on the "activate_digital_bill_button" button
      And there is an error activating the digital bill
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-204698 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204681 @manual @mobile @regression
  Scenario: Postpay user tries to change the digital bill email but an error happens (first attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to change the
    digital bill email without success. The second attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has "digital_bill" service in "activated" status
      And user has tried to change the digital bill email "0" times without success
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clears the "email_inputtext" inputtext
      And fills the "email_inputtext" inputtext with the "correct.email2@gmail.com" text
      And clicks on the "change_digital_bill_email_button" button
      And there is an error changing the digital bill email
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-204699 @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204697 @manual @mobile @regression
  Scenario: Postpay user can close the error warning after trying to activate the digital bill without success
    Given user has "digital_bill" service in "deactivated" status
      And user has tried to activate the digital bill "0" times without success
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When fills the "email_inputtext" inputtext with the "correct.email@gmail.com" text
      And clicks on the "activate_digital_bill_button" button
      And there is an error activating the digital bill
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Digital Bill" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-204700 @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-204698 @manual @mobile @regression
  Scenario: Postpay user can close the error warning after trying to change the digital bill email without success
    Given user has "digital_bill" service in "activated" status
      And user has tried to change the digital bill email "0" times without success
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When clears the "email_inputtext" inputtext
      And fills the "email_inputtext" inputtext with the "correct.email2@gmail.com" text
      And clicks on the "change_digital_bill_email_button" button
      And there is an error changing the digital bill email
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Digital Bill" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-204701 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204680 @manual @mobile @regression
  Scenario: Postpay user tries to activate the digital bill but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to activate the
    digital bill without success. The second attempt will redirect to a full screen error feedback.
    Given user has "digital_bill" service in "deactivated" status
      And user has tried to activate the digital bill "1" times without success
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user has the "Digital Bill Error Feedback" module configured in CMS for "Digital Bill Error Feedback" page
      And user is in the "Digital Bill" page
     When fills the "email_inputtext" inputtext with the "correct.email@gmail.com" text
      And clicks on the "activate_digital_bill_button" button
      And there is an error activating the digital bill
     Then the "Digital Bill Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-204702 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204681 @manual @mobile @regression
  Scenario: Postpay user tries to change the digital bill email but an error happens (second attempt)
    The user will see a red warning at the bottom of the screen the first time that he/she tries to change the
    digital bill email without success. The second attempt will redirect to a full screen error feedback.
    Given user has "digital_bill" service in "activated" status
      And user has tried to change the digital bill email "1" times without success
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user has the "Digital Bill Error Feedback" module configured in CMS for "Digital Bill Error Feedback" page
      And user is in the "Digital Bill" page
     When clears the "email_inputtext" inputtext
      And fills the "email_inputtext" inputtext with the "correct.email2@gmail.com" text
      And clicks on the "change_digital_bill_email_button" button
      And there is an error changing the digital bill email
     Then the "Digital Bill Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht bearbeitet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204701
  @jira.link.depends_on.QANOV-204702 @manual @mobile @regression
  Scenario Outline: A postpay user who is in the "Digital Bill Error Feedback" screen can tap on the "<button_name>" button
    User can arrive to this Error Feedback screen by activating the digital bill or by changing the digital bill email.
    Given user has the "Digital Bill Error Feedback" module configured in CMS for "Digital Bill Error Feedback" page
      And user is in the "Digital Bill Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

    Examples:
          | button_name | button_id                       | jira_id      |
          | Exit        | exit_button                     | QANOV-204703 |
          | Close       | navigation_top_bar.close_button | QANOV-204704 |

  @jira.QANOV-204705 @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-204701 @jira.link.depends_on.QANOV-204702
  @manual @mobile @regression
  Scenario: A postpay user can go to previous screen from the "Digital Bill Error Feedback" screen on iOS devices
    User can arrive to this Error Feedback screen by activating the digital bill or by changing the digital bill email.
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has the "Digital Bill Error Feedback" module configured in CMS for "Digital Bill Error Feedback" page
      And user is in the "Digital Bill Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed

  @jira.QANOV-285583 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204681 @manual @mobile @raitt_drop2
  @regression
  Scenario: Postpay user with digital bill activated can see the "billing notifications" setting in the Digital Bill screen when it's deactivated
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "disabled" in the application
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     Then the "billing_sms_notifications_entrypoint" entrypoint with "Rechnungs-Benachrichtigung per SMS" text is displayed
      And the "billing_sms_notifications_description" textfield is not displayed

  @jira.QANOV-285584 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-204681 @jira.link.detects.O2DE-2231
  @manual @mobile @raitt_drop2 @regression
  Scenario: Postpay user with digital bill activated can see the "billing notifications" setting in the Digital Bill screen when it's activated
    If the digital bill setting is active, the phone number configured for the notifications will be displayed under the entrypoint.
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     Then the "billing_sms_notifications_entrypoint" entrypoint with "Rechnungs-Benachrichtigung per SMS" text is displayed
      And the "billing_sms_notifications_description" textfield with the "\d+" format is displayed

  @jira.<jira_id> @blaude @jira.cv.14.0 @live @mobile @next @raitt_drop2 @sanity
  Scenario Outline: A postpay user can access to the "Billing Notifications" screen
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital Bill" module configured in CMS for "Digital Bill" page
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Digital Bill" page
     When clicks on the "billing_sms_notifications_entrypoint" entrypoint
     Then the "Billing Sms Notifications" page is displayed
      And the "Benachrichtigung per SMS" header is displayed
      And the "title" textfield with "SMS-Rechnungsbenachrichtigung" text is displayed
      And the "description" textfield with "Benachrichtigungen zu Abschluss, Zahlung oder Problemen mit deiner Rechnung kannst du auch per SMS erhalten." text is displayed
      And the "notification_switch" switch is displayed
      And the "notification_switch_title" textfield with "SMS-Benachrichtigungen erhalten" text is displayed
      And the "notification_switch_description" textfield with "Erhalt von Rechnungs-SMS mit dieser Option deaktivieren" text is displayed
      And the "save_number_button" button with "Speichern" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Digital Bill" page is displayed

    @android @automatic @qa @webapp
    Examples:
          | jira_id      |
          | QANOV-217273 |

    @ios @manual
    Examples:
          | jira_id      |
          | QANOV-358828 |

  @jira.QANOV-217276 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217273 @manual @mobile @raitt_drop2
  @smoke
  Scenario: Postpay user with the Billing Notifications disabled can see the content of the "Billing Notifications" screen
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "disabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     Then the "billing_notification_switch" switch is disabled
      And the "billing_notification_description" textfield with "Erhalt von Rechnungs-SMS mit dieser Option deaktivieren" text is displayed
      And the "mobile_number_title" textfield is not displayed
      And the "mobile_number_inputtext" inputtext is not displayed
      And the "save_number_button" button with "Speichern" text is displayed

  @jira.QANOV-217278 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217273 @manual @mobile @raitt_drop2
  @smoke
  Scenario: Postpay user with the Billing Notifications enabled can see the content of the "Billing Notifications" screen
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     Then the "billing_notification_switch" switch is enabled
      And the "billing_notification_description" textfield with "Erhalt von Rechnungs-SMS mit dieser Option deaktivieren" text is displayed
      And the "mobile_number_title" textfield with "Handynumner für SMS-Benachrichtigungen" text is displayed
      And the "mobile_number_inputtext" inputtext with the "Telefonnummer" placeholder is displayed
      And the "save_number_button" button with "Speichern" text is displayed

  @jira.QANOV-217280 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217276
  @jira.link.depends_on.QANOV-217278 @manual @mobile @regression
  Scenario: Postpay user cannot save the billing notifications configuration without making any change
    Given user has "digital_bill" service in "activated" status
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "save_number_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Du hast keine Änderungen vorgenommen." text is displayed

  @jira.QANOV-217282 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217276 @manual @mobile @regression
  Scenario: Postpay user can tap on back button after making any change in the billing notifications configuration
    Given user has "digital_bill" service in "activated" status
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And clicks on the "navigation_top_bar.back_button" button
     Then the "Billing Notifications Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen Ihre Eingaben verloren" text is displayed
      And the "popup.accept" button with the "(ABBRECHEN|Abbrechen)" format is displayed
      And the "popup.cancel" button with the "(VERLASSEN|Verlassen)" format is displayed

  @jira.QANOV-217286 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217282 @manual @mobile @regression
  Scenario: Postpay user decides to cancel with the "billing notifications" flow after seeing the Billing Notifications Cancellation popup
    Given user has "digital_bill" service in "activated" status
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Notifications Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed

  @jira.QANOV-217288 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217282 @manual @mobile @regression
  Scenario: Postpay user decides to continue with the "billing notifications" flow after seeing the Billing Notifications Cancellation popup
    Given user has "digital_bill" service in "activated" status
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Notifications Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Billing Sms Notifications" page is displayed
      And the "Rechnungsbenachrichtigungen per SMS" header is displayed

  @jira.QANOV-217290 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217276 @manual @mobile @regression
  Scenario: Postpay user cannot enable the billing notifications without filling the mobile number field
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "disabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And clicks on the "save_number_button" button
     Then the "mobile_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-217292 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217276 @manual @mobile @regression
  Scenario: Postpay user cannot enable the billing notifications without inserting a valid mobile number
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "disabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And fills the "mobile_number_inputtext" inputtext with the "123456789" text
      And clicks on the "save_number_button" button
     Then the "mobile_number_error_textfield" textfield with "Handynummer ist ein Pflichtfeld für den Erhalt von SMS. Bitte gültige Nummer angeben" text is displayed

  @jira.QANOV-217294 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217276 @manual @mobile @regression
  Scenario: Postpay user can enable the billing notifications: a confirmation popup is displayed
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "disabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And fills the "mobile_number_inputtext" inputtext with the "15234567891" text
      And clicks on the "save_number_button" button
     Then the "Billing Sms Notifications Change Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Diese kannst du in deinem Profilbereich erneut ändern." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-285585 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217294 @manual @mobile @regression
  Scenario: Postpay user cancels to enable the billing notifications
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "disabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And fills the "mobile_number_inputtext" inputtext with the "15234567891" text
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Billing Sms Notifications" page is displayed
      And the "Rechnungsbenachrichtigungen per SMS" header is displayed

  @jira.<jira_id> @<client> @<execution> @ber @blaude @jira.cv.14.0 @jira.link.depends_on.QANOV-217294 @mobile @qa
  @raitt_drop2 @smoke
  Scenario Outline: Postpay user confirms to enable the billing SMS notifications: billing SMS notifications enabled successfully
    If user enables the billing SMS notifications, he/she will receive an SMS when the bill is ready.
    NOTE: if the billing SMS activation takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has "digital_bill" service in "activated" status
      And user has "billing_sms_notifications" service in "deactivated" status
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "notification_switch" switch
      And fills the "mobile_number_inputtext" inputtext with the "15234567891" text
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Dein Auftrag ist bei uns eingegangen" text is displayed
      And the "message" textfield with "Dein Daten werden in kürze aktualisiert" text is displayed
      And the "main_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-285586 |
          | ios     | manual    | QANOV-344063 |

  @jira.QANOV-217296 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217294 @jira.link.detects.O2DE-1955
  @manual @mobile @regression
  Scenario: Postpay user wants to enable the billing notifications but an error happens: process finished unsuccessfully
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "disabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user has the "Billing Notifications Error Feedback" module configured in CMS for "Billing Notifications Error Feedback" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And fills the "mobile_number_inputtext" inputtext with the "15234567891" text
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And there is an error enabling the billing notifications
     Then the "Billing Notifications Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Anforderung aktuell unsendbar" text is displayed
      And the "error_message" textfield with "Bitte versuchen es später noch einmal." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

  @jira.QANOV-217298 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217278 @manual @mobile @regression
  Scenario: Postpay user cannot save the billing notifications after removing the mobile number
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clears the "mobile_number_inputtext" inputtext
      And clicks on the "save_number_button" button
     Then the "mobile_number_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-217300 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217278 @manual @mobile @regression
  Scenario: Postpay user cannot save the billing notifications without inserting a new valid mobile number
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clears the "mobile_number_inputtext" inputtext
      And fills the "mobile_number_inputtext" inputtext with the "123456789" text
      And clicks on the "save_number_button" button
     Then the "mobile_number_error_textfield" textfield with "Handynummer ist ein Pflichtfeld für den Erhalt von SMS. Bitte gültige Nummer angeben" text is displayed

  @jira.QANOV-217302 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217278 @manual @mobile @regression
  Scenario: Postpay user can edit the mobile number in the billing notifications: a confirmation popup is displayed
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When fills the "mobile_number_inputtext" inputtext with a different text
      And clicks on the "save_number_button" button
     Then the "Billing Sms Notifications Change Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Diese kannst du in deinem Profilbereich erneut ändern." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-285587 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217302 @manual @mobile @regression
  Scenario: Postpay user cancels to edit the mobile number in the billing notifications
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When fills the "mobile_number_inputtext" inputtext with a different text
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Billing Sms Notifications" page is displayed
      And the "Rechnungsbenachrichtigungen per SMS" header is displayed

  @jira.QANOV-285588 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217302 @jira.link.detects.O2DE-2232
  @manual @mobile @smoke
  Scenario: Postpay user confirms to edit the mobile number in the billing notifications: billing notifications changed successfully
    NOTE: if the billing SMS change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user has the "Billing Notifications Success Feedback" module configured in CMS for "Billing Notifications Success Feedback" page
      And user is in the "Billing Sms Notifications" page
     When fills the "mobile_number_inputtext" inputtext with a different text
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Billing Notifications Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Dein Auftrag ist bei uns eingegangen" text is displayed
      And the "success_message" textfield with "Dein Daten werden in kürze aktualisiert" text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

  @jira.QANOV-620345 @android @blaude @e2e @ios @jira.cv.24.2 @jira.link.depends_on.QANOV-217302 @manual @mobile
  @regression
  Scenario: Postpay user edit the mobile number in the billing notifications but the confirmation takes too long: an informative screen is displayed
    Given user has "digital_bill" service in "activated" status
      And user has the "Digital bill" module configured in CMS for "Digital Bill" page
      And user is in the "Digital Bill" page
     When fills the "email" inputtext with the "user@mail.com" text
      And clicks on the "change_digital_bill_email_button" button
      And the "Change Digital Bill Email Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And the billing notification change takes too long
     Then the "Billing Notification Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "exit_button" button with "Schließen" text is displayed

  @jira.QANOV-620346 @android @blaude @e2e @ios @jira.cv.24.2 @jira.link.depends_on.QANOV-620345 @manual @mobile
  @regression
  Scenario: Postpay user can go back to "Bills" screen from the "Billing Notification Informative Feedback" screen
    Given user has the "Billing Notification Informative Feedback" module configured in CMS for "Billing Notification Informative Feedback" page
      And user is in the "Billing Notification Informative Feedback" page
     When clicks on the "exit_button" button
     Then the "Bills" page is displayed
      And the "Rechnungen" header is displayed

  @jira.QANOV-217304 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217302 @jira.link.detects.O2DE-1955
  @manual @mobile @regression
  Scenario: Postpay user wants to edit the mobile number in the billing notifications but an error happens: process finished unsuccessfully
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user has the "Billing Notifications Error Feedback" module configured in CMS for "Billing Notifications Error Feedback" page
      And user is in the "Billing Sms Notifications" page
     When fills the "mobile_number_inputtext" inputtext with a different text
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And there is an error editing the mobile number in the billing notifications
     Then the "Billing Notifications Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Anforderung aktuell unsendbar" text is displayed
      And the "error_message" textfield with "Bitte versuchen Sie es später noch einmal." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

  @jira.QANOV-217306 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217278 @manual @mobile @regression
  Scenario: Postpay user can disable the billing notifications: a confirmation popup is displayed
    If user disables the billing notifications, he/she will not receive a SMS when the bill is ready.
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user has the "Billing Notifications Success Feedback" module configured in CMS for "Billing Notifications Success Feedback" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And clicks on the "save_number_button" button
     Then the "Billing Sms Notifications Change Confirmation" popup is displayed
      And the "popup.title" textfield with "Änderungen speichern" text is displayed
      And the "popup.message" textfield with "Diese kannst du in deinem Profilbereich erneut ändern." text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with the "(ABBRECHEN|Abbrechen)" format is displayed

  @jira.QANOV-285589 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217306 @manual @mobile @regression
  Scenario: Postpay user cancels to disable the billing notifications
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Billing Sms Notifications" page is displayed
      And the "Rechnungsbenachrichtigungen per SMS" header is displayed

  @jira.<jira_id> @<client> @<execution> @blaude @jira.cv.14.0 @jira.link.depends_on.QANOV-217306
  @jira.link.detects.O2DE-2232 @mobile @qa @raitt_drop2 @smoke
  Scenario Outline: Postpay user confirms to disable the billing SMS notifications: billing SMS notifications disabled successfully
    'navigation_top_bar.close_button' button is not displayed in this Success Feedback screen.
    NOTE: if the billing SMS deactivation takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has "digital_bill" service in "activated" status
      And user has "billing_sms_notifications" service in "activated" status
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "notification_switch" switch
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Dein Auftrag ist bei uns eingegangen" text is displayed
      And the "message" textfield with "Dein Daten werden in kürze aktualisiert" text is displayed
      And the "main_button" button with "Schließen" text is displayed

    Examples:
          | client  | execution | jira_id      |
          | android | automatic | QANOV-285590 |
          | ios     | manual    | QANOV-344064 |

  @jira.QANOV-217308 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217306 @jira.link.detects.O2DE-1955
  @manual @mobile @regression
  Scenario: Postpay user wants to disable the billing notifications but an error happens: process finished unsuccessfully
    Given user has "digital_bill" service in "activated" status
      And user has billing notifications "enabled" in the application
      And user has the "Billing Sms Notifications" module configured in CMS for "Billing Sms Notifications" page
      And user has the "Billing Notifications Error Feedback" module configured in CMS for "Billing Notifications Error Feedback" page
      And user is in the "Billing Sms Notifications" page
     When clicks on the "billing_notification_switch" switch
      And clicks on the "save_number_button" button
      And the "Billing Sms Notifications Change Confirmation" popup is displayed
      And clicks on the "popup.accept" button
      And there is an error disabling the billing notifications
     Then the "Billing Notifications Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Anforderung aktuell unsendbar" text is displayed
      And the "error_message" textfield with "Bitte versuchen Sie es später noch einmal." text is displayed
      And the "exit_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

  @jira.QANOV-217310 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-285586
  @jira.link.depends_on.QANOV-285588 @jira.link.depends_on.QANOV-285590 @manual @mobile @regression
  Scenario: Postpay user who is in the "Billing Notifications Success Feedback" screen can tap on the "Exit" button
    Given user has "digital_bill" service in "activated" status
      And user has the "Billing Notifications Success Feedback" module configured in CMS for "Billing Notifications Success Feedback" page
      And user is in the "Billing Notifications Success Feedback" page
     When clicks on the "exit_button" button
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed

  @jira.QANOV-217312 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217296
  @jira.link.depends_on.QANOV-217304 @jira.link.depends_on.QANOV-217308 @manual @mobile @regression
  Scenario: Postpay user who is in the "Billing Notifications Error Feedback" screen can tap on the "Exit" button
    Given user has "digital_bill" service in "activated" status
      And user has the "Billing Notifications Error Feedback" module configured in CMS for "Billing Notifications Error Feedback" page
      And user is in the "Billing Notifications Error Feedback" page
     When clicks on the "exit_button" button
     Then the "Digital Bill" page is displayed
      And the "Online-Rechnung" header is displayed

  @jira.QANOV-217314 @android @blaude @ios @jira.cv.14.0 @jira.link.depends_on.QANOV-217296
  @jira.link.depends_on.QANOV-217304 @jira.link.depends_on.QANOV-217308 @manual @mobile @regression
  Scenario: Postpay user can go to previous screen from the "Billing Notifications Error Feedback" screen
    Given user has "digital_bill" service in "activated" status
      And user has the "Billing Notifications Error Feedback" module configured in CMS for "Billing Notifications Error Feedback" page
      And user is in the "Billing Notifications Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Billing Sms Notifications" page is displayed
      And the "Rechnungsbenachrichtigungen per SMS" header is displayed
