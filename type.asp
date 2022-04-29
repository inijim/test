<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <META name="description" content="What the DICOM Attribute mean.  Rrequired, optional, etc. DICOM search tools and web resources.  Search the DICOM standar from the web.">
  <META name="keywords" content="DICOM Attributres, DICOM, HL7, IHE, NEMA, ACR, ACR-NEMA, Radiology, Medical Images, Tags, Attributs, Enterprise, Healthcare, Connectathon, RSNA, SCAR, HIMMS, Cardiology, DICOM Tags, DICOM Attributes, SOP, SOP Class, UID, Service Object Pair, Provider, User, SCP, SCU, Modality, Modalit Worklist, MWL, DICOM Dictionary, Lookup, DICOM Search, Search, Part 10, Part-10, Suplement, Compression, JPEG, JPEG2000, Commands, Programing, Development, Toolkit, RIS, HIS, CIS, EMR, MRN, DICOM Dump, Dump, DMP, Endian, Big Endian, Little Endian, Integration, Integrating the Healthcare Enterprise, Digital Communications in Medicine, Healthcare Systems">
  <META NAME="distribution" CONTENT="Global">
  <META NAME="revisit-after" CONTENT="10 days">
  <META NAME="robots" CONTENT="All">
  <META NAME="rating" CONTENT="General">
  <META NAME="copyright" CONTENT="DICOMLookup">
  <link rel="stylesheet" href="bootstrap.min.css">
  <script src="jquery.min.js"></script>
  <script src="bootstrap.min.js"></script>
  <title>DICOM Attribute Requirement Types</title>
</head>

<body>

<div class="container" title="Top_Menu">
<p><br></p>	
  	<ul class="nav nav-tabs" role="tablist">
    <li><a href="lookuppage.asp">Lookup</a></li>
    <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">SOP<span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="dicom-sop.asp">DICOM SOP</li>
			<li><a href="dicom-sop-retired.asp">Retired SOP</a></li> 
		</ul>
	</li>  
    <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Modalities <span class="caret"></span></a>
      <ul class="dropdown-menu" role="menu">
        <li><a href="modalities.asp">Modalities</a></li>
        <li><a href="modalities-retired.asp">Retired</a></li>                       
      </ul>
    </li>
    <li><a href="dicom-tables.asp">Tables</a></li>    
        <li class="dropdown">
    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Get PDF<span class="caret"></span></a>
		<ul class="dropdown-menu" role="menu">
			<li><a href="getpdf2003.asp">2003</li>
			<li><a href="getpdf2016.asp">2016</a></li> 
		</ul>
	</li>  
    <li><a href="dash.asp">Search HTML</a></li>
    </ul>
<p><br></p>
</div>

<div class="container" title="body">
<table>
<tr>
<td valign="top">
<h3>DICOM Attribute Requirement Types</h3>
<table>
	<tr>
		<td style="text-align: left" valign="top" width="80"><b>Type 1:</b></td>
		<td style="text-align: left" valign="top">Required to be in the SOP Instance and shall have a valid value.</td>
	</tr>
	<tr>
		<td style="text-align: left" valign="top" width="80">&nbsp;</td>
		<td style="text-align: left" valign="top">&nbsp;</td>
	</tr>
	<tr>
		<td style="text-align: left" valign="top" width="80"><b>Type 2:</b></td>
		<td style="text-align: left" valign="top">Required to be in the SOP Instance but may contain the value of "unknown", or a zero length value.</td>
	</tr>

	<tr>
		<td style="text-align: left" valign="top" width="80">&nbsp;</td>
		<td style="text-align: left" valign="top">&nbsp;</td>
	</tr>
	<tr>
		<td style="text-align: left" valign="top" width="80"><b>Type 3:</b></td>
		<td style="text-align: left" valign="top">Optional. May or may not be included and could be zero length.</td>
	</tr>
		<tr>
		<td style="text-align: left" valign="top" width="80">&nbsp;</td>
		<td style="text-align: left" valign="top">&nbsp;</td>
	</tr>

	<tr>
		<td style="text-align: left" valign="top" width="80"><b>Type 1C:</b></td>
		<td style="text-align: left" valign="top">Conditional. If a condition is 
		met, then it is a Type 1 (required, cannot be zero). If condition is not 
		met, then the tag is not sent.</td>
	</tr>
		<tr>
		<td style="text-align: left" valign="top" width="80">&nbsp;</td>
		<td style="text-align: left" valign="top">&nbsp;</td>
	</tr>

	<tr>
		<td style="text-align: left" valign="top" width="80"><b>Type 2C:</b></td>
		<td style="text-align: left" valign="top">Conditional. If condition is met, then it is a Type 2 (required, zero length OK). If condition is not met, then the tag is not sent.</td>
	</tr>
</table>


</td>
<td width="180" align="right" valign="top">  


<!--#include file="righter.html"--> 

</td>
</tr>
</table>
</div>


 
<div> <!--#include file="footer.html"-->  </div>

</body>
</html>