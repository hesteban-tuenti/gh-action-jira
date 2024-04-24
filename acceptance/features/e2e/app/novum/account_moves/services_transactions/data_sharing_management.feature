# -*- coding: utf-8 -*-
@jira.QANOV-26987
Feature: Data sharing management


  @jira.QANOV-44993 @android @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-44930
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: LEGADO POSTPAY user with data sharing in deactivated status taps on the Activate button: "Data Sharing Details" page is displayed
    Given user has a "legado postpay" account type
      And user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_activate.manage" button
     Then the "Data Sharing Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_title" textfield with "Datos compartidos" text is displayed
      And the "data_sharing_price" textfield with the "\d+,\d\d( | )€/mes" format is displayed
      And the "total_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "price_description" textfield with "Todos los datos de tus líneas móviles, sumados en una bolsa común de datos para compartir" text is displayed
      And the "hire_conditions_link" link with "Puedes descargar en PDF un resumen de condiciones de contratación." text is displayed
      And the "hire_conditions_text" textfield with "Son vinculantes si completas la compra en este momento" text is displayed
      And the "features_title" textfield with "Características" text is displayed
      And the "features_description" textfield is displayed
      And the "activate_button" button with "Activar" text is displayed
      And clicks on the "top_navigation_bar.back" button
      And the "Data Management" page is displayed

  @jira.QANOV-153345 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @dv.Future
  @jira.link.parent_test_plan.QANOV-189597 @automatic @mobile @moves @sanity @ber @qa @cert2 @next @live @webapp
  Scenario: TELCO POSTPAY user with data sharing in deactivated status taps on the Activate button: "Data Sharing Details" page is displayed
    other_affected_versions="2022-06-B"
    Given user has a "telco postpay" account type
      And user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Mobile Line Dashboard" page for the matching line
     When clicks on the "services_data_management" button
      And the "Data Management" page is displayed
      And waits until the "data_sharing_activate" element is visible
      And clicks on the "data_sharing_activate.manage" button
     Then the "Data Sharing Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_title" textfield with "Datos compartidos" text is displayed
      And the "data_sharing_price" textfield with the "\d+,\d\d( | )€/mes" format is displayed
      And the "total_title" textfield with "Total" text is displayed
      And the "total_price" textfield with the "\d+,\d\d( | )€" format is displayed
      And the "price_description" textfield with "Todos los datos de tus líneas móviles, sumados en una bolsa común de datos para compartir." text is displayed
      And the "hire_conditions_link" link is not displayed
      And the "features_title" textfield with "Características" text is displayed
      And the "features_description" textfield is displayed
      And the "activate_button" button with "Activar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button to go back to the previous page
      And the "Data Management" page is displayed

  @jira.QANOV-26988 @android @ios @jira.cv.11.7 @jira.link.parent_test_plan.QANOV-44930 @jira.link.relates_to.NOV-190447
  @jira.link.relates_to.NOV-190448 @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: LEGADO POSTPAY user with data sharing in deactivated status sees more information about "Data sharing"
    Given user has a "legado postpay" account type
      And user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
     Then the "Data Sharing Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_title" textfield with "Datos compartidos" text is displayed
      And the "data_sharing_price" textfield with the "\d+,\d\d( | )€/mes" format is displayed
      And the "total_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "price_description" textfield with "Todos los datos de tus líneas móviles, sumados en una bolsa común de datos para compartir" text is displayed
      And the "hire_conditions_link" link with "Puedes descargar en PDF un resumen de condiciones de contratación." text is displayed
      And the "hire_conditions_text" textfield with "Son vinculantes si completas la compra en este momento" text is displayed
      And the "features_title" textfield with "Características" text is displayed
      And the "features_description" textfield is displayed
      And the "activate_button" button with "Activar" text is displayed
      And clicks on the "top_navigation_bar.back" button
      And the "Data Management" page is displayed

  @jira.QANOV-153346 @android @ios @jira.cv.12.8 @jira.link.parent_test_plan.QANOV-152294 @manual @mobile @moves
  @smoke @dv.Future
  Scenario: TELCO POSTPAY user with data sharing in deactivated status sees more information about "Data sharing"
    other_affected_versions="2022-06-B"
    Given user has a "telco postpay" account type
      And user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "services-summary" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
     Then the "Data Sharing Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_title" textfield with "Datos compartidos" text is displayed
      And the "data_sharing_price" textfield with the "\d+,\d\d( | )€/mes" format is displayed
      And the "total_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "price_description" textfield with "Todos los datos de tus líneas móviles, sumados en una bolsa común de datos para compartir" text is displayed
      And the "hire_conditions_link" link is not displayed
      And the "hire_conditions_text" textfield is not displayed
      And the "features_title" textfield with "Características" text is displayed
      And the "features_description" textfield is displayed
      And the "activate_button" button with "Activar" text is displayed
      And clicks on the "top_navigation_bar.back" button
      And the "Data Management" page is displayed

  @jira.QANOV-44994 @android @ios @jira.cv.11.15 @jira.link.parent_test_plan.QANOV-44930
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: LEGADO POSTPAY ADMIN user can access to the Hire Conditions PDF for the Data Management view
    other_affected_versions="2020-51"
    Given user has a "legado postpay" account type
      And user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "hire_conditions_link" link
     Then a pdf file is download from the "https://www.movistar.es/rpmm/estaticos/residencial/precontrato/res_261_Datos_Compartidos.pdf" url
      And the PDF file is opened after it is downloaded
      And clicks on the native "back" button
      And the "Data Sharing Management" page is displayed

  @jira.QANOV-26989 @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190447 @jira.link.relates_to.NOV-190448
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: User with data sharing in activated status sees more information about "Data sharing"
    Given user has a "legado postpay" account type
      And user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
     Then the "Data Sharing Management" page is displayed
      And the "Gestionar datos" header is displayed
      And the "data_sharing_title" textfield with "Datos compartidos" text is displayed
      And the "data_sharing_price" textfield with the "\d+,\d\d( | )€/mes" format is displayed
      And the "total_price" textfield with the "(-)?\d+,\d\d( | )€" format is displayed
      And the "price_description" textfield with "Todos los datos de tus líneas móviles, sumados en una bolsa común de datos para compartir" text is displayed
      And the "features_title" textfield with "Características" text is displayed
      And the "features_description" textfield is displayed
      And the "deactivate_button" button with "Desactivar" text is displayed
      And clicks on the "top_navigation_bar.back" button
      And the "Data Management" page is displayed

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190448 @jira.link.relates_to.NOV-190459
  @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user taps the button to deactivate Data Sharing in Data sharing info screen
    Given user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "deactivate_button" button
     Then the "Deactivate Data Sharing" popup is displayed
      And the "title" textfield with "Desactivar Datos Compartidos" text is displayed
      And the "message" textfield with "Recuerda que se desactivará para todos tus líneas" text is displayed
      And the "accept" button with "Confirmar" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

    @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-26990 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253030 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190448 @jira.link.relates_to.NOV-190450
  @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user taps the button to activate Data Sharing in Data sharing info screen
    Given user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
     Then the "Activate Data Sharing" popup is displayed
      And the "title" textfield with "Activar Datos Compartidos" text is displayed
      And the "message" textfield with "Recuerda que se desactivará Pago por uso y no podrás volver a activarlo hasta el próximo ciclo de facturación" text is displayed
      And the "accept" button with "Confirmar" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-26991 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253031 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190451 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user cancels the activation of Data sharing
    Given user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "cancel" button
     Then the "Data Sharing Management" page is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-26993 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253032 |

  @jira.QANOV-26994 @android @automation.hard @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190452
  @no_automatable @impeded_legacy @mobile @moves @smoke
  Scenario: User confirms the activation of Data sharing: success screen is displayed
    telco postpay flow migrated to: 'condiciones_contratacion.feature'
    Given user has a "legado postpay" account type
      And user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
     Then the "Feedback Success" page is displayed
      And the "positive_feedback_icon" icon is displayed
      And the "success_title" textfield with "Tu solicitud ha sido enviada con éxito" text is displayed
      And the "success_message" textfield with "En un plazo máximo de 24 horas recibirás un SMS con la confirmación" text is displayed
      And the "back_to_account" button with "Volver a mi cuenta" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

  @jira.QANOV-26995 @android @automation.hard @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190453
  @no_automatable @impeded_legacy @mobile @moves @regression
  Scenario: User goes back to account from the confirmation screen after having activated Data sharing
    telco postpay flow migrated to: 'condiciones_contratacion.feature'
    Given user has a "legado postpay" account type
      And user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "smart-actions-legado" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

  @jira.QANOV-26996 @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-193288 @mobile @moves @no_automatable
  @regression @dv.Future
  Scenario: User receives an email after Data sharing activation
    internal_checkpoint="NOTE: do not test in NEXT/PROD environments. Can be tested in CERT2 with any user, the email will be sent to systemtestnovum@gmail.com"
    Given user has a "postpay" account type
      And user has a "admin" role
      And user has just turned "data_sharing" service to "activated" status
     Then a new email is sent to the user eamil with "APP Movistar – Datos Compartidos – Activar" subject
      And the email text contains the "Hola, me gustaría activar datos compartidos para la línea [teléfono] cuyo titular es [DNI] de un usuario particular. Muchas gracias" text

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190458 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user taps the button to deactivate Data Sharing in Data management screen
    Given user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_deactivate.manage" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "deactivate_button" button
     Then the "Deactivate Data Sharing" popup is displayed
      And the "title" textfield with "Desactivar Datos Compartidos" text is displayed
      And the "message" textfield with "Recuerda que se desactivará para todos tus líneas" text is displayed
      And the "accept" button with "Confirmar" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-26997 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253033 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190462 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user cancels the deactivation of Data sharing
    Given user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_deactivate.manage" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "cancel" button
     Then the "Data Sharing Management" page is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-26998 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253034 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190460 @mobile @moves
  @regression
  Scenario Outline: A <account_type> postpay user confirms the deactivation of Data sharing: success screen is displayed
    Given user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_deactivate.manage" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "accept" button
     Then the "Feedback Success" page is displayed
      And the "positive_feedback_icon" icon is displayed
      And the "success_title" textfield with "Tu solicitud ha sido enviada con éxito" text is displayed
      And the "success_message" textfield with "En un plazo máximo de 24 horas recibirás un SMS con la confirmación" text is displayed
      And the "back_to_account" button with "Volver a mi cuenta" text is displayed
      And the "navigation_top_bar.back_button" button is not displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-26999 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253035 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190461 @mobile @moves
  @regression
  Scenario Outline: A <account_type> postpay user goes back to account from the confirmation screen after having deactivated Data sharing
    Given user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_deactivate.manage" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And the "Feedback Success" page is displayed
      And clicks on the "back_to_account" button
     Then the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27000 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253036 |

  @jira.QANOV-27001 @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-193289 @mobile @moves @no_automatable
  @regression @dv.Future
  Scenario: User receives an email after Data sharing deactivation
    internal_checkpoint="NOTE: do not test in NEXT/PROD environments. Can be tested in CERT2 with any user, the email will be sent to systemtestnovum@gmail.com"
    Given user has a "postpay" account type
      And user has a "admin" role
      And user has just turned "data_sharing" service to "deactivated" status
     Then a new email is sent to the user eamil with "APP Movistar – Datos Compartidos – Desactiva" subject
      And the email text contains the "Hola, me gustaría desactivar datos compartidos para la línea [teléfono] cuyo titular es [DNI] de un usuario particular. Muchas gracias" text

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190463 @mobile @moves
  @regression
  Scenario Outline: A <account_type> postpay user who updated the Data sharing status to deactivated in less than 24 hours, tries to update it again: informative screen is displayed
    Given the "data" allowance is limited in the "mobile_line" product
      And user has just turned "data_sharing" service to "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
     Then the "Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Estamos gestionando tu solicitud" text is displayed
      And the "informative_message" textfield with "En un plazo máximo de 24 horas recibirás un SMS con la confirmación." text is displayed
      And the "informative_button" button with "Volver" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Management" page is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27002 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253037 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.7 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user who updated the Data sharing status to activated in less than 24 hours, tries to update it again: informative screen is displayed
    Given the "data" allowance is limited in the "mobile_line" product
      And user has just turned "data_sharing" service to "activated" status
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_deactivate.manage" button
     Then the "Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "informative_title" textfield with "Estamos gestionando tu solicitud" text is displayed
      And the "informative_message" textfield with "En un plazo máximo de 24 horas recibirás un SMS con la confirmación." text is displayed
      And the "informative_button" button with "Volver" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Management" page is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27003 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253038 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190464 @mobile @moves
  @regression
  Scenario Outline: A <account_type> postpay user goes back to account from the informative screen when there was an update request in less than 24 hours
    Given the "data" allowance is limited in the "mobile_line" product
      And user has just turned "data_sharing" service to "deactivated" status
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
      And the "Informative Feedback" page is displayed
      And clicks on the "informative_button" button
     Then the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27004 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253039 |

  @jira.<jira_id> @android @automation.hard @ios @jira.cv.11.7 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user goes back to account from the informative screen when there was an update request in less than 24 hours
    Given the "data" allowance is limited in the "mobile_line" product
      And user has just turned "data_sharing" service to "activated" status
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_deactivate.manage" button
      And the "Informative Feedback" page is displayed
      And clicks on the "informative_button" button
     Then the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27005 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253040 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190455
  @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user activates the Data sharing and an error occurs: screen error is displayed
    Given user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And an error happens during the operation
     Then the "Feedback Error" page is displayed
      And the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield with "No hemos podido completar tu solicitud" text is displayed
      And the "negative_feedback_subtitle" textfield with "Puedes internarlo de nuevo más tarde, disculpa las molestias." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back_to_account" button with "Volver a mi cuenta" text is displayed
      And clicks on the "back_to_account" button
      And the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27006 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253041 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user deactivates the Data sharing and an error occurs: screen error is displayed
    Given user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_deactivate.manage" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And an error happens during the operation
     Then the "Feedback Error" page is displayed
      And the "negative_feedback_icon" icon is displayed
      And the "negative_feedback_title" textfield with "No hemos podido completar tu solicitud" text is displayed
      And the "negative_feedback_subtitle" textfield with "Puedes internarlo de nuevo más tarde, disculpa las molestias." text is displayed
      And the "retry" button with "Reintentar" text is displayed
      And the "back_to_account" button with "Volver a mi cuenta" text is displayed
      And clicks on the "back_to_account" button
      And the "Dashboard" page is displayed
      And the "Mis Productos" header is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27007 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253042 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @jira.link.relates_to.NOV-190457
  @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user retries the update of Data sharing service when there was an error
    Given user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And clicks on the "activate_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And an error happens during the operation
      And the "Feedback Error" page is displayed
      And clicks on the "retry" button
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27008 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253043 |

  @jira.<jira_id> @android @ios @jira.cv.11.7 @mobile @moves @regression
  Scenario Outline: A <account_type> postpay user retries the update of Data sharing service when there was an error
    Given user has "data_sharing" service in "activated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user has the matching subscription selected in the account
      And user has the "<module_id>" module configured in CMS for "dashboard" page for the "mobile" product
      And user is in the "Data Management" page
     When clicks on the "data_sharing_deactivate.manage" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And an error happens during the operation
      And the "Feedback Error" page is displayed
      And clicks on the "retry" button
     Then the "Data Management" page is displayed
      And the "Gestionar datos" header is displayed

    @manual @dv.Future
    Examples:
          | account_type | module_id        | jira_id     |
          | telco        | services-summary | QANOV-27009 |

    @impeded_legacy @no_automatable
    Examples:
          | account_type | module_id            | jira_id      |
          | legado       | smart-actions-legado | QANOV-253044 |
