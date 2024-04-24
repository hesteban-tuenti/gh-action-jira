# -*- coding: utf-8 -*-
@jira.QANOV-240833
Feature: Self-employed verification

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has any "mobile_line;internet_at_home" product in "active" status


  @jira.QANOV-240834 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-312322 @jira.link.depends_on.QANOV-376011
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @sanity
  Scenario: User can access to the self-employed verification flow from the "My Contracts" screen
    Given user has the "My contracts" module configured in CMS for "My Contracts" page
      And user has the "Self Employed Verification Info" module configured in CMS for "Self Employed Verification Info" page
      And user is in the "My Contracts" page
     When clicks on the "my_contracts.self_employed_verification_entrypoint" entrypoint
     Then the "Self Employed Verification Info" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Nachweis zur Überprüfung einreichen" text is displayed
      And the "description1" textfield with "Damit wir dir die exklusiven Vorteile für Selbständige und Unternehmen gewähren können, benötigen wir bis zu 21 Tage nach Vertragsabschluss einen gültigen Nachweis deiner selbständigen, unternehmerischen Tätigkeit (gewerblich/freiberuflich)." text is displayed
      And the "description2" textfield with "Andernfalls gelten für dich die Tarif-Konditionen für Privatkunden." text is displayed
      And the "continue_button" button with "Weiter" text is displayed

  @jira.QANOV-240839 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240834 @manual @mobile @o2de @smoke
  Scenario: User can access to the "Self Employed Verification Choose Document" screen on iOS devices
    The list of possible documents are provided by API. Ex: Sales tax ID, Chamber or association ID, Trade license,
    Commercial register extract, Press ID, Metro membership card, Freelance contract.
    Given user has the "Self Employed Verification Info" module configured in CMS for "Self Employed Verification Info" page
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Info" page
     When clicks on the "continue_button" button
     Then the "Self Employed Verification Choose Document" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Nachweis wählen" text is displayed
      And the "documents_list" list is displayed
      And the "continue_button" button with "Nachweis hinzufügen" text is displayed

  @jira.QANOV-240835 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240834 @manual @mobile @o2de @smoke
  Scenario: User can access to the "Self Employed Verification Choose Document" screen on android devices
    The list of possible documents are provided by API. Ex: Sales tax ID, Chamber or association ID, Trade license,
    Commercial register extract, Press ID, Metro membership card, Freelance contract.
    Given user has the "Self Employed Verification Info" module configured in CMS for "Self Employed Verification Info" page
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Info" page
     When clicks on the "continue_button" button
     Then the "Self Employed Verification Choose Document" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Nachweis wählen" text is displayed
      And the "documents_list" list is displayed
      And the "gallery_button" button with "Aus Galerie auswählen" text is displayed
      And the "camera_button" button with "Mit Kamera aufnehmen" text is displayed

  @jira.QANOV-240840 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240839 @manual @mobile @o2de @regression
  Scenario: User taps on the Continue button in the "Self Employed Verification Choose Document" screen for iOS devices: several options to upload the document are displayed
    Given user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
     Then the "Select Image Sheet" sheet is displayed
      And the "gallery_button" button with "Fotomediathek" text is displayed
      And the "camera_button" button with "Foto aufnehmen" text is displayed
      And the "choose_file_button" button with "Datei auswählen" text is displayed

  @jira.QANOV-240841 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240840 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to take a photo in the "Self Employed Verification" flow for iOS devices: permission popup is displayed
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
     Then the "Camera Permissions Popup" popup is displayed
      And the "popup.title" textfield with "\"Mein O2\" Would like to Access the Camera" text is displayed
      And the "popup.message" textfield with "Du kannst dein Profilfoto erst ändern und Bilder mit dem Supportmitarbeiter teilen, wenn du diesen Zugriff erlaubst" text is displayed
      And the "popup.accept" button with "OK" text is displayed
      And the "popup.cancel" button with "Don't allow" text is displayed

  @jira.QANOV-240842 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240840 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to choose a gallery photo in the "Self Employed Verification" flow for iOS devices: Photo Gallery is displayed
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "gallery_button" button
     Then the "Gallery" app is displayed

  @jira.QANOV-240858 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240840 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to choose a ICloud image in the "Self Employed Verification" flow for iOS devices: ICloud Drive is displayed
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "choose_file_button" button
     Then the "ICloud Drive" app is displayed

  @jira.QANOV-240843 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240835 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to take a photo in the "Self Employed Verification" flow for android devices: permission popup is displayed
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on the "camera_button" button
     Then the "Camera Permissions Popup" popup is displayed
      And the "popup.title" textfield with "¿Quieres permitir que Mein O2 haga fotos y grabe videos?" text is displayed
      And the "popup.accept" button with "PERMITIR" text is displayed
      And the "popup.cancel" button with "DENEGAR" text is displayed

  @jira.QANOV-240844 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240835 @manual @mobile @o2de @regression
  Scenario: User who just installed the app decides to choose a gallery photo in the "Self Employed Verification" flow for android devices: Photo Gallery is displayed
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on the "gallery_button" button
     Then the "Gallery" app is displayed

  @jira.QANOV-240845 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240841 @manual @mobile @o2de @regression
  Scenario: User who just installed the app denies Camera permission in the "Self Employed Verification" flow for iOS devices
  Even if the user rejects the camera consent, the Camera will be opened but the user shouldn't be able to interact
  with it apart from closing it. The permission won't be asked again unless the app is reinstalled.
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Camera" page is displayed
      And the camera is displayed in black
      And clicks on the "close_camera" button
      And the "Self Employed Verification Choose Document" page is displayed

  @jira.QANOV-240847 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240843 @manual @mobile @o2de @regression
  Scenario: User who just installed the app denies Camera permission in the "Self Employed Verification" flow for android devices
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Self Employed Verification Choose Document" page is displayed

  @jira.QANOV-240849 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240841 @manual @mobile @o2de @regression
  Scenario: User who just installed the app grants Camera permission in the "Self Employed Verification" flow for iOS devices
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Camera" app is displayed

  @jira.QANOV-240851 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240843 @manual @mobile @o2de @regression
  Scenario: User who just installed the app grants Camera permission in the "Self Employed Verification" flow for android devices
    Given user just installed the application
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on the "camera_button" button
      And the "Camera Permissions Popup" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Camera" app is displayed

  @jira.QANOV-240853 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240849 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke @har
  Scenario: User who granted camera permission in the "Self Employed Verification" flow can take a photo with iOS devices
    Given user has "granted" "camera" permissions
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "camera_button" button
      And takes a picture from self-employed verification page
     Then the "Self Employed Verification Confirm Document" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240854 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240851 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke @har
  Scenario: User who granted camera permission in the "Self Employed Verification" flow can take a photo with android devices
    Given user has "granted" "camera" permissions
      And user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on the "camera_button" button
      And takes a picture from self-employed verification page
     Then the "Self Employed Verification Confirm Document" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240855 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240840 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: User can choose a gallery photo in the "Self Employed Verification" flow for iOS devices: the "Self Employed Verification Confirm Document" screen is displayed
    Given user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "gallery_button" button
      And the "Self Employed Verification Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
     Then the "Self Employed Verification Confirm Document" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240856 @android @jira.cv.14.4 @jira.link.depends_on.QANOV-240835 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: User can choose a gallery photo in the "Self Employed Verification" flow for android devices: the "Self Employed Verification Confirm Document" screen is displayed
    Given user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on the "gallery_button" button
      And the "Self Employed Verification Gallery" page is displayed
      And the "gallery_list" list is displayed
      And selects a picture from the gallery
     Then the "Self Employed Verification Confirm Document" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-268963 @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240840 @jira.link.parent_test_plan.QANOV-437471
  @manual @mobile @o2de @smoke
  Scenario: User chooses a ICloud image in the "Self Employed Verification" flow for iOS devices: the "Self Employed Verification Confirm Document" screen is displayed
    Given user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user is in the "Self Employed Verification Choose Document" page
     When clicks on any element in the "documents_list" list
      And clicks on the "continue_button" button
      And the "Select Image Sheet" sheet is displayed
      And clicks on the "choose_file_button" button
      And the "ICloud Drive" app is displayed
      And selects an image from the drive
     Then the "Self Employed Verification Confirm Document" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Nachweis hochladen" text is displayed
      And the "document_image" image is displayed
      And the "continue_button" button with "Bild verwenden" text is displayed
      And the "use_another_photo_button" button with "Wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240857 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240853 @jira.link.depends_on.QANOV-240854
  @jira.link.depends_on.QANOV-240855 @jira.link.depends_on.QANOV-240856 @manual @mobile @o2de @regression
  Scenario: User can change the image selected in the "Self Employed Verification Confirm Document" screen
    Given user has the "Self Employed Verification Choose Document" module configured in CMS for "Self Employed Verification Choose Document" page
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user is in the "Self Employed Verification Confirm Document" page
     When clicks on the "use_another_photo_button" button
     Then the "Self Employed Verification Choose Document" page is displayed

  @jira.QANOV-240859 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240853 @jira.link.depends_on.QANOV-240854
  @jira.link.depends_on.QANOV-240855 @jira.link.depends_on.QANOV-240856 @manual @mobile @o2de @smoke
  Scenario: User with a verified contact email can access to the "Self Employed Verification Email Address" screen
    Users with email stored in the app (verified or not verified) will be able to complete this flow. Users without
    email stored in the app will not be able to complete this flow.
    Given user has a "verified email" stored in the contact details
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user has the "Self Employed Verification Email Address" module configured in CMS for "Self Employed Verification Email Address" page
      And user is in the "Self Employed Verification Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Self Employed Verification Email Address" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Zur Bestätigung des Vorgangs erhälst du eine E-Mail. Bitte überprüfe deine hinterlegte E-Mail Adresse." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield is not displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "E-Mail-Adresse" text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Bestätigen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-368950 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240853 @jira.link.depends_on.QANOV-240854
  @jira.link.depends_on.QANOV-240855 @jira.link.depends_on.QANOV-240856 @jira.link.detects.O2DE-3192 @manual @mobile @o2de
  @smoke
  Scenario: User with a not-verified contact email can access to the "Self Employed Verification Email Address" screen
    Users with email stored in the app (verified or not verified) will be able to complete this flow. Users without
    email stored in the app will not be able to complete this flow.
    Given user has a "not verified email" stored in the contact details
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user has the "Self Employed Verification Email Address" module configured in CMS for "Self Employed Verification Email Address" page
      And user is in the "Self Employed Verification Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Self Employed Verification Email Address" page is displayed
      And the "Nachweis für Selbständige" header is displayed
      And the "title" textfield with "Kontakt E-Mail Adresse" text is displayed
      And the "description" textfield with "Zur Bestätigung des Vorgangs erhälst du eine E-Mail. Bitte überprüfe deine hinterlegte E-Mail Adresse." text is displayed
      And the "contact_email" module is displayed
      And the "contact_email.status_tag" textfield with "Nicht hinterlegt/bestätigt" text is displayed
      And the "contact_email.email" textfield with the "^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-]+$" format is displayed
      And the "contact_email.description" textfield with "Sieh in deinem Posteingang nach, ob du eine E-Mail erhalten hast, sonst erhältst du keine Benachrichtigung." text is displayed
      And the "contact_email.chevron" icon is displayed
      And the "confirm_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-268964 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240853 @jira.link.depends_on.QANOV-240854
  @jira.link.depends_on.QANOV-240855 @jira.link.depends_on.QANOV-240856 @manual @mobile @o2de @regression
  Scenario: User without a contact email saved can access to the "Self Employed Verification Email Address" screen
    Users without email stored in the app will not be able to complete this flow. Pending to define this scenarios (we
    do not know if the confirm_button should be hidden or if the user will be redirected to a screen where a text is
    displayed indicating that the email is needed to complete the flow).
    Given user has a "no email" stored in the contact details
      And user has the "Self Employed Verification Confirm Document" module configured in CMS for "Self Employed Verification Confirm Document" page
      And user has the "Self Employed Verification Email Address" module configured in CMS for "Self Employed Verification Email Address" page
      And user is in the "Self Employed Verification Confirm Document" page
     When clicks on the "continue_button" button
     Then the "Self Employed Verification Email Address" page is displayed
      And the "Nachweis für Selbständige" header is displayed
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

  @jira.QANOV-240860 @android @ber @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240859 @jira.link.detects.O2DE-3171
  @jira.link.parent_test_plan.QANOV-437471 @manual @mobile @o2de @smoke
  Scenario: User with a contact email completes the self-employed verification successfully
    Given user has a "email" stored in the contact details
      And user has the "Self Employed Verification Email Address" module configured in CMS for "Self Employed Verification Email Address" page
      And user has the "Self Employed Verification Success Feedback" module configured in CMS for "Self Employed Verification Success Feedback" page
      And user is in the "Self Employed Verification Email Address" page
     When clicks on the "confirm_button" button
     Then the "Self Employed Verification Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Wir haben deine Anfrage erhalten" text is displayed
      And the "success_message" textfield with "Bitte beachte, dass dieser Prozess ein paar Tage in Anspruch nehmen kann." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240861 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240860 @manual @mobile @o2de @regression
  Scenario: User can go back to the Profile screen from the "Self Employed Verification Success Feedback" screen
    Given user has the "Self Employed Verification Success Feedback" module configured in CMS for "Self Employed Verification Success Feedback" page
      And user is in the "Self Employed Verification Success Feedback" page
     When clicks on the "back_to_profile_button" button
     Then the "Profile" page is displayed

  @jira.QANOV-240862 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240859 @manual @mobile @o2de @regression
  Scenario: User with a contact email completes the self-employed verification unsuccessfully
    Given user has a "email" stored in the contact details
      And user has the "Self Employed Verification Email Address" module configured in CMS for "Self Employed Verification Email Address" page
      And user has the "Self Employed Verification Error Feedback" module configured in CMS for "Self Employed Verification Error Feedback" page
      And user is in the "Self Employed Verification Email Address" page
     When clicks on the "confirm_button" button
      And there is an error requesting the document verification
     Then the "Self Employed Verification Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Deine Anfrage konnte nichht gesendet werden." text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_profile_button" button with "Zurück zum Profil" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "My Contracts" page is displayed

  @jira.QANOV-240863 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240862 @manual @mobile @o2de @regression
  Scenario: User can go back to the Profile screen from the "Self Employed Verification Error Feedback" screen
    Given user has the "Self Employed Verification Error Feedback" module configured in CMS for "Self Employed Verification Error Feedback" page
      And user is in the "Self Employed Verification Error Feedback" page
     When clicks on the "back_to_profile_button" button
     Then the "Profile" page is displayed

  @jira.<jira_id> @<client> @jira.cv.14.4 @jira.link.depends_on.QANOV-240862 @manual @mobile @o2de @regression
  Scenario Outline: User can go to previous screen from the "Self Employed Verification Error Feedback" screen on <client> devices
    Given user has the "Self Employed Verification Error Feedback" module configured in CMS for "Self Employed Verification Error Feedback" page
      And user is in the "Self Employed Verification Error Feedback" page
     When clicks on the <button> button
     Then the "Self Employed Verification Address" page is displayed

    Examples:
          | client  | button                           | jira_id      |
          | android | native "back"                    | QANOV-240864 |
          | ios     | "navigation_top_bar.back_button" | QANOV-240865 |

  @jira.QANOV-268965 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-240859 @jira.link.depends_on.QANOV-268964
  @manual @mobile @o2de @regression
  Scenario: User can access to change the contact email from the "contact email" entrypoint in the "Self Employed Verification Email Address" screen
    Given user has the "Self Employed Verification Email Address" module configured in CMS for "Self Employed Verification Email Address" page
      And user is in the "Self Employed Verification Email Address" page
     When clicks on the "contact_email.chevron" icon
     Then the "Email Contact" page is displayed
      And the "E-Mail-Adresse ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Self Employed Verification Email Address" page is displayed
      And the "Nachweis für Selbständige" header is displayed

  @jira.QANOV-342561 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-268965 @manual @mobile @o2de @regression
  Scenario: User goes back to the "Self Employed Verification Email Address" screen after updating the contact email
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    NOTE: if the contact email change takes too long, an informative screen will be displayed instead of the Success
    Feedback screen.
    Given user has the "Self Employed Verification Email Address" module configured in CMS for "Self Employed Verification Email Address" page
      And user is in the "Self Employed Verification Email Address" page
     When clicks on the "contact_email.chevron" icon
      And the "Email Contact" page is displayed
      And updates the email successfully
      And the "Email Contact Success Feedback" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the "Self Employed Verification Email Address" page is displayed
      And the "contact_email.email" textfield is updated
      And the "success_warning" warning is displayed
      And the "success_warning.text" textfield with "Deine E-Mail-Adresse wurde aktualisiert." text is displayed

  @jira.QANOV-342562 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-268965 @jira.link.detects.LOC-1230
  @jira.link.detects.O2DE-3182 @manual @mobile @o2de @regression
  Scenario: User changes the contact email from the "Self Employed Verification Email Address" screen but the confirmation takes too long: an informative screen is displayed
    The complete flow to change the contact email is defined in the folder settings_and_profile/personal_data/email.feature
    Given user has the "Self Employed Verification Email Address" module configured in CMS for "Self Employed Verification Email Address" page
      And user is in the "Self Employed Verification Email Address" page
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
      And the "Self Employed Verification Email Address" page is displayed

  @jira.QANOV-342563 @android @ios @jira.cv.14.4 @jira.link.depends_on.QANOV-342562 @jira.link.detects.O2DE-3182 @manual
  @mobile @o2de @regression
  Scenario: A user can go back to "Self Employed Verification Email Address" screen from the "Email Contact Informative Feedback" screen
    Given user has the "Email Contact Informative Feedback" module configured in CMS for "Email Contact Informative Feedback" page
      And user is in the "Email Contact Informative Feedback" page
     When clicks on the "close_button" button
     Then the "Self Employed Verification Email Address" page is displayed
