@jira.QANOV-7242
Feature: Shared data in plan


  @jira.QANOV-7246 @android @ios @mobile @jira.cv.10.4 @automatic @qa @webapp
  @jira.link.relates_to.NOV-47963 @moves @regression @jira.link.parent_test_plan.QANOV-189597
  Scenario: User with data sharing in the plan can access the sharing details from the mobile line screen
    commented_tags="@depends_on.NOV-47913"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has "data_sharing" service in "activated" status
      And user has the "shared-counters" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "data_sharing" module
     Then the "Data Sharing Details" page is displayed
      And the "Datos compartidos" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Mobile Line Dashboard" page is displayed
      And the "Línea móvil" header is displayed

  @jira.QANOV-7258 @android @ios @mobile @jira.cv.10.4 @automatic @ber @qa @webapp
  @jira.link.relates_to.NOV-47964 @moves @sanity @jira.link.parent_test_plan.QANOV-189597
  Scenario: User with data sharing activated can access the sharing details from the consumption details screen
    commented_tags="@depends_on.NOV-47926"
    Given user has a "postpay" account type
      And user has a "any_admin" role
      And user has "data_sharing" service in "activated" status
      And user has the "shared-counters" module configured in CMS for "consumption-details-data" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "any_roundel" allowance roundel
      And the "Consumption" page is displayed
      And clicks on the "data" tab
      And clicks on the "data_sharing" module
     Then the "Data Sharing Details" page is displayed
      And the "Datos compartidos" header is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And  the "Consumption" page is displayed
      And the "Consumo" header is displayed

  @jira.QANOV-7272 @android @ios @mobile @jira.cv.10.4 @automatic @jira.link.depends_on.QANOV-7246
  @jira.link.depends_on.QANOV-7258 @jira.link.relates_to.NOV-47965 @moves @smoke @ber @qa @webapp
  Scenario: User with data sharing in the plan sees the sharing details
    Given user has a "postpay" account type
      And user has a "admin" role
      And user has "data_sharing" service in "activated" status
      And user has the "shared-counters" module configured in CMS for "mobile" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "data_sharing" module
     Then the "Data Sharing Details" page is displayed
      And the "billing_cycle_end_time" textfield with the "Tu ciclo de facturación (cierra|cerró) (en|hace) \d+ (día|días|hora|horas)" format is displayed
      And the "billing_period" textfield with the "Periodo de \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d{1,2} (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "distributed_data_consumption_bar_graph" module is displayed
      And the "total_consumption_title" textfield with "Total consumido" text is displayed
      And the "total_consumed" textfield with the "\d+(,\d\d)?( | )(MB|GB) de \d+(,\d\d)?( | )(MB|GB)" format is displayed
      And the "consumption_section_title" textfield with "consumo por línea" text is displayed
      And the "consumption_per_line" list is displayed
      And each element in the "consumption_per_line" list has the "icon" field
      And each element in the "consumption_per_line" list has the "line_name" field
      And each element in the "consumption_per_line" list has the "phonenumber" textfield with the "6\d\d \d\d \d\d" format
      And each element in the "consumption_per_line" list has the "contribution" textfield with the "Aporta \d+( | )(MB|GB)" format
      And each element in the "consumption_per_line" list has the "consumed" textfield with the "\d+( | )(MB|GB)" format
      And each element in the "consumption_per_line" list has the "bar_color" field
