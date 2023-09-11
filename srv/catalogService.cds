using { mohan.db.master, mohan.db.transaction,mohan.db.CDSVIEW } from '../db/mohantable';

service CatalogService@(path:'/CatalogService'){
    entity EmployeeSet as projection on master.employees;
    entity AddressSet as projection on master.address;
    entity ProductSet as projection on master.product; 
    entity BPSet  AS projection ON master.businesspartner;
    entity POs @( title: '{i18n>poHeader}'        
    )as projection on transaction.purchaseorder{
     *,
     Items: redirected to POItems
    }

    entity POItems @( title : '{i18n>poItems}')
         as projection on transaction.poitems{
            *,
            PARENT_KEY: redirected to POs,
            PRODUCT_GUID: redirected to ProductSet
         }
     entity POWorklist as projection on CDSVIEW.POWorklist;
     entity ProductOrders as projection on CDSVIEW.ProductViewSub;
     entity ProductAggreagation as projection on CDSVIEW.CProductValuesView excluding{
      ProductId
     } ;

 }
    
