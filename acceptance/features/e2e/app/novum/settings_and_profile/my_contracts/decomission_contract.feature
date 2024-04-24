# -*- coding: utf-8 -*-
@jira.QANOV-241070
Feature: Decomission contract

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has not the "ACCOUNT_UPDATE_SUSPENSION" forbidden use case
      And user has not the "SUBSCRIPTION_UPDATE_SUSPENSION" forbidden use case


  @jira.QANOV-241071 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-312322 @manual @mobile @o2de @sanity
  Scenario: A monoproduct postpay user can access to the "Decomission Contract Reason" screen from the "My Contracts" screen
    The different reasons are provided by API.
    Given user has "1" products
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Decomission Contract Reason" module configured in CMS for "Decomission Contract Reason" page
      And user is in the "My Contracts" page
     When clicks on the "my_contracts.decommission_contract_entrypoint" entrypoint
     Then the "Decomission Contract Reason" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Grund auswählen" text is displayed
      And the "reasons_list" list is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241072 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-312322 @manual @mobile @o2de @smoke
  Scenario: A multiproduct postpay user can access to the "Decomission Contract Product" screen from the "My Contracts" screen
    Given user has "several" products
      And user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Decomission Contract Product" module configured in CMS for "Decomission Contract Product" page
      And user is in the "My Contracts" page
     When clicks on the "my_contracts.decommission_contract_entrypoint" entrypoint
     Then the "Decomission Contract Product" page is displayed
      And the "Meine Produkte" header is displayed
      And the "title" textfield with "Produkt auswählen und fortfahren" text is displayed
      And the "products_list" list is displayed
      And each element in the "products_list" list has the "title" field
      And each element in the "products_list" list has the "description" field
      And each element in the "products_list" list has the "chevron" field
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241073 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241072 @manual @mobile @o2de @regression
  Scenario: A multiproduct postpay user can access to the "Decomission Contract Reason" screen
    The different reasons are provided by API.
    Given user has "several" products
      And user has the "Decomission Contract Product" module configured in CMS for "Decomission Contract Product" page
      And user has the "Decomission Contract Reason" module configured in CMS for "Decomission Contract Reason" page
      And user is in the "Decomission Contract Product" page
     When clicks on any element in the "products_list" list
     Then the "Decomission Contract Reason" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Grund auswählen" text is displayed
      And the "reasons_list" list is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241074 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241071 @jira.link.depends_on.QANOV-241073
  @manual @mobile @o2de @smoke
  Scenario: A postpay user can access to the "Decomission Contract Period" screen
    Given user has the "Decomission Contract Reason" module configured in CMS for "Decomission Contract Reason" page
      And user has the "Decomission Contract Period" module configured in CMS for "Decomission Contract Period" page
      And user is in the "Decomission Contract Reason" page
     When clicks on any element in the "reasons_list" list
      And clicks on the "continue_button" button
     Then the "Decomission Contract Period" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Zeitraum auswählen" text is displayed
      And the "description" textfield with "Wähle einen Zeitraum aus, in dem du deinen Vertrag stillegen möchtest" text is displayed
      And the "start_datepicker" datepicker with the "Startet am" placeholder is displayed
      And the "end_datepicker" datepicker with the "Endet am" placeholder is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.<jira_id> @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241074 @jira.link.detects.O2DE-3160 @manual @mobile
  @o2de @regression
  Scenario Outline: A postpay user cannot select a <date> date before tomorrow for the decomission contract in android devices
    Given user has the "Decomission Contract Period" module configured in CMS for "Decomission Contract Period" page
      And user is in the "Decomission Contract Period" page
     When clicks on the "<date>_datepicker" datepicker
      And the "<date>_calendar" calendar is displayed
     Then all days before "tomorrow" will be disabled in the "<date>_calendar" calendar

    Examples:
          | date  | jira_id      |
          | start | QANOV-241075 |
          | end   | QANOV-241076 |

  @jira.<jira_id> @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241074 @jira.link.detects.O2DE-3160 @manual @mobile
  @o2de @regression
  Scenario Outline: A postpay user cannot select a <date> date before tomorrow for the decomission contract in iOS devices
    Given user has the "Decomission Contract Period" module configured in CMS for "Decomission Contract Period" page
      And user is in the "Decomission Contract Period" page
     When clicks on the "<date>_datepicker" datepicker
      And the "<date>_calendar" calendar is displayed
      And selects "<selected_day>" date in the "<date>_calendar" calendar
     Then the "Decomission Contract Period" page is displayed
      And the "<date>_error" textfield with "Unzulässiges Datum" text is displayed

    Examples:
          | date  | selected_day | jira_id      |
          | start | today        | QANOV-241077 |
          | end   | today        | QANOV-241078 |
          | start | yesterday    | QANOV-241079 |
          | end   | yesterday    | QANOV-241080 |

  @jira.QANOV-241081 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241074 @jira.link.detects.O2DE-3160 @manual
  @mobile @o2de @regression
  Scenario: A postpay user cannot select a end date before the start date
    Given user has the "Decomission Contract Period" module configured in CMS for "Decomission Contract Period" page
      And user is in the "Decomission Contract Period" page
     When clicks on the "start_datepicker" datepicker
      And the "start_calendar" calendar is displayed
      And selects "any" date in the "start_calendar" calendar
      And the "Decomission Contract Period" page is displayed
      And clicks on the "end_datepicker" datepicker
      And the "end_calendar" calendar is displayed
      And selects a date before "[CONTEXT:start_date]" date in the "end_calendar" calendar
     Then the "Decomission Contract Period" page is displayed
      And the "end_error" textfield with "Unzulässiges Datum" text is displayed

  @jira.QANOV-241082 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241074 @jira.link.detects.O2DE-3626 @manual
  @mobile @o2de @smoke
  Scenario: A postpay user can access to the "Decomission Contract Info" screen on iOS devices
    Given user has the "Decomission Contract Period" module configured in CMS for "Decomission Contract Period" page
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Period" page
     When clicks on the "start_datepicker" datepicker
      And the "start_calendar" calendar is displayed
      And selects "any" date in the "start_calendar" calendar
      And the "Decomission Contract Period" page is displayed
      And clicks on the "end_datepicker" datepicker
      And the "end_calendar" calendar is displayed
      And selects "any" date in the "end_calendar" calendar
      And the "Decomission Contract Period" page is displayed
      And clicks on the "continue_button" button
     Then the "Decomission Contract Info" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Nachweis zur Überprüfung einreichen" text is displayed
      And the "description1" textfield with "Um mit der Vertragsstillegung fortzufahren, ist es notwendig, einen entsprechenden Nachweis zur Überprüfung einzureichen." text is displayed
      And the "description2" textfield with "Du kannst ein Foto erstellen oder ein Foto von deinem Smartphone auswählen." text is displayed
      And the "description3" textfield with "Hinweis Im Nachweisdokument werden folgende Informationen benötigt: Vor- und Nachname, Ort, Zeitraum. Bitte schwärze für den Nachweis nicht benötigten Informationen. z.B. Ausbildungsrichtung, Foto." text is displayed
      And the "continue_button" button with "Nachweis hinzufügen" text is displayed

  @jira.QANOV-241083 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241074 @jira.link.detects.O2DE-3626 @manual
  @mobile @o2de @smoke @har
  Scenario: A postpay user can access to the "Decomission Contract Info" screen on android devices
    Given user has the "Decomission Contract Period" module configured in CMS for "Decomission Contract Period" page
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Period" page
     When clicks on the "start_datepicker" datepicker
      And the "start_calendar" calendar is displayed
      And selects "any" date in the "start_calendar" calendar
      And the "Decomission Contract Period" page is displayed
      And clicks on the "end_datepicker" datepicker
      And the "end_calendar" calendar is displayed
      And selects "any" date in the "end_calendar" calendar
      And the "Decomission Contract Period" page is displayed
      And clicks on the "continue_button" button
     Then the "Decomission Contract Info" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Nachweis zur Überprüfung einreichen" text is displayed
      And the "description1" textfield with "Um mit der Vertragsstillegung fortzufahren, ist es notwendig, einen entsprechenden Nachweis zur Überprüfung einzureichen." text is displayed
      And the "description2" textfield with "Du kannst ein Foto erstellen oder ein Foto von deinem Smartphone auswählen." text is displayed
      And the "description3" textfield with "Hinweis Im Nachweisdokument werden folgende Informationen benötigt: Vor- und Nachname, Ort, Zeitraum. Bitte schwärze für den Nachweis nicht benötigten Informationen. z.B. Ausbildungsrichtung, Foto." text is displayed
      And the "gallery_button" button with "Aus Galerie auswählen" text is displayed
      And the "camera_button" button with "Mit Kamera aufnehmen" text is displayed

  @jira.QANOV-241087 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241082 @manual @mobile @o2de @regression @har
  Scenario: A postpay user can tap on the Continue button in the "Decomission Contract Info" screen on iOS devices: several options to upload the document are displayed
    Given user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
     Then the "Select Image Sheet" sheet is displayed
      And the "gallery_button" button with "Fotomediathek" text is displayed
      And the "camera_button" button with "Foto aufnehmen" text is displayed
      And the "choose_file_button" button with "Datei auswählen" text is displayed

  @jira.QANOV-241088 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241087 @manual @mobile @o2de @regression
  Scenario: A postpay user who just installed the app decides to take a photo in the "Decomission Contract" flow for iOS devices: permission popup is displayed
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
     Then the "Camera Permissions Popup" popup is displayed
      And the "popup.title" textfield with "\"Mein O2\" Would like to access the Camera" text is displayed
      And the "popup.message" textfield with "Du kannst dein Profilfoto erst ändern und Bilder mit dem Supportmitarbeiter teilen, wenn du diesen Zugriff erlaubst" text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with "Don't allow" text is displayed

  @jira.QANOV-241089 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241087 @manual @mobile @o2de @regression
  Scenario: A postpay user who just installed the app decides to choose a gallery photo in the "Decomission Contract" flow for iOS devices: Photo Gallery is displayed
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "gallery_button" button
     Then the "Gallery" app is displayed

  @jira.QANOV-359884 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241087 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to choose a ICloud image in the "Decomission Contract" flow for iOS devices: ICloud Drive is displayed
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "choose_file_button" button
     Then the "ICloud Drive" app is displayed

  @jira.QANOV-241090 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241083 @manual @mobile @o2de @regression
  Scenario: A postpay user who just installed the app decides to take a photo in the "Decomission Contract" flow for android devices: permission popup is displayed
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "camera_button" button
     Then the "Camera Permissions Popup" popup is displayed
      And the "popup.title" textfield with "Allow "Mein O2" to take pictures and record video?" text is displayed
      And the "popup.accept" button with "Allow" text is displayed
      And the "popup.cancel" button with "Don't allow" text is displayed

  @jira.QANOV-241091 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241083 @manual @mobile @o2de @regression
  Scenario: A postpay user who just installed the app decides to choose a gallery photo in the "Decomission Contract" flow for android devices: Photo Gallery is displayed
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "gallery_button" button
     Then the "Gallery" app is displayed

  @jira.QANOV-241092 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241088 @jira.link.detects.IOS-8979 @manual @mobile
  @o2de @regression
  Scenario: A postpay user who just installed the app denies Camera permission in the "Decomission Contract" flow for iOS devices
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Decomission Contract Info" page is displayed

  @jira.QANOV-241094 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241090 @manual @mobile @o2de @regression
  Scenario: A postpay user who just installed the app denies Camera permission in the "Decomission Contract" flow for android devices
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Decomission Contract Info" page is displayed

  @jira.QANOV-241096 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241088 @manual @mobile @o2de @regression
  Scenario: A postpay user who just installed the app grants Camera permission in the "Decomission Contract" flow for iOS devices
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Camera" app is displayed

  @jira.QANOV-241098 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241090 @manual @mobile @o2de @regression
  Scenario: A postpay user who just installed the app grants Camera permission in the "Decomission Contract" flow for android devices
    Given user just installed the application
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Camera" app is displayed

  @jira.QANOV-241100 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241087 @manual @mobile @o2de @smoke
  Scenario: A postpay user who granted camera permission in the "Decomission Contract" flow can take a photo with iOS devices
    Given user has "granted" "camera" permissions
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user has the "Decomission Contract Confirm Document" module configured in CMS for "Decomission Contract Confirm Document" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And takes a picture from decomission contract page
     Then the "Decomission Contract Confirm Document" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241101 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241083 @manual @mobile @o2de @smoke
  Scenario: A postpay user who granted camera permission in the "Decomission Contract" flow can take a photo with android devices
    Given user has "granted" "camera" permissions
      And user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user has the "Decomission Contract Confirm Document" module configured in CMS for "Decomission Contract Confirm Document" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "camera_button" button
      And takes a picture from decomission contract page
     Then the "Decomission Contract Confirm Document" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241102 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241087 @manual @mobile @o2de @smoke
  Scenario: A postpay user can choose a gallery photo in the "Decomission Contract" flow for iOS devices: the "Decomission Contract Confirm Document" screen is displayed
    Given user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user has the "Decomission Contract Confirm Document" module configured in CMS for "Decomission Contract Confirm Document" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "gallery_button" button
      And the "Decomission Contract Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
     Then the "Decomission Contract Confirm Document" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241103 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241083 @manual @mobile @o2de @smoke
  Scenario: A postpay user can choose a gallery photo in the "Decomission Contract" flow for android devices: the "Decomission Contract Confirm Document" screen is displayed
    Given user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user has the "Decomission Contract Confirm Document" module configured in CMS for "Decomission Contract Confirm Document" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "gallery_button" button
      And the "Decomission Contract Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
     Then the "Decomission Contract Confirm Document" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-359885 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241087 @manual @mobile @o2de @smoke @har
  Scenario: User chooses a ICloud image in the "Decomission Contract" flow for iOS devices: the "Decomission Contract Confirm Document" screen is displayed
    Given user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user has the "Decomission Contract Confirm Document" module configured in CMS for "Decomission Contract Confirm Document" page
      And user is in the "Decomission Contract Info" page
     When clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "choose_file_button" button
      And the "ICloud Drive" app is displayed
      And selects an image from the drive
     Then the "Decomission Contract Confirm Document" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241104 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241100 @jira.link.depends_on.QANOV-241101
  @jira.link.depends_on.QANOV-241102 @jira.link.depends_on.QANOV-241103 @manual @mobile @o2de @regression
  Scenario: A postpay user can decide to change the image selected in the "Decomission Contract Confirm Document" screen
    Given user has the "Decomission Contract Info" module configured in CMS for "Decomission Contract Info" page
      And user has the "Decomission Contract Confirm Document" module configured in CMS for "Decomission Contract Confirm Document" page
      And user is in the "Decomission Contract Confirm Document" page
     When clicks on the "use_another_photo_button" button
     Then the "Decomission Contract Info" page is displayed

  @jira.QANOV-241105 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241100 @jira.link.depends_on.QANOV-241101
  @jira.link.depends_on.QANOV-241102 @jira.link.depends_on.QANOV-241103 @jira.link.detects.O2DE-3161
  @manual @mobile @o2de @smoke
  Scenario: A postpay user can decide to continue with the image selected in the "Decomission Contract Confirm Document" screen
    Given user has the "Decomission Contract Confirm Document" module configured in CMS for "Decomission Contract Confirm Document" page
      And user has the "Decomission Contract Summary" module configured in CMS for "Decomission Contract Summary" page
      And user is in the "Decomission Contract Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Decomission Contract Summary" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Gebühr für Vertragsstillegung" text is displayed
      And the "decommission_fee" module is displayed
      And the "decommission_fee.title" textfield with "Gebühr für Vertragsstillegung" text is displayed
      And the "decommission_fee.description" textfield with "Diese Gebühr wird mit deinem nächsten Rechnungslauf eingezogen." text is displayed
      And the "decommission_fee.value" textfield with the "\d+.\d{2} €" format is displayed
      And the "total_title" textfield with "Gesamtkosten (inkl. MwSt.)" text is displayed
      And the "total_amount" textfield with the "\d+.\d{2} €" format is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241106 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241105 @jira.link.detects.O2DE-3166
  @manual @mobile @o2de @smoke
  Scenario: A postpay user with a verified contact email can access to the "Decomission Contract Confirmation" screen
    Users with email stored in the app (verified or not verified) will be able to complete this flow. Users without
    email stored in the app will not be able to complete this flow.
    Given user has a "verified email" stored in the contact details
      And user has the "Decomission Contract Summary" module configured in CMS for "Decomission Contract Summary" page
      And user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user is in the "Decomission Contract Summary" page
     When clicks on the "continue_button" button
     Then the "Decomission Contract Confirmation" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Im Anschluss erhälst du eine Bestätigung auf deine hinterlegte E-Mail Adresse." text is displayed
      And the "decommission_fee" module is displayed
      And the "decommission_fee.title" textfield with "Gebühr für Vertragsstillegung" text is displayed
      And the "decommission_fee.description" textfield with "Diese Gebühr wird mit deinem nächsten Rechnungslauf eingezogen." text is displayed
      And the "decommission_fee.value" textfield with the "\d+.\d{2} €" format is displayed
      And the "account_holder.value" textfield is displayed
      And the "account_holder.label" textfield with "Vertragsinhaber" text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "E-Mail-Adresse" text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB die Leistungsbeschreibung, sowie die gultige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "pay_on_next_bill_button" button with "Jetzt verbindlich bestellen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-368949 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241105 @jira.link.detects.O2DE-3166
  @jira.link.detects.O2DE-3192 @manual @mobile @o2de @smoke
  Scenario: A postpay user with a not-verified contact email can access to the "Decomission Contract Confirmation" screen
    Users with email stored in the app (verified or not verified) will be able to complete this flow. Users without
    email stored in the app will not be able to complete this flow.
    Given user has a "not verified email" stored in the contact details
      And user has the "Decomission Contract Summary" module configured in CMS for "Decomission Contract Summary" page
      And user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user is in the "Decomission Contract Summary" page
     When clicks on the "continue_button" button
     Then the "Decomission Contract Confirmation" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Im Anschluss erhälst du eine Bestätigung auf deine hinterlegte E-Mail Adresse." text is displayed
      And the "decommission_fee" module is displayed
      And the "decommission_fee.title" textfield with "Gebühr für Vertragsstillegung" text is displayed
      And the "decommission_fee.description" textfield with "Diese Gebühr wird mit deinem nächsten Rechnungslauf eingezogen." text is displayed
      And the "decommission_fee.value" textfield with the "\d+.\d{2} €" format is displayed
      And the "account_holder.value" textfield is displayed
      And the "account_holder.label" textfield with "Vertragsinhaber" text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield with "Nicht hinterlegt/bestätigt" text is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB die Leistungsbeschreibung, sowie die gultige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "pay_on_next_bill_button" button with "Jetzt verbindlich bestellen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-268955 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241105 @manual @mobile @o2de @regression
  Scenario: A postpay user without a contact email can access to the "Decomission Contract Confirmation" screen
    Users without email stored in the app will not be able to complete this flow. Pending to define this scenarios (we
    do not know if the confirm_button should be hidden or if the user will be redirected to a screen where a text is
    displayed indicating that the email is needed to complete the flow).
    Given user has a "no email" stored in the contact details
      And user has the "Decomission Contract Summary" module configured in CMS for "Decomission Contract Summary" page
      And user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user is in the "Decomission Contract Summary" page
     When clicks on the "continue_button" button
     Then the "Decomission Contract Confirmation" page is displayed
      And the "Vertragsstillegung" header is displayed
      And the "title" textfield with "Zusammenfassung" text is displayed
      And the "description" textfield with "Im Anschluss erhälst du eine Bestätigung auf deine hinterlegte E-Mail Adresse." text is displayed
      And the "decommission_fee" module is displayed
      And the "decommission_fee.title" textfield with "Gebühr für Vertragsstillegung" text is displayed
      And the "decommission_fee.description" textfield with "Diese Gebühr wird mit deinem nächsten Rechnungslauf eingezogen." text is displayed
      And the "decommission_fee.value" textfield with the "\d+.\d{2} €" format is displayed
      And the "account_holder.value" textfield is displayed
      And the "account_holder.label" textfield with "Vertragsinhaber" text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with "Kontakt E-Mail" text is displayed
      And the "contact_email.description" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "legal_documents_textfield" textfield with "Ich akzeptiere die AGB die Leistungsbeschreibung, sowie die gultige Preisliste. Mir steht ein gesetzliches Widerrufsrecht zu." text is displayed
      And the "terms_and_conditions_link" link with "AGB" text is displayed
      And the "services_description_link" link with "Leistungsbeschreibung" text is displayed
      And the "price_list_link" link with "Preisliste" text is displayed
      And the "right_of_withdrawal_link" link with "Widerrufsrecht" text is displayed
      And the "pay_on_next_bill_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.<jira_id> @android @jira.cv.14.4 @jira.link.depends_on.QANOV-241106 @jira.link.depends_on.QANOV-268955
  @manual @mobile @o2de @regression
  Scenario Outline: A postpay user can access to the "<legal_document>" legal document from the "Decomission Contract Confirmation" screen on Android devices
    Given user has installed the "Google Drive" app
      And user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user is in the "Decomission Contract Confirmation" page
     When clicks on the "<link>" link
     Then the "Google Drive" app is displayed
      And the "Google Drive" page is displayed
      And the file with the "Dokument_\d+.pdf" format is downloaded as a PDF
      And the PDF file is opened
      And clicks on the "navigation_top_bar.back_button" button
      And the "Decomission Contract Confirmation" page is displayed

    Examples:
          | legal_document       | link                      | jira_id      |
          | Terms And Conditions | terms_and_conditions_link | QANOV-241107 |
          | Services Description | services_description_link | QANOV-241108 |
          | Price List           | price_list_link           | QANOV-241109 |
          | Right Of Withdrawal  | right_of_withdrawal_link  | QANOV-241110 |

  @jira.<jira_id> @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241106 @jira.link.depends_on.QANOV-268955
  @jira.link.detects.<detects> @manual @mobile @o2de @regression
  Scenario Outline: A postpay user can access to the "<legal_document>" legal document from the "Decomission Contract Confirmation" screen on iOS devices
    Given user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user is in the "Decomission Contract Confirmation" page
     When clicks on the "<link>" link
     Then the browser webview is displayed
      And the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And the "Decomission Contract Confirmation" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Decomission Contract Confirmation" page is displayed

    Examples:
          | legal_document       | link                      | detects   | jira_id      |
          | Terms And Conditions | terms_and_conditions_link |           | QANOV-268956 |
          | Services Description | services_description_link | O2DE-3167 | QANOV-268957 |
          | Price List           | price_list_link           |           | QANOV-268959 |
          | Right Of Withdrawal  | right_of_withdrawal_link  |           | QANOV-268960 |

  @jira.QANOV-241111 @android @ber @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241106 @jira.link.detects.O2DE-3171
  @manual @mobile @o2de @smoke
  Scenario: A postpay user with a contact email completes the decomission contract flow successfully
    Given user has a "email" stored in the contact details
      And user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user has the "Decomission Contract Success Feedback" module configured in CMS for "Decomission Contract Success Feedback" page
      And user is in the "Decomission Contract Confirmation" page
     When clicks on the "pay_on_next_bill_button" button
     Then the "Decomission Contract Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "success_message" textfield with "Bitte beachte, dass dieser Prozess ein paar Tage in Anspruch nehmen kann." text is displayed
      And the "close_button" button with "Schließen" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241112 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241111 @manual @mobile @o2de @regression
  Scenario: A postpay user can go back to My Contracts screen from the "Decomission Contract Success Feedback" screen
    Given user has the "Decomission Contract Success Feedback" module configured in CMS for "Decomission Contract Success Feedback" page
      And user is in the "Decomission Contract Success Feedback" page
     When clicks on the "close_button" button
     Then the "My Contracts" page is displayed

  @jira.QANOV-241113 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241106 @manual @mobile @o2de @regression
  Scenario: A postpay user with a contact email completes the decomission contract flow unsuccessfully
    Given user has a "email" stored in the contact details
      And user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user has the "Decomission Contract Error Feedback" module configured in CMS for "Decomission Contract Error Feedback" page
      And user is in the "Decomission Contract Confirmation" page
     When clicks on the "pay_on_next_bill_button" button
      And there is an error requesting the decomission contract
     Then the "Decomission Contract Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht gesendet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-241114 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241113 @manual @mobile @o2de @regression
  Scenario: A postpay user can go back to the Profile screen from the "Decomission Contract Error Feedback" screen
    Given user has the "Decomission Contract Error Feedback" module configured in CMS for "Decomission Contract Error Feedback" page
      And user is in the "Decomission Contract Error Feedback" page
     When clicks on the "back_to_profile_button" button
     Then the "Profile" page is displayed

  @jira.<jira_id> @<client> @jira.cv.14.4 @jira.link.depends_on.QANOV-241113 @manual @mobile @o2de @regression
  Scenario Outline: A postpay user can go to previous screen from the "Decomission Contract Error Feedback" screen on <client> devices
    Given user has the "Decomission Contract Error Feedback" module configured in CMS for "Decomission Contract Error Feedback" page
      And user is in the "Decomission Contract Error Feedback" page
     When clicks on the <button> button
     Then the "Decomission Contract Confirmation" page is displayed

    Examples:
          | client  | button                           | jira_id      |
          | android | native "back"                    | QANOV-241115 |
          | ios     | "navigation_top_bar.back_button" | QANOV-241116 |

  @jira.QANOV-268958 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-241106 @jira.link.depends_on.QANOV-268955
  @manual @mobile @o2de @regression
  Scenario: A postpay user can access to change the contact email from the "Decomission Contract Confirmation" screen
    Given user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user is in the "Decomission Contract Confirmation" page
     When clicks on the "contact_email.chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Decomission Contract Confirmation" page is displayed
      And the "Vertragsstillegung" header is displayed

  @jira.QANOV-342558 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-268958 @manual @mobile @o2de @regression
  Scenario: A postpay user goes back to the "Decomission Contract Confirmation" screen after updating the contact email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user is in the "Decomission Contract Confirmation" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Decomission Contract Confirmation" page is displayed
      And the "contact_email.email" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342559 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-268958 @manual @mobile @o2de @regression
  Scenario: A postpay user changes the contact email from the "Decomission Contract Confirmation" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Decomission Contract Confirmation" module configured in CMS for "Decomission Contract Confirmation" page
      And user is in the "Decomission Contract Confirmation" page
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
      And the "Decomission Contract Confirmation" page is displayed

  @jira.QANOV-342560 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-342559 @manual @mobile @o2de @regression
  Scenario: A user can go back to "Decomission Contract Confirmation" screen from the "Email Contact Informative Feedback" screen
    Given user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "close_button" button
     Then the "Decomission Contract Confirmation" page is displayed
