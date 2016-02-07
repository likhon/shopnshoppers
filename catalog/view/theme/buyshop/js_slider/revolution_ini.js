				jQuery(document).ready(function() {
				
					
								
					jQuery('.tp-banner').show().revolution(
					{
						dottedOverlay:"none",
						delay:9000,
						startwidth:1600,
						startheight:900,
						hideThumbs:200,
						
						thumbWidth:100,
						thumbHeight:50,
						thumbAmount:5,
						
						hideTimerBar:"on",
						
						navigationType:"none",
						navigationArrows:"solo",
						navigationStyle:"round",
						
						touchenabled:"on",
						onHoverStop:"on",
						
						swipe_velocity: 0.7,
						swipe_min_touches: 1,
						swipe_max_touches: 1,
						drag_block_vertical: false,
						
						parallax:"mouse",
						parallaxBgFreeze:"on",
						parallaxLevels:[7,4,3,2,5,4,3,2,1,0],				
												
						keyboardNavigation:"on",
						
						navigationHAlign:"center",
						navigationVAlign:"bottom",
						navigationHOffset:0,
						navigationVOffset:20,

						soloArrowLeftHalign:"left",
						soloArrowLeftValign:"center",
						soloArrowLeftHOffset:20,
						soloArrowLeftVOffset:0,

						soloArrowRightHalign:"right",
						soloArrowRightValign:"center",
						soloArrowRightHOffset:20,
						soloArrowRightVOffset:0,
								
						shadow:0,
						fullWidth:"off",
						fullScreen:"on",

						spinner:"spinner3",
						
						stopLoop:"off",
						stopAfterLoops:-1,
						stopAtSlide:-1,

						shuffle:"off",
						
												
						forceFullWidth:"off",						
						fullScreenAlignForce:"off",						
						minFullScreenHeight:"400",
												
						hideThumbsOnMobile:"off",
						hideNavDelayOnMobile:1500,						
						hideBulletsOnMobile:"off",
						hideArrowsOnMobile:"off",
						hideThumbsUnderResolution:0,
						
						hideSliderAtLimit:0,
						hideCaptionAtLimit:0,
						hideAllCaptionAtLilmit:0,
						startWithSlide:0,
						fullScreenOffsetContainer: ".header-offset"
					});
					
					
					
									
				});	//ready
