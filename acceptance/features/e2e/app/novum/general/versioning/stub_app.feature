@jira.QANOV-26333 @not_hardening
Feature: Stub app


  @jira.QANOV-26348 @android @jira.cv.11.0 @manual @jira.link.relates_to.NOV-81190 @vivobr
  @regression @mobile
  Scenario: A user who has a low spec device with the "Webapp Stub" app pre-installed opens his/her device: the webapp stub version icon is displayed on the main screen
    internal_checkpoint="- Use the webapp stub app in devices from any manufacturer but Alcatel.
    - Use the no-webapp stub app in devices from Alcatel manufacturer. The manufacturers who use the no-webapp stub app are set
    at code level and can be checked in the following file https://fisheye.tuenti.io/browse/android-stub-version/app/build.gradle,
    looking for the values set in the NOT_AVAILABLE_MANUFACTORS buildConfigField.
    NOTE: Qsys will not have devices with the webapp stub pre-installed, thus the webapp will be installed from
    provided apks, and will only appear in the main screen if the corresponding direct access is created."
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
     When opens the device for the first time
     Then the "stub" app icon is displayed on the main screen of the device
      And the "stub" app icon is the same as the "Meu Vivo" icon

  @jira.QANOV-26349 @TBD @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26348
  @jira.link.relates_to.NOV-81217 @vivobr @regression @mobile
  Scenario: A user with a low spec device clicks on the webapp stub version icon and an error occurs: an error message is displayed
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
     When opens the "Webapp Stub" app
      And an error happens during the operation
     Then the "Stub Error" page is displayed
      And the "error_message" textfield with "TBD" text is displayed
      And the "error_retry" button with "TBD" text is displayed

  @jira.QANOV-26350 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26349
  @jira.link.relates_to.NOV-81219 @vivobr @regression @mobile
  Scenario: A user who was in the error screen of the webapp stub version clicks on the "retry" option: the webapp stub version tries to load the content again
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
     When opens the "Webapp Stub" app
      And an error happens during the operation
      And the "Stub Error" page is displayed
      And clicks on the "error_retry" button
     Then the "Stub Select Option" page is displayed
      And the "download_app" button with "Baixar o app" is displayed
      And the "go_to_web" button with "Ira para o site" is displayed

  @jira.QANOV-26351 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26348
  @jira.link.relates_to.NOV-81192 @vivobr @regression @mobile
  Scenario: A user with a low spec device clicks on the webapp stub version icon: the options to go to Vivo’s website or to download the app is displayed
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
     When opens the "Webapp Stub" app
     Then the "Stub Select Option" page is displayed
      And the "download_app" button with "Baixar o app" is displayed
      And the "go_to_web" button with "Ira para o site" is displayed

  @jira.QANOV-26352 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26351
  @jira.link.relates_to.NOV-81194 @vivobr @regression @mobile
  Scenario: A user selects the "Baixar o app" option in the webapp stub version: the user is redirected to the "Meu Vivo Movel" app page in Google Play
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
      And user is in the "Stub Select Option" page
     When clicks on the "download_app" button
     Then the "Google Play" app is displayed
      And the "Meu Vivo Móvel App" page is displayed

  @jira.QANOV-26353 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26352
  @jira.link.relates_to.NOV-81211 @vivobr @sanity @mobile
  Scenario: A user who selected download the "Meu Vivo Movel" app in the webapp stub version (but didn't install it) clicks on the webapp stub version icon again: the options to go to Vivo’s website or to download the app is displayed again
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
      And user is in the "Stub Select Option" page
     When clicks on the "download_app" button
      And the "Google Play" app is displayed
      And opens the "Webapp Stub" app
     Then the "Stub Select Option" page is displayed
      And the "download_app" button with "Baixar o app" is displayed
      And the "go_to_web" button with "Ira para o site" is displayed

  @jira.QANOV-26354 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26352
  @jira.link.relates_to.NOV-81197 @vivobr @sanity @mobile
  Scenario: A user with a low spec device downloads the "Meu Vivo Movel" app: the webapp stub app is replaced by the "Meu Vivo Móvel" app
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
      And user is in the "Stub Select Option" page
     When clicks on the "download_app" button
      And the "Google Play" app is displayed
      And installs the app from the "Google Play"
     Then the "Webapp Stub" app is replaced by the "Meu Vivo Móvel" app
      And the "Webapp Stub" app is removed from the device

  @jira.QANOV-26355 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26354
  @jira.link.relates_to.NOV-81213 @vivobr @sanity @mobile
  Scenario: A user who selected to download the "Meu Vivo Movel" app in the webapp stub version (and installed it) clicks on the webapp stub version icon again: the user is redirected to the "Meu Vivo Movel" app
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
      And user is in the "Stub Select Option" page
     When clicks on the "download_app" button
      And the "Google Play" app is displayed
      And installs the app from the "Google Play"
      And opens the "Webapp Stub" app
     Then the "Meu Vivo Móvel" app is displayed

  @jira.QANOV-26356 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26351
  @jira.link.relates_to.NOV-81196 @vivobr @regression @mobile
  Scenario: A user selects the "Ira para o site" option in the webapp stub version: the user is redirected to the login screen of the mobile website
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
      And user is in the "Stub Select Option" page
     When clicks on the "go_to_web" button
     Then the "Meu Vivo" website is displayed
      And the "Meu Vivo Web Login" page is displayed

  @jira.QANOV-26357 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26356
  @jira.link.relates_to.NOV-81210 @vivobr @sanity @mobile
  Scenario: A user who selected to go to Vivo mobile website in the webapp stub version clicks on the webapp stub version icon again: the options to go to Vivo’s website or to download the app is displayed again
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "Webapp Stub" app pre-installed
      And user is in the "Stub Select Option" page
     When clicks on the "go_to_site" button
      And the "Meu Vivo" website is displayed
      And opens the "Webapp Stub" app
     Then the "Stub Select Option" page is displayed
      And the "download_app" button with "Baixar o app" is displayed
      And the "go_to_web" button with "Ira para o site" is displayed

  @jira.QANOV-26358 @android @jira.cv.11.0 @manual @jira.link.relates_to.NOV-104445 @vivobr
  @regression @mobile
  Scenario: A user who has a low spec device with the "No-webapp stub" app pre-installed opens his/her device: the no-webapp stub version icon is displayed on the main screen
    internal_checkpoint="- Use the webapp stub app in devices from any manufacturer but Alcatel.
    - Use the no-webapp stub app in devices from Alcatel manufacturer. The manufacturers who use the no-webapp stub app are set
    at code level and can be checked in the following file https://fisheye.tuenti.io/browse/android-stub-version/app/build.gradle,
    looking for the values set in the NOT_AVAILABLE_MANUFACTORS buildConfigField.
    NOTE: Qsys will not have devices with the webapp stub pre-installed, thus the webapp will be installed from
    provided apks, and will only appear in the main screen if the corresponding direct access is created."
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "No-webapp Stub" app pre-installed
     When opens the device for the first time
     Then the "stub" app icon is displayed on the main screen of the device
      And the "stub" app icon is the same as the "Meu Vivo" icon

  @jira.QANOV-26359 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26358
  @jira.link.relates_to.NOV-104446 @vivobr @regression @mobile
  Scenario: A user with a low spec device clicks on the no-webapp stub version icon: the user is redirected to the "Meu Vivo Movel" app page in Google Play
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "No-webapp Stub" app pre-installed
     When opens the "No-webapp Stub" app
     Then the "Google Play" app is displayed
      And the "Meu Vivo Móvel App" page is displayed
      And the "update" button with "Update" text is displayed

  @jira.QANOV-26360 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26359
  @jira.link.relates_to.NOV-104450 @vivobr @regression @mobile
  Scenario: A user with a low spec device updates the "Meu Vivo Movel" app: the no-webapp stub app is replaced by the "Meu Vivo Móvel" app
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "No-webapp Stub" app pre-installed
     When opens the "No-webapp Stub" app
      And the "Google Play" app is displayed
      And clicks on the "update" button
     Then the "No-webapp Stub" app is replaced by the "Meu Vivo Móvel" app
      And the "No-webapp Stub" app is removed from the device

  @jira.QANOV-26361 @android @jira.cv.11.0 @manual @jira.link.depends_on.QANOV-26360
  @jira.link.relates_to.NOV-104453 @vivobr @regression @mobile
  Scenario: A user who updated the "Meu Vivo Movel" app clicks on the no-webapp stub version icon again: the user is redirected to the "Meu Vivo Móvel" app
    Given user has bought a low spec device from a Vivo provider
      And user has not installed the "Meu Vivo Móvel" app
      And the device has a "No-webapp Stub" app pre-installed
     When goes to the No-webapp Stub app
      And clicks on the "stub" app icon
      And the "Google Play" app is displayed
      And clicks on the "update" button
      And opens the "No-webapp Stub" app
     Then the "Meu Vivo Móvel" app is displayed
