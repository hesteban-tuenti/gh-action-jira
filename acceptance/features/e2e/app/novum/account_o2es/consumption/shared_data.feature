# -*- coding: utf-8 -*-
@jira.QANOV-492668
Feature: Shared data

  Actions Before each Scenario:
    Given user has a "convergente" plan
      And user has "data_sharing" service in "activated" status
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "data_roundel" allowance roundel
      And the "Consumption Details" page is displayed


  @jira.QANOV-492669 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with data sharing activated can see the data sharing module in Consumption details page
     Then the "data_sharing" module is displayed
      And the "data_sharing.icon" icon is displayed
      And the "data_sharing.title" textfield with the "\d+ GB de \d+ GB" format is displayed
      And the "data_sharing.description" textfield with the "Datos compartidos por \d líneas" format is displayed

  @jira.QANOV-492670 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User with data sharing activated can access the sharing details from the Consumption details page
     When clicks on the "data_sharing" module
     Then the "Data Sharing Details" page is displayed
      And the "Datos compartidos" header is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días)" format is displayed
      And the "billing_period" textfield with the "Ciclo del \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "total_consumption_title" textfield with "Total consumido" text is displayed
      And the "distributed_data_consumption_bar_graph" module is displayed
      And the "total_consumed" textfield with the "\d+(,\d\d)?( | )(MB|GB) de \d+(,\d\d)?( | )(MB|GB)" format is displayed
      And the "consumption_section_title" textfield with "CONSUMO POR LÍNEA" text is displayed
      And the "consumption_per_line" list is displayed
      And each element in the "consumption_per_line" list has the "icon" field
      And each element in the "consumption_per_line" list has the "line_name" field
      And each element in the "consumption_per_line" list has the "phonenumber" textfield with the "\d\d\d \d\d\d \d\d\d" format
      And each element in the "consumption_per_line" list has the "contribution" textfield with the "Aporta \d+( | )(MB|GB)" format
      And each element in the "consumption_per_line" list has the "consumed" textfield with the "\d+( | )(MB|GB)" format
      And each element in the "consumption_per_line" list has the "bar_color" field
      And the "deactivate_button" button with "Desactivar Compartir datos" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Consumption Details" page is displayed

  @jira.QANOV-492671 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: User with data sharing activated can deactivate the service from Consumption details page
     When clicks on the "data_sharing" module
     Then the "Data Sharing" page is displayed
      And the "deactivate_button" button with "Desactivar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Sharing Details" page is displayed
