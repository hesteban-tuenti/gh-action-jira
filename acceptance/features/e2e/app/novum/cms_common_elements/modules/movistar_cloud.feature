# -*- coding: utf-8 -*-
@jira.QANOV-403945
Feature: Movistar Cloud


  @jira.QANOV-403946 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.movistar_cloud
  Scenario: A user can see a Movistar Cloud module configured with the default fields
    To be executed in QA
    Given the "Movistar Cloud" module is configured in CMS for "Modular Page Configurable Modules" page
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "movistar_cloud" element is visible
     Then the "movistar_cloud.card.title" textfield is displayed
      And the "movistar_cloud.module_title" textfield is not displayed
      And the "movistar_cloud.module_icon" textfield is not displayed

  @jira.QANOV-403947 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.movistar_cloud_with_module_title
  Scenario: A user can see Movistar Cloud module configured with a module title
    To be executed in QA
    Given the "Movistar Cloud" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Movistar Cloud" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "movistar_cloud" element is visible
     Then the "movistar_cloud.module_title" textfield with "[CONTEXT:movistar_cloud.moduleTitle]" text is displayed

  @jira.QANOV-403948 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.movistar_cloud_with_link
  Scenario: A user can see Movistar Cloud module configured with a link
    To be executed in QA
    Given the "Movistar Cloud" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Movistar Cloud" module configured in CMS has the "textToShare" filled
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "movistar_cloud" element is visible
     Then the "movistar_cloud.card.link" textfield is displayed
      And clicks on the "movistar_cloud.card.link" link
      And the "[CONTEXT:movistar_cloud.textToShare]" string is displayed
      And terminates the app

  @jira.QANOV-403949 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.movistar_cloud_with_icon
  Scenario: A user can see Movistar Cloud module configured with an icon
    To be executed in QA
    Given the "Movistar Cloud" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Movistar Cloud" module configured in CMS has the "icon" filled
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "movistar_cloud" element is visible
     Then the "src" property of the "movistar_cloud.module_icon" element matches "[CONTEXT:movistar_cloud.icon.url]" text

  @jira.QANOV-403950 @automatic @jira.cv.14.5 @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.movistar_cloud_with_all
  Scenario: A user can see Movistar Cloud module configured with all the optional fields
    To be executed in QA
    Given the "Movistar Cloud" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Movistar Cloud" module configured in CMS has the "icon" filled
      And the "Movistar Cloud" module configured in CMS has the "moduleTitle" filled
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "movistar_cloud" element is visible
     Then the "movistar_cloud.module_title" textfield is displayed
      And the "movistar_cloud.module_icon" textfield is displayed

  @jira.QANOV-403951 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression
  @fixture.cms.page.configurable_modules
  @fixture.cms.module.movistar_cloud_with_all
  Scenario: A user can see Movistar Cloud module configured with all the optional fields
    To be executed in QA
    Given the "Movistar Cloud" module is configured in CMS for "Modular Page Configurable Modules" page
      And the "Movistar Cloud" module configured in CMS has the "icon" filled
      And the "Movistar Cloud" module configured in CMS has the "moduleTitle" filled
      And the "Movistar Cloud" module configured in CMS has the "textToShare" filled
      And user is in the "Modular Page Configurable Modules" modular page
     When waits until the "movistar_cloud" element is visible
     Then the "movistar_cloud.module_title" textfield is displayed
      And the "movistar_cloud.module_icon" textfield is displayed
      And the "movistar_cloud.link" textfield is displayed
