/*
===========================================================================
Copyright (C) 1999-2005 Id Software, Inc.

This file is part of Quake III Arena source code.

Quake III Arena source code is free software; you can redistribute it
and/or modify it under the terms of the GNU General Public License as
published by the Free Software Foundation; either version 2 of the License,
or (at your option) any later version.

Quake III Arena source code is distributed in the hope that it will be
useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Quake III Arena source code; if not, write to the Free Software
Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
===========================================================================
*/
//
#include "ui_local.h"

#define BACK0 "menu/buttons/back0"
#define BACK1 "menu/buttons/back1"
#define BARROWLT0 "menu/arrows/bigblu_lt0"
#define BARROWLT1 "menu/arrows/bigblu_lt1"
#define BARROWRT0 "menu/arrows/bigblu_rt0"
#define BARROWRT1 "menu/arrows/bigblu_rt1"
#define BARROWUP0 "menu/arrows/bigyel_up0"
#define BARROWUP1 "menu/arrows/bigyel_up1"
#define BARROWDN0 "menu/arrows/bigyel_dn0"
#define BARROWDN1 "menu/arrows/bigyel_dn1"
#define SICONSHADOW "menu/art/iconshadow"

#define ID_BACK 10

#define ID_NAME 20
#define ID_HANDICAP 21
#define ID_GENDER 22
#define ID_EFFECTS 23
#define ID_PREVMODEL 24
#define ID_NEXTMODEL 25
#define ID_PREVSKIN 26
#define ID_NEXTSKIN 27
#define ID_MICON 28 //+5
#define ID_SICON 34 //+11
#define ID_PLAYERMODEL 46
#define ID_SPRAYCOLOR 47
#define ID_NEXTLOGO 48
#define ID_PREVLOGO 49

#define MAX_NAMELENGTH 20

#define MODELSPERPAGE 6
#define SKINGRID_COLS 3
#define SKINGRID_ROWS 4
#define SKINSPERPAGE (SKINGRID_ROWS * SKINGRID_COLS)
#define GRID_YPOS 158
#define GRID_XPOS 644

#define XPOSITION 124
#define YPOSITION 172

typedef struct {
	menuframework_s menu;

	menutext_s banner;
	menubitmap_s framer;
	menubitmap_s player;

	menutext_s nameheader;
	menufield_s name;
	menutext_s handicapheader;
	menulist_s handicap;
	menutext_s genderheader;
	menulist_s gender;
	menutext_s logoheader;
	menulist_s effects;

	menubitmap_s back;
	menubitmap_s model;

	menubitmap_s arrowleft;
	menubitmap_s arrowright;
	menubitmap_s arrowup;
	menubitmap_s arrowdown;

	menubitmap_s model_icons[MODELSPERPAGE];
	menubitmap_s skin_icons[SKINSPERPAGE];

	menubitmap_s logoleft;
	menubitmap_s logoright;

	menubitmap_s spraycolor;

	int firstmodel;
	int firstskin;
	int chosenskins[2];
	qboolean modelhold;
	int lastCursorX;
	int slogo_num;
	int nextGestureTime;

	menubitmap_s item_null;

	playerInfo_t playerinfo;
	int current_fx;
	char playerModel[MAX_QPATH];
} playersettings_t;

static playersettings_t s_playersettings;

static int gamecodetoui[] = {4, 2, 3, 0, 5, 1, 6};
static int uitogamecode[] = {4, 6, 2, 3, 1, 5, 7};

static const char *gender_items[] = {S_COLOR_WHITE "Model", S_COLOR_WHITE "Male", S_COLOR_WHITE "Female", S_COLOR_WHITE "Neuter", S_COLOR_WHITE "None", NULL};

static const char *handicap_items[] = {S_COLOR_WHITE "None", S_COLOR_WHITE "90", S_COLOR_WHITE "80", S_COLOR_WHITE "70", S_COLOR_WHITE "60",
									   S_COLOR_WHITE "50", S_COLOR_WHITE "40", S_COLOR_WHITE "30", S_COLOR_WHITE "20", S_COLOR_WHITE "10",
									   NULL};

#define MAX_UIMODELS 96 // 32
#define MAX_SKINS 640	// padman has 18 skins ...
#define MAX_MODELSKINNAME_STR 64
typedef struct {
	char name[MAX_MODELSKINNAME_STR];
	qhandle_t icon;
} SkinData_t;

typedef struct {
	qhandle_t modelicons[MAX_UIMODELS];
	qhandle_t modeliconsB[MAX_UIMODELS];
	int nummodel;
	int lastskinicon[MAX_UIMODELS];
	SkinData_t modelskins[MAX_SKINS];
} ps_playericons_t;

static ps_playericons_t ps_playericons;

/*
=================
UI_PlayerSettings_DrawName
=================
*/
static void UI_PlayerSettings_DrawName(void *self) {
	menufield_s *f;
	qboolean focus;
	int style;
	const char *txt;
	char c;
	const float *color;
	int n;
	int basex, x, y;

	f = (menufield_s *)self;
	basex = f->generic.x;
	y = f->generic.y;
	focus = (f->generic.parent->cursor == f->generic.menuPosition);

	style = UI_LEFT | UI_SMALLFONT;
	color = text_color_normal;
	if (focus) {
		style |= UI_PULSE;
		color = text_color_highlight;
	}

	basex += 8;
	y += PROP_HEIGHT;
	txt = f->field.buffer;
	color = g_color_table[ColorIndex(COLOR_WHITE)];
	x = basex;
	while ((c = *txt) != 0) {
		if (!focus && Q_IsColorString(txt)) {
			n = ColorIndex(*(txt + 1));
			if (n == 0) {
				n = 7;
			}
			color = g_color_table[n];
			txt += 2;
			continue;
		}
		UI_DrawChar(x, y, c, style, color);
		txt++;
		x += SMALLCHAR_WIDTH;
	}

	// draw cursor if we have focus
	if (focus) {
		if (trap_Key_GetOverstrikeMode()) {
			c = FONT_ASCII_FULLBLOCK;
		} else {
			c = FONT_ASCII_UNDERLINE;
		}

		style &= ~UI_PULSE;
		style |= UI_BLINK;

		UI_DrawChar(basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white);
	}
}

