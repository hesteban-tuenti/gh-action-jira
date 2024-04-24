# -*- coding: utf-8 -*-
@jira.QANOV-7050
Feature: Hard-Soft Update


  @jira.<jira_id> @<execution_mode> @<product> @android @dev @ios @jira.cv.<cv> @jira.link.relates_to.NOV-35320 @mobile
  @sanity @har
  Scenario Outline: A <product> user is suggested to update the app to a newer version after login
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Note that if security is enabled, the pin screen will appear before the upgrade screen.
    Note that the permissions pop-up may appear over the soft update screen, according to APPS-4119 and APPS-4120, it
    won't be solved.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP to be able to connect to venvs.
    Given user is logged out
      And Soft Update is enabled
     When logs in the application
     Then the "Soft Update" page is displayed
      And the "update_icon" icon is displayed
      And the "title" textfield with "[LANG:launch_app.soft_update.title]" text is displayed
      And the "subtitle" textfield with "[LANG:launch_app.soft_update.subtitle]" text is displayed
      And the "navigation_top_bar.close_button" button is displayed
      And the "update_button" button with "[LANG:launch_app.soft_update.button]" text is displayed
      And the "not_now_link" link with "[LANG:launch_app.soft_update.link]" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And accepts post login permissions

    Examples:
          | product | cv     | execution_mode | jira_id      |
          | moves   | 10.1   | automatic      | QANOV-7715   |
          | vivobr  | 10.1   | automatic      | QANOV-7716   |
          | o2uk    | 10.1   | automatic      | QANOV-7717   |
          | blaude  | 13.9   | manual         | QANOV-254481 |
          | o2de    | 14.2   | manual         | QANOV-254482 |
          | o2es    | Future | manual         | QANOV-416976 |

  @jira.<jira_id> @<client> @<product> @automation.pending_env @jira.cv.<cv>
  @jira.link.parent_test_plan.<parent_test_plan> @jira.link.relates_to.NOV-35320 @manual @mobile @regression
  Scenario Outline: A user reaches the app store from the "Soft Update" page
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Note that if security is enabled, the pin screen will appear before the upgrade screen.
    Note that the permissions pop-up may appear over the soft update screen, according to APPS-4119 and APPS-4120, it
    won't be solved.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP to be able to connect to venvs.
    Given user is logged out
      And Soft Update is enabled
      And logs in the application
      And the "Soft Update" page is displayed
     When clicks on the "update_button" button
     Then the "<store>" app is displayed
      And the "<app_name>" page is displayed in the "<store>" store

    Examples:
          | client  | product | cv     | app_name    | store      | parent_test_plan | jira_id      |
          | android | moves   | 10.1   | Mi Movistar | Play Store |                  | QANOV-7718   |
          | ios     | moves   | 10.1   | Mi Movistar | App Store  |                  | QANOV-7719   |
          | android | vivobr  | 10.1   | Vivo        | Play Store | QANOV-181726     | QANOV-7720   |
          | ios     | vivobr  | 10.1   | Vivo        | App Store  | QANOV-181726     | QANOV-7723   |
          | android | o2uk    | 10.1   | My O2       | Play Store |                  | QANOV-7725   |
          | ios     | o2uk    | 10.1   | My O2       | App Store  |                  | QANOV-7730   |
          | android | blaude  | 13.9   | Mein Blau   | Play Store |                  | QANOV-254483 |
          | ios     | blaude  | 13.9   | Mein Blau   | App Store  |                  | QANOV-254484 |
          | android | o2de    | 14.2   | Mein O2     | Play Store |                  | QANOV-254485 |
          | ios     | o2de    | 14.2   | Mein O2     | App Store  |                  | QANOV-254486 |
          | android | o2es    | Future | Mi O2       | Play Store |                  | QANOV-416977 |
          | ios     | o2es    | Future | Mi O2       | App Store  |                  | QANOV-416978 |

  @jira.<jira_id> @<product> @android @automation.pending_env @dev @jira.cv.<cv> @jira.link.relates_to.NOV-35331 @manual
  @mobile @regression
  Scenario Outline: A user is suggested to update the app to a newer version and declines it using the native back button on Android devices
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP to be able to connect to venvs.
    Given user is logged out
      And Soft Update is enabled
     When logs in the application
      And the "Soft Update" page is displayed
      And clicks on the native "back" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7750   |
          | moves   | 10.1   | QANOV-7737   |
          | vivobr  | 10.1   | QANOV-7743   |
          | blaude  | 13.9   | QANOV-254489 |
          | o2de    | 14.2   | QANOV-254490 |
          | o2es    | Future | QANOV-416979 |

  @jira.<jira_id> @<product> @automation.pending_env @dev @ios @jira.cv.<cv> @jira.link.relates_to.NOV-35331 @manual
  @mobile @regression @har
  Scenario Outline: A user is suggested to update the app to a newer version and declines it using the close button
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP to be able to connect to venvs.
    Given user is logged out
      And Soft Update is enabled
     When logs in the application
      And the "Soft Update" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7768   |
          | moves   | 10.1   | QANOV-7756   |
          | vivobr  | 10.1   | QANOV-7763   |
          | blaude  | 13.9   | QANOV-254493 |
          | o2de    | 14.2   | QANOV-254495 |
          | o2es    | Future | QANOV-416980 |

  @jira.<jira_id> @<product> @android @automation.pending_env @dev @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A user is suggested to update the app to a newer version and declines it using the not now button
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP to be able to connect to venvs.
    Given user is logged out
      And Soft Update is enabled
     When logs in the application
      And the "Soft Update" page is displayed
      And clicks on the "not_now_link" link
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7783   |
          | moves   | 10.1   | QANOV-7774   |
          | vivobr  | 10.1   | QANOV-7779   |
          | blaude  | 13.9   | QANOV-254498 |
          | o2de    | 14.2   | QANOV-254499 |
          | o2es    | Future | QANOV-416981 |

  @jira.<jira_id> @<product> @android @automation.pending_env @jira.cv.<cv> @jira.link.relates_to.NOV-37079 @manual
  @mobile @regression
  Scenario Outline: A logged in user is not suggested to update the app to a newer version less than 24h after the last time he was warned on android devices (without having closed the app)
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP to be able to connect to venvs.
    Given user is logged in
      And Soft Update is enabled
     When launches the app
      And logs in the application
      And the "Soft Update" page is displayed
      And clicks on the native "back" button
      And the landing tab page is displayed
      And runs the app in the background for "86399" seconds
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7790   |
          | moves   | 10.1   | QANOV-7786   |
          | vivobr  | 10.1   | QANOV-7789   |
          | blaude  | 13.9   | QANOV-254500 |
          | o2de    | 14.2   | QANOV-254501 |
          | o2es    | Future | QANOV-416982 |

  @jira.<jira_id> @<product> @automation.pending_env @ios @jira.cv.<cv> @jira.link.relates_to.NOV-37079 @manual @mobile
  @regression
  Scenario Outline: A logged in user is not suggested to update the app to a newer version less than 24h after the last time he was warned on iOS devices (without having closed the app)
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP to be able to connect to venvs.
    Given user is logged in
      And Soft Update is enabled
     When launches the app
      And logs in the application
      And the "Soft Update" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the landing tab page is displayed
      And runs the app in the background for "86399" seconds
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7793   |
          | moves   | 10.1   | QANOV-7791   |
          | vivobr  | 10.1   | QANOV-7792   |
          | blaude  | 13.9   | QANOV-254502 |
          | o2de    | 14.2   | QANOV-254504 |
          | o2es    | Future | QANOV-416983 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @manual @mobile @regression
  Scenario Outline: A logged in user is not suggested to update the app to a newer version less than 24h after the last time he was warned (having closed the app)
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP to be able to connect to venvs.
    Given user is logged in
      And Soft Update is enabled
     When launches the app
      And logs in the application
      And the "Soft Update" page is displayed
      And clicks on the "not_now_link" link
      And the landing tab page is displayed
      And terminates the app
      And waits "86399" seconds
      And launches the app
     Then the landing tab page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7799   |
          | moves   | 10.1   | QANOV-7794   |
          | vivobr  | 10.1   | QANOV-7795   |
          | blaude  | 13.9   | QANOV-254507 |
          | o2de    | 14.2   | QANOV-254508 |
          | o2es    | Future | QANOV-416985 |

  @jira.<jira_id> @<product> @android @automation.pending_env @jira.cv.<cv> @jira.link.relates_to.NOV-37078 @manual
  @mobile @regression
  Scenario Outline: A logged in user is suggested to update the app to a newer version after 24h of the last offering on android devices (with native back button)
    This can be tested without waiting 24h, only changing the date in the device.
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    - Because we tested in an unstable environment, the PIN view may appear before the upgrade on Android devices.
    - (Explanation: https://jira.tuenti.io/jira/browse/OUT-1085?focusedCommentId=532542&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-532542)
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP.
    Given user is logged in
      And Soft Update is enabled
     When launches the app
      And logs in the application
      And the "Soft Update" page is displayed
      And clicks on the native "back" button
      And the landing tab page is displayed
      And terminates the app
      And waits "86401" seconds
      And launches the app
     Then the "Soft Update" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7816   |
          | moves   | 10.1   | QANOV-7802   |
          | vivobr  | 10.1   | QANOV-7809   |
          | blaude  | 13.9   | QANOV-254511 |
          | o2de    | 14.2   | QANOV-254512 |
          | o2es    | Future | QANOV-416986 |

  @jira.<jira_id> @<product> @automation.pending_env @ios @jira.cv.<cv> @jira.link.relates_to.NOV-37078 @manual @mobile
  @regression
  Scenario Outline: A logged in user is suggested to update the app to a newer version after 24h of the last offering on iOS devices (with close button)
    This can be tested without waiting 24h, only changing the date in the device.
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    - Because we tested in an unstable environment, the PIN view may appear before the upgrade on Android devices.
    - (Explanation: https://jira.tuenti.io/jira/browse/OUT-1085?focusedCommentId=532542&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-532542)
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP.
    Given user is logged in
      And Soft Update is enabled
     When launches the app
      And logs in the application
      And the "Soft Update" page is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the landing tab page is displayed
      And terminates the app
      And waits "86401" seconds
      And launches the app
     Then the "Soft Update" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7834   |
          | moves   | 10.1   | QANOV-7821   |
          | vivobr  | 10.1   | QANOV-7828   |
          | blaude  | 13.9   | QANOV-254513 |
          | o2de    | 14.2   | QANOV-254514 |
          | o2es    | Future | QANOV-416987 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @jira.link.relates_to.NOV-37078 @manual
  @mobile @regression
  Scenario Outline: A logged in user is suggested to update the app to a newer version after 24h of the last offering (with "not now" link)
    This can be tested without waiting 24h, only changing the date in the device.
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    - Because we tested in an unstable environment, the PIN view may appear before the upgrade on Android devices.
    - (Explanation: https://jira.tuenti.io/jira/browse/OUT-1085?focusedCommentId=532542&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#comment-532542)
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP.
    Given user is logged in
      And Soft Update is enabled
     When launches the app
      And logs in the application
      And the "Soft Update" page is displayed
      And clicks on the "not_now_link" link
      And the landing tab page is displayed
      And terminates the app
      And waits "86401" seconds
      And launches the app
     Then the "Soft Update" page is displayed

    Examples:
          | product | cv     | jira_id      |
          | o2uk    | 10.1   | QANOV-7838   |
          | moves   | 10.1   | QANOV-7835   |
          | vivobr  | 10.1   | QANOV-7836   |
          | blaude  | 13.9   | QANOV-254515 |
          | o2de    | 14.2   | QANOV-254516 |
          | o2es    | Future | QANOV-416988 |

  @jira.<jira_id> @<product> @android @automation.pending_env @ios @jira.cv.<cv> @jira.link.detects.<detects>
  @jira.link.relates_to.NOV-35330 @jira.link.relates_to.NOV-37077 @manual @mobile @regression @har
  Scenario Outline: A user is forced to update the app to a newer version
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP.
    Given user is logged out
      And Hard Update is enabled
     When launches the app
      And logs in the application
     Then the "Hard Update" page is displayed
      And the "force_update_<product>" icon is displayed
      And the "force_update_title" textfield with "[LANG:launch_app.soft_update.title]" text is displayed
      And the "force_update_subtitle" textfield with "[LANG:launch_app.soft_update.subtitle]" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And the "navigation_top_bar.back_button" button is not displayed
      And the "update_button" button with "[LANG:launch_app.soft_update.button]" text is displayed
      And the "not_now_link" link is not displayed

    Examples:
          | product | cv     | detects    | jira_id      |
          | moves   | 10.1   |            | QANOV-7847   |
          | vivobr  | 10.1   |            | QANOV-7850   |
          | o2uk    | 10.1   |            | QANOV-7851   |
          | blaude  | 13.9   | OBO2DE-211 | QANOV-254517 |
          | o2de    | 14.2   |            | QANOV-254518 |
          | o2es    | Future |            | QANOV-416989 |

  @jira.<jira_id> @<client> @<product> @automation.pending_env @jira.cv.<cv> @jira.link.parent_test_plan.QANOV-181726
  @jira.link.relates_to.NOV-35330 @manual @mobile @regression
  Scenario Outline: A user reaches the app store from the "Hard Update" page
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP.
    Given user is logged out
      And Hard Update is enabled
      And launches the app
      And logs in the application
      And the "Hard Update" page is displayed
     When clicks on the "update_button" button
     Then the "<app_name>" page is displayed in the "<store>" store

    Examples:
          | client  | product | cv     | app_name    | store      | jira_id      |
          | android | moves   | 10.1   | Mi Movistar | Play Store | QANOV-7852   |
          | ios     | moves   | 10.1   | Mi Movistar | App Store  | QANOV-7853   |
          | android | vivobr  | 10.1   | Vivo        | Play Store | QANOV-7854   |
          | ios     | vivobr  | 10.1   | Vivo        | App Store  | QANOV-7855   |
          | android | o2uk    | 10.1   | My O2       | Play Store | QANOV-7856   |
          | ios     | o2uk    | 10.1   | My O2       | App Store  | QANOV-7857   |
          | android | blaude  | 13.9   | Mein Blau   | Play Store | QANOV-254519 |
          | ios     | blaude  | 13.9   | Mein Blau   | App Store  | QANOV-254520 |
          | android | o2de    | 14.2   | Mein O2     | Play Store | QANOV-254521 |
          | ios     | o2de    | 14.2   | Mein O2     | App Store  | QANOV-254522 |
          | android | o2es    | Future | Mi O2       | Play Store | QANOV-416990 |
          | ios     | o2es    | Future | Mi O2       | App Store  | QANOV-416991 |

  @jira.<jira_id> @<product> @android @automation.pending_env @jira.cv.<cv> @jira.link.relates_to.NOV-37076 @manual
  @mobile @smoke @har
  Scenario Outline: A user forced to update the app to a newer version cannot dismiss update screen tapping on the native back button
    Note that the objective of the test is checking that the feature works for the app in test at the moment, so this
    test is performed with the current (latest) app. The configuration in appUpdateConfig.yaml file must be set to a
    version higher than the current.
    Can be tested in dev environment using qa virtual env: https://telefonicacorp.sharepoint.com/:w:/r/sites/ColaboraTID/qacdo/_layouts/15/Doc.aspx?sourcedoc=%7BEE4EFEEF-9863-4E00-B0D1-CEEDC38431B2%7D&file=HOW%20TO%20Novum%20Virtual%20Environments.docx&action=default&mobileredirect=true
    Note that at 26/01/2021 API HIGHWAY is not supported for venvs on android, so the android app needs 'Api Channel'
    setting configured to HTTP.
    Given user is logged out
      And Hard Update is enabled
     When launches the app
      And logs in the application
      And the "Hard Update" page is displayed
      And clicks on the native "back" button
     Then the app is running in background

    Examples:
          | product | cv     | jira_id      |
          | moves   | 10.1   | QANOV-7858   |
          | vivobr  | 10.1   | QANOV-7859   |
          | o2uk    | 10.1   | QANOV-7861   |
          | blaude  | 13.9   | QANOV-254523 |
          | o2de    | 14.2   | QANOV-254524 |
          | o2es    | Future | QANOV-416992 |
