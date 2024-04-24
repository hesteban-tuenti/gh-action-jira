@jira.QANOV-8623
Feature: Landline minutes allowances

  Actions Before the Feature:
    Given user has a "any_admin" role
      And user has a "landline" product


  @jira.QANOV-8624 @android @ber @ios @mobile @jira.cv.10.4 @automatic @jira.link.relates_to.NOV-53304
  @moves @sanity @live @next @cert2 @qa @webapp
  Scenario: The limited consumption will be represented in grey color when consumption status is = 0%
    Given the "minutes" allowance is limited in the "landline" product
      And user has consumed "0%" of the "minutes" allowance in the "landline" product
      And user has the "counters-carousel" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     Then the "minutes_roundel_color" allowance roundel is displayed in "gray" color

  @jira.QANOV-8626 @android @ios @mobile @jira.cv.10.4 @manual @jira.link.relates_to.NOV-47674
  @moves @regression @automation.pending_env
  Scenario: The consumption will be represented in blue color when 0 < allowance consumption <100% for limited allowances
    Given the "minutes" allowance is limited in the "landline" product
      And user has consumed "<=80%" of the "minutes" allowance in the "landline" product
      And user has consumed ">0%" of the "minutes" allowance in the "landline" product
      And user has the "counters-carousel" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     Then the "minutes_roundel_color" allowance roundel is displayed in "blue" color

  @jira.QANOV-8631 @android @ios @mobile @jira.cv.11.9 @manual @moves @smoke
  Scenario: The consumption will be represented in blue color when minutes allowance is unlimited
    Given the "minutes" allowance is unlimited in the "landline" product
      And user has the "counters-carousel" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     Then the "minutes_roundel_color" allowance roundel is displayed in "blue" color

  @jira.QANOV-8632 @android @ios @mobile @jira.cv.11.9 @manual @moves @regression @automation.pending_env
  Scenario: User can see the different types of minutes allowances in a carousel
    Given user has "minutes" allowances in the "landline" product
      And the "minutes" allowance is limited in the "landline" product
      And user has ">1" number of allowances in the "landline" product
      And user has the "counters-carousel" module configured in CMS for "landline" page for the "landline" product
      And user is in the "Landline Dashboard" page
     Then the "landline_allowances" carousel is displayed
      And the "landline_allowances" carousel can be swiped in "right" direction
      And the "landline_allowances" carousel can be swiped in "left" direction