/*
=================
UI_PlayerSettings_DrawPlayer
=================
*/
static void UI_PlayerSettings_DrawPlayer(void *self) {
	menubitmap_s *b;
	vec3_t viewangles;
	char buf[MAX_QPATH];

	trap_Cvar_VariableStringBuffer("model", buf, sizeof(buf));
	if (strcmp(buf, s_playersettings.playerModel) != 0) {
		UI_PlayerInfo_SetModel(&s_playersettings.playerinfo, buf);
		Q_strncpyz(s_playersettings.playerModel, buf, sizeof(s_playersettings.playerModel));

		viewangles[YAW] = 180 + 10;
		viewangles[PITCH] = 0;
		viewangles[ROLL] = 0;
		UI_PlayerInfo_SetInfo(&s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_NIPPER,
							  qfalse);
		s_playersettings.nextGestureTime = uis.realtime + 2000;
	}

	b = (menubitmap_s *)self;

	UI_DrawPlayer(b->generic.x, b->generic.y, b->width, b->height, &s_playersettings.playerinfo, uis.realtime / 2);

}

/*
=================
UI_PlayerSettings_SaveChanges
=================
*/
static void UI_PlayerSettings_SaveChanges(void) {
	int g;

	// name
	trap_Cvar_Set("name", s_playersettings.name.field.buffer);

	// handicap
	trap_Cvar_SetValue("handicap", 100 - s_playersettings.handicap.curvalue * 10);

	// effects color
	trap_Cvar_SetValue("color1", uitogamecode[s_playersettings.effects.curvalue]);

	// gender
	g = s_playersettings.gender.curvalue;
	if (g > 3) {
		trap_Cvar_Set("sex", "none");
	} else if (g == 1) {
		trap_Cvar_Set("sex", "male");
	} else if (g == 2) {
		trap_Cvar_Set("sex", "female");
	} else if (g == 3) {
		trap_Cvar_Set("sex", "neuter");
	} else {
		trap_Cvar_Set("sex", "model");
	}

	// spray logo
	trap_Cvar_Set("syc_logo", uis.spraylogoNames[s_playersettings.slogo_num]);

	if (trap_Cvar_VariableValue("cl_paused")) {
		trap_Cmd_ExecuteText(EXEC_APPEND, va("selectlogo \"%s\"\n", uis.spraylogoNames[s_playersettings.slogo_num]));
	}
}

/*
=================
UI_PlayerSettings_MenuKey
=================
*/
static sfxHandle_t UI_PlayerSettings_MenuKey(int key) {
	int newweapon;

	if (key == K_MOUSE2 || key == K_ESCAPE) {
		UI_PlayerSettings_SaveChanges();
	}

	if (key == K_MWHEELDOWN || key == K_PGDN) {
		if (s_playersettings.playerinfo.weapon >= WP_IMPERIUS)
			newweapon = WP_PUNCHY;
		else
			newweapon = s_playersettings.playerinfo.weapon + 1;

		UI_PlayerInfo_SetInfo(&s_playersettings.playerinfo, LEGS_IDLE,
							  (newweapon == WP_PUNCHY ? TORSO_STAND2 : TORSO_STAND),
							  s_playersettings.playerinfo.viewAngles, vec3_origin, newweapon, qfalse);
	} else if (key == K_MWHEELUP || key == K_PGUP) {
		if (s_playersettings.playerinfo.weapon <= WP_PUNCHY)
			newweapon = WP_IMPERIUS;
		else
			newweapon = s_playersettings.playerinfo.weapon - 1;

		UI_PlayerInfo_SetInfo(&s_playersettings.playerinfo, LEGS_IDLE,
							  (newweapon == WP_PUNCHY ? TORSO_STAND2 : TORSO_STAND),
							  s_playersettings.playerinfo.viewAngles, vec3_origin, newweapon, qfalse);
	}

	return Menu_DefaultKey(&s_playersettings.menu, key);
}

/*
=================
UI_PlayerSettings_SetMenuItems
=================
*/
static void UI_PlayerSettings_SetMenuItems(void) {
	vec3_t viewangles;
	int c;
	int h;
	char gStr[32];

	// name
	Q_strncpyz(s_playersettings.name.field.buffer, UI_Cvar_VariableString("name"),
			   sizeof(s_playersettings.name.field.buffer));

	// effects color
	c = UI_GetCvarInt("color1") - 1;
	if (c < 0 || c > 6) {
		c = 6;
	}
	s_playersettings.effects.curvalue = gamecodetoui[c];

	// model/skin
	memset(&s_playersettings.playerinfo, 0, sizeof(playerInfo_t));

	viewangles[YAW] = 180 - 30;
	viewangles[PITCH] = 0;
	viewangles[ROLL] = 0;

	UI_PlayerInfo_SetModel(&s_playersettings.playerinfo, UI_Cvar_VariableString("model"));
	UI_PlayerInfo_SetInfo(&s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_NIPPER,
						  qfalse);

	{
		int i;
		char modelname[32];
		int mnLen;
		Q_strncpyz(modelname, UI_Cvar_VariableString("model"), sizeof(modelname));

		for (i = 0; i < sizeof(modelname); i++)
			if (modelname[i] == '/') {
				modelname[i] = '\0';
				break;
			}

		mnLen = strlen(modelname);

		for (i = 0; i < ps_playericons.nummodel; ++i) {
			const char *modelskinname = ps_playericons.modelskins[ps_playericons.lastskinicon[i]].name;
			if (!Q_stricmpn(modelname, modelskinname, mnLen)) {
				s_playersettings.firstskin = i == 0 ? 0 : (ps_playericons.lastskinicon[i - 1] + 1);

				s_playersettings.chosenskins[0] = s_playersettings.firstskin;
				s_playersettings.chosenskins[1] = ps_playericons.lastskinicon[i];

				s_playersettings.firstmodel =
					(i + MODELSPERPAGE < ps_playericons.nummodel) ? i : ps_playericons.nummodel - MODELSPERPAGE;
				break;
			}
		}
	}

	// handicap
	h = Com_Clamp(10, 100, trap_Cvar_VariableValue("handicap"));
	s_playersettings.handicap.curvalue = 10 - h / 10;

	// gender
	trap_Cvar_VariableStringBuffer("sex", gStr, sizeof(gStr));
	if (!Q_stricmp(gStr, "none")) {
		s_playersettings.gender.curvalue = 4;
	} else if (!Q_stricmp(gStr, "neuter")) {
		s_playersettings.gender.curvalue = 3;
	} else if (!Q_stricmp(gStr, "female")) {
		s_playersettings.gender.curvalue = 2;
	} else if (!Q_stricmp(gStr, "male")) {
		s_playersettings.gender.curvalue = 1;
	} else {
		s_playersettings.gender.curvalue = 0;
	}
}

