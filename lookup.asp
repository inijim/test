<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="bootstrap.min.css">
  <script src="jquery.min.js"></script>
  <script src="bootstrap.min.js"></script>
    <style type="text/css">
  .auto-style1 {
	  border-style: solid;
	  border-width: 1px;
  				}
  table, th, td {
    border: 1px solid black;
    padding: 5px;
				}
  </style>


<meta http-equiv="Content-Language" content="en-us">
<title>DICOMLookup</title>
<META name="description" content="DICOM search tools and web resources.  Search the DICOM standar from the web.">
<META name="keywords" content="DICOM, HL7, IHE, NEMA, ACR, ACR-NEMA, Radiology, Medical Images, Tags, Attributs, Enterprise, Healthcare, Connectathon, RSNA, SCAR, HIMMS, Cardiology, DICOM Tags, DICOM Attributes, SOP, SOP Class, UID, Service Object Pair, Provider, User, SCP, SCU, Modality, Modalit Worklist, MWL, DICOM Dictionary, Lookup, DICOM Search, Search, Part 10, Part-10, Suplement, Compression, JPEG, JPEG2000, Commands, Programing, Development, Toolkit, RIS, HIS, CIS, EMR, MRN, DICOM Dump, Dump, DMP, Endian, Big Endian, Little Endian, Integration, Integrating the Healthcare Enterprise, Digital Communications in Medicine, Healthcare Systems">
<META NAME="distribution" CONTENT="Global">
<META NAME="revisit-after" CONTENT="10 days">
<META NAME="robots" CONTENT="All">
<META NAME="rating" CONTENT="General">
<META NAME="copyright" CONTENT="DICOMLookup">
</head>

<%
q=request("q")
sw=request("sw")

if q = "" then
Response.Redirect "default.asp"
end if

if sw = "" then
Response.Redirect "default.asp"
end if


dim conntemp, rstemp
accessDB=Server.MapPath("dbase\dbank.mdb")
mySQL="SELECT * FROM DicomDB "
mySQL=mySQL & "WHERE ("


select case sw
	case "Tname"
	mySQL=mySQL & "(DicomDB.TagName) like '%" & q & "%'"
	
	case "Tnumber"
		if len(q) = 8 then
		q = left(q, 4) & "," & right(q, 4)
		end if
	mySQL=mySQL & "(DicomDB.TagFull) like '%" & q & "%'"
	
	case "Tgroup"
	mySQL=mySQL & "(DicomDB.TagPart1) like '%" & q & "%'"
	
	case "Tdesc"
	mySQL=mySQL & "(DicomDB.TagDescription) like '%" & q & "%'"

	case "Ttable"
	mySQL=mySQL & "(DicomDB.TableNumber) = '" & q & "'"
end select

mySQL=mySQL & ")"

strconn="PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=" & accessDB & ";"
set conntemp=server.createobject("adodb.connection")
conntemp.open strconn
set rstemp=conntemp.execute(mySQL)

%>


<body>


<div class="container" title="Top_Menu">
<p><br></p>	
  	<ul class="nav nav-tabs" role="tablist">
    <li <% if sw<>"Ttable" then Response.Write("class='active'") end if %> ><a href="default.asp">Lookup</a></li>
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
    <li <% if sw="Ttable" then Response.Write("class='active'") end if %> ><a href="dicom-tables.asp">Tables</a></li>    
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


<div class="container" title="LookupResult">
		
					
<%		
	if sw="Ttable" then
	response.write("<br><h3>")
	response.write(rstemp("TableName") & " (" & rstemp("TableNumber") & ")</h3><br>")
	end if
%>

	  <table style="width:100%">
		<tr>
			<td bgcolor="#337AB7" align="center"><i>
			<font color="#FFFFFF"><b>Tag</b></font></i></td>
			<td bgcolor="#337AB7" align="center"><i>
			<font color="#FFFFFF"><b>Attribute</b></font></i></td>
			<td bgcolor="#337AB7" align="center"><i>
			<font color="#FFFFFF"><b>Type</b></font></i></td>
			<td bgcolor="#337AB7" align="center"><i>
			<font color="#FFFFFF"><b>Description</b></font></i></td>
			
			<%
			if sw<>"Ttable" then 
			response.write("<td bgcolor=#337AB7 align=center><i>")
			response.write("<font color=#FFFFFF><b>From Table</b></font></i></td>")
			end if
			%>

		</tr>


<%
			do while not rstemp.eof
			response.write("<tr>")
			response.write("<td align=left valign=top>" & "<a href=lookup.asp?sw=Tnumber&q=" & rstemp("TagFull") & ">" & rstemp("TagFull") & "</a></td>")
			response.write("<td align=left valign=top>" & rstemp("TagName") & "</td>")
			response.write("<td align=left valign=top>" & "<a href=type.asp>" & rstemp("TagType") & "</a></td>")
			response.write("<td align=left valign=top>" & rstemp("TagDescription") & "</td>")

			if sw<>"Ttable" then
			response.write("<td align=left valign=top>" & "<a href=lookup.asp?sw=Ttable&q=" & rstemp("TableNumber") & ">" & rstemp("TableName") & "</a></td>")
			response.write("</td>")
			end if 
			
			rstemp.movenext
			loop
	%>

		
		</table>
				
</div>




<!--#include file ="footer.html"-->


</body>