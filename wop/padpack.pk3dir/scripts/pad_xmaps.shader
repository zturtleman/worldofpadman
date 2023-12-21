textures/pad_maps/blobpad
{
	surfaceparm nolightmap
	surfaceparm nonsolid
	cull twosided

	deformVertexes wave 30 sin 0 5 0 0.2
	deformVertexes wave 100 sin 0 4 0 0.1
	tessSize 48
	qer_trans 0.5
	{
		map textures/pad_maps/blobpad.tga
		tcGen environment
		tcMod turb 0 0.35 0 0.25
		tcmod scroll -0.6 -0.8
	}
	{
		map textures/pad_maps/blobpad.tga
		tcGen environment
		tcMod turb 0 0.25 0 0.5
		tcmod scroll 1 1
		blendfunc GL_ONE GL_ONE
	}
}


textures/pad_maps/knightsh
{
	cull disable
	surfaceparm alphashadow
	surfaceparm trans
	surfaceparm nomarks
	tessSize 64


	{
		map textures/pad_maps/knightsh.tga
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}


textures/pad_maps/pad_vine
{
	cull disable
	surfaceparm alphashadow
	surfaceparm trans
	surfaceparm nomarks
	tessSize 64

	{
		map textures/pad_maps/pad_vine.tga
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}

textures/pad_maps/crosslight
{
	qer_editorimage textures/pad_maps/crosslight.tga
	q3map_lightimage textures/pad_maps/crosslight02.tga
	q3map_surfacelight 4000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/crosslight.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/pad_maps/crosslight02.tga
		blendfunc GL_ONE GL_ONE
	}
}


textures/pad_maps/upperlight
{
	qer_editorimage textures/pad_maps/upperlight.tga
	q3map_lightimage textures/pad_maps/upperlight02.tga
	q3map_surfacelight 4000
	surfaceparm nomarks
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/upperlight.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
	{
		map textures/pad_maps/upperlight02.tga
		blendfunc GL_ONE GL_ONE
	}
}

textures/pad_maps/tilewall001
{
	qer_editorimage textures/pad_maps/tilewall001.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/tilewall001.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad5.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/tilewall002
{
	qer_editorimage textures/pad_maps/tilewall002.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/tilewall002.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad5.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/tilewall003
{
	qer_editorimage textures/pad_maps/tilewall003.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/tilewall003.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad5.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/tilewall004
{
	qer_editorimage textures/pad_maps/tilewall004.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/tilewall004.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad5.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/lamp01
{
	q3map_surfacelight 2000
	surfaceparm nolightmap
	{
		map textures/pad_maps/lamp01.tga
	}
}

textures/pad_maps/lamp02
{
	q3map_surfacelight 1225
	surfaceparm nolightmap
	{
		map textures/pad_maps/lamp02.tga
	}
}


textures/pad_maps/lamp03
{
	q3map_surfacelight 1225
	surfaceparm nolightmap
	{
		map textures/pad_maps/lamp03.tga
	}
}

textures/pad_maps/lamp04
{
	q3map_surfacelight 1225
	surfaceparm nolightmap
	{
		map textures/pad_maps/lamp04.tga
	}
}

textures/pad_maps/lamp05
{
	q3map_surfacelight 1225
	surfaceparm nolightmap
	{
		map textures/pad_maps/lamp05.tga
	}
}

textures/pad_maps/lamp06
{
	q3map_surfacelight 175
	surfaceparm nolightmap
	{
		map textures/pad_maps/lamp06.tga
	}
}

textures/pad_maps/lamp07
{
	q3map_surfacelight 175
	surfaceparm nolightmap
	{
		map textures/pad_maps/lamp07.tga
	}
}


textures/pad_maps/lamp08
{
	q3map_surfacelight 240
	surfaceparm nolightmap
	{
		map textures/pad_maps/lamp08.tga
	}
}


textures/pad_maps/notausgang02
{
	q3map_surfacelight 300
	surfaceparm nolightmap
	{
		map textures/pad_maps/notausgang02.tga
	}
}

textures/pad_maps/notausgang
{
	q3map_surfacelight 300
	surfaceparm nolightmap
	{
		map textures/pad_maps/notausgang.tga
	}
}


textures/pad_maps/notausganglight
{
	q3map_surfacelight 300
	surfaceparm nolightmap
	{
		map textures/pad_maps/notausganglight.tga
	}
}


textures/pad_maps/exit
{
	q3map_surfacelight 300
	surfaceparm nolightmap
	{
		map textures/pad_maps/exit.tga
	}
}


textures/pad_maps/win002
{
	q3map_surfacelight 100
	surfaceparm nolightmap
	{
		map textures/pad_maps/win002.tga
	}
}


textures/pad_maps/padgallery01
{
	q3map_surfacelight 100
	surfaceparm nolightmap
	{
		map textures/pad_maps/padgallery01.tga
	}
}

textures/pad_maps/padgallery02
{
	q3map_surfacelight 100
	surfaceparm nolightmap
	{
		map textures/pad_maps/padgallery02.tga
	}
}



textures/pad_maps/jumpvator
{
	q3map_surfacelight 300
	surfaceparm nolightmap
	{
		map textures/pad_maps/jumpvator.tga
	}
}


textures/pad_maps/glassblue
{
	qer_editorimage textures/pad_maps/glassblue.tga
	surfaceparm trans
	cull none
	surfaceparm nolightmap
	qer_trans 	0.5

	{
		map textures/pad_maps/glassblue.tga
		tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
	}

}


textures/pad_maps/glassgreen
{
	qer_editorimage textures/pad_maps/glassgreen.tga
	surfaceparm trans
	cull none
	surfaceparm nolightmap
	qer_trans 	0.5

	{
		map textures/pad_maps/glassgreen.tga
		tcgen environment
		blendFunc GL_ONE GL_ONE
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
	}
}


textures/pad_gallery/tomoyo003
{
	qer_editorimage textures/pad_gallery/tomoyo003.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/tomoyo003.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann012
{
	qer_editorimage textures/pad_gallery/lara_baumann012.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann012.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/padman002
{
	qer_editorimage textures/pad_gallery/padman002.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman002.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/padentertainment2
{
	qer_editorimage textures/pad_gallery/padentertainment2.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padentertainment2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/waytothemuseum
{
	qer_editorimage textures/pad_gallery/waytothemuseum.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/waytothemuseum.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/fish01
{
	qer_editorimage textures/pad_maps/fish01.tga
	deformVertexes wave 194 sin 0 2 0 .2
	deformVertexes wave 30 sin 0 1 0 .3
	deformVertexes wave 194 sin 0 1 0 .1
	surfaceparm nomarks
	surfaceparm alphashadow
	cull none

	{
		map textures/pad_maps/fish01.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}

textures/pad_maps/fish02
{
	qer_editorimage textures/pad_maps/fish02.tga
	deformVertexes wave 194 sin 0 2 0 .2
	deformVertexes wave 30 sin 0 1 0 .3
	deformVertexes wave 194 sin 0 1 0 .1
	surfaceparm nomarks
	surfaceparm alphashadow
	cull none

	{
		map textures/pad_maps/fish02.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}


textures/pad_maps/fish03
{
	qer_editorimage textures/pad_maps/fish03.tga
	deformVertexes wave 194 sin 0 2 0 .2
	deformVertexes wave 30 sin 0 1 0 .3
	deformVertexes wave 194 sin 0 1 0 .1
	surfaceparm nomarks
	surfaceparm alphashadow
	cull none

	{
		map textures/pad_maps/fish03.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}


textures/pad_maps/fish04
{
	qer_editorimage textures/pad_maps/fish04.tga
	deformVertexes wave 194 sin 0 2 0 .2
	deformVertexes wave 30 sin 0 1 0 .3
	deformVertexes wave 194 sin 0 1 0 .1
	surfaceparm nomarks
	surfaceparm alphashadow
	cull none

	{
		map textures/pad_maps/fish04.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}
}


textures/pad_maps/galllight
{
	q3map_surfacelight 1200
	q3map_flareShader flareShader
	surfaceparm nolightmap
	{
		map textures/pad_maps/galllight.tga
	}
}



textures/pad_maps/fackel
{

		surfaceparm trans
		surfaceparm nomarks
		surfaceparm nonsolid
		qer_editorimage textures/pad_maps/fackel.tga
		q3map_surfacelight 900
		surfaceparm nolightmap
		cull none

	{
		animMap 10 textures/pad_garden/sflame1.tga textures/pad_garden/sflame2.tga textures/pad_garden/sflame3.tga textures/pad_garden/sflame4.tga textures/pad_garden/sflame5.tga textures/pad_garden/sflame6.tga textures/pad_garden/sflame7.tga textures/pad_garden/sflame8.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave inverseSawtooth 0 1 0 10

	}
	{
		animMap 10 textures/pad_garden/sflame2.tga textures/pad_garden/sflame3.tga textures/pad_garden/sflame4.tga textures/pad_garden/sflame5.tga textures/pad_garden/sflame6.tga textures/pad_garden/sflame7.tga textures/pad_garden/sflame8.tga textures/pad_garden/sflame1.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sawtooth 0 1 0 10
	}


	{
		map textures/pad_garden/sflameball.tga
		blendFunc GL_ONE GL_ONE
		rgbGen wave sin .6 .2 0 .6
	}

}


textures/pad_maps/notdoor002
{
	qer_editorimage textures/pad_maps/notdoor002.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/notdoor002.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad5.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/tafel01
{
	qer_editorimage textures/pad_maps/tafel01.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/tafel01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/tafel02
{
	qer_editorimage textures/pad_maps/tafel02.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/tafel02.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/tafel03
{
	qer_editorimage textures/pad_maps/tafel03.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/tafel03.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}




textures/pad_maps/lackgrey
{
	qer_editorimage textures/pad_maps/lackgrey.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/lackgrey.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad5.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/lackgrey2
{
	qer_editorimage textures/pad_maps/lackgrey2.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/lackgrey2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad5.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/noentry2
{
	qer_editorimage textures/pad_maps/noentry2.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/noentry2.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad5.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/feuerl
{
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	polygonOffset
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/feuerl.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/pad_gallery/padman023
{
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	polygonOffset
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman023.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/pad_maps/not04
{
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	polygonOffset
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/not04.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/pad_maps/not01
{
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	polygonOffset
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/not01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}

textures/pad_maps/not05
{
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	polygonOffset
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/not05.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/pad_maps/nosmoking
{
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	polygonOffset
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/nosmoking.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/pad_maps/impmaster
{
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	polygonOffset
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/impmaster.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/pad_maps/notenter
{
	surfaceparm noimpact
	surfaceparm nonsolid
	surfaceparm trans
	polygonOffset
	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/notenter.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbGen identity
	}
}


textures/pad_maps/jail2maschendrahtzaun
{
	qer_editorimage textures/pad_maps/jail2maschendrahtzaun.tga
	cull disable
		surfaceparm alphashadow
			surfaceparm latticesteps
	{
		map textures/pad_maps/jail2maschendrahtzaun.tga
		blendFunc GL_ONE GL_ZERO
		alphaFunc GE128
		depthWrite
		rgbGen identity

	}
	{
		map $lightmap
		rgbGen identity
		blendFunc GL_DST_COLOR GL_ZERO
		depthFunc equal
	}
}


textures/pad_maps/water_aqua
{
	qer_editorimage textures/pad_maps/aqua01.tga
	qer_trans .4
	q3map_globaltexture
	surfaceparm trans
	surfaceparm nonsolid
	surfaceparm nomarks

	{
		map textures/pad_maps/aqua01.tga
		blendFunc GL_dst_color GL_one
		rgbgen identity
		tcmod scale .5 .5
		tcmod scroll .025 .01
	}
	{
		map textures/pad_maps/aqua01.tga
		blendFunc GL_dst_color gl_one
		rgbgen identity
		tcmod scale -1 -1
		tcmod scroll .025 .025
	}
	{
		map $lightmap
		blendFunc GL_dst_color GL_zero
		rgbgen identity
	}
}


textures/pad_maps/moni001
{
	q3map_lightimage textures/pad_maps/moni001.tga
	q3map_surfacelight 2

		{
		map textures/pad_maps/moni001.tga
		rgbGen identity
	}

		{
		map textures/pad_maps/moni002.tga
		blendfunc add
		rgbGen identity
		tcmod scroll 0 1
	}


	{
		map $lightmap
		tcgen environment
		tcmod scale .5 .5
		rgbGen wave sin .25 0 0 0
		blendfunc add
	}
}


textures/pad_maps/shinyblack
{
	qer_editorimage textures/pad_maps/shinyblack.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/shinyblack.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/shinywhite
{
	qer_editorimage textures/pad_maps/shinywhite.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/shinywhite.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_001
{
	qer_editorimage textures/pad_gallery/lara_baumann_001.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_001.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_002
{
	qer_editorimage textures/pad_gallery/lara_baumann_002.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_002.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_003
{
	qer_editorimage textures/pad_gallery/lara_baumann_003.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_003.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_004
{
	qer_editorimage textures/pad_gallery/lara_baumann_004.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_004.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_005
{
	qer_editorimage textures/pad_gallery/lara_baumann_005.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_005.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_006
{
	qer_editorimage textures/pad_gallery/lara_baumann_006.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_006.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_007
{
	qer_editorimage textures/pad_gallery/lara_baumann_007.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_007.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_008
{
	qer_editorimage textures/pad_gallery/lara_baumann_008.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_008.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_009
{
	qer_editorimage textures/pad_gallery/lara_baumann_009.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_009.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_009_256
{
	qer_editorimage textures/pad_gallery/lara_baumann_009_256.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_009_256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}



textures/pad_gallery/lara_baumann_010
{
	qer_editorimage textures/pad_gallery/lara_baumann_010.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_010.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_010_256
{
	qer_editorimage textures/pad_gallery/lara_baumann_010_256.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_010_256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_011
{
	qer_editorimage textures/pad_gallery/lara_baumann_011.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_011.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/lara_baumann_012
{
	qer_editorimage textures/pad_gallery/lara_baumann_012.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_012.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_015
{
	qer_editorimage textures/pad_gallery/lara_baumann_015.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_015.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_016
{
	qer_editorimage textures/pad_gallery/lara_baumann_016.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_016.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_017
{
	qer_editorimage textures/pad_gallery/lara_baumann_017.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_017.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_017_256
{
	qer_editorimage textures/pad_gallery/lara_baumann_017_256.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_017_256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_018
{
	qer_editorimage textures/pad_gallery/lara_baumann_018.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_018.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/lara_baumann_018_256
{
	qer_editorimage textures/pad_gallery/lara_baumann_018_256.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/lara_baumann_018_256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/ente004
{
	qer_editorimage textures/pad_gallery/ente004.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/ente004.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/tomoyo001
{
	qer_editorimage textures/pad_gallery/tomoyo001.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/tomoyo001.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/tomoyo002
{
	qer_editorimage textures/pad_gallery/tomoyo002.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/tomoyo002.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/kredit
{
	 cull disable
	 surfaceparm alphashadow
	 surfaceparm trans
	 surfaceparm nomarks
	 tessSize 64


		{
				map textures/pad_maps/kredit.tga
				alphaFunc GE128
		depthWrite
		rgbGen identity
		}
		{
		map $lightmap
		rgbGen identity
		blendFunc filter
		depthFunc equal
	}


}



textures/pad_maps/brueckenwood
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/brueckenwood.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/burgfloor001
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/burgfloor001.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/burgfloor002
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/burgfloor002.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/burgfloor003
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/burgfloor003.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}


textures/pad_maps/burgfloor004
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/burgfloor004.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}


textures/pad_maps/gras_ground
{
surfaceparm sandsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/gras_ground.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/gras_ground2
{
surfaceparm sandsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/gras_ground2.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/gras_ground3_1024
{
surfaceparm sandsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/gras_ground3_1024.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/gras_ground3_512
{
surfaceparm sandsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/gras_ground3_512.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/nature14
{
surfaceparm sandsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/nature14.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/rostline_1024
{
surfaceparm metalsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/rostline_1024.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/rostline_512
{
surfaceparm metalsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/rostline_512.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/schrank01b
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/schrank01b.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/schrank01d
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/schrank01d.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/spint01
{
surfaceparm metalsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/spint01.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/spint02
{
surfaceparm metalsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/spint02.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}


textures/pad_maps/stroh
{
surfaceparm sandsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/stroh.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/woodsteg
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/woodsteg.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/woolwall001_1024
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/woolwall001_1024.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/woolwall001_512
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/woolwall001_512.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/buche003
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/buche003.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}


textures/pad_maps/buche004
{
surfaceparm woodsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/buche004.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_maps/redcarp
{
surfaceparm carpetsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_maps/redcarp.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/pad_bookroom/redfloor_256
{
surfaceparm carpetsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_bookroom/redfloor_256.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}

textures/padman/welcome
{
surfaceparm carpetsteps
{
map $lightmap
rgbGen identity
}
{
map textures/padman/welcome.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}


textures/pad_garden/grasground3
{
surfaceparm sandsteps
{
map $lightmap
rgbGen identity
}
{
map textures/pad_garden/grasground3.tga
blendFunc GL_DST_COLOR GL_ZERO
rgbGen identity
}
}


textures/pad_gallery/doomdragon01
{
	qer_editorimage textures/pad_gallery/doomdragon01.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/doomdragon01.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/doomdragon02
{
	qer_editorimage textures/pad_gallery/doomdragon02.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/doomdragon02.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/entecartoon006
{
	qer_editorimage textures/pad_gallery/entecartoon006.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/entecartoon006.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/entecartoon009
{
	qer_editorimage textures/pad_gallery/entecartoon009.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/entecartoon009.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/gallery2000
{
	qer_editorimage textures/pad_gallery/gallery2000.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/gallery2000.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/padman005
{
	qer_editorimage textures/pad_gallery/padman005.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman005.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/padman007b
{
	qer_editorimage textures/pad_gallery/padman007b.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman007b.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/padman010_256
{
	qer_editorimage textures/pad_gallery/padman010_256.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman010_256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/padman011_256
{
	qer_editorimage textures/pad_gallery/padman011_256.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman011_256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/padman014_512
{
	qer_editorimage textures/pad_gallery/padman014_512.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman014_512.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_gallery/padman016_256
{
	qer_editorimage textures/pad_gallery/padman016_256.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman016_256.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/padman018
{
	qer_editorimage textures/pad_gallery/padman018.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman018.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/padman025
{
	qer_editorimage textures/pad_gallery/padman025.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman025.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/padman026
{
	qer_editorimage textures/pad_gallery/padman026.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_gallery/padman026.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_maps/wop02
{
	qer_editorimage textures/pad_maps/wop02.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/wop02.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/wop03
{
	qer_editorimage textures/pad_maps/wop03.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/wop03.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_maps/wop04
{
	qer_editorimage textures/pad_maps/wop04.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/wop04.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_maps/wop32
{
	qer_editorimage textures/pad_maps/wop32.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/wop32.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}


textures/pad_maps/xwop34
{
	qer_editorimage textures/pad_maps/xwop34.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/xwop34.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_maps/blackdoor
{
	qer_editorimage textures/pad_maps/blackdoor.tga

	{
		map $lightmap
		rgbGen identity
	}
	{
		map textures/pad_maps/blackdoor.tga
		blendFunc GL_DST_COLOR GL_ZERO
		rgbgen identity
	}
	{
		map textures/pad_gfx02/tinpad4.tga
		tcgen environment
		blendfunc add
		rgbgen identity
	}
}

textures/pad_gallery/ente005_256
{
	qer_editorimage textures/pad_gallery/ente005_256.tga
	{
		map textures/pad_gallery/ente005_256.tga
		rgbGen identity
	}
	{
		map $lightmap
		rgbGen identity
		blendfunc gl_dst_color gl_zero
	}
	{
		map textures/pad_gallery/ente005_light.tga
		blendfunc gl_one gl_one
		rgbgen wave inversesawtooth 0 1 0 1
	}
}

textures/pad_shop/nottingham
{
	qer_editorimage textures/pad_shop/nottingham.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightimage textures/pad_shop/brown.tga
	q3map_sun	0.266383 0.274632 0.358662 100 50 55
	q3map_surfacelight 250

		skyparms env/nottingham1024 - -
//	   {
//		map textures/pad_shop/nottingham512.tga
//		blendfunc GL_ONE GL_ONE
//		tcMod scroll 0.05 0.06
//		tcMod scale 3 2
//	}
}

textures/pad_petesky/night-life
{
	qer_editorimage textures/pad_petesky/night-life.tga
	surfaceparm noimpact
	surfaceparm nolightmap
	q3map_lightimage textures/pad_petesky/white02.tga
	q3map_sun	0.266383 0.274632 0.358662 100 50 55
	q3map_surfacelight 200

		skyparms env/pc-night-life1024 - -
//	   {
//		map textures/pad_petesky/night-life.tga
//		blendfunc GL_ONE GL_ONE
//		tcMod scroll 0.05 0.06
//		tcMod scale 3 2
//	}
}