static int GetSpecialSkinScore(const char *iconPath) {
	if (NULL != Q_stristr(iconPath, "/default"))
		return 3;
	else if (NULL != Q_stristr(iconPath, "/blue"))
		return 2;
	else if (NULL != Q_stristr(iconPath, "/red"))
		return 1;
	return 0;
}

static int SkinComp(const void *vA, const void *vB) {
	const SkinData_t *a = (const SkinData_t *)vA;
	const SkinData_t *b = (const SkinData_t *)vB;

	const int a_special = GetSpecialSkinScore(a->name);
	const int b_special = GetSpecialSkinScore(b->name);

	if (a_special || b_special) {
		/// "higher score" should be "less" in compare (so that they get to the top by qsort) ... that's why it's "b-a"
		/// and not "a-b"
		return b_special - a_special;
	} else {
		return Q_stricmp(a->name, b->name);
	}
}

static void sortSkins(int first, int last) {
	qsort(&(ps_playericons.modelskins[first]), last - first + 1, sizeof(SkinData_t), SkinComp);
}

#define MAX_MODEL_DIR_LIST 2048
#define MAX_MODELFOLDER_FILELIST 2048

static const char fixedModelList[] =
	"padman\0padgirl\0monster\0piratepad\0padlilly\0fatpad\0beachpad\0paddybell\0padcho\0padking\0padpunk";
static const int numFixedModels = 11;

static qboolean IsEntryInList(const char *modelName, const char *list, int numListEntries) {
	int i = 0;
	const char *entryPtr = list;

	while (i < numListEntries) {
		const int entryLen = strlen(entryPtr);

		if (0 == Q_stricmp(modelName, entryPtr)) {
			return qtrue;
		}

		entryPtr += entryLen + 1;
		++i;
	}

	return qfalse;
}

static qboolean IsAFixedModelListEntry(const char *modelName) {
	return IsEntryInList(modelName, fixedModelList, numFixedModels);
}

static void TweakModelFolderList(char *list, int *numEntries) {
	char newList[MAX_MODEL_DIR_LIST];
	int newNumEntries = 0;
	char *entryPtr = NULL;
	char *newEntryPtr = NULL;
	int i = 0;

	memcpy(newList, fixedModelList, sizeof(fixedModelList));
	newNumEntries = numFixedModels;

	entryPtr = list;
	newEntryPtr = newList + sizeof(fixedModelList);
	while (i < (*numEntries)) {
		const int entryLen = strlen(entryPtr);

		/// HACKAROUND(SL): pk3-filesystem gives directory-names with '/' suffix (os-filesystem doesn't)
		if (entryPtr[entryLen - 1] == '/')
			entryPtr[entryLen - 1] = '\0';

		/// NOTE(SL): just recognized that there are duplicates if the same folder is in *.pk3 and os-filesystem -.-
		if (!IsAFixedModelListEntry(entryPtr) && !IsEntryInList(entryPtr, newList, newNumEntries)) {
			const int destSize = MAX_MODEL_DIR_LIST - (newEntryPtr - newList);
			if (destSize < (entryLen + 1)) {
				Com_Printf("ERROR: hit limit for modellist buffer ...");
				return;
			}

			Q_strncpyz(newEntryPtr, entryPtr, destSize);
			newEntryPtr += strlen(newEntryPtr) + 1;
			++newNumEntries;
		}

		entryPtr += entryLen + 1;
		++i;
	}

	memcpy(list, newList, MAX_MODEL_DIR_LIST);
	*numEntries = newNumEntries;
}

/*
=================
UI_PlayerSettings_BuildList
=================
*/
static void UI_PlayerSettings_BuildList(void) {
	int numdirs = 0;
	int numfiles = 0;
	char dirlist[MAX_MODEL_DIR_LIST];
	char filelist[MAX_MODELFOLDER_FILELIST];
	char skinname[64];
	char *dirptr = NULL;
	char *fileptr = NULL;
	int i = 0;
	int j = 0;
	int dirlen = 0;
	int filelen = 0;
	int tmpskinnum = 0;

	memset(&ps_playericons, 0, sizeof(ps_playericons));

	// iterate directory of all player models
	numdirs = trap_FS_GetFileList("models/wop_players", "/", dirlist, MAX_MODEL_DIR_LIST);
	TweakModelFolderList(dirlist, &numdirs);

	dirptr = dirlist;
	for (i = 0; i < numdirs && ps_playericons.nummodel < MAX_UIMODELS; i++, dirptr += dirlen + 1) {

		dirlen = strlen(dirptr);

		if (dirlen && dirptr[dirlen - 1] == '/')
			dirptr[dirlen - 1] = '\0';

		if (!strcmp(dirptr, ".") || !strcmp(dirptr, "..") || *dirptr == '\0')
			continue;

		if (!(ps_playericons.modelicons[ps_playericons.nummodel] =
				  trap_R_RegisterShaderNoMip(va("models/wop_players/%s/wop_menu", dirptr))))
			continue;
		ps_playericons.modeliconsB[ps_playericons.nummodel] =
			trap_R_RegisterShaderNoMip(va("models/wop_players/%s/wop_menuB", dirptr));

		// iterate all skin files in directory
		numfiles =
			trap_FS_GetFileList(va("models/wop_players/%s", dirptr), "tga;png", filelist, MAX_MODELFOLDER_FILELIST);
		fileptr = filelist;
		for (j = 0; j < numfiles && ps_playericons.lastskinicon[ps_playericons.nummodel] < MAX_SKINS;
			 j++, fileptr += filelen + 1) {
			filelen = strlen(fileptr);

			COM_StripExtension(fileptr, skinname, sizeof(skinname));

			// look for icon_????
			if (!Q_stricmpn(skinname, "icon_", 5)) { 
				ps_playericons.modelskins[tmpskinnum].icon =
					trap_R_RegisterShaderNoMip(va("models/wop_players/%s/%s", dirptr, skinname));
				Com_sprintf(ps_playericons.modelskins[tmpskinnum].name, MAX_MODELSKINNAME_STR, "%s/%s", dirptr,
							(char *)(&skinname[5]));

				tmpskinnum++;
			}
		}
		ps_playericons.lastskinicon[ps_playericons.nummodel] = tmpskinnum - 1;
		ps_playericons.nummodel++;
	}

	j = 0;
	for (i = 0; i < ps_playericons.nummodel; ++i) {
		sortSkins(j, ps_playericons.lastskinicon[i]);
		j = ps_playericons.lastskinicon[i] + 1;
	}
}

