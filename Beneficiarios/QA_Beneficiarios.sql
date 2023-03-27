SELECT
      T18.X_IDEN_TYPE_CD||T18.X_IDEN_NUM                as CUSTOMER_ID_,
      T18.EMAIL_ADDR                                    as EMAIL_ADDRESS_,
      T18.CELL_PH_NUM                                   as MOBILE_NUMBER_,
      T18.PER_TITLE                                     as QA_SR_SRA,
      T18.LAST_NAME                                     as QA_APELLIDOS,    
      T18.FST_NAME                                      as QA_NOMBRES,
      TO_CHAR(T18.BIRTH_DT, 'MM/DD/YYYY')               as QA_FECHA_NAC,
      TO_CHAR(T18.BIRTH_DT, 'DD')                       as QA_FECHA_CUMPL_DIA,           --T11.ATTRIB_25 no funciona 
      TO_CHAR(T18.BIRTH_DT, 'MM')                       as QA_FECHA_CUMPL_MES,           --T11.ATTRIB_42 no funciona             
      T18.SEX_MF                                        as QA_SEXO,
      TRUNC((TO_NUMBER(TO_CHAR(SYSDATE,'YYYYMMDD'))-TO_NUMBER(TO_CHAR(T18.BIRTH_DT,'YYYYMMDD')))/10000) as QA_EDAD,  
      T11.ATTRIB_10           as QA_VIP,
      T18.SUPPRESS_CALL_FLG   as QA_NO_LLAMAR_NUNCA,
      T4.NAME                 as QA_CLIENTE,
      T14.ADDR                as QA_DIRECCION,
      T18.SUPPRESS_MAIL_FLG   as QA_NO_LLAMAR_NUNCA_CORREO,
      T18.X_MEMBER_NUM        as QA_NRO_DE_AFILIADO,
      T14.COUNTRY             as COUNTRY_
   FROM 
       SIEBEL.S_POSTN T1,
       SIEBEL.S_PARTY T2,
       SIEBEL.S_USER T3,
       SIEBEL.S_ORG_EXT T4,
       SIEBEL.S_ORG_EXT T5,
       SIEBEL.S_ORG_GROUP T6,
       SIEBEL.S_PARTY T7,
       SIEBEL.S_PARTY T8,
       SIEBEL.S_PARTY T9,
       SIEBEL.S_CON_ADDR T10,
       SIEBEL.S_CONTACT_X T11,
       SIEBEL.S_ORG_EXT T12,
       SIEBEL.S_POSTN_CON T13,
       SIEBEL.S_ADDR_PER T14,
       SIEBEL.S_PARTY T15,
       SIEBEL.S_CONTACT_BU T16,
       SIEBEL.S_ADDR_PER T17,
       SIEBEL.S_CONTACT T18
   WHERE 
      T18.PR_DEPT_OU_ID = T4.PAR_ROW_ID (+) AND
      T15.ROW_ID = T11.PAR_ROW_ID (+) AND
      T15.ROW_ID = T18.PAR_ROW_ID AND
      T18.PR_POSTN_ID = T13.POSTN_ID AND T18.ROW_ID = T13.CON_ID AND
      T13.POSTN_ID = T8.ROW_ID AND
      T13.POSTN_ID = T1.PAR_ROW_ID (+) AND
      T1.PR_EMP_ID = T3.PAR_ROW_ID (+) AND
      T18.PR_OU_ADDR_ID = T10.ADDR_PER_ID (+) AND T18.PR_DEPT_OU_ID = T10.ACCNT_ID (+) AND
      T18.PR_OU_ADDR_ID = T17.ROW_ID (+) AND
      T18.PR_DEPT_OU_ID = T2.ROW_ID (+) AND
      T18.PR_DEPT_OU_ID = T12.PAR_ROW_ID (+) AND
      T18.PR_GRP_OU_ID = T9.ROW_ID (+) AND
      T18.PR_GRP_OU_ID = T6.PAR_ROW_ID (+) AND
      T18.PR_PER_ADDR_ID = T14.ROW_ID (+) AND
      T18.BU_ID = T16.BU_ID (+) AND T18.ROW_ID = T16.CONTACT_ID (+) AND
      T16.BU_ID = T7.ROW_ID (+) AND
      T16.BU_ID = T5.PAR_ROW_ID (+) AND
      (T18.MEMBER_FLG = 'Y' AND T18.MEMBER_FLG IS NOT NULL AND T18.PRIV_FLG = 'N') AND
      T15.CREATED >= TO_DATE('01/01/2023', 'DD/MM/YYYY');
