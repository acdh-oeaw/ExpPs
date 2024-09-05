# Expositiones in Psalmos – Data

## Content

- ```api```: Contains the XQuery scripts for the REST-API and the CTS
- ```csv```: Contains two files with the witnesses for each fragment ("Kollationstabelle"). This was used to calculate the amount of agreement between manuscripts. - Out of date and not used anymore.
- ```deployment```: Contains scripts for the start and configuration of the baseX database.
- ```docker```: Out of date and not used.
- ```documentation```: Contains a file to keep track of the additions to the file ```new-findings.html``` (see directory ```html```)
- ```xml```: Contains the TEI/XML transcriptions of each manuscript. The structure is organized according to manuscript names. In each directory with the manuscript identifier the transcription of this manuscript is found.
- ```html```: Contains the html files corresponding to the transcriptions. Originally two different files for each transcription have been created: one for preview and one for the homepage. The work with a preview has been stopped in favour of the pages for the homepage. Therefore the subfolders carrying the manuscript identifier are obsolete. The HTML files which appear on the homepage are in the directory ```html/manuscripts```. Furthermore, in the directory ```html/fundament``` are the js, the css files, and some pictures for the web presentation stored.
- ```xsl```: Contains the transformations to html and TeX.
- ```schema```: Contains the ODD and the schema as well as two schematron files for checking the transcriptions.
- ```test```: contains automatic tests for the API.
- ```python```: Contains the python scripts which where used for automatically evaluating the "Kollationstabelle". Out of date and not used anymore.
- ```pdf```: Contains some pfds which belong to the project.

## Web Presentation

See: https://expps.acdh-dev.oeaw.ac.at/expps/

## The Source Data

The transcriptions of the manuscripts are located in the ```xml``` directory. Each manuscript has its own subdirectory.

Two types of transcription exist: Full transcriptions and reduced or simplified transcriptions. Vat. gr. 754 (Ps 1-6) and Vat. gr. 1422 (Ps 1-2) are full transcriptions. The other psalm commentaries in these two manuscripts are transcribed in a reduced form. All other transcriptions are simplified ones. 

## The Transformations

- Vat. gr. 754 has three transformations (```xsl/vat-gr-754```):
  
   - ```transformation-tei-to-xhtml-critical-for-homepage.xsl```: Creates a critical presentation of the transcription (```html/manuscripts/vat_gr_754.html```)
   - ```transformation-tei-to-xhtml-diplomatic-for-homepage.xsl```: Creates a diplomatic presentation of the transcription (```html/manuscripts/vat_gr_754_diplomatic.html```)
   - ```transformation-tei-to-xhtml-simplified-for-homepage.xsl```: Creates a simplified presentation of the transcription (```html/manuscripts/vat_gr_754_simplified.html```)

- Vat. gr. 1422 has its own transformation: ```xsl/vat-gr-1422/transformation-tei-to-xhtml-critical-for-homepage.xsl```: Creates a critical presentation of the transcription (```html/manuscripts/vat_gr_1422.html```)
- All other transcriptions have to be transformed with: ```xsl/bodl-auct-d-4-1/transformation-tei-to-xhtml-simplified-for-homepage.xsl```. The transcriptions and the output are:
   
   - ```xml/ambr-b-106-sup/ambr-b-106-sup.xml``` - ```html/manuscripts/ambr_b_106_sup.html```
   - ```xml/ambr-m-47-sup/ambr-m-47-sup.xml``` - ```html/manuscripts/ambros_m_47_sup.html```
   - ```xml/bodl-auct-d-4-1/bodl-auct-d-4-1.xml``` - ```html/manuscripts/bodl_auct_d_4_1.html```
   - ```xml/athen-b-n-8/athen-b-n-8.xml```: not developed and used anymore
   - ```xml/coislin-10/coislin-10-transcription.xml``` - ```html/manuscripts/coislin_10.html```
   - ```xml/coislin-12/coislin-12-transcription.xml``` - ```html/manuscripts/coislin_12.html```
   - ```xml/coislin-187/coislin-187-transcription.xml``` - ```html/manuscripts/coislin-187.html```
   - ```xml/franzon-3/franzon-3-transcription.xml``` - ```html/manuscripts/franzon_3.html```
   - ```xml/mosq-syn-194/mosq-syn-194.xml``` - ```html/manuscripts/mosq_synod_194.html```
   - ```xml/oxon-s-trin-78/oxon-s-trin-78.xml``` - ```html/manuscripts/oxon_s_trin_78.html```
   - ```xml/par-gr-139/par-gr-139.xml``` - ```html/manuscripts/par_gr_139.html```
   - ```xml/par-gr-166/par-gr-166.xml``` - ```html/manuscripts/par_gr_166.html```
   - ```xml/par-gr-164/par-gr-164.xml``` - ```html/manuscripts/par_gr_164.html```
   - ```xml/plut-5-30/plut-5-30.xml``` - ```html/manuscripts/plut_5_30.html```
   - ```xml/plut-6-3/plut-6-3.xml``` - ```html/manuscripts/plut_6_3.html```   