/*
=================
UI_PlayerSettings_Draw
=================
*/
static void UI_PlayerSettings_Draw(void) {
	int i, x, y;
	int prevlogo, nextlogo;
	int mouseOverColor = -1;

	static char modelname[32];
	if (s_playersettings.nextGestureTime == 0)
		s_playersettings.nextGestureTime = uis.realtime + 5000;

	if (s_playersettings.nextGestureTime < uis.realtime) {
		UI_PlayerInfo_SetInfo(&s_playersettings.playerinfo, LEGS_IDLE, TORSO_GESTURE,
							  s_playersettings.playerinfo.viewAngles, vec3_origin, s_playersettings.playerinfo.weapon,
							  qfalse);

		s_playersettings.nextGestureTime = uis.realtime + 15000;
	}

	if (s_playersettings.modelhold) {
		if (trap_Key_IsDown(K_MOUSE1)) {
			s_playersettings.playerinfo.viewAngles[YAW] = s_playersettings.playerinfo.legs.yawAngle =
				(s_playersettings.playerinfo.torso.yawAngle += uis.cursorx - s_playersettings.lastCursorX);

			s_playersettings.lastCursorX = uis.cursorx;
		} else
			s_playersettings.modelhold = qfalse;
	}

	for (i = 0; i < MODELSPERPAGE; i++) {
		s_playersettings.model_icons[i].shader = ps_playericons.modelicons[i + s_playersettings.firstmodel];
		s_playersettings.model_icons[i].focusshader = ps_playericons.modeliconsB[i + s_playersettings.firstmodel];
	}

	for (i = 0; i < SKINSPERPAGE; i++) {
		const int currentSkinIndex = s_playersettings.firstskin + i;

		if (currentSkinIndex > s_playersettings.chosenskins[1]) {
			s_playersettings.skin_icons[i].generic.flags |= (QMF_HIDDEN | QMF_INACTIVE);
		} else {
			s_playersettings.skin_icons[i].shader = ps_playericons.modelskins[currentSkinIndex].icon;
			s_playersettings.skin_icons[i].generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
		}
	}

	i = trap_Cvar_VariableValue("syc_color");
	i = Com_Clamp(0, (NUM_SPRAYCOLORS - 1), i);

	x = XPOSITION - 32;
	y = 308;
	UI_SetColor(spraycolors[i]);
	UI_DrawHandlePic(x, y, 64, 64, uis.spraylogoShaders[s_playersettings.slogo_num]);

	if (s_playersettings.slogo_num - 1 < 0) {
		prevlogo = uis.spraylogosLoaded - 1;
	} else {
		prevlogo = s_playersettings.slogo_num - 1;
	}

	x = XPOSITION - 64 - 8;
	y = 332;
	UI_SetColor(spraycolors[i]);
	UI_DrawHandlePic(x, y, 32, 32, uis.spraylogoShaders[prevlogo]);
	if (uis.cursorx >= x && uis.cursorx <= (x + 32) && uis.cursory >= y && uis.cursory <= (y + 32)) {
		UI_SetColor(colorTBlack33);
		UI_DrawHandlePic(x, y, 32, 32, uis.spraylogoShaders[prevlogo]);
	}

	if (s_playersettings.slogo_num + 1 >= uis.spraylogosLoaded) {
		nextlogo = 0;
	} else {
		nextlogo = s_playersettings.slogo_num + 1;
	}

	x = XPOSITION + 32 + 8;
	UI_SetColor(spraycolors[i]);
	UI_DrawHandlePic(x, y, 32, 32, uis.spraylogoShaders[nextlogo]);
	if (uis.cursorx >= x && uis.cursorx <= (x + 32) && uis.cursory >= y && uis.cursory <= (y + 32)) {
		UI_SetColor(colorTBlack33);
		UI_DrawHandlePic(x, y, 32, 32, uis.spraylogoShaders[nextlogo]);
	}

	UI_SetColor(NULL);

	// spray color selection boxes
	x = XPOSITION - 58;
	y = 382 + 4;
	for (i = 0; i < 6; ++i) {
		UI_FillRect(x + (16 + 4) * i, y, 16, 16, spraycolors[i]);
		if (uis.cursorx >= (x + (16 + 4) * i) && uis.cursorx <= (x + (16 + 4) * i + 16) && uis.cursory >= y && uis.cursory <= (y + 16)) {
			UI_FillRect(x + (16 + 4) * i, y, 16, 16, colorTBlack33);
			mouseOverColor = i;
		}
	}

	Q_strncpyz(modelname, UI_Cvar_VariableString("model"), sizeof(modelname));

	for (i = 0; i < sizeof(modelname); i++) {
		if (modelname[i] == '/') {
			modelname[i] = '\0';
			break;
		}
	}

	if (!Q_stricmp(&modelname[i + 1], "default") ) {
		UI_DrawProportionalString(432, 446, modelname, UI_CENTER | UI_SMALLFONT, colorWhite);
	} else {
		UI_DrawProportionalString(432, 446, &modelname[i + 1], UI_CENTER | UI_SMALLFONT, colorWhite);
	}

	Menu_Draw(&s_playersettings.menu);
}

