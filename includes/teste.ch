/*----------------------------------------------------------------------------//
!short: LISTBOX */

#xcommand REDEFINE LISTBOX [ <oLbx> VAR ] <cnVar> ;
				 [ <items: ITEMS, PROMPTS> <aItems> ]	;
				 [ <files: FILES, FILESPEC> <cFileSpec> ] ;
				 [ ID <nId> ] ;
				 [ ON CHANGE <uChange,...> ] ;
				 [ ON [ LEFT ] DBLCLICK <uLDblClick> ] ;
				 [ <of: OF, WINDOW, DIALOG > <oWnd> ] ;
				 [ <help:HELPID, HELP ID> <nHelpId> ] ;
				 [ VALID <uValid> ] ;
				 [ <color: COLOR,COLORS> <nClrFore> [,<nClrBack>] ] ;
				 [ MESSAGE <cMsg> ] ;
				 [ <update: UPDATE> ] ;
				 [ WHEN <uWhen> ] ;
				 [ BITMAPS <acBitmaps> ] ;
				 [ ON DRAWITEM <uBmpSelect> ] ;
		 => ;
			 [ <oLbx> := ] TListBox():ReDefine( <nId>, bSETGET(<cnVar>), <aItems>,;
				 [\{||<uChange>\}], <oWnd>, <nHelpId>, <acBitmaps>,;
				 <{uValid}>, <cFileSpec>, <nClrFore>, <nClrBack>,;
				 <{uLDblClick}>, <cMsg>, <.update.>, <{uWhen}>,;
				 [{|nItem|<uBmpSelect>}] )

#xcommand @ <nRow>, <nCol> LISTBOX [ <oLbx> VAR ] <cnVar> ;
				 [ <items: ITEMS, PROMPTS> <aList>	] ;
				 [ SIZE <nWidth>, <nHeight> ] ;
				 [ ON CHANGE <uChange> ] ;
				 [ ON [ LEFT ] DBLCLICK <uLDblClick> ] ;
				 [ <of: OF, WINDOW, DIALOG > <oWnd> ] ;
				 [ VALID <uValid> ] ;
				 [ <color: COLOR,COLORS> <nClrFore> [,<nClrBack>] ] ;
				 [ <pixel: PIXEL> ] ;
				 [ <design: DESIGN> ] ;
				 [ FONT <oFont> ] ;
				 [ MESSAGE <cMsg> ] ;
				 [ <update: UPDATE> ] ;
				 [ WHEN <uWhen> ] ;
				 [ BITMAPS <aBitmaps> ] ;
				 [ ON DRAWITEM <uBmpSelect> ] ;
				 [ <multi: MULTI, MULTIPLE, MULTISEL> ] ;
				 [ <sort: SORT> ] ;
				 [ ON RIGHT CLICK <uRClick> ] ;
		 => ;
			 [ <oLbx> := ] TListBox():New( <nRow>, <nCol>, bSETGET(<cnVar>),;
				 <aList>, <nWidth>, <nHeight>, <{uChange}>, <oWnd>, <{uValid}>,;
				 <nClrFore>, <nClrBack>, <.pixel.>, <.design.>, <{uLDblClick}>,;
				 <oFont>, <cMsg>, <.update.>, <{uWhen}>, <aBitmaps>,;
				 [{|nItem|<uBmpSelect>}], <.multi.>, <.sort.>,; 
				 [\{|nRow,nCol,nFlags|<uRClick>\}] )

