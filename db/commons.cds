namespace mohan.common;
type Guid : String(32);

using { sap, Currency, temporal, managed } from '@sap/cds/common';

type Gender : String(1) enum{
    male = 'M';
    female = 'F';
    nonBinary = 'N';
    noDisclosure = 'D';
    selfDescribe = 'S';
};

type AmountT : Decimal(15,2)@(
    semantics.amount.Currencycode: 'CURRENCY_CODE',
    sap.unit: 'CURRENCY_CODE'
) ;

abstract entity Amount  {
    Currency: Currency;
    GROSS_AMOUNT:AmountT;
    NET_AMOUNT  :AmountT;
    TAX_AMOUNT  :AmountT;
};

type PhoneNumber : String(30) @assert.format: '^(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}$';
type Email       : String(255) @assert.format: '^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$';


