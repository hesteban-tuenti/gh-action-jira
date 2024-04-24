# -*- coding: utf-8 -*-
@jira.QANOV-127082
Feature: Invoices Legacy


  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.7
  @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-2357
  @jira.link.relates_to.NOV-886 @sanity @vivobr @old_app
  Scenario Outline: Legacy user with the last invoice available can access to the "Conta" tab
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill available
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
     When clicks on the "bills_tab" tab
     Then the "BillsV1" page is displayed
      And the "last_bill" module is displayed
      And the "bills_settings" module is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3883 |
          | legacy postpay | QANOV-3884 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.7
  @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-2357
  @jira.link.relates_to.NOV-886 @sanity @vivobr @old_app
  Scenario Outline: Legacy user with the last invoice unavailable can access to the "Conta" tab
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill unavailable
      And user has the matching subscription selected in the account
      And user is in the "AccountV1" page
     When clicks on the "bills_tab" tab
     Then the "BillsV1" page is displayed
      And the "last_bill" module is not displayed
      And the "bills_settings" module is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3885 |
          | legacy postpay | QANOV-3886 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.7
  @jira.link.depends_on.QANOV-3884 @jira.link.parent_test_plan.QANOV-21950 @smoke @vivobr @old_app
  Scenario Outline: Legacy user can see the last invoice when available
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     Then the "last_bill" module is displayed
      And the "last_bill.more_options_button" button is displayed
      And the "last_bill.amount_textfield" textfield with the "R\$ -?\d+(?:.\d+)*,\d\d" format is displayed
      And the "last_bill.barcode_button" button with "Código de barras" text is displayed
      And the "last_bill.details_button" button with "2ª via detalhada" text is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3887 |
          | legacy postpay | QANOV-3888 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.7 @old_app
  @jira.link.depends_on.QANOV-3884 @jira.link.depends_on.QANOV-3886 @jira.link.parent_test_plan.QANOV-21950 @smoke @vivobr
  Scenario Outline: Legacy user can see the paid invoices when available
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the paid bills available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     Then the "paid_bills" module is displayed
      And the "paid_bills.title_textfield" textfield with "Contas já pagas" text is displayed
      And the "paid_bills.list" list is displayed
      And each element in the "paid_bills.list" list has the "month" field
      And each element in the "paid_bills.list" list has the "amount" field
      And each element in the "paid_bills.list" list has the "previous_amount" field

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3889 |
          | legacy postpay | QANOV-3890 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.7 @old_app
  @jira.link.depends_on.QANOV-3884 @jira.link.depends_on.QANOV-3886 @jira.link.parent_test_plan.QANOV-21950
  @jira.link.parent_test_plan.QANOV-24947 @jira.link.relates_to.NOV-2357 @jira.link.relates_to.NOV-886 @smoke @vivobr
  Scenario Outline: Legacy user can see the configuration services for the invoices
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the digital invoice service in "<digital_invoice_status>" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     Then the "bills_settings" module is displayed
      And the "bills_settings.title_textfield" textfield with "Configurar minha conta" text is displayed
      And the "bills_settings.settings_list" list with "<configuration_services>" textfields is displayed

    Examples:
          | account_type   | digital_invoice_status | configuration_services                   | jira_id    |
          | legacy control | activated              | Conta Digital;Débito Automático;E-mail   | QANOV-3891 |
          | legacy postpay | deactivated            | Conta Digital;Débito Automático;Endereço | QANOV-3892 |

  @no_automatable @android @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.8
  @jira.link.depends_on.QANOV-3888 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-897 @smoke @vivobr @old_app
  Scenario Outline: Legacy user can download the last invoice on Android devices
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill available
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "last_bill.details_button" entrypoint
     Then the "bill" file with the "Documento_XXXXXXXXXXXXX.pdf" format is downloaded as a PDF
      And the "Google Drive" app is displayed
      And the PDF file is opened after it is downloaded

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3893 |
          | legacy postpay | QANOV-3894 |

  @no_automatable @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.8
  @jira.link.depends_on.QANOV-3888 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-2445 @smoke @vivobr @old_app
  Scenario Outline: Legacy user can open the last invoice on iOS devices
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "last_bill.details_button" entrypoint
     Then the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3895 |
          | legacy postpay | QANOV-3896 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.8
  @jira.link.depends_on.QANOV-3894 @jira.link.depends_on.QANOV-3896 @jira.link.parent_test_plan.QANOV-21950 @regression
  @vivobr @old_app
  Scenario Outline: Legacy user can zoom in and out on the last invoice
    Given user has a "legacy" account type
      And user has "1" plans
      And user has the last bill available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
      And the "last" bill file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id    |
          | in        | bigger  | QANOV-3897 |
          | out       | smaller | QANOV-3898 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.12
  @jira.link.depends_on.QANOV-3888 @jira.link.parent_test_plan.QANOV-21950 @jira.link.relates_to.NOV-2568 @regression
  @vivobr @old_app
  Scenario Outline: Legacy user can send the last invoice to his/her email
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "last_bill.more_options_button" button
      And clicks on the "last_bill.send_by_email_button" entrypoint
     Then the "Send By Email" popup is displayed
      And the "message" textfield with "Deseja enviar sua fatura para?" text is displayed
      And the "email" inputtext is displayed
      And the "accept" button with "Sim" text is displayed
      And the "reject" button with "Não" text is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3899 |
          | legacy postpay | QANOV-3900 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.8
  @jira.link.depends_on.QANOV-3888 @jira.link.parent_test_plan.QANOV-21950 @jira.link.relates_to.NOV-898 @regression
  @vivobr @old_app
  Scenario Outline: Legacy user can check the barcode of the last invoice
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "last_bill.barcode_button" button
     Then the "Barcode" internal webview is displayed
      And the "Serviços" header is displayed
      And the "barcode" textfield is displayed
      And the "copy_barcode" button with "Copiar código de barras" text is displayed
      And clicks on the "navigation_top_bar.back_button" button
      And the "BillsV1" page is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3901 |
          | legacy postpay | QANOV-3902 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.8
  @jira.link.depends_on.QANOV-3888 @jira.link.parent_test_plan.QANOV-21950 @jira.link.relates_to.NOV-910 @regression
  @vivobr @old_app
  Scenario Outline: Legacy user can report payment of the last invoice
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "last_bill.more_options_button" button
      And clicks on the "last_bill.inform_payment_button" button
     Then the "Inform Payment" popup is displayed
      And the "title" textfield with "Aguardando confirmação de pagamento" text is displayed
      And the "ok" button with "Ok, entendi" text is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3903 |
          | legacy postpay | QANOV-3904 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.8
  @jira.link.depends_on.QANOV-3904 @jira.link.parent_test_plan.QANOV-21950 @jira.link.relates_to.NOV-910 @regression
  @vivobr @old_app
  Scenario Outline: Legacy user can go back to the "Conta" screen from the "Inform payment" popup
    internal_checkpoint="the last invoice will only be displayed at the end of the month, when it's generated"
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the last bill available
      And user has the matching subscription selected in the account
      And user is in the "Inform Payment" popup
     When clicks on the "ok" button
     Then the "BillsV1" page is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3905 |
          | legacy postpay | QANOV-3906 |

  @no_automatable @android @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.13
  @jira.link.depends_on.QANOV-3890 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-8815 @smoke @vivobr @old_app
  Scenario Outline: Legacy user can download a paid invoice on Android devices
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the paid bills available
      And user has installed the "Google Drive" app
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on any element in the "paid_bills.list" list
     Then the "bill" file with the "Documento_XXXXXXXXXXXXX.pdf" format is downloaded as a PDF
      And the "Google Drive" app is displayed
      And the PDF file is opened after it is downloaded

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3907 |
          | legacy postpay | QANOV-3908 |

  @no_automatable @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.13
  @jira.link.depends_on.QANOV-3890 @jira.link.parent_test_plan.QANOV-21950 @jira.link.parent_test_plan.QANOV-24947
  @jira.link.relates_to.NOV-8816 @smoke @vivobr @old_app
  Scenario Outline: Legacy user can open a paid invoice on iOS devices
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the paid bills available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on any element in the "paid_bills.list" list
     Then the PDF file is opened
      And the "navigation_top_bar.close_button" button is displayed
      And the "see_on_safari" button is displayed
      And the "share" button is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3909 |
          | legacy postpay | QANOV-3910 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.13
  @jira.link.depends_on.QANOV-3908 @jira.link.depends_on.QANOV-3910 @jira.link.parent_test_plan.QANOV-21950 @regression
  @vivobr @old_app
  Scenario Outline: Legacy user can zoom in and out on a paid invoice
    Given user has a "legacy" account type
      And user has "1" plans
      And user has the paid bills available
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
      And the "paid" bill file is displayed
     When zooms "<direction>" on the file
     Then the file is displayed "<size>"

    Examples:
          | direction | size    | jira_id    |
          | in        | bigger  | QANOV-3911 |
          | out       | smaller | QANOV-3912 |

  @no_automatable @android @ios @mobile @impeded_legacy @jira.<jira_id> @jira.cv.9.12
  @jira.link.depends_on.QANOV-3892 @jira.link.parent_test_plan.QANOV-21950 @jira.link.relates_to.NOV-900 @regression
  @vivobr @old_app
  Scenario Outline: Legacy user can access to the "Endereço de envio" screen
    Given user has a "<account_type>" account type
      And user has "1" plans
      And user has the digital invoice service in "deactivated" status
      And user has the matching subscription selected in the account
      And user is in the "BillsV1" page
     When clicks on the "billing_address_entrypoint" entrypoint
     Then the "Endereço de envio" internal webview is displayed
      And the "title" textfield with "Endereço de envio" text is displayed

    Examples:
          | account_type   | jira_id    |
          | legacy control | QANOV-3913 |
          | legacy postpay | QANOV-3914 |
