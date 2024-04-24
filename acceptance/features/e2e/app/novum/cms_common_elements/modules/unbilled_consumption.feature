# -*- coding: utf-8 -*-
@jira.QANOV-388872
Feature: Unbilled Consumption


  @jira.QANOV-388873 @android @ios @jira.cv.14.5 @automatic @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.unbilled_consumption
  Scenario: A moves prepay user can not see an Unbilled Consumption module configured
    To be executed in QA
    Given user has a "prepay" account type
      And the "Extra charges Double Panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page
     Then the "unbilled_consumption.cards" list is not displayed

  @jira.QANOV-388874 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @smoke @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.unbilled_consumption
  Scenario: A moves pospay user can see an Unbilled Consumption module configured by default
    To be executed in QA
    Given user has a "postpay" account type
      And the "Extra charges Double Panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page
      And waits until the "unbilled_consumption" element is visible
     Then the "unbilled_consumption.title" textfield is not displayed
      And the "unbilled_consumption.cards" list has "2" elements
      And the "0" index in the "unbilled_consumption.cards" list has not the "link" field
      And the "0" index in the "unbilled_consumption.cards" list has the "title" field with "Tu ciclo cierra en" text
      And the element in "0" position in the "unbilled_consumption.cards" list has the "value" field with the "\d{1,2} días|\d{1,2} horas" format
      And the "1" index in the "unbilled_consumption.cards" list has the "link" field
      And the "1" index in the "unbilled_consumption.cards" list has the "title" field with "Gasto extra actual" text
      And the element in "1" position in the "unbilled_consumption.cards" list has the "value" field with the "\d+.\d\d €" format

  @jira.QANOV-388875 @android @automatic @ios @jira.cv.14.5 @mobile @moves @qa @regression @webapp
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.unbilled_consumption_with_title
  Scenario: A moves pospay user can see an Unbilled Consumption module configured with title
    To be executed in QA, title only is available for moves
    Given user has a "postpay" account type
      And the "Extra charges Double Panel" module is configured in CMS for "Modular Page Configurable Modules By Product" page
     When user is in the "Modular Page Configurable Modules By Product" modular page
      And waits until the "unbilled_consumption" element is visible
     Then the "unbilled_consumption.title" textfield with "QA title" text is displayed
      And the "unbilled_consumption.cards" list has "2" elements
      And the "0" index in the "unbilled_consumption.cards" list has not the "link" field
      And the "0" index in the "unbilled_consumption.cards" list has the "title" field with "Tu ciclo cierra en" text
      And the element in "0" position in the "unbilled_consumption.cards" list has the "value" field with the "\d{1,2} días|\d{1,2} horas" format
      And the "1" index in the "unbilled_consumption.cards" list has the "link" field
      And the "1" index in the "unbilled_consumption.cards" list has the "title" field with "Gasto extra actual" text
      And the element in "1" position in the "unbilled_consumption.cards" list has the "value" field with the "\d+.\d\d €" format
