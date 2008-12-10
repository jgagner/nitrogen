-module (web_dragdrop).
-include ("wf.inc").
-export ([main/0, event/1, drop_event/2]).

main() ->
	Title = "Drag and Drop",
	Body = #template { file=onecolumn, title=Title, headline=Title, section1=[

		#draggable { group=group1, tag=drag1, clone=true, body="Drag 1<br>Clone<br>Revert"	},
		#draggable { group=group1, tag=drag2, clone=true, revert=false, body="Drag 2<br>Clone<br>No Revert"	},
		#draggable { group=group1, tag=drag3, clone=false, revert=true, body="Drag 3<br>No Clone<br>Revert"	},
		#draggable { group=group1, tag=drag4, clone=false, revert=false, body="Drag 4<br>No Clone<br>No Revert"	},
		#draggable { group=group2, tag=drag5, handle=handle, body=[
			#span { class=handle, text="(Handle)" },
			"<BR>",
			"Drag 5"
		]},
		#p{},
		#droppable { accept_groups=group1, tag=drop1, body="Drop 1 (accepts Drag 1 to 4)" },
		#droppable { accept_groups=[group1, group2], tag=drop2, body="Drop 2 (accepts everything)" }
		
	]},
	wf:render(Body).
	
drop_event(DragTag, DropTag) ->
	Message = wf:f("Dropped ~p on ~p", [DragTag, DropTag]),
	wf:flash(Message),
	ok.

event(_) -> ok.