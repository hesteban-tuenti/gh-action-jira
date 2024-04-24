# -*- coding: utf-8 -*-
@jira.QANOV-126731
Feature: Consumption breakdowns

  Actions Before the Feature:
    Given user has a "mobile_line" product
      And user has the "consumption-counters-parts" module configured in CMS for "consumption-details-data" page for the "mobile" product


  @jira.QANOV-6303 @android @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-6428 @jira.link.depends_on.QANOV-6429
  @jira.link.detects.MOVES-5050 @jira.link.relates_to.NOV-193912 @jira.link.relates_to.NOV-193913 @manual @mobile @moves
  @regression
  Scenario: Postpay user can see the FRANCHISE breakdown in consumption screen
    TELCO POSTPAY (Live): FIC052358F
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has "data_sharing" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the "franchise" element in the "bundle_list" list has the "icon" field
      And the "franchise" element in the "bundle_list" list has the "bundle_name" field
      And the "franchise" element in the "bundle_list" list has not the "expiration_date" field

  @jira.QANOV-6312 @android @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-6428 @jira.link.depends_on.QANOV-6429
  @jira.link.relates_to.NOV-193912 @jira.link.relates_to.NOV-193913 @manual @mobile @moves @regression
  Scenario: Postpay user can see the UNLIMITED FRANCHISE breakdown in consumption screen
    TELCO POSTPAY (Live): FIC052358F
    Given user has a "postpay" account type
      And the "data" allowance is unlimited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the "franchise" element in the "bundle_list" list has the "icon" field
      And the "franchise" element in the "bundle_list" list has the "bundle_name" textfield with "Ilimitado" text
      And the "franchise" element in the "bundle_list" list has not the "expiration_date" field

  @jira.<jira_id> @<impeded> @android @automation.pending_mock @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-6428
  @jira.link.depends_on.QANOV-6429 @jira.link.detects.MOVES-5050 @jira.link.relates_to.NOV-193912
  @jira.link.relates_to.NOV-193913 @manual @mobile @moves @regression
  Scenario Outline: Postpay user can see the EXTRA DATA BUNDLE breakdown in consumption screen
    TELCO POSTPAY (Live): FIC052358F
    Given user has a "postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "<data_bundle_purchased>" data bundle purchased
      And user has "data_sharing" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the "extra_data_bundle" element in the "bundle_list" list has the "icon" field
      And the "extra_data_bundle" element in the "bundle_list" list has the "bundle_name" textfield with the "Franquicia Extra Datos X GB" format
      And the "extra_data_bundle" element in the "bundle_list" list has not the "expiration_date" field

    Examples:
          | data_bundle_purchased | impeded      | jira_id    |
          | 5 GB                  |              | QANOV-6322 |
          | 10 GB                 | impeded_mock | QANOV-6331 |
          | 20 GB                 | impeded_mock | QANOV-6342 |
          | 40 GB                 | impeded_mock | QANOV-6358 |

  @jira.QANOV-6372 @android @automation.pending_mock @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-6428
  @jira.link.depends_on.QANOV-6429 @jira.link.relates_to.NOV-193912 @jira.link.relates_to.NOV-193913 @manual @mobile
  @moves @regression
  Scenario: Postpay user can see the PAY PER USE breakdown in consumption screen
    TELCO POSTPAY (Dev): moves-4 (first line)
    Given user has a "postpay" account type
      And user has a "Movistar Plus+ Lite; Tarifa 0" tariff
      And user has "pay_per_use" service in "activated" status
      And user has made consumption on the "data" allowances in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the "pay_per_use" element in the "bundle_list" list has the "icon" field
      And the "pay_per_use" element in the "bundle_list" list has the "bundle_name" field
      And the "pay_per_use" element in the "bundle_list" list has not the "expiration_date" field

  @jira.<jira_id> @android @automation.pending_mock @impeded_mock @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-6428
  @jira.link.depends_on.QANOV-6429 @jira.link.relates_to.NOV-193912 @manual @mobile @moves @regression
  Scenario Outline: Postpay user can see the NT DATA BUNDLE breakdown in consumption screen
    Given user has a "telco postpay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "<nt_data_bundle>" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the "nt_data_bundle" element in the "bundle_list" list has the "icon" field
      And the "nt_data_bundle" element in the "bundle_list" list has the "bundle_name" field
      And the "nt_data_bundle" element in the "bundle_list" list has not the "expiration_date" field

    Examples:
          | nt_data_bundle                           | jira_id    |
          | Ilimitado de 48 horas renovable          | QANOV-6383 |
          | Limitado de 1 GB por 7 días no renovable | QANOV-6395 |

  @jira.QANOV-142406 @android @ios @jira.cv.12.8 @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: Legado prepay user can see the Data bundle breakdown in consumption screen
    Legado prepay (Live): PRUEBA00029050 / 619701352
    Given user has a "legado prepay" account type
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "any" data bundle purchased
      And user has "data_sharing" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "contract-counters" module configured in CMS for "dashboard" page for the plan selected
      And user is in the "Account" page
     When clicks on the "data_roundel" allowance roundel
     Then the "Consumption" page is displayed
      And the "Consumo" header is displayed
      And the "bundle_list" list is displayed
      And the "bundle_list_title" textfield with "Tus paquetes de datos" text is displayed
      And the "data_bundle" element in the "bundle_list" list has the "icon" field
      And the "data_bundle" element in the "bundle_list" list has the "consumption" field
      And the "data_bundle" element in the "bundle_list" list has the "bundle_name" field
      And the "data_bundle" element in the "bundle_list" list has the "expiration_date" field
