<style>
table.browserref th td {
    border: 1px solid #d4d4d4;
    text-align: center;
    padding: 8px;
    vertical-align: top;
}
</style>

<script type="text/javascript" src="${request.contextPath}/assets/jquery-1.6.4.min.js" ></script>
<script type="text/javascript">
jQuery(document).ready(function(){
	var dataAjax = {fromInput : "CGK", toInput : "DPS", departureDate : "2017-09-30"}
	$("#tombol").click(function(e){
		$.ajax({
			url: "${request.contextPath}/test/soalNoTigaFunc",
			type: "GET",
			dataType: "html",
			data : dataAjax,
			complete : function (req, err) {
				var rtnObj = eval("("+req.responseText+")"), i = 0, str = ""
				
				for(i = 0; i < rtnObj.data.dataDua.length; i++){ 
					str += "<tr><td>"+(i+1)+" .</td>"
					str += "<td>"+rtnObj.data.dataSatu[(i*2)].CGK+" (CGK) - "
					str += rtnObj.data.dataSatu[(i*2)+1].DPS+" (DPS)</td>"
					str += "<td>"+rtnObj.data.dataDua[i]+"</td>"
					str += "<td>"+rtnObj.data.dataTiga[i]+"</td>"
					str + "</tr>"
				}
				$("#hargaTiket").append(str)
			}
		});
	});
});
</script>
Tiket AIR Asia
<br/>
<input type="text" id="fromInput" class="stations js-search-markets1" tabindex="3" name="fromInput" placeholder="Origin" value="Jakarta (CGK)" autocomplete="off" data-original-title="" title="" disabled>
<br/>
<input type="text" id="toInput" class="stations js-search-markets2" tabindex="4" name="toInput" placeholder="Destination" value="Bali (DPS)" autocomplete="off" data-original-title="" title="" disabled>
<br/>
<input type="text" id="search_from_date" name="departureDate" class="stations stations-date input-xsmall hasDatepicker" tabindex="5" placeholder="Depart date" value="2017-09-30" autocomplete="off" data-original-title="" title="" disabled>
<br/>
<button id="tombol" type="button">Tampilkan Tiket</button>
<br/>
<br/>
<table id="hargaTiket" border="1" style="border-collapse: collapse;width: 100%;" class="browserref">
<tr>
<td style="background-color: #DDEEFF;font-weight: bold;padding: 4px 4px 4px 4px;text-align: center;" >No.</td>
<td style="background-color: #DDEEFF;font-weight: bold;padding: 4px 4px 4px 4px;text-align: center;">Jadwal Brangkat & Tiba</td>
<td style="background-color: #DDEEFF;font-weight: bold;padding: 4px 4px 4px 4px;text-align: center;">Waktu Tempuh</td>
<td style="background-color: #DDEEFF;font-weight: bold;padding: 4px 4px 4px 4px;text-align: center;">Harga Tiket</td>
</td>
</table>