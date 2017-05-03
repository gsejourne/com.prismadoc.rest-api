<!-- ================================================================================ -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//GSEJOURNE//ELEMENTS DITA API Reference//EN"
      Delivered as file "com.prismadoc.rest-api.mod"  -->
<!-- ================================================================================ -->

<!-- ================================================================================ -->
<!--                       SPECIALIZATION OF DECLARED ELEMENTS                        -->
<!-- ================================================================================ -->

<!ENTITY % apiref-info-types
                        "%info-types;">

<!-- ================================================================================ -->
<!--                              ELEMENT NAME ENTITIES                               -->
<!-- ================================================================================ -->

<!ENTITY % apiref       "apiref">

<!-- ================================================================================ -->
<!--                            DOMAINS ATTRIBUTE OVERRIDE                            -->
<!-- ================================================================================ -->

<!ENTITY % included-domains
                        "">

<!-- ================================================================================ -->
<!--                               ELEMENT DECLARATIONS                               -->
<!-- ================================================================================ -->

<!--                                LONG NAME: apiref                                 -->
<!ENTITY % apibody "apibody">
<!ENTITY % apiref.content
                        "((%title;),
                          (%titlealts;)?,
                          (%shortdesc; |
                           %abstract;)?,
                          (%prolog;)?,
                          (%apibody;)?,
                          (%related-links;)?)">
<!ENTITY % apiref.attributes
                        "id ID #REQUIRED
                         %conref-atts;
                         %select-atts;
                         %localization-atts;
                         outputclass CDATA #IMPLIED
                        ">
<!ELEMENT apiref %apiref.content;>
<!ATTLIST apiref 
    %apiref.attributes;
    %arch-atts;
    domains CDATA "&included-domains;">


<!ELEMENT apibody (request,response)>
<!ELEMENT request (%title;?,(%basic.block;)?,http,example+,reqbody?)>
<!ELEMENT response (%title;?,(%basic.block;)?,http,example*,resbody*)>
<!ELEMENT reqbody (%title;?,((%basic.block;) | fields)*)>
<!ELEMENT resbody (%title;?,((%basic.block;) | fields)*)>
<!ELEMENT fields (field)+>
<!ELEMENT field (parmname,type,descr?,fields*)>
<!ELEMENT type EMPTY>
<!ELEMENT http ((return,headers?)|(verb,resource,headers))>
<!ELEMENT headers (parml)+ >
<!ELEMENT return (status)+>
<!ELEMENT verb (#PCDATA)>
<!ELEMENT resource (#PCDATA)>
<!ELEMENT status (code,msg,format,descr)>
<!ELEMENT code (%defn.cnt;)*>
<!ELEMENT msg (#PCDATA)>
<!ELEMENT format (#PCDATA)>
<!ELEMENT descr (%defn.cnt;)*>
<!-- ================================================================================ -->
<!--                      SPECIALIZATION ATTRIBUTE DECLARATIONS                       -->
<!-- ================================================================================ -->

<!ATTLIST apiref %global-atts; class CDATA "- topic/topic reference/reference rest-api/apiref ">

<!ATTLIST apibody class CDATA "- topic/body reference/refbody rest-api/apibody ">
<!ATTLIST request
  class CDATA "- topic/body rest-api/request "
  xmlns CDATA #FIXED ''>
<!ATTLIST response
  class CDATA "- topic/body rest-api/response "
  xmlns CDATA #FIXED ''>
<!ATTLIST reqbody
  %global-atts;
  %select-atts;
  %conref-atts;
  class CDATA "- topic/section rest-api/reqbody "
  format (query|json) #IMPLIED
  xmlns CDATA #FIXED ''>
<!ATTLIST resbody
  id ID #IMPLIED
  %global-atts;
  %select-atts;
  %conref-atts;
  class CDATA "- topic/section rest-api/resbody "
  xmlns CDATA #FIXED ''>
<!ATTLIST fields
  %global-atts;
  %select-atts;
  %conref-atts;
  id ID #IMPLIED
  class CDATA "- reference/properties rest-api/fields "
  xmlns CDATA #FIXED ''>
<!ATTLIST field
  %global-atts;
  %conref-atts;
  %select-atts;
  class CDATA "- reference/property rest-api/field "
  xmlns CDATA #FIXED ''
  id ID #IMPLIED
  importance (required|optional) #IMPLIED>
<!ATTLIST  parmname
  %global-atts;
  %select-atts;
  class CDATA "- reference/proptype rest-api/parmname "
  xmlns CDATA #FIXED ''
>
<!ATTLIST type 
  format (str|int|bool|float|object|array) #REQUIRED
  class CDATA "- reference/propvalue rest-api/type "
  >
<!ATTLIST http
  class CDATA "- topic/section rest-api/http "
  xmlns CDATA #FIXED ''>
<!ATTLIST return
  %global-atts;
  %conref-atts;
  %select-atts;
  id ID #IMPLIED
  class CDATA "- reference/properties rest-api/return "
  xmlns CDATA #FIXED ''>
<!ATTLIST verb
  class CDATA "- topic/codeblock rest-api/verb "
  xmlns CDATA #FIXED ''>
<!ATTLIST headers
  class CDATA "- topic/parml rest-api/headers "
  xmlns CDATA #FIXED ''>
<!ATTLIST resource
  class CDATA "- topic/codeblock rest-api/resource "
  xmlns CDATA #FIXED ''>
<!ATTLIST status
  id    ID  #IMPLIED
  %global-atts;
  %conref-atts;
  %select-atts;
  class CDATA "- reference/property rest-api/status "
  xmlns CDATA #FIXED ''>
<!ATTLIST code
  class CDATA "- reference/proptype rest-api/code "
  xmlns CDATA #FIXED ''>
<!ATTLIST msg
  class CDATA "- reference/propvalue rest-api/msg "
  xmlns CDATA #FIXED ''>
<!ATTLIST format
  class CDATA "- reference/propvalue rest-api/format "
  xmlns CDATA #FIXED ''>
<!ATTLIST descr
  %p.attributes;
  class CDATA "- reference/propdesc rest-api/descr ">

<!-- ================================= End of file ================================== -->
