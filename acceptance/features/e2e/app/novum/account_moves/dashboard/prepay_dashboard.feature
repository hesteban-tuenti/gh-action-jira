# -*- coding: utf-8 -*-
@jira.QANOV-325830
Feature: Prepay dashboard

  Actions Before each Scenario:
    Given user has a "telco prepay" account type
      And user has the "plan-data-card" module configured in CMS for "mobile" page


  @jira.QANOV-325831 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @sanity @qa @cert2 @next @live @webapp
  Scenario: User with a mobile prepay product can see the Mobile Line Dashboard page
    Given user is in the "Mobile Line Dashboard" page for the matching line
     Then the header that contains the "Línea móvil" text is displayed
      And the "prepay_product.icon" image is displayed
      And the "prepay_product.title" textfield with the "Línea 6\d\d \d\d \d\d \d\d" format is displayed
      And the "prepay_product.description" textfield with "Accede a tu línea para consultar todos los detalles de tu tarifa" text is displayed
      And the "prepay_product.button_primary" button with "Recargar saldo" text is displayed
      And the "prepay_product.link" link with "Ver detalle" text is displayed

  @jira.QANOV-325832 @android @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves @smoke
  @cert2 @next @live
  Scenario: Prepay user taps on the "Ver detalles" link: The user will be redirected to another webview with his/her line details
    The user will be authenticated in the target URL
    Given user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "prepay_product.link" link
     Then the browser webview with "Detalles de mi línea" text in the header is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Mobile Line Dashboard" page is displayed

  @jira.QANOV-325833 @android @ber @ios @jira.cv.14.3 @jira.link.parent_test_plan.QANOV-293817 @automatic @mobile @moves
  @cert2 @next @live @qa
  Scenario: Prepay user taps on the "Recargar saldo" button: The user will be redirected to another webview to top up
    The user will be authenticated in the target URL
    Given user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "prepay_product.button_primary" button
     Then the browser webview is displayed
      And the "recarga" string is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Mobile Line Dashboard" page is displayed
