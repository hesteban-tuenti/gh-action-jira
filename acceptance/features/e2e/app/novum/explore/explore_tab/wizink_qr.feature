# -*- coding: utf-8 -*-
@jira.QANOV-407112
Feature: WiZink QR

  Actions Before the Feature:
    Given user has the "QR Wizink" card in a Explore module


  @jira.QANOV-407113 @android @ber @ios @jira.cv.Future @manual @mobile @o2es @sanity
  Scenario: User can access WiZink QR entrypoint in Explore tab
    Given user is in the "Explore" page
      And user has the "QR Wizink" card in a Explore module
     When searches the "card"
      And clicks on the "wizink_qr" link of the card
     Then the "Wizink QR" page is displayed
      And the "QR Wizink" header is displayed
      And the "title" textfield with "Muestra este QR en WiZink Center y tendrás:" text is displayed
      And the "qr_image" image is displayed
      And each element in the "wizink_qr_list" list has the "check" field
      And the "wizink_qr_list" list with "Ropero gratis para ti y un acompañante.;10% de descuento en consumiciones.;Acceso rápido en eventos seleccionados para ti y un acompañante por c/ Fuente del Berro." textfields is displayed
      And the "wizink_qr_button" button with "Descubre más detalles" text is displayed
      And clicks on the "navigation_top_bar.close_button" button
      And the "Explore" page is displayed

  @jira.QANOV-407114 @android @ios @jira.cv.Future @manual @mobile @o2es @regression
  Scenario: User can enter to More Details webview
    Given user is in the "Wizink QR" page
     When clicks on the "wizink_qr_button" button
     Then the external webview is displayed
      And clicks on the "native_back_button" button
      And the "Wizink QR" page is displayed
