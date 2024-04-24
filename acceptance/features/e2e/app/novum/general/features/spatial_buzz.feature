@jira.QANOV-8769
Feature: Spatial Buzz


  @jira.QANOV-8770 @no_automatable @android @ios @jira.cv.11.10 @jira.link.relates_to.NOV-210111 @o2uk @sanity @mobile
  @har
  Scenario: A user who logs in the app will be asked to share the location
    For this test uses a clean installation of the app
    Given user is logged out
      And the app version is greater than "11.9"
     When logs in the application
     Then the "Share Location Permission" popup is displayed

  @jira.QANOV-8773 @no_automatable @android @ios @jira.cv.11.10 @jira.link.relates_to.NOV-210113 @o2uk @regression
  @automation.hard @mobile
  Scenario: A user who grants the location permission will have the Spatial Buzz SDK running in the background and the network information will be sent
    To validate the SDK is running the following traces can be found in the logs:
    - IOS (note that these are spatialbuzz library logs - not novum, and may change depending on the ios version and lib version):
    -- for first initialization:
    --- HDAuthenticate - Initialising
    --- PersistentData.doGetDictionaryFromPath: No file exists at path
    --- HDAuthenticateLib v5.0.80 HDMobile O2UK v5.8.35 iOS v13.4.1
    --- initialiseHDAuthenticateAPI - Got tokens from API
    --- initialiseHDAuthenticateAPI - Got config from API
    --- Finished writing test file
    -- for subsequent initializations:
    --- HDAuthenticate - Got tokens from PM
    --- HDAuthenticate - Got config from PM
    --- HDAuthenticate - Got testconfig from PM
    --- HDAuthenticateLib v5.0.80 HDMobile O2UK v5.8.35 iOS v13.4.1
    - Android:
    -- adb logcat|grep -i spatialbuzz
    For this test uses a clean installation of the app
    Given the app version is greater than "11.9"
     When logs in the application
      And the "Share Location Permission" popup is displayed
      And confirms the popup message
     Then "Spatial Buzz" SDK is running in the background
      And network measurements are sent

  @jira.QANOV-8774 @no_automatable @android @ios @jira.cv.11.10 @jira.link.relates_to.NOV-210114 @o2uk @regression
  @automation.hard @mobile
  Scenario: A user who denies the location permission will have the Spatial Buzz SDK running in the background
    For this test uses a clean installation of the app
    Given the app version is greater than "11.9"
     When logs in the application
      And the "Share Location Permission" popup is displayed
      And rejects the popup message
     Then the "permission_warning" warning with "You will not be able to share your location if you do not accept the permissions" text is displayed
      And "Spatial Buzz" SDK is running in the background
