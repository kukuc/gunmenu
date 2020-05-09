#pragma semicolon 1
#pragma newdecls required

#define DEBUG
#define PLUGIN_AUTHOR 
#define PLUGIN_VERSION "1.2"

#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <multicolors>

public Plugin myinfo = 
{
	name = "gunmenu",
	author = "kukuč ",
	description = "menu that can give you gun 2 times per round",
	version = PLUGIN_VERSION,
	url = " my good friend : www.twitch.tv/bennyseeek"
}

int g_iCount[MAXPLAYERS + 1];

public void OnPluginStart()
{
    RegConsoleCmd("sm_gun", Command_gun, "OpenMenu");
    HookEvent("round_end", Event_RoundEnd);
}

public void Event_RoundEnd(Event eEvent, char[] sName, bool bDontBroadcast) 
{
    for (int i = 1; i <= MaxClients; i++)
        g_iCount[i] = 0;
}


public Action Command_gun(int client, int args) 
{
	if(!HasUsesLeft(client, false))
		return Plugin_Handled;
	
	Menu menu = new Menu(Menu_gun);
	char Title[200];
 	Format(Title, sizeof(Title), "Choose  type of  gun\n ↓↓↓↓↓↓ ↓↓↓↓ ↓↓ ↓↓↓");
	menu.SetTitle(Title);
	menu.AddItem("1", "Rifles");
	menu.AddItem("2", "Pistols");
	menu.AddItem("3", "Heavy guns");
	menu.AddItem("4", "Smgs ");
	menu.Display(client, MENU_TIME_FOREVER);
	return Plugin_Handled;
}


public int Menu_gun(Menu menu, MenuAction action, int client, int info)
{
	switch(action) {
		case MenuAction_Select:
		{
			if(!HasUsesLeft(client, false))
				return;
			
			char item[32];
			menu.GetItem(info, item, sizeof(item));
			
			if (StrEqual(item, "1")){
				Menu_rifle(client);
			}
			
			else if (StrEqual(item, "2")){
				Menu_pistol(client);
			}
			
			else if (StrEqual(item, "3")){
				Menu_heavy(client);
			}
			
			else if (StrEqual(item, "4")){
				Menu_smg(client);
			}
		}
		case MenuAction_End: delete menu;
	}
}

void Menu_pistol(int client)
{
	Menu menu = new Menu(Menu_Callback_pistol);
	char Title[200];
 	Format(Title, sizeof(Title), "Choose  your Pistol \n ↓↓↓↓↓↓ ↓↓↓↓ ↓↓↓↓↓↓");
	menu.SetTitle(Title);
	menu.AddItem("1", "USP-S");
	menu.AddItem("2", "Glock-18");
	menu.AddItem("3", "Desert Eagle");
	menu.AddItem("4", "CZ-75 auto");
	menu.AddItem("5", "P2000");
	menu.AddItem("6", "Tec-9");
	menu.AddItem("7", "Dual Barettas");
	menu.AddItem("8", "Fiveseven");
	menu.AddItem("9", "P250");
	menu.AddItem("10", "R8 revolver");
	menu.Display(client, MENU_TIME_FOREVER);
}

public int Menu_Callback_pistol(Menu menu, MenuAction action, int client, int iInfo)
{
	switch(action) {
		case MenuAction_Select:
		{
			if(!HasUsesLeft(client))
				return;
			
			char item[32];
			menu.GetItem(iInfo, item, sizeof(item));
			
			if(StrEqual(item, "1")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1)
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_usp_silencer");
			}
			else if (StrEqual(item, "2")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_glock");
			}
			else if (StrEqual(item, "3")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_deagle");
			}
			else if (StrEqual(item, "4")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_cz75a");
			}
			else if (StrEqual(item, "5")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_hkp2000");
			}
			else if (StrEqual(item, "6")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_tec9");
			}
			else if (StrEqual(item, "7")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_elite");
			}
			else if (StrEqual(item, "8")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_fiveseven");
			}
			else if (StrEqual(item, "9")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_p250");
			}
			else if (StrEqual(item, "10")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_SECONDARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_revolver");
			}
		}
		case MenuAction_End: delete menu;
	}
}

void Menu_rifle(int client)
{
	Menu menu = new Menu(Menu_Callback_rifle);
	char Title[200];
	Format(Title, sizeof(Title), "Choose  your Rifle \n ↓↓↓↓↓↓ ↓↓↓↓ ↓↓↓↓↓");
	menu.SetTitle(Title);
	menu.AddItem("1", "M4A4 ");
	menu.AddItem("2", "M4A1-S");
	menu.AddItem("3", "Ak47");
	menu.AddItem("4", "Aug");
	menu.AddItem("5", "AWP");
	menu.AddItem("6", "Famas");
	menu.AddItem("7", "gs3sg1 ");
	menu.AddItem("8", "Galil ");
	menu.AddItem("9", "Scar ");
    	menu.AddItem("10", "Sg556 ");
    	menu.AddItem("11", "SSG 08");
	menu.Display(client, MENU_TIME_FOREVER);
}

