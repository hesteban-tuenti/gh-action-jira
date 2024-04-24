# -*- coding: utf-8 -*-
@jira.QANOV-240866
Feature: Young-age verification

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status


  @jira.QANOV-479004 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-312322
  @jira.link.depends_on.QANOV-376011 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity
  Scenario: User can access to the young-age verification flow from the "My Contracts" screen
    Given user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Young Age Verification Selection" module configured in CMS for "Young Age Verification Selection" page
      And user is in the "My Contracts" page
     When clicks on the "my_contracts.young_age_verification_entrypoint" entrypoint
     Then the "Young Age Verification Selection" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Gib zu Beginn dein Geburstdatum ein" text is displayed
      And the "birth_datepicker" inputtext with the "Geburstdatum" placeholder is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-479005 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-312322 @jira.link.depends_on.QANOV-376011
  @manual @mobile @o2de @regression
  Scenario: User with saved birthdate should see the "birth_datepicker" inputtext filled when accessing the "Young Age Verification" page
    The age range possibilities are provided by API: less than 28 years old, more than 28 years old.
    Given user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the birthdate saved
      And user has the "Young Age Verification Selection" module configured in CMS for "Young Age Verification Selection" page
      And user is in the "My Contracts" page
     When clicks on the "my_contracts.young_age_verification_entrypoint" entrypoint
     Then the "Young Age Verification Selection" page is displayed
      And the "birth_datepicker" inputtext is displayed with the saved birthdate

  @jira.QANOV-479006 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-312322 @jira.link.depends_on.QANOV-376011
  @manual @mobile @o2de @regression
  Scenario: User without a birthdate saved can not continue with the bitrh date empty
    The age range possibilities are provided by API: less than 28 years old, more than 28 years old.
    Given user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has no birthdate saved
      And user has the "Young Age Verification Selection" module configured in CMS for "Young Age Verification Selection" page
      And user is in the "Young Age Verification Selection" page
     When clicks on the "continue_button" button
     Then the "birth_datepicker_error_textfield" textfield with "Das ist ein Pflichtfeld" text is displayed

  @jira.QANOV-479007 @android @jira.cv.14.10 @jira.link.depends_on.QANOV-312322 @jira.link.depends_on.QANOV-376011 @manual
  @mobile @o2de @regression
  Scenario: User should not be able to select a date in the "birth_calendar" calendar after today in Android devices
    The age range possibilities are provided by API: less than 28 years old, more than 28 years old.
    Given user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Young Age Verification Selection" module configured in CMS for "Young Age Verification Selection" page
      And the "Young Age Verification Selection" page is displayed
     When clicks on the "birth_datepicker" inputtext
     Then all days after today will be disabled in the "birth_calendar" calendar

  @jira.QANOV-479008 @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-312322 @jira.link.depends_on.QANOV-376011 @manual
  @mobile @o2de @regression
  Scenario: User should not be able to access to the "Young Age Verification Info" page when selecting a date after today in the "birth_calendar" in iOS devices
    The age range possibilities are provided by API: less than 28 years old, more than 28 years old.
    Given user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Young Age Verification Selection" module configured in CMS for "Young Age Verification Selection" page
      And the "Young Age Verification Selection" page is displayed
     When selects tomorrow date in the "birth_calendar" calendar
     Then the "birth_datepicker_error_textfield" textfield with "Unzulässiges Datum" text is displayed

  @jira.QANOV-479009 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-479004 @manual @mobile @o2de
  @jira.link.parent_test_plan.QANOV-437471 @regression @ber
  Scenario: User can access to the "Young Age Verification Info" screen adding a date for a + 28 years old
    Given user has the "Young Age Verification Selection" module configured in CMS for "Young Age Verification Selection" page
      And user has the "Young Age Verification Info" module configured in CMS for "Young Age Verification Info" page
      And user is in the "Young Age Verification Selection" page
     When user adds a date in "birth_datepicker" inputtext related to a + 28 year old
      And clicks on the "continue_button" button
     Then the "Young Age Verification Info" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Nachweisdokument" text is displayed
      And the "description1" textfield with "Bei Sonderkonditionen für “Junge Leute” benötigen wir zum Erhalt der Sonderkonditionen einen Altersnachweis (z.B. ein Foto des Studentenausweises)." text is displayed
      And the "description2" textfield is not displayed
      And the "front_id_image" image is not displayed
      And the "back_id_image" image is not displayed
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-479010 @android @ios @jira.cv.14.10 @jira.link.depends_on.QANOV-479004 @manual @mobile @o2de
  @jira.link.parent_test_plan.QANOV-437471 @regression @ber
  Scenario: User can access to the "Young Age Verification Info" screen after adding a date for a < 28 years old
    Given user has the "Young Age Verification Selection" module configured in CMS for "Young Age Verification Selection" page
      And user has the "Young Age Verification Info" module configured in CMS for "Young Age Verification Info" page
      And user is in the "Young Age Verification Selection" page
     When user adds a date in "birth_datepicker" inputtext related to a < 28 year old
      And clicks on the "continue_button" button
     Then the "Young Age Verification Info" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Nachweisdokument" text is displayed
      And the "description1" textfield with "Bei Sonderkonditionen für “Junge Leute” benötigen wir zum Erhalt der Sonderkonditionen einen Ausbildungsnachweises (z.B. ein Foto des Studentenausweises)." text is displayed
      And the "description2" textfield with "Beispiel:" text is displayed
      And the "front_id_image" image is displayed
      And the "back_id_image" image is displayed
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-240869 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240868 @jira.link.depends_on.QANOV-479009
  @jira.link.depends_on.QANOV-479010 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: User can access to the "Young Age Verification Choose Document" screen on android devices
    The list of possible documents are provided by API. Ex: new ID, Passport, Student ID, Diploma, Certificate of
    enrollment, Other.
    Given user has the "Young Age Verification Info" module configured in CMS for "Young Age Verification Info" page
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Info" page
     When clicks on the "continue_button" button
     Then the "Young Age Verification Choose Document" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Nachweisdokument wählen" text is displayed
      And the "documents_list" list is displayed
      And the "gallery_button" button with "Aus Galerie auswählen" text is displayed
      And the "camera_button" button with "Mit Kamera aufnehmen" text is displayed

  @jira.QANOV-240873 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240868 @jira.link.depends_on.QANOV-479009
  @jira.link.depends_on.QANOV-479010 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: User can access to the "Young Age Verification Choose Document" screen on iOS devices
    The list of possible documents are provided by API. Ex: new ID, Passport, Student ID, Diploma, Certificate of
    enrollment, Other.
    Given user has the "Young Age Verification Info" module configured in CMS for "Young Age Verification Info" page
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Info" page
     When clicks on the "continue_button" button
     Then the "Young Age Verification Choose Document" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Nachweisdokument wählen" text is displayed
      And the "documents_list" list is displayed
      And the "continue_button" button with "Nachweis hinzufügen" text is displayed

  @jira.QANOV-240874 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240873 @manual @mobile @o2de @regression
  Scenario: User taps on the Continue button in the "Young Age Verification Choose Document" screen for iOS devices: several options to upload the document are displayed
    Given user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
     Then the "Select Image Sheet" sheet is displayed
      And the "gallery_button" button with "Fotomediathek" text is displayed
      And the "camera_button" button with "Foto aufnehmen" text is displayed
      And the "choose_file_button" button with "Datei auswählen" text is displayed

  @jira.QANOV-240875 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240874 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to take a photo in the "Young Age Verification" flow for iOS devices: permission popup is displayed
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
     Then the "Camera Permissions Popup" popup is displayed
      And the "popup.title" textfield with "\"Mein O2\" quiere acceder a la cámara" text is displayed
      And the "popup.message" textfield with "Du kannst dein Profilfoto erst ändern und Bilder mit dem Supportmitarbeiter teilen, wenn du diesen Zugriff erlaubst" text is displayed
      And the "popup.accept" button with "Permitir" text is displayed
      And the "popup.cancel" button with "No permitir" text is displayed

  @jira.QANOV-240876 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240874 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to choose a gallery photo in the "Young Age Verification" flow for iOS devices: Photo Gallery is displayed
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "gallery_button" button
     Then the "Gallery" app is displayed

  @jira.QANOV-268961 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240874 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to choose a ICloud image in the "Young Age Verification" flow for iOS devices: ICloud Drive is displayed
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "choose_file_button" button
     Then the "ICloud Drive" app is displayed

  @jira.QANOV-240877 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240869 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to take a photo in the "Young Age Verification" flow for android devices: permission popup is displayed
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "camera_button" button
     Then the "Camera Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que Mein O2 haga fotos y grabe videos?" text is displayed
      And the "popup.accept" button with "PERMITIR" text is displayed
      And the "popup.cancel" button with "DENEGAR" text is displayed

  @jira.QANOV-240878 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240869 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to choose a gallery photo in the "Young Age Verification" flow for android devices: Photo Gallery is displayed
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "gallery_button" button
     Then the "Gallery" app is displayed

  @jira.QANOV-240879 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240875 @manual @mobile @o2de @regression
  Scenario: User who just installed the app denies Camera permission in the "Young Age Verification" flow for iOS devices
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Camera" app is displayed with a black image

  @jira.QANOV-240881 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240877 @manual @mobile @o2de @regression
  Scenario: User who just installed the app denies Camera permission in the "Young Age Verification" flow for android devices
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Young Age Verification Info" page is displayed

  @jira.QANOV-240883 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240875 @manual @mobile @o2de @regression
  Scenario: User who just installed the app grants Camera permission in the "Young Age Verification" flow for iOS devices
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Camera" app is displayed

  @jira.QANOV-240885 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240877 @manual @mobile @o2de @regression
  Scenario: User who just installed the app grants Camera permission in the "Young Age Verification" flow for android devices
    Given user just installed the application
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Camera" app is displayed

  @jira.QANOV-240887 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240883 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: User who granted camera permission in the "Young Age Verification" flow can take a photo with iOS devices
    Given user has "granted" "camera" permissions
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And takes a picture from young-age verification page
     Then the "Young Age Verification Confirm Document" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240888 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240885 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: User who granted camera permission in the "Young Age Verification" flow can take a photo with android devices
    Given user has "granted" "camera" permissions
      And user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "camera_button" button
      And takes a picture from young-age verification page
     Then the "Young Age Verification Confirm Document" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240889 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240874 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke @har
  Scenario: User can choose a gallery photo in the "Young Age Verification" flow for iOS devices: the "Young Age Verification Confirm Document" screen is displayed
    Given user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "gallery_button" button
      And the "Young Age Verification Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
     Then the "Young Age Verification Confirm Document" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240890 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240869 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke @har
  Scenario: User can choose a gallery photo in the "Young Age Verification" flow in android devices: the "Young Age Verification Confirm Document" screen is displayed
    Given user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "gallery_button" button
      And the "Young Age Verification Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
     Then the "Young Age Verification Confirm Document" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-268962 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240874 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: User can choose a ICloud image in the "Young Age Verification" flow for iOS devices: the "Young Age Verification Confirm Document" screen is displayed
    Given user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document" page
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user is in the "Young Age Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "choose_file_button" button
      And the "ICloud Drive" app is displayed
      And selects an image from the drive
     Then the "Young Age Verification Confirm Document" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240891 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240887 @jira.link.depends_on.QANOV-240888
  @jira.link.depends_on.QANOV-240889 @jira.link.depends_on.QANOV-240890 @jira.link.depends_on.QANOV-268962 @manual
  @mobile @o2de @regression
  Scenario: User can change the image selected in the "Young Age Verification Confirm Document" screen
    Given user has the "Young Age Verification Choose Document" module configured in CMS for "Young Age Verification Choose Document>" page
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user is in the "Young Age Verification Confirm Document" page
     When clicks on the "use_another_photo_button" button
     Then the "Young Age Verification Choose Document" page is displayed

  @jira.QANOV-240893 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240887 @jira.link.depends_on.QANOV-240888
  @jira.link.depends_on.QANOV-240889 @jira.link.depends_on.QANOV-240890 @jira.link.depends_on.QANOV-268962 @manual
  @mobile @o2de @smoke
  Scenario: User with a verified contact email can access to the "Young Age Verification Email Address" screen
    Users with email stored in the app (verified or not verified) will be able to complete this flow. Users without
    email stored in the app will not be able to complete this flow.
    Given user has a "verified email" stored in the contact details
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user has the "Young Age Verification Email Address" module configured in CMS for "Young Age Verification Email Address" page
      And user is in the "Young Age Verification Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Young Age Verification Email Address" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Zur Bestätigung des Vorgangs erhälst du eine E-Mail. Bitte überprüfe deine hinterlegte E-Mail Adresse." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "E-Mail-Adresse" text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Bestätigen und abschicken" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-368951 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240887 @jira.link.depends_on.QANOV-240888
  @jira.link.depends_on.QANOV-240889 @jira.link.depends_on.QANOV-240890 @jira.link.depends_on.QANOV-268962
  @jira.link.detects.O2DE-3192 @manual @mobile @o2de @smoke
  Scenario: User with a not-verified contact email can access to the "Young Age Verification Email Address" screen
    Users with email stored in the app (verified or not verified) will be able to complete this flow. Users without
    email stored in the app will not be able to complete this flow.
    Given user has a "not verified email" stored in the contact details
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user has the "Young Age Verification Email Address" module configured in CMS for "Young Age Verification Email Address" page
      And user is in the "Young Age Verification Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Young Age Verification Email Address" page is displayed
      And the "Young-age verification" header is displayed
      And the "title" textfield with "Contact email address" text is displayed
      And the "description" textfield with "In order to verify the document, we will send your an email to your current contact email address." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield with "Nicht hinterlegt/bestätigt" text is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Bestätigen und abschicken" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-268972 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240887 @jira.link.depends_on.QANOV-240888
  @jira.link.depends_on.QANOV-240889 @jira.link.depends_on.QANOV-240890 @manual @mobile @o2de @regression
  Scenario: User without a contact email can access to the "Young Age Verification Email Address" screen
    Users without email stored in the app will not be able to complete this flow. Pending to define this scenarios (we
    do not know if the confirm_button should be hidden or if the user will be redirected to a screen where a text is
    displayed indicating that the email is needed to complete the flow).
    Given user has a "no email" stored in the contact details
      And user has the "Young Age Verification Confirm Document" module configured in CMS for "Young Age Verification Confirm Document" page
      And user has the "Young Age Verification Email Address" module configured in CMS for "Young Age Verification Email Address" page
      And user is in the "Young Age Verification Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Young Age Verification Email Address" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Zur Bestätigung des Vorgangs erhälst du eine E-Mail. Bitte überprüfe deine hinterlegte E-Mail Adresse." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with "Kontakt E-Mail" text is displayed
      And the "contact_email.description" textfield with "Gib eine E-Mail-Adresse ein, um eine Bestätigungsnachricht zu erhalten." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button is not displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240894 @android @ber @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240893 @jira.link.detects.O2DE-3171
  @jira.link.detects.O2DE-3293 @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: User with a contact email completes the young-age verification successfully
    For the user to be able to complete the young-age verification successfully, the user needs to have the birthdate
    info.
    Given user has a "email" stored in the contact details
      And user has the birthdate saved
      And user has the "Young Age Verification Email Address" module configured in CMS for "Young Age Verification Email Address" page
      And user has the "Young Age Verification Success Feedback" module configured in CMS for "Young Age Verification Success Feedback" page
      And user is in the "Young Age Verification Email Address" page
     When clicks on the "confirm_button" button
     Then the "Young Age Verification Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "success_message" textfield with "Bitte beachte, dass dieser Prozess ein paar Tage in Anspruch nehmen kann." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240895 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240894 @manual @mobile @o2de @regression
  Scenario: User can go back to the Profile screen from the "Young Age Verification Success Feedback" screen
    Given user has the "Young Age Verification Success Feedback" module configured in CMS for "Young Age Verification Success Feedback" page
      And user is in the "Young Age Verification Success Feedback" page
     When clicks on the "back_to_profile_button" button
     Then the "Profile" page is displayed

  @jira.QANOV-240896 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240893 @manual @mobile @o2de @regression
  Scenario: User with a contact email completes the young-age verification unsuccessfully
    Given user has a "email" stored in the contact details
      And user has the "Young Age Verification Email Address" module configured in CMS for "Young Age Verification Email Address" page
      And user has the "Young Age Verification Error Feedback" module configured in CMS for "Young Age Verification Error Feedback" page
      And user is in the "Young Age Verification Email Address" page
     When clicks on the "confirm_button" button
      And there is an error requesting the document verification
     Then the "Young Age Verification Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nicht gesendet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240897 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240896 @manual @mobile @o2de @regression
  Scenario: User can go back to My Contracts screen from the "Young Age Verification Error Feedback" screen
    Given user has the "Young Age Verification Error Feedback" module configured in CMS for "Young Age Verification Error Feedback" page
      And user is in the "Young Age Verification Error Feedback" page
     When clicks on the "back_to_profile_button" button
     Then the "My Contracts" page is displayed

  @jira.<jira_id> @<client> @jira.cv.14.4 @jira.link.depends_on.QANOV-240896 @manual @mobile @o2de @regression
  Scenario Outline: User can go to previous screen from the "Young Age Verification Error Feedback" screen on <client> devices
    Given user has the "Young Age Verification Error Feedback" module configured in CMS for "Young Age Verification Error Feedback" page
      And user is in the "Young Age Verification Error Feedback" page
     When clicks on the <button> button
     Then the "Young Age Verification Address" page is displayed

    Examples:
          | client  | button                           | jira_id      |
          | android | native "back"                    | QANOV-240898 |
          | ios     | "navigation_top_bar.back_button" | QANOV-240899 |

  @jira.QANOV-268973 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240893 @jira.link.depends_on.QANOV-268972
  @manual @mobile @o2de @regression
  Scenario: User can access to change the contact email from the "contact email" entrypoint in the "Young Age Verification Email Address" screen
    Given user has the "Young Age Verification Email Address" module configured in CMS for "Young Age Verification Email Address" page
      And user is in the "Young Age Verification Email Address" page
     When clicks on the "contact_email.chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Young Age Verification Email Address" page is displayed
      And the "Nachweis “Junge Leute”" header is displayed

  @jira.QANOV-342564 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-268973 @manual @mobile @o2de @regression
  Scenario: User goes back to the "Young Age Verification Email Address" screen after updating de contact email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Young Age Verification Email Address" module configured in CMS for "Young Age Verification Email Address" page
      And user is in the "Young Age Verification Email Address" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Young Age Verification Email Address" page is displayed
      And the "contact_email.email" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342565 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-268973 @manual @mobile @o2de @regression
  Scenario: User changes the contact email from the "Young Age Verification Email Address" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Young Age Verification Email Address" module configured in CMS for "Young Age Verification Email Address" page
      And user is in the "Young Age Verification Email Address" page
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
      And the "Young Age Verification Email Address" page is displayed

  @jira.QANOV-342566 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-342565 @manual @mobile @o2de @regression
  Scenario: A user can go back to "Young Age Verification Email Address" screen from the "Email Contact Informative Feedback" screen
    Given user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "close_button" button
     Then the "Young Age Verification Email Address" page is displayed
