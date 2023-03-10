SELECT
      NVL2(T18.X_LIQUIDACION_ID, T5.ATTRIB_24, T18.ATTRIB_24)          as Cant_grupos,
      NVL2(T18.X_LIQUIDACION_ID, T18.CREATED, NULL)                    as Fecha_Ajuste,
      NVL2(T18.X_LIQUIDACION_ID, T18.ATTRIB_14, NULL)                  as Cant_Capitas_Ajuste,
      NVL2(T18.X_LIQUIDACION_ID, T18.ATTRIB_14, T18.ATTRIB_23)         as Cant_capitas,
      NVL2(T18.X_LIQUIDACION_ID, T5.ATTRIB_30, T18.ATTRIB_30)          as Fecha_liquidacion,
      NVL2(T18.X_LIQUIDACION_ID, T5.ATTRIB_22, T18.ATTRIB_22)          as Precio_ARSUSD,
      NVL2(T18.X_LIQUIDACION_ID, T18.ATTRIB_15, NULL)                  as Precio_Ajuste,
      NVL2(T18.X_LIQUIDACION_ID, T18.ATTRIB_07, NULL)                  as Tipo_Ajuste,
      NVL2(T18.X_LIQUIDACION_ID, T18.ATTRIB_03, NULL)                  as Tipo_Comprobante,
      NVL2(T18.X_LIQUIDACION_ID, T18.ATTRIB_16, T18.ATTRIB_21)         as Total_liquidacion,
      T18.ATTRIB_35                                                    as Cap_grupos_minimo,
      NVL2(T18.X_LIQUIDACION_ID, T18.ATTRIB_16, NULL)                  as Total_Ajuste
      --FACTURA
      --IMPORTE FACTURA
    FROM 
       SIEBEL.S_PARTY T1,
       SIEBEL.S_PROD_INT T2,
       SIEBEL.S_ASSET T3,
       SIEBEL.S_USER T4,
       SIEBEL.S_ASSET_XM T5,
       SIEBEL.CX_S_ASSET_X T6,
       SIEBEL.S_USER T7,
       SIEBEL.S_ORG_EXT T8,
       SIEBEL.S_INDUST T9,
       SIEBEL.S_ASSET_ITEM T10,
       SIEBEL.S_ADDR_PER T11,
       SIEBEL.S_ORG_EXT T12,
       SIEBEL.S_ORG_EXT T13,
       SIEBEL.S_USER T14,
       SIEBEL.S_ASSET_X T15,
       SIEBEL.S_POSTN T16,
       SIEBEL.S_USER T17,
       SIEBEL.S_ASSET_XM T18
   WHERE 
      T18.PAR_ROW_ID = T6.PAR_ROW_ID (+) AND
      T18.CREATED_BY = T17.PAR_ROW_ID AND
      T18.LAST_UPD_BY = T14.PAR_ROW_ID AND
      T13.PR_ADDR_ID = T11.ROW_ID (+) AND
      T18.PAR_ROW_ID = T3.ROW_ID (+) AND
      T18.PAR_ROW_ID = T10.ASSET_ID (+) AND
      T18.PAR_ROW_ID = T15.PAR_ROW_ID (+) AND
      T3.OWNER_ACCNT_ID = T13.ROW_ID (+) AND
      T10.PROD_ID = T2.ROW_ID (+) AND
      T3.BU_ID = T8.PAR_ROW_ID (+) AND
      T18.X_LIQUIDACION_ID = T5.ROW_ID (+) AND
      T13.PR_SHIP_OU_ID = T12.PAR_ROW_ID (+) AND
      T3.OWNER_CON_ID = T7.PAR_ROW_ID (+) AND
      T13.PR_INDUST_ID = T9.ROW_ID (+) AND
      T3.PR_POSTN_ID = T1.ROW_ID (+) AND
      T3.PR_POSTN_ID = T16.PAR_ROW_ID (+) AND
      T16.PR_EMP_ID = T4.PAR_ROW_ID (+) AND
      (T18.TYPE IN ('Corporativo','Ajuste Liquidacion'))
      --AND T18.ROW_ID = '1-4KK6BA'
