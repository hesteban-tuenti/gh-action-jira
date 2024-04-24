# -*- coding: utf-8 -*-
@jira.QANOV-228537
Feature: Line number

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has not the "CUSTOMER_UPDATE_DATA" forbidden use case


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @mobile @sanity @har
  Scenario Outline: A user with only a mobile line can access to the "Change Number Info" screen
    Given user has a "mobile_line" product in "active" status
      And user has "1" mobile lines
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Change Number Info" module configured in CMS for "Change Number Info" page
      And user is in the "Change Contact Details" page
     When clicks on the "line_number_entrypoint.chevron" entrypoint
     Then the "Change Number Info" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Infos zum Rufnummerntausch" text is displayed
      And the "description" textfield with "Falls du z.B. aufgrund von Störanrufen, deine Rufnummer wechseln möchtest, kannst du hier deine neue Nummer beantragen." text is displayed
      And the "description2" textfield with "Bitte beachte, dass deine aktuelle Rufnummer im Anschluss nicht mehr für dich zur Verfügung steht." text is displayed
      And the "conditions_title" textfield with "KONDITIONEN" text is displayed
      And the "conditions_description1" textfield with "Wunschrufnummer nicht möglich" text is displayed
      And the "conditions_description2" textfield with "Alle Tarifbestandteile bleiben unverändert" text is displayed
      And the "conditions_description3" textfield with the "Es entstehen einmalig \d+,\d\d € Service-Kosten*" format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    @automatic @live @next
    Examples:
          | product | cv   | depends_on   | detects               | jira_id      |
          | blaude  | 13.9 | QANOV-217759 | OBO2DE-181:OBO2DE-188 | QANOV-228538 |

    @live @manual @next
    Examples:
          | product | cv   | depends_on   | detects   | jira_id      |
          | o2de    | 14.2 | QANOV-217760 | O2DE-3491 | QANOV-228539 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A user with several mobile lines can access to the "Change number select line" screen
    Given user has a "mobile_line" product in "active" status
      And user has "several" mobile lines
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Change Number Select Line" module configured in CMS for "Change Number Select Line" page
      And user is in the "Change Contact Details" page
     When clicks on the "line_number_entrypoint" entrypoint
     Then the "Change Number Select Line" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "lines_list" list is displayed
      And each element in the "lines_list" list has the "mobile_icon" field
      And each element in the "lines_list" list has the "name" field
      And each element in the "lines_list" list has the "phone_number" field
      And each element in the "lines_list" list has the "chevron_icon" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-217759 | QANOV-228540 |
          | o2de    | 14.2 | QANOV-217760 | QANOV-228541 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user with several mobile lines can access to the "Change number Info" screen from the "Change number select line" screen
    Given user has a "mobile_line" product in "active" status
      And user has "several" mobile lines
      And user has the "Change Number Select Line" module configured in CMS for "Change Number Select Line" page
      And user has the "Change Number Info" module configured in CMS for "Change Number Info" page
      And user is in the "Change Number Select Line" page
     When clicks on any "mobile_line" element in the "lines_list" list
     Then the "Change Number Info" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Infos zum Rufnummerntausch" text is displayed
      And the "description1" textfield with "Falls du z.B. aufgrund von Störanrufen, deine Rufnummer wechseln möchtest, kannst du hier deine neue Nummer beantragen." text is displayed
      And the "description2" textfield with "Bitte beachte, dass deine aktuelle Rufnummer im Anschluss nicht mehr für dich zur Verfügung steht." text is displayed
      And the "conditions_title" textfield with "KONDITIONEN" text is displayed
      And the "conditions_description1" textfield with "Wunschrufnummer nicht möglich" text is displayed
      And the "conditions_description2" textfield with "Alle Tarifbestandteile bleiben unverändert" text is displayed
      And the "conditions_description3" textfield with the "Es entstehen einmalig \d+,\d\d € Service-Kosten*" format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-228540 | QANOV-228542 |
          | o2de    | 14.2 | QANOV-228541 | QANOV-228543 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user with mobile line can access to the "Change number how it works" screen from the "Change number info" screen
    Given user has a "mobile_line" product in "active" status
      And user has the "Change Number Info" module configured in CMS for "Change Number Info" page
      And user has the "Change Number How It Works" module configured in CMS for "Change Number How It Works" page
      And user is in the "Change Number Info" page
     When clicks on the "continue_button" button
     Then the "Change Number How It Works" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "title" textfield with "So funktioniert's" text is displayed
      And the "description" textfield with "Bitte befolge folgende Schritte:" text is displayed
      And the "step1_icon" icon is displayed
      And the "step1_description" textfield with "Rufnummerntausch beantragen" text is displayed
      And the "step2_icon" icon is displayed
      And the "step2_description" textfield with "Handy für 2 Stunden ausschalten" text is displayed
      And the "step3_icon" icon is displayed
      And the "step3_description" textfield with "Handy wieder einschalten und neue Rufnummer per SMS erhalten" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-228538:QANOV-228542 | QANOV-228544 |
          | o2de    | 14.2 | QANOV-228539:QANOV-228543 | QANOV-228545 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user with enough balance can access to the "Change Number Summary" screen from the "Change number how it works" screen
    Given the price to change number is available in the system
      And user has a "prepay" account type
      And user has enough balance to change the number
      And user has the "Change Number How It Works" module configured in CMS for "Change Number How It Works" page
      And user has the "Change Number Summary" module configured in CMS for "Change Number Summary" page
      And user is in the "Change Number How It Works" page
     When clicks on the "continue_button" button
     Then the "Change Number Summary" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "title" textfield with "Summary" text is displayed
      And the "description" textfield with "There is a One-time service cost which will be paid with your current active balance." text is displayed
      And the "balance.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "balance.label" textfield with "Current balance" text is displayed
      And the "service.value" textfield with "One-time service cost" text is displayed
      And the "service.label" textfield with "(VAT included)" text is displayed
      And the "service.cost" textfield with the "\d+,\d{2} €" format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228544 | QANOV-228546 |
          | o2de    | Future | QANOV-228545 | QANOV-228547 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A prepay user without enough balance can access to the "Change Number Summary" screen from the "Change number how it works" screen
    It will be an alert with a title, a description and a "topup" button:
    - The title configured in CMS for this alert should be "You need to top up first".
    - The description configured in CMS for this alert should be "For change number services you need to have enough
    balance at the time of purchase".
    - The topup button will redirect to the Topup screen.
    - No "close" button will be displayed for this alert.
    Given the price to change number is available in the system
      And user has a "prepay" account type
      And user has not enough balance to change the number
      And user has the "Change Number How It Works" module configured in CMS for "Change Number How It Works" page
      And user has the "Alerts;Change Number Summary" modules configured in CMS for "Change Number Summary" page
      And the "Alerts" module configured in CMS for "Change Number Summary" page has a "insufficient-balance-to-change-number" preconfigured provider
      And user is in the "Change Number How It Works" page
     When clicks on the "continue_button" button
     Then the "Change Number Summary" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "alert" element is on display
      And the "alert.title" textfield with "[CONTEXT:preconfigured_alert.title]" text is displayed
      And the "alert.description" textfield with the "[CONTEXT:preconfigured_alert.description]" format is displayed
      And the "alert.topup_button" button with "Aufladen" text is displayed
      And the "alert.close_button" button is not displayed
      And the "title" textfield with "Summary" text is displayed
      And the "description" textfield with "There is a One-time service cost which will be paid with your current active balance." text is displayed
      And the "balance.insufficient_balance_tag" textfield with "You need to top up" text is displayed
      And the "balance.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "balance.label" textfield with "Current balance" text is displayed
      And the "service.value" textfield with "One-time service cost" text is displayed
      And the "service.label" textfield with "(VAT included)" text is displayed
      And the "service.cost" textfield with the "\d+,\d{2} €" format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228544 | QANOV-228548 |
          | o2de    | Future | QANOV-228545 | QANOV-228549 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.<detects>
  @jira.link.detects.O2DE-1775 @manual @mobile @smoke
  Scenario Outline: A postpay user with mobile line can access to the "Change Number Summary" screen from the "Change number how it works" screen when the change number prices is available
    If the price of changing the number is available, the "Change Number Summary" screen will be displayed (this price is
    only available in RAIIT). If not, the "Change Number Confirmation" will be displayed (BOX7 system).
    Given user has a "mobile_line" product in "active" status
      And the price to change number is available in the system
      And user has a "postpay" account type
      And user has the "Change Number How It Works" module configured in CMS for "Change Number How It Works" page
      And user has the "Change Number Summary" module configured in CMS for "Change Number Summary" page
      And user is in the "Change Number How It Works" page
     When clicks on the "continue_button" button
     Then the "Change Number Summary" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "title" textfield with "Rufnummerntausch beantragen" text is displayed
      And the "description" textfield with "Die einmaligen Servicekosten werden auf deiner nächsten Rechnung aufgeführt" text is displayed
      And the "service.value" textfield with "Einmalige Servicekosten" text is displayed
      And the "service.label" textfield with "(inkl. MwSt.)" text is displayed
      And the "service.cost" textfield with the "\d+,\d{2} €" format is displayed
      And the "continue_button" button with "Rufnummerntausch beantragen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv     | depends_on   | detects    | jira_id      |
          | blaude  | Future | QANOV-228544 | OBO2DE-195 | QANOV-228550 |
          | o2de    | Future | QANOV-228545 |            | QANOV-228551 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A postpay user with mobile line can access to the "Change Number Confirmation" screen from the "Change number how it works" screen when the change number prices is not available
    If the price of changing the number is available, the "Change Number Summary" screen will be displayed (this price is
    only available in RAIIT). If not, the "Change Number Confirmation" will be displayed (BOX7 system).
    Given user has a "mobile_line" product in "active" status
      And the price to change number is not available in the system
      And user has a "postpay" account type
      And user has the "Change Number How It Works" module configured in CMS for "Change Number How It Works" page
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number How It Works" page
     When clicks on the "continue_button" button
     Then the "Change Number Confirmation" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "title" textfield with "Bestätigung Rufnummerntausch" text is displayed
      And the "description" textfield with "Du erhältst eine Bestätigung an deine hinterlegte E-Mail Adresse." text is displayed
      And the "email_address_value" textfield is displayed
      And the "email_address_label" textfield is displayed
      And the "email_address_chevron" icon is displayed
      And the "continue_button" button with "Jetzt bezahlen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-228544 | QANOV-286988 |

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-228545 | QANOV-286989 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1777
  @manual @mobile @regression
  Scenario Outline: A prepay user without enough balance taps on the alert link in "Change Number Summary" screen: a popup is displayed
    Given user has a "prepay" account type
      And user has not enough balance to change the number
      And user has the "Alerts;Change Number Summary" modules configured in CMS for "Change Number Summary" page
      And the "Alerts" module configured in CMS for "Change Number Summary" page has a "insufficient-balance-to-change-number" preconfigured provider
      And user is in the "Change Number Summary" page
     When clicks on the "alert.topup_button" button
     Then the "Go To Topup Confirmation" popup is displayed
      And the "title" textfield with "Open top up flow" text is displayed
      And the "body" textfield with "Once you have enough balance try to swap your sim again" text is displayed
      And the "topup_button" button with the "(GO TO TOP UP|Go to top up)" format is displayed
      And the "cancel_button" button with the "(ABBRECHEN|Abbrechen)" format is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228548 | QANOV-228552 |
          | o2de    | Future | QANOV-228549 | QANOV-228553 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user without enough balance cancels to topup during the Change Number flow
    Given user has a "prepay" account type
      And user has not enough balance to change the number
      And user has the "Alerts;Change Number Summary" modules configured in CMS for "Change Number Summary" page
      And the "Alerts" module configured in CMS for "Change Number Summary" page has a "insufficient-balance-to-change-number" preconfigured provider
      And user is in the "Change Number Summary" page
     When clicks on the "alert.topup_button" button
      And the "Go To Topup Confirmation" popup is displayed
      And clicks on the "cancel_button" button
     Then the "Change Number Summary" page is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228552 | QANOV-228554 |
          | o2de    | Future | QANOV-228553 | QANOV-228555 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user without enough balance confirms to topup during the Change Number flow
    Given user has a "prepay" account type
      And user has not enough balance to change the number
      And user has the "Alerts;Change Number Summary" modules configured in CMS for "Change Number Summary" page
      And the "Alerts" module configured in CMS for "Change Number Summary" page has a "insufficient-balance-to-change-number" preconfigured provider
      And user is in the "Change Number Summary" page
     When clicks on the "alert.topup_button" button
      And the "Go To Topup Confirmation" popup is displayed
      And clicks on the "topup_button" button
     Then the "Topup" page is displayed
      And the "Aufladen" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Change Number Summary" page is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228552 | QANOV-228556 |
          | o2de    | Future | QANOV-228553 | QANOV-228557 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user without enough balance cannot access to the "Change Number Confirmation" screen
    On Android devices, the error warning will display a Close button. This button is not displayed on iOS devices,
    as the warning is automatically closed after several seconds.
    Given user has a "prepay" account type
      And user has not enough balance to change the number
      And user has the "Alerts;Change Number Summary" modules configured in CMS for "Change Number Summary" page
      And the "Alerts" module configured in CMS for "Change Number Summary" page has a "insufficient-balance-to-change-number" preconfigured provider
      And user is in the "Change Number Summary" page
     When clicks on the "continue_button" button
     Then the "error_warning" warning is displayed
      And the "error_warning.text" textfield with "You need to have enough balance" text is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228552 | QANOV-228558 |
          | o2de    | Future | QANOV-228553 | QANOV-228559 |

  @jira.<jira_id> @<product> @android @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user without enough balance can close the error warning
    Given user has a "prepay" account type
      And user has not enough balance to change the number
      And user has the "Alerts;Change Number Summary" modules configured in CMS for "Change Number Summary" page
      And the "Alerts" module configured in CMS for "Change Number Summary" page has a "insufficient-balance-to-change-number" preconfigured provider
      And user is in the "Change Number Summary" page
     When clicks on the "continue_button" button
      And the "error_warning" warning is displayed
      And clicks on the "error_warning.button" button
     Then the "Change Number Summary" page is displayed
      And the "error_warning" warning is not displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228558 | QANOV-228560 |
          | o2de    | Future | QANOV-228559 | QANOV-228561 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user with enough balance can access to the "Change Number Confirmation" screen from the "Change Number Summary" screen
    If the email address is not verified, a "Not verified" tag will be displayed over it.
    If the email address is verified, a "Verified" tag will be displayed over it.
    If there's no email address saved, no tag will be displayed.
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has the "Change Number Summary" module configured in CMS for "Change Number Summary" page
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Summary" page
     When clicks on the "continue_button" button
     Then the "Change Number Confirmation" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "title" textfield with "Change number confirmation" text is displayed
      And the "description" textfield with "You will receive confirmation of the process to your current contact email address." text is displayed
      And the "balance.value" textfield with the "\d+,\d{2} €" format is displayed
      And the "balance.label" textfield with "Current balance" text is displayed
      And the "service.value" textfield with "Porting cost (IVA incl.)" text is displayed
      And the "service.label" textfield with "One-time service cost" text is displayed
      And the "service.cost" textfield with the "\d+,\d{2} €" format is displayed
      And the "email_address_value" textfield is displayed
      And the "email_address_label" textfield is displayed
      And the "email_address_chevron" icon is displayed
      And the "continue_button" button with "Pay it now" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228546 | QANOV-228562 |
          | o2de    | Future | QANOV-228547 | QANOV-228563 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line can access to the "Change Number Confirmation" screen from the "Change Number Summary" screen
    If the email address is not verified, a "Not verified" tag will be displayed over it.
    If the email address is verified, a "Verified" tag will be displayed over it.
    If there's no email address saved, no tag will be displayed.
    Given user has a "mobile_line" product in "active" status
      And the price to change number is available in the system
      And user has a "postpay" account type
      And user has the "Change Number Summary" module configured in CMS for "Change Number Summary" page
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Summary" page
     When clicks on the "continue_button" button
     Then the "Change Number Confirmation" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "title" textfield with "Bestätigung Rufnummerntausch" text is displayed
      And the "description" textfield with "Du erhältst eine Bestätigung an deine hinterlegte E-Mail Adresse." text is displayed
      And the "email_address_value" textfield is displayed
      And the "email_address_label" textfield is displayed
      And the "email_address_chevron" icon is displayed
      And the "continue_button" button with "Jetzt bezahlen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-228550 | QANOV-228564 |
          | o2de    | 14.2 | QANOV-228551 | QANOV-228565 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user with enough balance and with a verified contact email can see the "contact email" module in the "Change Number Confirmation" screen
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has a "verified email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     Then the "email_address" module is displayed
      And the "email_address_status_tag" textfield is not displayed
      And the "email_address_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_address_label" textfield with "E-Mail-Adresse" text is displayed
      And the "email_address_chevron" icon is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-228562 | QANOV-286990 |
          | o2de    | QANOV-228563 | QANOV-286992 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user with enough balance and with a not verified contact email can see the "contact email" module in the "Change Number Confirmation" screen
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has a "not verified email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     Then the "email_address" module is displayed
      And the "email_address_status_tag" textfield with "Nicht hinterlegt/bestätigt" text is displayed
      And the "email_address_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_address_label" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "email_address_chevron" icon is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-228562 | QANOV-286991 |
          | o2de    | QANOV-228563 | QANOV-286993 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user with enough balance and without a contact email can see the "contact email" module in the "Change Number Confirmation" screen
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has a "no email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     Then the "email_adddress" module is displayed
      And the "email_address_status_tag" textfield is not displayed
      And the "email_address_value" textfield with "Kontakt E-Mail" text is displayed
      And the "email_address_label" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "email_address_chevron" icon is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-228562 | QANOV-286994 |
          | o2de    | QANOV-228563 | QANOV-286995 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line and with a verified contact email can see the "contact email" module in the "Change Number Confirmation" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "verified email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     Then the "email_address" module is displayed
      And the "email_address_status_tag" textfield is not displayed
      And the "email_address_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_address_label" textfield with "E-Mail-Adresse" text is displayed
      And the "email_address_chevron" icon is displayed

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-228564:QANOV-286988 | QANOV-286996 |
          | o2de    | QANOV-228565:QANOV-286989 | QANOV-286998 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line and with a not verified contact email can see the "contact email" module in the "Change Number Confirmation" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "not verified email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     Then the "email_address" module is displayed
      And the "email_address_status_tag" textfield with the "Nicht (hinterlegt/bestätigt)" format is displayed
      And the "email_address_value" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "email_address_label" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "email_address_chevron" icon is displayed

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-228564:QANOV-286988 | QANOV-286997 |
          | o2de    | QANOV-228565:QANOV-286989 | QANOV-286999 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line and without a contact email can see the "contact email" module in the "Change Number Confirmation" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "no email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     Then the "email_adddress" module is displayed
      And the "email_address_status_tag" textfield is not displayed
      And the "email_address_value" textfield with "Kontakt E-Mail" text is displayed
      And the "email_address_label" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "email_address_chevron" icon is displayed

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-228564:QANOV-286988 | QANOV-287000 |
          | o2de    | QANOV-228565:QANOV-286988 | QANOV-287001 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user with enough balance can change the contact email from the "Change Number Confirmation" screen
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "email_address_chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Number Confirmation" page is displayed
      And the "Rufnummerntausch" header is displayed

    Examples:
          | product | depends_on                             | jira_id      |
          | blaude  | QANOV-286990:QANOV-286991:QANOV-286994 | QANOV-287002 |
          | o2de    | QANOV-286992:QANOV-286993:QANOV-286995 | QANOV-287003 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line can change the contact email from the "Change Number Confirmation" screen
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "email_address_chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Number Confirmation" page is displayed
      And the "Rufnummerntausch" header is displayed

    Examples:
          | product | depends_on                             | jira_id      |
          | blaude  | QANOV-286996:QANOV-286997:QANOV-287000 | QANOV-287004 |
          | o2de    | QANOV-286998:QANOV-286999:QANOV-287001 | QANOV-287005 |

  @jira.<jira_id> @<ber> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A prepay user with enough balance and a <email_status> contact email can change the line number successfully
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has a "<email_status> email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user has the "Change Number Success Feedback" module configured in CMS for "Change Number Success Feedback" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
     Then the "Change Number Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "We have received your request" text is displayed
      And the "success_message" textfield with "Please bear in mind that this process may take few days after you request the change." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv     | email_status | ber | depends_on   | jira_id      |
          | blaude  | Future | verified     | ber | QANOV-286990 | QANOV-228566 |
          | blaude  | Future | not verified |     | QANOV-286991 | QANOV-287462 |
          | o2de    | Future | verified     | ber | QANOV-286992 | QANOV-228567 |
          | o2de    | Future | not verified |     | QANOV-286993 | QANOV-287464 |

  @jira.<jira_id> @<ber> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.detects.O2DE-1776 @manual @mobile @smoke
  Scenario Outline: A postpay user with mobile line and with a <email_status> contact email can change the line number successfully
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "<email_status> email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user has the "Change Number Success Feedback" module configured in CMS for "Change Number Success Feedback" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
     Then the "Change Number Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage erhalten." text is displayed
      And the "success_message" textfield with "Bitte beachte, dass dieser Prozess ein paar Tage in Anspruch nehmen kann." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    @raitt_drop1
    Examples:
          | product | cv   | email_status | ber | depends_on   | jira_id      |
          | blaude  | 13.9 | verified     | ber | QANOV-286996 | QANOV-228568 |

    Examples:
          | product | cv   | email_status | ber | depends_on   | jira_id      |
          | blaude  | 13.9 | not verified |     | QANOV-286997 | QANOV-287470 |
          | o2de    | 14.2 | verified     | ber | QANOV-286998 | QANOV-228569 |
          | o2de    | 14.2 | not verified |     | QANOV-286999 | QANOV-287472 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user without contact email taps to confirm the line number change: a warning popup is displayed
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has a "no email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "Füge eine Adresse hinzu, um eine Bestätigung per E-Mail zu erhalten." text is displayed
      And the "popup.cancel" button with the "(E-Mail hinzufügen|E-MAIL HINZUFÜGEN)" format is displayed
      And the "popup.accept" button with the "(Jetzt nicht|JETZT NICHT)" format is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-286994 | QANOV-287463 |
          | o2de    | QANOV-286995 | QANOV-287465 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user without a contact email can cancel the line number change
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has a "no email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Number Confirmation" page is displayed
      And the "Rufnummerntausch" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-287463 | QANOV-287466 |
          | o2de    | QANOV-287465 | QANOV-287467 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.Future @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user without a contact email can change the line number successfully without adding the email
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has a "no email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user has the "Change Number Success Feedback" module configured in CMS for "Change Number Success Feedback" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Change Number Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "We have received your request" text is displayed
      And the "success_message" textfield with "Please bear in mind that this process may take few days after you request the change." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-287463 | QANOV-287468 |
          | o2de    | QANOV-287465 | QANOV-287469 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line and without contact email taps to confirm the line number change: a warning popup is displayed
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "no email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "Füge eine Adresse hinzu, um eine Bestätigung per E-Mail zu erhalten." text is displayed
      And the "popup.cancel" button with the "(E-Mail hinzufügen|E-MAIL HINZUFÜGEN)" format is displayed
      And the "popup.accept" button with the "(Jetzt nicht|JETZT NICHT)" format is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-287000 | QANOV-287471 |
          | o2de    | QANOV-287001 | QANOV-287473 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line and without a contact email can cancel the line number change
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "no email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Number Confirmation" page is displayed
      And the "Rufnummerntausch" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-287471 | QANOV-287474 |
          | o2de    | QANOV-287473 | QANOV-287475 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line and without a contact email can change the line number successfully without adding the email
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "no email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user has the "Change Number Success Feedback" module configured in CMS for "Change Number Success Feedback" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Change Number Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage erhalten." text is displayed
      And the "success_message" textfield with "Bitte beachte, dass dieser Prozess ein paar Tage in Anspruch nehmen kann." text is displayed
      And the "back_to_contact_details_button" button with "Zurück zu Meine Daten" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-287471 | QANOV-287476 |
          | o2de    | QANOV-287473 | QANOV-287477 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user with mobile line who is in the "Change Number Success Feedback" page can tap on the "Back to contact details" button
    Given user has a "mobile_line" product in "active" status
      And user has the "Change Number Success Feedback" module configured in CMS for "Change Number Success Feedback" page
      And user is in the "Change Number Success Feedback" page
     When clicks on the "back_to_contact_details_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

    Examples:
          | product | cv   | depends_on                                          | jira_id      |
          | blaude  | 13.9 | QANOV-228566:QANOV-228568:QANOV-287468:QANOV-287476 | QANOV-228570 |
          | o2de    | 14.2 | QANOV-228567:QANOV-228569:QANOV-287469:QANOV-287477 | QANOV-228572 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A prepay user with enough balance and a contact email wants to change the line number but an error happens: process finished unsuccessfully
    Given user has a "prepay" account type
      And user has enough balance to change the number
      And user has a "email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user has the "Change Number Error Feedback" module configured in CMS for "Change Number Error Feedback" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
      And there is an error requesting to change the number
     Then the "Change Number Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send the request" text is displayed
      And the "error_message" textfield with "Please try again later." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | cv     | depends_on   | jira_id      |
          | blaude  | Future | QANOV-228562 | QANOV-228574 |
          | o2de    | Future | QANOV-228563 | QANOV-228575 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with mobile line and with a contact email wants to change the line number but an error happens: process finished unsuccessfully
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a "email" stored in the contact details
      And user has the "Change Number Confirmation" module configured in CMS for "Change Number Confirmation" page
      And user has the "Change Number Error Feedback" module configured in CMS for "Change Number Error Feedback" page
      And user is in the "Change Number Confirmation" page
     When clicks on the "continue_button" button
      And there is an error requesting to change the number
     Then the "Change Number Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "We couldn't send the request" text is displayed
      And the "error_message" textfield with "Please try again later." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-228564:QANOV-286988 | QANOV-228576 |
          | o2de    | 14.2 | QANOV-228565:QANOV-286989 | QANOV-228577 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user with mobile line who is in the "Change Number Error Feedback" page can tap on the "<button_name>" button
    Given user has a "mobile_line" product in "active" status
      And user has the "Change Number Error Feedback" module configured in CMS for "Change Number Error Feedback" page
      And user is in the "Change Number Error Feedback" page
     When clicks on the "<button_id>" button
     Then the "<destination_page>" page is displayed
      And the "<destination_header>" header is displayed

    Examples:
          | product | cv   | button_name        | button_id                       | destination_page | destination_header | depends_on                | jira_id      |
          | blaude  | 13.9 | Go back to profile | back_to_profile_button          | Profile          | Profil             | QANOV-228574:QANOV-228576 | QANOV-228578 |
          | blaude  | 13.9 | Close              | navigation_top_bar.close_button | Personal Data    | Persönliche Daten  | QANOV-228574:QANOV-228576 | QANOV-228579 |
          | o2de    | 14.2 | Go back to profile | back_to_profile_button          | Profile          | Profil             | QANOV-228575:QANOV-228577 | QANOV-228580 |
          | o2de    | 14.2 | Close              | navigation_top_bar.close_button | Personal Data    | Persönliche Daten  | QANOV-228575:QANOV-228577 | QANOV-228581 |

  @jira.<jira_id> @<product> @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A user with mobile line can go to previous from the "Change Number Error Feedback" screen on iOS devices
    If you want to go to the previous screen on android devices, you can use the native back button of the device.
    Given user has a "mobile_line" product in "active" status
      And user has the "Change Number Error Feedback" module configured in CMS for "Change Number Error Feedback" page
      And user is in the "Change Number Error Feedback" page
     When clicks on the "navigation_top_bar.back_button" button
     Then the "Change Number Confirmation" page is displayed
      And the "Rufnummerntausch" header is displayed

    Examples:
          | product | cv   | depends_on                | jira_id      |
          | blaude  | 13.9 | QANOV-228574:QANOV-228576 | QANOV-228582 |
          | o2de    | 14.2 | QANOV-228575:QANOV-228577 | QANOV-228583 |

  @jira.QANOV-553391 @android @ios @jira.cv.24.1 @jira.link.depends_on.QANOV-310943 @mobile @o2de @regression
  Scenario: A postpay user with only a internet@home can access to the "Change Number Contact" screen
    Given user has a "internet_at_home" product in "active" status
      And user has "1" products
      And user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Change Number Contact" module configured in CMS for "Change Number Contact" page
      And user is in the "Change Contact Details" page
     When clicks on the "line_number_entrypoint.chevron" entrypoint
     Then the "Change Number Contact" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Bitte kontaktiere uns für eine Änderung der Rufnummer." text is displayed
      And the "description" textfield with "Unser Kundenservice wird die Änderung für dich vornehmen." text is displayed
      And the "support_button" button with "Hilfe" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

  @jira.QANOV-553392 @android @ios @jira.cv.24.1 @jira.link.depends_on.QANOV-310943 @mobile @o2de @regression
  Scenario: A postpay user with several products can access to the "Change Number Contact" screen for a a internet@home
    Given user has a "internet_at_home" product in "active" status
      And user has "several" products
      And user has the "Change Number Select Line" module configured in CMS for "Change Number Select Line" page
      And user has the "Change Number Contact" module configured in CMS for "Change Number Contact" page
      And user is in the "Change Number Select Line" page
     When clicks on any "internet_at_home" element in the "lines_list" list
     Then the "Change Number Contact" page is displayed
      And the "Rufnummerntausch" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Bitte kontaktiere uns für eine Änderung der Rufnummer." text is displayed
      And the "description" textfield with "Unser Kundenservice wird die Änderung für dich vornehmen." text is displayed
      And the "support_button" button with "Hilfe" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed
      And the "Kontaktdaten ändern" header is displayed

  @jira.QANOV-553393 @android @ios @jira.cv.24.1 @jira.link.depends_on.QANOV-553391 @jira.link.depends_on.QANOV-553392
  @mobile @o2de @regression
  Scenario: A postpay user with several products can access to the "Change Number Contact" screen for a a internet@home
    Given user has a "internet_at_home" product in "active" status
      And user has the "Change Number Contact" module configured in CMS for "Change Number Contact" page
      And user is in the "Change Number Contact" page
     When clicks on the "support_button" button
     Then the "Hilfe" page is displayed
