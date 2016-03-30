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
<!ELEMENT request (http,example+,reqbody)>
<!ELEMENT response (http,example,resbody*)>
<!ELEMENT reqbody (fields)?>
<!ELEMENT resbody (%title;?,((%basic.block;) | fields)*)>
<!ELEMENT fields (field)+>
<!ELEMENT field (parmname,type,descr?,fields*)>
<!ELEMENT type EMPTY>
<!ELEMENT http (return|(verb,resource,headers))>
<!ELEMENT headers (parml)+ >
<!ELEMENT return (status)+>
<!ELEMENT verb (#PCDATA)>
<!ELEMENT resource (#PCDATA)>
<!ELEMENT status (code,msg,format,descr)>
<!ELEMENT code (#PCDATA)>
<!ELEMENT msg (#PCDATA)>
<!ELEMENT format (#PCDATA)>
<!ELEMENT descr %p.content;>
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
  class CDATA "- topic/section rest-api/reqbody "
  format (query|json) #IMPLIED
  xmlns CDATA #FIXED ''>
<!ATTLIST resbody
  id ID #IMPLIED
  class CDATA "- topic/section rest-api/resbody "
  xmlns CDATA #FIXED ''>
<!ATTLIST fields
  class CDATA "- topic/parml rest-api/fields "
  xmlns CDATA #FIXED ''>
<!ATTLIST field
  class CDATA "- topic/plentry rest-api/field "
  xmlns CDATA #FIXED ''
  importance (required|optional) #IMPLIED>
<!ATTLIST type 
  format (str|int|bool|float|object|array) #REQUIRED
  class CDATA "- topic/entry rest-api/type "
  >
<!ATTLIST http
  class CDATA "- topic/bodydiv rest-api/http "
  xmlns CDATA #FIXED ''>
<!ATTLIST return
  class CDATA "- topic/bodydiv rest-api/return "
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
  class CDATA "- topic/bodydiv rest-api/status "
  xmlns CDATA #FIXED ''>
<!ATTLIST code
  class CDATA "- topic/codeblock rest-api/code "
  xmlns CDATA #FIXED ''>
<!ATTLIST msg
  class CDATA "- topic/codeblock rest-api/msg "
  xmlns CDATA #FIXED ''>
<!ATTLIST format
  class CDATA "- topic/codeblock rest-api/format "
  xmlns CDATA #FIXED ''>
<!ATTLIST descr
  %p.attributes;
  class CDATA "- topic/entry rest-api/descr ">

<!-- ================================= End of file ================================== -->
