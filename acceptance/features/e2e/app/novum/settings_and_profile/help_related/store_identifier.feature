# -*- coding: utf-8 -*-
@jira.QANOV-6897
Feature: Store identifier

  Actions Before the Feature:
    Given user is in the "Profile" page
      And clicks on the "avatar_tooltip.close_button" element if visible

  @jira.QANOV-556377 @android @ber @ios @jira.cv.24.3 @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @sanity
  Scenario: A user who access to the "Generar QR en tienda" option can see the QR page
    Given user has a "admin" role
      And user has registered with "NIF"
     When clicks on the "shop_identifier_entrypoint" entrypoint
     Then the "Shop Identifier" page is displayed
      And the "Generar QR en tienda" header is displayed
      And the "movistar_icon" icon is displayed
      And the "name" textfield with "[CONTEXT:user.name]" text is displayed
      And the "dni" textfield with "^\d{8}[A-Z]" format is displayed
      And the "qr_code" image is displayed
      And the "validity_date" textfield with the "Válido hasta \d+/\d+/\d\d a las \d\d:\d\d" format is displayed
