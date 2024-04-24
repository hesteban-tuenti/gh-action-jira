# -*- coding: utf-8 -*-
@jira.QANOV-9274
Feature: Bundle Management


  @jira.QANOV-9320 @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.relates_to.NOV-119860
  @mobile @moves @no_automatable @regression
  Scenario: Prepay user accesses the bundle purchase page
    If user does not have enough credit to buy a specific bundle, its 'Seleccionar' button will be
    disabled
    Cannot been automated: The actual legado prepay user have all the subscriptions with the same name 'HABLA 6' and
    cannot set the correct subscription in the selector
    Given user has a "legado prepay" account type
      And user has enough balance to purchase bundles
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Account" page
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "smart_actions.data_management_prepay" button
     Then the "Bundle Purchase" page is displayed
      And the "Compra de bonos" header is displayed
      And the "balance_title" textfield with "Tu saldo" text is displayed
      And the "balance_amount" textfield with the "\d+,\d\d( | )€" format is displayed
      And the "pick_bundle" textfield with "Selecciona un bono" text is displayed
      And each element in the "bundle_list" list has the "name" field
      And each element in the "bundle_list" list has the "more_info" textfield with "Más info" text
      And each element in the "bundle_list" list has the "price" textfield with the "\d+,\d\d( | )€" format
      And each element in the "bundle_list" list has the "select" textfield with "Seleccionar" text
      And the "secure_site" textfield with "100% seguro" text is displayed

  @jira.QANOV-9324 @android @impeded_legacy @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-9320
  @jira.link.parent_test_plan.QANOV-44930 @jira.link.relates_to.NOV-119878 @mobile @moves
  @no_automatable @regression
  Scenario: Prepay user selects a bundle from the main bundle purchase page
    Cannot been automated: The actual legado prepay user have all the subscriptions with the same name 'HABLA 6' and
    cannot set the correct subscription in the selector
    Given user has a "legado prepay" account type
      And user has enough balance to purchase bundles
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
      And clicks on the "smart_actions.data_management_prepay" button
      And the "Bundle Purchase" page is displayed
     When clicks on the "select" field of "bundle_list" list with "any" index
     Then the "Purchase Summary" page is displayed
      And the "Compra de bonos" header is displayed
      And the "summary" textfield with "Resumen de tu compra" text is displayed
      And the "phone_number_label" textfield with "Número de teléfono" text is displayed
      And the "phone_number_value" textfield with the "\d{3} \d{2} \d{2} \d{2}" format is displayed
      And the "current_balance_label" textfield with "Tu saldo actual" text is displayed
      And the "current_balance_value" textfield with the "\d+,\d\d( | )€" format is displayed
      And the "bundle_name_label" textfield that contains the "Bono" text is displayed
      And the "bundle_price" textfield with the "\d+,\d\d( | )€" format is displayed
      And the "future_balance_label" textfield with "Tu saldo tras la compra" text is displayed
      And the "future_balance_value" textfield with the "\d+,\d\d( | )€" format is displayed
      And the "hire_conditions_link" link with "Puedes descargar en PDF un resumen de condiciones de contratación." text is displayed
      And the "hire_conditions_text" textfield with "Son vinculantes si completas la compra en este momento." text is displayed
      And the "pay_button" button with "Pagar" text is displayed
      And the "secure_site" textfield with "100% seguro" text is displayed

  @jira.<jira_id> @android @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-44930 @no_automatable @mobile
  @moves @regression @impeded_legacy
  Scenario Outline: LEGADO PREPAY ADMIN user can access to the Hire Conditions PDF for a bundle purchase of <bundle_name> from the Purchase Summary on Android devices
    other_affected_versions="2020-51"
    Given user has a "legado prepay" account type
      And user is eligible to purchase the "<bundle_name>" data bundle
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Purchase" page
     When clicks on the "select" field of the element with "<bundle_name>" text on the "title" field of the "bundle_list" list
      And clicks on the "hire_conditions_link" link
     Then a pdf file is download from the "<pdf_url>" url
      And the PDF file is opened after it is downloaded
      And clicks on the native "back" button
      And the "Bundle Purchase" page is displayed

    Examples:
          | bundle_name            | pdf_url                                                                                       | jira_id     |
          | Bono 200 MB            | https://movistar.es/rpmm/estaticos/residencial/res_Bono_Extra_200_MB.pdf                      | QANOV-44984 |
          | Bono Navega+           | https://movistar.es/rpmm/estaticos/residencial/res_Bono_Navega_mas.pdf                        | QANOV-44985 |
          | Bono Habla+            | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_Bono_Habla_mas.pdf             | QANOV-44986 |
          | Bono Internacional 100 | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_282_Bono_Internacional_100.pdf | QANOV-44987 |

  @jira.<jira_id> @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-44930
  @no_automatable @mobile @moves @regression @impeded_legacy
  Scenario Outline: LEGADO PREPAY ADMIN user can access to the Hire Conditions PDF for a bundle purchase of <bundle_name> from the Purchase Summary on iOS devices
    other_affected_versions="2020-51"
    Given user has a "legado prepay" account type
      And user is eligible to purchase the "<bundle_name>" data bundle
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Purchase" page
     When clicks on the "select" field of the element with "<bundle_name>" text on the "title" field of the "bundle_list" list
      And clicks on the "hire_conditions_link" link
     Then the browser webview is displayed
      And a pdf file is opened from the "<pdf_url>" url
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bundle Purchase" page is displayed

    Examples:
          | bundle_name            | pdf_url                                                                                       | jira_id     |
          | Bono 200 MB            | https://movistar.es/rpmm/estaticos/residencial/res_Bono_Extra_200_MB.pdf                      | QANOV-95767 |
          | Bono Navega+           | https://movistar.es/rpmm/estaticos/residencial/res_Bono_Navega_mas.pdf                        | QANOV-95768 |
          | Bono Habla+            | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_Bono_Habla_mas.pdf             | QANOV-95769 |
          | Bono Internacional 100 | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_282_Bono_Internacional_100.pdf | QANOV-95770 |

  @jira.QANOV-9326 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-9320 @jira.link.relates_to.NOV-119872
  @no_automatable @mobile @moves @regression @impeded_legacy
  Scenario: User can see more information about a bundle
    internal_checkpoint="If user does not have enough credit to buy a specific bundle, the 'Seleccionar' button will be
    disabled"
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Purchase" page
     When clicks on the "more_info" link of the element in the "any" position of the "bundle_list" list
     Then the "Bundle Management" page is displayed
      And the "bundle_name" textfield is displayed
      And the "price" textfield with the "X,XX€" format is displayed
      And the "short_description" textfield is displayed
      And the "long_description" textfield is displayed
      And the "select_button" button with "Seleccionar" text is displayed

  @jira.QANOV-9330 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-9326 @jira.link.parent_test_plan.QANOV-44930
  @jira.link.relates_to.NOV-119876 @no_automatable @mobile @moves @regression @impeded_legacy
  Scenario: Prepay user selects a bundle from the bundle information page
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Management" page
     When clicks on the "select_button" button
     Then the "Purchase Summary" page is displayed
      And the "Compra de bonos" header is displayed
      And the "summary" textfield with "Resumen de tu compra" text is displayed
      And the "phone_number_label" textfield with "Número de teléfono" text is displayed
      And the "phone_number_value" textfield with the "XXX XX XX XX" format is displayed
      And the "current_balance_label" textfield with "Tu saldo actual" text is displayed
      And the "current_balance_value" textfield with the "X,XX€" format is displayed
      And the "bundle_name_label" textfield is displayed
      And the "bundle_price" textfield with the "X,XX€" format is displayed
      And the "future_balance_label" textfield with "Tu saldo tras la compra" text is displayed
      And the "future_balance_value" textfield with the "X,XX€" format is displayed
      And the "hire_conditions_link" link with "Puedes descargar en PDF un resumen de condiciones de contratación." text is displayed
      And the "hire_conditions_text" textfield with "Son vinculantes si completas la compra en este momento" text is displayed
      And the "pay_button" button with "Pagar" text is displayed
      And the "secure_site" textfield with "100% seguro" text is displayed

  @jira.QANOV-9332 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-9320 @jira.link.detects.ANDROID-9893
  @jira.link.detects.IOS-7033 @jira.link.detects.MOVES-4783 @jira.link.detects.MOVES-4784
  @jira.link.relates_to.NOV-119881 @no_automatable @mobile @moves @regression @impeded_legacy
  Scenario: Prepay user successfully buys a bundle
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Purchase" page
     When clicks on the "select" field of the element in the "any" position of the "bundle_list" list
      And the "Purchase Summary" page is displayed
      And clicks on the "pay_button" button
     Then the "Feedback Success" page is displayed
      And the "success_title" textfield with the "Tu solicitud ha sido enviada con éxito" format is displayed
      And the "success_message" textfield with "En breve recibirás un SMS de confirmación" text is displayed
      And the "back_to_account" button with "Volver a Mis Productos" text is displayed
      And the "navigation_top_bar.close_button" button is not displayed
      And receives a "operation_done" notification

  @jira.QANOV-9335 @android @ios @jira.cv.11.2 @jira.link.depends_on.QANOV-9320 @jira.link.relates_to.NOV-119883
  @mobile @moves @regression @no_automatable @impeded_legacy
  Scenario: Prepay user goes back to main account page after successfully purchasing a bundle
    Given user has a "legado prepay" account type
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Bundle Purchase" page
     When clicks on the "select" field of the element in the "any" position of the "bundle_list" list
      And the "Purchase Summary" page is displayed
      And clicks on the "pay_button" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47936 @live @mobile @moves
  Scenario Outline: User without unlimited tariff can access to the data management page
    internal_checkpoint=" - The promotion bundle could be displayed if there is any promotion in course not activated
    yet.
    - The Pay per use module is only displayed if data sharing is deactivated, it is verified in another scenario."
    commented_tags="@depends_on.NOV-47913"
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has "several" mobile lines
      And user has not the "Datos infinitos" data bundle purchased
      And user has "data_sharing" service in "deactivated" status
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And waits until the "bundle_list_title" element is visible
      And the "Gestionar datos" header is displayed
      And the "bundle_list_title" textfield with "Extras de datos adicionales" text is displayed
      And the "bundle_list_subtitle" textfield with "También puedes complementar tu tarifa mensual con extras de datos adicionales para seguir navegando a máxima velocidad." text is displayed
      And each element in the "bundle_list" list has the "data_icon" field
      And each element in the "bundle_list" list has the "name" field
      And each element in the "bundle_list" list has the "more_info" textfield with "Más información" text
      And each element in the "bundle_list" list has the "price" textfield with the "\d+,\d\d( | )€/mes" format
      And each element in the "bundle_list" list has the "manage_button" field
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Mobile Line Dashboard" page is displayed

    @smoke @next @qa @live @cert2 @ber @automatic @webapp @dv.Future
    Examples:
          | account_type | module_id        | button                   | jira_id    |
          | telco        | services-summary | services_data_management | QANOV-9347 |

    @regression @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | button                        | jira_id      |
          | legado       | smart-actions-legado | smart_actions.data_management | QANOV-235680 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-175721 @mobile @moves
  @regression
  Scenario Outline: User without data sharing activated can see the Pay per use entry point
    commented_tags="@depends_on.NOV-47913"
    Given user has a "<account_type> postpay" account type
      And user has a "Movistar Plus+ Lite; Tarifa 0" tariff
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has "data_sharing" service in "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "pay_per_use_activate" module is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | button                   | jira_id    |
          | telco        | services-summary | services_data_management | QANOV-9350 |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | button                        | jira_id      |
          | legado       | smart-actions-legado | smart_actions.data_management | QANOV-235681 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-178083 @mobile @moves
  @regression
  Scenario Outline: User with data sharing activated won't see the Pay per use entry point
    commented_tags="@depends_on.NOV-47913"
    Given user has a "<account_type> postpay" account type
      And user has a "Movistar Plus+ Lite; Tarifa 0" tariff
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has "data_sharing" service in "activated" status
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "pay_per_use_activate" module is not displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | button                   | jira_id    |
          | telco        | services-summary | services_data_management | QANOV-9353 |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | button                        | jira_id      |
          | legado       | smart-actions-legado | smart_actions.data_management | QANOV-235682 |

  @jira.QANOV-9356 @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-202324 @mobile @moves @regression @no_automatable @impeded_legacy
  Scenario: Legados user who purchased the Unlimited data bundle can access to the Data Management page
    internal_checkpoint="Plans compatible to purchase the unlimited data bundle: Fusión Selección y Fusión PRO"
    commented_tags="@depends_on.NOV-47913"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has a compatible tariff to purchase the unlimited data bundle
      And user has the "unlimited_bundle" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "smart_actions.data_management" button
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_activate" module is displayed
      And each element in the "bundle_list" list has the "data_icon" icon
      And each element in the "bundle_list" list has the "name" textfield with "Bono de Datos infinitos" text
      And each element in the "bundle_list" list has the "more_info" textfield with "Más información" text
      And each element in the "bundle_list" list has the "price" textfield with the "\d+,\d\d( | )€/mes" format
      And each element in the "bundle_list" list has the "manage_button" button with "Dar de baja" text
      And the "bundle_list" list contains "1" elements

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-199599 @mobile @moves @regression
  Scenario Outline: User eligible to buy the Unlimited data bundle can access to the Data Management page
    internal_checkpoint=" - Plans compatible to purchase the unlimited data bundle: Fusión Selección y Fusión PRO.
    - In Fusiones Selección just can be purchased in the main line. In the Fusión PRO could be purchased on any line.
    - The promotion bundle could be displayed if there is any promotion in course not activated yet.
    - Legados user to test: 005FUSION35"
    commented_tags="@depends_on.NOV-47913"
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has a compatible tariff to purchase the unlimited data bundle
      And user has not the "unlimited_bundle" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "<button>" button
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_activate" module is displayed
      And each element in the "bundle_list" list has the "data_icon" icon
      And each element in the "bundle_list" list has the "name" field
      And each element in the "bundle_list" list has the "more_info" textfield with "Más información" text
      And each element in the "bundle_list" list has the "price" textfield with the "XX,XX €/mes" format
      And each element in the "bundle_list" list has the "manage_button" field
      And the "unlimited_bundle" element in the "bundle_list" list has the "name" textfield with "Bono Datos Infinitos" text
      And the "unlimited_bundle" element in the "bundle_list" list has the "price" textfield with "0,00 €/mes" text
      And the "unlimited_bundle" element in the "bundle_list" list has the "manage_button" button with "Contratar" text

    @manual @dv.Future
    Examples:
          | account_type | module_id            | button                        | jira_id      |
          | telco        | services-summary     | services_data_management      | QANOV-9361   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | button                        | jira_id      |
          | legado       | smart-actions-legado | smart_actions.data_management | QANOV-235683 |

  @jira.QANOV-9364 @android @automation.pending_mock @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-199855 @manual @mobile @moves @regression @dv.Future
  Scenario: TELCO user who purchased the Unlimited data bundle can access to the Data Management page
    internal_checkpoint=" - Plans compatible to purchase the unlimited data bundle: Fusión Selección y Fusión PRO.
    - The promotion bundle could be displayed if there is any promotion in course not activated yet."
    commented_tags="@depends_on.NOV-47913"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has a compatible tariff to purchase the unlimited data bundle
      And user has the "unlimited_bundle" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page
     When clicks on the "services_data_management" button
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_activate" module is displayed
      And each element in the "bundle_list" list has the "data_icon" icon
      And each element in the "bundle_list" list has the "name" field
      And each element in the "bundle_list" list has the "more_info" textfield with "Más información" text
      And each element in the "bundle_list" list has the "price" textfield with the "XX,XX €/mes" format
      And each element in the "bundle_list" list has the "manage_button" field
      And the "unlimited_bundle" element in the "bundle_list" list has the "name" textfield with "Bono de Datos infinitos" text
      And the "unlimited_bundle" element in the "bundle_list" list has the "price" textfield with "0,00 €/mes" text
      And the "unlimited_bundle" element in the "bundle_list" list has the "manage_button" button with "Dar de baja" text

  @jira.<jira_id> @android @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-44930 @mobile @moves @regression
  @no_automatable @impeded_legacy
  Scenario Outline: ADMIN LEGADO POSTPAY user can access to the Hire Conditions PDF for a bundle purchase of <amount> GB from the Bundle Management page on Android devices
    other_affected_versions="2020-51"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the element with "<amount>" text on the "title" field of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "hire_conditions_link" link
     Then a pdf file is download from the "<pdf_url>" url
      And the PDF file is opened after it is downloaded
      And clicks on the native "back" button
      And the "Bundle Management" page is displayed

    Examples:
          | amount     | pdf_url                                                                                         | jira_id     |
          | 5 GB       | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_72_Extra_Datos_5GB.pdf           | QANOV-44988 |
          | 10 GB      | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_80_Extra_Datos_10GB.pdf          | QANOV-44989 |
          | 20 GB      | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_70_Extra_Datos_20GB.pdf          | QANOV-44990 |
          | 40 GB      | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_91_Extra_Datos_40GB.pdf          | QANOV-44991 |
          | Ilimitados | https://www.movistar.es/rpmm/estaticos/residencial/precontrato/res_969_Bono_datos_infinitos.pdf | QANOV-44992 |

  @jira.<jira_id> @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-44930 @mobile @moves @regression
  @no_automatable @impeded_legacy
  Scenario Outline: ADMIN LEGADO POSTPAY user can access to the Hire Conditions PDF for a bundle purchase of <amount> GB from the Bundle Management page on iOS devices
    other_affected_versions="2020-51"
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the element with "<amount>" text on the "title" field of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "hire_conditions_link" link
     Then the browser webview is displayed
      And a pdf file is opened from the "<pdf_url>" url
      And the "navigation_top_bar.close_button" button is displayed
      And the "navigation_top_bar.options_reload" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Bundle Management" page is displayed

    Examples:
          | amount     | pdf_url                                                                                         | jira_id     |
          | 5 GB       | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_72_Extra_Datos_5GB.pdf           | QANOV-95784 |
          | 10 GB      | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_80_Extra_Datos_10GB.pdf          | QANOV-95785 |
          | 20 GB      | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_70_Extra_Datos_20GB.pdf          | QANOV-95786 |
          | 40 GB      | https://movistar.es/rpmm/estaticos/residencial/precontrato/res_91_Extra_Datos_40GB.pdf          | QANOV-95787 |
          | Ilimitados | https://www.movistar.es/rpmm/estaticos/residencial/precontrato/res_969_Bono_datos_infinitos.pdf | QANOV-95788 |

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-21054 @no_automatable @impeded_legacy
  @jira.link.parent_test_plan.QANOV-44930 @jira.link.relates_to.NOV-47937 @mobile @moves @regression
  Scenario Outline: LEGADO POSTPAY user can see more information about a data bundle to 'Contratar' from the <field> field
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has the "no_one" data bundle purchased
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "<field>" field of the data bundle in the desired status
     Then the "Bundle Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "bundle_title" textfield is displayed
      And the "bundle_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "total_title" textfield with "Total" text is displayed
      And the "total_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "hire_conditions_link" link with "Puedes descargar en PDF un resumen de condiciones de contratación." text is displayed
      And the "hire_conditions_text" textfield with "Son vinculantes si completas la compra en este momento" text is displayed
      And the "description" textfield is displayed
      And the "manage_button" button with "Contratar" text is displayed

    Examples:
          | field         | jira_id     |
          | more_info     | QANOV-9372  |
          | manage_button | QANOV-77577 |

  @jira.<jira_id> @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @live @cert2 @next
  @jira.link.parent_test_plan.QANOV-189597 @automatic @mobile @moves @regression @qa @webapp @dv.Future
  Scenario Outline: TELCO POSTPAY user can see more information about a data bundle to 'Contratar' from the <field> field
    other_affected_versions="2022-05 2022-06-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "no_one" data bundle purchased
      And the "data" allowance is limited in the "mobile_line" product
      And user has a "mobile_line" product
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "services_data_management" button
      And the "Data Management" page is displayed
      And waits until the "bundle_list_title" element is visible
      And clicks on the "<field>" button of any element of the "bundle_list" list
     Then the "Bundle Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "bundle_title" textfield is displayed
      And the "bundle_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "total_title" textfield with "Total" text is displayed
      And the "total_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "hire_conditions_link" link is not displayed
      And the "description" textfield is displayed
      And the "manage_button" button with "Contratar" text is displayed

    Examples:
          | field         | jira_id      |
          | more_info     | QANOV-153315 |
          | manage_button | QANOV-153316 |

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.detects.MOVES-5305 @jira.link.parent_test_plan.QANOV-189597
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.parent_test_plan.QANOV-44930 @jira.link.relates_to.NOV-47937
  @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user can see more information about a data bundle to 'Dar de baja' from the <field> field
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has the "any" data bundle purchased
      And user has a "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "<field>" field of the data bundle in the desired status
     Then the "Bundle Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "bundle_title" textfield is displayed
      And the "bundle_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "hire_conditions_link" link is not displayed
      And the "hire_conditions_text" textfield is not displayed
      And the "description" textfield is displayed
      And the "manage_button" button with "Dar de baja" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Management" page is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id            | field         | jira_id      |
          | telco        | services-summary     | more_info     | QANOV-77576  |
          | telco        | services-summary     | manage_button | QANOV-77576  |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | field         | jira_id      |
          | legado       | smart-actions-legado | manage_button | QANOV-252933 |
          | legado       | smart-actions-legado | more_info     | QANOV-252934 |

  @jira.QANOV-9387 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47940 @mobile @moves
  @regression @no_automatable @impeded_legacy
  Scenario: User confirms the purchase of a data bundle: purchase is done
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    telco postpay flow migrated to: 'condiciones_contratacion.feature'
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has not the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the data bundle in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
     Then no popup is displayed
      And the "Feedback Success" page is displayed
      And the "success_title" textfield with "Tu solicitud ha sido enviada con éxito" text is displayed
      And the "success_message" textfield with "En un plazo máximo de 24 horas recibirás un SMS con la confirmación." text is displayed
      And the "back_to_account" button with "Volver a mi línea" text is displayed

  @jira.QANOV-9389 @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47941 @mobile @moves
  @regression @no_automatable @impeded_legacy
  Scenario: User goes back to dashboard after having purchased a data bundle
    telco postpay flow migrated to: 'condiciones_contratacion.feature'
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has not the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the data bundle in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Account" page is displayed
      And the "Mis Productos" header is displayed

  @jira.<jira_id> @<client> @jira.cv.10.4 @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-47948
  @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user tries to unsuscribe a data bundle: 'Unsubscribe Data Bundle' popup is displayed
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the data bundle in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Unsubscribe Data Bundle" popup is displayed
      And the "title" textfield with "¿Dar de baja el paquete?" text is displayed
      And the "message" textfield with "La baja del paquete será efectiva a partir del siguiente ciclo de facturación" text is displayed
      And the "cancel" button with "<not_now_text>" text is displayed
      And the "accept" button with "<unsubscribe_text>" text is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id            | client  | unsubscribe_text | not_now_text | jira_id      |
          | telco        | services-summary     | android | DAR DE BAJA      | AHORA NO     | QANOV-9391   |
          | telco        | services-summary     | ios     | Dar de baja      | Ahora no     | QANOV-9393   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | client  | unsubscribe_text | not_now_text | jira_id      |
          | legado       | smart-actions-legado | android | DAR DE BAJA      | AHORA NO     | QANOV-252935 |
          | legado       | smart-actions-legado | ios     | Dar de baja      | Ahora no     | QANOV-252936 |

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.relates_to.NOV-47951 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user cancels the unsubscription of a data bundle
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the data bundle in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Unsubscribe Data Bundle" popup is displayed
      And clicks on the "cancel" button
     Then the "Unsubscribe Data Bundle" popup is not displayed
      And the "Data Management" page is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id            | jira_id      |
          | telco        | services-summary     | QANOV-9395   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-252937 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-9347
  @jira.link.depends_on.QANOV-9350 @jira.link.depends_on.QANOV-9353 @jira.link.depends_on.QANOV-9361
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-47949 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user confirms the unsubscription of a data bundle: unsubscription is done
    internal_checkpoint="IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages"
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the data bundle in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Unsubscribe Data Bundle" popup is displayed
      And clicks on the "accept" button
     Then the "Feedback Success" page is displayed
      And the "success_title" textfield with "Tu solicitud ha sido enviada con éxito" text is displayed
      And the "success_message" textfield with "Te confirmaremos la baja por SMS y en unas horas verás la información actualizada en Mis Productos." text is displayed
      And the "back_to_account" button with "Volver a mi línea" text is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id            | jira_id      |
          | telco        | services-summary     | QANOV-9396   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-252938 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-9347
  @jira.link.depends_on.QANOV-9350 @jira.link.depends_on.QANOV-9353 @jira.link.depends_on.QANOV-9361
  @jira.link.parent_test_plan.QANOV-189597 @jira.link.relates_to.NOV-47950 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user goes back to dashboard after having unsuscribed a data bundle
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of the data bundle in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Unsubscribe Data Bundle" popup is displayed
      And clicks on the "accept" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id            | jira_id      |
          | telco        | services-summary     | QANOV-9398   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-252939 |

  @jira.<jira_id> @<client> @jira.cv.10.4 @jira.link.depends_on.QANOV-9347 @jira.link.depends_on.QANOV-9350
  @jira.link.depends_on.QANOV-9353 @jira.link.depends_on.QANOV-9361 @jira.link.parent_test_plan.QANOV-21054
  @jira.link.relates_to.NOV-47952 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user tries to replace an active data bundle: 'Replace Data Bundle' popup is displayed
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of a data bundle not in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Replace Data Bundle" popup is displayed
      And the "title" textfield with "¿Sustituir paquete activo?" text is displayed
      And the "message" textfield with "Si contratas este paquete se dará de baja automáticamente el que ya tienes contratado." text is displayed
      And the "cancel" button with "<not_now_text>" text is displayed
      And the "accept" button with "<replace_text>" text is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id            | client  | replace_text      | not_now_text | jira_id      |
          | telco        | services-summary     | android | SUSTITUIR PAQUETE | AHORA NO     | QANOV-9400   |
          | telco        | services-summary     | ios     | Sustituir paquete | Ahora no     | QANOV-9402   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | client  | replace_text      | not_now_text | jira_id      |
          | legado       | smart-actions-legado | android | SUSTITUIR PAQUETE | AHORA NO     | QANOV-252940 |
          | legado       | smart-actions-legado | ios     | Sustituir paquete | Ahora no     | QANOV-252941 |

  @jira.<jira_id> @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-9347 @jira.link.depends_on.QANOV-9350
  @jira.link.depends_on.QANOV-9353 @jira.link.depends_on.QANOV-9361 @jira.link.relates_to.NOV-47954 @mobile @moves
  @regression
  Scenario Outline: A <account_type> postpay user cancels the replacement of an active data bundle
    Given user has a "<account_type> postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of a data bundle not in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Replace Data Bundle" popup is displayed
      And clicks on the "cancel" button
     Then the "Replace Data Bundle" popup is not displayed
      And the "Data Management" page is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id            | jira_id      |
          | telco        | services-summary     | QANOV-9407   |

    @no_automatable @impeded_legacy
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-252942 |

  @jira.QANOV-9410 @android @ios @jira.cv.10.4 @jira.link.depends_on.QANOV-9347
  @jira.link.depends_on.QANOV-9350 @jira.link.depends_on.QANOV-9353 @jira.link.depends_on.QANOV-9361
  @jira.link.relates_to.NOV-47953 @mobile @moves @regression @no_automatable @impeded_legacy
  Scenario: User confirms the replacement of an active data bundle
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    telco postpay flow migrated to: 'condiciones_contratacion.feature'
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has the "any" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info" field of a data bundle not in the desired status
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Replace Data Bundle" popup is displayed
      And clicks on the "accept" button
     Then the "Feedback Success" page is displayed
      And the "success_title" textfield with "Tu solicitud ha sido enviada con éxito" text is displayed
      And the "success_message" textfield with "En breve recibirás un SMS con la confirmación." text is displayed
      And the "back_to_account" button with "Volver a mi línea" text is displayed

  @jira.<jira_id> @<client> @jira.cv.11.7 @jira.link.depends_on.QANOV-9361 @no_automatable @impeded_legacy
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-202322 @mobile @moves @regression
  Scenario Outline: Legados user eligible to buy the Unlimited data bundle tries to replace an active bundle with an unlimited bundle: a modal will be displayed informing that the bundle won't be replaced
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has a compatible tariff to purchase the unlimited data bundle
      And user has not the "unlimited_bundle" data bundle purchased
      And user has the "any_limited_bundle" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "manage_button" field of the element "unlimited_bundle" of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Not Replaceable Data Bundle" popup is displayed
      And the "title" textfield with "Desactiva el extra contratado" text is displayed
      And the "message" textfield with "Para comprar el bono de datos infinitos, debes dar de baja tu extra actual." text is displayed
      And the "accept" button with "<ok_text>" text is displayed

    Examples:
          | client  | ok_text   | jira_id    |
          | android | ENTENDIDO | QANOV-9413 |
          | ios     | Entendido | QANOV-9417 |

  @jira.QANOV-9421 @android @ios @jira.cv.11.7 @jira.link.depends_on.QANOV-9361 @no_automatable @impeded_legacy
  @jira.link.parent_test_plan.QANOV-21054 @jira.link.relates_to.NOV-202323 @mobile @moves @regression
  Scenario: Legados user eligible to buy the Unlimited data bundle who tries to replace an active bundle with the unlimited bundle taps on the "Entendido" action
    Given user has a "legado postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user has a compatible tariff to purchase the unlimited data bundle
      And user has not the "unlimited_bundle" data bundle purchased
      And user has the "any_limited_bundle" data bundle purchased
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "manage_button" field of the element "unlimited_bundle" of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Not Replaceable Data Bundle" popup is displayed
      And clicks on the "accept" button
     Then the "Not Replaceable Data Bundle" popup is not displayed
      And the "Data Management" page is displayed
