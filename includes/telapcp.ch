#XCOMMAND User Function <cNome> => Function U_<cNome>
#XCOMMAND HTML Function <cNome> => Function H_<cNome>
#XCOMMAND USERHTML Function <cNome> => Function L_<cNome>
							  
#Command @ <nRow>,<nCol> TO <nToRow>,<nToCol> BROWSE <cAlias> [MARK <cMark>] [ENABLE <cEnable>] [ OBJECT <oBrw> ] [ FIELDS <aFields> ];
	=> [ <oBrw> := ] IW_Browse(<nRow>,<nCol>,<nToRow>,<nToCol>,<cAlias>,<cMark>,<cEnable> [,<aFields>])