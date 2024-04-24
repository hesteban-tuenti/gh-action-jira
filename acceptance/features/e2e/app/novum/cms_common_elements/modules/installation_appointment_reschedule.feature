# -*- coding: utf-8 -*-
@jira.QANOV-391104
Feature: Installation Appointment Reschedule


  @jira.QANOV-391105 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.installation_appointment_reschedule
  Scenario: A user can see a Installation appointment reschedule module configured without title
    To be executed in QA
    Given user has ">0" pending installation appointment
      And the "Installation Appointment Reschedule" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     Then waits until the "installation_appointment_reschedule_module" element is visible
      And the "installation_appointment_reschedule_module.carousel" carousel is displayed
      And the "installation_appointment_reschedule_module.title" textfield is not visible in the actual screen

  @jira.QANOV-391106 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.installation_appointment_reschedule_with_module_title
  Scenario: A user can see a Installation appointment reschedule module configured with a module_title
    To be executed in QA
    Given user has ">0" pending installation appointment
      And the "Installation Appointment Reschedule" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Installation Appointment Reschedule" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page
     Then waits until the "installation_appointment_reschedule_module" element is visible
      And the "installation_appointment_reschedule_module.carousel" carousel is displayed
      And the "installation_appointment_reschedule_module.title" textfield with "[CONTEXT:installation_appointment_reschedule.moduleTitle]" text is displayed
