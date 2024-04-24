# -*- coding: utf-8 -*-
@jira.QANOV-359857
Feature: Multivivo Related Counters


  @jira.QANOV-359858 @android @automatic @ios @jira.cv.14.4 @mobile @qa @smoke @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.multivivo_related_counters
  Scenario: A user can see a Multivivo related counters module configured with the default fields
    To be executed in QA
    Given user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And the "Multivivo: Detail of shared and distributed data counters" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Multivivo: Detail of shared and distributed data counters" configured in CMS has only the mandatory fields filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the current agreement
     Then the "multivivo_related_counters.rows_title" textfield with "[CONTEXT:multivivo_detail_of_shared_and_distributed_data_counters.rowsTitle]" text is displayed
      And the "src" property of the "multivivo_related_counters.icon" element matches "[CONTEXT:multivivo_detail_of_shared_and_distributed_data_counters.icon.url]" text
