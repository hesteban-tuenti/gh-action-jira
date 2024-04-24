# -*- coding: utf-8 -*-
@jira.QANOV-492976
Feature: Extra Packs

  Actions Before each Scenario:
    Given user has "mobile" product
      And user is in the "Mobile Dashboard" page


  @jira.QANOV-492977 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A mobile user can see a list of the available extra data packs to buy
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
     Then the "Buy Bundle" internal webview is displayed
      And the "Bonos disponibles" header is displayed
      And the "description" textfield with "Elige el bono que quieres y pulsa en el botón “Comprar” para activarlo. Podrás disfrutar del bono hasta el día 17 por la noche, coincidiendo con el fin del ciclo de facturación." text is displayed
      And the "extra_packs" list is displayed
      And each element in the "extra_packs" list has the "title" textfield with the "Bono extra de \d+ GB" format
      And each element in the "extra_packs" list has the "amount" textfield with the "\d+,\d\d€ IVA incluido" format
      And each element in the "extra_packs" list has the "more_info" link with "Más información" text
      And each element in the "extra_packs" list has the "radiobutton" field
      And the "buy_button" button is not displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Dashboard" page is displayed

  @jira.QANOV-492978 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user can see more info about an extra pack
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "more_info" field of "extra_packs" list with "0" index
     Then the "Bundle Info" internal webview is displayed
      And the "title" textfield with "Las características de este bono son:" text is displayed
      And the "more_info" entrypoint with "Más información en la web" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "Buy Bundle" page is displayed

  @jira.QANOV-492979 @android @ios @jira.cv.Future @manual @mobile @o2es @regression @tbd
  Scenario: A mobile user can see more info in the OB web about an extra pack
    tbd how the WV will open
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "more_info" field of "extra_packs" list with "0" index
      And the "Bundle Info" internal webview is displayed
      And clicks on the "more_info" entrypoint
     Then the browser webview is displayed

  @jira.QANOV-492980 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A mobile user can see the summary price for extra pack
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "radiobutton" field of "extra_packs" list with "0" index
     Then the "buy_button" button with "Comprar" text is displayed
      And the "total_price_text" textfield with "Total (IVA incl.)" text is displayed
      And the "total_price_amount" textfield with the "\d+, \d\d€" format is displayed

  @jira.QANOV-492981 @android @ios @jira.cv.Future @manual @mobile @o2es @smoke
  Scenario: A mobile user buys an extra data pack: A confirmation popup is displayed
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
     Then the "Confirm Buy Bundle" popup is displayed
      And the "popup.title" textfield with "¿Seguro que quieres comprar este bono extra?" text is displayed
      And the "popup.text" textfield with "Podrás utilizarlo hasta el último día de tu ciclo de facturación" text is displayed
      And the "popup.accept" button with "Comprar" text is displayed
      And the "popup.cancel" button with "Cancelar" text is displayed

  @jira.QANOV-492982 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user cancels the process to buy an extra pack: User goes back to the Buy Bundle page
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
      And the "Confirm Buy Bundle" popup is displayed
      And clicks on the "popup.cancel" button
     Then the "Confirm Buy Bundle" popup is not displayed
      And the "Buy Bundle" internal webview is displayed

  @jira.QANOV-492983 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A mobile user successfully buys an extra pack: Feedback screen is displayed
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
      And the "Confirm Buy Bundle" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Extra Bundle Feedback" page is displayed
      And the "check_icon" icon is displayed
      And the "title" textfield with "Estamos activando tu bono" text is displayed
      And the "text" textfield with "En unos minutos recibirás un SMS de confirmación y lo verás activo en Mi O2." text is displayed
      And the "accept_button" button with "Entendido" text is displayed

  @jira.QANOV-492984 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user that successfully buys an extra pack can go back to the Mobile Dashboard page
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
      And the "Confirm Buy Bundle" popup is displayed
      And clicks on the "popup.accept" button
      And the "Extra Bundle Feedback" page is displayed
      And clicks on the "accept_button" button
     Then the "Mobile Dashboard" page is displayed

  @jira.QANOV-492985 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user buys an extra pack: An error during the purchase occurs
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
      And the "Confirm Buy Bundle" popup is displayed
      And clicks on the "popup.accept" button
      And an error occurs
     Then the "Extra Bundle Feedback" page is displayed
      And the "warning_icon" icon is displayed
      And the "title" textfield with "Tu bono extra no se ha activado" text is displayed
      And the "text" textfield with "Puedes intentarlo más tarde o llamar al 1551." text is displayed
      And the "accept_button" button with "Entendido" text is displayed

  @jira.QANOV-492986 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user can go back to the Mobile Dashboard screen after an error occurs during the purchase
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
      And the "Confirm Buy Bundle" popup is displayed
      And clicks on the "popup.accept" button
      And an error occurs
      And the "Extra Bundle Feedback" page is displayed
      And clicks on the "accept_button" button
     Then the "Mobile Dashboard" page is displayed

  @jira.QANOV-492987 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user buys an extra pack: A API error occurs
    Given user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
      And the "Confirm Buy Bundle" popup is displayed
      And clicks on the "popup.accept" button
      And an error occurs
     Then the "Extra Bundle Feedback" page is displayed
      And the "warning_icon" icon is displayed
      And the "title" textfield with "Algo ha ido mal" text is displayed
      And the "text" textfield with "El contenido de esta página no se puede mostrar. Por favor, inténtalo de nuevo más tarde." text is displayed

  @jira.QANOV-492988 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user with > 4 extra packs buys another extra pack: An error occurs
    Given user has ">4" extra packs
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
      And the "Confirm Buy Bundle" popup is displayed
      And clicks on the "popup.accept" button
     Then the "Extra Bundle Feedback" page is displayed
      And the "warning_icon" icon is displayed
      And the "title" textfield with "Has comprado todos los bonos disponibles para este ciclo" text is displayed
      And the "text" textfield with "Podrás volver a comprar bonos extra en el próximo ciclo de facturación." text is displayed
      And the "accept_button" button with "Entendido" text is displayed

  @jira.QANOV-492989 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: A mobile user with > 4 extra packs that buys another extra pack can go back to the Mobile Dashboard screen after an error occurs
    Given user has ">4" extra packs
      And user has the "Bundle Purchase Card" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "bundle_purchase_card.button" button
      And the "Buy Bundle" internal webview is displayed
      And clicks on the "buy_button" button
      And the "Confirm Buy Bundle" popup is displayed
      And clicks on the "popup.accept" button
      And the "Extra Bundle Feedback" page is displayed
      And clicks on the "accept_button" button
     Then the "Mobile Dashboard" page is displayed

  @jira.QANOV-492990 @android @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: A mobile user can see the active bundles for his/her mobile line
    Admin light users will see the current comercial price of the bundle due to API limitations.
    Given user has the "Services List" module configured in CMS for "Mobile Dashboard" page
     When user clicks on the "services_module.active_bundles" button
     Then the "Active Packs" page is displayed
      And the "Consultar bonos extra" header is displayed
      And the "cycle_header" textfield with the "Ciclo del \d\d (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic) - \d\d (ene|feb|mar|abr|may|jun|jul|ago|sep|oct|nov|dic)" format is displayed
      And the "text" textfield with "Estos son los bonos extra de datos que has activado durante este ciclo:" text is displayed
      And the "text" textfield with the "LÍNEA .* - \d\d\d \d\d \d\d \d\d" format is displayed
      And the "active_bundles" list is displayed
      And each element in the "active_bundles" list has the "title" textfield with the "Bono extra de \d+ GB" format
      And each element in the "active_bundles" list has the "expiry_date" textfield with the "Este bono caduca en \d días" format
      And each element in the "active_bundles" list has the "price" textfield with the "\d+,\d\d €" format
      And clicks on the "navigation_top_bar.back_button" button
      And the "Mobile Dashboard" page is displayed