/*
=================
UI_PlayerSettings_Update
=================
*/
static void UI_PlayerSettings_Update(void) {
	const int skins = s_playersettings.chosenskins[1] - s_playersettings.chosenskins[0];
	if (ps_playericons.nummodel > MODELSPERPAGE) {
		s_playersettings.arrowleft.generic.flags &= ~(QMF_INACTIVE | QMF_HIDDEN);
		s_playersettings.arrowright.generic.flags &= ~(QMF_INACTIVE | QMF_HIDDEN);
		s_playersettings.arrowleft.generic.flags |= QMF_GRAYED;
		s_playersettings.arrowright.generic.flags |= QMF_GRAYED;

		if (s_playersettings.firstmodel > 0) {
			s_playersettings.arrowleft.generic.flags &= ~QMF_GRAYED;
		}

		if (s_playersettings.firstmodel + MODELSPERPAGE < ps_playericons.nummodel) {
			s_playersettings.arrowright.generic.flags &= ~QMF_GRAYED;
		}
	} else {
		s_playersettings.arrowleft.generic.flags |= QMF_INACTIVE | QMF_HIDDEN;
		s_playersettings.arrowright.generic.flags |= QMF_INACTIVE | QMF_HIDDEN;
	}

	if (skins > SKINSPERPAGE) {
		s_playersettings.arrowup.generic.flags &= ~(QMF_INACTIVE | QMF_HIDDEN);
		s_playersettings.arrowdown.generic.flags &= ~(QMF_INACTIVE | QMF_HIDDEN);
		s_playersettings.arrowup.generic.flags |= QMF_GRAYED;
		s_playersettings.arrowdown.generic.flags |= QMF_GRAYED;

		if (s_playersettings.firstskin > s_playersettings.chosenskins[0]) {
			s_playersettings.arrowup.generic.flags &= ~QMF_GRAYED;
		}

		if (s_playersettings.firstskin + (SKINSPERPAGE - 1) < s_playersettings.chosenskins[1]) {
			s_playersettings.arrowdown.generic.flags &= ~QMF_GRAYED;
		}
	} else {
		s_playersettings.arrowup.generic.flags |= QMF_INACTIVE | QMF_HIDDEN;
		s_playersettings.arrowdown.generic.flags |= QMF_INACTIVE | QMF_HIDDEN;
	}
}

/*
=================
UI_PlayerSettings_DrawModelIcon
=================
*/
static void UI_PlayerSettings_DrawModelIcon(void *self) {
	menubitmap_s *b;
	int x;
	int y;
	int w;
	int h;

 	b = (menubitmap_s *)self;

	// used to refresh shader
	if (b->generic.name && !b->shader) {
		b->shader = trap_R_RegisterShaderNoMip(b->generic.name);
		if (!b->shader && b->errorpic)
			b->shader = trap_R_RegisterShaderNoMip(b->errorpic);
	}

	if (b->shader) { // if there is no icon there should also be no focispic
		x = b->generic.x;
		y = b->generic.y;
		w = b->width;
		h = b->height;
		if ((Menu_ItemAtCursor(b->generic.parent) == b && b->focusshader)) {
			UI_DrawHandlePic(x, y, w, h, b->focusshader);
		} else if (b->shader) {
			UI_DrawHandlePic(x, y, w, h, b->shader);
		}
	}
}

/*
=================
UI_PlayerSettings_DrawSkinIcon
=================
*/
static void UI_SelectSkin_DrawSkinIcon(void *self) {
	menubitmap_s *b;
	int x;
	int y;
	int w;
	int h;

 	b = (menubitmap_s *)self;

	// used to refresh shader
	if (b->generic.name && !b->shader) {
		b->shader = trap_R_RegisterShaderNoMip(b->generic.name);
		if (!b->shader && b->errorpic)
			b->shader = trap_R_RegisterShaderNoMip(b->errorpic);
	}

	if (b->shader) { // if there is no icon there should also be no shadow
		x = b->generic.x;
		y = b->generic.y;
		w = b->width;
		h = b->height;
		if (!(Menu_ItemAtCursor(b->generic.parent) == b)) {
			UI_DrawNamedPic(x + 5, y + 5, w, h, SICONSHADOW);
		}
		UI_DrawHandlePic(x, y, w, h, b->shader);
	}
}

