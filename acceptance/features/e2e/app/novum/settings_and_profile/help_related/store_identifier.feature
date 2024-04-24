# -*- coding: utf-8 -*-
@jira.QANOV-6897
Feature: Store identifier

  Actions Before the Feature:
    Given user is in the "Profile" page
      And clicks on the "avatar_tooltip.close_button" element if visible


  @jira.QANOV-6898 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.7 @jira.dv.Future
  @jira.link.relates_to.NOV-81000 @live @mobile @moves @next @smoke @har
  Scenario: An ADMIN LIGHT user can't access to "Identificación en tienda" option: user escalation is required
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "Personal Data" page
      And user has a "admin-light" role
     When clicks on the "shop_identifier_entrypoint" entrypoint
     Then the "Login Escalation Required" page is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Personal Data" page is displayed

  @jira.QANOV-6899 @android @deprecate_profile_moves @impeded_mock @ios @jira.cv.10.8 @jira.dv.Future
  @jira.link.parent_test_plan.QANOV-525498 @jira.link.relates_to.NOV-92013 @manual @mobile @moves @regression
  Scenario: An ADMIN user who didn't login with NIF, isn't allowed to see the QR Code in "Identificación en tienda" option
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "Personal Data" page
      And user has a "admin" role
      And user is logged in with Tarjeta de residencia, Passport or CIF
     When clicks on the "shop_identifier_entrypoint" entrypoint
     Then the "Shop Identifier" page is displayed
      And the "Identificación en tienda" header is displayed
      And the "Esta funcionalidad permite identificarte como cliente en las tiendas Movistar. Actualmente sólo está disponible para clientes registrados con con un NIF." string is displayed

  @jira.QANOV-6900 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.7 @jira.dv.Future
  @jira.link.relates_to.NOV-47694 @live @mobile @moves @next @qa @sanity @har
  Scenario: A non-priority admin can access to the "Identificación en tienda" option
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "Personal Data" page
      And user has a "admin" role
      And user has a "no-priority" membership status
      And user has registered with "NIF"
     When clicks on the "shop_identifier_entrypoint" entrypoint
     Then the "Shop Identifier" page is displayed
      And the "Identificación en tienda" header is displayed
      And the "priority_title" textfield is not displayed
      And the "name" textfield is displayed
      And the "dni" textfield is displayed
      And the "validity_date" textfield with "VÁLIDO HASTA:" text is displayed
      And the "date" textfield with the "^[0-9]{1,2} [a-z]{3} a las [0-9]{1,2}:[0-9]{2}" format is displayed
      And the "qr_code" image is displayed

  @jira.QANOV-27015 @android @automatic @cert2 @deprecate_profile_moves @ios @jira.cv.10.8 @jira.dv.Future
  @jira.link.detects.MOVES-5204 @jira.link.relates_to.NOV-92098 @live @mobile @moves @next @qa @smoke
  Scenario: A priority user who access to the "Identificación en tienda" option can see the priority banner
    commented_tags="@depends_on.NOV-47204"
    Given user is in the "Personal Data" page
      And user has a "admin" role
      And user has a "priority" membership status
      And user has registered with "NIF"
     When clicks on the "shop_identifier_entrypoint" entrypoint
     Then the "Shop Identifier" page is displayed
      And the "Identificación en tienda" header is displayed
      And the "priority_title" textfield is displayed
      And the "name" textfield is displayed
      And the "surname" textfield is displayed
      And the "dni" textfield is displayed
      And the "validity_date" textfield with "VÁLIDO HASTA:" text is displayed
      And the "date" textfield with the "^[0-9]{1,2} [a-z]{3} a las [0-9]{1,2}:[0-9]{2}" format is displayed
      And the "qr_code" image is displayed

  @jira.QANOV-556377 @android @ber @ios @jira.cv.Future @jira.link.parent_test_plan.QANOV-525498 @manual @mobile @moves
  @sanity @har
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
