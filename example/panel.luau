--!nonstrict

local function log(msg)
	noctalia.notify("mwe", msg);
end;


local function render()
	panel.render(ui.column({ gap = 16, padding = 24 }, {

		ui.button({
			text    = "Right-click me";
			variant = "primary";
			onRightClick = function()
				local ok = panel.openContextMenu({
					items = {
						{ id = "hello", label = "Hello" };
						{ kind = "separator" },
						{ id = "world", label = "World" };
					};
					onActivate = "onMenuAction";
				});
				log("openContextMenu returned: " .. tostring(ok));
			end;
		}),

	}));
end;


function onMenuAction(actionId, _context)
	log("menu action: " .. tostring(actionId));
end;


function onOpen(_context)
	render();
end;
