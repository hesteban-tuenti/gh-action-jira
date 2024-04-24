# -*- coding: utf-8 -*-
@jira.QANOV-407105
Feature: Consent Management

  Actions Before each Scenario:
    Given user has just logged in
      And user is in the "Explore" page


  @jira.QANOV-407106 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User can open consent management screen
     When opens any Explore card
     Then the "Explore Consent Management" page is displayed
      And the "Información de acceso" header is displayed

  @jira.QANOV-407107 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User can see consent management screen
     When opens any Explore card
     Then the "Explore Consent Management" page is displayed
      And the "Información de acceso" header is displayed
      And the "accept" button with "Aprobar" text is displayed
      And the "decline" button with "No aprobar" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Explore" page is displayed

  @jira.QANOV-407108 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User accepts the consents in pop up screen
     When opens any Explore card
      And the "Explore Consent Management" page is displayed
      And clicks on the "accept" button
     Then the Explore card is opened

  @jira.QANOV-407109 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User declines the consents in pop up screen
     When opens any Explore card
      And the "Explore Consent Management" page is displayed
      And clicks on the "decline" button
     Then the "Access Information" page is displayed
      And the "Información de acceso" header is displayed

  @jira.QANOV-407110 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can see Access information page when Consents have been declined
     When opens any Explore card
      And the "Explore Consent Management" page is displayed
      And clicks on the "decline" button
     Then the "Access Information" page is displayed
      And the "Información de acceso" header is displayed
      And the "icon" icon is displayed
      And the "continue" button is displayed

  @jira.QANOV-407111 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User clicks Continue button in Access information page when Consents have been declined: Explore page is displayed
     When opens any Explore card
      And the "Explore Consent Management" page is displayed
      And clicks on the "decline" button
      And the "Access Information" page is displayed
      And clicks on the "continue" button
     Then the "Explore" page is displayed
