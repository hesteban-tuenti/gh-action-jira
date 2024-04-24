# -*- coding: utf-8 -*-
@jira.QANOV-392158
Feature: Counters Carousel


  @jira.QANOV-392159 @android @automatic @ios @jira.cv.14.4 @mobile @qa @smoke @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counters_carousel
  Scenario: A user can see a Counters Carousel module configured with the default fields
    To be executed in QA
    Given the "Consumption counters for a single subscription" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
     Then the "counters_carousel_subtitle_type" textfield is not visible in the actual screen

  @jira.QANOV-392160 @android @automatic @ios @jira.cv.14.4 @mobile @qa @regression @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counters_carousel_with_subtitle_type_no_subtitle
  Scenario: A user can't see an Counters Carousel module with a no_subtitle subtitle type configured
    To be executed in QA
    Given the "Consumption counters for a single subscription" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption counters for a single subscription" module configured in CMS has the "subtitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
     Then the "counters_carousel_subtitle_type" textfield is not visible in the actual screen

  @jira.<jira_id> @android @ios @jira.cv.14.4 @manual @mobile @qa @regression @vivobr @webapp @old_app
  @fixture.cms.page.configurable_modules_by_product
  @fixture.cms.module.counters_carousel_with_subtitle_type_<subtitleType>
  Scenario Outline: A user can see an Counters Carousel module with a <subtitleType> subtitle type configured
    To be executed in QA
    Some subtitles may not appear because some users don't have a certain subtitle type
    Given the "Consumption counters for a single subscription" module is configured in CMS for "Modular Page Configurable Modules By Product" page
      And the "Consumption counters for a single subscription" module configured in CMS has the "subtitle" filled
      And user is in the "Modular Page Configurable Modules By Product" modular page for the "mobile" product
     Then the "counters_carousel_subtitle_type" textfield is displayed

    Examples:
          | subtitleType              | jira_id      |
          | renewal_date              | QANOV-392161 |
          | expiration_date           | QANOV-392162 |
          | renewal_or_expiration_API | QANOV-392163 |
