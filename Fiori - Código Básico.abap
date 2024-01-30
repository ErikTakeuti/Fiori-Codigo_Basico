@AbapCatalog.sqlViewName: 'ZCAIRLINE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View Airline'
@OData.publish: true

@UI.headerInfo: {
    typeName: 'Airline',
    typeNamePlural: 'Airlines'
}

define view ZC_AIRLINE_02_VW as select from ZI_AIRLINE_02_VW

association[1..*] to ZI_FLIGHTS_02_VW as _Flights on _Flights.Carrid = ZI_AIRLINE_02_VW.Carrid 
association[1..*] to ZI_FLIGHT_SCHED_02_VW as _FlightSched on _FlightSched.Carrid = ZI_AIRLINE_02_VW.Carrid
{

    @UI.facet: [{ id: 'Airline', 
                  purpose: #STANDARD ,
                  type: #IDENTIFICATION_REFERENCE,
                  label: 'Dados' ,
                  position:10 }]

    @UI.lineItem:       [{ position: 10 }]
    @UI.selectionField: [{ position: 10 }]
    @UI.identification: [{ position: 10 }]
    @EndUserText.label: 'Silgas'
//    @Consumption.filter.mandatory: true
        key Carrid,
    
    @UI.lineItem: [{ position: 20 }]
    @UI.identification: [{ position: 20 }]
        Carrname,
    
    @UI.lineItem: [{ position: 30 }]
    @UI.selectionField: [{ position: 20 }]
    @UI.identification: [{ position: 30 }]
        Currcode,
    
    @UI.lineItem: [{ position: 40 }]
    @UI.identification: [{ position: 40 }]
        Url,
    
    //Assosiaçõs//
    _Flights,
    _FlightSched
}
