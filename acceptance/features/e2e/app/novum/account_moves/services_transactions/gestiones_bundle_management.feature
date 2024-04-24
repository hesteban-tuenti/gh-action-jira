# -*- coding: utf-8 -*-
@jira.QANOV-618948
Feature: Gestiones Bundle Management


  @jira.QANOV-618949 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @sanity @tbd
  Scenario: A telco user with prepay lines taps on the data bundle entrypoint: OB webview is displayed
    Given user has a "telco prepay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
     Then the browser webview with "TBD" text in the header is displayed
      And the "TBD" string is displayed

  @jira.QANOV-618950 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @sanity
  Scenario: A telco postpay user with extra data offers can access to the data management page
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
     Then the "Data Management" page is displayed
      And the "Bono de datos" header is displayed
      And the "title" textfield with "Bono de datos adicionales" text is displayed
      And the "description" textfield that contains the "Puedes complementar tu tarifa mensual con datos adicionales para seguir navegando a máxima velocidad." text is displayed
      And the "description" textfield that contains the "Datos a máxima velocidad" text is displayed
      And the "description" textfield that contains the "Se sumarán al total de datos de tu tarifa" text is displayed
      And the "description" textfield that contains the "Precio final al mes. Iva incluido" text is displayed
      And the "description" textfield that contains the "Sin permanencia. Desactívalo cuando quieras" text is displayed
      And each element in the "bundle_list" list has the "name" field
      And each element in the "bundle_list" list has the "price" textfield with the "\d+(,\d\d)?( | )€/mes" format
      And each element in the "bundle_list" list has the "chevron" field
      And the "navigation_top_bar.back_button" button is displayed

  @jira.QANOV-618951 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @smoke
  Scenario: A telco postpay user with extra data promotional offers can access to the data management page and see a "Promo" label
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has a promotional extra data offer available
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
     Then the "Data Management" page is displayed
      And the "Bono de datos" header is displayed
      And any element in the "bundle_list" list has the "label" textfield with the "Promo" text

  @jira.QANOV-618952 @android @ber @e2e @ios @jira.cv.24.3 @manual @mobile @moves @smoke
  Scenario: A telco postpay user with an extra data purchased can access to the data management page and see a "Activo" label
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "any" data bundle purchased
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
     Then the "Data Management" page is displayed
      And the "Bono de datos" header is displayed
      And any element in the "bundle_list" list has the "label" textfield with the "Activo" text

  @jira.QANOV-618953 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user can see more information about a data bundle to 'Contratar'
    other_affected_versions="2022-05 2022-06-B"
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "none" data bundle purchased
      And user has extra data offers available
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
     Then the "Bundle Management" page is displayed
      And the "Bono de datos" header is displayed
      And the "alert" module is not displayed
      And the "title" textfield with the "Extra .* GB" format is displayed
      And the "description_header" textfield with "DETALLES DE LA TARIFA" text is displayed
      And the "description" textfield is displayed
      And the "total" textfield with "Total (IVA incl.)" text is displayed
      And the "price" textfield with the "(-)?\d+,\d\d( | )€/mes" format is displayed
      And the "manage_button" button with "Activar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Management" page is displayed

  @jira.QANOV-618954 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user can see more information about a data bundle to 'Dar de baja'
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "any" data bundle purchased
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for an activated bundle of the "bundle_list" list
     Then the "Bundle Management" page is displayed
      And the "Bono de datos" header is displayed
      And the "alert" module is not displayed
      And the "title" textfield with the "Extra .* GB" format is displayed
      And the "description_header" textfield with "DETALLES DE LA TARIFA" text is displayed
      And the "description" textfield is displayed
      And the "total" textfield with "Total (IVA incl.)" text is displayed
      And the "price" textfield with the "(-)?\d+,\d\d( | )€/mes" format is displayed
      And the "manage_button" button with "Desactivar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Management" page is displayed

  @jira.QANOV-618955 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user can see more information about a data bundle to 'Replace'
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "any" data bundle purchased
      And user has extra data offers available
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
     Then the "Bundle Management" page is displayed
      And the "Bono de datos" header is displayed
      And the "alert" module is displayed
      And the "alert.icon" icon is displayed
      And the "alert.title" textfield with "Ya tienes un paquete activo" text is displayed
      And the "alert.description" textfield with the "Al contratar este paquete se desactivará tu paquete actual .*" format is displayed
      And the "title" textfield with the "Extra .* GB" format is displayed
      And the "description_header" textfield with "DETALLES DE LA TARIFA" text is displayed
      And the "description" textfield is displayed
      And the "total" textfield with "Total (IVA incl.)" text is displayed
      And the "price" textfield with the "(-)?\d+,\d\d( | )€/mes" format is displayed
      And the "manage_button" button with "Activar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Data Management" page is displayed

  @jira.QANOV-618956 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @smoke
  Scenario: A telco postpay user tries to subscribe a data bundle: 'Contact Email Change In Contract Conditions' page is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user has the "none" data bundle purchased
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Contact Email Change In Contract Conditions" page is displayed
      And the "Email de contacto" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Management" page is displayed

  @jira.QANOV-618957 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user finish the subscription process for a data bundle: Success Feedback screen is displayed
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user has the "none" data bundle purchased
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Contact Email Change In Contract Conditions" page is displayed
      And finish the subscription process
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "¡Listo!" text is displayed
      And the "message" textfield with "En breves momentos recibirás un SMS indicando que ya puedes disfrutar de tus datos adicionales." text is displayed
      And the "button" button with "Volver" text is displayed

  @jira.QANOV-618958 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user goes back to dashboard after having subscribed a data bundle
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user has the "none" data bundle purchased
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Contact Email Change In Contract Conditions" page is displayed
      And finish the subscription process
      And the "Feedback Success" page is displayed
      And clicks on the "button" button
     Then the "Data Management" page is displayed
      And the "Bono de datos" header is displayed

  @jira.QANOV-618959 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user can see the subscribed data bundle after the purchase
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user has the "none" data bundle purchased
     When finish the bundle subscription process
      And waits until the change applies
      And the "Bundle Management" page is displayed
     Then the "Activo" label is displayed on the purchased data bundle

  @jira.QANOV-618960 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @smoke
  Scenario: A telco postpay user tries the unsubscription of a data bundle: 'Unsubscribe Data Bundle' popup is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "any" data bundle purchased
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for an activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Unsubscribe Data Bundle" popup is displayed
      And the "title" textfield with "¿Dar de baja el paquete?" text is displayed
      And the "message" textfield with "La baja del paquete será efectiva a partir del siguiente ciclo de facturación" text is displayed
      And the "cancel" button with "Ahora no" text is displayed
      And the "accept" button with "Dar de baja" text is displayed

  @jira.QANOV-618961 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user cancels the unsubscription of a data bundle
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "any" data bundle purchased
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for an activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Unsubscribe Data Bundle" popup is displayed
      And clicks on the "cancel" button
     Then the "Unsubscribe Data Bundle" popup is not displayed
      And the "Data Management" page is displayed

  @jira.QANOV-618962 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user confirms the unsubscription of a data bundle but an error happens: KO feedback is displayed
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "any" data bundle purchased
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for an activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Unsubscribe Data Bundle" popup is displayed
      And clicks on the "accept" button
      And an error happens during the proccess
     Then the "Feedback KO" page is displayed
      And the "Bono de datos" header
      And the "ko_icon" icon is displayed
      And the "title" textfield with "Ha ocurrido un error" text is displayed
      And the "message" textfield with "La descativación de tu bono de datos no se ha podido realizar. Inténtelo de nuevo más tarde." text is displayed
      And the "button" button with "Reintentar" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Management" page is displayed

  @jira.QANOV-618963 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user confirms the unsubscription of a data bundle but an error happens: Can retry from the KO page
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "any" data bundle purchased
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for an activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Unsubscribe Data Bundle" popup is displayed
      And clicks on the "accept" button
      And an error happens during the proccess
      And the "Feedback KO" page is displayed
      And clicks on the "button" button
      And no error happens during the proccess
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "¡Listo!" text is displayed
      And the "message" textfield with "En breves momentos recibirás un SMS indicando que tu bono de datos ya se ha desactivado." text is displayed
      And the "button" button with "Volver" text is displayed

  @jira.QANOV-618964 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user confirms the unsubscription of a data bundle: unsubscription is done
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "any" data bundle purchased
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for an activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Unsubscribe Data Bundle" popup is displayed
      And clicks on the "accept" button
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "¡Listo!" text is displayed
      And the "message" textfield with "En breves momentos recibirás un SMS indicando que tu bono de datos ya se ha desactivado." text is displayed
      And the "button" button with "Volver" text is displayed

  @jira.QANOV-618965 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user goes back to dashboard after having unsuscribed a data bundle
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has the "any" data bundle purchased
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for an activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Unsubscribe Data Bundle" popup is displayed
      And clicks on the "accept" button
      And the "Feedback Success" page is displayed
      And clicks on the "button" button
     Then the "Data Management" page is displayed
      And the "Bono de datos" header is displayed

  @jira.QANOV-618966 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user can see the unsubscribed data bundle after the cancellation
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has the "any" data bundle purchased
     When finish the bundle unubscription process
      And waits until the change applies
      And the "Bundle Management" page is displayed
     Then the "Activo" label is not displayed on the unsubscribed data bundle

  @jira.QANOV-618967 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @smoke
  Scenario: A telco postpay user tries to replace a data bundle: 'Contact Email Change In Contract Conditions' page is displayed
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user has the "any" data bundle purchased
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
     Then the "Contact Email Change In Contract Conditions" page is displayed
      And the "Email de contacto" header is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Bundle Management" page is displayed

  @jira.QANOV-618968 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user finish the replace process for a data bundle: Success Feedback screen is displayed
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user has the "any" data bundle purchased
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Contact Email Change In Contract Conditions" page is displayed
      And finish the subscription process
     Then the "Feedback Success" page is displayed
      And the "success_icon" icon is displayed
      And the "title" textfield with "¡Listo!" text is displayed
      And the "message" textfield with "En breves momentos recibirás un SMS indicando que ya puedes disfrutar de tus datos adicionales." text is displayed
      And the "button" button with "Volver" text is displayed

  @jira.QANOV-618969 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user goes back to dashboard after having replaced a data bundle
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user has the "any" data bundle purchased
      And user is in the "Gestiones" page
     When clicks on the "data_bundle_entrypoint" button
      And selects the matching line in the line disambiguation page
      And the "Data Management" page is displayed
      And clicks on the "chevron" button for a non activated bundle of the "bundle_list" list
      And the "Bundle Management" page is displayed
      And clicks on the "manage_button" button
      And the "Contact Email Change In Contract Conditions" page is displayed
      And finish the subscription process
      And the "Feedback Success" page is displayed
      And clicks on the "button" button
     Then the "Data Management" page is displayed
      And the "Bono de datos" header is displayed

  @jira.QANOV-618970 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user can see the replaced data bundle after the purchase
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has extra data offers available
      And user has the "any" data bundle purchased
     When finish the bundle replace process
      And waits until the change applies
      And the "Bundle Management" page is displayed
     Then the "Activo" label is displayed on the replaced data bundle

  @jira.QANOV-618971 @android @e2e @ios @jira.cv.24.3 @manual @mobile @moves @regression
  Scenario: A telco postpay user cannot see the promo label if purchases a data bundle with this tag
    IMPORTANT: in PROD/NEXT/CERT2, you can only use FIC users to manage packages
    Given user has a "telco postpay" account type
      And user has a "any_admin" role
      And user has a "mobile_line" product
      And the "data" allowance is limited in the "mobile_line" product
      And user has a promotional extra data offer available
      And user has the "any" data bundle purchased
     When finish the bundle subscription process for the promotional bundle
      And waits until the change applies
      And the "Bundle Management" page is displayed
     Then the "Activo" label is displayed on the promotional data bundle
     Then the "Promo" label is not displayed on the promotional data bundle
