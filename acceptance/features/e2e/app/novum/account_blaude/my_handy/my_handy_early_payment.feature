# -*- coding: utf-8 -*-
@jira.QANOV-224593
Feature: My Handy early payment

  Actions Before each Scenario:
    Given user has the "My Handy card" module configured in CMS for "Account" page
      And user has the "My Handy Details" module configured in CMS for "My Handy Details" page
      And user has a "my_handy" product in "active" status


  @jira.<jira_id> @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @mobile @<test_priority> @webapp
  Scenario Outline: Postpay user who has a MyHandy product with a "<contract_status>" contract can see the "Early payment" module in the "My Handy Details" screen
    Given user has a "postpay" account type
      And user has a "my_handy" product with a "<contract_status>" contract
      And user has the matching subscription selected in the account
      And user is in the "Account" page
     When clicks on the "myhandy.link" link
      And the "My Handy Details" page is displayed
     Then the "early_payment" module is displayed
      And the "early_payment.title" textfield with "<title>" text is displayed
      And the "early_payment.description" textfield with "<description>" text is displayed
      And the "early_payment.request_link" link with "<link>" text is displayed

    @automatic @qa
    Examples:
          | contract_status         | title                            | description                                                                                                | link                            | test_priority | depends_on   | detects    | jira_id      |
          | ongoing                 | Vorzeitige Abzahlung             | Zahlen den gesamten Restbetrag deines Geräts auf einmal ab.                                                | Vorzeitige Abzahlung beantragen | sanity        | QANOV-215960 | OBO2DE-258 | QANOV-224594 |
          | early_payment_requested | Vorzeitige Abzahlung angefragt   | Die vorzeitige Abzahlung wurde beantragt. Wenn du den Vorgang abbrechen möchtest, wende dich bitte an uns. | Vorzeitige Abzahlung abbrechen  | smoke         | QANOV-215961 |            | QANOV-224595 |

    @manual
    Examples:
          | contract_status         | title                            | description                                                                                                | link                            | test_priority | depends_on   | detects    | jira_id      |
          | early_payment_cancelled | Vorzeitige Abzahlung abgebrochen | Die vorzeitige Abzahlung wurde abgebrochen. Du kannst sie jedoch jederzeit erneut beantragen.              | Vorzeitige Abzahlung beantragen | smoke         | QANOV-215962 |            | QANOV-224596 |
          | overdue                 | Vorzeitige abzahlung             | Zahlen den gesamten Restbetrag deines Geräts auf einmal ab.                                                | Vorzeitige Abzahlung beantragen | smoke         | QANOV-215963 |            | QANOV-224597 |

  @jira.QANOV-224598 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224594 @webapp
  @jira.link.depends_on.QANOV-224596 @jira.link.depends_on.QANOV-224597 @automatic @mobile @smoke @qa @ber @raitt_drop1
  Scenario: Postpay user who has a MyHandy product with a "Ongoing", "Early payment canceled" or "Overdue" contract can access to the "Early Payment" screen
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
      And user has the matching subscription selected in the account
      And user has the "Early Payment" module configured in CMS for "Early Payment" page
      And user is in the "Account" page
     When clicks on the "myhandy.link" link
      And the "My Handy Details" page is displayed
      And clicks on the "early_payment.request_link" link
     Then the "Early Payment" page is displayed
      And the "Vorzeitige Abzahlung" header is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Zahle ganz einfach den Restbetrag für dein Gerät mit der nächsten Rechnung ab." text is displayed
      And the "subtitle" textfield with "VORZEITIGE ABZAHLUNG FÜR FOLGENDEN VERTRAG:" text is displayed
      And the "model_name_label" textfield with "Dein Gerät" text is displayed
      And the "model_name_value" textfield is displayed
      And the "contract_number_label" textfield with "Vertragsnummer" text is displayed
      And the "contract_number_value" textfield is displayed
      And the "contract_start_date_label" textfield with "Vertragsbeginn" text is displayed
      And the "contract_start_date_value" textfield with the "\d+. (Jan.|Feb.|März|Apr.|Mai|Juni|Juli|Aug.|Sept.|Okt.|Nov.|Dez.) \d{2}" format is displayed
      And the "remaining_amount_label" textfield with "Gesamtbetrag" text is displayed
      And the "remaining_amount_value" textfield with the "\d+,\d{2} €" format is displayed
      And the "status_label" textfield with "Status" text is displayed
      And the "status_value" textfield with the "(Laufend|Vorzeitge Abzahlung abgebrochen|Überfällig)" format is displayed
      And the "order_information" textfield with "Sobald dein Auftrag eingegangen ist, senden wir dir eine schriftliche Bestätigung mit allen Details zur vorzeitigen Abzahlung an deine hinterlegte Rechnungadresse." text is displayed
      And the "contact_email_title" textfield with "KONTAKT E-MAIL ADRESSE" text is displayed
      And the "contact_email_information" textfield with "Um den Prozess abzuschließen, benötigen wir deine E-Mail Adresse. Bitte überprüfe oder hinterlege deine E-Mail Adresse." text is displayed
      And the "contact_email_value" textfield is displayed
      And the "request_early_payment_button" button with "Vorzeitige Abzahlung beantragen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button to go back to the previous page
      And the "My Handy Details" page is displayed

  @jira.QANOV-224599 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224598 @automatic @mobile @smoke
  @ber @qa @raitt_drop1
  Scenario: Postpay user who has a MyHandy product with a "Ongoing", "Early payment canceled" or "Overdue" contract can request the early payment successfully
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
      And user has the matching subscription selected in the account
      And user has the "Early Payment" module configured in CMS for "Early Payment" page
      And user has the "Early Payment Success Feedback" module configured in CMS for "Early Payment Success Feedback" page
      And user is in the "Early Payment" page
     When clicks on the "request_early_payment_button" button
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vorzeitige Abzahlung wurde angefragt." text is displayed
      And the "message" textfield with "Deine vorzeitige Abzahlung wurde beantragt. In Kürze senden wir dir eine Bestätigung an deine Kontakt E-Mail Adresse." text is displayed
      And the "main_button" button with "Zurück zu My Handy" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Handy Details" page is displayed

  @jira.QANOV-224600 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224599 @manual @mobile @regression
  Scenario: A postpay can go back to "My Handy Details" screen from the "Early Payment Success Feedback" screen
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
      And user has the matching subscription selected in the account
      And user has the "Early Payment Success Feedback" module configured in CMS for "Early Payment Success Feedback" page
      And user is in the "Early Payment Success Feedback" page
     When clicks on the "main_button" button
     Then the "My Handy Details" page is displayed

  @jira.QANOV-224602 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224598 @manual @mobile @regression
  Scenario: Postpay user tries to request the early payment but an error happens (first 3 attempts)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to request the early
    payment without success. The fourth attempt will redirect to a full screen error feedback.
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
      And user has tried to request the early payment "<3" times without success
      And user has the matching subscription selected in the account
      And user has the "Early Payment" module configured in CMS for "Early Payment" page
      And user is in the "Early Payment" page
     When clicks on the "request_early_payment_button" button
      And there is an error requesting the early payment
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "Es ist ein Fehler aufgetreten" text is displayed

  @jira.QANOV-224603 @android @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-224602 @manual @mobile @regression
  Scenario: Postpay user can close the error warning after trying to request the early payment without success
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
      And user has tried to request the early payment "<3" times without success
      And user has the matching subscription selected in the account
      And user has the "Early Payment" module configured in CMS for "Early Payment" page
      And user is in the "Early Payment" page
     When clicks on the "request_early_payment_button" button
      And there is an error requesting the early payment
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Early Payment" page is displayed
      And the "error_warning" warning is not displayed

  @jira.QANOV-224604 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224598 @jira.link.detects.OBO2DE-90
  @manual @mobile @regression
  Scenario: Postpay user tries to request the early payment but an error happens (fourth attempts)
    The user will see a red warning at the bottom of the screen the first 3 times that he/she tries to request the early
    payment without success. The fourth attempt will redirect to a full screen error feedback.
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
      And user has tried to request the early payment "3" times without success
      And user has the matching subscription selected in the account
      And user has the "Early Payment" module configured in CMS for "Early Payment" page
      And user has the "Early Payment Error Feedback" module configured in CMS for "Early Payment Error Feedback" page
      And user is in the "Early Payment" page
     When clicks on the "request_early_payment_button" button
      And there is an error requesting the early payment
     Then the "Feedback" page is displayed
      And the "icon" icon is displayed
      And the "title" textfield with "Vorzeitunge Abzahhlung fehlgeschlagen" text is displayed
      And the "message" textfield with "Die vorzeitige Abzahlung konnte leider nicht durchgeführt werden. Bitte versuche es später erneut." text is displayed
      And the "main_button" button with "Zurück zu My Handy" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Handy Details" page is displayed

  @jira.QANOV-224606 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224604 @manual @mobile @regression
  Scenario: A postpay user who is in the "Early Payment Error Feedback" screen can go back to "My Handy Details" screen
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
      And user has the matching subscription selected in the account
      And user has the "Early Payment Error Feedback" module configured in CMS for "Early Payment Error Feedback" page
      And user is in the "Early Payment Error Feedback" page
     When clicks on the "back_to_myhandy_button" button
     Then the "My Handy Details" page is displayed

  @jira.<jira_id> @<client> @blaude @jira.cv.13.9 @jira.link.depends_on.QANOV-224604 @manual @mobile @regression
  Scenario Outline: A postpay user can go to previous screen from the the "Early Payment Error Feedback" screen on <client> devices
    Given user has a "postpay" account type
      And user has a "my_handy" product with any of "ongoing;early_payment_cancelled;overdue" contracts
      And user has the matching subscription selected in the account
      And user has the "Early Payment Error Feedback" module configured in CMS for "Early Payment Error Feedback" page
      And user is in the "Early Payment Error Feedback" page
     When clicks on the <button> button
     Then the "Early Payment" page is displayed
      And the "Vorzeitige Abzahlung" header is displayed

    Examples:
          | client  | button                           | jira_id      |
          | android | native "back"                    | QANOV-224608 |
          | ios     | "navigation_top_bar.back_button" | QANOV-224609 |

  @jira.QANOV-224610 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224595 @jira.link.detects.OBO2DE-91
  @jira.link.detects.LOC-1186 @automatic @mobile @smoke @ber @qa @raitt_drop1
  Scenario: Postpay user who has a MyHandy product with a "Early payment requested" contract can access to the "Cancel Early Payment" screen
    Given user has a "postpay" account type
      And user has a "my_handy" product with a "early_payment_requested" contract
      And user has the matching subscription selected in the account
      And user has the "Cancel Early Payment" module configured in CMS for "Cancel Early Payment" page
      And user is in the "My Handy Details" page
     When clicks on the "early_payment.cancel_link" link
     Then the "Cancel Early Payment" page is displayed
      And the "Abzahlung abbrechen" header is displayed
      And the "title" textfield with "Kontaktkanal wählen" text is displayed
      And the "description" textfield with "Bitte wähle aus, über welchen Kontaktkanal du den Abbruch der vorzeitigen Abzahlung vornehmen möchtest." text is displayed
      And the "call_me_back_entrypoint" entrypoint with "Rückrufservice" text is displayed
      And the "click_to_call_entrypoint" entrypoint with "Hotline" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "My Handy Details" page is displayed

  @jira.QANOV-224611 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224610 @manual @mobile @regression
  Scenario: Postpay user who has a MyHandy product with a "Early payment requested" contract can access to the "Call me back" screen from the "Cancel Early Payment" screen
    The complete "Call me back" flow is defined in the "support" folder.
    Given user has a "postpay" account type
      And user has a "my_handy" product with a "early_payment_requested" contract
      And user has the matching subscription selected in the account
      And user has the "Cancel Early Payment" module configured in CMS for "Cancel Early Payment" page
      And user is in the "Cancel Early Payment" page
     When clicks on the "call_me_back_entrypoint" entrypoint
     Then the "Call Me Back" page is displayed
      And the "Rückrufservice" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Handy Details" page is displayed

  @jira.QANOV-224612 @android @blaude @ios @jira.cv.13.9 @jira.link.depends_on.QANOV-224610 @manual @mobile @regression
  Scenario: Postpay user who has a MyHandy product with a "Early payment requested" contract can access to the "Click to call" screen from the "Cancel Early Payment" screen
    The complete "Click to call" flow is defined in the "support" folder.
    Given user has a "postpay" account type
      And user has a "my_handy" product with a "early_payment_requested" contract
      And user has the matching subscription selected in the account
      And user has the "Cancel Early Payment" module configured in CMS for "Cancel Early Payment" page
      And user is in the "Cancel Early Payment" page
     When clicks on the "click_to_call_entrypoint" entrypoint
     Then the "Click To Call" page is displayed
      And the "Hotline" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Handy Details" page is displayed
