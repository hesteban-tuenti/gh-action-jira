# -*- coding: utf-8 -*-
@jira.QANOV-373580
Feature: Smart Wifi Routers Devices module


  @jira.QANOV-373581 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.smart_wifi_routers_devices_with_icon
  Scenario: A user can see a 'Smart Wifi routers & connected devices' module with a icon
    To be executed in QA
    Given the "Smart Wifi routers & connected devices" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Smart Wifi routers & connected devices" module configured in CMS has the "mainIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "smart_wifi_routers_devices" element is visible
     Then the "src" property of the "smart_wifi_routers_devices.icon" element matches "[CONTEXT:smart_wifi_routers_&_connected_devices.mainIcon.url]" text

  @jira.QANOV-373582 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.smart_wifi_routers_devices_without_icon
  Scenario: A user can see a 'Smart Wifi routers & connected devices' module without a icon if not configured
    To be executed in QA
    Given the "Smart Wifi routers & connected devices" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
      And waits until the "smart_wifi_routers_devices" element is visible
     Then the "smart_wifi_routers_devices.icon" icon is not displayed
