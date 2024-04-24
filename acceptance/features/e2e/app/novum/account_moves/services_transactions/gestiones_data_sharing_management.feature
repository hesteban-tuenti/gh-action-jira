# -*- coding: utf-8 -*-
@jira.QANOV-618972
Feature: Data sharing management


  @jira.QANOV-618973 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @sanity
  Scenario: TELCO POSTPAY user with data sharing in deactivated status can access to the "Data Sharing Details" page is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "deactivated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
     Then the "Data Sharing Management" page is displayed
      And the "Datos compartidos" header is displayed
      And the "title" textfield with "Gestión de datos compartidos" text is displayed
      And the "subtitle" textfield with "Todos los datos de tus líneas móviles, sumados en una bolsa común de datos para compartir." text is displayed
      And the "description_header" textfield with "DETALLES" text is displayed
      And the "description" textfield with the "Al activar servicio de datos compartidos, la franquicia de datos de cada una de tus líneas se suma en una gran bolsa común de datos compartida a consumir entre todas tus líneas con contrato compatible bajo el mismo titular." format is displayed
      And the "description" textfield with the "Si tienes líneas con datos compartidos ilimitados, cada contrato determina la franquicia de datos aportando a la bolsa compartida." format is displayed
      And the "description" textfield with the "El servicio no es compatible con la característica de pago por uso." format is displayed
      And the "description" textfield with the "Se podrá realizar un máximo de 3 activaciones anuales. " format is displayed
      And the "total" textfield with "Total (IVA incl.)" text is displayed
      And the "price" textfield with the "0,00( | )€/mes" format is displayed
      And the "manage_button" button with "Activar" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-618974 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @smoke
  Scenario: A telco postpay user tries to activate Data Sharing: "Activate Data Sharing" popup is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "deactivated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Activate Data Sharing" popup is displayed
      And the "title" textfield with "Activar Datos Compartidos" text is displayed
      And the "message" textfield with "Recuerda que solo se permiten tres activaciones al año y que, si tienes Pago por uso, se desactivará automáticamente. " text is displayed
      And the "accept" button with "Confirmar" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.QANOV-618975 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user cancels the activation of Data sharing
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "deactivated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "cancel" button
     Then the "Data Sharing Management" page is displayed

  @jira.QANOV-618976 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user accepts the activation of Data sharing: "Contact Email Change In Contract Conditions" page is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "deactivated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
     Then the "Contact Email Change In Contract Conditions" page is displayed
      And the "Email de contacto" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Sharing Management" page is displayed

  @jira.QANOV-618977 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user finish the activation of Data sharing: Success Feedback screen is displayed
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to activate this service
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "deactivated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And the "Contact Email Change In Contract Conditions" page is displayed
      And finish the activation process
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "¡Listo!" text is displayed
      And the "message" textfield with "En breves momentos recibirás un SMS indicando que tus datos compartidos ya se han activado." text is displayed
      And the "button" button with "Volver" text is displayed

  @jira.QANOV-618978 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user goes back to dashboard after having activated Data Sharing
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to activate this service
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "deactivated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And the "Contact Email Change In Contract Conditions" page is displayed
      And finish the activation process
      And the "Feedback Success" page is displayed
      And clicks on the "button" button
     Then the "Data Sharing Management" page is displayed
      And the "Datos compartidos" header is displayed

  @jira.QANOV-618979 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user can see the Data Sharing activated after the activation
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to activate this service
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "deactivated" status
     When finish the data sharing activation process
      And waits until the change applies
      And the "Data Sharing Management" page is displayed
     Then the "manage_button" button with "Desactivar" text is displayed

  @jira.QANOV-618980 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @sanity
  Scenario: TELCO POSTPAY user with data sharing in activated status can access to the "Data Sharing Details" page is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
     Then the "Data Sharing Management" page is displayed
      And the "Datos compartidos" header is displayed
      And the "title" textfield with "Gestión de datos compartidos" text is displayed
      And the "subtitle" textfield with "Todos los datos de tus líneas móviles, sumados en una bolsa común de datos para compartir." text is displayed
      And the "description_header" textfield with "DETALLES" text is displayed
      And the "description" textfield with the "Al activar servicio de datos compartidos, la franquicia de datos de cada una de tus líneas se suma en una gran bolsa común de datos compartida a consumir entre todas tus líneas con contrato compatible bajo el mismo titular." format is displayed
      And the "description" textfield with the "Si tienes líneas con datos compartidos ilimitados, cada contrato determina la franquicia de datos aportando a la bolsa compartida." format is displayed
      And the "description" textfield with the "El servicio no es compatible con la característica de pago por uso." format is displayed
      And the "description" textfield with the "Se podrá realizar un máximo de 3 activaciones anuales." format is displayed
      And the "total" textfield with "Total (IVA incl.)" text is displayed
      And the "price" textfield with the "0,00( | )€/mes" format is displayed
      And the "manage_button" button with "Desactivar" text is displayed
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-618981 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @smoke
  Scenario: A telco postpay user tries to deactivate Data Sharing: "Deactivate Data Sharing" popup is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Deactivate Data Sharing" popup is displayed
      And the "title" textfield with "Desactivar Datos Compartidos" text is displayed
      And the "message" textfield with "Recuerda que se desactivará para todas tus líneas" text is displayed
      And the "accept" button with "Confirmar" text is displayed
      And the "cancel" button with "Cancelar" text is displayed

  @jira.QANOV-618982 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user cancels the deactivation of Data sharing
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "cancel" button
     Then the "Data Sharing Management" page is displayed

  @jira.QANOV-618983 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user finish the deactivation of Data sharing: Success Feedback screen is displayed
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to activate this service
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "accept" button
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "¡Listo!" text is displayed
      And the "message" textfield with "En breves momentos recibirás un SMS indicando que tus datos compartidos ya se han desactivado." text is displayed
      And the "button" button with "Volver" text is displayed

  @jira.QANOV-618984 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user goes back to dashboard after having deactivated Data Sharing
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to activate this service
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Activate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And the "Feedback Success" page is displayed
      And clicks on the "button" button
     Then the "Data Sharing Management" page is displayed
      And the "Datos compartidos" header is displayed

  @jira.QANOV-618985 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user can see the Data Sharing deactivated after the deactivation
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to activate this service
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "activated" status
     When finish the data sharing deactivation process
      And waits until the change applies
      And the "Data Sharing Management" page is displayed
     Then the "manage_button" button with "Activar" text is displayed

  @jira.QANOV-618986 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user tries the deactivation of Data sharing but an error happens: Ko Feedback screen is displayed
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to activate this service
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And an error happens
     Then the "Feedback Ko" page is displayed
      And the "Datos compartidos" header is displayed
      And the "ko_icon" icon is displayed
      And the "title" textfield with "Ha ocurrido un error" text is displayed
      And the "message" textfield with "La desactivación de tus datos compartidos no se ha podido realizar. Inténtelo de nuevo más tarde." text is displayed
      And the "button" button with "Reintentar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Sharing Management" page is displayed

  @jira.QANOV-618987 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user confirms the deactivation of Data sharing but an error happens: Can retry from the KO page
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And user has "data_sharing" service in "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Deactivate Data Sharing" popup is displayed
      And clicks on the "accept" button
      And an error happens
      And the "Feedback KO" page is displayed
      And clicks on the "button" button
      And no error happens during the proccess
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "¡Listo!" text is displayed
      And the "message" textfield with "En breves momentos recibirás un SMS indicando que tus datos compartidos ya se han desactivado." text is displayed
      And the "button" button with "Volver" text is displayed

  @jira.QANOV-618988 @android @automation.hard @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user who updated the Data sharing status to activated in less than 24 hours, tries to update it again: informative screen is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And the "data" allowance is limited in the "mobile_line" product
      And user has just turned "data_sharing" service to "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Informative Feedback" page is displayed
      And the "informative_icon" icon is displayed
      And the "title" textfield with "Estamos gestionando tu solicitud" text is displayed
      And the "message" textfield with "En un plazo máximo de 24 horas recibirás un SMS con la confirmación." text is displayed
      And the "button" button with "Volver" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Sharing Management" page is displayed

  @jira.QANOV-618989 @android @automation.hard @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user goes back to account from the informative screen when there was an update request in less than 24 hours
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has ">1" products of "mobile_line" type
      And the "data" allowance is limited in the "mobile_line" product
      And user has just turned "data_sharing" service to "activated" status
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "manage_button" button
      And the "Informative Feedback" page is displayed
      And clicks on the "button" button
     Then the "Data Sharing Management" page is displayed
      And the "Datos compartidos" header is displayed

  @jira.QANOV-618990 @android @automation.hard @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user activates the Data sharing and an error happens: screen error is displayed
    Given user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And finish the activation flow
      And an error happens during the operation
     Then the "Feedback Ko" page is displayed
      And the "Datos compartidos" header is displayed
      And the "ko_icon" icon is displayed
      And the "title" textfield with "Ha ocurrido un error" text is displayed
      And the "message" textfield with "La activación de tus datos compartidos no se ha podido realizar. Inténtelo de nuevo más tarde." text is displayed
      And the "button" button with "Reintentar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Sharing Management" page is displayed

  @jira.QANOV-618991 @android @automation.hard @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user activates the Data sharing and an error happens: Can retry from the KO page
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has "data_sharing" service in "deactivated" status
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_sharing_entrypoint" button
      And the "Data Sharing Management" page is displayed
      And clicks on the "more_info_data_sharing" link
      And the "Data Sharing Management" page is displayed
      And finish the activation flow
      And an error happens during the operation
      And the "Feedback KO" page is displayed
      And clicks on the "button" button
      And no error happens during the proccess
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "¡Listo!" text is displayed
      And the "message" textfield with "En breves momentos recibirás un SMS indicando que tus datos compartidos ya se han activado." text is displayed
      And the "button" button with "Volver" text is displayed
