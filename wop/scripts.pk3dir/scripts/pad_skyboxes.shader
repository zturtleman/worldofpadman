// World of PADMAN skyboxes shader

// =================
// TrashMap skybox
// =================

textures/pad_trash/trash_skybox_night
{
    qer_editorimage env/pc-friday-13th-512_ft
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 0.47451 0.576471 1 55 210 60
    q3map_surfacelight 0
    skyParms env/pc-friday-13th-512 128 -
}

textures/pad_trash/trash_skybox_day
{
    qer_editorimage env/padcity512_ft
    q3map_lightimage textures/colors/hex_ffffe5ff
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm sky
    q3map_sun 1 1 0.9 150 210 68
    q3map_surfacelight 300
    skyParms env/padcity512 128 -
}

textures/pad_trash/trash_skybox_evening
{
    qer_editorimage env/pc-morning-madness512_ft
    q3map_lightimage textures/colors/hex_ff9860ff
    surfaceparm noimpact
    surfaceparm nolightmap
    surfaceparm sky
    q3map_surfacelight 200
    skyparms env/pc-morning-madness512 128 -
}
