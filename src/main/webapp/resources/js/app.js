$(document).ready(
			function() {

				// SUBMIT FORM
				$("#userSaveBtn").click(function(event) {
					event.preventDefault();
					ajaxPost();
				});

				function ajaxPost() {
					$.ajax({
						type : "POST",
						url : window.location + "save",
						data : $('form[name=userRegForm]').serialize(),
						success : function(result) {
					        var col = [];
					        for (var i = 0; i < result.length; i++) {
					            for (var key in result[i]) {
					                if (col.indexOf(key) === -1) {
					                    col.push(key);
					                }
					            }
					        }

					        // CREATE DYNAMIC TABLE.
					        var table = document.createElement("table");

					        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

					        var tr = table.insertRow(-1);                   // TABLE ROW.

					        for (var i = 0; i < col.length; i++) {
					            var th = document.createElement("th");      // TABLE HEADER.
					            th.innerHTML = col[i];
					            tr.appendChild(th);
					        }

					        // ADD JSON DATA TO THE TABLE AS ROWS.
					        for (var i = 0; i < result.length; i++) {

					            tr = table.insertRow(-1);

					            for (var j = 0; j < col.length; j++) {
					                var tabCell = tr.insertCell(-1);
					                tabCell.innerHTML = result[i][col[j]];
					            }
					        }

					        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
					        var divContainer = document.getElementById("showData");
					        divContainer.innerHTML = "";
					        divContainer.appendChild(table);
						},
						error : function(e) {
							alert("Error!")
						}
					});

				}
			})