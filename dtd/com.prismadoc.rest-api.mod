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
<!ELEMENT response (http,example,resbody)>
<!ELEMENT reqbody (parameters)>
<!ELEMENT resbody (fields)?>
<!ELEMENT parameters (field)+>
<!ELEMENT fields (field)+>
<!ELEMENT field (parmname,type,(descr|fields+))>
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

<!ATTLIST apiref %global-atts; class CDATA "- topic/topic reference/reference com.prismadoc.rest-api/apiref ">

<!ATTLIST apibody class CDATA "- topic/body reference/refbody com.prismadoc.rest-api/apibody ">
<!ATTLIST request
  class CDATA "- topic/body com.prismadoc.rest-api/request "
  xmlns CDATA #FIXED ''>
<!ATTLIST response
  class CDATA "- topic/body com.prismadoc.rest-api/request "
  xmlns CDATA #FIXED ''>
<!ATTLIST reqbody
  class CDATA "- topic/section com.prismadoc.rest-api/reqbody "
  format (query|json) #IMPLIED
  xmlns CDATA #FIXED ''>
<!ATTLIST resbody
  class CDATA "- topic/section com.prismadoc.rest-api/resbody "
  xmlns CDATA #FIXED ''>
<!ATTLIST parameters
  class CDATA "- topic/parml com.prismadoc.rest-api/parameters "
  xmlns CDATA #FIXED ''>
<!ATTLIST fields
  class CDATA "- topic/parml com.prismadoc.rest-api/fields "
  xmlns CDATA #FIXED ''>
<!ATTLIST field
  class CDATA "- topic/plentry com.prismadoc.rest-api/arg "
  xmlns CDATA #FIXED ''
  importance (required|optional) #IMPLIED>
<!ATTLIST type 
  format (str|int|bool|float|object) #REQUIRED
  class CDATA "- topic/ph com.prismadoc.rest-api/type "
  >
<!ATTLIST http
  class CDATA "- topic/bodydiv com.prismadoc.rest-api/http "
  xmlns CDATA #FIXED ''>
<!ATTLIST return
  class CDATA "- topic/bodydiv com.prismadoc.rest-api/return "
  xmlns CDATA #FIXED ''>
<!ATTLIST verb
  class CDATA "- topic/codeblock com.prismadoc.rest-api/verb "
  xmlns CDATA #FIXED ''>
<!ATTLIST headers
  class CDATA "- topic/parml com.prismadoc.rest-api/headers "
  xmlns CDATA #FIXED ''>
<!ATTLIST resource
  class CDATA "- topic/codeblock com.prismadoc.rest-api/resource "
  xmlns CDATA #FIXED ''>
<!ATTLIST status
  class CDATA "- topic/bodydiv com.prismadoc.rest-api/status "
  xmlns CDATA #FIXED ''>
<!ATTLIST code
  class CDATA "- topic/codeblock com.prismadoc.rest-api/code "
  xmlns CDATA #FIXED ''>
<!ATTLIST msg
  class CDATA "- topic/codeblock com.prismadoc.rest-api/msg "
  xmlns CDATA #FIXED ''>
<!ATTLIST format
  class CDATA "- topic/codeblock com.prismadoc.rest-api/format "
  xmlns CDATA #FIXED ''>
<!ATTLIST descr
  %p.attributes;
  class CDATA "- topic/p com.prismadoc.rest-api/descr ">

<!-- ================================= End of file ================================== -->