/*
=================
UI_PlayerSettings_MenuEvent
=================
*/
static void UI_PlayerSettings_MenuEvent(void *ptr, int event) {
	int tmpid, i;

	if (event != QM_ACTIVATED) {
		return;
	}

	tmpid = ((menucommon_s *)ptr)->id;
	switch (tmpid) {

	case ID_HANDICAP:
	case ID_GENDER:
		break;

	case ID_BACK:
		UI_PlayerSettings_SaveChanges();
		UI_PopMenu();
		break;

	case ID_PREVMODEL:
		if (s_playersettings.firstmodel - MODELSPERPAGE > MODELSPERPAGE) {
			s_playersettings.firstmodel -= MODELSPERPAGE;
		} else {
			s_playersettings.firstmodel = 0;
		}
		UI_PlayerSettings_Update();
		break;
	case ID_NEXTMODEL:
		if (s_playersettings.firstmodel + 2 * MODELSPERPAGE < ps_playericons.nummodel) {
			s_playersettings.firstmodel += MODELSPERPAGE;
		} else {
			s_playersettings.firstmodel = ps_playericons.nummodel - MODELSPERPAGE;
		} 
		UI_PlayerSettings_Update();
		break;
	case ID_PREVSKIN:
		if (s_playersettings.firstskin > s_playersettings.chosenskins[0]) {
			s_playersettings.firstskin = s_playersettings.firstskin - SKINSPERPAGE;
			UI_PlayerSettings_Update();
		}
		break;
	case ID_NEXTSKIN:
		if (s_playersettings.firstskin + 2 < s_playersettings.chosenskins[1]) {
			s_playersettings.firstskin = s_playersettings.firstskin + SKINSPERPAGE;
			UI_PlayerSettings_Update();
		}
		break;
	case ID_MICON:
	case ID_MICON + 1:
	case ID_MICON + 2:
	case ID_MICON + 3:
	case ID_MICON + 4:
	case ID_MICON + 5:
		tmpid += (s_playersettings.firstmodel - ID_MICON);
		if (tmpid > 0)
			s_playersettings.chosenskins[0] = s_playersettings.firstskin = ps_playericons.lastskinicon[tmpid - 1] + 1;
		else
			s_playersettings.chosenskins[0] = s_playersettings.firstskin = 0;
		s_playersettings.chosenskins[1] = ps_playericons.lastskinicon[tmpid];

		for (i = s_playersettings.chosenskins[0]; i <= s_playersettings.chosenskins[1]; i++) {
			if (strstr(ps_playericons.modelskins[i].name, "default") != NULL) {
				char tmp[64], *chrptr;

				Q_strncpyz(tmp, ps_playericons.modelskins[i].name, sizeof(tmp));
				if ((chrptr = strchr(tmp, '/')) != NULL)
					*chrptr = '\0';
				trap_S_StartLocalSound(trap_S_RegisterSound(va("sound/feedback/players/%s", Q_strlwr(tmp)), qfalse),
									   CHAN_LOCAL_SOUND);

				trap_Cvar_Set("model", ps_playericons.modelskins[i].name);
				trap_Cvar_Set("headmodel", ps_playericons.modelskins[i].name);
				trap_Cvar_Set("team_model", ps_playericons.modelskins[i].name);
				trap_Cvar_Set("team_headmodel", ps_playericons.modelskins[i].name);
				break;
			}
		}
		UI_PlayerSettings_Update();
		break;
	case ID_SICON:
	case ID_SICON + 1:
	case ID_SICON + 2:
	case ID_SICON + 3:
	case ID_SICON + 4:
	case ID_SICON + 5:
	case ID_SICON + 6:
	case ID_SICON + 7:
	case ID_SICON + 8:
	case ID_SICON + 9:
	case ID_SICON + 10:
	case ID_SICON + 11:
		trap_Cvar_Set("model", ps_playericons.modelskins[tmpid - ID_SICON + s_playersettings.firstskin].name);
		trap_Cvar_Set("headmodel", ps_playericons.modelskins[tmpid - ID_SICON + s_playersettings.firstskin].name);
		trap_Cvar_Set("team_model", ps_playericons.modelskins[tmpid - ID_SICON + s_playersettings.firstskin].name);
		trap_Cvar_Set("team_headmodel", ps_playericons.modelskins[tmpid - ID_SICON + s_playersettings.firstskin].name);
		break;
	case ID_PLAYERMODEL:
		if (trap_Key_IsDown(K_MOUSE1))
			s_playersettings.modelhold = qtrue;
		s_playersettings.lastCursorX = uis.cursorx;
		break;
	case ID_SPRAYCOLOR:
		trap_Cvar_Set("syc_color", va("%i", (uis.cursorx - ((menucommon_s *)ptr)->x) / 20));
		break;

	case ID_PREVLOGO:
		if (--s_playersettings.slogo_num < 0)
			s_playersettings.slogo_num = uis.spraylogosLoaded - 1; // close the circle
		break;

	case ID_NEXTLOGO:
		if (++s_playersettings.slogo_num >= uis.spraylogosLoaded)
			s_playersettings.slogo_num = 0; // close the circle
		break;
	}
}

