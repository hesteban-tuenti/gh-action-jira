# -*- coding: utf-8 -*-
@jira.QANOV-477115
Feature: eSIM Installation

  Actions Before each Scenario:
    Given user has a "postpay" account type
      And user has a "mobile_line" product in "active" status
      And user has a SIM in "ready_installation" status
      And user has the matching subscription selected in the account


  @jira.QANOV-477116 @android @ber @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477111
  @jira.link.depends_on.QANOV-477113 @manual @mobile @smoke
  Scenario: A postpay user with a eSIM pending installation can access to the "Install SIM Without SMS Verification" screen
    Given user has the "Install Esim Info" module configured in CMS for "Install Esim Info" page
      And user has the "Install Esim Without SMS Verification" module configured in CMS for "Install Esim Without SMS Verification" page
      And user is in the "Install Esim Info" page
     When clicks on the "validate_without_sms_button" button
     Then the "Install Esim Without SMS Verification" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "title" textfield with "eSIM-QR-Code benötigt" text is displayed
      And the "description" textfield with "Um einen eSIM-QR-Code anzufordern wende dich bitte an einen unserer Blau Shops." text is displayed
      And the "have_already_qr_code_entrypoint" entrypoint with "Ich habe den QR-Code bereits" text is displayed
      And the "find_shop_entrypoint" entrypoint with "Zum Shopfinder" text is displayed
      And the "find_shop_label" textfield with "eSIM-QR-Code vor Ort erhalten" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Install Esim Info" page is displayed

  @jira.QANOV-477117 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477116 @manual @mobile @smoke
  Scenario: A postpay user who wants to install an eSIM without SMS verification can access to the "About Scan QR" screen
    Given user has the "Install Esim Without SMS Verification" module configured in CMS for "Install Esim Without SMS Verification" page
      And user has the "About Scan QR" module configured in CMS for "About Scan QR" page
      And user is in the "Install Esim Without SMS Verification" page
     When clicks on the "have_already_qr_code_entrypoint" entrypoint
     Then the "About Scan QR" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "eSIM-QR-Code scannen" text is displayed
      And the "description1" textfield with "1. Stelle sicher, dass das Gerät auf dem du die eSIM installieren möchtest in deiner Nähe ist." text is displayed
      And the "description2" textfield with "2. Gehe in die Einstellungen > Mobilfunk > Mobilfunktarif / eSIM hinzufügen und folge den Anweisungen." text is displayed
      And the "description3" textfield with "Once the eSIM has been installed you will be able to access it from the mobile line dashbaord." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Sim Management" page is displayed

  @jira.QANOV-477118 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477117 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM without SMS verification can go back to the dashboard from the "About Scan QR" screen
    Given user has the "About Scan QR" module configured in CMS for "About Scan QR" page
      And user is in the "About Scan QR" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-477119 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477116 @manual @mobile @smoke
  Scenario: A postpay user who wants to install an eSIM without SMS verification can access to the "Store finder" screen
    The "store finder" flow will be defined in the support folder.
    Given user has "granted" "location" permissions
      And user has the "Install SIM Without SMS Verification" module configured in CMS for "Install SIM Without SMS Verification" page
      And user has the "Store finder" module configured in CMS for "Store Finder" page
      And user is in the "Install Esim Without SMS Verification" page
     When clicks on the "find_shop_entrypoint" entrypoint
     Then the internal webview is displayed
      And the "o2 Shop suchen: Alle Filialen in der Nähe | Blau" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Install Esim Without SMS Verification" page is displayed

  @jira.QANOV-477120 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477111
  @jira.link.depends_on.QANOV-477113 @manual @mobile @regression
  Scenario: A postpay user with a eSIM pending installation can decide to install the eSIM with SMS verification: a screen to request a SMS code is displayed
    NOTE: if there has been more than 3 hours from the login, the user will be requested to login again before accessing
    to the screen to request the SMS code.
    Given user has the "Install Esim Info" module configured in CMS for "Install Esim Info" page
      And user is in the "Install Esim Info" page
     When clicks on the "validate_with_sms_button" button
     Then the internal webview is displayed
      And the "Sicherheitsabfrage" string is displayed

  @jira.QANOV-477121 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477120 @manual @mobile @smoke
  Scenario: A postpay user who wants to install an eSIM with SMS verification can choose the device to install the eSIM
    Given user has the "Install Esim Info" module configured in CMS for "Install Esim Info" page
      And user has the "Install Esim Choose Device" module configured in CMS for "Install Esim Choose Device" page
      And user is in the "Install Esim Info" page
     When clicks on the "validate_with_sms_button" button
      And the internal webview is displayed
      And requests a SIM code
      And inserts the SIM code received
     Then the "Install Esim Choose Device" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "title" textfield with "Auf welchem Gerät möchtest du die neue eSIM verwenden?" text is displayed
      And the "choose_device.this_device_textfield" textfield with "Auf diesem Gerät" text is displayed
      And the "choose_device.this_device_radiobutton" button is displayed
      And the "choose_device.this_device_radiobutton" button is selected
      And the "choose_device.another_device_textfield" textfield with "Auf einem anderen Gerät" text is displayed
      And the "choose_device.another_device_radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Sim Management" page is displayed

  @jira.QANOV-477122 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477121 @manual @mobile @smoke
  Scenario: A postpay user who wants to install an eSIM with SMS verification chooses to install the eSIM in current device
    If user has a MSISDN (already activated products), the title "You are installing your esim profile on <MSISDN>".
    If user has no MSISDN (no activated products), the title "You are installing your esim profile".
    Given user has the "Install Esim Choose Device" module configured in CMS for "Install Esim Choose Device" page
      And user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user is in the "Install Esim Choose Device" page
     When clicks on the "continue_button" button
     Then the "Install Esim Current Device" page is displayed
      And the "Mein eSIM-Profil installieren" header is displayed
      And the "title" textfield with the "eSim-Profil für \d+ installieren" format is displayed
      And the "esim_meaning_title" textfield with "Was ist eine eSIM?" text is displayed
      And the "esim_meaning_description" textfield with "Eine eSIM ist eine digitale Version der SIM-Karte aus Plastik. Die eSIM wird auf deinem Gerät installiert. Danach kannst du dich ohne physische SIM mit dem O₂-Netz verbinden." text is displayed
      And the "things_to_remember_title" textfield with "Wissenswert" text is displayed
      And the "things_to_remember_description1" textfield with "eSIMs sind nicht auf andere Geräte übertragbar. Für ein neues Gerät brauchst du eine neue eSIM." text is displayed
      And the "things_to_remember_description2" textfield with "Bei uns ist die eSIM ist zum Zeitpunkt der Installation i.d.R. noch nicht aktiviert." text is displayed
      And the "things_to_remember_description3" textfield with "Kurz nach der Installation ändert sich der Status in der App auf "Bereit zur Aktivierung": Aktiviere in einem letzten Schritt deine neue eSIM hier in der App." text is displayed
      And the "install_button" button with "Jetzt installieren" text is displayed
      And the "navigation_top_bar.close_button" button is displayed

  @jira.QANOV-477123 @android @blaude @jira.cv.Future @jira.link.depends_on.QANOV-477122 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification starts the eSIM download in current android device
    If user clicks on "Install" button, a spinner will be shown and the copy will change for "Loading". This copy
    have to be displayed until the eSIM will be downloaded.
    Given user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user is in the "Install Esim Current Device" page
     When clicks on the "install_button" button
     Then the "install_button" button with "Loading" text is displayed

  @jira.QANOV-477124 @android @blaude @jira.cv.Future @jira.link.depends_on.QANOV-477123 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification can see that the eSIM is being installed in current android device
    As soon as the eSIM is downloaded, the copy changes for "Installing". This new copy will be displayed until the
    end of the process.
    Given user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user is in the "Install Esim Current Device" page
     When clicks on the "install_button" button
      And the eSIM download finishes
     Then the "install_button" button with "Installing" text is displayed

  @jira.QANOV-477125 @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477122 @manual @mobile @smoke
  Scenario: A postpay user who wants to install an eSIM with SMS verification starts the eSIM download in current iOS device
    A native iOS wizard is opened.
    Given user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user is in the "Install Esim Current Device" page
     When clicks on the "install_button" button
     Then the "Esim Installation" app is displayed

  @jira.QANOV-477126 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477124 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification can tap on "Close" button while installing an eSIM in current device
    NOTE: the installation process happens in the OS, not in the app. If the user leaves the flow while the installation
    is happening, it will finish in the background.
    Given user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user is in the "Install Esim Current Device" page
     When clicks on the "navigation_top_bar.close_button" button
     Then the "Install Esim Cancellation" popup is displayed
      And the "popup.title" textfield with "Möchtest du dein Vorgang wirklich beeden?" text is displayed
      And the "popup.message" textfield with "Fortschritt der eSIM-Installation geht bei Abbruch dieses Vorgangs verloren." text is displayed
      And the "popup.accept" button with the "(Nicht beenden|NICHT BEENDEN)" format is displayed
      And the "popup.cancel" button with the "(Beenden|BEENDEN)" format is displayed

  @jira.QANOV-477127 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477126 @jira.link.detects.O2DE-3855
  @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification decides to cancel the eSIM installation in current device after seeing the "Install Esim Cancellation" popup
    NOTE: the installation process happens in the OS, not in the app. If the user leaves the flow while the installation
    is happening, it will finish in the background.
    Given user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user is in the "Install Esim Current Device" page
     When clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Cancellation" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Account" page is displayed

  @jira.QANOV-477128 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477126 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification decides to continue with the eSIM installation in current device after seeing the "Install Esim Cancellation" popup
    Given user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user is in the "Install Esim Current Device" page
     When clicks on the "install_button" button
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Cancellation" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Install Esim Current Device" page is displayed

  @jira.QANOV-477129 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477122 @jira.link.detects.O2DE-3856
  @manual @mobile @smoke @ber
  Scenario: A postpay user who wants to install an eSIM with SMS verification can install the eSIM successfully in current device
    Given user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user has the "Install Esim Success Feedback" module configured in CMS for "Install Esim Success Feedback" page
      And user is in the "Install Esim Current Device" page
     When clicks on the "install_button" button
      And the eSIM installation finishes successfully
     Then the "Install Esim Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "Your esim profile has been successfully installed" text is displayed
      And the "success_message" textfield with "If you’ve replaced a plastic sim with an esim, your old plastic sim can now be discarded." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed

  @jira.QANOV-477130 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477122 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification tries to install the eSIM in current device but an error happens: installation finished unsuccessfully
    The installation might fail for one of the following reasons:
    - The MSISDN is not associated with an eSIM profile (it's a physical SIM).
    - The customer’s account is in fraud status.
    - MSISDN is suspended.
    - Activation must be completed by QR code.
    - eSIM profile has not been released for activation.
    Given user has the "Install Esim Current Device" module configured in CMS for "Install Esim Current Device" page
      And user has the "Install Esim Error Feedback" module configured in CMS for "Install Esim Error Feedback" page
      And user is in the "Install Esim Current Device" page
     When clicks on the "install_button" button
      And there is an error installing the eSIM
     Then the "Install Esim Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "Dein eSIM-Profil wurde nicht installiert" text is displayed
      And the "error_message" textfield with "Bitte versuche es später noch einmal." text is displayed
      And the "try_installation_again_button" button with "Installation wiederholen" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Choose Device" page is displayed

  @jira.QANOV-477131 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477129 @manual @mobile @regression
  Scenario: A postpay user who installed an eSIM successfully in current device can go back to the account dashboard
    Given user has the "Install Esim Success Feedback" module configured in CMS for "Install Esim Success Feedback" page
      And user is in the "Install Esim Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-477132 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477130 @manual @mobile @regression
  Scenario: A postpay user who installed an eSIM unsuccessfully in current device can try again
    Given user has the "Install Esim Error Feedback" module configured in CMS for "Install Esim Error Feedback" page
      And user is in the "Install Esim Error Feedback" page
     When clicks on the "try_installation_again_button" button
     Then the "Install Esim Current Device" page is displayed

  @jira.QANOV-477133 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477121 @manual @mobile @smoke
  Scenario: A postpay user who wants to install an eSIM with SMS verification chooses to install the eSIM in another device
    Given user has the "Install Esim Choose Device" module configured in CMS for "Install Esim Choose Device" page
      And user has the "Esim QR Code Required" module configured in CMS for "Esim QR Code Required" page
      And user is in the "Install Esim Choose Device" page
     When clicks on the "choose_device.another_device_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Esim QR Code Required" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "title" textfield with "Installation des eSIM-Profils" text is displayed
      And the "description" textfield with "Installiere deine eSIM durch Abscannen eines QR-Codes. Oder kopiere den Aktivierungscode manuell." text is displayed
      And the "scan_qr_code_entrypoint" entrypoint with "QR-Code anzeigen / Aktivierungscode kopieren" text is displayed
      And the "scan_qr_code_label" textfield with "Anzeige des QR-Codes für eSIM-Geräte mit Kamera. Alternativ kannst du den Aktivierungscode als Text auch kopieren." text is displayed
      And the "request_via_post_entrypoint" entrypoint with "QR-Code per Post anfordern" text is displayed
      And the "request_via_post_label" textfield with "Zustellung innerhalb von 3-5 Werktagen" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Install Esim Choose Device" page is displayed

  @jira.QANOV-477134 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477133 @manual @mobile @smoke
  Scenario: A postpay user who wants to install an eSIM with SMS verification chooses to scan the QR Code to install the eSIM in another device
    Given user has the "Esim QR Code Required" module configured in CMS for "Esim QR Code Required" page
      And user has the "Scan QR Code" module configured in CMS for "Scan QR Code" page
      And user is in the "Esim QR Code Required" page
     When clicks on the "scan_qr_code_entrypoint" entrypoint
     Then the "Scan QR Code" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "title" textfield with "eSIM-Profil installieren" text is displayed
      And the "scan_qr_info1" textfield with "Öffne die Kamera-App deines Smartphones und scanne den QR-Code." text is displayed
      And the "scan_qr_info2" textfield with "Alternativ gehe zu (Geräte-)Einstellungen > Mobilfunk/Netzwerk/Verbindungen > eSIM/Mobilfunktarif hinzufügen." text is displayed
      And the "qr_code" image is displayed
      And the "installation_without_qr_info" textfield with "Falls du den QR-Code nicht scannen kannst:" text is displayed
      And the "installation_without_qr_link" link with "Aktivierungscode für die Installation kopieren" text is displayed
      And the "scanned_qr_button" button with "Weiter zum nächsten Schritt" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Choose Device" page is displayed

  @jira.QANOV-477135 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477134 @manual @mobile @regression
  @ber
  Scenario: A postpay user who wants to install an eSIM with SMS verification can start the eSIM installation scanning the QR code with another device
    If the user scans the QR code, it opens the installation process in their other device.
    Given user has the "Scan QR Code" module configured in CMS for "Scan QR Code" page
      And user has the "Install Esim Started" module configured in CMS for "Install Esim Started" page
      And user is in the "Scan QR Code" page
     When clicks on the "scanned_qr_button" button
     Then the "Install Esim Started" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Zum Schluß: SIM-Aktivierung" text is displayed
      And the "description1" textfield with "Die eSIM ist zum Zeitpunkt der Installation i.d.R. noch nichht aktiviert." text is displayed
      And the "description2" textfield with "Kurz nach der Installation ändert sich der Status auf "Bereit zur Aktivierung": Aktiviere deine neue eSIM gleich hier in der App." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Choose Device" page is displayed

  @jira.QANOV-477136 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477135 @manual @mobile @regression
  Scenario: A postpay user who started the eSIM installation scanning the QR code with another device can go back to account dashboard
    If the user scans the QR code, it opens the installation process in their other device.
    Given user has the "Scan QR Code" module configured in CMS for "Scan QR Code" page
      And user has the "Install Esim Started" module configured in CMS for "Install Esim Started" page
      And user is in the "Scan QR Code" page
     When clicks on the "scanned_qr_button" button
      And the "Install Esim Started" page is displayed
      And clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.QANOV-477137 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477134 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification choose to install the eSIM in another device without scanning the QR code
    Given user has the "Esim QR Code Required" module configured in CMS for "Esim QR Code Required" page
      And user has the "Install Esim Choose OS" module configured in CMS for "Install Esim Choose OS" page
      And user is in the "Esim QR Code Required" page
     When clicks on the "scan_qr_code_entrypoint" entrypoint
      And the "Scan QR Code" page is displayed
     When clicks on the "installation_without_qr_link" link
     Then the "Install Esim Choose OS" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "title" textfield with "Auf welchem Gerät möchtest du die neue eSIM verwenden?" text is displayed
      And the "description" textfield with "Wähle das Betriebssystem deines Geräts." text is displayed
      And the "choose_os.apple_textfield" textfield with "Apple" text is displayed
      And the "choose_os.apple_radiobutton" button is displayed
      And the "choose_os.apple_radiobutton" button is selected
      And the "choose_os.others_textfield" textfield with "Andere" text is displayed
      And the "choose_os.others_radiobutton" button is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Choose Device" page is displayed

  @jira.QANOV-477138 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477137 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification chooses to install the eSIM in another iOS device without scanning the QR code
    Given user has the "Install Esim Choose OS" module configured in CMS for "Install Esim Choose OS" page
      And user has the "Install Esim Apple" module configured in CMS for "Install Esim Apple" page
      And user is in the "Install Esim Choose OS" page
     When clicks on the "choose_os.apple_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Install Esim Apple" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "title" textfield with "eSIM-Profil Installieren Apple" text is displayed
      And the "subtitle" textfield with "Um die Installation durchzuführen, benötigst du nun dein Apple-Gerät." text is displayed
      And the "description" textfield with "Wähle unter (Geräte-)Einstellungen > Mobilfunk > Weitere Optionen > QR-Code verwenden > Details manuell eingeben." text is displayed
      And the "sm_dp_address.title" textfield with "SM-DP+ Adresse:" text is displayed
      And the "sm_dp_address.value" textfield with "prod.smdp-plus.rsp.goog" text is displayed
      And the "sm_dp_address.copy_icon" icon is displayed
      And the "activation_code.title" textfield with "Aktivierungscode:" text is displayed
      And the "activation_code.value" textfield is displayed
      And the "activation_code.copy_icon" icon is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Choose Device" page is displayed

  @jira.QANOV-477139 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477138 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification starts the eSIM installation in another iOS device without scanning the QR code
    Given user has the "Install Esim Apple" module configured in CMS for "Install Esim Apple" page
      And user has the "Install Esim Started" module configured in CMS for "Install Esim Started" page
      And user is in the "Install Esim Apple" page
     When clicks on the "continue_button" button
     Then the "Install Esim Started" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Zum Schluß: SIM-Aktivierung" text is displayed
      And the "description1" textfield with "Die eSIM ist zum Zeitpunkt der Installation i.d.R. noch nichht aktiviert." text is displayed
      And the "description2" textfield with "Kurz nach der Installation ändert sich der Status auf "Bereit zur Aktivierung": Aktiviere deine neue eSIM gleich hier in der App." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Choose Device" page is displayed

  @jira.QANOV-477140 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477139 @manual @mobile @regression
  Scenario: A postpay user who started the eSIM installation in another iOS device without scanning the QR code can go back to account dashboard
    If the user scans the QR code, it opens the installation process in their other device.
    Given user has the "Install Esim Apple" module configured in CMS for "Install Esim Apple" page
      And user has the "Install Esim Started" module configured in CMS for "Install Esim Started" page
      And user is in the "Install Esim Apple" page
     When clicks on the "continue_button" button
      And the "Install Esim Started" page is displayed
      And clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.QANOV-477141 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477137 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification chooses to install the eSIM in another android device without scanning the QR code
    Given user has the "Install Esim Choose OS" module configured in CMS for "Install Esim Choose OS" page
      And user has the "Install Esim Others" module configured in CMS for "Install Esim Others" page
      And user is in the "Install Esim Choose OS" page
     When clicks on the "choose_os.others_radiobutton" button
      And clicks on the "continue_button" button
     Then the "Install Esim Others" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "title" textfield with "eSIM-Profil installieren" text is displayed
      And the "subtitle" textfield with "Um die Installation durchzuführen, benötigst du nun das Gerät." text is displayed
      And the "description" textfield with "Wähle unter (Geräte-)Einstellungen > Netzwerk/Verbindungen > eSIM hinzufügen/laden > QR-Code scannen und suche dann die Möglichkeit, den Code manuell hinzuzufügen." text is displayed
      And the "activation_code.title" textfield with "Aktivierungscode:" text is displayed
      And the "activation_code.value" textfield is displayed
      And the "activation_code.copy_icon" icon is displayed
      And the "continue_button" button with "Weiter" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Info" page is displayed

  @jira.QANOV-477142 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477141 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification starts the eSIM installation in another android device without scanning the QR code
    Given user has the "Install Esim Others" module configured in CMS for "Install Esim Others" page
      And user has the "Install Esim Started" module configured in CMS for "Install Esim Started" page
      And user is in the "Install Esim Others" page
     When clicks on the "continue_button" button
     Then the "Install Esim Started" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "info_icon" icon is displayed
      And the "title" textfield with "Zum Schluß: SIM-Aktivierung" text is displayed
      And the "description1" textfield with "Die eSIM ist zum Zeitpunkt der Installation i.d.R. noch nichht aktiviert." text is displayed
      And the "description2" textfield with "Kurz nach der Installation ändert sich der Status auf "Bereit zur Aktivierung": Aktiviere deine neue eSIM gleich hier in der App." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Install Esim Info" page is displayed

  @jira.QANOV-477143 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477142 @manual @mobile @regression
  Scenario: A postpay user who started the eSIM installation in another android device without scanning the QR code can go back to account dashboard
    If the user scans the QR code, it opens the installation process in their other device.
    Given user has the "Install Esim Others" module configured in CMS for "Install Esim Others" page
      And user has the "Install Esim Started" module configured in CMS for "Install Esim Started" page
      And user is in the "Install Esim Others" page
     When clicks on the "continue_button" button
      And the "Install Esim Started" page is displayed
      And clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed
      And the "Vertrag" header is displayed

  @jira.QANOV-477144 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477133 @manual @mobile @smoke
  Scenario: A postpay user who wants to install an eSIM with SMS verification chooses to request the QR Code via post to install the eSIM in another device
    Given user has the "Esim QR Code Required" module configured in CMS for "Esim QR Code Required" page
      And user has the "Scan QR Code" module configured in CMS for "Scan QR Code" page
      And user is in the "Esim QR Code Required" page
     When clicks on the "request_via_post_entrypoint" entrypoint
     Then the "QR Via Post" page is displayed
      And the "eSIM-Installation" header is displayed
      And the "title" textfield with "eSIM-QR-Code per Post" text is displayed
      And the "description" textfield with "Hier kannst du dir das eSIM-Profil zur Einrichtung deiner eSIM direkt per Post an deine hinterlegte Adresse zusenden." text is displayed
      And the "shipping_address_entrypoint" entrypoint with "Deine Lieferadresse" text is displayed
      And the "shipping_address_label" textfield is displayed
      And the "request_qr_button" button with "Brief anfordern" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Install Esim Choose Device" page is displayed

  @jira.QANOV-477145 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477144 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification can access to edit the shipping address from the "QR Via Post" screen
    The "add/edit shipping address" flow will be defined in the profile folder.
    Given user has the "QR Via Post" module configured in CMS for "QR Via Post" page
      And user is in the "QR Via Post" page
     When clicks on the "shipping_address_entrypoint" entrypoint
     Then the "Shipping Address" page is displayed
      And the "Kontakdaten ändern" header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "QR Via Post" page is displayed

  @jira.QANOV-477146 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477144 @manual @mobile @smoke @ber
  Scenario: A postpay user who wants to install an eSIM with SMS verification can request an eSIM QR via post successfully
    The "add/edit shipping address" flow will be defined in the profile folder.
    Given user has the "QR Via Post" module configured in CMS for "QR Via Post" page
      And user has the "Esim QR Request Success Feedback" module configured in CMS for "Esim QR Request Success Feedback" page
      And user is in the "QR Via Post" page
     When clicks on the "request_qr_button" button
     Then the "Esim QR Request Success Feedback" page is displayed
      And the "success_icon" icon is displayed
      And the "success_title" textfield with "eSIM-QR-Code angefordert" text is displayed
      And the "success_message" textfield with "Der eSIM-QR-Code wird dir innerhalb von 3-5 Werjtagen zugestellt" text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed

  @jira.QANOV-477147 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477146 @manual @mobile @regression
  Scenario: A postpay user who requested an eSIM QR via post successfully can tap on the "Back to dashboard" button in the Success Feedback screen
    Given user has the "Esim QR Request Success Feedback" module configured in CMS for "Esim QR Request Success Feedback" page
      And user is in the "Esim QR Request Success Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed

  @jira.QANOV-477148 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477144 @manual @mobile @regression
  Scenario: A postpay user who wants to install an eSIM with SMS verification requests an eSIM QR via post but an error happens: request finished unsuccessfully
    The "add/edit shipping address" flow will be defined in the profile folder.
    Given user has the "QR Via Post" module configured in CMS for "QR Via Post" page
      And user has the "Esim QR Request Error Feedback" module configured in CMS for "Esim QR Request Error Feedback" page
      And user is in the "QR Via Post" page
     When clicks on the "request_qr_button" button
      And there is an error requesting the eSIM QR
     Then the "Esim QR Request Error Feedback" page is displayed
      And the "error_icon" icon is displayed
      And the "error_title" textfield with "eSIM-QR-Code konnte nicht angefordert werden" text is displayed
      And the "error_message" textfield with "Bitte versuche es später erneut." text is displayed
      And the "back_to_dashboard_button" button with "Zurück zu Vertrag" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Account" page is displayed

  @jira.QANOV-477149 @android @blaude @ios @jira.cv.Future @jira.link.depends_on.QANOV-477148 @manual @mobile @regression
  Scenario: A postpay user who requested an eSIM QR unsuccessfully can tap on the "Back to dashboard" button in the Error Feedback screen
    Given user has the "Esim QR Request Error Feedback" module configured in CMS for "Esim QR Request Error Feedback" page
      And user is in the "Esim QR Request Error Feedback" page
     When clicks on the "back_to_dashboard_button" button
     Then the "Account" page is displayed