public int Menu_Callback_rifle(Menu menu, MenuAction action, int client, int iInfo)
{
	switch(action) {
		case MenuAction_Select:
		{
			if(!HasUsesLeft(client))
				return;
			
			char item[32];
			menu.GetItem(iInfo, item, sizeof(item));
			
			if(StrEqual(item, "1")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_m4a1");
			}
			else if (StrEqual(item, "2")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_m4a1_silencer");
			}
			else if (StrEqual(item, "3")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_ak47");
			}
			else if (StrEqual(item, "4")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_aug");
			}
			else if (StrEqual(item, "5")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_awp");
			}
			else if (StrEqual(item, "6")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_famas");
			}
			else if (StrEqual(item, "7")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_gs3sg1");
			}
			else if (StrEqual(item, "8")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_galilar");
			}
			else if (StrEqual(item, "9")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_scar20");
			}
			else if (StrEqual(item, "10")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_sg556");
 
			}
			else if (StrEqual(item, "11")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_ssg08");
			}
		}
		case MenuAction_End: delete menu;
	}
}

void Menu_heavy(int client)
{
	Menu menu = new Menu(Menu_Callback_heavy);
	char Title[200];
	Format(Title, sizeof(Title), "Choose  your  Heavy  Gun \n ↓↓↓↓↓↓ ↓↓↓↓ ↓↓↓↓↓ ↓↓↓");
	menu.SetTitle(Title);
	menu.AddItem("1", "M249");
	menu.AddItem("2", "Mag7 ");
	menu.AddItem("3", "Negev ");
	menu.AddItem("4", "Nova");
	menu.AddItem("5", "Sawed-off");
	menu.AddItem("6", "XM1014");
	menu.Display(client, MENU_TIME_FOREVER);
}

public int Menu_Callback_heavy(Menu menu, MenuAction action, int client, int iInfo)
{
	switch(action) {
		case MenuAction_Select:
		{
			if(!HasUsesLeft(client))
				return;
			
			char item[32];
			menu.GetItem(iInfo, item, sizeof(item));
			
			if(StrEqual(item, "1")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1)
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_m249");
 
			}
			else if (StrEqual(item, "2")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_mag7");
 
			}
			else if (StrEqual(item, "3")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_negev");
 
			}
			else if (StrEqual(item, "4")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_nova");
 
			}
			else if (StrEqual(item, "5")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_sawedoff");
 
			}
			else if (StrEqual(item, "6")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_xm1014");
 
			}
		}
		case MenuAction_End: delete menu;
	}
}

void Menu_smg(int client)
{
	Menu menu = new Menu(Menu_Callback_smg);
	char Title[200];
	Format(Title, sizeof(Title), "Choose  your  Smg \n ↓↓↓↓↓↓ ↓↓↓↓ ↓↓↓");
	menu.SetTitle(Title);
	menu.AddItem("1", "PP-Bizon");
	menu.AddItem("2", "Mac-10 ");
	menu.AddItem("3", "MP7  ");
	menu.AddItem("4", "MP9 ");
	menu.AddItem("5", "P90 ");
	menu.AddItem("6", "UMP-45");
	menu.AddItem("7", "Mp5 sd");
	menu.Display(client, MENU_TIME_FOREVER);
}

public int Menu_Callback_smg(Menu menu, MenuAction action, int client, int iInfo)
{
	switch(action) {
		case MenuAction_Select:
		{
			if(!HasUsesLeft(client))
				return;
			
			char item[32];
			menu.GetItem(iInfo, item, sizeof(item));
			
			if(StrEqual(item, "1")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1)
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_bizon");
 
			}
			else if (StrEqual(item, "2")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_mac10");
 
			}
			else if (StrEqual(item, "3")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_mp7");
 
			}
			else if (StrEqual(item, "4")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_mp9");
 
			}
			else if (StrEqual(item, "5")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_p90");
 
			}
			else if (StrEqual(item, "6")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_ump45");
 
			}
			else if (StrEqual(item, "7")){
                int iWeapon = GetPlayerWeaponSlot(client, CS_SLOT_PRIMARY);
                if(iWeapon != -1) 
                if (IsValidEntity(iWeapon))AcceptEntityInput(iWeapon, "kill");
                GivePlayerItem(client, "weapon_mp5sd");
 
			}
		}
		case MenuAction_End: delete menu;
	}
}

bool HasUsesLeft(int client, bool used = true)
{
    if(g_iCount[client] >= 2)
    {
		ReplyToCommand(client, "[menu] : Sorry but you can use this command only twice per round.");
		return false;
    }
    
    if(used)
		g_iCount[client]++;
	
    return true;
}

