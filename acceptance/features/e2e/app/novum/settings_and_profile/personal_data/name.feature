# -*- coding: utf-8 -*-
@jira.QANOV-227241
Feature: Name

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status
      And user has not the "CUSTOMER_UPDATE_DATA" forbidden use case


  @jira.<jira_id> @<product> @android @ios @jira.cv.<cv> @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A postpay user can see the "contact name" entrypoint in the "Change Contact Details" screen
    Given user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user is in the "Change Contact Details" page
     Then the "personal_name_entrypoint" entrypoint with "Namen ändern" text is displayed
      And the "personal_name_value" textfield is displayed

    @raitt_drop1
    Examples:
          | product | cv   | depends_on   | jira_id      |
          | blaude  | 13.9 | QANOV-217759 | QANOV-450033 |

    Examples:
          | product | cv   | depends_on   | jira_id      |
          | o2de    | 14.2 | QANOV-217760 | QANOV-450034 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @har
  Scenario Outline: A postpay user can access to change the personal name from the "Change Contact Details" screen: an informative screen is displayed
    Given user has the "Change Contact Details" module configured in CMS for "Change Contact Details" page
      And user has the "Change Name" module configured in CMS for "Change Name" page
      And user is in the "Change Contact Details" page
     When clicks on the "personal_name_entrypoint" entrypoint
     Then the "Change Name" page is displayed
      And the "Name ändern" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Namen ändern" text is displayed
      And the "description" textfield with "Für die Änderung des Namens des Vertragsnehmers, ist ein Nachweis z.B. amtliche Bestätigung der Namensänderung erforderlich." text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-217759 |                  | QANOV-227242 |
          | o2de    | QANOV-217760 | QANOV-437471     | QANOV-227243 |

  @jira.<jira_id> @<product> @android @ber @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @sanity
  Scenario Outline: A postpay user can access to the "Personal Name New Name" screen
    The fields are empty and the checkbox is unchecked by default.
    Given user has the "Change Name" module configured in CMS for "Change Name" page
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user is in the "Change Name" page
     When clicks on the "continue_button" button
     Then the "Personal Name New Name" page is displayed
      And the "Namen ändern" header is displayed
      And the "progress_steps" progress bar is on "first" position
      And the "title" textfield with "Namen ändern" text is displayed
      And the "description" textfield with "Für die Änderung des Namens des Vertragsnehmers, ist ein Nachweis z.B. amtliche Bestätigung der Namensänderung erforderlich." text is displayed
      And the "name_inputtext_placeholder" inputtext with the "Name" placeholder is displayed
      And the "surname_inputtext_placeholder" inputtext with the "Nachname" placeholder is displayed
      And the "change_name_for_bank_label" textfield with "Name auch für die Bankverbindung ändern" text is displayed
      And the "change_name_for_bank_check" checkbox is displayed
      And the "data_protection_info" textfield with "Informationen zur Datenverarbeitung findest du in unserer Datenschutzerklärung" text is displayed
      And the "data_protection_link" link with "Datenschutzerklärung" text is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    @automatic @live @next
    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-227242 |                  | QANOV-227244 |

    @jira.link.detects.O2DE-3457 @manual
    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | o2de    | QANOV-227243 | QANOV-437471     | QANOV-227245 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can access to the data protection info from the "Personal Name New Name" screen
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user is in the "Personal Name New Name" page
     When clicks on the "data_protection_link" link
     Then the internal webview is displayed
      And the "<header>" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Name New Name" page is displayed

    Examples:
          | product | header               | depends_on   | jira_id      |
          | blaude  | Datenschutz bei Blau | QANOV-227244 | QANOV-227246 |
          | o2de    | Datenschutz          | QANOV-227245 | QANOV-227247 |

  @jira.<jira_id> @<client> @<product> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can tap on back button after filling any field from the "Personal Name New Name" screen on <client> device
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And clicks on the <button> button
     Then the "Change Name Cancellation" popup is displayed
      And the "popup.title" textfield with "Hinweis" text is displayed
      And the "popup.message" textfield with "Beim Verlassen dieser Ansicht gehen deine Eingaben verloren." text is displayed
      And the "popup.accept" button with "<continue_button>" text is displayed
      And the "popup.cancel" button with "<cancel_button>" text is displayed

    Examples:
          | product | client  | button                           | continue_button | cancel_button | depends_on   | jira_id      |
          | blaude  | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-227244 | QANOV-227248 |
          | blaude  | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-227244 | QANOV-227249 |
          | o2de    | android | native "back"                    | ABBRECHEN       | VERLASSEN     | QANOV-227245 | QANOV-227250 |
          | o2de    | ios     | "navigation_top_bar.back_button" | Abbrechen       | Verlassen     | QANOV-227245 | QANOV-227251 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user decides to continue with the change name flow after seeing the Change Name Cancellation popup
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user is in the "Change Name Cancellation" popup
     When clicks on the "popup.accept" button
     Then the "Personal Name New Name" page is displayed
      And the "Name ändern" header is displayed

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-227248:QANOV-227249 | QANOV-227252 |
          | o2de    | QANOV-227250:QANOV-227251 | QANOV-227253 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user decides to cancel the change name flow after seeing the Change Name Cancellation popup
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user is in the "Change Name Cancellation" popup
     When clicks on the "popup.cancel" button
     Then the "Change Name" page is displayed
      And the "Name ändern" header is displayed

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-227248:QANOV-227249 | QANOV-227254 |
          | o2de    | QANOV-227250:QANOV-227251 | QANOV-227255 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user cannot access to the "Personal Name Add Document" screen without filling all the mandatory fields
    The fields are empty and the checkbox is unchecked by default.
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user is in the "Personal Name New Name" page
     When clicks on the "continue_button" button
     Then the "name_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed
      And the "surname_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-227244 | QANOV-227256 |
          | o2de    | QANOV-227245 | QANOV-227257 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A postpay user can access to the "Personal Name Add Document" screen in iOS devices
    The fields are empty and the checkbox is unchecked by default.
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
     Then the "Personal Name Add Document" page is displayed
      And the "Namen ändern" header is displayed
      And the "progress_steps" progress bar is on "second" position
      And the "title" textfield with "Nachweis Hinzufügen" text is displayed
      And the "description" textfield with "Erstelle ein Foto deines Nachweises oder wähle deinen Nachweis aus einem Album aus. Für diesen Vorgang wird die App nach der benötigten Zugriffsberechtigung fragen, falls diese noch nicht erteilt wurde." text is displayed
      And the "primary_button" button with "Nachweis hinzufügen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    @automatic @live @next
    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-227244 |                  | QANOV-227258 |

    @manual
    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | o2de    | QANOV-227245 | QANOV-437471     | QANOV-227259 |

  @jira.<jira_id> @<product> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @mobile @smoke
  Scenario Outline: A postpay user can access to the "Personal Name Add Document" screen in Android devices
    The fields are empty and the checkbox is unchecked by default.
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
     Then the "Personal Name Add Document" page is displayed
      And the "Namen ändern" header is displayed
      And the "progress_steps" progress bar is on "second" position
      And the "title" textfield with "Nachweis Hinzufügen" text is displayed
      And the "description" textfield with "Erstelle ein Foto deines Nachweises oder wähle deinen Nachweis aus einem Album aus. Für diesen Vorgang wird die App nach der benötigten Zugriffsberechtigung fragen, falls diese noch nicht erteilt wurde." text is displayed
      And the "primary_button" button with "Aus Galerie auswählen" text is displayed
      And the "secondary_button" button with "Mit Kamera aufnehmen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    @automatic @live @next
    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-227244 |                  | QANOV-238985 |

    @manual
    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | o2de    | QANOV-227245 | QANOV-437471     | QANOV-238986 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A postpay user taps on the continue button in the "Personal Name Add Document" screen for iOS devices: several options are displayed
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
     Then the "Select Image Sheet" sheet is displayed
      And the "gallery_button" button with "Fotomediathek" text is displayed
      And the "camera_button" button with "Foto aufnehmen" text is displayed
      And the "choose_file_button" button with "Datei auswählen" text is displayed

    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-227258 |                  | QANOV-227260 |
          | o2de    | QANOV-227259 | QANOV-437471     | QANOV-227261 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.detects.LOC-1184 @manual
  @mobile @regression
  Scenario Outline: A postpay user who just installed the app decides to take a photo in the "change name" flow for iOS devices: permission popup is displayed
    Given user just installed the application
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
     Then the "Camera Permissions Popup" popup is displayed
      And the "popup.title" textfield with "<popup_title>" text is displayed
      And the "popup.message" textfield with "Du kannst dein Profilfoto erst ändern und Bilder mit dem Supportmitarbeiter teilen, wenn du diesen Zugriff erlaubst" text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with "Don't allow" text is displayed

    Examples:
          | product | popup_title                                 | depends_on   | jira_id      |
          | blaude  | "Mein Blau" Would Like to Access the Camera | QANOV-227260 | QANOV-227262 |
          | o2de    | "Mein O2" Would Like to Access the Camera   | QANOV-227261 | QANOV-227263 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-1652 @manual
  @mobile @regression
  Scenario Outline: A postpay user who just installed the app decides to choose a gallery photo in the "change name" flow for iOS devices: Photo Gallery is displayed
    Given user just installed the application
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "gallery_button" button
     Then the "Gallery" app is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-227260 | QANOV-227265 |
          | o2de    | QANOV-227261 | QANOV-227267 |

  @jira.<jira_id> @<product> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.detects.LOC-1184 @manual
  @mobile @regression
  Scenario Outline: A postpay user who just installed the app decides to take a photo in the change name flow for android devices: permission popup is displayed
    Given user just installed the application
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "camera_button" button
     Then the "Camera Permissions Popup" popup is displayed
      And the "popup.title" textfield with "<popup_title>" text is displayed
      And the "popup.accept" button with "Allow" text is displayed
      And the "popup.cancel" button with "Deny" text is displayed

    Examples:
          | product | popup_title                                          | depends_on   | jira_id      |
          | blaude  | Allow "Mein Blau" to take pictures and record video? | QANOV-238985 | QANOV-238987 |
          | o2de    | Allow "Mein O2" to take pictures and record video?   | QANOV-238986 | QANOV-238988 |

  @jira.<jira_id> @<product> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user who just installed the app decides to choose a gallery photo in the "change name" flow for android devices: Photo Gallery is displayed
    Given user just installed the application
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "gallery_button" button
     Then the "Gallery" app is displayed

    Examples:
          | product | popup_title                                                         | depends_on   | jira_id      |
          | blaude  | Allow "Mein Blau" to access photos, media and files on your device? | QANOV-238985 | QANOV-227264 |
          | o2de    | Allow "Mein O2" to access photos, media and files on your device?   | QANOV-238986 | QANOV-227266 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.detects.IOS-8263 @manual
  @mobile @regression
  Scenario Outline: A postpay user who just installed the app denies Camera permission in the change name flow for iOS devices
    Given user just installed the application
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Personal Name Add Document" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-227262 | QANOV-227268 |
          | o2de    | QANOV-227263 | QANOV-227269 |

  @jira.<jira_id> @<product> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user who just installed the app denies Camera permission in the change name flow for android devices
    Given user just installed the application
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Personal Name Add Document" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-238987 | QANOV-238989 |
          | o2de    | QANOV-238988 | QANOV-238990 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user who just installed the app grants Camera permission in the change name flow for iOS devices
    Given user just installed the application
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Camera" app is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-227262 | QANOV-227274 |
          | o2de    | QANOV-227263 | QANOV-227275 |

  @jira.<jira_id> @<product> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user who just installed the app grants Camera permission in the change name flow for android devices
    Given user just installed the application
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Camera" app is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-227262 | QANOV-238991 |
          | o2de    | QANOV-227263 | QANOV-238992 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A postpay user chooses a file in the change name flow for iOS devices
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "choose_file_button" button
     Then the "ICloud Drive" app is displayed

    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-227260 |                  | QANOV-238993 |
          | o2de    | QANOV-227261 | QANOV-437471     | QANOV-238994 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @har
  Scenario Outline: A postpay user who granted camera permission can take a photo in the change name flow for iOS devices: the "Personal Name Confirm Document" screen is displayed
    Given user has "granted" "camera" permissions
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And takes a picture from change name page
     Then the "Personal Name Confirm Document" page is displayed
      And the "Name ändern" header is displayed
      And the "progress_steps" progress bar is on "third" position
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-227274 |                  | QANOV-227280 |
          | o2de    | QANOV-227275 | QANOV-437471     | QANOV-227281 |

  @jira.<jira_id> @<product> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.detects.ANDROID-10770
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @har
  Scenario Outline: A postpay user who granted camera permission can take a photo in the change name flow for android devices: the "Personal Name Confirm Document" screen is displayed
    Given user has "granted" "camera" permissions
      And user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "camera_button" button
      And takes a picture from change name page
     Then the "Personal Name Confirm Document" page is displayed
      And the "Name ändern" header is displayed
      And the "progress_steps" progress bar is on "third" position
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-238991 |                  | QANOV-238995 |
          | o2de    | QANOV-238992 | QANOV-437471     | QANOV-238996 |

  @jira.<jira_id> @<product> @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @har
  Scenario Outline: A postpay user can choose a gallery photo in the change name flow for iOS devices: the "Personal Name Confirm Document" screen is displayed
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "gallery_button" button
      And the "Personal Name Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
     Then the "Personal Name Confirm Document" page is displayed
      And the "Name ändern" header is displayed
      And the "progress_steps" progress bar is on "third" position
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-227265 |                  | QANOV-227283 |
          | o2de    | QANOV-227267 | QANOV-437471     | QANOV-227287 |

  @jira.<jira_id> @<product> @TBD @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @jira.link.detects.O2DE-2966
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @har
  Scenario Outline: A postpay user can choose a pdf document in the change name flow for iOS devices: the "Personal Name Confirm Document" screen is displayed
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "choose_file_button" button
      And selects a document from the device
     Then the "Personal Name Confirm Document" page is displayed
      And the "Name ändern" header is displayed
      And the "progress_steps" progress bar is on "third" position
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-227260 |                  | QANOV-227285 |
          | o2de    | QANOV-227261 | QANOV-437471     | QANOV-227289 |

  @jira.<jira_id> @<product> @android @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @har
  Scenario Outline: A postpay user can choose a gallery photo in the change name flow for android devices: the "Personal Name Confirm Document" screen is displayed
    Given user has the "Personal Name New Name" module configured in CMS for "Personal Name New Name" page
      And user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user is in the "Personal Name New Name" page
     When fills the "name_inputtext" inputtext with the "Test" text
      And fills the "surname_inputtext" inputtext with the "Qa" text
      And clicks on the "continue_button" button
      And the "Personal Name Add Document" page is displayed
      And clicks on the "gallery_button" button
      And the "Personal Name Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
     Then the "Personal Name Confirm Document" page is displayed
      And the "Name ändern" header is displayed
      And the "progress_steps" progress bar is on "third" position
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on   | parent_test_plan | jira_id      |
          | blaude  | QANOV-238985 |                  | QANOV-227282 |
          | o2de    | QANOV-238986 | QANOV-437471     | QANOV-227286 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @regression
  Scenario Outline: A postpay user can change the image selected in "Personal Name Confirm Document" screen
    Given user has the "Personal Name Add Document" module configured in CMS for "Personal Name Add Document" page
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user is in the "Personal Name Confirm Document" page
     When clicks on the "use_another_photo_button" button
     Then the "Personal Name Add Document" page is displayed
      And the "progress_steps" progress bar is on "second" position

    Examples:
          | product | depends_on                                                       | parent_test_plan | jira_id      |
          | blaude  | QANOV-227280:QANOV-238995:QANOV-227282:QANOV-227283:QANOV-227285 |                  | QANOV-227290 |
          | o2de    | QANOV-227281:QANOV-238996:QANOV-227286:QANOV-227287:QANOV-227289 | QANOV-437471     | QANOV-227291 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke
  Scenario Outline: A postpay user with a verified contact email can access to the "Personal Name Email Address" screen
    Given user has a "verified email" stored in the contact details
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Personal Name Email Address" page is displayed
      And the "Name ändern" header is displayed
      And the "progress_steps" progress bar is on "fourth" position
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Die Bestätigung des Vorgangs erhältst du per E-Mail. Aktuell ist folgende E-Mail-Adresse hinterlegt:" text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "E-Mail-Adresse" text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Jetzt absenden" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on                                                       | parent_test_plan | jira_id      |
          | blaude  | QANOV-227280:QANOV-238995:QANOV-227282:QANOV-227283:QANOV-227285 |                  | QANOV-337862 |
          | o2de    | QANOV-227281:QANOV-238996:QANOV-227286:QANOV-227287:QANOV-227289 | QANOV-437471     | QANOV-337863 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A postpay user with a not verified contact email can access to the "Personal Name Email Address" screen
    Given user has a "not verified email" stored in the contact details
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Personal Name Email Address" page is displayed
      And the "Name ändern" header is displayed
      And the "progress_steps" progress bar is on "fourth" position
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Die Bestätigung des Vorgangs erhältst du per E-Mail. Aktuell ist folgende E-Mail-Adresse hinterlegt:" text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield with the "Nicht (hinterlegt/bestätigt)" format text is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Jetzt absenden" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on                                                       | jira_id      |
          | blaude  | QANOV-227280:QANOV-238995:QANOV-227282:QANOV-227283:QANOV-227285 | QANOV-268981 |
          | o2de    | QANOV-227281:QANOV-238996:QANOV-227286:QANOV-227287:QANOV-227289 | QANOV-268982 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A postpay user without a contact email saved can access to the "Personal Name Email Address" screen
    Given user has a "no email" stored in the contact details
      And user has the "Personal Name Confirm Document" module configured in CMS for "Personal Name Confirm Document" page
      And user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Personal Name Email Address" page is displayed
      And the "Name ändern" header is displayed
      And the "progress_steps" progress bar is on "fourth" position
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Die Bestätigung des Vorgangs erhältst du per E-Mail. Aktuell ist folgende E-Mail-Adresse hinterlegt:" text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with "Kontakt E-Mail" text is displayed
      And the "contact_email.description" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Jetzt absenden" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Change Contact Details" page is displayed

    Examples:
          | product | depends_on                                                       | jira_id      |
          | blaude  | QANOV-227280:QANOV-238995:QANOV-227282:QANOV-227283:QANOV-227285 | QANOV-268983 |
          | o2de    | QANOV-227281:QANOV-238996:QANOV-227286:QANOV-227287:QANOV-227289 | QANOV-268984 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A postpay user can change the contact email from the "contact email" entrypoint in the "Personal Name Email Address" screen
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "contact_email.chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Name Email Address" page is displayed
      And the "Name ändern" header is displayed

    Examples:
          | product | depends_on                                          | jira_id      |
          | blaude  | QANOV-227292:QANOV-337862:QANOV-268981:QANOV-268983 | QANOV-268985 |
          | o2de    | QANOV-227293:QANOV-337863:QANOV-268982:QANOV-268984 | QANOV-268986 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on>
  @jira.link.parent_test_plan.<parent_test_plan> @manual @mobile @smoke @<ber>
  Scenario Outline: A postpay user with a <email_status> contact email can change the personal name successfully
    Given user has a "<email_status> email" stored in the contact details
      And user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user has the "Change Name Success Feedback" module configured in CMS for "Change Name Success Feedback" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "confirm_button" button
     Then the "Change Name Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Vielen Dank" text is displayed
      And the "success_message" textfield with "Der Nachhweis ist bei uns eingegangen. Die Bearbeitung kann einige Tage in Anspruch nehmen." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed

    @raitt_drop1
    Examples:
          | product | email_status | depends_on   | ber | parent_test_plan | jira_id      |
          | blaude  | active       | QANOV-337862 | ber |                  | QANOV-227294 |

    Examples:
          | product | email_status | depends_on   | ber | parent_test_plan | jira_id      |
          | blaude  | not verified | QANOV-268981 |     |                  | QANOV-268989 |
          | o2de    | active       | QANOV-337863 | ber | QANOV-437471     | QANOV-227295 |
          | o2de    | not verified | QANOV-268982 |     |                  | QANOV-268991 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user without contact email taps to confirm the personal name change: a warning popup is displayed
    Given user has a "no email" stored in the contact details
      And user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "confirm_button" button
     Then the "Email Contact Confirmation" popup is displayed
      And the "popup.title" textfield with "Bestätige deine E-Mail" text is displayed
      And the "popup.message" textfield with "You need to introduce an email address to send you the confirmation notification." text is displayed
      And the "popup.cancel" button is displayed
      And the "popup.accept" button with "Add mail" text is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-268983 | QANOV-268990 |
          | o2de    | QANOV-268984 | QANOV-268992 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user without a contact email can access to change the email from the "Email Contact Confirmation" popup
    Given user has a "no email" stored in the contact details
      And user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "confirm_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Name Email Address" page is displayed
      And the "Name ändern" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-268990 | QANOV-268993 |
          | o2de    | QANOV-268992 | QANOV-268994 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user without a contact email can close the "Email Contact Confirmation" popup
    Given user has a "no email" stored in the contact details
      And user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user has the "Change Name Success Feedback" module configured in CMS for "Change Name Success Feedback" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "confirm_button" button
      And the "Email Contact Confirmation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Personal Name Email Address" page is displayed
      And the "Name ändern" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-268990 | QANOV-268995 |
          | o2de    | QANOV-268992 | QANOV-268996 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go back to Profile screen from the "Change Name Success Feedback" screen
    Given user has a "email" stored in the contact details
      And user has the "Change Name Success Feedback" module configured in CMS for "Change Name Success Feedback" page
      And user is in the "Change Name Success Feedback" page
     When clicks on the "back_to_profile_button" button
     Then the "Profile" page is displayed
      And the "Profil" header is displayed

    Examples:
          | product | depends_on                | jira_id      |
          | blaude  | QANOV-227294:QANOV-268995 | QANOV-227296 |
          | o2de    | QANOV-227295:QANOV-268996 | QANOV-227298 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user with a contact email tries to change the personal name but an error happens: process finished unsuccessfully
    Given user has a "email" stored in the contact details
      And user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user has the "Change Name Error Feedback" module configured in CMS for "Change Name Error Feedback" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "confirm_button" button
      And there is an error changing the personal name
     Then the "Change Name Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Nachweis konnt nicht versendet werden" text is displayed
      And the "error_message" textfield with "Versuchen es später erneut." text is displayed
      And the "back_to_personal_data_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Profile" page is displayed

    Examples:
          | product | depends_on                             | jira_id      |
          | blaude  | QANOV-227292:QANOV-337862:QANOV-268981 | QANOV-227300 |
          | o2de    | QANOV-227293:QANOV-337863:QANOV-268982 | QANOV-227301 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go back to Change Contact Details screen from the "Change Name Error Feedback" screen
    Given user has a "email" stored in the contact details
      And user has the "Change Name Error Feedback" module configured in CMS for "Change Name Error Feedback" page
      And user is in the "Change Name Error Feedback" page
     When clicks on the "back_to_personal_data_button" button
     Then the "Change Contact Details" page is displayed
      And the "Kontakdaten ändern" header is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-227300 | QANOV-227302 |
          | o2de    | QANOV-227301 | QANOV-227304 |

  @jira.<jira_id> @<client> @<product> @jira.cv.14.2 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go to previous screen from the "Change Name Error Feedback" screen on <client> devices
    Given user has a "email" stored in the contact details
      And user has the "Change Name Error Feedback" module configured in CMS for "Change Name Error Feedback" page
      And user is in the "Change Name Error Feedback" page
     When clicks on the <button> button
     Then the "Personal Name Email Address" page is displayed
      And the "Name ändern" header is displayed

    Examples:
          | product | client  | button                           | depends_on   | jira_id      |
          | blaude  | android | native "back"                    | QANOV-227300 | QANOV-227306 |
          | blaude  | ios     | "navigation_top_bar.back_button" | QANOV-227300 | QANOV-227307 |
          | o2de    | android | native "back"                    | QANOV-227301 | QANOV-227308 |
          | o2de    | ios     | "navigation_top_bar.back_button" | QANOV-227301 | QANOV-227309 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A postpay user can access to change the contact email from the "contact email" entrypoint in the "Personal Name Email Address" screen
    Given user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "contact_email.chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Name Email Address" page is displayed
      And the "Name ändern" header is displayed

    Examples:
          | product | depends_on                             | jira_id      |
          | blaude  | QANOV-337862:QANOV-268981:QANOV-268983 | QANOV-268985 |
          | o2de    | QANOV-337863:QANOV-268982:QANOV-268984 | QANOV-268986 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A postpay user can go back to the "Personal Name Email Address" screen after updating the contact email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Personal Name Email Address" page is displayed
      And the "contact_email.email" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-268985 | QANOV-342571 |
          | o2de    | QANOV-268986 | QANOV-342572 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @smoke
  Scenario Outline: A postpay user changes the contact email from the "Personal Name Email Address" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Personal Name Email Address" module configured in CMS for "Personal Name Email Address" page
      And user is in the "Personal Name Email Address" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the contact email but the confirmation takes too long
     Then the "Email Contact Informative Feedback" page is displayed
      And the "info_icon" icon is displayed
      And the "info_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "info_message" textfield with "Deine Änderungen werden inKürze übernommen." text is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Personal Name Email Address" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-268985 | QANOV-342573 |
          | o2de    | QANOV-268986 | QANOV-342574 |

  @jira.<jira_id> @<product> @android @ios @jira.cv.14.6 @jira.link.depends_on.<depends_on> @manual @mobile @regression
  Scenario Outline: A postpay user can go back to "Personal Name Email Address" screen from the "Email Contact Informative Feedback" screen
    Given user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "close_button" button
     Then the "Personal Name Email Address" page is displayed

    Examples:
          | product | depends_on   | jira_id      |
          | blaude  | QANOV-342573 | QANOV-342575 |
          | o2de    | QANOV-342574 | QANOV-342576 |
