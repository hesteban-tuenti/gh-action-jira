# -*- coding: utf-8 -*-
@jira.QANOV-576658
Feature: Deeplinkable landing pages

  Actions After the Feature:
     Then restarts the navigation
      And navigates to "[CONF:landing_tab]" page


  @jira.QANOV-576659 @android @ios @jira.cv.24.2 @manual @mobile @o2de @regression @e2e
  Scenario: A postpay user can open the "O2 Community" deeplink
    The OB will be able to create their own deeplinks without Novum help. They will define a webview-id that will be
    used in deeplinks with the format [Novum-domain]/link/web?id=[webview-id]
    Navigation mode should be internal modal. Those webviews which require external navigation mode to work correctly
    will not be supported using this deeplink since we wouldn't be able to close the intermediate blank screen left.
    Example(dev): https://web.o2-de-dev.svc.dev.tuenti.io/link/web?id=prod-b2v-o2-priority
    Example (prod): https://app.o2online.de/link/web?od=prod-b2c-o2-community
    Given user has a "postpay" account type
      And user has a "mobile_line" product
     When opens the "OB.Community" deeplink with the app in "killed" status
     Then the internal webview with "Hilfe und Tipps für O2 Kunden - Produkttests - News | O2 Community" header is displayed

  @jira.QANOV-576660 @android @blaude @ios @jira.cv.24.2 @manual @mobile @regression @e2e
  Scenario: A BOX7 prepay user can open the "EVN" deeplink
    The OB will be able to create their own deeplinks without Novum help. They will define a webview-id that will be
    used in deeplinks with the format [Novum-domain]/link/web?id=[webview-id]
    Navigation mode should be internal modal. Those webviews which require external navigation mode to work correctly
    will not be supported using this deeplink since we wouldn't be able to close the intermediate blank screen left.
    Given user has a "prepay" account type
      And user has a "box7" account type
     When opens the "OB.Prepay EVN" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Ecare Prepaid" header is displayed

  @jira.QANOV-576661 @android @blaude @ios @jira.cv.24.2 @manual @mobile @regression @e2e
  Scenario: A RAITT prepay user can open the "EVN" deeplink
    The OB will be able to create their own deeplinks without Novum help. They will define a webview-id that will be
    used in deeplinks with the format [Novum-domain]/link/web?id=[webview-id]
    Navigation mode should be internal modal. Those webviews which require external navigation mode to work correctly
    will not be supported using this deeplink since we wouldn't be able to close the intermediate blank screen left.
    Given user has a "prepay" account type
      And user has a "raitt" account type
     When opens the "OB.Prepay EVN" deeplink with the app in "killed" status
     Then the internal webview is displayed
      And the "Blau" header is displayed
      And the user is asked to enter their password and does so successfully
      And the "Übersicht" header is displayed