/*
=================
UI_PlayerSettings_MenuInit
=================
*/
static void UI_PlayerSettings_MenuInit(void) {
	int i, j, k;
	int x, y;

	memset(&s_playersettings, 0, sizeof(playersettings_t));

	UI_PlayerSettings_Cache();

	s_playersettings.menu.key = UI_PlayerSettings_MenuKey;
	s_playersettings.menu.wrapAround = qtrue;
	s_playersettings.menu.fullscreen = qtrue;
	s_playersettings.chosenskins[1] = ps_playericons.lastskinicon[0];
	s_playersettings.menu.draw = UI_PlayerSettings_Draw;
	s_playersettings.menu.bgparts = BGP_PLAYER;

	s_playersettings.item_null.generic.type = MTYPE_BITMAP;
	s_playersettings.item_null.generic.flags = QMF_LEFT_JUSTIFY | QMF_MOUSEONLY | QMF_SILENT;
	s_playersettings.item_null.generic.x = 0;
	s_playersettings.item_null.generic.y = 0;
	s_playersettings.item_null.width = 864;
	s_playersettings.item_null.height = 486;
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.item_null);

	s_playersettings.player.generic.type = MTYPE_BITMAP;
	s_playersettings.player.generic.flags = QMF_MOUSEONLY | QMF_SILENT;
	s_playersettings.player.generic.ownerdraw = UI_PlayerSettings_DrawPlayer;
	s_playersettings.player.generic.x = 217;
	s_playersettings.player.generic.y = 100;
	s_playersettings.player.width = 430;
	s_playersettings.player.height = 386;
	s_playersettings.player.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.player.generic.id = ID_PLAYERMODEL;
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.player);

	s_playersettings.arrowleft.generic.type = MTYPE_BITMAP;
	s_playersettings.arrowleft.generic.name = BARROWLT0;
	s_playersettings.arrowleft.generic.flags = QMF_LEFT_JUSTIFY | QMF_HIGHLIGHT_IF_FOCUS;
	s_playersettings.arrowleft.generic.x = 20;
	s_playersettings.arrowleft.generic.y = 20;
	s_playersettings.arrowleft.generic.id = ID_PREVMODEL;
	s_playersettings.arrowleft.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.arrowleft.width = 30;
	s_playersettings.arrowleft.height = 70;
	s_playersettings.arrowleft.focuspic = BARROWLT1;
	s_playersettings.arrowleft.focuspicinstead = qtrue;

	s_playersettings.arrowright.generic.type = MTYPE_BITMAP;
	s_playersettings.arrowright.generic.name = BARROWRT0;
	s_playersettings.arrowright.generic.flags = QMF_LEFT_JUSTIFY | QMF_HIGHLIGHT_IF_FOCUS;
	s_playersettings.arrowright.generic.x = 814;
	s_playersettings.arrowright.generic.y = 20;
	s_playersettings.arrowright.generic.id = ID_NEXTMODEL;
	s_playersettings.arrowright.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.arrowright.width = 30;
	s_playersettings.arrowright.height = 70;
	s_playersettings.arrowright.focuspic = BARROWRT1;
	s_playersettings.arrowright.focuspicinstead = qtrue;

	s_playersettings.arrowup.generic.type = MTYPE_BITMAP;
	s_playersettings.arrowup.generic.name = BARROWUP0;
	s_playersettings.arrowup.generic.flags = QMF_LEFT_JUSTIFY | QMF_HIGHLIGHT_IF_FOCUS;
	s_playersettings.arrowup.generic.x = 715;
	s_playersettings.arrowup.generic.y = 120;
	s_playersettings.arrowup.generic.id = ID_PREVSKIN;
	s_playersettings.arrowup.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.arrowup.width = 70;
	s_playersettings.arrowup.height = 30;
	s_playersettings.arrowup.focuspic = BARROWUP1;
	s_playersettings.arrowup.focuspicinstead = qtrue;

	s_playersettings.arrowdown.generic.type = MTYPE_BITMAP;
	s_playersettings.arrowdown.generic.name = BARROWDN0;
	s_playersettings.arrowdown.generic.flags = QMF_LEFT_JUSTIFY | QMF_HIGHLIGHT_IF_FOCUS;
	s_playersettings.arrowdown.generic.x = 715;
	s_playersettings.arrowdown.generic.y = 446;
	s_playersettings.arrowdown.generic.id = ID_NEXTSKIN;
	s_playersettings.arrowdown.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.arrowdown.width = 70;
	s_playersettings.arrowdown.height = 30;
	s_playersettings.arrowdown.focuspic = BARROWDN1;
	s_playersettings.arrowdown.focuspicinstead = qtrue;

	for (i = 0; i < MODELSPERPAGE; ++i) {
		s_playersettings.model_icons[i].generic.type = MTYPE_BITMAP;
		s_playersettings.model_icons[i].generic.flags = QMF_LEFT_JUSTIFY;
		s_playersettings.model_icons[i].generic.x = 102 + i * (100 + 12);
		s_playersettings.model_icons[i].generic.y = 12;
		s_playersettings.model_icons[i].width = 100;
		s_playersettings.model_icons[i].height = 100;
		s_playersettings.model_icons[i].generic.callback = UI_PlayerSettings_MenuEvent;
		s_playersettings.model_icons[i].generic.id = ID_MICON + i;
		s_playersettings.model_icons[i].generic.ownerdraw = UI_PlayerSettings_DrawModelIcon;
	}

	y = GRID_YPOS;
	for (i = 0, k = 0; i < SKINGRID_ROWS; i++) {
		x = GRID_XPOS;
		for (j = 0; j < SKINGRID_COLS; j++, k++) {
			s_playersettings.skin_icons[k].generic.type = MTYPE_BITMAP;
			s_playersettings.skin_icons[k].generic.flags = QMF_LEFT_JUSTIFY;
			s_playersettings.skin_icons[k].generic.x = x;
			s_playersettings.skin_icons[k].generic.y = y;
			s_playersettings.skin_icons[k].width = 64;
			s_playersettings.skin_icons[k].height = 64;
			s_playersettings.skin_icons[k].generic.callback = UI_PlayerSettings_MenuEvent;
			s_playersettings.skin_icons[k].generic.id = ID_SICON + k;
			s_playersettings.skin_icons[k].generic.ownerdraw = UI_SelectSkin_DrawSkinIcon;
			x += (64 + 8);
		}
		y += (64 + 8);
	}

	{
		char spraylogoName[MAX_SPRAYLOGO_NAME];

		trap_Cvar_VariableStringBuffer("syc_logo", spraylogoName, sizeof(spraylogoName));

		if (spraylogoName[0] == '\0') {
			Q_strncpyz(spraylogoName, SPRAYLOGO_DEFAULT_NAME, sizeof(spraylogoName));
		}

		for (i = 0; i < uis.spraylogosLoaded; i++) {
			if (Q_stricmp(uis.spraylogoNames[i], spraylogoName) == 0) {
				s_playersettings.slogo_num = i;
				break;
			}
		}
	}

	s_playersettings.logoleft.generic.type = MTYPE_BITMAP;
	s_playersettings.logoleft.generic.flags = QMF_LEFT_JUSTIFY;
	s_playersettings.logoleft.generic.x = XPOSITION - 64 - 8;
	s_playersettings.logoleft.generic.y = 332;
	s_playersettings.logoleft.generic.id = ID_PREVLOGO;
	s_playersettings.logoleft.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.logoleft.width = 32;
	s_playersettings.logoleft.height = 32;

	s_playersettings.logoright.generic.type = MTYPE_BITMAP;
	s_playersettings.logoright.generic.flags = QMF_LEFT_JUSTIFY;
	s_playersettings.logoright.generic.x = XPOSITION + 32 + 8;
	s_playersettings.logoright.generic.y = 332;
	s_playersettings.logoright.generic.id = ID_NEXTLOGO;
	s_playersettings.logoright.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.logoright.width = 32;
	s_playersettings.logoright.height = 32;

	s_playersettings.back.generic.type = MTYPE_BITMAP;
	s_playersettings.back.generic.name = BACK0;
	s_playersettings.back.generic.flags = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
	s_playersettings.back.generic.x = 8;
	s_playersettings.back.generic.y = 446;
	s_playersettings.back.generic.id = ID_BACK;
	s_playersettings.back.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.back.width = 80;
	s_playersettings.back.height = 40;
	s_playersettings.back.focuspic = BACK1;
	s_playersettings.back.focuspicinstead = qtrue;

	y = YPOSITION;
	s_playersettings.nameheader.generic.type = MTYPE_TEXT;
	s_playersettings.nameheader.generic.x = XPOSITION - 80;
	s_playersettings.nameheader.generic.y = y;
	s_playersettings.nameheader.string = "Name:";
	s_playersettings.nameheader.style = UI_LEFT | UI_SMALLFONT;
	s_playersettings.nameheader.color = color_yellow;

	s_playersettings.name.generic.type = MTYPE_FIELD;
	s_playersettings.name.generic.flags = QMF_NODEFAULTINIT | QMF_PULSEIFFOCUS | QMF_SMALLFONT;
	s_playersettings.name.generic.ownerdraw = UI_PlayerSettings_DrawName;
	s_playersettings.name.field.widthInChars = MAX_NAMELENGTH;
	s_playersettings.name.field.maxchars = MAX_NAMELENGTH;
	s_playersettings.name.generic.x = XPOSITION - 72;
	s_playersettings.name.generic.y = y - 10;
	s_playersettings.name.generic.left = XPOSITION - 80;
	s_playersettings.name.generic.top = y;
	s_playersettings.name.generic.right = XPOSITION + 80;
	s_playersettings.name.generic.bottom = y + 2 * (BIGCHAR_HEIGHT);

	y += 2 * (BIGCHAR_HEIGHT + 2);
	s_playersettings.handicapheader.generic.type = MTYPE_TEXT;
	s_playersettings.handicapheader.generic.x = XPOSITION - 80;
	s_playersettings.handicapheader.generic.y = y;
	s_playersettings.handicapheader.string = "Handicap:";
	s_playersettings.handicapheader.style = UI_LEFT | UI_SMALLFONT;
	s_playersettings.handicapheader.color = color_yellow;

	y += BIGCHAR_HEIGHT + 2;
	s_playersettings.handicap.generic.type = MTYPE_SPINCONTROL;
	s_playersettings.handicap.generic.name = "";
	s_playersettings.handicap.generic.flags = QMF_SMALLFONT;
	s_playersettings.handicap.generic.id = ID_HANDICAP;
	s_playersettings.handicap.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.handicap.generic.x = XPOSITION - 72;
	s_playersettings.handicap.generic.y = y;
	s_playersettings.handicap.itemnames = handicap_items;

	y += BIGCHAR_HEIGHT + 2;
	s_playersettings.genderheader.generic.type = MTYPE_TEXT;
	s_playersettings.genderheader.generic.x = XPOSITION - 80;
	s_playersettings.genderheader.generic.y = y;
	s_playersettings.genderheader.string = "Gender:";
	s_playersettings.genderheader.style = UI_LEFT | UI_SMALLFONT;
	s_playersettings.genderheader.color = color_yellow;

	y += BIGCHAR_HEIGHT + 2;
	s_playersettings.gender.generic.type = MTYPE_SPINCONTROL;
	s_playersettings.gender.generic.name = "";
	s_playersettings.gender.generic.flags = QMF_SMALLFONT;
	s_playersettings.gender.generic.id = ID_GENDER;
	s_playersettings.gender.generic.callback = UI_PlayerSettings_MenuEvent;
	s_playersettings.gender.generic.x = XPOSITION - 72;
	s_playersettings.gender.generic.y = y;
	s_playersettings.gender.itemnames = gender_items;
	s_playersettings.gender.generic.toolTip =
		"Choose a desired gender, which is normally determined by the chosen player model, or choose "
		"none to deactivate the gender. Default is model. Note: none forces the game to use they/them "
		"instead of he/his, she/her, or it/its for your character.";

	y += BIGCHAR_HEIGHT + 2;
	s_playersettings.logoheader.generic.type = MTYPE_TEXT;
	s_playersettings.logoheader.generic.x = XPOSITION - 80;
	s_playersettings.logoheader.generic.y = y;
	s_playersettings.logoheader.string = "Spray Logo:";
	s_playersettings.logoheader.style = UI_LEFT | UI_SMALLFONT;
	s_playersettings.logoheader.color = color_yellow;

	s_playersettings.spraycolor.generic.type = MTYPE_BITMAP;
	s_playersettings.spraycolor.generic.flags = QMF_LEFT_JUSTIFY;
	s_playersettings.spraycolor.generic.x = XPOSITION - 60;
	s_playersettings.spraycolor.generic.y = 384;
	s_playersettings.spraycolor.width = 120;
	s_playersettings.spraycolor.height = 20;
	s_playersettings.spraycolor.generic.id = ID_SPRAYCOLOR;
	s_playersettings.spraycolor.generic.callback = UI_PlayerSettings_MenuEvent;

	Menu_AddItem(&s_playersettings.menu, &s_playersettings.arrowleft);
	for (i = 0; i < MODELSPERPAGE; ++i) {
		Menu_AddItem(&s_playersettings.menu, &s_playersettings.model_icons[i]);
	}
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.arrowright);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.arrowup);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.arrowleft);
	for (i = 0; i < SKINSPERPAGE; ++i) {
		Menu_AddItem(&s_playersettings.menu, &s_playersettings.skin_icons[i]);
	}
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.arrowdown);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.nameheader);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.name);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.handicapheader);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.handicap);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.genderheader);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.gender);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.logoheader);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.logoleft);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.logoright);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.spraycolor);
	Menu_AddItem(&s_playersettings.menu, &s_playersettings.back);

	UI_PlayerSettings_SetMenuItems();
	UI_PlayerSettings_Update();
}

/*
=================
UI_PlayerSettings_Cache
=================
*/
void UI_PlayerSettings_Cache(void) {
	trap_R_RegisterShaderNoMip(BARROWLT0);
	trap_R_RegisterShaderNoMip(BARROWLT1);
	trap_R_RegisterShaderNoMip(BARROWRT0);
	trap_R_RegisterShaderNoMip(BARROWRT1);
	trap_R_RegisterShaderNoMip(BARROWUP0);
	trap_R_RegisterShaderNoMip(BARROWUP1);
	trap_R_RegisterShaderNoMip(BARROWDN0);
	trap_R_RegisterShaderNoMip(BARROWDN1);
	trap_R_RegisterShaderNoMip(BACK0);
	trap_R_RegisterShaderNoMip(BACK1);
	trap_R_RegisterShaderNoMip(SICONSHADOW);

	UI_PlayerSettings_BuildList();
}

/*
=================
UI_PlayerSettingsMenu
=================
*/
void UI_PlayerSettingsMenu(void) {
	UI_PlayerSettings_MenuInit();
	UI_PushMenu(&s_playersettings.menu);
}
