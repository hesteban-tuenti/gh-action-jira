# -*- coding: utf-8 -*-
@jira.QANOV-374058
Feature: Hub Devices Summary


  @jira.QANOV-374059 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.hub_devices_summary_with_icon
  Scenario: A user can see a 'Digital Devices and Equipment Summary' module with a icon
    To be executed in QA
    Given the "Digital Devices and Equipment Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Digital Devices and Equipment Summary" module configured in CMS has the "cardIcon" filled
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "src" property of the "hub_devices_summary.icon" element matches "[CONTEXT:digital_devices_and_equipment_summary.cardIcon.url]" text

  @jira.QANOV-374060 @android @automatic @ios @jira.cv.14.4 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.hub_devices_summary_without_icon
  Scenario: A user can see a 'Digital Devices and Equipment Summary' module without a icon if not configured
    To be executed in QA
    Given the "Digital Devices and Equipment Summary" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page for current agreement
     Then the "hub_devices_summary.icon" icon is not displayed
