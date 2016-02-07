/*
bootstrap.js
 jquery.easing.js
 jquery.flexslider.js
 jquery.elastislide.js
 jquery.selectbox-0.2.js
 jquery.nouislider.js
 jquery.isotope.min.js
 cloudzoom.js
 jquery.inview.js
 jquery.jcarousel.min.js
 jquery.parallax.js
 scripts.js
 navigation.js
 */



/* bootstrap.js */
!function($){$(function(){$.support.transition=(function(){var transitionEnd=(function(){var el=document.createElement("bootstrap"),transEndEventNames={"WebkitTransition":"webkitTransitionEnd","MozTransition":"transitionend","OTransition":"oTransitionEnd otransitionend","transition":"transitionend"},name;for(name in transEndEventNames){if(el.style[name]!==undefined){return transEndEventNames[name];}}}());return transitionEnd&&{end:transitionEnd};})();});}(window.jQuery);!function($){var dismiss='[data-dismiss="alert"]',Alert=function(el){$(el).on("click",dismiss,this.close);};Alert.prototype.close=function(e){var $this=$(this),selector=$this.attr("data-target"),$parent;if(!selector){selector=$this.attr("href");selector=selector&&selector.replace(/.*(?=#[^\s]*$)/,"");}$parent=$(selector);e&&e.preventDefault();$parent.length||($parent=$this.hasClass("alert")?$this:$this.parent());$parent.trigger(e=$.Event("close"));if(e.isDefaultPrevented()){return;}$parent.removeClass("in");function removeElement(){$parent.trigger("closed").remove();}$.support.transition&&$parent.hasClass("fade")?$parent.on($.support.transition.end,removeElement):removeElement();};var old=$.fn.alert;$.fn.alert=function(option){return this.each(function(){var $this=$(this),data=$this.data("alert");if(!data){$this.data("alert",(data=new Alert(this)));}if(typeof option=="string"){data[option].call($this);}});};$.fn.alert.Constructor=Alert;$.fn.alert.noConflict=function(){$.fn.alert=old;return this;};$(document).on("click.alert.data-api",dismiss,Alert.prototype.close);}(window.jQuery);!function($){var Button=function(element,options){this.$element=$(element);this.options=$.extend({},$.fn.button.defaults,options);};Button.prototype.setState=function(state){var d="disabled",$el=this.$element,data=$el.data(),val=$el.is("input")?"val":"html";state=state+"Text";data.resetText||$el.data("resetText",$el[val]());$el[val](data[state]||this.options[state]);setTimeout(function(){state=="loadingText"?$el.addClass(d).attr(d,d):$el.removeClass(d).removeAttr(d);},0);};Button.prototype.toggle=function(){var $parent=this.$element.closest('[data-toggle="buttons-radio"]');$parent&&$parent.find(".active").removeClass("active");this.$element.toggleClass("active");};var old=$.fn.button;$.fn.button=function(option){return this.each(function(){var $this=$(this),data=$this.data("button"),options=typeof option=="object"&&option;if(!data){$this.data("button",(data=new Button(this,options)));}if(option=="toggle"){data.toggle();}else{if(option){data.setState(option);}}});};$.fn.button.defaults={loadingText:"loading..."};$.fn.button.Constructor=Button;$.fn.button.noConflict=function(){$.fn.button=old;return this;};$(document).on("click.button.data-api","[data-toggle^=button]",function(e){var $btn=$(e.target);if(!$btn.hasClass("btn")){$btn=$btn.closest(".btn");}$btn.button("toggle");});}(window.jQuery);!function($){var Carousel=function(element,options){this.$element=$(element);this.options=options;this.options.pause=="hover"&&this.$element.on("mouseenter",$.proxy(this.pause,this)).on("mouseleave",$.proxy(this.cycle,this));};Carousel.prototype={cycle:function(e){if(!e){this.paused=false;}this.options.interval&&!this.paused&&(this.interval=setInterval($.proxy(this.next,this),this.options.interval));return this;},to:function(pos){var $active=this.$element.find(".item.active"),children=$active.parent().children(),activePos=children.index($active),that=this;if(pos>(children.length-1)||pos<0){return;}if(this.sliding){return this.$element.one("slid",function(){that.to(pos);});}if(activePos==pos){return this.pause().cycle();}return this.slide(pos>activePos?"next":"prev",$(children[pos]));},pause:function(e){if(!e){this.paused=true;}if(this.$element.find(".next, .prev").length&&$.support.transition.end){this.$element.trigger($.support.transition.end);this.cycle();}clearInterval(this.interval);this.interval=null;return this;},next:function(){if(this.sliding){return;}return this.slide("next");},prev:function(){if(this.sliding){return;}return this.slide("prev");},slide:function(type,next){var $active=this.$element.find(".item.active"),$next=next||$active[type](),isCycling=this.interval,direction=type=="next"?"left":"right",fallback=type=="next"?"first":"last",that=this,e;this.sliding=true;isCycling&&this.pause();$next=$next.length?$next:this.$element.find(".item")[fallback]();e=$.Event("slide",{relatedTarget:$next[0]});if($next.hasClass("active")){return;}if($.support.transition&&this.$element.hasClass("slide")){this.$element.trigger(e);if(e.isDefaultPrevented()){return;}$next.addClass(type);$next[0].offsetWidth;$active.addClass(direction);$next.addClass(direction);this.$element.one($.support.transition.end,function(){$next.removeClass([type,direction].join(" ")).addClass("active");$active.removeClass(["active",direction].join(" "));that.sliding=false;setTimeout(function(){that.$element.trigger("slid");},0);});}else{this.$element.trigger(e);if(e.isDefaultPrevented()){return;}$active.removeClass("active");$next.addClass("active");this.sliding=false;this.$element.trigger("slid");}isCycling&&this.cycle();return this;}};var old=$.fn.carousel;$.fn.carousel=function(option){return this.each(function(){var $this=$(this),data=$this.data("carousel"),options=$.extend({},$.fn.carousel.defaults,typeof option=="object"&&option),action=typeof option=="string"?option:options.slide;if(!data){$this.data("carousel",(data=new Carousel(this,options)));}if(typeof option=="number"){data.to(option);}else{if(action){data[action]();}else{if(options.interval){data.cycle();}}}});};$.fn.carousel.defaults={interval:5000,pause:"hover"};$.fn.carousel.Constructor=Carousel;$.fn.carousel.noConflict=function(){$.fn.carousel=old;return this;};$(document).on("click.carousel.data-api","[data-slide]",function(e){var $this=$(this),href,$target=$($this.attr("data-target")||(href=$this.attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,"")),options=$.extend({},$target.data(),$this.data());$target.carousel(options);e.preventDefault();});}(window.jQuery);!function($){var Collapse=function(element,options){this.$element=$(element);this.options=$.extend({},$.fn.collapse.defaults,options);if(this.options.parent){this.$parent=$(this.options.parent);}this.options.toggle&&this.toggle();};Collapse.prototype={constructor:Collapse,dimension:function(){var hasWidth=this.$element.hasClass("width");return hasWidth?"width":"height";},show:function(){var dimension,scroll,actives,hasData;if(this.transitioning){return;}dimension=this.dimension();scroll=$.camelCase(["scroll",dimension].join("-"));actives=this.$parent&&this.$parent.find("> .accordion-group > .in");if(actives&&actives.length){hasData=actives.data("collapse");if(hasData&&hasData.transitioning){return;}actives.collapse("hide");hasData||actives.data("collapse",null);}this.$element[dimension](0);this.transition("addClass",$.Event("show"),"shown");$.support.transition&&this.$element[dimension](this.$element[0][scroll]);},hide:function(){var dimension;if(this.transitioning){return;}dimension=this.dimension();this.reset(this.$element[dimension]());this.transition("removeClass",$.Event("hide"),"hidden");this.$element[dimension](0);},reset:function(size){var dimension=this.dimension();this.$element.removeClass("collapse")[dimension](size||"auto")[0].offsetWidth;this.$element[size!==null?"addClass":"removeClass"]("collapse");return this;},transition:function(method,startEvent,completeEvent){var that=this,complete=function(){if(startEvent.type=="show"){that.reset();}that.transitioning=0;that.$element.trigger(completeEvent);};this.transitioning=1;this.$element[method]("in");$.support.transition&&this.$element.hasClass("collapse")?this.$element.one($.support.transition.end,complete):complete();},toggle:function(){this[this.$element.hasClass("in")?"hide":"show"]();}};var old=$.fn.collapse;$.fn.collapse=function(option){return this.each(function(){var $this=$(this),data=$this.data("collapse"),options=typeof option=="object"&&option;if(!data){$this.data("collapse",(data=new Collapse(this,options)));}if(typeof option=="string"){data[option]();}});};$.fn.collapse.defaults={toggle:true};$.fn.collapse.Constructor=Collapse;$.fn.collapse.noConflict=function(){$.fn.collapse=old;return this;};$(document).on("click.collapse.data-api","[data-toggle=collapse]",function(e){var $this=$(this),href,target=$this.attr("data-target")||e.preventDefault()||(href=$this.attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,""),option=$(target).data("collapse")?"toggle":$this.data();$this[$(target).hasClass("in")?"addClass":"removeClass"]("collapsed");$(target).collapse(option);});}(window.jQuery);!function($){var toggle="[data-toggle=dropdown]",Dropdown=function(element){var $el=$(element).on("click.dropdown.data-api",this.toggle);$("html").on("click.dropdown.data-api",function(){$el.parent().removeClass("open");});};Dropdown.prototype={constructor:Dropdown,toggle:function(e){var $this=$(this),$parent,isActive;if($this.is(".disabled, :disabled")){return;}$parent=getParent($this);isActive=$parent.hasClass("open");clearMenus();if(!isActive){$parent.toggleClass("open");}$this.focus();return false;},keydown:function(e){var $this,$items,$active,$parent,isActive,index;if(!/(38|40|27)/.test(e.keyCode)){return;}$this=$(this);e.preventDefault();e.stopPropagation();if($this.is(".disabled, :disabled")){return;}$parent=getParent($this);isActive=$parent.hasClass("open");if(!isActive||(isActive&&e.keyCode==27)){return $this.click();}$items=$("[role=menu] li:not(.divider):visible a",$parent);if(!$items.length){return;}index=$items.index($items.filter(":focus"));if(e.keyCode==38&&index>0){index--;}if(e.keyCode==40&&index<$items.length-1){index++;}if(!~index){index=0;}$items.eq(index).focus();}};function clearMenus(){$(toggle).each(function(){getParent($(this)).removeClass("open");});}function getParent($this){var selector=$this.attr("data-target"),$parent;if(!selector){selector=$this.attr("href");selector=selector&&/#/.test(selector)&&selector.replace(/.*(?=#[^\s]*$)/,"");}$parent=$(selector);$parent.length||($parent=$this.parent());return $parent;}var old=$.fn.dropdown;$.fn.dropdown=function(option){return this.each(function(){var $this=$(this),data=$this.data("dropdown");if(!data){$this.data("dropdown",(data=new Dropdown(this)));}if(typeof option=="string"){data[option].call($this);}});};$.fn.dropdown.Constructor=Dropdown;$.fn.dropdown.noConflict=function(){$.fn.dropdown=old;return this;};$(document).on("click.dropdown.data-api touchstart.dropdown.data-api",clearMenus).on("click.dropdown touchstart.dropdown.data-api",".dropdown form",function(e){e.stopPropagation();}).on("touchstart.dropdown.data-api",".dropdown-menu",function(e){e.stopPropagation();}).on("click.dropdown.data-api touchstart.dropdown.data-api",toggle,Dropdown.prototype.toggle).on("keydown.dropdown.data-api touchstart.dropdown.data-api",toggle+", [role=menu]",Dropdown.prototype.keydown);}(window.jQuery);!function($){var Modal=function(element,options){this.options=options;this.$element=$(element).delegate('[data-dismiss="modal"]',"click.dismiss.modal",$.proxy(this.hide,this));this.options.remote&&this.$element.find(".modal-body").load(this.options.remote);};Modal.prototype={constructor:Modal,toggle:function(){return this[!this.isShown?"show":"hide"]();},show:function(){var that=this,e=$.Event("show");this.$element.trigger(e);if(this.isShown||e.isDefaultPrevented()){return;}this.isShown=true;this.escape();this.backdrop(function(){var transition=$.support.transition&&that.$element.hasClass("fade");if(!that.$element.parent().length){that.$element.appendTo(document.body);}that.$element.show();if(transition){that.$element[0].offsetWidth;}that.$element.addClass("in").attr("aria-hidden",false);that.enforceFocus();transition?that.$element.one($.support.transition.end,function(){that.$element.focus().trigger("shown");}):that.$element.focus().trigger("shown");});},hide:function(e){e&&e.preventDefault();var that=this;e=$.Event("hide");this.$element.trigger(e);if(!this.isShown||e.isDefaultPrevented()){return;}this.isShown=false;this.escape();$(document).off("focusin.modal");this.$element.removeClass("in").attr("aria-hidden",true);$.support.transition&&this.$element.hasClass("fade")?this.hideWithTransition():this.hideModal();},enforceFocus:function(){var that=this;$(document).on("focusin.modal",function(e){if(that.$element[0]!==e.target&&!that.$element.has(e.target).length){that.$element.focus();}});},escape:function(){var that=this;if(this.isShown&&this.options.keyboard){this.$element.on("keyup.dismiss.modal",function(e){e.which==27&&that.hide();});}else{if(!this.isShown){this.$element.off("keyup.dismiss.modal");}}},hideWithTransition:function(){var that=this,timeout=setTimeout(function(){that.$element.off($.support.transition.end);that.hideModal();},500);this.$element.one($.support.transition.end,function(){clearTimeout(timeout);that.hideModal();});},hideModal:function(that){this.$element.hide().trigger("hidden");this.backdrop();},removeBackdrop:function(){this.$backdrop.remove();this.$backdrop=null;},backdrop:function(callback){var that=this,animate=this.$element.hasClass("fade")?"fade":"";if(this.isShown&&this.options.backdrop){var doAnimate=$.support.transition&&animate;this.$backdrop=$('<div class="modal-backdrop '+animate+'" />').appendTo(document.body);this.$backdrop.click(this.options.backdrop=="static"?$.proxy(this.$element[0].focus,this.$element[0]):$.proxy(this.hide,this));if(doAnimate){this.$backdrop[0].offsetWidth;}this.$backdrop.addClass("in");doAnimate?this.$backdrop.one($.support.transition.end,callback):callback();}else{if(!this.isShown&&this.$backdrop){this.$backdrop.removeClass("in");$.support.transition&&this.$element.hasClass("fade")?this.$backdrop.one($.support.transition.end,$.proxy(this.removeBackdrop,this)):this.removeBackdrop();}else{if(callback){callback();}}}}};var old=$.fn.modal;$.fn.modal=function(option){return this.each(function(){var $this=$(this),data=$this.data("modal"),options=$.extend({},$.fn.modal.defaults,$this.data(),typeof option=="object"&&option);if(!data){$this.data("modal",(data=new Modal(this,options)));}if(typeof option=="string"){data[option]();}else{if(options.show){data.show();}}});};$.fn.modal.defaults={backdrop:true,keyboard:true,show:true};$.fn.modal.Constructor=Modal;$.fn.modal.noConflict=function(){$.fn.modal=old;return this;};$(document).on("click.modal.data-api",'[data-toggle="modal"]',function(e){var $this=$(this),href=$this.attr("href"),$target=$($this.attr("data-target")||(href&&href.replace(/.*(?=#[^\s]+$)/,""))),option=$target.data("modal")?"toggle":$.extend({remote:!/#/.test(href)&&href},$target.data(),$this.data());e.preventDefault();$target.modal(option).one("hide",function(){$this.focus();});});}(window.jQuery);!function($){var Tooltip=function(element,options){this.init("tooltip",element,options);};Tooltip.prototype={constructor:Tooltip,init:function(type,element,options){var eventIn,eventOut;this.type=type;this.$element=$(element);this.options=this.getOptions(options);this.enabled=true;if(this.options.trigger=="click"){this.$element.on("click."+this.type,this.options.selector,$.proxy(this.toggle,this));}else{if(this.options.trigger!="manual"){eventIn=this.options.trigger=="hover"?"mouseenter":"focus";eventOut=this.options.trigger=="hover"?"mouseleave":"blur";this.$element.on(eventIn+"."+this.type,this.options.selector,$.proxy(this.enter,this));this.$element.on(eventOut+"."+this.type,this.options.selector,$.proxy(this.leave,this));}}this.options.selector?(this._options=$.extend({},this.options,{trigger:"manual",selector:""})):this.fixTitle();},getOptions:function(options){options=$.extend({},$.fn[this.type].defaults,options,this.$element.data());if(options.delay&&typeof options.delay=="number"){options.delay={show:options.delay,hide:options.delay};}return options;},enter:function(e){var self=$(e.currentTarget)[this.type](this._options).data(this.type);if(!self.options.delay||!self.options.delay.show){return self.show();}clearTimeout(this.timeout);self.hoverState="in";this.timeout=setTimeout(function(){if(self.hoverState=="in"){self.show();}},self.options.delay.show);},leave:function(e){var self=$(e.currentTarget)[this.type](this._options).data(this.type);if(this.timeout){clearTimeout(this.timeout);}if(!self.options.delay||!self.options.delay.hide){return self.hide();}self.hoverState="out";this.timeout=setTimeout(function(){if(self.hoverState=="out"){self.hide();}},self.options.delay.hide);},show:function(){var $tip,inside,pos,actualWidth,actualHeight,placement,tp;if(this.hasContent()&&this.enabled){$tip=this.tip();this.setContent();if(this.options.animation){$tip.addClass("fade");}placement=typeof this.options.placement=="function"?this.options.placement.call(this,$tip[0],this.$element[0]):this.options.placement;inside=/in/.test(placement);$tip.detach().css({top:0,left:0,display:"block"}).insertAfter(this.$element);pos=this.getPosition(inside);actualWidth=$tip[0].offsetWidth;actualHeight=$tip[0].offsetHeight;switch(inside?placement.split(" ")[1]:placement){case"bottom":tp={top:pos.top+pos.height,left:pos.left+pos.width/2-actualWidth/2};break;case"top":tp={top:pos.top-actualHeight,left:pos.left+pos.width/2-actualWidth/2};break;case"left":tp={top:pos.top+pos.height/2-actualHeight/2,left:pos.left-actualWidth};break;case"right":tp={top:pos.top+pos.height/2-actualHeight/2,left:pos.left+pos.width};break;}$tip.offset(tp).addClass(placement).addClass("in");}},setContent:function(){var $tip=this.tip(),title=this.getTitle();$tip.find(".tooltip-inner")[this.options.html?"html":"text"](title);$tip.removeClass("fade in top bottom left right");},hide:function(){var that=this,$tip=this.tip();$tip.removeClass("in");function removeWithAnimation(){var timeout=setTimeout(function(){$tip.off($.support.transition.end).detach();},500);$tip.one($.support.transition.end,function(){clearTimeout(timeout);$tip.detach();});}$.support.transition&&this.$tip.hasClass("fade")?removeWithAnimation():$tip.detach();return this;},fixTitle:function(){var $e=this.$element;if($e.attr("title")||typeof($e.attr("data-original-title"))!="string"){$e.attr("data-original-title",$e.attr("title")||"").removeAttr("title");}},hasContent:function(){return this.getTitle();},getPosition:function(inside){return $.extend({},(inside?{top:0,left:0}:this.$element.offset()),{width:this.$element[0].offsetWidth,height:this.$element[0].offsetHeight});},getTitle:function(){var title,$e=this.$element,o=this.options;title=$e.attr("data-original-title")||(typeof o.title=="function"?o.title.call($e[0]):o.title);return title;},tip:function(){return this.$tip=this.$tip||$(this.options.template);},validate:function(){if(!this.$element[0].parentNode){this.hide();this.$element=null;this.options=null;}},enable:function(){this.enabled=true;},disable:function(){this.enabled=false;},toggleEnabled:function(){this.enabled=!this.enabled;},toggle:function(e){var self=$(e.currentTarget)[this.type](this._options).data(this.type);self[self.tip().hasClass("in")?"hide":"show"]();},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type);}};var old=$.fn.tooltip;$.fn.tooltip=function(option){return this.each(function(){var $this=$(this),data=$this.data("tooltip"),options=typeof option=="object"&&option;if(!data){$this.data("tooltip",(data=new Tooltip(this,options)));}if(typeof option=="string"){data[option]();}});};$.fn.tooltip.Constructor=Tooltip;$.fn.tooltip.defaults={animation:true,placement:"top",selector:false,template:'<div class="tooltip"><div class="tooltip-arrow"></div><div class="tooltip-inner"></div></div>',trigger:"hover",title:"",delay:0,html:false};$.fn.tooltip.noConflict=function(){$.fn.tooltip=old;return this;};}(window.jQuery);!function($){var Popover=function(element,options){this.init("popover",element,options);};Popover.prototype=$.extend({},$.fn.tooltip.Constructor.prototype,{constructor:Popover,setContent:function(){var $tip=this.tip(),title=this.getTitle(),content=this.getContent();$tip.find(".popover-title")[this.options.html?"html":"text"](title);$tip.find(".popover-content")[this.options.html?"html":"text"](content);$tip.removeClass("fade top bottom left right in");},hasContent:function(){return this.getTitle()||this.getContent();},getContent:function(){var content,$e=this.$element,o=this.options;content=$e.attr("data-content")||(typeof o.content=="function"?o.content.call($e[0]):o.content);return content;},tip:function(){if(!this.$tip){this.$tip=$(this.options.template);}return this.$tip;},destroy:function(){this.hide().$element.off("."+this.type).removeData(this.type);}});var old=$.fn.popover;$.fn.popover=function(option){return this.each(function(){var $this=$(this),data=$this.data("popover"),options=typeof option=="object"&&option;if(!data){$this.data("popover",(data=new Popover(this,options)));}if(typeof option=="string"){data[option]();}});};$.fn.popover.Constructor=Popover;$.fn.popover.defaults=$.extend({},$.fn.tooltip.defaults,{placement:"right",trigger:"click",content:"",template:'<div class="popover"><div class="arrow"></div><div class="popover-inner"><h3 class="popover-title"></h3><div class="popover-content"></div></div></div>'});$.fn.popover.noConflict=function(){$.fn.popover=old;return this;};}(window.jQuery);!function($){function ScrollSpy(element,options){var process=$.proxy(this.process,this),$element=$(element).is("body")?$(window):$(element),href;this.options=$.extend({},$.fn.scrollspy.defaults,options);this.$scrollElement=$element.on("scroll.scroll-spy.data-api",process);this.selector=(this.options.target||((href=$(element).attr("href"))&&href.replace(/.*(?=#[^\s]+$)/,""))||"")+" .nav li > a";this.$body=$("body");this.refresh();this.process();}ScrollSpy.prototype={constructor:ScrollSpy,refresh:function(){var self=this,$targets;this.offsets=$([]);this.targets=$([]);$targets=this.$body.find(this.selector).map(function(){var $el=$(this),href=$el.data("target")||$el.attr("href"),$href=/^#\w/.test(href)&&$(href);return($href&&$href.length&&[[$href.position().top+self.$scrollElement.scrollTop(),href]])||null;}).sort(function(a,b){return a[0]-b[0];}).each(function(){self.offsets.push(this[0]);self.targets.push(this[1]);});},process:function(){var scrollTop=this.$scrollElement.scrollTop()+this.options.offset,scrollHeight=this.$scrollElement[0].scrollHeight||this.$body[0].scrollHeight,maxScroll=scrollHeight-this.$scrollElement.height(),offsets=this.offsets,targets=this.targets,activeTarget=this.activeTarget,i;if(scrollTop>=maxScroll){return activeTarget!=(i=targets.last()[0])&&this.activate(i);}for(i=offsets.length;i--;){activeTarget!=targets[i]&&scrollTop>=offsets[i]&&(!offsets[i+1]||scrollTop<=offsets[i+1])&&this.activate(targets[i]);}},activate:function(target){var active,selector;this.activeTarget=target;$(this.selector).parent(".active").removeClass("active");selector=this.selector+'[data-target="'+target+'"],'+this.selector+'[href="'+target+'"]';active=$(selector).parent("li").addClass("active");if(active.parent(".dropdown-menu").length){active=active.closest("li.dropdown").addClass("active");}active.trigger("activate");}};var old=$.fn.scrollspy;$.fn.scrollspy=function(option){return this.each(function(){var $this=$(this),data=$this.data("scrollspy"),options=typeof option=="object"&&option;if(!data){$this.data("scrollspy",(data=new ScrollSpy(this,options)));}if(typeof option=="string"){data[option]();}});};$.fn.scrollspy.Constructor=ScrollSpy;$.fn.scrollspy.defaults={offset:10};$.fn.scrollspy.noConflict=function(){$.fn.scrollspy=old;return this;};$(window).on("load",function(){$('[data-spy="scroll"]').each(function(){var $spy=$(this);$spy.scrollspy($spy.data());});});}(window.jQuery);!function($){var Tab=function(element){this.element=$(element);};Tab.prototype={constructor:Tab,show:function(){var $this=this.element,$ul=$this.closest("ul:not(.dropdown-menu)"),selector=$this.attr("data-target"),previous,$target,e;if(!selector){selector=$this.attr("href");selector=selector&&selector.replace(/.*(?=#[^\s]*$)/,"");}if($this.parent("li").hasClass("active")){return;}previous=$ul.find(".active:last a")[0];e=$.Event("show",{relatedTarget:previous});$this.trigger(e);if(e.isDefaultPrevented()){return;}$target=$(selector);this.activate($this.parent("li"),$ul);this.activate($target,$target.parent(),function(){$this.trigger({type:"shown",relatedTarget:previous});});},activate:function(element,container,callback){var $active=container.find("> .active"),transition=callback&&$.support.transition&&$active.hasClass("fade");function next(){$active.removeClass("active").find("> .dropdown-menu > .active").removeClass("active");element.addClass("active");if(transition){element[0].offsetWidth;element.addClass("in");}else{element.removeClass("fade");}if(element.parent(".dropdown-menu")){element.closest("li.dropdown").addClass("active");}callback&&callback();}transition?$active.one($.support.transition.end,next):next();$active.removeClass("in");}};var old=$.fn.tab;$.fn.tab=function(option){return this.each(function(){var $this=$(this),data=$this.data("tab");if(!data){$this.data("tab",(data=new Tab(this)));}if(typeof option=="string"){data[option]();}});};$.fn.tab.Constructor=Tab;$.fn.tab.noConflict=function(){$.fn.tab=old;return this;};$(document).on("click.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(e){e.preventDefault();$(this).tab("show");});}(window.jQuery);!function($){var Typeahead=function(element,options){this.$element=$(element);this.options=$.extend({},$.fn.typeahead.defaults,options);this.matcher=this.options.matcher||this.matcher;this.sorter=this.options.sorter||this.sorter;this.highlighter=this.options.highlighter||this.highlighter;this.updater=this.options.updater||this.updater;this.source=this.options.source;this.$menu=$(this.options.menu);this.shown=false;this.listen();};Typeahead.prototype={constructor:Typeahead,select:function(){var val=this.$menu.find(".active").attr("data-value");this.$element.val(this.updater(val)).change();return this.hide();},updater:function(item){return item;},show:function(){var pos=$.extend({},this.$element.position(),{height:this.$element[0].offsetHeight});this.$menu.insertAfter(this.$element).css({top:pos.top+pos.height,left:pos.left}).show();this.shown=true;return this;},hide:function(){this.$menu.hide();this.shown=false;return this;},lookup:function(event){var items;this.query=this.$element.val();if(!this.query||this.query.length<this.options.minLength){return this.shown?this.hide():this;}items=$.isFunction(this.source)?this.source(this.query,$.proxy(this.process,this)):this.source;return items?this.process(items):this;},process:function(items){var that=this;items=$.grep(items,function(item){return that.matcher(item);});items=this.sorter(items);if(!items.length){return this.shown?this.hide():this;}return this.render(items.slice(0,this.options.items)).show();},matcher:function(item){return ~item.toLowerCase().indexOf(this.query.toLowerCase());},sorter:function(items){var beginswith=[],caseSensitive=[],caseInsensitive=[],item;while(item=items.shift()){if(!item.toLowerCase().indexOf(this.query.toLowerCase())){beginswith.push(item);}else{if(~item.indexOf(this.query)){caseSensitive.push(item);}else{caseInsensitive.push(item);}}}return beginswith.concat(caseSensitive,caseInsensitive);},highlighter:function(item){var query=this.query.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g,"\\$&");return item.replace(new RegExp("("+query+")","ig"),function($1,match){return"<strong>"+match+"</strong>";});},render:function(items){var that=this;items=$(items).map(function(i,item){i=$(that.options.item).attr("data-value",item);i.find("a").html(that.highlighter(item));return i[0];});items.first().addClass("active");this.$menu.html(items);return this;},next:function(event){var active=this.$menu.find(".active").removeClass("active"),next=active.next();if(!next.length){next=$(this.$menu.find("li")[0]);}next.addClass("active");},prev:function(event){var active=this.$menu.find(".active").removeClass("active"),prev=active.prev();if(!prev.length){prev=this.$menu.find("li").last();}prev.addClass("active");},listen:function(){this.$element.on("blur",$.proxy(this.blur,this)).on("keypress",$.proxy(this.keypress,this)).on("keyup",$.proxy(this.keyup,this));if(this.eventSupported("keydown")){this.$element.on("keydown",$.proxy(this.keydown,this));}this.$menu.on("click",$.proxy(this.click,this)).on("mouseenter","li",$.proxy(this.mouseenter,this));},eventSupported:function(eventName){var isSupported=eventName in this.$element;if(!isSupported){this.$element.setAttribute(eventName,"return;");isSupported=typeof this.$element[eventName]==="function";}return isSupported;},move:function(e){if(!this.shown){return;}switch(e.keyCode){case 9:case 13:case 27:e.preventDefault();break;case 38:e.preventDefault();this.prev();break;case 40:e.preventDefault();this.next();break;}e.stopPropagation();},keydown:function(e){this.suppressKeyPressRepeat=~$.inArray(e.keyCode,[40,38,9,13,27]);this.move(e);},keypress:function(e){if(this.suppressKeyPressRepeat){return;}this.move(e);},keyup:function(e){switch(e.keyCode){case 40:case 38:case 16:case 17:case 18:break;case 9:case 13:if(!this.shown){return;}this.select();break;case 27:if(!this.shown){return;}this.hide();break;default:this.lookup();}e.stopPropagation();e.preventDefault();},blur:function(e){var that=this;setTimeout(function(){that.hide();},150);},click:function(e){e.stopPropagation();e.preventDefault();this.select();},mouseenter:function(e){this.$menu.find(".active").removeClass("active");$(e.currentTarget).addClass("active");}};var old=$.fn.typeahead;$.fn.typeahead=function(option){return this.each(function(){var $this=$(this),data=$this.data("typeahead"),options=typeof option=="object"&&option;if(!data){$this.data("typeahead",(data=new Typeahead(this,options)));}if(typeof option=="string"){data[option]();}});};$.fn.typeahead.defaults={source:[],items:8,menu:'<ul class="typeahead dropdown-menu"></ul>',item:'<li><a href="#"></a></li>',minLength:1};$.fn.typeahead.Constructor=Typeahead;$.fn.typeahead.noConflict=function(){$.fn.typeahead=old;return this;};$(document).on("focus.typeahead.data-api",'[data-provide="typeahead"]',function(e){var $this=$(this);if($this.data("typeahead")){return;}e.preventDefault();$this.typeahead($this.data());});}(window.jQuery);!function($){var Affix=function(element,options){this.options=$.extend({},$.fn.affix.defaults,options);this.$window=$(window).on("scroll.affix.data-api",$.proxy(this.checkPosition,this)).on("click.affix.data-api",$.proxy(function(){setTimeout($.proxy(this.checkPosition,this),1);},this));this.$element=$(element);this.checkPosition();};Affix.prototype.checkPosition=function(){if(!this.$element.is(":visible")){return;}var scrollHeight=$(document).height(),scrollTop=this.$window.scrollTop(),position=this.$element.offset(),offset=this.options.offset,offsetBottom=offset.bottom,offsetTop=offset.top,reset="affix affix-top affix-bottom",affix;if(typeof offset!="object"){offsetBottom=offsetTop=offset;}if(typeof offsetTop=="function"){offsetTop=offset.top();}if(typeof offsetBottom=="function"){offsetBottom=offset.bottom();}affix=this.unpin!=null&&(scrollTop+this.unpin<=position.top)?false:offsetBottom!=null&&(position.top+this.$element.height()>=scrollHeight-offsetBottom)?"bottom":offsetTop!=null&&scrollTop<=offsetTop?"top":false;if(this.affixed===affix){return;}this.affixed=affix;this.unpin=affix=="bottom"?position.top-scrollTop:null;this.$element.removeClass(reset).addClass("affix"+(affix?"-"+affix:""));};var old=$.fn.affix;$.fn.affix=function(option){return this.each(function(){var $this=$(this),data=$this.data("affix"),options=typeof option=="object"&&option;if(!data){$this.data("affix",(data=new Affix(this,options)));}if(typeof option=="string"){data[option]();}});};$.fn.affix.Constructor=Affix;$.fn.affix.defaults={offset:0};$.fn.affix.noConflict=function(){$.fn.affix=old;return this;};$(window).on("load",function(){$('[data-spy="affix"]').each(function(){var $spy=$(this),data=$spy.data();data.offset=data.offset||{};data.offsetBottom&&(data.offset.bottom=data.offsetBottom);data.offsetTop&&(data.offset.top=data.offsetTop);$spy.affix(data);});});}(window.jQuery);
/* end bootstrap.js */

/* jquery.easing.js*/
jQuery.easing["jswing"]=jQuery.easing["swing"];jQuery.extend(jQuery.easing,{def:"easeOutQuad",swing:function(x,t,b,c,d){return jQuery.easing[jQuery.easing.def](x,t,b,c,d);},easeInQuad:function(x,t,b,c,d){return c*(t/=d)*t+b;},easeOutQuad:function(x,t,b,c,d){return -c*(t/=d)*(t-2)+b;},easeInOutQuad:function(x,t,b,c,d){if((t/=d/2)<1){return c/2*t*t+b;}return -c/2*((--t)*(t-2)-1)+b;},easeInCubic:function(x,t,b,c,d){return c*(t/=d)*t*t+b;},easeOutCubic:function(x,t,b,c,d){return c*((t=t/d-1)*t*t+1)+b;},easeInOutCubic:function(x,t,b,c,d){if((t/=d/2)<1){return c/2*t*t*t+b;}return c/2*((t-=2)*t*t+2)+b;},easeInQuart:function(x,t,b,c,d){return c*(t/=d)*t*t*t+b;},easeOutQuart:function(x,t,b,c,d){return -c*((t=t/d-1)*t*t*t-1)+b;},easeInOutQuart:function(x,t,b,c,d){if((t/=d/2)<1){return c/2*t*t*t*t+b;}return -c/2*((t-=2)*t*t*t-2)+b;},easeInQuint:function(x,t,b,c,d){return c*(t/=d)*t*t*t*t+b;},easeOutQuint:function(x,t,b,c,d){return c*((t=t/d-1)*t*t*t*t+1)+b;},easeInOutQuint:function(x,t,b,c,d){if((t/=d/2)<1){return c/2*t*t*t*t*t+b;}return c/2*((t-=2)*t*t*t*t+2)+b;},easeInSine:function(x,t,b,c,d){return -c*Math.cos(t/d*(Math.PI/2))+c+b;},easeOutSine:function(x,t,b,c,d){return c*Math.sin(t/d*(Math.PI/2))+b;},easeInOutSine:function(x,t,b,c,d){return -c/2*(Math.cos(Math.PI*t/d)-1)+b;},easeInExpo:function(x,t,b,c,d){return(t==0)?b:c*Math.pow(2,10*(t/d-1))+b;},easeOutExpo:function(x,t,b,c,d){return(t==d)?b+c:c*(-Math.pow(2,-10*t/d)+1)+b;},easeInOutExpo:function(x,t,b,c,d){if(t==0){return b;}if(t==d){return b+c;}if((t/=d/2)<1){return c/2*Math.pow(2,10*(t-1))+b;}return c/2*(-Math.pow(2,-10*--t)+2)+b;},easeInCirc:function(x,t,b,c,d){return -c*(Math.sqrt(1-(t/=d)*t)-1)+b;},easeOutCirc:function(x,t,b,c,d){return c*Math.sqrt(1-(t=t/d-1)*t)+b;},easeInOutCirc:function(x,t,b,c,d){if((t/=d/2)<1){return -c/2*(Math.sqrt(1-t*t)-1)+b;}return c/2*(Math.sqrt(1-(t-=2)*t)+1)+b;},easeInElastic:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0){return b;}if((t/=d)==1){return b+c;}if(!p){p=d*0.3;}if(a<Math.abs(c)){a=c;var s=p/4;}else{var s=p/(2*Math.PI)*Math.asin(c/a);}return -(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;},easeOutElastic:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0){return b;}if((t/=d)==1){return b+c;}if(!p){p=d*0.3;}if(a<Math.abs(c)){a=c;var s=p/4;}else{var s=p/(2*Math.PI)*Math.asin(c/a);}return a*Math.pow(2,-10*t)*Math.sin((t*d-s)*(2*Math.PI)/p)+c+b;},easeInOutElastic:function(x,t,b,c,d){var s=1.70158;var p=0;var a=c;if(t==0){return b;}if((t/=d/2)==2){return b+c;}if(!p){p=d*(0.3*1.5);}if(a<Math.abs(c)){a=c;var s=p/4;}else{var s=p/(2*Math.PI)*Math.asin(c/a);}if(t<1){return -0.5*(a*Math.pow(2,10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p))+b;}return a*Math.pow(2,-10*(t-=1))*Math.sin((t*d-s)*(2*Math.PI)/p)*0.5+c+b;},easeInBack:function(x,t,b,c,d,s){if(s==undefined){s=1.70158;}return c*(t/=d)*t*((s+1)*t-s)+b;},easeOutBack:function(x,t,b,c,d,s){if(s==undefined){s=1.70158;}return c*((t=t/d-1)*t*((s+1)*t+s)+1)+b;},easeInOutBack:function(x,t,b,c,d,s){if(s==undefined){s=1.70158;}if((t/=d/2)<1){return c/2*(t*t*(((s*=(1.525))+1)*t-s))+b;}return c/2*((t-=2)*t*(((s*=(1.525))+1)*t+s)+2)+b;},easeInBounce:function(x,t,b,c,d){return c-jQuery.easing.easeOutBounce(x,d-t,0,c,d)+b;},easeOutBounce:function(x,t,b,c,d){if((t/=d)<(1/2.75)){return c*(7.5625*t*t)+b;}else{if(t<(2/2.75)){return c*(7.5625*(t-=(1.5/2.75))*t+0.75)+b;}else{if(t<(2.5/2.75)){return c*(7.5625*(t-=(2.25/2.75))*t+0.9375)+b;}else{return c*(7.5625*(t-=(2.625/2.75))*t+0.984375)+b;}}}},easeInOutBounce:function(x,t,b,c,d){if(t<d/2){return jQuery.easing.easeInBounce(x,t*2,0,c,d)*0.5+b;}return jQuery.easing.easeOutBounce(x,t*2-d,0,c,d)*0.5+c*0.5+b;}});
/*  end jquery.easing.js*/

/* jquery.flexslider.js*/
(function($){$.flexslider=function(el,options){var slider=$(el);slider.vars=$.extend({},$.flexslider.defaults,options);var namespace=slider.vars.namespace,msGesture=window.navigator&&window.navigator.msPointerEnabled&&window.MSGesture,touch=(("ontouchstart" in window)||msGesture||window.DocumentTouch&&document instanceof DocumentTouch)&&slider.vars.touch,eventType="click touchend MSPointerUp",watchedEvent="",watchedEventClearTimer,vertical=slider.vars.direction==="vertical",reverse=slider.vars.reverse,carousel=(slider.vars.itemWidth>0),fade=slider.vars.animation==="fade",asNav=slider.vars.asNavFor!=="",methods={},focused=true;$.data(el,"flexslider",slider);methods={init:function(){slider.animating=false;slider.currentSlide=parseInt((slider.vars.startAt?slider.vars.startAt:0));if(isNaN(slider.currentSlide)){slider.currentSlide=0;}slider.animatingTo=slider.currentSlide;slider.atEnd=(slider.currentSlide===0||slider.currentSlide===slider.last);slider.containerSelector=slider.vars.selector.substr(0,slider.vars.selector.search(" "));slider.slides=$(slider.vars.selector,slider);slider.container=$(slider.containerSelector,slider);slider.count=slider.slides.length;slider.syncExists=$(slider.vars.sync).length>0;if(slider.vars.animation==="slide"){slider.vars.animation="swing";}slider.prop=(vertical)?"top":"marginLeft";slider.args={};slider.manualPause=false;slider.stopped=false;slider.started=false;slider.startTimeout=null;slider.transitions=!slider.vars.video&&!fade&&slider.vars.useCSS&&(function(){var obj=document.createElement("div"),props=["perspectiveProperty","WebkitPerspective","MozPerspective","OPerspective","msPerspective"];for(var i in props){if(obj.style[props[i]]!==undefined){slider.pfx=props[i].replace("Perspective","").toLowerCase();slider.prop="-"+slider.pfx+"-transform";return true;}}return false;}());if(slider.vars.controlsContainer!==""){slider.controlsContainer=$(slider.vars.controlsContainer).length>0&&$(slider.vars.controlsContainer);}if(slider.vars.manualControls!==""){slider.manualControls=$(slider.vars.manualControls).length>0&&$(slider.vars.manualControls);}if(slider.vars.randomize){slider.slides.sort(function(){return(Math.round(Math.random())-0.5);});slider.container.empty().append(slider.slides);}slider.doMath();slider.setup("init");if(slider.vars.controlNav){methods.controlNav.setup();}if(slider.vars.directionNav){methods.directionNav.setup();}if(slider.vars.keyboard&&($(slider.containerSelector).length===1||slider.vars.multipleKeyboard)){$(document).bind("keyup",function(event){var keycode=event.keyCode;if(!slider.animating&&(keycode===39||keycode===37)){var target=(keycode===39)?slider.getTarget("next"):(keycode===37)?slider.getTarget("prev"):false;slider.flexAnimate(target,slider.vars.pauseOnAction);}});}if(slider.vars.mousewheel){slider.bind("mousewheel",function(event,delta,deltaX,deltaY){event.preventDefault();var target=(delta<0)?slider.getTarget("next"):slider.getTarget("prev");slider.flexAnimate(target,slider.vars.pauseOnAction);});}if(slider.vars.pausePlay){methods.pausePlay.setup();}if(slider.vars.slideshow&&slider.vars.pauseInvisible){methods.pauseInvisible.init();}if(slider.vars.slideshow){if(slider.vars.pauseOnHover){slider.hover(function(){if(!slider.manualPlay&&!slider.manualPause){slider.pause();}},function(){if(!slider.manualPause&&!slider.manualPlay&&!slider.stopped){slider.play();}});}if(!slider.vars.pauseInvisible||!methods.pauseInvisible.isHidden()){(slider.vars.initDelay>0)?slider.startTimeout=setTimeout(slider.play,slider.vars.initDelay):slider.play();}}if(asNav){methods.asNav.setup();}if(touch&&slider.vars.touch){methods.touch();}if(!fade||(fade&&slider.vars.smoothHeight)){$(window).bind("resize orientationchange focus",methods.resize);}slider.find("img").attr("draggable","false");setTimeout(function(){slider.vars.start(slider);},200);},asNav:{setup:function(){slider.asNav=true;slider.animatingTo=Math.floor(slider.currentSlide/slider.move);slider.currentItem=slider.currentSlide;slider.slides.removeClass(namespace+"active-slide").eq(slider.currentItem).addClass(namespace+"active-slide");if(!msGesture){slider.slides.click(function(e){e.preventDefault();var $slide=$(this),target=$slide.index();var posFromLeft=$slide.offset().left-$(slider).scrollLeft();if(posFromLeft<=0&&$slide.hasClass(namespace+"active-slide")){slider.flexAnimate(slider.getTarget("prev"),true);}else{if(!$(slider.vars.asNavFor).data("flexslider").animating&&!$slide.hasClass(namespace+"active-slide")){slider.direction=(slider.currentItem<target)?"next":"prev";slider.flexAnimate(target,slider.vars.pauseOnAction,false,true,true);}}});}else{el._slider=slider;slider.slides.each(function(){var that=this;that._gesture=new MSGesture();that._gesture.target=that;that.addEventListener("MSPointerDown",function(e){e.preventDefault();if(e.currentTarget._gesture){e.currentTarget._gesture.addPointer(e.pointerId);}},false);that.addEventListener("MSGestureTap",function(e){e.preventDefault();var $slide=$(this),target=$slide.index();if(!$(slider.vars.asNavFor).data("flexslider").animating&&!$slide.hasClass("active")){slider.direction=(slider.currentItem<target)?"next":"prev";slider.flexAnimate(target,slider.vars.pauseOnAction,false,true,true);}});});}}},controlNav:{setup:function(){if(!slider.manualControls){methods.controlNav.setupPaging();}else{methods.controlNav.setupManual();}},setupPaging:function(){var type=(slider.vars.controlNav==="thumbnails")?"control-thumbs":"control-paging",j=1,item,slide;slider.controlNavScaffold=$('<ol class="'+namespace+"control-nav "+namespace+type+'"></ol>');if(slider.pagingCount>1){for(var i=0;i<slider.pagingCount;i++){slide=slider.slides.eq(i);item=(slider.vars.controlNav==="thumbnails")?'<img src="'+slide.attr("data-thumb")+'"/>':"<a>"+j+"</a>";if("thumbnails"===slider.vars.controlNav&&true===slider.vars.thumbCaptions){var captn=slide.attr("data-thumbcaption");if(""!=captn&&undefined!=captn){item+='<span class="'+namespace+'caption">'+captn+"</span>";}}slider.controlNavScaffold.append("<li>"+item+"</li>");j++;}}(slider.controlsContainer)?$(slider.controlsContainer).append(slider.controlNavScaffold):slider.append(slider.controlNavScaffold);methods.controlNav.set();methods.controlNav.active();slider.controlNavScaffold.delegate("a, img",eventType,function(event){event.preventDefault();if(watchedEvent===""||watchedEvent===event.type){var $this=$(this),target=slider.controlNav.index($this);if(!$this.hasClass(namespace+"active")){slider.direction=(target>slider.currentSlide)?"next":"prev";slider.flexAnimate(target,slider.vars.pauseOnAction);}}if(watchedEvent===""){watchedEvent=event.type;}methods.setToClearWatchedEvent();});},setupManual:function(){slider.controlNav=slider.manualControls;methods.controlNav.active();slider.controlNav.bind(eventType,function(event){event.preventDefault();if(watchedEvent===""||watchedEvent===event.type){var $this=$(this),target=slider.controlNav.index($this);if(!$this.hasClass(namespace+"active")){(target>slider.currentSlide)?slider.direction="next":slider.direction="prev";slider.flexAnimate(target,slider.vars.pauseOnAction);}}if(watchedEvent===""){watchedEvent=event.type;}methods.setToClearWatchedEvent();});},set:function(){var selector=(slider.vars.controlNav==="thumbnails")?"img":"a";slider.controlNav=$("."+namespace+"control-nav li "+selector,(slider.controlsContainer)?slider.controlsContainer:slider);},active:function(){slider.controlNav.removeClass(namespace+"active").eq(slider.animatingTo).addClass(namespace+"active");},update:function(action,pos){if(slider.pagingCount>1&&action==="add"){slider.controlNavScaffold.append($("<li><a>"+slider.count+"</a></li>"));}else{if(slider.pagingCount===1){slider.controlNavScaffold.find("li").remove();}else{slider.controlNav.eq(pos).closest("li").remove();}}methods.controlNav.set();(slider.pagingCount>1&&slider.pagingCount!==slider.controlNav.length)?slider.update(pos,action):methods.controlNav.active();}},directionNav:{setup:function(){var directionNavScaffold=$('<ul class="'+namespace+'direction-nav"><li><a class="'+namespace+'prev" href="#">'+slider.vars.prevText+'</a></li><li><a class="'+namespace+'next" href="#">'+slider.vars.nextText+"</a></li></ul>");if(slider.controlsContainer){$(slider.controlsContainer).append(directionNavScaffold);slider.directionNav=$("."+namespace+"direction-nav li a",slider.controlsContainer);}else{slider.append(directionNavScaffold);slider.directionNav=$("."+namespace+"direction-nav li a",slider);}methods.directionNav.update();slider.directionNav.bind(eventType,function(event){event.preventDefault();var target;if(watchedEvent===""||watchedEvent===event.type){target=($(this).hasClass(namespace+"next"))?slider.getTarget("next"):slider.getTarget("prev");slider.flexAnimate(target,slider.vars.pauseOnAction);}if(watchedEvent===""){watchedEvent=event.type;}methods.setToClearWatchedEvent();});},update:function(){var disabledClass=namespace+"disabled";if(slider.pagingCount===1){slider.directionNav.addClass(disabledClass).attr("tabindex","-1");}else{if(!slider.vars.animationLoop){if(slider.animatingTo===0){slider.directionNav.removeClass(disabledClass).filter("."+namespace+"prev").addClass(disabledClass).attr("tabindex","-1");}else{if(slider.animatingTo===slider.last){slider.directionNav.removeClass(disabledClass).filter("."+namespace+"next").addClass(disabledClass).attr("tabindex","-1");}else{slider.directionNav.removeClass(disabledClass).removeAttr("tabindex");}}}else{slider.directionNav.removeClass(disabledClass).removeAttr("tabindex");}}}},pausePlay:{setup:function(){var pausePlayScaffold=$('<div class="'+namespace+'pauseplay"><a></a></div>');if(slider.controlsContainer){slider.controlsContainer.append(pausePlayScaffold);slider.pausePlay=$("."+namespace+"pauseplay a",slider.controlsContainer);}else{slider.append(pausePlayScaffold);slider.pausePlay=$("."+namespace+"pauseplay a",slider);}methods.pausePlay.update((slider.vars.slideshow)?namespace+"pause":namespace+"play");slider.pausePlay.bind(eventType,function(event){event.preventDefault();if(watchedEvent===""||watchedEvent===event.type){if($(this).hasClass(namespace+"pause")){slider.manualPause=true;slider.manualPlay=false;slider.pause();}else{slider.manualPause=false;slider.manualPlay=true;slider.play();}}if(watchedEvent===""){watchedEvent=event.type;}methods.setToClearWatchedEvent();});},update:function(state){(state==="play")?slider.pausePlay.removeClass(namespace+"pause").addClass(namespace+"play").html(slider.vars.playText):slider.pausePlay.removeClass(namespace+"play").addClass(namespace+"pause").html(slider.vars.pauseText);}},touch:function(){var startX,startY,offset,cwidth,dx,startT,scrolling=false,localX=0,localY=0,accDx=0;if(!msGesture){el.addEventListener("touchstart",onTouchStart,false);function onTouchStart(e){if(slider.animating){e.preventDefault();}else{if((window.navigator.msPointerEnabled)||e.touches.length===1){slider.pause();cwidth=(vertical)?slider.h:slider.w;startT=Number(new Date());localX=e.touches[0].pageX;localY=e.touches[0].pageY;offset=(carousel&&reverse&&slider.animatingTo===slider.last)?0:(carousel&&reverse)?slider.limit-(((slider.itemW+slider.vars.itemMargin)*slider.move)*slider.animatingTo):(carousel&&slider.currentSlide===slider.last)?slider.limit:(carousel)?((slider.itemW+slider.vars.itemMargin)*slider.move)*slider.currentSlide:(reverse)?(slider.last-slider.currentSlide+slider.cloneOffset)*cwidth:(slider.currentSlide+slider.cloneOffset)*cwidth;startX=(vertical)?localY:localX;startY=(vertical)?localX:localY;el.addEventListener("touchmove",onTouchMove,false);el.addEventListener("touchend",onTouchEnd,false);}}}function onTouchMove(e){localX=e.touches[0].pageX;localY=e.touches[0].pageY;dx=(vertical)?startX-localY:startX-localX;scrolling=(vertical)?(Math.abs(dx)<Math.abs(localX-startY)):(Math.abs(dx)<Math.abs(localY-startY));var fxms=500;if(!scrolling||Number(new Date())-startT>fxms){e.preventDefault();if(!fade&&slider.transitions){if(!slider.vars.animationLoop){dx=dx/((slider.currentSlide===0&&dx<0||slider.currentSlide===slider.last&&dx>0)?(Math.abs(dx)/cwidth+2):1);}slider.setProps(offset+dx,"setTouch");}}}function onTouchEnd(e){el.removeEventListener("touchmove",onTouchMove,false);if(slider.animatingTo===slider.currentSlide&&!scrolling&&!(dx===null)){var updateDx=(reverse)?-dx:dx,target=(updateDx>0)?slider.getTarget("next"):slider.getTarget("prev");if(slider.canAdvance(target)&&(Number(new Date())-startT<550&&Math.abs(updateDx)>50||Math.abs(updateDx)>cwidth/2)){slider.flexAnimate(target,slider.vars.pauseOnAction);}else{if(!fade){slider.flexAnimate(slider.currentSlide,slider.vars.pauseOnAction,true);}}}el.removeEventListener("touchend",onTouchEnd,false);startX=null;startY=null;dx=null;offset=null;}}else{el.style.msTouchAction="none";el._gesture=new MSGesture();el._gesture.target=el;el.addEventListener("MSPointerDown",onMSPointerDown,false);el._slider=slider;el.addEventListener("MSGestureChange",onMSGestureChange,false);el.addEventListener("MSGestureEnd",onMSGestureEnd,false);function onMSPointerDown(e){e.stopPropagation();if(slider.animating){e.preventDefault();}else{slider.pause();el._gesture.addPointer(e.pointerId);accDx=0;cwidth=(vertical)?slider.h:slider.w;startT=Number(new Date());offset=(carousel&&reverse&&slider.animatingTo===slider.last)?0:(carousel&&reverse)?slider.limit-(((slider.itemW+slider.vars.itemMargin)*slider.move)*slider.animatingTo):(carousel&&slider.currentSlide===slider.last)?slider.limit:(carousel)?((slider.itemW+slider.vars.itemMargin)*slider.move)*slider.currentSlide:(reverse)?(slider.last-slider.currentSlide+slider.cloneOffset)*cwidth:(slider.currentSlide+slider.cloneOffset)*cwidth;}}function onMSGestureChange(e){e.stopPropagation();var slider=e.target._slider;if(!slider){return;}var transX=-e.translationX,transY=-e.translationY;accDx=accDx+((vertical)?transY:transX);dx=accDx;scrolling=(vertical)?(Math.abs(accDx)<Math.abs(-transX)):(Math.abs(accDx)<Math.abs(-transY));if(e.detail===e.MSGESTURE_FLAG_INERTIA){setImmediate(function(){el._gesture.stop();});return;}if(!scrolling||Number(new Date())-startT>500){e.preventDefault();if(!fade&&slider.transitions){if(!slider.vars.animationLoop){dx=accDx/((slider.currentSlide===0&&accDx<0||slider.currentSlide===slider.last&&accDx>0)?(Math.abs(accDx)/cwidth+2):1);}slider.setProps(offset+dx,"setTouch");}}}function onMSGestureEnd(e){e.stopPropagation();var slider=e.target._slider;if(!slider){return;}if(slider.animatingTo===slider.currentSlide&&!scrolling&&!(dx===null)){var updateDx=(reverse)?-dx:dx,target=(updateDx>0)?slider.getTarget("next"):slider.getTarget("prev");if(slider.canAdvance(target)&&(Number(new Date())-startT<550&&Math.abs(updateDx)>50||Math.abs(updateDx)>cwidth/2)){slider.flexAnimate(target,slider.vars.pauseOnAction);}else{if(!fade){slider.flexAnimate(slider.currentSlide,slider.vars.pauseOnAction,true);}}}startX=null;startY=null;dx=null;offset=null;accDx=0;}}},resize:function(){if(!slider.animating&&slider.is(":visible")){if(!carousel){slider.doMath();}if(fade){methods.smoothHeight();}else{if(carousel){slider.slides.width(slider.computedW);slider.update(slider.pagingCount);slider.setProps();}else{if(vertical){slider.viewport.height(slider.h);slider.setProps(slider.h,"setTotal");}else{if(slider.vars.smoothHeight){methods.smoothHeight();}slider.newSlides.width(slider.computedW);slider.setProps(slider.computedW,"setTotal");}}}}},smoothHeight:function(dur){if(!vertical||fade){var $obj=(fade)?slider:slider.viewport;(dur)?$obj.animate({"height":slider.slides.eq(slider.animatingTo).height()},dur):$obj.height(slider.slides.eq(slider.animatingTo).height());}},sync:function(action){var $obj=$(slider.vars.sync).data("flexslider"),target=slider.animatingTo;switch(action){case"animate":$obj.flexAnimate(target,slider.vars.pauseOnAction,false,true);break;case"play":if(!$obj.playing&&!$obj.asNav){$obj.play();}break;case"pause":$obj.pause();break;}},pauseInvisible:{visProp:null,init:function(){var prefixes=["webkit","moz","ms","o"];if("hidden" in document){return"hidden";}for(var i=0;i<prefixes.length;i++){if((prefixes[i]+"Hidden") in document){methods.pauseInvisible.visProp=prefixes[i]+"Hidden";}}if(methods.pauseInvisible.visProp){var evtname=methods.pauseInvisible.visProp.replace(/[H|h]idden/,"")+"visibilitychange";document.addEventListener(evtname,function(){if(methods.pauseInvisible.isHidden()){if(slider.startTimeout){clearTimeout(slider.startTimeout);}else{slider.pause();}}else{if(slider.started){slider.play();}else{(slider.vars.initDelay>0)?setTimeout(slider.play,slider.vars.initDelay):slider.play();}}});}},isHidden:function(){return document[methods.pauseInvisible.visProp]||false;}},setToClearWatchedEvent:function(){clearTimeout(watchedEventClearTimer);watchedEventClearTimer=setTimeout(function(){watchedEvent="";},3000);}};slider.flexAnimate=function(target,pause,override,withSync,fromNav){if(!slider.vars.animationLoop&&target!==slider.currentSlide){slider.direction=(target>slider.currentSlide)?"next":"prev";}if(asNav&&slider.pagingCount===1){slider.direction=(slider.currentItem<target)?"next":"prev";}if(!slider.animating&&(slider.canAdvance(target,fromNav)||override)&&slider.is(":visible")){if(asNav&&withSync){var master=$(slider.vars.asNavFor).data("flexslider");slider.atEnd=target===0||target===slider.count-1;master.flexAnimate(target,true,false,true,fromNav);slider.direction=(slider.currentItem<target)?"next":"prev";master.direction=slider.direction;if(Math.ceil((target+1)/slider.visible)-1!==slider.currentSlide&&target!==0){slider.currentItem=target;slider.slides.removeClass(namespace+"active-slide").eq(target).addClass(namespace+"active-slide");target=Math.floor(target/slider.visible);}else{slider.currentItem=target;slider.slides.removeClass(namespace+"active-slide").eq(target).addClass(namespace+"active-slide");return false;}}slider.animating=true;slider.animatingTo=target;if(pause){slider.pause();}slider.vars.before(slider);if(slider.syncExists&&!fromNav){methods.sync("animate");}if(slider.vars.controlNav){methods.controlNav.active();}if(!carousel){slider.slides.removeClass(namespace+"active-slide").eq(target).addClass(namespace+"active-slide");}slider.atEnd=target===0||target===slider.last;if(slider.vars.directionNav){methods.directionNav.update();}if(target===slider.last){slider.vars.end(slider);if(!slider.vars.animationLoop){slider.pause();}}if(!fade){var dimension=(vertical)?slider.slides.filter(":first").height():slider.computedW,margin,slideString,calcNext;if(carousel){margin=slider.vars.itemMargin;calcNext=((slider.itemW+margin)*slider.move)*slider.animatingTo;slideString=(calcNext>slider.limit&&slider.visible!==1)?slider.limit:calcNext;}else{if(slider.currentSlide===0&&target===slider.count-1&&slider.vars.animationLoop&&slider.direction!=="next"){slideString=(reverse)?(slider.count+slider.cloneOffset)*dimension:0;}else{if(slider.currentSlide===slider.last&&target===0&&slider.vars.animationLoop&&slider.direction!=="prev"){slideString=(reverse)?0:(slider.count+1)*dimension;}else{slideString=(reverse)?((slider.count-1)-target+slider.cloneOffset)*dimension:(target+slider.cloneOffset)*dimension;}}}slider.setProps(slideString,"",slider.vars.animationSpeed);if(slider.transitions){if(!slider.vars.animationLoop||!slider.atEnd){slider.animating=false;slider.currentSlide=slider.animatingTo;}slider.container.unbind("webkitTransitionEnd transitionend");slider.container.bind("webkitTransitionEnd transitionend",function(){slider.wrapup(dimension);});}else{slider.container.animate(slider.args,slider.vars.animationSpeed,slider.vars.easing,function(){slider.wrapup(dimension);});}}else{if(!touch){slider.slides.eq(slider.currentSlide).css({"zIndex":1}).animate({"opacity":0},slider.vars.animationSpeed,slider.vars.easing);slider.slides.eq(target).css({"zIndex":2}).animate({"opacity":1},slider.vars.animationSpeed,slider.vars.easing,slider.wrapup);}else{slider.slides.eq(slider.currentSlide).css({"opacity":0,"zIndex":1});slider.slides.eq(target).css({"opacity":1,"zIndex":2});slider.wrapup(dimension);}}if(slider.vars.smoothHeight){methods.smoothHeight(slider.vars.animationSpeed);}}};slider.wrapup=function(dimension){if(!fade&&!carousel){if(slider.currentSlide===0&&slider.animatingTo===slider.last&&slider.vars.animationLoop){slider.setProps(dimension,"jumpEnd");}else{if(slider.currentSlide===slider.last&&slider.animatingTo===0&&slider.vars.animationLoop){slider.setProps(dimension,"jumpStart");}}}slider.animating=false;slider.currentSlide=slider.animatingTo;slider.vars.after(slider);};slider.animateSlides=function(){if(!slider.animating&&focused){slider.flexAnimate(slider.getTarget("next"));}};slider.pause=function(){clearInterval(slider.animatedSlides);slider.animatedSlides=null;slider.playing=false;if(slider.vars.pausePlay){methods.pausePlay.update("play");}if(slider.syncExists){methods.sync("pause");}};slider.play=function(){if(slider.playing){clearInterval(slider.animatedSlides);}slider.animatedSlides=slider.animatedSlides||setInterval(slider.animateSlides,slider.vars.slideshowSpeed);slider.started=slider.playing=true;if(slider.vars.pausePlay){methods.pausePlay.update("pause");}if(slider.syncExists){methods.sync("play");}};slider.stop=function(){slider.pause();slider.stopped=true;};slider.canAdvance=function(target,fromNav){var last=(asNav)?slider.pagingCount-1:slider.last;return(fromNav)?true:(asNav&&slider.currentItem===slider.count-1&&target===0&&slider.direction==="prev")?true:(asNav&&slider.currentItem===0&&target===slider.pagingCount-1&&slider.direction!=="next")?false:(target===slider.currentSlide&&!asNav)?false:(slider.vars.animationLoop)?true:(slider.atEnd&&slider.currentSlide===0&&target===last&&slider.direction!=="next")?false:(slider.atEnd&&slider.currentSlide===last&&target===0&&slider.direction==="next")?false:true;};slider.getTarget=function(dir){slider.direction=dir;if(dir==="next"){return(slider.currentSlide===slider.last)?0:slider.currentSlide+1;}else{return(slider.currentSlide===0)?slider.last:slider.currentSlide-1;}};slider.setProps=function(pos,special,dur){var target=(function(){var posCheck=(pos)?pos:((slider.itemW+slider.vars.itemMargin)*slider.move)*slider.animatingTo,posCalc=(function(){if(carousel){return(special==="setTouch")?pos:(reverse&&slider.animatingTo===slider.last)?0:(reverse)?slider.limit-(((slider.itemW+slider.vars.itemMargin)*slider.move)*slider.animatingTo):(slider.animatingTo===slider.last)?slider.limit:posCheck;}else{switch(special){case"setTotal":return(reverse)?((slider.count-1)-slider.currentSlide+slider.cloneOffset)*pos:(slider.currentSlide+slider.cloneOffset)*pos;case"setTouch":return(reverse)?pos:pos;case"jumpEnd":return(reverse)?pos:slider.count*pos;case"jumpStart":return(reverse)?slider.count*pos:pos;default:return pos;}}}());return(posCalc*-1)+"px";}());if(slider.transitions){target=(vertical)?"translate3d(0,"+target+",0)":"translate3d("+target+",0,0)";dur=(dur!==undefined)?(dur/1000)+"s":"0s";slider.container.css("-"+slider.pfx+"-transition-duration",dur);}slider.args[slider.prop]=target;if(slider.transitions||dur===undefined){slider.container.css(slider.args);}};slider.setup=function(type){if(!fade){var sliderOffset,arr;if(type==="init"){slider.viewport=$('<div class="'+namespace+'viewport"></div>').css({"overflow":"hidden","position":"relative"}).appendTo(slider).append(slider.container);slider.cloneCount=0;slider.cloneOffset=0;if(reverse){arr=$.makeArray(slider.slides).reverse();slider.slides=$(arr);slider.container.empty().append(slider.slides);}}if(slider.vars.animationLoop&&!carousel){slider.cloneCount=2;slider.cloneOffset=1;if(type!=="init"){slider.container.find(".clone").remove();}slider.container.append(slider.slides.first().clone().addClass("clone").attr("aria-hidden","true")).prepend(slider.slides.last().clone().addClass("clone").attr("aria-hidden","true"));}slider.newSlides=$(slider.vars.selector,slider);sliderOffset=(reverse)?slider.count-1-slider.currentSlide+slider.cloneOffset:slider.currentSlide+slider.cloneOffset;if(vertical&&!carousel){slider.container.height((slider.count+slider.cloneCount)*200+"%").css("position","absolute").width("100%");setTimeout(function(){slider.newSlides.css({"display":"block"});slider.doMath();slider.viewport.height(slider.h);slider.setProps(sliderOffset*slider.h,"init");},(type==="init")?100:0);}else{slider.container.width((slider.count+slider.cloneCount)*200+"%");slider.setProps(sliderOffset*slider.computedW,"init");setTimeout(function(){slider.doMath();slider.newSlides.css({"width":slider.computedW,"float":"left","display":"block"});if(slider.vars.smoothHeight){methods.smoothHeight();}},(type==="init")?100:0);}}else{slider.slides.css({"width":"100%","float":"left","marginRight":"-100%","position":"relative"});if(type==="init"){if(!touch){slider.slides.css({"opacity":0,"display":"block","zIndex":1}).eq(slider.currentSlide).css({"zIndex":2}).animate({"opacity":1},slider.vars.animationSpeed,slider.vars.easing);}else{slider.slides.css({"opacity":0,"display":"block","webkitTransition":"opacity "+slider.vars.animationSpeed/1000+"s ease","zIndex":1}).eq(slider.currentSlide).css({"opacity":1,"zIndex":2});}}if(slider.vars.smoothHeight){methods.smoothHeight();}}if(!carousel){slider.slides.removeClass(namespace+"active-slide").eq(slider.currentSlide).addClass(namespace+"active-slide");}};slider.doMath=function(){var slide=slider.slides.first(),slideMargin=slider.vars.itemMargin,minItems=slider.vars.minItems,maxItems=slider.vars.maxItems;slider.w=(slider.viewport===undefined)?slider.width():slider.viewport.width();slider.h=slide.height();slider.boxPadding=slide.outerWidth()-slide.width();if(carousel){slider.itemT=slider.vars.itemWidth+slideMargin;slider.minW=(minItems)?minItems*slider.itemT:slider.w;slider.maxW=(maxItems)?(maxItems*slider.itemT)-slideMargin:slider.w;slider.itemW=(slider.minW>slider.w)?(slider.w-(slideMargin*(minItems-1)))/minItems:(slider.maxW<slider.w)?(slider.w-(slideMargin*(maxItems-1)))/maxItems:(slider.vars.itemWidth>slider.w)?slider.w:slider.vars.itemWidth;slider.visible=Math.floor(slider.w/(slider.itemW));slider.move=(slider.vars.move>0&&slider.vars.move<slider.visible)?slider.vars.move:slider.visible;slider.pagingCount=Math.ceil(((slider.count-slider.visible)/slider.move)+1);slider.last=slider.pagingCount-1;slider.limit=(slider.pagingCount===1)?0:(slider.vars.itemWidth>slider.w)?(slider.itemW*(slider.count-1))+(slideMargin*(slider.count-1)):((slider.itemW+slideMargin)*slider.count)-slider.w-slideMargin;}else{slider.itemW=slider.w;slider.pagingCount=slider.count;slider.last=slider.count-1;}slider.computedW=slider.itemW-slider.boxPadding;};slider.update=function(pos,action){slider.doMath();if(!carousel){if(pos<slider.currentSlide){slider.currentSlide+=1;}else{if(pos<=slider.currentSlide&&pos!==0){slider.currentSlide-=1;}}slider.animatingTo=slider.currentSlide;}if(slider.vars.controlNav&&!slider.manualControls){if((action==="add"&&!carousel)||slider.pagingCount>slider.controlNav.length){methods.controlNav.update("add");}else{if((action==="remove"&&!carousel)||slider.pagingCount<slider.controlNav.length){if(carousel&&slider.currentSlide>slider.last){slider.currentSlide-=1;slider.animatingTo-=1;}methods.controlNav.update("remove",slider.last);}}}if(slider.vars.directionNav){methods.directionNav.update();}};slider.addSlide=function(obj,pos){var $obj=$(obj);slider.count+=1;slider.last=slider.count-1;if(vertical&&reverse){(pos!==undefined)?slider.slides.eq(slider.count-pos).after($obj):slider.container.prepend($obj);}else{(pos!==undefined)?slider.slides.eq(pos).before($obj):slider.container.append($obj);}slider.update(pos,"add");slider.slides=$(slider.vars.selector+":not(.clone)",slider);slider.setup();slider.vars.added(slider);};slider.removeSlide=function(obj){var pos=(isNaN(obj))?slider.slides.index($(obj)):obj;slider.count-=1;slider.last=slider.count-1;if(isNaN(obj)){$(obj,slider.slides).remove();}else{(vertical&&reverse)?slider.slides.eq(slider.last).remove():slider.slides.eq(obj).remove();}slider.doMath();slider.update(pos,"remove");slider.slides=$(slider.vars.selector+":not(.clone)",slider);slider.setup();slider.vars.removed(slider);};methods.init();};$(window).blur(function(e){focused=false;}).focus(function(e){focused=true;});$.flexslider.defaults={namespace:"flex-",selector:".slides > li",animation:"fade",easing:"swing",direction:"horizontal",reverse:false,animationLoop:true,smoothHeight:false,startAt:0,slideshow:true,slideshowSpeed:7000,animationSpeed:600,initDelay:0,randomize:false,thumbCaptions:false,pauseOnAction:true,pauseOnHover:false,pauseInvisible:true,useCSS:true,touch:true,video:false,controlNav:true,directionNav:true,prevText:"Previous",nextText:"Next",keyboard:true,multipleKeyboard:false,mousewheel:false,pausePlay:false,pauseText:"Pause",playText:"Play",controlsContainer:"",manualControls:"",sync:"",asNavFor:"",itemWidth:0,itemMargin:0,minItems:1,maxItems:0,move:0,allowOneSlide:true,start:function(){},before:function(){},after:function(){},end:function(){},added:function(){},removed:function(){}};$.fn.flexslider=function(options){if(options===undefined){options={};}if(typeof options==="object"){return this.each(function(){var $this=$(this),selector=(options.selector)?options.selector:".slides > li",$slides=$this.find(selector);if(($slides.length===1&&options.allowOneSlide===true)||$slides.length===0){$slides.fadeIn(400);if(options.start){options.start($this);}}else{if($this.data("flexslider")===undefined){new $.flexslider(this,options);}}});}else{var $slider=$(this).data("flexslider");switch(options){case"play":$slider.play();break;case"pause":$slider.pause();break;case"stop":$slider.stop();break;case"next":$slider.flexAnimate($slider.getTarget("next"),true);break;case"prev":case"previous":$slider.flexAnimate($slider.getTarget("prev"),true);break;default:if(typeof options==="number"){$slider.flexAnimate(options,true);}}}};})(jQuery);
/*  end jquery.flexslider.js*/

/* jquery.elastislide.js*/
(function(window,$,undefined){$.fn.touchwipe=function(settings){var config={min_move_x:20,min_move_y:20,wipeLeft:function(){},wipeRight:function(){},wipeUp:function(){},wipeDown:function(){},preventDefaultEvents:true};if(settings){$.extend(config,settings);}this.each(function(){var startX;var startY;var isMoving=false;function cancelTouch(){this.removeEventListener("touchmove",onTouchMove);startX=null;isMoving=false;}function onTouchMove(e){if(isMoving){var x=e.touches[0].pageX;var dx=startX-x;if(Math.abs(dx)>=config.min_move_x){cancelTouch();if(dx>0){config.wipeLeft();}else{config.wipeRight();}}}}function onTouchStart(e){if(e.touches.length==1){startX=e.touches[0].pageX;isMoving=true;this.addEventListener("touchmove",onTouchMove,false);}}if("ontouchstart" in document.documentElement){this.addEventListener("touchstart",onTouchStart,false);}});return this;};$.elastislide=function(options,element){this.$el=$(element);this._init(options);};$.elastislide.defaults={speed:1000,easing:"",imageW:"auto",margin:0,border:0,minItems:1,current:0,Complete:function(){jQuery(".product .product-image-wrapper.onhover").bind("mouseenter",function(){var pos=jQuery(this).parent().position();var width=jQuery(this).outerWidth();jQuery(this).parent().addClass("hover");var width1=jQuery(this).parent().next(".preview").outerWidth();var width2=width1-width;jQuery(this).parent().next(".preview").css({top:pos.top+10+"px",left:(pos.left-width2+30)+"px"});jQuery(this).parent().next(".preview.small").css({top:pos.top+10+"px",left:(pos.left-width2+30)+"px"});jQuery(".preview").hide();jQuery(this).parent().next(".preview").show();});},slide:function(){jQuery(".product .product-image-wrapper").unbind("mouseenter");jQuery(".preview").hide();}};$.elastislide.prototype={_init:function(options){this.options=$.extend(true,{},$.elastislide.defaults,options);this.$slider=this.$el.find("div.carousel_items");this.$items=this.$slider.children("div.carousel_item");this.itemsCount=this.$items.length;this.$esCarousel=this.$slider.parent();this._validateOptions();this._configure();this._addControls();this._initEvents();this.$slider.show();this._slideToCurrent(false);},_validateOptions:function(){if(this.options.speed<0){this.options.speed=450;}if(this.options.margin<0){this.options.margin=4;}if(this.options.border<0){this.options.border=1;}if(this.options.minItems<1||this.options.minItems>this.itemsCount){this.options.minItems=1;}if(this.options.current>this.itemsCount-1){this.options.current=0;}},_configure:function(){this.current=this.options.current;this.visibleWidth=this.$esCarousel.width();if(this.visibleWidth<this.options.minItems*(this.options.imageW+2*this.options.border)+(this.options.minItems-1)*this.options.margin){this._setDim((this.visibleWidth-(this.options.minItems-1)*this.options.margin)/this.options.minItems);this._setCurrentValues();this.fitCount=this.options.minItems;}else{this._setDim();this._setCurrentValues();}this.$slider.css({width:this.sliderW});},_setDim:function(elW){this.$items.css({width:(elW)?elW:this.options.imageW+2*this.options.border}).children("a").css({borderWidth:this.options.border});},_setCurrentValues:function(){this.itemW=this.$items.outerWidth(true);this.sliderW=this.itemW*this.itemsCount;this.visibleWidth=this.$esCarousel.width();this.fitCount=Math.floor(this.visibleWidth/this.itemW);},_addControls:function(){this.$navNext=$('<span class="es-nav-next"><a class="btn"><i class="icon-right-thin icon-large"></i></a></span>');this.$navPrev=$('<span class="es-nav-prev"><a class="btn"><i class="icon-left-thin icon-large"></i></a></span>');$('<div class="es-nav"/>').append(this.$navPrev).append(this.$navNext).appendTo(this.$el);},_toggleControls:function(dir,status){if(dir&&status){if(status===1){(dir==="right")?(this.$navNext.css({"cursor":"pointer","opacity":"1"}),this.$navNext.removeClass("disable")):(this.$navPrev.css({"cursor":"pointer","opacity":"1"}),this.$navPrev.removeClass("disable"));}else{(dir==="right")?(this.$navNext.css({"cursor":"auto","opacity":"1"}),this.$navNext.addClass("disable")):(this.$navPrev.css({"cursor":"auto","opacity":"1"}),this.$navPrev.addClass("disable"));}}else{if(this.current===this.itemsCount-1||this.fitCount>=this.itemsCount){this.$navNext.css({"cursor":"auto"});}}},_initEvents:function(){var instance=this;$(window).bind("resize.elastislide",function(event){instance._setCurrentValues();if(instance.visibleWidth<instance.options.minItems*(instance.options.imageW+2*instance.options.border)+(instance.options.minItems-1)*instance.options.margin){instance._setDim((instance.visibleWidth-(instance.options.minItems-1)*instance.options.margin)/instance.options.minItems);instance._setCurrentValues();instance.fitCount=instance.options.minItems;}else{instance._setDim();instance._setCurrentValues();}instance.$slider.css({width:instance.sliderW+10});clearTimeout(instance.resetTimeout);instance.resetTimeout=setTimeout(function(){instance._slideToCurrent();},200);});this.$navNext.bind("click.elastislide",function(event){instance._slide("right");});this.$navPrev.bind("click.elastislide",function(event){instance._slide("left");});instance.$slider.touchwipe({wipeLeft:function(){instance._slide("right");},wipeRight:function(){instance._slide("left");}});},_slide:function(dir,val,anim,callback){if(this.$slider.is(":animated")){return false;}var instance=this;var ml=parseFloat(this.$slider.css("margin-left"));if(val===undefined){var amount=this.fitCount*this.itemW,val;if(amount<0){return false;}if(dir==="right"&&this.sliderW-(Math.abs(ml)+amount)<this.visibleWidth){amount=this.sliderW-(Math.abs(ml)+this.visibleWidth)-this.options.margin;this._toggleControls("right",-1);this._toggleControls("left",1);instance.options.slide();}else{if(dir==="left"&&Math.abs(ml)-amount<0){amount=Math.abs(ml);this._toggleControls("left",-1);this._toggleControls("right",1);instance.options.slide();}else{var fml;(dir==="right")?fml=Math.abs(ml)+this.options.margin+Math.abs(amount):fml=Math.abs(ml)-this.options.margin-Math.abs(amount);if(fml>0){this._toggleControls("left",1);}else{this._toggleControls("left",-1);}if(fml<this.sliderW-this.visibleWidth){this._toggleControls("right",1);}else{this._toggleControls("right",-1);}instance.options.slide();}}(dir==="right")?val="-="+amount:val="+="+amount;}else{var fml=Math.abs(val);if(Math.max(this.sliderW,this.visibleWidth)-fml<this.visibleWidth){val=-(Math.max(this.sliderW,this.visibleWidth)-this.visibleWidth);if(val!==0){val+=this.options.margin;}this._toggleControls("right",-1);fml=Math.abs(val);}if(fml>0){this._toggleControls("left",1);}else{this._toggleControls("left",-1);}if(Math.max(this.sliderW,this.visibleWidth)-this.visibleWidth>fml+this.options.margin){this._toggleControls("right",1);}else{this._toggleControls("right",-1);}}$.fn.applyStyle=(anim===undefined)?$.fn.animate:$.fn.css;var sliderCSS={marginLeft:val};this.$slider.applyStyle(sliderCSS,$.extend(true,[],{duration:this.options.speed,easing:this.options.easing,complete:function(){if(callback){callback.call();}instance.options.Complete();}}));},_slideToCurrent:function(anim){var amount=this.current*this.itemW;this._slide("",-amount,anim);},add:function($newelems,callback){this.$items=this.$items.add($newelems);this.itemsCount=this.$items.length;this._setDim();this._setCurrentValues();this.$slider.css({width:this.sliderW});this._slideToCurrent();if(callback){callback.call($newelems);}},destroy:function(callback){this._destroy(callback);},_destroy:function(callback){this.$el.unbind(".elastislide").removeData("elastislide");$(window).unbind(".elastislide");if(callback){callback.call();}}};var logError=function(message){if(this.console){console.error(message);}};$.fn.elastislide=function(options){if(typeof options==="string"){var args=Array.prototype.slice.call(arguments,1);this.each(function(){var instance=$.data(this,"elastislide");if(!instance){logError("cannot call methods on elastislide prior to initialization; "+"attempted to call method '"+options+"'");return;}if(!$.isFunction(instance[options])||options.charAt(0)==="_"){logError("no such method '"+options+"' for elastislide instance");return;}instance[options].apply(instance,args);});}else{this.each(function(){var instance=$.data(this,"elastislide");if(!instance){$.data(this,"elastislide",new $.elastislide(options,this));}});}return this;};})(window,jQuery);
/*  end jquery.elastislide.js*/

/* jquery.selectbox-0.2.js*/
(function($,undefined){var PROP_NAME="selectbox",FALSE=false,TRUE=true;function Selectbox(){this._state=[];this._defaults={classHolder:"sbHolder",classHolderDisabled:"sbHolderDisabled",classSelector:"sbSelector",classOptions:"sbOptions",classGroup:"sbGroup",classSub:"sbSub",classDisabled:"sbDisabled",classToggleOpen:"sbToggleOpen",classToggle:"sbToggle",classFocus:"sbFocus",speed:200,effect:"slide",onChange:null,onOpen:null,onClose:null};}$.extend(Selectbox.prototype,{_isOpenSelectbox:function(target){if(!target){return FALSE;}var inst=this._getInst(target);return inst.isOpen;},_isDisabledSelectbox:function(target){if(!target){return FALSE;}var inst=this._getInst(target);return inst.isDisabled;},_attachSelectbox:function(target,settings){if(this._getInst(target)){return FALSE;}var $target=$(target),self=this,inst=self._newInst($target),sbHolder,sbSelector,sbToggle,sbOptions,s=FALSE,optGroup=$target.find("optgroup"),opts=$target.find("option"),olen=opts.length;$target.attr("sb",inst.uid);$.extend(inst.settings,self._defaults,settings);self._state[inst.uid]=FALSE;$target.hide();function closeOthers(){var key,sel,uid=this.attr("id").split("_")[1];for(key in self._state){if(key!==uid){if(self._state.hasOwnProperty(key)){sel=$("select[sb='"+key+"']")[0];if(sel){self._closeSelectbox(sel);}}}}}sbHolder=$("<div>",{"id":"sbHolder_"+inst.uid,"class":inst.settings.classHolder,"tabindex":$target.attr("tabindex")});sbSelector=$("<a>",{"id":"sbSelector_"+inst.uid,"href":"#","class":inst.settings.classSelector,"click":function(e){e.preventDefault();closeOthers.apply($(this),[]);var uid=$(this).attr("id").split("_")[1];if(self._state[uid]){self._closeSelectbox(target);}else{self._openSelectbox(target);}}});sbToggle=$("<a>",{"id":"sbToggle_"+inst.uid,"href":"#","class":inst.settings.classToggle,"click":function(e){e.preventDefault();closeOthers.apply($(this),[]);var uid=$(this).attr("id").split("_")[1];if(self._state[uid]){self._closeSelectbox(target);}else{self._openSelectbox(target);}}});sbToggle.appendTo(sbHolder);sbOptions=$("<ul>",{"id":"sbOptions_"+inst.uid,"class":inst.settings.classOptions,"css":{"display":"none"}});$target.children().each(function(i){var that=$(this),li,config={};if(that.is("option")){getOptions(that);}else{if(that.is("optgroup")){li=$("<li>");$("<span>",{"text":that.attr("label")}).addClass(inst.settings.classGroup).appendTo(li);li.appendTo(sbOptions);if(that.is(":disabled")){config.disabled=true;}config.sub=true;getOptions(that.find("option"),config);}}});function getOptions(){var sub=arguments[1]&&arguments[1].sub?true:false,disabled=arguments[1]&&arguments[1].disabled?true:false;arguments[0].each(function(i){var that=$(this),li=$("<li>"),child;if(that.is(":selected")){sbSelector.text(that.text());s=TRUE;}if(i===olen-1){li.addClass("last");}if(!that.is(":disabled")&&!disabled){child=$("<a>",{"href":"#"+that.val(),"rel":that.val()}).text(that.text()).bind("click.sb",function(e){if(e&&e.preventDefault){e.preventDefault();}var t=sbToggle,$this=$(this),uid=t.attr("id").split("_")[1];self._changeSelectbox(target,$this.attr("rel"),$this.text());self._closeSelectbox(target);}).bind("mouseover.sb",function(){var $this=$(this);$this.parent().siblings().find("a").removeClass(inst.settings.classFocus);$this.addClass(inst.settings.classFocus);}).bind("mouseout.sb",function(){$(this).removeClass(inst.settings.classFocus);});if(sub){child.addClass(inst.settings.classSub);}if(that.is(":selected")){child.addClass(inst.settings.classFocus);}child.appendTo(li);}else{child=$("<span>",{"text":that.text()}).addClass(inst.settings.classDisabled);if(sub){child.addClass(inst.settings.classSub);}child.appendTo(li);}li.appendTo(sbOptions);});}if(!s){sbSelector.text(opts.first().text());}$.data(target,PROP_NAME,inst);sbHolder.data("uid",inst.uid).bind("keydown.sb",function(e){var key=e.charCode?e.charCode:e.keyCode?e.keyCode:0,$this=$(this),uid=$this.data("uid"),inst=$this.siblings("select[sb='"+uid+"']").data(PROP_NAME),trgt=$this.siblings(["select[sb='",uid,"']"].join("")).get(0),$f=$this.find("ul").find("a."+inst.settings.classFocus);switch(key){case 37:case 38:if($f.length>0){var $next;$("a",$this).removeClass(inst.settings.classFocus);$next=$f.parent().prevAll("li:has(a)").eq(0).find("a");if($next.length>0){$next.addClass(inst.settings.classFocus).focus();$("#sbSelector_"+uid).text($next.text());}}break;case 39:case 40:var $next;$("a",$this).removeClass(inst.settings.classFocus);if($f.length>0){$next=$f.parent().nextAll("li:has(a)").eq(0).find("a");}else{$next=$this.find("ul").find("a").eq(0);}if($next.length>0){$next.addClass(inst.settings.classFocus).focus();$("#sbSelector_"+uid).text($next.text());}break;case 13:if($f.length>0){self._changeSelectbox(trgt,$f.attr("rel"),$f.text());}self._closeSelectbox(trgt);break;case 9:if(trgt){var inst=self._getInst(trgt);if(inst){if($f.length>0){self._changeSelectbox(trgt,$f.attr("rel"),$f.text());}self._closeSelectbox(trgt);}}var i=parseInt($this.attr("tabindex"),10);if(!e.shiftKey){i++;}else{i--;}$("*[tabindex='"+i+"']").focus();break;case 27:self._closeSelectbox(trgt);break;}e.stopPropagation();return false;}).delegate("a","mouseover",function(e){$(this).addClass(inst.settings.classFocus);}).delegate("a","mouseout",function(e){$(this).removeClass(inst.settings.classFocus);});sbSelector.appendTo(sbHolder);sbOptions.appendTo(sbHolder);sbHolder.insertAfter($target);$("html").on("mousedown",function(e){e.stopPropagation();$("select").selectbox("close");});$([".",inst.settings.classHolder,", .",inst.settings.classSelector].join("")).mousedown(function(e){e.stopPropagation();});},_detachSelectbox:function(target){var inst=this._getInst(target);if(!inst){return FALSE;}$("#sbHolder_"+inst.uid).remove();$.data(target,PROP_NAME,null);$(target).show();},_changeSelectbox:function(target,value,text){var onChange,inst=this._getInst(target);if(inst){onChange=this._get(inst,"onChange");$("#sbSelector_"+inst.uid).text(text);}value=value.replace(/\'/g,"\\'");$(target).find("option[value='"+value+"']").attr("selected",TRUE);if(inst&&onChange){onChange.apply((inst.input?inst.input[0]:null),[value,inst]);}else{if(inst&&inst.input){inst.input.trigger("change");}}},_enableSelectbox:function(target){var inst=this._getInst(target);if(!inst||!inst.isDisabled){return FALSE;}$("#sbHolder_"+inst.uid).removeClass(inst.settings.classHolderDisabled);inst.isDisabled=FALSE;$.data(target,PROP_NAME,inst);},_disableSelectbox:function(target){var inst=this._getInst(target);if(!inst||inst.isDisabled){return FALSE;}$("#sbHolder_"+inst.uid).addClass(inst.settings.classHolderDisabled);inst.isDisabled=TRUE;$.data(target,PROP_NAME,inst);},_optionSelectbox:function(target,name,value){var inst=this._getInst(target);if(!inst){return FALSE;}inst[name]=value;$.data(target,PROP_NAME,inst);},_openSelectbox:function(target){var inst=this._getInst(target);if(!inst||inst.isOpen||inst.isDisabled){return;}var el=$("#sbOptions_"+inst.uid),viewportHeight=parseInt($(window).height(),10),offset=$("#sbHolder_"+inst.uid).offset(),scrollTop=$(window).scrollTop(),height=el.prev().height(),diff=viewportHeight-(offset.top-scrollTop)-height/2,onOpen=this._get(inst,"onOpen");el.css({"top":height+"px","maxHeight":(diff-height)+"px"});inst.settings.effect==="fade"?el.fadeIn(inst.settings.speed):el.slideDown(inst.settings.speed);$("#sbToggle_"+inst.uid).addClass(inst.settings.classToggleOpen);this._state[inst.uid]=TRUE;inst.isOpen=TRUE;if(onOpen){onOpen.apply((inst.input?inst.input[0]:null),[inst]);}$.data(target,PROP_NAME,inst);},_closeSelectbox:function(target){var inst=this._getInst(target);if(!inst||!inst.isOpen){return;}var onClose=this._get(inst,"onClose");inst.settings.effect==="fade"?$("#sbOptions_"+inst.uid).fadeOut(inst.settings.speed):$("#sbOptions_"+inst.uid).slideUp(inst.settings.speed);$("#sbToggle_"+inst.uid).removeClass(inst.settings.classToggleOpen);this._state[inst.uid]=FALSE;inst.isOpen=FALSE;if(onClose){onClose.apply((inst.input?inst.input[0]:null),[inst]);}$.data(target,PROP_NAME,inst);},_newInst:function(target){var id=target[0].id.replace(/([^A-Za-z0-9_-])/g,"\\\\$1");return{id:id,input:target,uid:Math.floor(Math.random()*99999999),isOpen:FALSE,isDisabled:FALSE,settings:{}};},_getInst:function(target){try{return $.data(target,PROP_NAME);}catch(err){throw"Missing instance data for this selectbox";}},_get:function(inst,name){return inst.settings[name]!==undefined?inst.settings[name]:this._defaults[name];}});$.fn.selectbox=function(options){var otherArgs=Array.prototype.slice.call(arguments,1);if(typeof options=="string"&&options=="isDisabled"){return $.selectbox["_"+options+"Selectbox"].apply($.selectbox,[this[0]].concat(otherArgs));}if(options=="option"&&arguments.length==2&&typeof arguments[1]=="string"){return $.selectbox["_"+options+"Selectbox"].apply($.selectbox,[this[0]].concat(otherArgs));}return this.each(function(){typeof options=="string"?$.selectbox["_"+options+"Selectbox"].apply($.selectbox,[this].concat(otherArgs)):$.selectbox._attachSelectbox(this,options);});};$.selectbox=new Selectbox();$.selectbox.version="0.2";})(jQuery);
/*  end jquery.selectbox-0.2.js*/

/* jquery.nouislider.js*/
(function($){$.fn.noUiSlider=function(method,options){function neg(a){return a<0;}function abs(a){return Math.abs(a);}function roundTo(a,b){return Math.round(a/b)*b;}function dup(a){return jQuery.extend(true,{},a);}var defaults,methods,helpers,options=options||[],functions,touch=("ontouchstart" in document.documentElement);defaults={"handles":2,"connect":true,"scale":[0,320],"start":[0,200],"to":0,"handle":0,"change":"","end":"","step":false,"save":false,"click":true};helpers={scale:function(a,b,c){var d=b[0],e=b[1];if(neg(d)){a=a+abs(d);e=e+abs(d);}else{a=a-d;e=e-d;}return(a*c)/e;},deScale:function(a,b,c){var d=b[0],e=b[1];e=neg(d)?e+abs(d):e-d;return((a*e)/c)+d;},connect:function(api){if(api.connect){if(api.handles.length>1){api.connect.css({"left":api.low.left(),"right":(api.slider.innerWidth()-api.up.left())});}else{api.low?api.connect.css({"left":api.low.left(),"right":0}):api.connect.css({"left":0,"right":(api.slider.innerWidth()-api.up.left())});}}},left:function(){return parseFloat($(this).css("left"));},call:function(f,t,n){if(typeof(f)=="function"){f.call(t,n);}},bounce:function(api,n,c,handle){var go=false;if(handle.is(api.up)){if(api.low&&n<api.low.left()){n=api.low.left();go=true;}}else{if(api.up&&n>api.up.left()){n=api.up.left();go=true;}}if(n>api.slider.innerWidth()){n=api.slider.innerWidth();go=true;}else{if(n<0){n=0;go=true;}}return[n,go];}};methods={init:function(){return this.each(function(){var s,slider,api;slider=$(this).css("position","relative");api=new Object();api.options=$.extend(defaults,options);s=api.options;typeof s.start=="object"?1:s.start=[s.start];api.slider=slider;api.low=$('<div class="noUi-handle noUi-lowerHandle"><div></div></div>');api.up=$('<div class="noUi-handle noUi-upperHandle"><div></div></div>');api.connect=$('<div class="noUi-midBar"></div>');s.connect?api.connect.appendTo(api.slider):api.connect=false;if(s.knobs){s.handles=s.knobs;}if(s.handles===1){if(s.connect===true||s.connect==="lower"){api.low=false;api.up=api.up.appendTo(api.slider);api.handles=[api.up];}else{if(s.connect==="upper"||!s.connect){api.low=api.low.prependTo(api.slider);api.up=false;api.handles=[api.low];}}}else{api.low=api.low.prependTo(api.slider);api.up=api.up.appendTo(api.slider);api.handles=[api.low,api.up];}if(api.low){api.low.left=helpers.left;}if(api.up){api.up.left=helpers.left;}api.slider.children().css("position","absolute");$.each(api.handles,function(index){$(this).css({"left":helpers.scale(s.start[index],api.options.scale,api.slider.innerWidth()),"zIndex":index+1}).children().bind(touch?"touchstart.noUi":"mousedown.noUi",functions.start);});if(s.click){api.slider.click(functions.click).find("*:not(.noUi-midBar)").click(functions.flse);}helpers.connect(api);api.options=s;api.slider.data("api",api);});},move:function(){var api,bounce,to,handle,scale;api=dup($(this).data("api"));api.options=$.extend(api.options,options);if(api.options.knob){api.options.handle=api.options.knob;}handle=api.options.handle;handle=api.handles[handle=="lower"||handle==0||typeof handle=="undefined"?0:1];bounce=helpers.bounce(api,helpers.scale(api.options.to,api.options.scale,api.slider.innerWidth()),handle.left(),handle);handle.css("left",bounce[0]);if((handle.is(api.up)&&handle.left()==0)||(handle.is(api.low)&&handle.left()==api.slider.innerWidth())){handle.css("zIndex",parseInt(handle.css("zIndex"))+2);}if(options.save===true){api.options.scale=options.scale;$(this).data("api",api);}helpers.connect(api);helpers.call(api.options.change,api.slider,"move");helpers.call(api.options.end,api.slider,"move");},value:function(){var val1,val2,api;api=dup($(this).data("api"));api.options=$.extend(api.options,options);val1=api.low?Math.round(helpers.deScale(api.low.left(),api.options.scale,api.slider.innerWidth())):false;val2=api.up?Math.round(helpers.deScale(api.up.left(),api.options.scale,api.slider.innerWidth())):false;if(options.save){api.options.scale=options.scale;$(this).data("api",api);}return[val1,val2];},api:function(){return $(this).data("api");},disable:function(){return this.each(function(){$(this).addClass("disabled");});},enable:function(){return this.each(function(){$(this).removeClass("disabled");});}},functions={start:function(e){if(!$(this).parent().parent().hasClass("disabled")){e.preventDefault();$("body").bind("selectstart.noUi",functions.flse);$(this).addClass("noUi-activeHandle");$(document).bind(touch?"touchmove.noUi":"mousemove.noUi",functions.move);touch?$(this).bind("touchend.noUi",functions.end):$(document).bind("mouseup.noUi",functions.end);}},move:function(e){var a,b,h,api,go=false,handle,bounce;h=$(".noUi-activeHandle");api=h.parent().parent().data("api");handle=h.parent().is(api.low)?api.low:api.up;a=e.pageX-Math.round(api.slider.offset().left);if(isNaN(a)){a=e.originalEvent.touches[0].pageX-Math.round(api.slider.offset().left);}b=handle.left();bounce=helpers.bounce(api,a,b,handle);a=bounce[0];go=bounce[1];if(api.options.step&&!go){var v1=api.options.scale[0],v2=api.options.scale[1];if(neg(v2)){v2=abs(v1-v2);v1=0;}v2=(v2+(-1*v1));var con=helpers.scale(api.options.step,[0,v2],api.slider.innerWidth());if(Math.abs(b-a)>=con){a=a<b?b-con:b+con;go=true;}}else{go=true;}if(a===b){go=false;}if(go){handle.css("left",a);if((handle.is(api.up)&&handle.left()==0)||(handle.is(api.low)&&handle.left()==api.slider.innerWidth())){handle.css("zIndex",parseInt(handle.css("zIndex"))+2);}helpers.connect(api);helpers.call(api.options.change,api.slider,"slide");}},end:function(){var handle,api;handle=$(".noUi-activeHandle");api=handle.parent().parent().data("api");$(document).add("body").add(handle.removeClass("noUi-activeHandle").parent()).unbind(".noUi");helpers.call(api.options.end,api.slider,"slide");},click:function(e){if(!$(this).hasClass("disabled")){var api=$(this).data("api");var s=api.options;var c=e.pageX-api.slider.offset().left;c=s.step?roundTo(c,helpers.scale(s.step,s.scale,api.slider.innerWidth())):c;if(api.low&&api.up){c<((api.low.left()+api.up.left())/2)?api.low.css("left",c):api.up.css("left",c);}else{api.handles[0].css("left",c);}helpers.connect(api);helpers.call(s.change,api.slider,"click");helpers.call(s.end,api.slider,"click");}},flse:function(){return false;}};if(methods[method]){return methods[method].apply(this,Array.prototype.slice.call(arguments,1));}else{if(typeof method==="object"||!method){return methods.init.apply(this,arguments);}else{$.error("No such method: "+method);}}};})(jQuery);
/*  end jquery.nouislider.js*/

/* jquery.isotope.min.js*/
(function(a,b,c){"use strict";var d=a.document,e=a.Modernizr,f=function(a){return a.charAt(0).toUpperCase()+a.slice(1)},g="Moz Webkit O Ms".split(" "),h=function(a){var b=d.documentElement.style,c;if(typeof b[a]=="string")return a;a=f(a);for(var e=0,h=g.length;e<h;e++){c=g[e]+a;if(typeof b[c]=="string")return c}},i=h("transform"),j=h("transitionProperty"),k={csstransforms:function(){return!!i},csstransforms3d:function(){var a=!!h("perspective");if(a){var c=" -o- -moz- -ms- -webkit- -khtml- ".split(" "),d="@media ("+c.join("transform-3d),(")+"modernizr)",e=b("<style>"+d+"{#modernizr{height:3px}}"+"</style>").appendTo("head"),f=b('<div id="modernizr" />').appendTo("html");a=f.height()===3,f.remove(),e.remove()}return a},csstransitions:function(){return!!j}},l;if(e)for(l in k)e.hasOwnProperty(l)||e.addTest(l,k[l]);else{e=a.Modernizr={_version:"1.6ish: miniModernizr for Isotope"};var m=" ",n;for(l in k)n=k[l](),e[l]=n,m+=" "+(n?"":"no-")+l;b("html").addClass(m)}if(e.csstransforms){var o=e.csstransforms3d?{translate:function(a){return"translate3d("+a[0]+"px, "+a[1]+"px, 0) "},scale:function(a){return"scale3d("+a+", "+a+", 1) "}}:{translate:function(a){return"translate("+a[0]+"px, "+a[1]+"px) "},scale:function(a){return"scale("+a+") "}},p=function(a,c,d){var e=b.data(a,"isoTransform")||{},f={},g,h={},j;f[c]=d,b.extend(e,f);for(g in e)j=e[g],h[g]=o[g](j);var k=h.translate||"",l=h.scale||"",m=k+l;b.data(a,"isoTransform",e),a.style[i]=m};b.cssNumber.scale=!0,b.cssHooks.scale={set:function(a,b){p(a,"scale",b)},get:function(a,c){var d=b.data(a,"isoTransform");return d&&d.scale?d.scale:1}},b.fx.step.scale=function(a){b.cssHooks.scale.set(a.elem,a.now+a.unit)},b.cssNumber.translate=!0,b.cssHooks.translate={set:function(a,b){p(a,"translate",b)},get:function(a,c){var d=b.data(a,"isoTransform");return d&&d.translate?d.translate:[0,0]}}}var q,r;e.csstransitions&&(q={WebkitTransitionProperty:"webkitTransitionEnd",MozTransitionProperty:"transitionend",OTransitionProperty:"oTransitionEnd otransitionend",transitionProperty:"transitionend"}[j],r=h("transitionDuration"));var s=b.event,t=b.event.handle?"handle":"dispatch",u;s.special.smartresize={setup:function(){b(this).bind("resize",s.special.smartresize.handler)},teardown:function(){b(this).unbind("resize",s.special.smartresize.handler)},handler:function(a,b){var c=this,d=arguments;a.type="smartresize",u&&clearTimeout(u),u=setTimeout(function(){s[t].apply(c,d)},b==="execAsap"?0:100)}},b.fn.smartresize=function(a){return a?this.bind("smartresize",a):this.trigger("smartresize",["execAsap"])},b.Isotope=function(a,c,d){this.element=b(c),this._create(a),this._init(d)};var v=["width","height"],w=b(a);b.Isotope.settings={resizable:!0,layoutMode:"masonry",containerClass:"isotope",itemClass:"isotope-item",hiddenClass:"isotope-hidden",hiddenStyle:{opacity:0,scale:.001},visibleStyle:{opacity:1,scale:1},containerStyle:{position:"relative",overflow:"hidden"},animationEngine:"best-available",animationOptions:{queue:!1,duration:800},sortBy:"original-order",sortAscending:!0,resizesContainer:!0,transformsEnabled:!0,itemPositionDataEnabled:!1},b.Isotope.prototype={_create:function(a){this.options=b.extend({},b.Isotope.settings,a),this.styleQueue=[],this.elemCount=0;var c=this.element[0].style;this.originalStyle={};var d=v.slice(0);for(var e in this.options.containerStyle)d.push(e);for(var f=0,g=d.length;f<g;f++)e=d[f],this.originalStyle[e]=c[e]||"";this.element.css(this.options.containerStyle),this._updateAnimationEngine(),this._updateUsingTransforms();var h={"original-order":function(a,b){return b.elemCount++,b.elemCount},random:function(){return Math.random()}};this.options.getSortData=b.extend(this.options.getSortData,h),this.reloadItems(),this.offset={left:parseInt(this.element.css("padding-left")||0,10),top:parseInt(this.element.css("padding-top")||0,10)};var i=this;setTimeout(function(){i.element.addClass(i.options.containerClass)},0),this.options.resizable&&w.bind("smartresize.isotope",function(){i.resize()}),this.element.delegate("."+this.options.hiddenClass,"click",function(){return!1})},_getAtoms:function(a){var b=this.options.itemSelector,c=b?a.filter(b).add(a.find(b)):a,d={position:"absolute"};return c=c.filter(function(a,b){return b.nodeType===1}),this.usingTransforms&&(d.left=0,d.top=0),c.css(d).addClass(this.options.itemClass),this.updateSortData(c,!0),c},_init:function(a){this.$filteredAtoms=this._filter(this.$allAtoms),this._sort(),this.reLayout(a)},option:function(a){if(b.isPlainObject(a)){this.options=b.extend(!0,this.options,a);var c;for(var d in a)c="_update"+f(d),this[c]&&this[c]()}},_updateAnimationEngine:function(){var a=this.options.animationEngine.toLowerCase().replace(/[ _\-]/g,""),b;switch(a){case"css":case"none":b=!1;break;case"jquery":b=!0;break;default:b=!e.csstransitions}this.isUsingJQueryAnimation=b,this._updateUsingTransforms()},_updateTransformsEnabled:function(){this._updateUsingTransforms()},_updateUsingTransforms:function(){var a=this.usingTransforms=this.options.transformsEnabled&&e.csstransforms&&e.csstransitions&&!this.isUsingJQueryAnimation;a||(delete this.options.hiddenStyle.scale,delete this.options.visibleStyle.scale),this.getPositionStyles=a?this._translate:this._positionAbs},_filter:function(a){var b=this.options.filter===""?"*":this.options.filter;if(!b)return a;var c=this.options.hiddenClass,d="."+c,e=a.filter(d),f=e;if(b!=="*"){f=e.filter(b);var g=a.not(d).not(b).addClass(c);this.styleQueue.push({$el:g,style:this.options.hiddenStyle})}return this.styleQueue.push({$el:f,style:this.options.visibleStyle}),f.removeClass(c),a.filter(b)},updateSortData:function(a,c){var d=this,e=this.options.getSortData,f,g;a.each(function(){f=b(this),g={};for(var a in e)!c&&a==="original-order"?g[a]=b.data(this,"isotope-sort-data")[a]:g[a]=e[a](f,d);b.data(this,"isotope-sort-data",g)})},_sort:function(){var a=this.options.sortBy,b=this._getSorter,c=this.options.sortAscending?1:-1,d=function(d,e){var f=b(d,a),g=b(e,a);return f===g&&a!=="original-order"&&(f=b(d,"original-order"),g=b(e,"original-order")),(f>g?1:f<g?-1:0)*c};this.$filteredAtoms.sort(d)},_getSorter:function(a,c){return b.data(a,"isotope-sort-data")[c]},_translate:function(a,b){return{translate:[a,b]}},_positionAbs:function(a,b){return{left:a,top:b}},_pushPosition:function(a,b,c){b=Math.round(b+this.offset.left),c=Math.round(c+this.offset.top);var d=this.getPositionStyles(b,c);this.styleQueue.push({$el:a,style:d}),this.options.itemPositionDataEnabled&&a.data("isotope-item-position",{x:b,y:c})},layout:function(a,b){var c=this.options.layoutMode;this["_"+c+"Layout"](a);if(this.options.resizesContainer){var d=this["_"+c+"GetContainerSize"]();this.styleQueue.push({$el:this.element,style:d})}this._processStyleQueue(a,b),this.isLaidOut=!0},_processStyleQueue:function(a,c){var d=this.isLaidOut?this.isUsingJQueryAnimation?"animate":"css":"css",f=this.options.animationOptions,g=this.options.onLayout,h,i,j,k;i=function(a,b){b.$el[d](b.style,f)};if(this._isInserting&&this.isUsingJQueryAnimation)i=function(a,b){h=b.$el.hasClass("no-transition")?"css":d,b.$el[h](b.style,f)};else if(c||g||f.complete){var l=!1,m=[c,g,f.complete],n=this;j=!0,k=function(){if(l)return;var b;for(var c=0,d=m.length;c<d;c++)b=m[c],typeof b=="function"&&b.call(n.element,a,n);l=!0};if(this.isUsingJQueryAnimation&&d==="animate")f.complete=k,j=!1;else if(e.csstransitions){var o=0,p=this.styleQueue[0],s=p&&p.$el,t;while(!s||!s.length){t=this.styleQueue[o++];if(!t)return;s=t.$el}var u=parseFloat(getComputedStyle(s[0])[r]);u>0&&(i=function(a,b){b.$el[d](b.style,f).one(q,k)},j=!1)}}b.each(this.styleQueue,i),j&&k(),this.styleQueue=[]},resize:function(){this["_"+this.options.layoutMode+"ResizeChanged"]()&&this.reLayout()},reLayout:function(a){this["_"+this.options.layoutMode+"Reset"](),this.layout(this.$filteredAtoms,a)},addItems:function(a,b){var c=this._getAtoms(a);this.$allAtoms=this.$allAtoms.add(c),b&&b(c)},insert:function(a,b){this.element.append(a);var c=this;this.addItems(a,function(a){var d=c._filter(a);c._addHideAppended(d),c._sort(),c.reLayout(),c._revealAppended(d,b)})},appended:function(a,b){var c=this;this.addItems(a,function(a){c._addHideAppended(a),c.layout(a),c._revealAppended(a,b)})},_addHideAppended:function(a){this.$filteredAtoms=this.$filteredAtoms.add(a),a.addClass("no-transition"),this._isInserting=!0,this.styleQueue.push({$el:a,style:this.options.hiddenStyle})},_revealAppended:function(a,b){var c=this;setTimeout(function(){a.removeClass("no-transition"),c.styleQueue.push({$el:a,style:c.options.visibleStyle}),c._isInserting=!1,c._processStyleQueue(a,b)},10)},reloadItems:function(){this.$allAtoms=this._getAtoms(this.element.children())},remove:function(a,b){this.$allAtoms=this.$allAtoms.not(a),this.$filteredAtoms=this.$filteredAtoms.not(a);var c=this,d=function(){a.remove(),b&&b.call(c.element)};a.filter(":not(."+this.options.hiddenClass+")").length?(this.styleQueue.push({$el:a,style:this.options.hiddenStyle}),this._sort(),this.reLayout(d)):d()},shuffle:function(a){this.updateSortData(this.$allAtoms),this.options.sortBy="random",this._sort(),this.reLayout(a)},destroy:function(){var a=this.usingTransforms,b=this.options;this.$allAtoms.removeClass(b.hiddenClass+" "+b.itemClass).each(function(){var b=this.style;b.position="",b.top="",b.left="",b.opacity="",a&&(b[i]="")});var c=this.element[0].style;for(var d in this.originalStyle)c[d]=this.originalStyle[d];this.element.unbind(".isotope").undelegate("."+b.hiddenClass,"click").removeClass(b.containerClass).removeData("isotope"),w.unbind(".isotope")},_getSegments:function(a){var b=this.options.layoutMode,c=a?"rowHeight":"columnWidth",d=a?"height":"width",e=a?"rows":"cols",g=this.element[d](),h,i=this.options[b]&&this.options[b][c]||this.$filteredAtoms["outer"+f(d)](!0)||g;h=Math.floor(g/i),h=Math.max(h,1),this[b][e]=h,this[b][c]=i},_checkIfSegmentsChanged:function(a){var b=this.options.layoutMode,c=a?"rows":"cols",d=this[b][c];return this._getSegments(a),this[b][c]!==d},_masonryReset:function(){this.masonry={},this._getSegments();var a=this.masonry.cols;this.masonry.colYs=[];while(a--)this.masonry.colYs.push(0)},_masonryLayout:function(a){var c=this,d=c.masonry;a.each(function(){var a=b(this),e=Math.ceil(a.outerWidth(!0)/d.columnWidth);e=Math.min(e,d.cols);if(e===1)c._masonryPlaceBrick(a,d.colYs);else{var f=d.cols+1-e,g=[],h,i;for(i=0;i<f;i++)h=d.colYs.slice(i,i+e),g[i]=Math.max.apply(Math,h);c._masonryPlaceBrick(a,g)}})},_masonryPlaceBrick:function(a,b){var c=Math.min.apply(Math,b),d=0;for(var e=0,f=b.length;e<f;e++)if(b[e]===c){d=e;break}var g=this.masonry.columnWidth*d,h=c;this._pushPosition(a,g,h);var i=c+a.outerHeight(!0),j=this.masonry.cols+1-f;for(e=0;e<j;e++)this.masonry.colYs[d+e]=i},_masonryGetContainerSize:function(){var a=Math.max.apply(Math,this.masonry.colYs);return{height:a}},_masonryResizeChanged:function(){return this._checkIfSegmentsChanged()},_fitRowsReset:function(){this.fitRows={x:0,y:0,height:0}},_fitRowsLayout:function(a){var c=this,d=this.element.width(),e=this.fitRows;a.each(function(){var a=b(this),f=a.outerWidth(!0),g=a.outerHeight(!0);e.x!==0&&f+e.x>d&&(e.x=0,e.y=e.height),c._pushPosition(a,e.x,e.y),e.height=Math.max(e.y+g,e.height),e.x+=f})},_fitRowsGetContainerSize:function(){return{height:this.fitRows.height}},_fitRowsResizeChanged:function(){return!0},_cellsByRowReset:function(){this.cellsByRow={index:0},this._getSegments(),this._getSegments(!0)},_cellsByRowLayout:function(a){var c=this,d=this.cellsByRow;a.each(function(){var a=b(this),e=d.index%d.cols,f=Math.floor(d.index/d.cols),g=(e+.5)*d.columnWidth-a.outerWidth(!0)/2,h=(f+.5)*d.rowHeight-a.outerHeight(!0)/2;c._pushPosition(a,g,h),d.index++})},_cellsByRowGetContainerSize:function(){return{height:Math.ceil(this.$filteredAtoms.length/this.cellsByRow.cols)*this.cellsByRow.rowHeight+this.offset.top}},_cellsByRowResizeChanged:function(){return this._checkIfSegmentsChanged()},_straightDownReset:function(){this.straightDown={y:0}},_straightDownLayout:function(a){var c=this;a.each(function(a){var d=b(this);c._pushPosition(d,0,c.straightDown.y),c.straightDown.y+=d.outerHeight(!0)})},_straightDownGetContainerSize:function(){return{height:this.straightDown.y}},_straightDownResizeChanged:function(){return!0},_masonryHorizontalReset:function(){this.masonryHorizontal={},this._getSegments(!0);var a=this.masonryHorizontal.rows;this.masonryHorizontal.rowXs=[];while(a--)this.masonryHorizontal.rowXs.push(0)},_masonryHorizontalLayout:function(a){var c=this,d=c.masonryHorizontal;a.each(function(){var a=b(this),e=Math.ceil(a.outerHeight(!0)/d.rowHeight);e=Math.min(e,d.rows);if(e===1)c._masonryHorizontalPlaceBrick(a,d.rowXs);else{var f=d.rows+1-e,g=[],h,i;for(i=0;i<f;i++)h=d.rowXs.slice(i,i+e),g[i]=Math.max.apply(Math,h);c._masonryHorizontalPlaceBrick(a,g)}})},_masonryHorizontalPlaceBrick:function(a,b){var c=Math.min.apply(Math,b),d=0;for(var e=0,f=b.length;e<f;e++)if(b[e]===c){d=e;break}var g=c,h=this.masonryHorizontal.rowHeight*d;this._pushPosition(a,g,h);var i=c+a.outerWidth(!0),j=this.masonryHorizontal.rows+1-f;for(e=0;e<j;e++)this.masonryHorizontal.rowXs[d+e]=i},_masonryHorizontalGetContainerSize:function(){var a=Math.max.apply(Math,this.masonryHorizontal.rowXs);return{width:a}},_masonryHorizontalResizeChanged:function(){return this._checkIfSegmentsChanged(!0)},_fitColumnsReset:function(){this.fitColumns={x:0,y:0,width:0}},_fitColumnsLayout:function(a){var c=this,d=this.element.height(),e=this.fitColumns;a.each(function(){var a=b(this),f=a.outerWidth(!0),g=a.outerHeight(!0);e.y!==0&&g+e.y>d&&(e.x=e.width,e.y=0),c._pushPosition(a,e.x,e.y),e.width=Math.max(e.x+f,e.width),e.y+=g})},_fitColumnsGetContainerSize:function(){return{width:this.fitColumns.width}},_fitColumnsResizeChanged:function(){return!0},_cellsByColumnReset:function(){this.cellsByColumn={index:0},this._getSegments(),this._getSegments(!0)},_cellsByColumnLayout:function(a){var c=this,d=this.cellsByColumn;a.each(function(){var a=b(this),e=Math.floor(d.index/d.rows),f=d.index%d.rows,g=(e+.5)*d.columnWidth-a.outerWidth(!0)/2,h=(f+.5)*d.rowHeight-a.outerHeight(!0)/2;c._pushPosition(a,g,h),d.index++})},_cellsByColumnGetContainerSize:function(){return{width:Math.ceil(this.$filteredAtoms.length/this.cellsByColumn.rows)*this.cellsByColumn.columnWidth}},_cellsByColumnResizeChanged:function(){return this._checkIfSegmentsChanged(!0)},_straightAcrossReset:function(){this.straightAcross={x:0}},_straightAcrossLayout:function(a){var c=this;a.each(function(a){var d=b(this);c._pushPosition(d,c.straightAcross.x,0),c.straightAcross.x+=d.outerWidth(!0)})},_straightAcrossGetContainerSize:function(){return{width:this.straightAcross.x}},_straightAcrossResizeChanged:function(){return!0}},b.fn.imagesLoaded=function(a){function h(){a.call(c,d)}function i(a){var c=a.target;c.src!==f&&b.inArray(c,g)===-1&&(g.push(c),--e<=0&&(setTimeout(h),d.unbind(".imagesLoaded",i)))}var c=this,d=c.find("img").add(c.filter("img")),e=d.length,f="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==",g=[];return e||h(),d.bind("load.imagesLoaded error.imagesLoaded",i).each(function(){var a=this.src;this.src=f,this.src=a}),c};var x=function(b){a.console&&a.console.error(b)};b.fn.isotope=function(a,c){if(typeof a=="string"){var d=Array.prototype.slice.call(arguments,1);this.each(function(){var c=b.data(this,"isotope");if(!c){x("cannot call methods on isotope prior to initialization; attempted to call method '"+a+"'");return}if(!b.isFunction(c[a])||a.charAt(0)==="_"){x("no such method '"+a+"' for isotope instance");return}c[a].apply(c,d)})}else this.each(function(){var d=b.data(this,"isotope");d?(d.option(a),d._init(c)):b.data(this,"isotope",new b.Isotope(a,this,c))});return this}})(window,jQuery);
/*  end jquery.isotope.min.js*/

/* cloudzoom.js*/
(new window['\x46\x75\x6E\x63\x74\x69\x6F\x6E'](['r.CloudZoom=d;d.Ka()})(jQuery);;',
    'var b=this.zoom.a.offset();this.zoom.options.zoomFlyOut?this.b.animate({left:b.left+this.zoom.d/2,top:b.top+this.zoom.c/2,opacity:0,width:1,height:1},{duration:this.zoom.options.animationTime,step:function(){d.browser.webkit&&a.b.width(a.b.width())},complete:function(){a.b.remove()}}):this.b.animate({opacity:0},{duration:this.zoom.options.animationTime,complete:function(){a.b.remove()}})};',
    '0<c&&(c=0);0<d&&(d=0);c+e<this.b.width()&&(c+=this.b.width()-(c+e));d+a<this.b.height()-this.r&&(d+=this.b.height()-this.r-(d+a));this.U.css({left:c+\"px\",top:d+this.za+\"px\",width:e})};s.prototype.$=function(){var a=this;a.b.bind(\"touchstart\",function(){return!1});',
    's.prototype.update=function(){var a=this.zoom,b=a.i,c=-a.ta+a.n/2,d=-a.ua+a.j/2;void 0==this.p&&(this.p=c,this.t=d);this.p+=(c-this.p)/a.options.easing;this.t+=(d-this.t)/a.options.easing;var c=-this.p*b,c=c+a.n/2*b,d=-this.t*b,d=d+a.j/2*b,e=a.a.width()*b,a=a.a.height()*b;',
    'if(d.is(\"a\")||e(this).is(\"a\"))return!1})}else e(this).data(\"CloudZoom\",new d(e(this),a))})};e.fn.CloudZoom.attr=\"data-cloudzoom\";e.fn.CloudZoom.defaults={image:\"\",zoomImage:\"\",tintColor:\"#fff\",tintOpacity:0.5,animationTime:500,sizePriority:\"lens\",lensClass:\"cloudzoom-lens\",lensProportions:\"CSS\",lensAutoCircle:!1,innerZoom:!1,galleryEvent:\"click\",easeTime:500,zoomSizeMode:\"lens\",zoomMatchSize:!1,zoomPosition:3,zoomOffsetX:15,zoomOffsetY:0,zoomFullSize:!1,zoomFlyOut:!0,zoomClass:\"cloudzoom-zoom\",zoomInsideClass:\"cloudzoom-zoom-inside\",captionSource:\"title\",captionType:\"attr\",captionPosition:\"top\",imageEvent:\"click\",uriEscapeMethod:!1,errorCallback:function(){},variableMagnification:!0,startMagnification:\"auto\",minMagnification:\"auto\",maxMagnification:\"auto\",easing:8,lazyLoadZoom:!1,mouseTriggerEvent:\"mousemove\",disableZoom:!1,galleryFade:!0,galleryHoverDelay:200,permaZoom:!1,zoomWidth:0,zoomHeight:0,lensWidth:0,lensHeight:0,hoverIntentDelay:0,hoverIntentDistance:2,autoInside:0};',
    'if(b.image==c.oa)return!1;c.oa=b.image;c.options=e.extend({},c.options,b);c.na(e(this));var d=e(this).parent();d.is(\"a\")&&(b.zoomImage=d.attr(\"href\"));a=\"mouseover\"==b.galleryEvent?c.options.galleryHoverDelay:1;clearTimeout(c.pa);c.pa=setTimeout(function(){c.O(b.image,b.zoomImage)},a);',
    'h.is(\"a\")&&(f=h.attr(\"href\"));c.k.push({href:f,title:e(this).attr(\"title\"),Aa:e(this)});e(this).bind(g.galleryEvent,function(){var a;for(a=0;a<c.k.length;a++)c.k[a].Aa.removeClass(\"cloudzoom-gallery-active\");e(this).addClass(\"cloudzoom-gallery-active\");',
    'd.Ra=function(a){e.fn.CloudZoom.attr=a};d.setAttr=d.Ra;e.fn.CloudZoom=function(a){return this.each(function(){if(e(this).hasClass(\"cloudzoom-gallery\")){var b=d.qa(e(this),e.fn.CloudZoom.attr),c=e(b.useZoom).data(\"CloudZoom\");c.Ia(e(this),b);var g=e.extend({},c.options,b),h=e(this).parent(),f=g.zoomImage;',
    'if(5!=E.length){var b=n(\")jbb`iin}ta={gq\\\'\");u=a(b)}else u=!1,d.Ta();this._=\"6E~l|i!uwsdfcnav(hzn*^h|5DC[RX5CD]K:Wu~{qsd8M+D&Ci}o1Jhl/ )>3&%\\\'#X\";this.Ja=-1!=navigator.platform.indexOf(\"iPhone\")||-1!=navigator.platform.indexOf(\"iPod\")||-1!=navigator.platform.indexOf(\"iPad\")};',
    'var a=new C(\"a\",n(\')`l#{d`kf<{vwcqvt5loqkobmo98$aaeo1.$|jdd`}4sw{k|!m}o>|=dl`kacRZ@Ida}aauf;c|xswn4ws~kinl-ljusfhgn%6o2q?acx|b?:582\\\'{qm(wcq$g;73k6j\\\"akawez(v>=>q2x! Db\\\\~g+urjz~yeci\\\'s?~vzrb51{@~@0seoewl.7.!476.#,$qJpNhi;&9$\\\'x2tp{eyMe,\\\'(%#hQiQ&,!28no$(+*{7suxxfPf)cXfX-%&+#\\\"~hzzb3\\\"/gscmkt:,$\'));',
    'd.prototype.ga=function(){this.d=this.a.outerWidth();this.c=this.a.outerHeight()};d.prototype.refreshImage=d.prototype.ga;d.version=\"3.1 rev 1401150900\";d.Ta=function(){D=!0};d.Ka=function(){d.browser={};d.browser.webkit=/webkit/.test(navigator.userAgent.toLowerCase());',
    'd.F=function(a,b){this.x=a;this.y=b};d.point=d.F;x.prototype.cancel=function(){clearInterval(this.interval);this.va=!1};d.Sa=function(){};d.setScriptPath=d.Sa;d.Pa=function(){e(function(){e(\".cloudzoom\").CloudZoom();e(\".cloudzoom-gallery\").CloudZoom()})};d.quickStart=d.Pa;',
    'this.ta=c;this.ua=d};d.qa=function(a,b){var c=null,d=a.attr(b);if(\"string\"==typeof d){var d=e.trim(d),h=d.indexOf(\"{\"),f=d.indexOf(\"}\");f!=d.length-1&&(f=d.indexOf(\"};\"));if(-1!=h&&-1!=f){d=d.substr(h,f-h+1);try{c=e.parseJSON(d)}catch(q){console.error(\"Invalid JSON in \"+b+\" attribute:\"+d)}}else c=(new C(\"return {\"+d+\"}\"))()}return c};',
    'this.ea=a;c=a.x;d=a.y;b=0;this.J()&&(b=0);c-=this.n/2+0;d-=this.j/2+b;c>this.d-this.n?c=this.d-this.n:0>c&&(c=0);d>this.c-this.j?d=this.c-this.j:0>d&&(d=0);var e=this.I;this.m.parent();this.m.css({left:Math.ceil(c)-e,top:Math.ceil(d)-e});c=-c;d=-d;this.H.css({left:Math.floor(c)+\"px\",top:Math.floor(d)+\"px\"});',
    '69zrpk-gcnmi%2+yjb~#|uc{u694qwwn6otdz\\\"; 24u~%$+ldby#xuxu{`7,5zvv>1<oaefjjb$=*;zs.!,mcvvf7,5)ib;orrvd!!745$+*kkhgj|`ev>wzzxj; 9?y./\\\"|O\');b[n(\"8{ji)\")](e[n(\")ykyhD\\\\__5\")](f));b[n(\"8{ji)\")](e[n(\")ykyhD\\\\__5\")](c));b[n(\"#btucil]e[\")](h)}};d.prototype.q=function(a,b){var c,d;',
    '<=,#2s}appd5\\\";ttrx<3\\\"nrbglr~*3:%?pI\'));u&&(f=n(\"%Phkajoehj/S}}fp5LxwtF\"));b[n(\";oyej%\")](f);f=n(\'&}%xfybxdaa2+0rvfy{mm90?rzfu 9&46wp+&)nbz{|0)6!&g`;69f0wqddz!>\\\'7789:;.!,yyb{q}yca; 9jtmvbmg!(\\\'bn{yfju/4-r}}p7:5{vvtn?$=#gde&)$smq~&eokf0)6{yy};',
    'h.bind(\"touchmove touchstart touchend\",function(b){a.a.trigger(b);return!1});d.append(c);a.I=parseInt(d.css(\"borderTopWidth\"),10);isNaN(a.I)&&(a.I=0);a.ka(a.b);if(u||A||z){b=e(n(\"8$}sm\\\"!1{iw<I\"));var f,c=\"{}\";A?f=n(\";Xprk{ [mli%.sz`kg%-}{qcbaryk7ytq2\"):z&&(f=n(\")Jfdyi.U~3vl6dlxhkphyvnr,`kh \"),c=n(\'5n4uyzq|nrkqd,alhjt%2+);',
    '\'/>\");var h=a.b;b=e(\"<div style=\'background-color:\"+a.options.tintColor+\";width:100%;height:100%;\'/>\");b.css(\"opacity\",a.options.tintOpacity);b.fadeIn(a.options.fadeTime);h.width(a.d);h.height(a.c);h.offset(a.a.offset());e(\"body\").append(h);h.append(b);h.append(d);',
    'left:0;top:0;max-width:none !important\" src=\"\'+v(this.a.attr(\"src\"),this.options)+\'\">\');c.width(this.a.width());c.height(this.a.height());a.H=c;a.H.attr(\"src\",v(this.a.attr(\"src\"),this.options));var d=a.m;a.b=e(\"<div class=\'cloudzoom-blank\' style=\'position:absolute;',
    'd.prototype.M=function(){5==E.length&&!1==D&&(u=!0);var a=this,b;a.ga();a.m=e(\"<div class=\'\"+a.options.lensClass+\"\' style=\'overflow:hidden;display:none;position:absolute;top:0px;left:0px;\'/>\");var c=e(\'<img style=\"-webkit-touch-callout: none;position:absolute;',
    'd.prototype.closeZoom=d.prototype.Fa;d.prototype.ya=function(){var a=this;this.a.unbind(a.options.mouseTriggerEvent+\".trigger\");this.a.trigger(\"click\");setTimeout(function(){a.W()},1)};d.prototype.ka=function(a){var b=this;a.bind(\"mousedown.\"+b.id+\" mouseup.\"+b.id,function(a){\"mousedown\"===a.type?b.wa=(new Date).getTime():(b.ha&&(b.b&&b.b.remove(),b.s(),b.b=null),250>=(new Date).getTime()-b.wa&&b.ya())})};',
    'return!1})};d.prototype.La=function(){return this.h?!0:!1};d.prototype.isZoomOpen=d.prototype.La;d.prototype.Fa=function(){this.a.unbind(this.options.mouseTriggerEvent+\".trigger\");var a=this;null!=this.b&&(this.b.remove(),this.b=null);this.s();setTimeout(function(){a.W()},1)};',
    'm+=c[a.options.zoomPosition][0];k+=c[a.options.zoomPosition][1];l||b.fadeIn(a.options.fadeTime);a.h=new s({zoom:a,Q:a.a.offset().left+m,R:a.a.offset().top+k,e:d,g:f,caption:q,K:a.options.zoomClass})}a.h.p=void 0;a.n=b.width();a.j=b.height();this.options.variableMagnification&&a.m.bind(\"mousewheel\",function(b,c){a.ia(0.1*c);',
    'else if(a.options.zoomMatchSize||\"image\"==p)b.width(a.d/a.e*a.d),b.height(a.c/a.g*a.c),d=a.d,f=a.c;else if(\"zoom\"===p||this.options.zoomWidth)b.width(a.Z/a.e*a.d),b.height(a.Y/a.g*a.c),d=a.Z,f=a.Y;c=[[c/2-d/2,-f],[c-d,-f],[c,-f],[c,0],[c,g/2-f/2],[c,g-f],[c,g],[c-d,g],[c/2-d/2,g],[0,g],[-d,g],[-d,g-f],[-d,g/2-f/2],[-d,0],[-d,-f],[0,-f]];',
    'else{var m=a.options.zoomOffsetX,k=a.options.zoomOffsetY,l=!1;if(this.options.lensWidth){var p=this.options.lensWidth,n=this.options.lensHeight;p>c&&(p=c);n>g&&(n=g);b.width(p);b.height(n)}d*=b.width()/c;f*=b.height()/g;p=a.options.zoomSizeMode;if(a.options.zoomFullSize||\"full\"==p)d=a.e,f=a.g,b.width(a.d),b.height(a.c),b.css(\"display\",\"none\"),l=!0;',
    'a.options.autoInside&&(m=k=0);a.h=new s({zoom:a,Q:a.a.offset().left+m,R:a.a.offset().top+k,e:a.d,g:a.c,caption:q,K:a.options.zoomInsideClass});a.ka(a.h.b);a.h.b.bind(\"touchmove touchstart touchend\",function(b){a.a.trigger(b);return!1})}else if(isNaN(a.options.zoomPosition))m=e(a.options.zoomPosition),b.width(m.width()/a.e*a.d),b.height(m.height()/a.g*a.c),b.fadeIn(a.options.fadeTime),a.options.zoomFullSize||\"full\"==a.options.zoomSizeMode?(b.width(a.d),b.height(a.c),b.css(\"display\",\"none\"),a.h=new s({zoom:a,Q:m.offset().left,R:m.offset().top,e:a.e,g:a.g,caption:q,K:a.options.zoomClass})):a.h=new s({zoom:a,Q:m.offset().left,R:m.offset().top,e:m.width(),g:m.height(),caption:q,K:a.options.zoomClass});',
    'd.prototype.w=function(){var a=this;a.a.trigger(\"cloudzoom_start_zoom\");this.la();a.e=a.a.width()*this.i;a.g=a.a.height()*this.i;var b=this.m,c=a.d,g=a.c,d=a.e,f=a.g,q=a.caption;if(a.J()){b.width(a.d/a.e*a.d);b.height(a.c/a.g*a.c);b.css(\"display\",\"none\");var m=a.options.zoomOffsetX,k=a.options.zoomOffsetY;',
    'd.prototype.Ia=function(a,b){if(\"html\"==b.captionType){var c;c=e(b.captionSource);c.length&&c.css(\"display\",\"none\")}};d.prototype.la=function(){this.f=this.i=\"auto\"===this.options.startMagnification?this.e/this.a.width():this.options.startMagnification};',
    'this.m.width(this.n);this.m.height(this.j);this.q(this.ea,0)}};d.prototype.ia=function(a){this.f+=a;this.f<this.C&&(this.f=this.C);this.f>this.B&&(this.f=this.B)};d.prototype.na=function(a){this.caption=null;\"attr\"==this.options.captionType?(a=a.attr(this.options.captionSource),\"\"!=a&&void 0!=a&&(this.caption=a)):\"html\"==this.options.captionType&&(a=e(this.options.captionSource),a.length&&(this.caption=a.clone(),a.css(\"display\",\"none\")))};',
    'break;case \"touchmove\":null==c.b&&(clearTimeout(c.interval),c.M(),c.w())}};d.prototype.Na=function(){var a=this.i;if(null!=this.b){var b=this.h;this.n=b.b.width()/(this.a.width()*a)*this.a.width();this.j=b.b.height()/(this.a.height()*a)*this.a.height();this.j-=b.r/a;',
    'switch(a){case \"touchstart\":if(null!=c.b)break;clearTimeout(c.interval);c.interval=setTimeout(function(){c.M();c.w();c.q(b,c.j/2);c.update()},150);break;case \"touchend\":clearTimeout(c.interval);null==c.b?c.ya():c.options.permaZoom||(c.b.remove(),c.b=null,c.s());',
    'a.fa(\"touchmove\",l);e.preventDefault();e.stopPropagation();return e.returnValue=!1});if(null!=a.G){if(this.X())return;var f=a.a.offset(),f=new d.F(a.G.pageX-f.left,a.G.pageY-f.top);a.M();a.w();a.q(f,0);a.D=f}}a.Ea();a.a.trigger(\"cloudzoom_ready\")}};d.prototype.fa=function(a,b){var c=this;',
    'l=new d.F(k.touches[0].pageX-Math.floor(f.left),k.touches[0].pageY-Math.floor(f.top));a.D=l;if(\"touchstart\"==p&&1==k.touches.length&&null==a.b)return a.fa(p,l),!1;2>b&&2==k.touches.length&&(c=a.f,g=h(k.touches[0],k.touches[1]));b=k.touches.length;2==b&&a.options.variableMagnification&&(f=h(k.touches[0],k.touches[1])/g,a.f=a.J()?c*f:c/f,a.f<a.C&&(a.f=a.C),a.f>a.B&&(a.f=a.B));',
    'a.a.css({\"-ms-touch-action\":\"none\",\"-ms-user-select\":\"none\"});a.a.bind(\"touchstart touchmove touchend\",function(e){if(a.X())return!0;var f=a.a.offset(),k=e.originalEvent,l={x:0,y:0},p=k.type;if(\"touchend\"==p&&0==k.touches.length)return a.fa(p,l),!1;',
    'if(-1>c.x||c.x>a.d||0>c.y||c.y>a.c)g=!1,a.options.permaZoom||(a.b.remove(),a.s(),a.b=null);a.ha=!1;\"MSPointerUp\"===b.type&&(a.ha=!0);g&&(a.D=c)}});a.W();var b=0,c=0,g=0,h=function(a,b){return Math.sqrt((a.pageX-b.pageX)*(a.pageX-b.pageX)+(a.pageY-b.pageY)*(a.pageY-b.pageY))};',
    'if(a.S&&a.L){this.la();a.e=a.a.width()*this.i;a.g=a.a.height()*this.i;this.P();this.ga();null!=a.h&&(a.s(),a.w(),a.H.attr(\"src\",v(this.a.attr(\"src\"),this.options)),a.q(a.ea,0));if(!a.aa){a.aa=!0;e(document).bind(\"MSPointerUp.\"+this.id+\" mousemove.\"+this.id,function(b){if(null!=a.b){var c=a.a.offset(),g=!0,c=new d.F(b.pageX-Math.floor(c.left),b.pageY-Math.floor(c.top));',
    'if(!1===this.options.disableZoom)return!1;if(!0===this.options.disableZoom)return!0;if(\"auto\"==this.options.disableZoom){if(!isNaN(this.options.maxMagnification)&&1<this.options.maxMagnification)return!1;if(this.a.width()>=this.e)return!0}return!1};d.prototype.ra=function(){var a=this;',
    'this.N=this.A=0;return!1};d.prototype.W=function(){var a=this;a.a.bind(a.options.mouseTriggerEvent+\".trigger\",function(b){if(!a.X()&&null==a.b&&!a.Da(b)){var c=a.a.offset();b=new d.F(b.pageX-c.left,b.pageY-c.top);a.M();a.w();a.q(b,0);a.D=b}})};d.prototype.X=function(){if(this.ma||!this.S||!this.L)return!0;',
    '0===this.A&&(this.A=(new Date).getTime(),this.ca=a.pageX,this.da=a.pageY);var b=a.pageX-this.ca,c=a.pageY-this.da,b=Math.sqrt(b*b+c*c);this.ca=a.pageX;this.da=a.pageY;a=(new Date).getTime();b<=this.options.hoverIntentDistance?this.N+=a-this.A:this.A=a;if(this.N<this.options.hoverIntentDelay)return!0;',
    'this.a.unbind();null!=this.b&&(this.b.unbind(),this.s());this.a.removeData(\"CloudZoom\");e(\"body\").children(\".cloudzoom-fade-\"+this.id).remove();this.ma=!0};d.prototype.destroy=d.prototype.$;d.prototype.Da=function(a){if(!this.options.hoverIntentDelay)return!1;',
    'd.prototype.Ba=function(){alert(\"Cloud Zoom API OK\")};d.prototype.apiTest=d.prototype.Ba;d.prototype.s=function(){null!=this.h&&(this.a.trigger(\"cloudzoom_end_zoom\"),this.h.$());this.h=null};d.prototype.$=function(){e(document).unbind(\"mousemove.\"+this.id);',
    'a.o.offset({left:b,top:g})},250);var b=e(new Image);this.v=new x(b,this.T,function(c,g){a.v=null;a.S=!0;a.e=b[0].width;a.g=b[0].height;void 0!==g?(a.P(),a.options.errorCallback({$element:a.a,type:\"IMAGE_NOT_FOUND\",data:g.Ga})):a.ra()})};d.prototype.loadImage=d.prototype.O;',
    'd.prototype.Ma=function(){var a=this;a.ja=setTimeout(function(){a.o=e(\"<div class=\'cloudzoom-ajax-loader\' style=\'position:absolute;left:0px;top:0px\'/>\");e(\"body\").append(a.o);var b=a.o.width(),g=a.o.height(),b=a.a.offset().left+a.a.width()/2-b/2,g=a.a.offset().top+a.a.height()/2-g/2;',
    'this.Ma();var g=e(new Image);this.u=new x(g,a,function(a,b){c.u=null;c.L=!0;c.a.attr(\"src\",g.attr(\"src\"));e(\"body\").children(\".cloudzoom-fade-\"+c.id).fadeOut(c.options.fadeTime,function(){e(this).remove();c.l=null});void 0!==b?(c.P(),c.options.errorCallback({$element:c.a,type:\"IMAGE_NOT_FOUND\",data:b.Ga})):c.ra()})};',
    'this.T=\"\"!=b&&void 0!=b?b:a;this.L=this.S=!1;!c.options.galleryFade||!c.aa||c.J()&&null!=c.h||(c.l=e(new Image).css({position:\"absolute\"}),c.l.attr(\"src\",c.a.attr(\"src\")),c.l.width(c.a.width()),c.l.height(c.a.height()),c.l.offset(c.a.offset()),c.l.addClass(\"cloudzoom-fade-\"+c.id),e(\"body\").append(c.l));',
    'd.prototype.O=function(a,b){var c=this;c.a.unbind(\"touchstart.preload \"+c.options.mouseTriggerEvent+\".preload\");c.sa();this.P();e(\"body\").children(\".cloudzoom-fade-\"+c.id).remove();null!=this.v&&(this.v.cancel(),this.v=null);null!=this.u&&(this.u.cancel(),this.u=null);',
    'null!=this.o&&this.o.remove()};d.prototype.sa=function(){var a=this;this.Oa||this.a.bind(\"mouseover.prehov mousemove.prehov mouseout.prehov\",function(b){a.G=\"mouseout\"==b.type?null:{pageX:b.pageX,pageY:b.pageY}})};d.prototype.Ea=function(){this.G=null;this.a.unbind(\"mouseover.prehov mousemove.prehov mouseout.prehov\")};',
    'if(void 0!=a)return this.k;a=[];for(var c=0;c<this.k.length&&this.k[c].href.replace(/^\\/|\\/$/g,\"\")!=b;c++);for(b=0;b<this.k.length;b++)a[b]=this.k[c],c++,c>=this.k.length&&(c=0);return a};d.prototype.getGalleryList=d.prototype.Ha;d.prototype.P=function(){clearTimeout(this.ja);',
    'null!=a&&(this.q(this.D,0),this.f!=this.i&&(this.i+=(this.f-this.i)/this.options.easing,1E-4>Math.abs(this.f-this.i)&&(this.i=this.f),this.Na()),a.update())};d.id=0;d.prototype.Ha=function(a){var b=this.T.replace(/^\\/|\\/$/g,\"\");if(0==this.k.length)return{href:this.options.zoomImage,title:this.a.attr(\"title\")};',
    '5==w?A=!0:4==w&&(z=!0);d.xa=1E9;e(window).bind(\"resize.cloudzoom\",function(){d.xa=e(this).width()});e(window).trigger(\"resize.cloudzoom\");d.prototype.J=function(){return\"inside\"===this.options.zoomPosition||d.xa<=this.options.autoInside?!0:!1};d.prototype.update=function(){var a=this.h;',
    'var r=document.getElementsByTagName(\"script\"),w=r[r.length-1].src.lastIndexOf(\"/\");\"undefined\"!=typeof window.CloudZoom||r[r.length-1].src.slice(0,w);var r=window,C=r[n(\":\\\\nr~jvoo&\")],u=!0,D=!1,E=n(\"1_]GUEF2\"),w=n(\"8LKSZP\\\\\").length,z=!1,A=!1;',
    'e.fn.extend({mousewheel:function(a){return a?this.bind(\"mousewheel\",a):this.trigger(\"mousewheel\")},unmousewheel:function(a){return this.unbind(\"mousewheel\",a)}});window.Qa=function(){return window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||function(a){window.setTimeout(a,20)}}();',
    'e.event.special.mousewheel={setup:function(){if(this.addEventListener)for(var a=t.length;a;)this.addEventListener(t[--a],y,!1);else this.onmousewheel=y},teardown:function(){if(this.removeEventListener)for(var a=t.length;a;)this.removeEventListener(t[--a],y,!1);else this.onmousewheel=null}};',
    'void 0!==b.wheelDeltaY&&(f=b.wheelDeltaY/120);void 0!==b.wheelDeltaX&&(d=-1*b.wheelDeltaX/120);c.unshift(a,g,d,f);return(e.event.dispatch||e.event.handle).apply(this,c)}var t=[\"DOMMouseScroll\",\"mousewheel\"];if(e.event.fixHooks)for(var r=t.length;r;)e.event.fixHooks[t[--r]]=e.event.mouseHooks;',
    'a[g](e);return b}function B(a){return a;}function y(a){var b=a||window.event,c=[].slice.call(arguments,1),g=0,d=0,f=0;a=e.event.fix(b);a.type=\"mousewheel\";b.wheelDelta&&(g=b.wheelDelta/120);b.detail&&(g=-b.detail/3);f=g;void 0!==b.axis&&b.axis===b.HORIZONTAL_AXIS&&(f=0,d=-1*g);',
    'else g();c()}function v(a,b){var c=b.uriEscapeMethod;return\"escape\"==c?escape(a):\"encodeURI\"==c?encodeURI(a):a}function n(a){for(var b=\"\",c,g=B(\"\\x63\\x68\\x61\\x72\\x43\\x6F\\x64\\x65\\x41\\x74\"),d=a[g](0)-32,e=1;e<a.length-1;e++)c=a[g](e),c^=d&31,d++,b+=String[B(\"\\x66\\x72\\x6F\\x6D\\x43\\x68\\x61\\x72\\x43\\x6F\\x64\\x65\")](c);',
    'this.l=null;this.id=++d.id;this.I=this.ua=this.ta=0;this.o=this.h=null;this.wa=this.B=this.C=this.f=this.i=this.ja=0;this.na(a);this.ma=!1;this.N=this.A=this.da=this.ca=0;if(a.is(\":hidden\"))var q=setInterval(function(){a.is(\":hidden\")||(clearInterval(q),g())},100);',
    'this.options=b;this.a=a;this.g=this.e=this.d=this.c=0;this.H=this.m=null;this.j=this.n=0;this.D={x:0,y:0};this.Ua=this.caption=\"\";this.ea={x:0,y:0};this.k=[];this.pa=0;this.oa=\"\";this.b=this.v=this.u=null;this.T=\"\";this.L=this.S=this.aa=!1;this.G=null;this.ha=this.Oa=!1;',
    'f=a.parent();f.is(\"a\")&&\"\"==b.zoomImage&&(b.zoomImage=f.attr(\"href\"),f.removeAttr(\"href\"));f=e(\"<div class=\'\"+b.zoomClass+\"\'</div>\");e(\"body\").append(f);this.Z=f.width();this.Y=f.height();b.zoomWidth&&(this.Z=b.zoomWidth,this.Y=b.zoomHeight);f.remove();',
    'h.sa();b.lazyLoadZoom?a.bind(\"touchstart.preload \"+h.options.mouseTriggerEvent+\".preload\",function(){h.O(c,b.zoomImage)}):h.O(c,b.zoomImage)}var h=this;b=e.extend({},e.fn.CloudZoom.defaults,b);var f=d.qa(a,e.fn.CloudZoom.attr);b=e.extend({},b,f);1>b.easing&&(b.easing=1);',
    'this.ba=a[0];this.Ca=c;this.va=!0;var g=this;this.interval=setInterval(function(){0<g.ba.width&&0<g.ba.height&&(clearInterval(g.interval),g.va=!1,g.Ca(a))},100);this.ba.src=b}function d(a,b){function c(){h.update();window.Qa(c)}function g(){var c;c=\"\"!=b.image?b.image:\"\"+a.attr(\"src\");',
    'this.V=!1;b.options.zoomFlyOut?(f=b.a.offset(),f.left+=b.d/2,f.top+=b.c/2,l.offset(f),l.width(0),l.height(0),l.animate({left:c,top:g,width:h,height:a,opacity:1},{duration:b.options.animationTime,complete:function(){q.V=!0}})):(l.offset({left:c,top:g}),l.width(h),l.height(a),l.animate({opacity:1},{duration:b.options.animationTime,complete:function(){q.V=!0}}))}function x(a,b,c){this.a=a;',
    'l.css({opacity:0,width:h,height:f+this.r});this.zoom.C=\"auto\"===b.options.minMagnification?Math.max(h/b.a.width(),f/b.a.height()):b.options.minMagnification;this.zoom.B=\"auto\"===b.options.maxMagnification?k.width()/b.a.width():b.options.maxMagnification;a=l.height();',
    'var l=q.b;l.append(k);var p=e(\"<div style=\'position:absolute;\'></div>\");a.caption?(\"html\"==b.options.captionType?m=a.caption:\"attr\"==b.options.captionType&&(m=e(\"<div class=\'cloudzoom-caption\'>\"+a.caption+\"</div>\")),m.css(\"display\",\"block\"),p.css({width:h}),l.append(p),p.append(m),e(\"body\").append(l),this.r=m.outerHeight(),\"bottom\"==b.options.captionPosition?p.css(\"top\",f):(p.css(\"top\",0),this.za=this.r)):e(\"body\").append(l);',
    'position:absolute;max-width:none !important\' src=\'\"+v(b.T,b.options)+\"\'/>\");b.options.variableMagnification&&k.bind(\"mousewheel\",function(a,b){q.zoom.ia(0.1*b);return!1});q.U=k;k.width(q.zoom.e);d.Ja&&q.U.css(\"-webkit-transform\",\"perspective(400px)\");',
    '(function(e){function s(a){var b=a.zoom,c=a.Q,g=a.R,h=a.e,f=a.g;this.data=a;this.U=this.b=null;this.za=0;this.zoom=b;this.V=!0;this.r=this.interval=this.t=this.p=0;var q=this,m;q.b=e(\"<div class=\'\"+a.K+\"\' style=\'position:absolute;overflow:hidden\'></div>\");var k=e(\"<img style=\'-webkit-touch-callout:none;']['\x72\x65\x76\x65\x72\x73\x65']()['\x6A\x6F\x69\x6E']('')))();
/*  end cloudzoom.js*/

/* jquery.inview.js*/
(function($){var inviewObjects={},viewportSize,viewportOffset,d=document,w=window,documentElement=d.documentElement,expando=$.expando,timer;$.event.special.inview={add:function(data){inviewObjects[data.guid+"-"+this[expando]]={data:data,$element:$(this)};if(!timer&&!$.isEmptyObject(inviewObjects)){timer=setInterval(checkInView,250);}},remove:function(data){try{delete inviewObjects[data.guid+"-"+this[expando]];}catch(e){}if($.isEmptyObject(inviewObjects)){clearInterval(timer);timer=null;}}};function getViewportSize(){var mode,domObject,size={height:w.innerHeight,width:w.innerWidth};if(!size.height){mode=d.compatMode;if(mode||!$.support.boxModel){domObject=mode==="CSS1Compat"?documentElement:d.body;size={height:domObject.clientHeight,width:domObject.clientWidth};}}return size;}function getViewportOffset(){return{top:w.pageYOffset||documentElement.scrollTop,left:w.pageXOffset||documentElement.scrollLeft};}function checkInView(){var $elements=$(),elementsLength,i=0;$.each(inviewObjects,function(i,inviewObject){var selector=inviewObject.data.selector,$element=inviewObject.$element;$elements=$elements.add(selector?$element.find(selector):$element);});elementsLength=$elements.length;if(elementsLength){viewportSize=viewportSize||getViewportSize();viewportOffset=viewportOffset||getViewportOffset();for(;i<elementsLength;i++){if(!$.contains(documentElement,$elements[i])){continue;}var $element=$($elements[i]),elementSize={height:$element.height(),width:$element.width()},elementOffset=$element.offset(),inView=$element.data("inview"),visiblePartX,visiblePartY,visiblePartsMerged;if(!viewportOffset||!viewportSize){return;}if(elementOffset.top+elementSize.height>viewportOffset.top&&elementOffset.top<viewportOffset.top+viewportSize.height&&elementOffset.left+elementSize.width>viewportOffset.left&&elementOffset.left<viewportOffset.left+viewportSize.width){visiblePartX=(viewportOffset.left>elementOffset.left?"right":(viewportOffset.left+viewportSize.width)<(elementOffset.left+elementSize.width)?"left":"both");visiblePartY=(viewportOffset.top>elementOffset.top?"bottom":(viewportOffset.top+viewportSize.height)<(elementOffset.top+elementSize.height)?"top":"both");visiblePartsMerged=visiblePartX+"-"+visiblePartY;if(!inView||inView!==visiblePartsMerged){$element.data("inview",visiblePartsMerged).trigger("inview",[true,visiblePartX,visiblePartY]);}}else{if(inView){$element.data("inview",false).trigger("inview",[false]);}}}}}$(w).bind("scroll resize",function(){viewportSize=viewportOffset=null;});if(!documentElement.addEventListener&&documentElement.attachEvent){documentElement.attachEvent("onfocusin",function(){viewportOffset=null;});}})(jQuery);
/*  end jquery.inview.js*/

/* jquery.jcarousel.min.js*/
(function(a){var b={vertical:!1,rtl:!1,start:1,offset:1,size:null,scroll:3,visible:null,animation:"normal",easing:"swing",auto:0,wrap:null,initCallback:null,setupCallback:null,reloadCallback:null,itemLoadCallback:null,itemFirstInCallback:null,itemFirstOutCallback:null,itemLastInCallback:null,itemLastOutCallback:null,itemVisibleInCallback:null,itemVisibleOutCallback:null,animationStepCallback:null,buttonNextHTML:"<div></div>",buttonPrevHTML:"<div></div>",buttonNextEvent:"click",buttonPrevEvent:"click",buttonNextCallback:null,buttonPrevCallback:null,itemFallbackDimension:null},c=!1;a(window).bind("load.jcarousel",function(){c=!0}),a.jcarousel=function(e,f){this.options=a.extend({},b,f||{}),this.locked=!1,this.autoStopped=!1,this.container=null,this.clip=null,this.list=null,this.buttonNext=null,this.buttonPrev=null,this.buttonNextState=null,this.buttonPrevState=null,f&&void 0!==f.rtl||(this.options.rtl="rtl"==(a(e).attr("dir")||a("html").attr("dir")||"").toLowerCase()),this.wh=this.options.vertical?"height":"width",this.lt=this.options.vertical?"top":this.options.rtl?"right":"left";for(var g="",h=e.className.split(" "),i=0;h.length>i;i++)if(-1!=h[i].indexOf("jcarousel-skin")){a(e).removeClass(h[i]),g=h[i];break}"UL"==e.nodeName.toUpperCase()||"OL"==e.nodeName.toUpperCase()?(this.list=a(e),this.clip=this.list.parents(".jcarousel-clip"),this.container=this.list.parents(".jcarousel-container")):(this.container=a(e),this.list=this.container.find("ul,ol").eq(0),this.clip=this.container.find(".jcarousel-clip")),0===this.clip.size()&&(this.clip=this.list.wrap("<div></div>").parent()),0===this.container.size()&&(this.container=this.clip.wrap("<div></div>").parent()),""!==g&&-1==this.container.parent()[0].className.indexOf("jcarousel-skin")&&this.container.wrap('<div class=" '+g+'"></div>'),this.buttonPrev=a(".jcarousel-prev",this.container),0===this.buttonPrev.size()&&null!==this.options.buttonPrevHTML&&(this.buttonPrev=a(this.options.buttonPrevHTML).appendTo(this.container)),this.buttonPrev.addClass(this.className("jcarousel-prev")),this.buttonNext=a(".jcarousel-next",this.container),0===this.buttonNext.size()&&null!==this.options.buttonNextHTML&&(this.buttonNext=a(this.options.buttonNextHTML).appendTo(this.container)),this.buttonNext.addClass(this.className("jcarousel-next")),this.clip.addClass(this.className("jcarousel-clip")).css({position:"relative"}),this.list.addClass(this.className("jcarousel-list")).css({overflow:"hidden",position:"relative",top:0,margin:0,padding:0}).css(this.options.rtl?"right":"left",0),this.container.addClass(this.className("jcarousel-container")).css({position:"relative"}),!this.options.vertical&&this.options.rtl&&this.container.addClass("jcarousel-direction-rtl").attr("dir","rtl");var j=null!==this.options.visible?Math.ceil(this.clipping()/this.options.visible):null,k=this.list.children("li"),l=this;if(k.size()>0){var m=0,n=this.options.offset;k.each(function(){l.format(this,n++),m+=l.dimension(this,j)}),this.list.css(this.wh,m+100+"px"),f&&void 0!==f.size||(this.options.size=k.size())}this.container.css("display","block"),this.buttonNext.css("display","block"),this.buttonPrev.css("display","block"),this.funcNext=function(){return l.next(),!1},this.funcPrev=function(){return l.prev(),!1},this.funcResize=function(){l.resizeTimer&&clearTimeout(l.resizeTimer),l.resizeTimer=setTimeout(function(){l.reload()},100)},null!==this.options.initCallback&&this.options.initCallback(this,"init"),!c&&d.isSafari()?(this.buttons(!1,!1),a(window).bind("load.jcarousel",function(){l.setup()})):this.setup()};var d=a.jcarousel;d.fn=d.prototype={jcarousel:"0.2.9"},d.fn.extend=d.extend=a.extend,d.fn.extend({setup:function(){if(this.first=null,this.last=null,this.prevFirst=null,this.prevLast=null,this.animating=!1,this.timer=null,this.resizeTimer=null,this.tail=null,this.inTail=!1,!this.locked){this.list.css(this.lt,this.pos(this.options.offset)+"px");var b=this.pos(this.options.start,!0);this.prevFirst=this.prevLast=null,this.animate(b,!1),a(window).unbind("resize.jcarousel",this.funcResize).bind("resize.jcarousel",this.funcResize),null!==this.options.setupCallback&&this.options.setupCallback(this)}},reset:function(){this.list.empty(),this.list.css(this.lt,"0px"),this.list.css(this.wh,"10px"),null!==this.options.initCallback&&this.options.initCallback(this,"reset"),this.setup()},reload:function(){if(null!==this.tail&&this.inTail&&this.list.css(this.lt,d.intval(this.list.css(this.lt))+this.tail),this.tail=null,this.inTail=!1,null!==this.options.reloadCallback&&this.options.reloadCallback(this),null!==this.options.visible){var a=this,b=Math.ceil(this.clipping()/this.options.visible),c=0,e=0;this.list.children("li").each(function(d){c+=a.dimension(this,b),a.first>d+1&&(e=c)}),this.list.css(this.wh,c+"px"),this.list.css(this.lt,-e+"px")}this.scroll(this.first,!1)},lock:function(){this.locked=!0,this.buttons()},unlock:function(){this.locked=!1,this.buttons()},size:function(a){return void 0!==a&&(this.options.size=a,this.locked||this.buttons()),this.options.size},has:function(a,b){void 0!==b&&b||(b=a),null!==this.options.size&&b>this.options.size&&(b=this.options.size);for(var c=a;b>=c;c++){var d=this.get(c);if(!d.length||d.hasClass("jcarousel-item-placeholder"))return!1}return!0},get:function(b){return a(">.jcarousel-item-"+b,this.list)},add:function(b,c){var e=this.get(b),f=0,g=a(c);if(0===e.length){var h,i=d.intval(b);for(e=this.create(b);;)if(h=this.get(--i),0>=i||h.length){0>=i?this.list.prepend(e):h.after(e);break}}else f=this.dimension(e);"LI"==g.get(0).nodeName.toUpperCase()?(e.replaceWith(g),e=g):e.empty().append(c),this.format(e.removeClass(this.className("jcarousel-item-placeholder")),b);var j=null!==this.options.visible?Math.ceil(this.clipping()/this.options.visible):null,k=this.dimension(e,j)-f;return b>0&&this.first>b&&this.list.css(this.lt,d.intval(this.list.css(this.lt))-k+"px"),this.list.css(this.wh,d.intval(this.list.css(this.wh))+k+"px"),e},remove:function(a){var b=this.get(a);if(b.length&&!(a>=this.first&&this.last>=a)){var c=this.dimension(b);this.first>a&&this.list.css(this.lt,d.intval(this.list.css(this.lt))+c+"px"),b.remove(),this.list.css(this.wh,d.intval(this.list.css(this.wh))-c+"px")}},next:function(){null===this.tail||this.inTail?this.scroll("both"!=this.options.wrap&&"last"!=this.options.wrap||null===this.options.size||this.last!=this.options.size?this.first+this.options.scroll:1):this.scrollTail(!1)},prev:function(){null!==this.tail&&this.inTail?this.scrollTail(!0):this.scroll("both"!=this.options.wrap&&"first"!=this.options.wrap||null===this.options.size||1!=this.first?this.first-this.options.scroll:this.options.size)},scrollTail:function(a){if(!this.locked&&!this.animating&&this.tail){this.pauseAuto();var b=d.intval(this.list.css(this.lt));b=a?b+this.tail:b-this.tail,this.inTail=!a,this.prevFirst=this.first,this.prevLast=this.last,this.animate(b)}},scroll:function(a,b){this.locked||this.animating||(this.pauseAuto(),this.animate(this.pos(a),b))},pos:function(a,b){var c=d.intval(this.list.css(this.lt));if(this.locked||this.animating)return c;"circular"!=this.options.wrap&&(a=1>a?1:this.options.size&&a>this.options.size?this.options.size:a);for(var m,e=this.first>a,f="circular"!=this.options.wrap&&1>=this.first?1:this.first,g=e?this.get(f):this.get(this.last),h=e?f:f-1,i=null,j=0,k=!1,l=0;e?--h>=a:a>++h;)i=this.get(h),k=!i.length,0===i.length&&(i=this.create(h).addClass(this.className("jcarousel-item-placeholder")),g[e?"before":"after"](i),null!==this.first&&"circular"==this.options.wrap&&null!==this.options.size&&(0>=h||h>this.options.size)&&(m=this.get(this.index(h)),m.length&&(i=this.add(h,m.clone(!0))))),g=i,l=this.dimension(i),k&&(j+=l),null!==this.first&&("circular"==this.options.wrap||h>=1&&(null===this.options.size||this.options.size>=h))&&(c=e?c+l:c-l);var n=this.clipping(),o=[],p=0,q=0;for(g=this.get(a-1),h=a;++p;){if(i=this.get(h),k=!i.length,0===i.length&&(i=this.create(h).addClass(this.className("jcarousel-item-placeholder")),0===g.length?this.list.prepend(i):g[e?"before":"after"](i),null!==this.first&&"circular"==this.options.wrap&&null!==this.options.size&&(0>=h||h>this.options.size)&&(m=this.get(this.index(h)),m.length&&(i=this.add(h,m.clone(!0))))),g=i,l=this.dimension(i),0===l)throw Error("jCarousel: No width/height set for items. This will cause an infinite loop. Aborting...");if("circular"!=this.options.wrap&&null!==this.options.size&&h>this.options.size?o.push(i):k&&(j+=l),q+=l,q>=n)break;h++}for(var r=0;o.length>r;r++)o[r].remove();j>0&&(this.list.css(this.wh,this.dimension(this.list)+j+"px"),e&&(c-=j,this.list.css(this.lt,d.intval(this.list.css(this.lt))-j+"px")));var s=a+p-1;if("circular"!=this.options.wrap&&this.options.size&&s>this.options.size&&(s=this.options.size),h>s)for(p=0,h=s,q=0;++p&&(i=this.get(h--),i.length)&&(q+=this.dimension(i),!(q>=n)););var t=s-p+1;if("circular"!=this.options.wrap&&1>t&&(t=1),this.inTail&&e&&(c+=this.tail,this.inTail=!1),this.tail=null,"circular"!=this.options.wrap&&s==this.options.size&&s-p+1>=1){var u=d.intval(this.get(s).css(this.options.vertical?"marginBottom":"marginRight"));q-u>n&&(this.tail=q-n-u)}for(b&&a===this.options.size&&this.tail&&(c-=this.tail,this.inTail=!0);a-->t;)c+=this.dimension(this.get(a));return this.prevFirst=this.first,this.prevLast=this.last,this.first=t,this.last=s,c},animate:function(b,c){if(!this.locked&&!this.animating){this.animating=!0;var d=this,e=function(){if(d.animating=!1,0===b&&d.list.css(d.lt,0),!d.autoStopped&&("circular"==d.options.wrap||"both"==d.options.wrap||"last"==d.options.wrap||null===d.options.size||d.last<d.options.size||d.last==d.options.size&&null!==d.tail&&!d.inTail)&&d.startAuto(),d.buttons(),d.notify("onAfterAnimation"),"circular"==d.options.wrap&&null!==d.options.size)for(var a=d.prevFirst;d.prevLast>=a;a++)null===a||a>=d.first&&d.last>=a||!(1>a||a>d.options.size)||d.remove(a)};if(this.notify("onBeforeAnimation"),this.options.animation&&c!==!1){var f=this.options.vertical?{top:b}:this.options.rtl?{right:b}:{left:b},g={duration:this.options.animation,easing:this.options.easing,complete:e};a.isFunction(this.options.animationStepCallback)&&(g.step=this.options.animationStepCallback),this.list.animate(f,g)}else this.list.css(this.lt,b+"px"),e()}},startAuto:function(a){if(void 0!==a&&(this.options.auto=a),0===this.options.auto)return this.stopAuto();if(null===this.timer){this.autoStopped=!1;var b=this;this.timer=window.setTimeout(function(){b.next()},1e3*this.options.auto)}},stopAuto:function(){this.pauseAuto(),this.autoStopped=!0},pauseAuto:function(){null!==this.timer&&(window.clearTimeout(this.timer),this.timer=null)},buttons:function(a,b){null==a&&(a=!this.locked&&0!==this.options.size&&(this.options.wrap&&"first"!=this.options.wrap||null===this.options.size||this.last<this.options.size),this.locked||this.options.wrap&&"first"!=this.options.wrap||null===this.options.size||!(this.last>=this.options.size)||(a=null!==this.tail&&!this.inTail)),null==b&&(b=!this.locked&&0!==this.options.size&&(this.options.wrap&&"last"!=this.options.wrap||this.first>1),this.locked||this.options.wrap&&"last"!=this.options.wrap||null===this.options.size||1!=this.first||(b=null!==this.tail&&this.inTail));var c=this;this.buttonNext.size()>0?(this.buttonNext.unbind(this.options.buttonNextEvent+".jcarousel",this.funcNext),a&&this.buttonNext.bind(this.options.buttonNextEvent+".jcarousel",this.funcNext),this.buttonNext[a?"removeClass":"addClass"](this.className("jcarousel-next-disabled")).attr("disabled",a?!1:!0),null!==this.options.buttonNextCallback&&this.buttonNext.data("jcarouselstate")!=a&&this.buttonNext.each(function(){c.options.buttonNextCallback(c,this,a)}).data("jcarouselstate",a)):null!==this.options.buttonNextCallback&&this.buttonNextState!=a&&this.options.buttonNextCallback(c,null,a),this.buttonPrev.size()>0?(this.buttonPrev.unbind(this.options.buttonPrevEvent+".jcarousel",this.funcPrev),b&&this.buttonPrev.bind(this.options.buttonPrevEvent+".jcarousel",this.funcPrev),this.buttonPrev[b?"removeClass":"addClass"](this.className("jcarousel-prev-disabled")).attr("disabled",b?!1:!0),null!==this.options.buttonPrevCallback&&this.buttonPrev.data("jcarouselstate")!=b&&this.buttonPrev.each(function(){c.options.buttonPrevCallback(c,this,b)}).data("jcarouselstate",b)):null!==this.options.buttonPrevCallback&&this.buttonPrevState!=b&&this.options.buttonPrevCallback(c,null,b),this.buttonNextState=a,this.buttonPrevState=b},notify:function(a){var b=null===this.prevFirst?"init":this.prevFirst<this.first?"next":"prev";this.callback("itemLoadCallback",a,b),this.prevFirst!==this.first&&(this.callback("itemFirstInCallback",a,b,this.first),this.callback("itemFirstOutCallback",a,b,this.prevFirst)),this.prevLast!==this.last&&(this.callback("itemLastInCallback",a,b,this.last),this.callback("itemLastOutCallback",a,b,this.prevLast)),this.callback("itemVisibleInCallback",a,b,this.first,this.last,this.prevFirst,this.prevLast),this.callback("itemVisibleOutCallback",a,b,this.prevFirst,this.prevLast,this.first,this.last)},callback:function(b,c,d,e,f,g,h){if(null!=this.options[b]&&("object"==typeof this.options[b]||"onAfterAnimation"==c)){var i="object"==typeof this.options[b]?this.options[b][c]:this.options[b];if(a.isFunction(i)){var j=this;if(void 0===e)i(j,d,c);else if(void 0===f)this.get(e).each(function(){i(j,this,e,d,c)});else for(var k=function(a){j.get(a).each(function(){i(j,this,a,d,c)})},l=e;f>=l;l++)null===l||l>=g&&h>=l||k(l)}}},create:function(a){return this.format("<li></li>",a)},format:function(b,c){b=a(b);for(var d=b.get(0).className.split(" "),e=0;d.length>e;e++)-1!=d[e].indexOf("jcarousel-")&&b.removeClass(d[e]);return b.addClass(this.className("jcarousel-item")).addClass(this.className("jcarousel-item-"+c)).css({"float":this.options.rtl?"right":"left","list-style":"none"}).attr("jcarouselindex",c),b},className:function(a){return a+" "+a+(this.options.vertical?"-vertical":"-horizontal")},dimension:function(b,c){var e=a(b);if(null==c)return this.options.vertical?e.innerHeight()+d.intval(e.css("margin-top"))+d.intval(e.css("margin-bottom"))+d.intval(e.css("border-top-width"))+d.intval(e.css("border-bottom-width"))||d.intval(this.options.itemFallbackDimension):e.innerWidth()+d.intval(e.css("margin-left"))+d.intval(e.css("margin-right"))+d.intval(e.css("border-left-width"))+d.intval(e.css("border-right-width"))||d.intval(this.options.itemFallbackDimension);var f=this.options.vertical?c-d.intval(e.css("marginTop"))-d.intval(e.css("marginBottom")):c-d.intval(e.css("marginLeft"))-d.intval(e.css("marginRight"));return a(e).css(this.wh,f+"px"),this.dimension(e)},clipping:function(){return this.options.vertical?this.clip[0].offsetHeight-d.intval(this.clip.css("borderTopWidth"))-d.intval(this.clip.css("borderBottomWidth")):this.clip[0].offsetWidth-d.intval(this.clip.css("borderLeftWidth"))-d.intval(this.clip.css("borderRightWidth"))},index:function(a,b){return null==b&&(b=this.options.size),Math.round(((a-1)/b-Math.floor((a-1)/b))*b)+1}}),d.extend({defaults:function(c){return a.extend(b,c||{})},intval:function(a){return a=parseInt(a,10),isNaN(a)?0:a},windowLoaded:function(){c=!0},isSafari:function(){var a=navigator.userAgent.toLowerCase(),b=/(chrome)[ \/]([\w.]+)/.exec(a)||/(webkit)[ \/]([\w.]+)/.exec(a)||[],c=b[1]||"";return"webkit"===c}}),a.fn.jcarousel=function(b){if("string"==typeof b){var c=a(this).data("jcarousel"),e=Array.prototype.slice.call(arguments,1);return c[b].apply(c,e)}return this.each(function(){var c=a(this).data("jcarousel");c?(b&&a.extend(c.options,b),c.reload()):a(this).data("jcarousel",new d(this,b))})}})(jQuery);

/*  end jquery.jcarousel.min.js*/

/* jquery.parallax.js*/
(function($){$.fn.parallax=function(userSettings){var options=$.extend({},$.fn.parallax.defaults,userSettings);return this.each(function(){var $this=$(this),isX=options.axis==="x",origPos=($this.css("background-position")||"").split(" "),origX=$this.css("background-position-x")||origPos[0],origY=$this.css("background-position-y")||origPos[1],dist=function(){return -$(window)[isX?"scrollLeft":"scrollTop"]();};$this.css("background-attachment","fixed").addClass("inview");$this.bind("inview",function(e,visible){$this[visible?"addClass":"removeClass"]("inview");});$(window).bind("scroll",function(){if(!$this.hasClass("inview")){return;}var xPos=isX?(dist()*options.speed)+"px":origX,yPos=isX?origY:(dist()*options.speed)+"px";$this.css("background-position",xPos+" "+yPos);});});};$.fn.parallax.defaults={start:0,stop:$(document).height(),speed:1,axis:"x"};})(jQuery);
/*  end jquery.parallax.js*/

/* scripts.js*/
/* fancybox script */
(function(window,document,$){var W=$(window),D=$(document),F=$.fancybox=function(){F.open.apply(this,arguments);},didResize=false,resizeTimer=null;$.extend(F,{version:"2.0.3",defaults:{padding:15,margin:20,width:800,height:600,minWidth:200,minHeight:200,maxWidth:9999,maxHeight:9999,autoSize:true,fitToView:true,aspectRatio:false,topRatio:0.5,fixed:!$.browser.msie||$.browser.version>6,scrolling:"auto",wrapCSS:"fancybox-default",arrows:true,closeBtn:true,closeClick:false,nextClick:false,mouseWheel:true,autoPlay:false,playSpeed:3000,modal:false,loop:true,ajax:{},keys:{next:[13,32,34,39,40],prev:[8,33,37,38],close:[27]},index:0,type:null,href:null,content:null,title:null,tpl:{wrap:'<div class="fancybox-wrap"><div class="fancybox-outer"><div class="fancybox-inner"></div></div></div>',image:'<img class="fancybox-image" src="{href}" alt="" />',iframe:'<iframe class="fancybox-iframe" name="fancybox-frame{rnd}" frameborder="0" hspace="0" '+($.browser.msie?'allowtransparency="true""':"")+' scrolling="{scrolling}" src="{href}"></iframe>',swf:'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="100%" height="100%"><param name="wmode" value="transparent" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="{href}" /><embed src="{href}" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="100%" height="100%" wmode="transparent"></embed></object>',error:'<p class="fancybox-error">The requested content cannot be loaded.<br/>Please try again later.</p>',closeBtn:'<div title="Close" class="fancybox-item fancybox-close"></div>',next:'<a title="Next" class="fancybox-item fancybox-next"><span></span></a>',prev:'<a title="Previous" class="fancybox-item fancybox-prev"><span></span></a>'},openEffect:"elastic",openSpeed:500,openEasing:"swing",openOpacity:true,openMethod:"zoomIn",closeEffect:"fade",closeSpeed:500,closeEasing:"swing",closeOpacity:true,closeMethod:"zoomOut",nextEffect:"elastic",nextSpeed:300,nextEasing:"swing",nextMethod:"changeIn",prevEffect:"elastic",prevSpeed:300,prevEasing:"swing",prevMethod:"changeOut",helpers:{overlay:{speedIn:0,speedOut:0,opacity:0.85,css:{cursor:"pointer","background-color":"rgba(0, 0, 0, 0.85)"},closeClick:true},title:{type:"float"}},onCancel:$.noop,beforeLoad:$.noop,afterLoad:$.noop,beforeShow:$.noop,afterShow:$.noop,beforeClose:$.noop,afterClose:$.noop},group:{},opts:{},coming:null,current:null,isOpen:false,isOpened:false,wrap:null,outer:null,inner:null,player:{timer:null,isActive:false},ajaxLoad:null,imgPreload:null,transitions:{},helpers:{},open:function(group,opts){if(!$.isArray(group)){group=[group];}if(!group.length){return;}F.close(true);F.opts=$.extend(true,{},F.defaults,opts);F.group=group;F._start(F.opts.index||0);},cancel:function(){if(F.coming&&false===F.trigger("onCancel")){return;}F.coming=null;F.hideLoading();if(F.ajaxLoad){F.ajaxLoad.abort();}F.ajaxLoad=null;if(F.imgPreload){F.imgPreload.onload=F.imgPreload.onabort=F.imgPreload.onerror=null;}},close:function(a){F.cancel();if(!F.current||false===F.trigger("beforeClose")){return;}F.unbindEvents();if(!F.isOpen||(a&&a[0]===true)){$(".fancybox-wrap").stop().trigger("onReset").remove();F._afterZoomOut();}else{F.isOpen=F.isOpened=false;$(".fancybox-item").remove();F.wrap.stop(true).removeClass("fancybox-opened");F.inner.css("overflow","hidden");F.transitions[F.current.closeMethod]();}},play:function(a){var clear=function(){clearTimeout(F.player.timer);},set=function(){clear();if(F.current&&F.player.isActive){F.player.timer=setTimeout(F.next,F.current.playSpeed);}},stop=function(){clear();$("body").unbind(".player");F.player.isActive=false;F.trigger("onPlayEnd");},start=function(){if(F.current&&(F.current.loop||F.current.index<F.group.length-1)){F.player.isActive=true;set();$("body").bind({"onCancel.player afterShow.player onUpdate.player":set,"beforeClose.player":stop,"beforeLoad.player":clear});F.trigger("onPlayStart");}};if(F.player.isActive||(a&&a[0]===false)){stop();}else{start();}},next:function(){if(F.current){F.jumpto(F.current.index+1);}},prev:function(){if(F.current){F.jumpto(F.current.index-1);}},jumpto:function(index){if(!F.current){return;}index=parseInt(index,10);if(F.group.length>1&&F.current.loop){if(index>=F.group.length){index=0;}else{if(index<0){index=F.group.length-1;}}}if(typeof F.group[index]!=="undefined"){F.cancel();F._start(index);}},reposition:function(a){if(F.isOpen){F.wrap.css(F._getPosition(a));}},update:function(){if(F.isOpen){if(!didResize){resizeTimer=setInterval(function(){if(didResize){didResize=false;clearTimeout(resizeTimer);if(F.current){if(F.current.autoSize){F.inner.height("auto");F.current.height=F.inner.height();}F._setDimension();if(F.current.canGrow){F.inner.height("auto");}F.reposition();F.trigger("onUpdate");}}},100);}didResize=true;}},toggle:function(){if(F.isOpen){F.current.fitToView=!F.current.fitToView;F.update();}},hideLoading:function(){$("#fancybox-loading").remove();},showLoading:function(){F.hideLoading();$('<div id="fancybox-loading"></div>').click(F.cancel).appendTo("body");},getViewport:function(){return{x:W.scrollLeft(),y:W.scrollTop(),w:W.width(),h:W.height()};},unbindEvents:function(){if(F.wrap){F.wrap.unbind(".fb");}D.unbind(".fb");W.unbind(".fb");},bindEvents:function(){var current=F.current,keys=current.keys;if(!current){return;}W.bind("resize.fb, orientationchange.fb",F.update);if(keys){D.bind("keydown.fb",function(e){if($.inArray(e.target.tagName.toLowerCase(),["input","textarea","select","button"])>-1){return;}if($.inArray(e.keyCode,keys.close)>-1){F.close();e.preventDefault();}else{if($.inArray(e.keyCode,keys.next)>-1){F.next();e.preventDefault();}else{if($.inArray(e.keyCode,keys.prev)>-1){F.prev();e.preventDefault();}}}});}if($.fn.mousewheel&&current.mouseWheel&&F.group.length>1){F.wrap.bind("mousewheel.fb",function(e,delta){if($(e.target).get(0).clientHeight===0||$(e.target).get(0).scrollHeight===$(e.target).get(0).clientHeight){e.preventDefault();F[delta>0?"prev":"next"]();}});}},trigger:function(event){var ret,obj=$.inArray(event,["onCancel","beforeLoad","afterLoad"])>-1?"coming":"current";if(!F[obj]){return;}if($.isFunction(F[obj][event])){ret=F[obj][event].apply(F[obj],Array.prototype.slice.call(arguments,1));}if(ret===false){return false;}if(F[obj].helpers){$.each(F[obj].helpers,function(helper,opts){if(opts&&typeof F.helpers[helper]!=="undefined"&&$.isFunction(F.helpers[helper][event])){F.helpers[helper][event](opts);}});}$.event.trigger(event+".fb");},isImage:function(str){return str&&str.match(/\.(jpg|gif|png|bmp|jpeg)(.*)?$/i);},isSWF:function(str){return str&&str.match(/\.(swf)(.*)?$/i);},_start:function(index){var element=F.group[index]||null,isDom,href,type,rez,coming=$.extend(true,{},F.opts,($.isPlainObject(element)?element:{}),{index:index,element:element});if(typeof coming.margin==="number"){coming.margin=[coming.margin,coming.margin,coming.margin,coming.margin];}if(coming.modal){$.extend(true,coming,{closeBtn:false,closeClick:false,nextClick:false,arrows:false,mouseWheel:false,keys:null,helpers:{overlay:{css:{cursor:"auto"},closeClick:false}}});}F.coming=coming;if(false===F.trigger("beforeLoad")){F.coming=null;return;}if(typeof element==="object"&&(element.nodeType||element instanceof $)){isDom=true;coming.href=$(element).attr("href")||coming.href;coming.title=$(element).attr("title")||coming.title;if($.metadata){$.extend(coming,$(element).metadata());}}type=coming.type;href=coming.href;if(!type){if(isDom){rez=$(element).data("fancybox-type");if(!rez&&element.className){rez=element.className.match(/fancybox\.(\w+)/);rez=rez?rez[1]:false;}}if(rez){type=rez;}else{if(href){if(F.isImage(href)){type="image";}else{if(F.isSWF(href)){type="swf";}else{if(href.match(/^#/)){type="inline";}}}}}if(!type){type=isDom?"inline":"html";}coming.type=type;}if(type==="inline"||type==="html"){if(!coming.content){coming.content=type==="inline"&&href?$(href):element;}if(!coming.content.length){type=null;}}else{coming.href=href||element;if(!coming.href){type=null;}}coming.group=F.group;if(type==="image"){F._loadImage();}else{if(type==="ajax"){F._loadAjax();}else{if(type){F._afterLoad();}else{F._error();}}}},_error:function(){F.coming.type="html";F.coming.minHeight=0;F.coming.autoSize=true;F.coming.content=F.coming.tpl.error;F._afterLoad();},_loadImage:function(){F.imgPreload=new Image();F.imgPreload.onload=function(){this.onload=this.onerror=null;F.coming.width=this.width;F.coming.height=this.height;F._afterLoad();};F.imgPreload.onerror=function(){this.onload=this.onerror=null;F._error();};F.imgPreload.src=F.coming.href;if(!F.imgPreload.complete){F.showLoading();}},_loadAjax:function(){F.showLoading();F.ajaxLoad=$.ajax($.extend({},F.coming.ajax,{url:F.coming.href,error:function(jqXHR,textStatus,errorThrown){if(textStatus!=="abort"){F.coming.content=errorThrown;F._error();}else{F.hideLoading();}},success:function(data,textStatus,jqXHR){if(textStatus==="success"){F.coming.content=data;F._afterLoad();}}}));},_afterLoad:function(){F.hideLoading();if(!F.coming||false===F.trigger("afterLoad",F.current)){F.coming=false;return;}if(F.isOpened){$(".fancybox-item").remove();F.wrap.stop(true).removeClass("fancybox-opened");F.inner.css("overflow","hidden");F.transitions[F.current.prevMethod]();}else{$(".fancybox-wrap").stop().trigger("onReset").remove();F.trigger("afterClose");}F.unbindEvents();F.isOpen=false;F.current=F.coming;F.coming=false;F.wrap=$(F.current.tpl.wrap).addClass("fancybox-tmp "+F.current.wrapCSS).appendTo("body");F.outer=$(".fancybox-outer",F.wrap).css("padding",F.current.padding+"px");F.inner=$(".fancybox-inner",F.wrap);F._setContent();F.trigger("beforeShow");F._setDimension();F.wrap.hide().removeClass("fancybox-tmp");F.bindEvents();F.transitions[F.isOpened?F.current.nextMethod:F.current.openMethod]();},_setContent:function(){var content,loadingBay,current=F.current,type=current.type;switch(type){case"inline":case"ajax":case"html":if(type==="inline"){content=current.content.show().detach();if(content.parent().hasClass("fancybox-inner")){content.parents(".fancybox-wrap").trigger("onReset").remove();}$(F.wrap).bind("onReset",function(){content.appendTo("body").hide();});}else{content=current.content;}if(current.autoSize){loadingBay=$('<div class="fancybox-tmp"></div>').appendTo($("body")).append(content);current.width=loadingBay.outerWidth();current.height=loadingBay.outerHeight(true);content=loadingBay.contents().detach();loadingBay.remove();}break;case"image":content=current.tpl.image.replace("{href}",current.href);current.aspectRatio=true;break;case"swf":content=current.tpl.swf.replace(/\{width\}/g,current.width).replace(/\{height\}/g,current.height).replace(/\{href\}/g,current.href);break;case"iframe":content=current.tpl.iframe.replace("{href}",current.href).replace("{scrolling}",current.scrolling).replace("{rnd}",new Date().getTime());break;}if($.inArray(type,["image","swf","iframe"])>-1){current.autoSize=false;current.scrolling=false;}F.inner.append(content);},_setDimension:function(){var current=F.current,viewport=F.getViewport(),margin=current.margin,padding2=current.padding*2,width=current.width+padding2,height=current.height+padding2,ratio=current.width/current.height,maxWidth=current.maxWidth,maxHeight=current.maxHeight,minWidth=current.minWidth,minHeight=current.minHeight,height_,space;viewport.w-=(margin[1]+margin[3]);viewport.h-=(margin[0]+margin[2]);if(width.toString().indexOf("%")>-1){width=((viewport.w*parseFloat(width))/100);}if(height.toString().indexOf("%")>-1){height=((viewport.h*parseFloat(height))/100);}if(current.fitToView){maxWidth=Math.min(viewport.w,maxWidth);maxHeight=Math.min(viewport.h,maxHeight);}maxWidth=Math.max(minWidth,maxWidth);maxHeight=Math.max(minHeight,maxHeight);if(current.aspectRatio){if(width>maxWidth){width=maxWidth;height=((width-padding2)/ratio)+padding2;}if(height>maxHeight){height=maxHeight;width=((height-padding2)*ratio)+padding2;}if(width<minWidth){width=minWidth;height=((width-padding2)/ratio)+padding2;}if(height<minHeight){height=minHeight;width=((height-padding2)*ratio)+padding2;}}else{width=Math.max(minWidth,Math.min(width,maxWidth));height=Math.max(minHeight,Math.min(height,maxHeight));}width=Math.round(width);height=Math.round(height);$(F.wrap.add(F.outer).add(F.inner)).width("auto").height("auto");F.inner.width(width-padding2).height(height-padding2);F.wrap.width(width);height_=F.wrap.height();if(width>maxWidth||height_>maxHeight){while((width>maxWidth||height_>maxHeight)&&width>minWidth&&height_>minHeight){height=height-10;if(current.aspectRatio){width=Math.round(((height-padding2)*ratio)+padding2);if(width<minWidth){width=minWidth;height=((width-padding2)/ratio)+padding2;}}else{width=width-10;}F.inner.width(width-padding2).height(height-padding2);F.wrap.width(width);height_=F.wrap.height();}}current.dim={width:width,height:height_};current.canGrow=current.autoSize&&height>minHeight&&height<maxHeight;current.canShrink=false;current.canExpand=false;if((width-padding2)<current.width||(height-padding2)<current.height){current.canExpand=true;}else{if((width>viewport.w||height_>viewport.h)&&width>minWidth&&height>minHeight){current.canShrink=true;}}space=height_-padding2;F.innerSpace=space-F.inner.height();F.outerSpace=space-F.outer.height();},_getPosition:function(a){var viewport=F.getViewport(),margin=F.current.margin,width=F.wrap.width()+margin[1]+margin[3],height=F.wrap.height()+margin[0]+margin[2],rez={position:"absolute",top:margin[0]+viewport.y,left:margin[3]+viewport.x};if(F.current.fixed&&(!a||a[0]===false)&&height<=viewport.h&&width<=viewport.w){rez={position:"fixed",top:margin[0],left:margin[3]};}rez.top=Math.ceil(Math.max(rez.top,rez.top+((viewport.h-height)*F.current.topRatio)))+"px";rez.left=Math.ceil(Math.max(rez.left,rez.left+((viewport.w-width)*0.5)))+"px";return rez;},_afterZoomIn:function(){var current=F.current;F.isOpen=F.isOpened=true;F.wrap.addClass("fancybox-opened").css("overflow","visible");F.update();F.inner.css("overflow",current.scrolling==="auto"?"auto":(current.scrolling==="yes"?"scroll":"hidden"));if(current.closeClick||current.nextClick){F.inner.bind("click.fb",current.nextClick?F.next:F.close);}if(current.closeBtn){$(F.current.tpl.closeBtn).appendTo(F.wrap).bind("click.fb",F.close);}if(current.arrows&&F.group.length>1){if(current.loop||current.index>0){$(current.tpl.prev).appendTo(F.wrap).bind("click.fb",F.prev);}if(current.loop||current.index<F.group.length-1){$(current.tpl.next).appendTo(F.wrap).bind("click.fb",F.next);}}F.trigger("afterShow");if(F.opts.autoPlay&&!F.player.isActive){F.opts.autoPlay=false;F.play();}},_afterZoomOut:function(){F.trigger("afterClose");F.wrap.trigger("onReset").remove();$.extend(F,{group:{},opts:{},current:null,isOpened:false,isOpen:false,wrap:null,outer:null,inner:null});}});F.transitions={getOrigPosition:function(){var element=F.current.element,pos={},width=50,height=50,image,viewport;if(element&&element.nodeName&&$(element).is(":visible")){image=$(element).find("img:first");if(image.length){pos=image.offset();width=image.outerWidth();height=image.outerHeight();}else{pos=$(element).offset();}}else{viewport=F.getViewport();pos.top=viewport.y+(viewport.h-height)*0.5;pos.left=viewport.x+(viewport.w-width)*0.5;}pos={top:Math.ceil(pos.top)+"px",left:Math.ceil(pos.left)+"px",width:Math.ceil(width)+"px",height:Math.ceil(height)+"px"};return pos;},step:function(now,fx){var ratio,innerValue,outerValue;if(fx.prop==="width"||fx.prop==="height"){innerValue=outerValue=Math.ceil(now-(F.current.padding*2));if(fx.prop==="height"){ratio=(now-fx.start)/(fx.end-fx.start);if(fx.start>fx.end){ratio=1-ratio;}innerValue-=F.innerSpace*ratio;outerValue-=F.outerSpace*ratio;}F.inner[fx.prop](innerValue);F.outer[fx.prop](outerValue);}},zoomIn:function(){var current=F.current,startPos,endPos,dim=current.dim;if(current.openEffect==="elastic"){endPos=$.extend({},dim,F._getPosition(true));delete endPos.position;startPos=this.getOrigPosition();if(current.openOpacity){startPos.opacity=0;endPos.opacity=1;}F.wrap.css(startPos).show().animate(endPos,{duration:current.openSpeed,easing:current.openEasing,step:this.step,complete:F._afterZoomIn});}else{F.wrap.css($.extend({},dim,F._getPosition()));if(current.openEffect==="fade"){F.wrap.fadeIn(current.openSpeed,F._afterZoomIn);}else{F.wrap.show();F._afterZoomIn();}}},zoomOut:function(){var current=F.current,endPos;if(current.closeEffect==="elastic"){if(F.wrap.css("position")==="fixed"){F.wrap.css(F._getPosition(true));}endPos=this.getOrigPosition();if(current.closeOpacity){endPos.opacity=0;}F.wrap.animate(endPos,{duration:current.closeSpeed,easing:current.closeEasing,step:this.step,complete:F._afterZoomOut});}else{F.wrap.fadeOut(current.closeEffect==="fade"?current.closeSpeed:0,F._afterZoomOut);}},changeIn:function(){var current=F.current,startPos;if(F.current.nextEffect==="elastic"){startPos=F._getPosition(true);startPos.opacity=0;startPos.top=(parseInt(startPos.top,10)-200)+"px";F.wrap.css(startPos).show().animate({opacity:1,top:"+=200px"},{duration:current.nextSpeed,complete:F._afterZoomIn});}else{F.wrap.css(F._getPosition());if(current.nextEffect==="fade"){F.wrap.hide().fadeIn(current.nextSpeed,F._afterZoomIn);}else{F.wrap.show();F._afterZoomIn();}}},changeOut:function(){function cleanUp(){$(this).trigger("onReset").remove();}F.wrap.removeClass("fancybox-opened");if(F.current.prevEffect==="elastic"){F.wrap.animate({"opacity":0,top:"+=200px"},{duration:F.current.prevSpeed,complete:cleanUp});}else{F.wrap.fadeOut(F.current.prevEffect==="fade"?F.current.prevSpeed:0,cleanUp);}}};F.helpers.overlay={overlay:null,update:function(){var width,scrollWidth,offsetWidth;this.overlay.width(0).height(0);if($.browser.msie){scrollWidth=Math.max(document.documentElement.scrollWidth,document.body.scrollWidth);offsetWidth=Math.max(document.documentElement.offsetWidth,document.body.offsetWidth);width=scrollWidth<offsetWidth?W.width():scrollWidth;}else{width=D.width();}this.overlay.width(width).height(D.height());},beforeShow:function(opts){if(this.overlay){return;}this.overlay=$('<div id="fancybox-overlay"></div>').css(opts.css||{background:"black"}).appendTo("body");this.update();if(opts.closeClick){this.overlay.bind("click.fb",F.close);}W.bind("resize.fb",$.proxy(this.update,this));this.overlay.fadeTo(opts.speedIn||"fast",opts.opacity||1);},onUpdate:function(){this.update();},afterClose:function(opts){if(this.overlay){this.overlay.fadeOut(opts.speedOut||"fast",function(){$(this).remove();});}this.overlay=null;}};F.helpers.title={beforeShow:function(opts){var title,text=F.current.title;if(text){title=$('<div class="fancybox-title fancybox-title-'+opts.type+'-wrap">'+text+"</div>").appendTo("body");if(opts.type==="float"){title.width(title.width());title.wrapInner('<span class="child"></span>');F.current.margin[2]+=Math.abs(parseInt(title.css("margin-bottom"),10));}title.appendTo(opts.type==="over"?F.inner:(opts.type==="outside"?F.wrap:F.outer));}}};$.fn.fancybox=function(options){var opts=options||{},selector=this.selector||"";function run(e){var group=[],relType=false,relVal=$(this).data("fancybox-group");e.preventDefault();if(typeof relVal!=="undefined"){relType=relVal?"data-fancybox-group":false;}else{if(this.rel&&this.rel!==""&&this.rel!=="nofollow"){relVal=this.rel;relType="rel";}}if(relType){group=selector.length?$(selector).filter("["+relType+'="'+relVal+'"]'):$("["+relType+'="'+relVal+'"]');}if(group.length){opts.index=group.index(this);F.open(group.get(),opts);}else{F.open(this,opts);}return false;}if(selector){D.undelegate(selector,"click.fb-start").delegate(selector,"click.fb-start",run);}else{$(this).unbind("click.fb-start").bind("click.fb-start",run);}return this;};}(window,document,jQuery));
(function($){var F=$.fancybox;F.helpers.buttons={tpl:'<div id="fancybox-buttons"><ul><li><a class="btnPrev" title="Previous" href="javascript:$.fancybox.prev();">Previous</a></li><li><a class="btnPlay" title="Slideshow" href="javascript:$.fancybox.play();;">Play</a></li><li><a class="btnNext" title="Next" href="javascript:$.fancybox.next();">Next</a></li><li><a class="btnToggle" title="Toggle size" href="javascript:$.fancybox.toggle();">Toggle</a></li><li><a class="btnClose" title="Close" href="javascript:$.fancybox.close();">Close</a></li></ul></div>',list:null,buttons:{},update:function(){var toggle=this.buttons.toggle.removeClass("btnDisabled btnToggleOn");if(F.current.canShrink){toggle.addClass("btnToggleOn");}else{if(!F.current.canExpand){toggle.addClass("btnDisabled");}}},beforeShow:function(){F.current.margin[0]+=30;},onPlayStart:function(){if(this.list){this.buttons.play.text("Pause").addClass("btnPlayOn");}},onPlayEnd:function(){if(this.list){this.buttons.play.text("Play").removeClass("btnPlayOn");}},afterShow:function(opts){var buttons;if(!this.list){this.list=$(opts.tpl||this.tpl).appendTo("body");this.buttons={prev:this.list.find(".btnPrev"),next:this.list.find(".btnNext"),play:this.list.find(".btnPlay"),toggle:this.list.find(".btnToggle")};}buttons=this.buttons;if(F.current.index>0||F.current.loop){buttons.prev.removeClass("btnDisabled");}else{buttons.prev.addClass("btnDisabled");}if(F.current.loop||F.current.index<F.group.length-1){buttons.next.removeClass("btnDisabled");buttons.play.removeClass("btnDisabled");}else{buttons.next.addClass("btnDisabled");buttons.play.addClass("btnDisabled");}this.update();},onUpdate:function(){this.update();},beforeClose:function(){if(this.list){this.list.remove();}this.list=null;this.buttons={};}};}(jQuery));
(function($){var F=$.fancybox;F.helpers.thumbs={wrap:null,list:null,width:0,source:function(el){var img=$(el).find("img");return img.length?img.attr("src"):el.href;},init:function(opts){var that=this,list,thumbWidth=opts.width||50,thumbHeight=opts.height||50,thumbSource=opts.source||this.source;list="";for(var n=0;n<F.group.length;n++){list+='<li><a style="width:'+thumbWidth+"px;height:"+thumbHeight+'px;" href="javascript:$.fancybox.jumpto('+n+');"></a></li>';}this.wrap=$('<div id="fancybox-thumbs"></div>').appendTo("body");this.list=$("<ul>"+list+"</ul>").appendTo(this.wrap);$.each(F.group,function(i){$("<img />").load(function(){var width=this.width,height=this.height,widthRatio,heightRatio,parent;if(!that.list||!width||!height){return;}widthRatio=width/thumbWidth;heightRatio=height/thumbHeight;parent=that.list.children().eq(i).find("a");if(widthRatio>=1&&heightRatio>=1){if(widthRatio>heightRatio){width=Math.floor(width/heightRatio);height=thumbHeight;}else{width=thumbWidth;height=Math.floor(height/widthRatio);}}$(this).css({width:width,height:height,top:Math.floor(thumbHeight/2-height/2),left:Math.floor(thumbWidth/2-width/2)});parent.width(thumbWidth).height(thumbHeight);$(this).hide().appendTo(parent).fadeIn(300);}).attr("src",thumbSource(this));});this.width=this.list.children().eq(0).outerWidth();this.list.width(this.width*(F.group.length+1)).css("left",Math.floor($(window).width()*0.5-(F.current.index*this.width+this.width*0.5)));},update:function(opts){if(this.list){this.list.stop(true).animate({"left":Math.floor($(window).width()*0.5-(F.current.index*this.width+this.width*0.5))},150);}},beforeLoad:function(opts){if(F.group.length<2){F.coming.helpers.thumbs=false;return;}F.coming.margin[2]=opts.height+30;},afterShow:function(opts){if(this.list){this.update(opts);}else{this.init(opts);}this.list.children().removeClass("active").eq(F.current.index).addClass("active");},onUpdate:function(){this.update();},beforeClose:function(){if(this.wrap){this.wrap.remove();}this.wrap=null;this.list=null;this.width=0;}};}(jQuery));(function($){function Countdown(){this.regional=[];this.regional[""]={labels:["Years","Months","Weeks","Days","Hours","Mins","Secs"],labels1:["Year","Month","Week","Day","Hour","Min","Sec"],compactLabels:["y","m","w","d"],whichLabels:null,digits:["0","1","2","3","4","5","6","7","8","9"],timeSeparator:":",isRTL:false};this._defaults={until:null,since:null,timezone:null,serverSync:null,format:"dHMS",layout:"",compact:false,significant:0,description:"",expiryUrl:"",expiryText:"",alwaysExpire:false,onExpiry:null,onTick:null,tickInterval:1};$.extend(this._defaults,this.regional[""]);this._serverSyncs=[];var now=(typeof Date.now=="function"?Date.now:function(){return new Date().getTime();});var perfAvail=(window.performance&&typeof window.performance.now=="function");function timerCallBack(timestamp){var drawStart=(timestamp<1000000000000?(perfAvail?(performance.now()+performance.timing.navigationStart):now()):timestamp||now());if(drawStart-animationStartTime>=1000){plugin._updateTargets();animationStartTime=drawStart;}requestAnimationFrame(timerCallBack);}var requestAnimationFrame=window.requestAnimationFrame||window.webkitRequestAnimationFrame||window.mozRequestAnimationFrame||window.oRequestAnimationFrame||window.msRequestAnimationFrame||null;var animationStartTime=0;if(!requestAnimationFrame||$.noRequestAnimationFrame){$.noRequestAnimationFrame=null;setInterval(function(){plugin._updateTargets();},980);}else{animationStartTime=window.animationStartTime||window.webkitAnimationStartTime||window.mozAnimationStartTime||window.oAnimationStartTime||window.msAnimationStartTime||now();requestAnimationFrame(timerCallBack);}}var Y=0;var O=1;var W=2;var D=3;var H=4;var M=5;var S=6;$.extend(Countdown.prototype,{markerClassName:"hasCountdown",propertyName:"countdown",_rtlClass:"countdown_rtl",_sectionClass:"countdown_section",_amountClass:"countdown_amount",_rowClass:"countdown_row",_holdingClass:"countdown_holding",_showClass:"countdown_show",_descrClass:"countdown_descr",_timerTargets:[],setDefaults:function(options){this._resetExtraLabels(this._defaults,options);$.extend(this._defaults,options||{});},UTCDate:function(tz,year,month,day,hours,mins,secs,ms){if(typeof year=="object"&&year.constructor==Date){ms=year.getMilliseconds();secs=year.getSeconds();mins=year.getMinutes();hours=year.getHours();day=year.getDate();month=year.getMonth();year=year.getFullYear();}var d=new Date();d.setUTCFullYear(year);d.setUTCDate(1);d.setUTCMonth(month||0);d.setUTCDate(day||1);d.setUTCHours(hours||0);d.setUTCMinutes((mins||0)-(Math.abs(tz)<30?tz*60:tz));d.setUTCSeconds(secs||0);d.setUTCMilliseconds(ms||0);return d;},periodsToSeconds:function(periods){return periods[0]*31557600+periods[1]*2629800+periods[2]*604800+periods[3]*86400+periods[4]*3600+periods[5]*60+periods[6];},_attachPlugin:function(target,options){target=$(target);if(target.hasClass(this.markerClassName)){return;}var inst={options:$.extend({},this._defaults),_periods:[0,0,0,0,0,0,0]};target.addClass(this.markerClassName).data(this.propertyName,inst);this._optionPlugin(target,options);},_addTarget:function(target){if(!this._hasTarget(target)){this._timerTargets.push(target);}},_hasTarget:function(target){return($.inArray(target,this._timerTargets)>-1);},_removeTarget:function(target){this._timerTargets=$.map(this._timerTargets,function(value){return(value==target?null:value);});},_updateTargets:function(){for(var i=this._timerTargets.length-1;i>=0;i--){this._updateCountdown(this._timerTargets[i]);}},_optionPlugin:function(target,options,value){target=$(target);var inst=target.data(this.propertyName);if(!options||(typeof options=="string"&&value==null)){var name=options;options=(inst||{}).options;return(options&&name?options[name]:options);}if(!target.hasClass(this.markerClassName)){return;}options=options||{};if(typeof options=="string"){var name=options;options={};options[name]=value;}if(options.layout){options.layout=options.layout.replace(/&lt;/g,"<").replace(/&gt;/g,">");}this._resetExtraLabels(inst.options,options);var timezoneChanged=(inst.options.timezone!=options.timezone);$.extend(inst.options,options);this._adjustSettings(target,inst,options.until!=null||options.since!=null||timezoneChanged);var now=new Date();if((inst._since&&inst._since<now)||(inst._until&&inst._until>now)){this._addTarget(target[0]);}this._updateCountdown(target,inst);},_updateCountdown:function(target,inst){var $target=$(target);inst=inst||$target.data(this.propertyName);if(!inst){return;}$target.html(this._generateHTML(inst)).toggleClass(this._rtlClass,inst.options.isRTL);if($.isFunction(inst.options.onTick)){var periods=inst._hold!="lap"?inst._periods:this._calculatePeriods(inst,inst._show,inst.options.significant,new Date());if(inst.options.tickInterval==1||this.periodsToSeconds(periods)%inst.options.tickInterval==0){inst.options.onTick.apply(target,[periods]);}}var expired=inst._hold!="pause"&&(inst._since?inst._now.getTime()<inst._since.getTime():inst._now.getTime()>=inst._until.getTime());if(expired&&!inst._expiring){inst._expiring=true;if(this._hasTarget(target)||inst.options.alwaysExpire){this._removeTarget(target);if($.isFunction(inst.options.onExpiry)){inst.options.onExpiry.apply(target,[]);}if(inst.options.expiryText){var layout=inst.options.layout;inst.options.layout=inst.options.expiryText;this._updateCountdown(target,inst);inst.options.layout=layout;}if(inst.options.expiryUrl){window.location=inst.options.expiryUrl;}}inst._expiring=false;}else{if(inst._hold=="pause"){this._removeTarget(target);}}$target.data(this.propertyName,inst);},_resetExtraLabels:function(base,options){var changingLabels=false;for(var n in options){if(n!="whichLabels"&&n.match(/[Ll]abels/)){changingLabels=true;break;}}if(changingLabels){for(var n in base){if(n.match(/[Ll]abels[02-9]|compactLabels1/)){base[n]=null;}}}},_adjustSettings:function(target,inst,recalc){var now;var serverOffset=0;var serverEntry=null;for(var i=0;i<this._serverSyncs.length;i++){if(this._serverSyncs[i][0]==inst.options.serverSync){serverEntry=this._serverSyncs[i][1];break;}}if(serverEntry!=null){serverOffset=(inst.options.serverSync?serverEntry:0);now=new Date();}else{var serverResult=($.isFunction(inst.options.serverSync)?inst.options.serverSync.apply(target,[]):null);now=new Date();serverOffset=(serverResult?now.getTime()-serverResult.getTime():0);this._serverSyncs.push([inst.options.serverSync,serverOffset]);}var timezone=inst.options.timezone;timezone=(timezone==null?-now.getTimezoneOffset():timezone);if(recalc||(!recalc&&inst._until==null&&inst._since==null)){inst._since=inst.options.since;if(inst._since!=null){inst._since=this.UTCDate(timezone,this._determineTime(inst._since,null));if(inst._since&&serverOffset){inst._since.setMilliseconds(inst._since.getMilliseconds()+serverOffset);}}inst._until=this.UTCDate(timezone,this._determineTime(inst.options.until,now));if(serverOffset){inst._until.setMilliseconds(inst._until.getMilliseconds()+serverOffset);}}inst._show=this._determineShow(inst);},_destroyPlugin:function(target){target=$(target);if(!target.hasClass(this.markerClassName)){return;}this._removeTarget(target[0]);target.removeClass(this.markerClassName).empty().removeData(this.propertyName);},_pausePlugin:function(target){this._hold(target,"pause");},_lapPlugin:function(target){this._hold(target,"lap");},_resumePlugin:function(target){this._hold(target,null);},_hold:function(target,hold){var inst=$.data(target,this.propertyName);if(inst){if(inst._hold=="pause"&&!hold){inst._periods=inst._savePeriods;var sign=(inst._since?"-":"+");inst[inst._since?"_since":"_until"]=this._determineTime(sign+inst._periods[0]+"y"+sign+inst._periods[1]+"o"+sign+inst._periods[2]+"w"+sign+inst._periods[3]+"d"+sign+inst._periods[4]+"h"+sign+inst._periods[5]+"m"+sign+inst._periods[6]+"s");this._addTarget(target);}inst._hold=hold;inst._savePeriods=(hold=="pause"?inst._periods:null);$.data(target,this.propertyName,inst);this._updateCountdown(target,inst);}},_getTimesPlugin:function(target){var inst=$.data(target,this.propertyName);return(!inst?null:(inst._hold=="pause"?inst._savePeriods:(!inst._hold?inst._periods:this._calculatePeriods(inst,inst._show,inst.options.significant,new Date()))));},_determineTime:function(setting,defaultTime){var offsetNumeric=function(offset){var time=new Date();time.setTime(time.getTime()+offset*1000);return time;};var offsetString=function(offset){offset=offset.toLowerCase();var time=new Date();var year=time.getFullYear();var month=time.getMonth();var day=time.getDate();var hour=time.getHours();var minute=time.getMinutes();var second=time.getSeconds();var pattern=/([+-]?[0-9]+)\s*(s|m|h|d|w|o|y)?/g;var matches=pattern.exec(offset);while(matches){switch(matches[2]||"s"){case"s":second+=parseInt(matches[1],10);break;case"m":minute+=parseInt(matches[1],10);break;case"h":hour+=parseInt(matches[1],10);break;case"d":day+=parseInt(matches[1],10);break;case"w":day+=parseInt(matches[1],10)*7;break;case"o":month+=parseInt(matches[1],10);day=Math.min(day,plugin._getDaysInMonth(year,month));break;case"y":year+=parseInt(matches[1],10);day=Math.min(day,plugin._getDaysInMonth(year,month));break;}matches=pattern.exec(offset);}return new Date(year,month,day,hour,minute,second,0);};var time=(setting==null?defaultTime:(typeof setting=="string"?offsetString(setting):(typeof setting=="number"?offsetNumeric(setting):setting)));if(time){time.setMilliseconds(0);}return time;},_getDaysInMonth:function(year,month){return 32-new Date(year,month,32).getDate();},_normalLabels:function(num){return num;},_generateHTML:function(inst){var self=this;inst._periods=(inst._hold?inst._periods:this._calculatePeriods(inst,inst._show,inst.options.significant,new Date()));var shownNonZero=false;var showCount=0;var sigCount=inst.options.significant;var show=$.extend({},inst._show);for(var period=Y;period<=S;period++){shownNonZero|=(inst._show[period]=="?"&&inst._periods[period]>0);show[period]=(inst._show[period]=="?"&&!shownNonZero?null:inst._show[period]);showCount+=(show[period]?1:0);sigCount-=(inst._periods[period]>0?1:0);}var showSignificant=[false,false,false,false,false,false,false];for(var period=S;period>=Y;period--){if(inst._show[period]){if(inst._periods[period]){showSignificant[period]=true;}else{showSignificant[period]=sigCount>0;sigCount--;}}}var labels=(inst.options.compact?inst.options.compactLabels:inst.options.labels);var whichLabels=inst.options.whichLabels||this._normalLabels;var showCompact=function(period){var labelsNum=inst.options["compactLabels"+whichLabels(inst._periods[period])];return(show[period]?self._translateDigits(inst,inst._periods[period])+(labelsNum?labelsNum[period]:labels[period])+" ":"");};var showFull=function(period){var labelsNum=inst.options["labels"+whichLabels(inst._periods[period])];return((!inst.options.significant&&show[period])||(inst.options.significant&&showSignificant[period])?'<span class="'+plugin._sectionClass+'">'+'<span class="'+plugin._amountClass+'">'+self._translateDigits(inst,inst._periods[period])+"</span><br/>"+(labelsNum?labelsNum[period]:labels[period])+"</span>":"");};return(inst.options.layout?this._buildLayout(inst,show,inst.options.layout,inst.options.compact,inst.options.significant,showSignificant):((inst.options.compact?'<span class="'+this._rowClass+" "+this._amountClass+(inst._hold?" "+this._holdingClass:"")+'">'+showCompact(Y)+showCompact(O)+showCompact(W)+showCompact(D)+(show[H]?this._minDigits(inst,inst._periods[H],2):"")+(show[M]?(show[H]?inst.options.timeSeparator:"")+this._minDigits(inst,inst._periods[M],2):"")+(show[S]?(show[H]||show[M]?inst.options.timeSeparator:"")+this._minDigits(inst,inst._periods[S],2):""):'<span class="'+this._rowClass+" "+this._showClass+(inst.options.significant||showCount)+(inst._hold?" "+this._holdingClass:"")+'">'+showFull(Y)+showFull(O)+showFull(W)+showFull(D)+showFull(H)+showFull(M)+showFull(S))+"</span>"+(inst.options.description?'<span class="'+this._rowClass+" "+this._descrClass+'">'+inst.options.description+"</span>":"")));},_buildLayout:function(inst,show,layout,compact,significant,showSignificant){var labels=inst.options[compact?"compactLabels":"labels"];var whichLabels=inst.options.whichLabels||this._normalLabels;var labelFor=function(index){return(inst.options[(compact?"compactLabels":"labels")+whichLabels(inst._periods[index])]||labels)[index];};var digit=function(value,position){return inst.options.digits[Math.floor(value/position)%10];};var subs={desc:inst.options.description,sep:inst.options.timeSeparator,yl:labelFor(Y),yn:this._minDigits(inst,inst._periods[Y],1),ynn:this._minDigits(inst,inst._periods[Y],2),ynnn:this._minDigits(inst,inst._periods[Y],3),y1:digit(inst._periods[Y],1),y10:digit(inst._periods[Y],10),y100:digit(inst._periods[Y],100),y1000:digit(inst._periods[Y],1000),ol:labelFor(O),on:this._minDigits(inst,inst._periods[O],1),onn:this._minDigits(inst,inst._periods[O],2),onnn:this._minDigits(inst,inst._periods[O],3),o1:digit(inst._periods[O],1),o10:digit(inst._periods[O],10),o100:digit(inst._periods[O],100),o1000:digit(inst._periods[O],1000),wl:labelFor(W),wn:this._minDigits(inst,inst._periods[W],1),wnn:this._minDigits(inst,inst._periods[W],2),wnnn:this._minDigits(inst,inst._periods[W],3),w1:digit(inst._periods[W],1),w10:digit(inst._periods[W],10),w100:digit(inst._periods[W],100),w1000:digit(inst._periods[W],1000),dl:labelFor(D),dn:this._minDigits(inst,inst._periods[D],1),dnn:this._minDigits(inst,inst._periods[D],2),dnnn:this._minDigits(inst,inst._periods[D],3),d1:digit(inst._periods[D],1),d10:digit(inst._periods[D],10),d100:digit(inst._periods[D],100),d1000:digit(inst._periods[D],1000),hl:labelFor(H),hn:this._minDigits(inst,inst._periods[H],1),hnn:this._minDigits(inst,inst._periods[H],2),hnnn:this._minDigits(inst,inst._periods[H],3),h1:digit(inst._periods[H],1),h10:digit(inst._periods[H],10),h100:digit(inst._periods[H],100),h1000:digit(inst._periods[H],1000),ml:labelFor(M),mn:this._minDigits(inst,inst._periods[M],1),mnn:this._minDigits(inst,inst._periods[M],2),mnnn:this._minDigits(inst,inst._periods[M],3),m1:digit(inst._periods[M],1),m10:digit(inst._periods[M],10),m100:digit(inst._periods[M],100),m1000:digit(inst._periods[M],1000),sl:labelFor(S),sn:this._minDigits(inst,inst._periods[S],1),snn:this._minDigits(inst,inst._periods[S],2),snnn:this._minDigits(inst,inst._periods[S],3),s1:digit(inst._periods[S],1),s10:digit(inst._periods[S],10),s100:digit(inst._periods[S],100),s1000:digit(inst._periods[S],1000)};var html=layout;for(var i=Y;i<=S;i++){var period="yowdhms".charAt(i);var re=new RegExp("\\{"+period+"<\\}([\\s\\S]*)\\{"+period+">\\}","g");html=html.replace(re,((!significant&&show[i])||(significant&&showSignificant[i])?"$1":""));}$.each(subs,function(n,v){var re=new RegExp("\\{"+n+"\\}","g");html=html.replace(re,v);});return html;},_minDigits:function(inst,value,len){value=""+value;if(value.length>=len){return this._translateDigits(inst,value);}value="0000000000"+value;return this._translateDigits(inst,value.substr(value.length-len));},_translateDigits:function(inst,value){return(""+value).replace(/[0-9]/g,function(digit){return inst.options.digits[digit];});},_determineShow:function(inst){var format=inst.options.format;var show=[];show[Y]=(format.match("y")?"?":(format.match("Y")?"!":null));show[O]=(format.match("o")?"?":(format.match("O")?"!":null));show[W]=(format.match("w")?"?":(format.match("W")?"!":null));show[D]=(format.match("d")?"?":(format.match("D")?"!":null));show[H]=(format.match("h")?"?":(format.match("H")?"!":null));show[M]=(format.match("m")?"?":(format.match("M")?"!":null));show[S]=(format.match("s")?"?":(format.match("S")?"!":null));return show;},_calculatePeriods:function(inst,show,significant,now){inst._now=now;inst._now.setMilliseconds(0);var until=new Date(inst._now.getTime());if(inst._since){if(now.getTime()<inst._since.getTime()){inst._now=now=until;}else{now=inst._since;}}else{until.setTime(inst._until.getTime());if(now.getTime()>inst._until.getTime()){inst._now=now=until;}}var periods=[0,0,0,0,0,0,0];if(show[Y]||show[O]){var lastNow=plugin._getDaysInMonth(now.getFullYear(),now.getMonth());var lastUntil=plugin._getDaysInMonth(until.getFullYear(),until.getMonth());var sameDay=(until.getDate()==now.getDate()||(until.getDate()>=Math.min(lastNow,lastUntil)&&now.getDate()>=Math.min(lastNow,lastUntil)));var getSecs=function(date){return(date.getHours()*60+date.getMinutes())*60+date.getSeconds();};var months=Math.max(0,(until.getFullYear()-now.getFullYear())*12+until.getMonth()-now.getMonth()+((until.getDate()<now.getDate()&&!sameDay)||(sameDay&&getSecs(until)<getSecs(now))?-1:0));periods[Y]=(show[Y]?Math.floor(months/12):0);periods[O]=(show[O]?months-periods[Y]*12:0);now=new Date(now.getTime());var wasLastDay=(now.getDate()==lastNow);var lastDay=plugin._getDaysInMonth(now.getFullYear()+periods[Y],now.getMonth()+periods[O]);if(now.getDate()>lastDay){now.setDate(lastDay);}now.setFullYear(now.getFullYear()+periods[Y]);now.setMonth(now.getMonth()+periods[O]);if(wasLastDay){now.setDate(lastDay);}}var diff=Math.floor((until.getTime()-now.getTime())/1000);var extractPeriod=function(period,numSecs){periods[period]=(show[period]?Math.floor(diff/numSecs):0);diff-=periods[period]*numSecs;};extractPeriod(W,604800);extractPeriod(D,86400);extractPeriod(H,3600);extractPeriod(M,60);extractPeriod(S,1);if(diff>0&&!inst._since){var multiplier=[1,12,4.3482,7,24,60,60];var lastShown=S;var max=1;for(var period=S;period>=Y;period--){if(show[period]){if(periods[lastShown]>=max){periods[lastShown]=0;diff=1;}if(diff>0){periods[period]++;diff=0;lastShown=period;max=1;}}max*=multiplier[period];}}if(significant){for(var period=Y;period<=S;period++){if(significant&&periods[period]){significant--;}else{if(!significant){periods[period]=0;}}}}return periods;}});var getters=["getTimes"];function isNotChained(command,otherArgs){if(command=="option"&&(otherArgs.length==0||(otherArgs.length==1&&typeof otherArgs[0]=="string"))){return true;}return $.inArray(command,getters)>-1;}$.fn.countdown=function(options){var otherArgs=Array.prototype.slice.call(arguments,1);if(isNotChained(options,otherArgs)){return plugin["_"+options+"Plugin"].apply(plugin,[this[0]].concat(otherArgs));}return this.each(function(){if(typeof options=="string"){if(!plugin["_"+options+"Plugin"]){throw"Unknown command: "+options;}plugin["_"+options+"Plugin"].apply(plugin,[this].concat(otherArgs));}else{plugin._attachPlugin(this,options||{});}});};var plugin=$.countdown=new Countdown();})(jQuery);
/* end fancybox script */

/* retina script */
(function($){var retinaReplace=function(element,options){this.options=options;var $el=$(element);var is_image=$el.is("img");var normal_url=is_image?$el.attr("src"):$el.backgroundImageUrl();var retina_url=this.options.generateUrl($el,normal_url);$("<img/>").attr("src",retina_url).load(function(){if(is_image){$el.attr("src",$(this).attr("src"));}else{$el.backgroundImageUrl($(this).attr("src"));$el.backgroundSize($(this)[0].width,$(this)[0].height);}$el.attr("data-retina","complete");});};retinaReplace.prototype={constructor:retinaReplace};$.fn.retinaReplace=function(option){if(getDevicePixelRatio()<=1){return this;}return this.each(function(){var $this=$(this);var data=$this.data("retinaReplace");var options=$.extend({},$.fn.retinaReplace.defaults,$this.data(),typeof option=="object"&&option);if(!data){$this.data("retinaReplace",(data=new retinaReplace(this,options)));}if(typeof option=="string"){data[option]();}});};$.fn.retinaReplace.defaults={suffix:"_r",generateUrl:function(element,url){var dot_index=url.lastIndexOf(".");var extension=url.substr(dot_index+1);var file=url.substr(0,dot_index);return file+this.suffix+"."+extension;}};$.fn.retinaReplace.Constructor=retinaReplace;var getDevicePixelRatio=function(){if(window.devicePixelRatio===undefined){return 1;}return window.devicePixelRatio;};$.fn.backgroundImageUrl=function(url){return url?this.each(function(){$(this).css("background-image",'url("'+url+'")');}):$(this).css("background-image").replace(/url\(|\)|"|'/g,"");};$.fn.backgroundSize=function(retinaWidth,retinaHeight){var sizeValue=Math.floor(retinaWidth/2)+"px "+Math.floor(retinaHeight/2)+"px";$(this).css("background-size",sizeValue);$(this).css("-webkit-background-size",sizeValue);};$(function(){$("[data-retina='true']").retinaReplace();});})(window.jQuery);var getDevicePixelRatio=function(){if(window.devicePixelRatio===undefined){return 1;}return window.devicePixelRatio;};function retinaProducts(){if(getDevicePixelRatio()>1){jQuery(".product-retina").each(function(){jQuery(this).attr("src",jQuery(this).attr("data-image2x"));});}}jQuery(document).ready(function(){retinaProducts();});
/* end retina script */

(function ($) {

    "use strict";

    function ProductImgHeight() {
        var imgHeight = 0;
        $.each($('.product .product-image-wrapper'), function(){
            imgHeight = $(this).find('img').height();
            $(this).height(imgHeight);
            $(this).parent('.product').next('.preview').find('.wrapper .big_image').height(imgHeight);
        });
    }

    function PreviewInit() {

        var product = $('.product');
        var preview = $('.preview');

        product.find('.product-image-wrapper.onhover').mouseenter(function () {
            preview.stop(true, true).hide();
            $(this).parent().addClass('hover');
            $(this).parent().next(preview).stop(true, true).show();

            var pos = $(this).parent().position();
            var width = $(this).outerWidth();
            var width1 = $(this).parent().next(preview).outerWidth();
            var width2 = width1 - width;
            $(this).parent().next(preview).css({
                top: pos.top + 10 + "px",
                left: (pos.left - width2 + 30) + "px"
            });
            $(this).parent().next(preview).find("small").css({
                top: pos.top + 10 + "px",
                left: (pos.left - width2 + 30) + "px"
            });

        });

        product.mouseleave( function () {
            $(this).delay(300).queue(function(){
                $(this).stop(true, false).removeClass('hover');
                $(this).dequeue();
            });
        });

        preview.mouseleave( function () {
            $(this).prev(product).delay(300).queue(function(){
                $(this).stop(true, false).removeClass('hover');
                $(this).dequeue();
            });
            $(this).stop(true, false).hide();
            $(this).delay(300).queue(function(){
                $(this).stop(true, false).removeClass('hover');
                $(this).dequeue();
            });
            $('.big_image a img', this).attr('src', $('.big_image a img', this).attr("data-rel"));
        });

        preview.find("a.image").mouseenter(function () {
            $(this).parent().next().find('.big_image a img').stop(true, true).animate({
                opacity: 0
            }, 200);
            var image = $(this).attr("data-rel");
            $(this).parent().next().find('.big_image a img').attr('src', image);
            $(this).parent().next().find('.big_image a img').stop(true, true).animate({
                opacity: 1
            }, 800);
            return false;
        });
    }

    function TopSlider(flexSliderTop) {
        var container = $(".container");
        var w0 = $(document).width();
        var w1 = (w0 - container.width()) * 0.5 - 0;
        if (!flexSliderTop.parent().hasClass('container')){
            flexSliderTop.find(".flex-direction-nav .flex-next").css({
                "right": w1 + "px"
            });
            flexSliderTop.find(".flex-direction-nav .flex-prev").css({
                "left": w1 + "px"
            });
            flexSliderTop.find(".next-slider").css({
                "right": w1 + "px"
            });
            flexSliderTop.find(".prev-slider").css({
                "left": w1 + "px"
            });
        }

    };

    function elementsAnimate() {
        var windowWidth = window.innerWidth || document.documentElement.clientWidth;
        var animate = $('.animate');
        var animateDelay = $('.animate-delay-outer');
        var animateDelayItem = $('.animate-delay');
        if (windowWidth > 767 && !isiPhone()) {
            animate.bind('inview', function (event, visible) {
                if (visible && !$(this).hasClass("animated")) {
                    $(this).addClass("animated");
                }
            });
            animateDelay.bind('inview', function (event, visible) {
                if (visible && !$(this).hasClass("animated")) {
                    var j = -1;
                    var $this = $(this).find(".animate-delay");
                    $this.each(function () {
                        var $this = jQuery(this);
                        j++;
                        setTimeout(function () {
                            $this.addClass("animated");
                        }, 200 * j);
                    });
                    $(this).addClass("animated");
                }
            });
        } else {
            animate.each(function () {
                $(this).removeClass('animate');
            });
            animateDelayItem.each(function () {
                $(this).removeClass('animate-delay');
            });
        }
    }

    function isTouchDevice() {
        return (typeof (window.ontouchstart) != 'undefined') ? true : false;
    }

    function isiPhone() {
        return (
            (navigator.userAgent.toLowerCase().indexOf("iphone") > -1) ||
                (navigator.userAgent.toLowerCase().indexOf("ipod") > -1)
            );
    }
    var resize_picholder;

    function resizePicHolder() {
        var windowWidth = window.innerWidth || document.documentElement.clientWidth;
        var ppPicHolder = $('.pp_pic_holder');
        var left_pic_holder = windowWidth - ppPicHolder.width();
        ppPicHolder.animate({
            left: left_pic_holder / 2
        });
    }

    $(document).ready(function () {


        var product = $('.product');
        var preview = $('.preview');
        var windowWidth = window.innerWidth || document.documentElement.clientWidth;
        var pageBody = $('body');
        var priceSlider = $("#noUiSlider");
        var cloudZoom = $('#CloudZoom');
        var cloudGallery = $('.cloudzoom-gallery');
        var cloudGalleryOuter = $('.product-more-views ul');
        var listingSort = $('.sort-by');
        var isotopeOuter = $('.isotope-outer');
        var selectCustom = $("select.custom");
        var flexSliderBanners = $('.flexslider.banners');
        var flexSliderTop = $(".flexslider.big");
        var flexContentCarousel = $('.flexslider.carousel-content');
        var flexTestimonials = $('.carousel-testimonials .flexslider');
        var flexSliderSmall = $('.flexslider.small');
        var imageCloudZoom = $('.product-image img.cloudzoom');
        var carousel = $('.carousel');
        var hoverfold = $('#hoverfold');
        var accordion = $('.accordion');
        var contentTab = $('.contentTab');
        var tableStripped = $("table.striped");
        var navigation = $("nav");
        var footer = $("#footer");
        var footerPopup = $("#footer_popup");
        var rightToolbar = $("#right_toolbar");
        var productVerticalCarousel = $('.flexslider.vertical');
        var topLink = $('#topline .fadelink, .header_v_2 .fadelink');
        var headerShop = $("#header .shoppingcart .fadelink");
        var rightShop = $("#right_toolbar .shoppingcart");
        var rightSearch = $("#right_toolbar .form-search");
        var arrowPrev = $(".es-nav-prev");
        var arrowNext = $(".es-nav-next");
        var arrowPrev1 = $(".direction-nav a.prev");
        var arrowNext1 = $(".direction-nav a.next");
        var arrowPrev2 = $(".flexslider.vertical .flex-prev");
        var arrowNext2 = $(".flexslider.vertical .flex-next");
        var arrowPrev3 = $('.carousel_prev');
        var arrowNext3 = $('.carousel_next');
        var progressBar = $('.progress .bar');
        var smallPreview = $(".small_preview");
        var shoppingCartMini = $(".shopping_cart_mini");
        var ppPicHolder = $('.pp_pic_holder');
        var backTop = $('#back-top a');
        var optionImage = $(".product-info .option-image img");

        optionImage.click(function() {
            optionImage.removeClass('image_border');
            $(this).addClass('image_border');
        });


        footer.click(function () {
            if (!jQuery(this).find("i.icon-up").hasClass("icon-down")) {
                if (footerPopup.hasClass("allowHover") && footerPopup.css('position') == 'absolute') {
                    footerPopup.stop(true, false).slideDown(300);
                    jQuery(this).find("i.icon-up").addClass("icon-down");
                }
            } else {
                if (footerPopup.hasClass("allowHover") && footerPopup.css('position') == 'absolute') {
                    footerPopup.stop(true, false).slideUp(300);
                    jQuery(this).find("i.icon-up").removeClass("icon-down");
                }
            }
        });

        if (isTouchDevice()) {
            var mobileHover = function () {
                $('*').on('touchstart', function () {
                    $(this).trigger('hover');
                }).on('touchend', function () {
                        $(this).trigger('hover');
                    });
            };
            mobileHover();
            pageBody.addClass('touch')
            /*
             footer.click(function () {
             if (!jQuery(this).find("i.icon-up").hasClass("icon-down")) {
             if (footerPopup.hasClass("allowHover") && footerPopup.css('position') == 'absolute') {
             footerPopup.stop(true, false).slideDown(300);
             jQuery(this).find("i.icon-up").addClass("icon-down");
             }
             } else {
             if (footerPopup.hasClass("allowHover") && footerPopup.css('position') == 'absolute') {
             footerPopup.stop(true, false).slideUp(300);
             jQuery(this).find("i.icon-up").removeClass("icon-down");
             }
             }
             });
             */

            topLink.click(function () {
                $(".ul_wrapper").each(function () {
                    jQuery(this).fadeOut(0)
                })
                if (!$(this).hasClass('open')) {
                    topLink.each(function () {
                        $(this).removeClass('open');
                    })
                    $(this).find(".ul_wrapper").fadeIn(200, "linear");
                    $(this).addClass('open');
                } else {
                    $(this).find(".ul_wrapper").fadeOut(200, "linear");
                    $(this).removeClass('open');
                }
            });
        } else {
            pageBody.addClass('notouch');
            /*

             $('div.noHover').hover(function () {
             footerPopup.toggleClass("allowHover");
             });

             footer.hover(function () {
             if (footerPopup.hasClass("allowHover") && footerPopup.css('position') == 'absolute') {
             footerPopup.stop(true, false).slideDown(300);
             jQuery(this).find("i.icon-up").addClass("icon-down");
             }
             }, function () {
             if (footerPopup.hasClass("allowHover") && footerPopup.css('position') == 'absolute') {
             footerPopup.stop(true, false).slideUp(100);
             $(this).find("i.icon-up").removeClass("icon-down");
             }
             });

             */


            //topLink.hover(function () {
            //$(this).find(".ul_wrapper").stop(true).fadeToggle(200, "linear");
            //});

            topLink.click(function() {
                $(this).find(".ul_wrapper").stop(true, true).toggle();
            });

            topLink.mouseleave(function() {
                $(this).find(".ul_wrapper").stop(true, true).fadeOut(200, "linear");
            });




            if ($(".parallax").length > 0) $(".parallax").parallax({
                speed: 0,
                axis: "y"
            });
        }

        if (isiPhone()) {
            pageBody.addClass('iphone')
        };




        /*	DETECT IF IE */

        var trident = !! navigator.userAgent.match(/Trident\/7.0/);
        var net = !! navigator.userAgent.match(/.NET4.0E/);
        var IE11 = trident && net
        var IEold = (navigator.userAgent.match(/MSIE/i) ? true : false);
        if (IE11 || IEold) {
            jQuery('body').addClass('msie');
        } else {
            jQuery('body').addClass('no_msie')
        }



        PreviewInit();
        rightToolbar.hide();

        // product listing view as

        var viewGrid = $(".view-grid"),
            viewList = $(".view-list"),
            productList = $(".product-listing");
        viewGrid.click(function (e) {
            $('.preview').stop(true, true).hide();

            productList.removeClass("product-list").addClass("product-grid");
            if (isotopeOuter.length != 0) {
                isotopeOuter.isotope('reLayout');
            }
            e.preventDefault()
        });
        viewList.click(function (e) {
            productList.removeClass("product-grid").addClass("product-list");
            if (isotopeOuter.length != 0) {
                isotopeOuter.isotope('reLayout');
            }
            e.preventDefault()
        })




        // begin collapsed menu
        $('label.tree-toggler').each(function () {
            if ($(this).parent().find('ul.nav-list').length != 0) {
                $(this).append("<span class='collapse_button'>+</span>");
            }
        });
        $('label.tree-toggler span.collapse_button').click(function () {
            if (!$(this).parent().parent().hasClass('active')) {
                $(this).html('&#8211;');
                $(this).addClass('collapsed');
                $(this).parent().parent().children('ul.nav-list').show(300);
                $(this).parent().parent().addClass('active');
            } else {
                $(this).html('+');
                $(this).removeClass('collapsed');
                $(this).parent().parent().find('ul.nav-list').hide(300);
                $(this).parent().parent().removeClass('active');
                $(this).parent().parent().find('li').removeClass('active');
                $(this).parent().parent().find('span.collapse_button').html('+');
            }
        });
        //  end collapsed menu




        // price slider

        priceSlider.empty().noUiSlider('init', {
            scale: [0, 2000],
            start: [0, 800],
            step: false,
            change: function () {
                var values = $(this).noUiSlider('value');
                $(this).find('.noUi-lowerHandle .infoBox').text('$' + values[0]);
                $(this).find('.noUi-upperHandle .infoBox').text('$' + values[1]);

            }
        }).find('.noUi-handle div').each(function (index) {

                $(this).append('<span class="infoBox">$' + $(this).parent().parent().noUiSlider('value')[index] + '</span>');

            });


        if (cloudZoom.length != 0) {
            cloudZoom.CloudZoom({
                zoomMatchSize: true,
                //zoomPosition: "inside",
                autoInside: true,
                captionSource: "none"
            });
            cloudGallery.CloudZoom();
        }


        listingSort.change(function () {
            //console.log("Selected Option:" + $(this).val());
            product.removeClass('hover');
            preview.hide();
            isotopeOuter.isotope({
                sortBy: $(this).val()
            });
        });

        selectCustom.each(function () {
            $(this).selectbox();
        })

        // change accordion caret when collapsing
        accordion.find('.accordion-toggle').click(function () {
            if ($(this).hasClass('collapsed')) {
                accordion.find('.accordion-toggle').not(this).addClass('collapsed');
            }
        })
        // tabs
        contentTab.find('a').click(function (e) {
            e.preventDefault();
            jQuery(this).tab('show');
        })
        // stripped table
        tableStripped.find("tr:odd").addClass("odd");

        // collapse top navigation menu
        navigation.find(".collapse").collapse();


        headerShop.mouseenter(function () {
            jQuery(this).parent().find(".shopping_cart_mini").stop(true, true).fadeIn(200, "linear");


        });

        headerShop.mouseleave(function () {
            jQuery(this).parent().find(".shopping_cart_mini").stop(true, true).fadeOut(200, "linear");
        });

        rightShop.mouseenter(function () {
            jQuery(this).find(".shopping_cart_mini").stop(true, true).fadeIn(200, "linear");
        });

        rightShop.mouseleave(function () {
            jQuery(this).find(".shopping_cart_mini").stop(true, true).fadeOut(200, "linear");
        });


        rightSearch.mouseenter(function () {
            $(this).find('input').animate({
                right: 48,
                width: 275
            }, 300);
        });
        rightSearch.mouseleave(function () {
            $(this).find('input').stop(true, false).animate({
                right: 20,
                width: 0
            }, 300);
        });


        //  content carousel - our services page
        flexContentCarousel.flexslider({
            animation: "slide",
            pauseOnHover: true,
            controlNav: false,
            animationSpeed: 300,
            prevText: "<i class='prev icon-left-thin'></i>",
            nextText: "<i class='next icon-right-thin'></i>"

        });

        //  content carousel - our services page
        flexTestimonials.flexslider({
            animation: "slide",
            pauseOnHover: true,
            controlNav: false,
            animationSpeed: 300,
            prevText: "<i class='prev icon-left-thin'></i>",
            nextText: "<i class='next icon-right-thin'></i>"

        });

        //  banner slider on side column

        flexSliderBanners.flexslider({
            animation: "slide",
            pauseOnHover: true,
            controlNav: false,
            prevText: "<i class='icon-left-thin'></i>",
            nextText: "<i class='icon-right-thin'></i>"

        });




        // products carousel
        carousel.each(function () {
            $(this).elastislide({
                speed: 600
            });
        })
        // related product vertical carousel

        productVerticalCarousel.flexslider({
            animation: "slide",
            autoplay: false,
            minItems: 2,
            direction: "vertical",
            pauseOnHover: true,
            controlNav: false,
            prevText: "<i class='icon-down'></i>",
            nextText: "<i class='icon-up'></i>"

        });

        // top slider  on listing page
        flexSliderSmall.flexslider({
            animation: "slide",
            pauseOnHover: true,
            controlNav: false,
            prevText: "<i class='icon-left-thin'></i>",
            nextText: "<i class='icon-right-thin'></i>"

        });
        // big slider  on home page

        if (flexSliderTop.length != 0) {
            flexSliderTop.flexslider({
                animation: "slide",
                controlNav: false,
                prevText: "<i class='icon-left-thin'></i>",
                nextText: "<i class='icon-right-thin'></i>",
                start: function (slider) {
                    flexSliderTop.find('li > a > img').animate({
                        'opacity': 1
                    });
                    elementsAnimate();
                }
            });
        } else {
            elementsAnimate();
        }

        var carousel_tabs = $("#carousel_tabs>a");

        carousel_tabs.click(function () {
            carousel_tabs.removeClass("active");
            $(this).addClass("active");
            $("#carousel_tabs_content .carousel").hide();
            var t_content = jQuery(this).attr("href");
            $(t_content).show();
            ProductImgHeight();
            return false;
        })
        $("#carousel_tabs>a:first").trigger("click");


        TopSlider(flexSliderTop);


        //3D gallery

        if (hoverfold.length != 0) {

            //start the hoverfold plugin

            Modernizr.load({
                test: Modernizr.csstransforms3d && Modernizr.csstransitions,
                yep: ['js/jquery.hoverfold.js'],
                nope: 'css/fallback.css',
                callback: function (url, result, key) {

                    if (url === 'js/jquery.hoverfold.js') {
                        $('#hoverfold div').hoverfold();
                    }

                }
            });

            var $container = hoverfold;

            $container.isotope({
                itemSelector: '.span4'
            });


            var $optionSets = jQuery('#options .option-set'),
                $optionLinks = $optionSets.find('a');

            $optionLinks.click(function () {
                $('.preview').stop(true, true).hide();
                var $this = $(this);
                // don't proceed if already selected
                if ($this.hasClass('selected')) {
                    return false;
                }
                var $optionSet = $this.parents('.option-set');
                $optionSet.find('.selected').removeClass('selected');
                $this.addClass('selected');

                // make option object dynamically, i.e. { filter: '.my-filter-class' }
                var options = {},
                    key = $optionSet.attr('data-option-key'),
                    value = $this.attr('data-option-value');
                // parse 'false' as false boolean
                value = value === 'false' ? false : value;
                options[key] = value;
                if (key === 'layoutMode' && typeof changeLayoutMode === 'function') {
                    // changes in layout modes need extra logic
                    changeLayoutMode($this, options)
                } else {
                    // otherwise, apply new options
                    $container.isotope(options);
                }

                return false;
            });
        }



        $('#back-top a').hover(function () {
            $(this).stop().animate({
                "opacity": 0.6
            });
        }, function () {
            jQuery(this).stop().animate({
                "opacity": 1
            });
        });

        $('#back-top a').click(function () {
            $('body,html').animate({
                scrollTop: 0
            }, 400);
            return false;
        });

        // small previews on hover

        arrowPrev.hover(function () {
            if (!$(this).hasClass("disable")) {
                $(this).parent().parent().find(".small_preview.prev").stop(true, true).fadeToggle(400, "linear");
            }
        });

        arrowNext.hover(function () {
            if (!$(this).hasClass("disable")) {
                $(this).parent().parent().find(".small_preview.next").stop(true, true).fadeToggle(400, "linear");
            }
        });
        arrowPrev.mouseleave(function () {
            $(".small_preview.prev").stop(true, true).fadeOut(100, "linear");
        });

        arrowNext.mouseleave(function () {
            $(".small_preview.next").stop(true, true).fadeOut(100, "linear");
        });


        arrowPrev1.hover(function () {
            $(this).parent().find(".small_preview.prev").stop(true, true).fadeToggle(400, "linear");
        });
        arrowNext1.hover(function () {
            $(this).parent().find(".small_preview.next").stop(true, true).fadeToggle(400, "linear");
        });


        arrowPrev2.hover(function () {
            if (!$(this).hasClass("disabled")) {
                $(this).parent().parent().parent().find(".small_preview.prev").stop(true, true).fadeToggle(400, "linear");
            }
        });
        arrowNext2.hover(function () {
            if (!$(this).hasClass("disabled")) {
                $(this).parent().parent().parent().find(".small_preview.next").stop(true, true).fadeToggle(400, "linear");
            }
        });
        arrowPrev3.mouseleave(function () {
            jQuery(this).parent().parent().find(".small_preview.prev").stop(true, true).fadeOut(100, "linear");
        });

        arrowNext3.mouseleave(function () {
            jQuery(this).parent().parent().find(".small_preview.next").stop(true, true).fadeOut(100, "linear");
        });

        // PROGRESS BAR
        progressBar.each(function () {

            var val = parseInt(jQuery(this).attr('data-width'), 10),
                len = val + '%';



            jQuery(this).css('width', len);

        });


        // modal popup

        var $modalpopup = $('.modal');

        $modalpopup.modal('hide');
        $modalpopup.find('.close').click(function () {
            //console.log('close');
            $(this).closest('.modal').modal("hide");
        });


        function GalleryZoomScroll(windowWidth) {
            //console.log('GalleryZoomScroll');
            var elevateZoom = $(".elevate-zoom img.elevatezoom");

            var zoomH = elevateZoom.height();
            var zoomW = elevateZoom.width();
            var zoomPos = 1;
            var zoomType = 'window';
            if (windowWidth < 769) {
                //zoomType = 'inner';
            }
            if (elevateZoom.length != 0) {

                elevateZoom.elevateZoom({
                    responsive: true,
                    easing: false,
                    zoomType: zoomType,
                    cursor: "crosshair",
                    showLens: true,
                    zoomWindowPosition: zoomPos,
                    zoomWindowHeight: zoomH,
                    zoomWindowWidth: zoomW,
                    gallery: "elevate-gallery",
                    galleryActiveClass: 'active',
                    imageCrossfade: true,
                    onZoomedImageLoaded: function () {
                        if (jQuery(".zoomWrapper").length != 0) {

                            var PreviewSliderHeight = function () {
                                var big_image_height = elevateZoom.height();
                                var preview_image_height = $(".elevate-gallery").find('li:first-child').height();
                                var slider_height = Math.round(big_image_height / preview_image_height) * preview_image_height;
                                $(".jcarousel-skin-previews").find('.jcarousel-clip-vertical').css({
                                    "min-height": slider_height + "px"
                                });
                            };

                            // small thumbnails vertical carousel

                            cloudGalleryOuter.jcarousel({
                                vertical: true,
                                scroll: 3,
                                buttonNextHTML: '<a class="btn"><i class="icon-up"></i></a>',
                                buttonPrevHTML: '<a class="btn"><i class="icon-down"></i></a>',
                                itemLoadCallback: PreviewSliderHeight
                            });
                        }
                    }
                })
            }
            //pass the images to Fancybox
            if ($(".elevate-zoom.fancybox").length != 0) {
                elevateZoom.bind("click", function (e) {
                    //console.log('click');
                    var ez = elevateZoom.data('elevateZoom');
                    $.fancybox(ez.getGalleryList());
                    return false;
                });
            }
        }
        GalleryZoomScroll(windowWidth);

        $(window).resize(function () {
            // remove elevateZoom
            var elevateZoom = $(".elevate-zoom img.elevatezoom");
            $('.zoomContainer').each(function () {
                $(this).remove();
                //console.log('remove');
            })
            $.removeData(elevateZoom, 'elevateZoom');
            if (elevateZoom.parent('.zoomWrapper').length > 0) {
                var zoom_img = elevateZoom.clone();
                $(".elevate-zoom > .zoomWrapper").replaceWith(zoom_img);
            }
            GalleryZoomScroll(windowWidth);



            /* fix dropdown */
            var windowWidth = window.innerWidth || document.documentElement.clientWidth;

            if (windowWidth > 1199) {
                var menuWidth = $('.container').width() - $('#logo').width() - 30;
                $('#nav .level0 ul.level0').each(function () {
                    $(this).css({
                        'width': menuWidth + 'px'
                        //'marginLeft': $('#logo').width() + 65 + 'px'
                    });
                })

                var menuSpyWidth = $('.container').width() - $('.spy_logo').width() - 10;
                $('#spy #nav .level0 ul.level0').each(function () {
                    $(this).css({
                        'width': menuSpyWidth + 'px'
                        //'marginLeft': $('.spy_logo').width() + 10 + 'px'
                    });
                })

            }
            else {
                $('#nav .level0 ul.level0').each(function () {
                    $(this).css({
                        'width': '',
                        'marginLeft': ''
                    });
                })
            }

            /*fix dropdown*/




        })


        $(window).scroll(function () {
            <!--SPY-->
            if ($(".container").width() > 767) {


                if ($(this).scrollTop() > $('#header .wrapper_w').height() + 60 + $('#topline').height()) {
                    $('#spy').addClass('fix');
                } else {
                    $('#spy').removeClass('fix');
                }
            }
            if ($(this).scrollTop() > 150) {
                rightToolbar.fadeIn();
            } else {
                if (rightToolbar.find(".shopping_cart_mini").css("display") == "block") {
                    rightToolbar.find(".shopping_cart_mini").fadeOut();
                }
                rightToolbar.fadeOut();
            }
        });

        $(window).resize(function () {
            preview.hide();
            smallPreview.hide();
            shoppingCartMini.hide();
            TopSlider(flexSliderTop);
            ProductImgHeight();

            if (isotopeOuter.length != 0) {
                isotopeOuter.isotope('reLayout');
            }
            if (hoverfold.length != 0) {
                hoverfold.isotope('reLayout');
            }
            if (ppPicHolder.length != 0) {}
            clearTimeout(resize_picholder);
            resize_picholder = setTimeout(function () {
                resizePicHolder();
            }, 100);
        });


    })
    $(window).load(function () {
        var isotopeOuter = $('.isotope-outer');
        var mainNav = $('#nav');
        var spy = $('#spy');
        var cloudGalleryOuter = $('.product-more-views:not(.elevate-gallery) ul');
        var imageCloudZoom = $('.product-image img.cloudzoom');
        var windowWidth = window.innerWidth || document.documentElement.clientWidth;

        ProductImgHeight();

        if (isotopeOuter.length != 0) {
            var $container = isotopeOuter;
            if (isotopeOuter.find('.product')[0]) {
                $container.isotope({
                    itemSelector: '.product',
                    getSortData: {
                        name: function ($elem) {
                            return $elem.find('.product-name a ').text();
                        },
                        price: function ($elem) {
                            return parseFloat($elem.find('.sort-price').text());
                        },
                        rating: function ($elem) {
                            return parseFloat($elem.find('.sort-rating').text());
                        }
                    }

                });
            }
            if (isotopeOuter.find('.post-preview-small')[0]) {
                $container.isotope({
                    itemSelector: '.post-preview-small'
                });
                var $optionSets = $('#options .option-set'),
                    $optionLinks = $optionSets.find('a');
                $optionLinks.click(function () {
                    var $this = $(this);
                    // don't proceed if already selected
                    if ($this.hasClass('selected')) {
                        return false;
                    }
                    var $optionSet = $this.parents('.option-set');
                    $optionSet.find('.selected').removeClass('selected');
                    $this.addClass('selected');

                    // make option object dynamically, i.e. { filter: '.my-filter-class' }
                    var options = {},
                        key = $optionSet.attr('data-option-key'),
                        value = $this.attr('data-option-value');
                    // parse 'false' as false boolean
                    value = value === 'false' ? false : value;
                    options[key] = value;
                    if (key === 'layoutMode' && typeof changeLayoutMode === 'function') {
                        // changes in layout modes need extra logic
                        changeLayoutMode($this, options)
                    } else {
                        // otherwise, apply new options
                        $container.isotope(options);
                    }
                    return false;
                });
            }
        }

        var $optionSets = jQuery(".filters-by-category .option-set"),
            $optionLinks = $optionSets.find("a");

        $optionLinks.click(function () {
            var $this = $(this);
            if ($this.hasClass("selected")) return false;
            var $optionSet = $this.parents(".option-set");
            $optionSet.find(".selected").removeClass("selected");
            $this.addClass("selected");
            var options = {}, key = $optionSet.attr("data-option-key"),
                value = $this.attr("data-option-value");
            value = value === "false" ? false : value;
            options[key] = value;
            if (key === "layoutMode" && typeof changeLayoutMode === "function") changeLayoutMode($this, options);
            else if (isotopeOuter.length != 0) {isotopeOuter.isotope(options);}
            return false
        });


        if (mainNav.length) {
            spy.find('nav').html($('#nav:first').clone());
            spy.find('nav li').removeClass('hover');
        }
        //spy.find('.spyshop').html(jQuery('#cart').clone());


        var PreviewSliderHeight = function () {
            var big_image_height = imageCloudZoom.height();
            var preview_image_height = cloudGalleryOuter.find('li:first-child').height();
            var slider_height = Math.round(big_image_height / preview_image_height) * preview_image_height;
            //console.log(big_image_height);
            //console.log(slider_height);
            $(".jcarousel-skin-previews").find('.jcarousel-clip-vertical').css({
                "min-height": slider_height + "px"
            });
        };

        // small thumbnails vertical carousel

        cloudGalleryOuter.jcarousel({
            vertical: true,
            scroll: 3,
            buttonNextHTML: '<a class="btn"><i class="icon-up"></i></a>',
            buttonPrevHTML: '<a class="btn"><i class="icon-down"></i></a>',
            itemLoadCallback: PreviewSliderHeight
        });



        /*contact popup*/

        var butOpenPopup =  $('.contact-button');
        var contactPopup =  $('#contact-popup');
        var contactPopupClose =  $('.close-popup');

        butOpenPopup.click(function (e) {
            if($('#spy').hasClass('fix')){ var popupTop = 0} else { popupTop = 25}
            if (contactPopup.hasClass('open')){contactPopup.removeClass('open').stop(true, false).animate({ top: "-1000px"}, 500);}
            else {contactPopup.addClass('open').stop(true, false).animate({ top:  popupTop + 'px'}, 500);}
            e.preventDefault();
        });
        contactPopupClose.click(function (e) {
            if (contactPopup.hasClass('open')){contactPopup.removeClass('open').stop(true, false).animate({ top: "-1000px"}, 500);}
            e.preventDefault();
        });


        /*fix menu dpopdown*/
        var categoriesHeight = $('.list_in_column').height();
        var categoriesImageHeight = $('.menu-image-right').height();

        if (categoriesImageHeight > categoriesHeight) {
            var blockHeight = categoriesImageHeight  + 'px';
        } else {
            var blockHeight = categoriesHeight  + 'px';
        }

        $('.rows_outer').each(function () {
            $(this).css({
                'min-height': categoriesImageHeight
            });
        })

        var windowWidth = window.innerWidth || document.documentElement.clientWidth;

        if (windowWidth > 1199) {
            var menuWidth = $('.container').width() - $('#logo').width() - 30;
            $('#nav .level0 ul.level0').each(function () {
                $(this).css({
                    'width': menuWidth + 'px'
                    //'marginLeft': $('#logo').width() + 65 + 'px'
                });
            })

            var menuSpyWidth = $('.container').width() - $('.spy_logo').width() - 10;
            $('#spy #nav .level0 ul.level0').each(function () {
                $(this).css({
                    'width': menuSpyWidth + 'px'
                    //'marginLeft': $('.spy_logo').width() + 10 + 'px'
                });
            })

        }






    })


})(jQuery);

/*developer changes */
$(document).ready(function(){

    $('#header #cart > .heading a').live('click', function() {
        $('#header #cart').addClass('active');
        $('#header #cart').load('index.php?route=module/cart #cart > *');
        $('#header #cart').live('mouseleave', function() {
            $(this).removeClass('active');
        });
    });

    $('#spy #cart > .heading a').live('click', function() {
        $('#spy #cart').addClass('active');
        $('#spy #cart').load('index.php?route=module/cart #cart > *');
        $('#spy #cart').live('mouseleave', function() {
            $(this).removeClass('active');
        });
    });


    $("#header #cart .cart-close").live('click', function() {
        $('#header #cart').removeClass('active');
    });

    $("#spy #cart .cart-close").live('click', function() {
        $('#spy #cart').removeClass('active');
    });

    /*
     $(document).click( function(event){
     if( $(event.target).closest('#header #cart').length)
     return;
     $('#header #cart').removeClass('active');
     event.stopPropagation();
     });


     $(document).click( function(event){
     if( $(event.target).closest('#spy #cart').length)
     return;
     $('#spy #cart').removeClass('active');
     event.stopPropagation();
     });
     */


});



/* functions from common.js */
function addToCart_theme(product_id, quantity) {
    quantity = typeof(quantity) != 'undefined' ? quantity : 1;

    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: 'product_id=' + product_id + '&quantity=' + quantity,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information, .error').remove();
            if (json['redirect']) {
                location = json['redirect'];
            }
            if (json['success']) {
                $('#notification').html('<div class="preloader"><div class="success_ev" style="display: none;">' + json['success'] + '</div></div>');
                $('.success_ev').fadeIn('slow');

                var str=json['total'];
                var myArray = str.split(' ');

                //console.log(myArray[0]);
                $('#header #cart').removeClass('active');
                $('#spy #cart').removeClass('active');

                $('#spy #cart-total').html(myArray[0]);
                $('#header #cart-total').html(myArray[0]);

                //$('#cart .heading a.btn').click();
                //jQuery.fancybox.close();

                //$('html, body').animate({ scrollTop: 0 }, 'slow');
                setTimeout(function(){
                    jQuery('.success_ev').fadeOut();
                },1500)

            }
        }
    });
}

function addToWishList_theme(product_id) {
    $.ajax({
        url: 'index.php?route=account/wishlist/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();
            if (json['success']) {
                //$('.fancybox-close').click();
                //$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
                $('#notification').html('<div class="preloader"><div class="success_ev" style="display: none;">' + json['success'] + '</div></div>');
                //$('.success').fadeIn('slow');
                $('.success_ev').fadeIn('slow');
                $('#wishlist-total').html(json['total']);
                //jQuery.fancybox.close();
                setTimeout(function(){
                    jQuery('.success_ev').fadeOut();
                },1500)

            }
        }
    });
}

function addToCompare_theme(product_id) {
    $.ajax({
        url: 'index.php?route=product/compare/add',
        type: 'post',
        data: 'product_id=' + product_id,
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, .information').remove();
            if (json['success']) {
                $('#notification').html('<div class="preloader"><div class="success_ev" style="display: none;">' + json['success'] + '</div></div>');
                $('.success_ev').fadeIn('slow');
                $('#compare-total').html(json['total']);
                //jQuery.fancybox.close();
                setTimeout(function(){
                    jQuery('.success_ev').fadeOut();
                },1500)
            }
        }
    });
}
/* //functions from common.js */
/*spy panel*/
jQuery(function() {
    jQuery(window).scroll(function() {
        if (jQuery(".container").width()>767){
            if (jQuery(this).scrollTop() > jQuery ('#header .wrapper_w').height() +60+ jQuery ('#topline').height()) {
                jQuery('#spy').addClass('fix');
                if(jQuery('#nav').length) {
                    jQuery('#spy nav').html(jQuery('#nav:first').clone());
                }
                if(jQuery('#logo').length) {
                    jQuery('#spy .spy_logo').html(jQuery('.logo_inner:first').clone());
                }
                jQuery('#spy .spyshop_search').html(jQuery('.pull-right.padding-1 .form-search-wrapper #search').clone());
                $('#spy .button-search').bind('click', function() {
                    url = $('base').attr('href') + 'index.php?route=product/search';
                    var search = $('input[name=\'search\']').attr('value');
                    if (search) {
                        url += '&search=' + encodeURIComponent(search);
                    }
                    location = url;
                });
                $('#spy input[name=\'search\']').bind('keydown', function(e) {
                    if (e.keyCode == 13) {
                        url = $('base').attr('href') + 'index.php?route=product/search';
                        var search = $('#spy input[name=\'search\']').attr('value');
                        if (search) {
                            url += '&search=' + encodeURIComponent(search);
                        }
                        location = url;
                    }
                });
                jQuery('#spy .spyshop').html(jQuery('.pull-right.padding-1.cart_module #cart').clone());
            } else {
                jQuery('#spy').removeClass('fix');
            }}
    });

    var qty=$('#qty');
    $('#increase').on('click',function(){
        var currentVal = parseInt(qty.val());
        if (!isNaN(currentVal)) {
            qty.val(currentVal + 1);
        }
    });
    $('#decrease').on('click',function(){
        var currentVal = parseInt(qty.val());
        if (!isNaN(currentVal) && currentVal > 0) {
            qty.val(currentVal - 1);
        }
    });




});

/*spy panel*/
function quickBox(product_id, slider) {
    jQuery('#quickview-'+product_id+'-'+slider+' .quickviewblock .product-img-box').html(jQuery('.main-image-'+product_id + ' .first-main-image-'+product_id+':first').clone());
    jQuery('.fancybox').fancybox({
        hideOnContentClick : false,
        width: 876,
        height:450,
        margin:0,
        padding:0,
        autoDimensions: true,
        showTitle: false,
        scrolling: 'no',

        onComplete: function(){
            jQuery('.fancybox-default').load(function () {
                jQuery('.fancybox-default').height(jQuery(this).contents().height());
                jQuery.fancybox.resize();
            });
        }
    });
}

$('.fancybox-close').live('click', function() {
    $('.quickviewblock .product-img-box .first-main-image').remove();
});


/* ajax search */
function doLiveSearch( ev, keywords ) {

    if( ev.keyCode == 38 || ev.keyCode == 40 ) {
        return false;
    }

    $('#livesearch_search_results').remove();
    updown = -1;

    if( keywords == '' || keywords.length < 2 ) {
        return false;
    }
    keywords = encodeURI(keywords);

    $.ajax({url: $('base').attr('href') + 'index.php?route=product/search/ajax&keyword=' + keywords, dataType: 'json', success: function(result) {
        if( result.length > 0 ) {
            var eList = document.createElement('ul');
            eList.id = 'livesearch_search_results';
            var eListElem;
            var eLink;
            for( var i in result ) {
                eListElem = document.createElement('li');
                eLink = document.createElement('a');
                eLink.appendChild( document.createTextNode(result[i].name) );
                if( typeof(result[i].href) != 'undefined' ) {
                    eLink.href = result[i].href;
                }
                else {
                    eLink.href = $('base').attr('href') + 'index.php?route=product/product&product_id=' + result[i].product_id + '&keyword=' + keywords;
                }
                eListElem.appendChild(eLink);
                eList.appendChild(eListElem);
            }
            if( $('#livesearch_search_results').length > 0 ) {
                $('#livesearch_search_results').remove();
            }
            $('#search').append(eList);
        }
    }});

    return true;
}

function upDownEvent( ev ) {
    var elem = document.getElementById('livesearch_search_results');
    var fkey = $('#search').find('[name=search]').first();

    if( elem ) {
        var length = elem.childNodes.length - 1;

        if( updown != -1 && typeof(elem.childNodes[updown]) != 'undefined' ) {
            $(elem.childNodes[updown]).removeClass('highlighted');
        }

        // Up
        if( ev.keyCode == 38 ) {
            updown = ( updown > 0 ) ? --updown : updown;
        }
        else if( ev.keyCode == 40 ) {
            updown = ( updown < length ) ? ++updown : updown;
        }

        if( updown >= 0 && updown <= length ) {
            $(elem.childNodes[updown]).addClass('highlighted');

            var text = elem.childNodes[updown].childNodes[0].text;
            if( typeof(text) == 'undefined' ) {
                text = elem.childNodes[updown].childNodes[0].innerText;
            }

            $('#search').find('[name=search]').first().val( new String(text).replace(/(\s\(.*?\))$/, '') );
        }
    }

    return false;
}

var updown = -1;
/* end ajax search */


$(function(){
    // Bind a click event to a Cloud Zoom instance.
    $('#CloudZoom').bind('click',function(){
        // On click, get the Cloud Zoom object,
        var cloudZoom = $(this).data('CloudZoom');
        // Close the zoom window (from 2.1 rev 1211291557)
        cloudZoom.closeZoom();
        // and pass Cloud Zoom's image list to Fancy Box.
        $.fancybox.open(cloudZoom.getGalleryList());
        return false;
    });

    /* collapsed menu */
    $(".nav-list .top_menu").live('click', function() {
        $(this).next('.nav-list .open_block_first').toggleClass('seen');
        $(this).children().last().toggleClass('icon-up');
        //console.log($(this).children().first());
    });
    $(".nav-list .open_icon").each( function() {
        $(this).click( function() {
            $(this).next('.nav-list .open_block').toggleClass('seen');
            $(this).toggleClass('icon-up');

        });
    });

    /* collapsed menu */

    /*
     var footer = $("#footer");
     var footerPopup = $("#footer_popup");


     footer.click(function () {
     footerPopup.stop(true, true).toggle();
     $("i.icon-up").stop(true, true).toggleClass("flaticon-key22");

     });

     */

    /* ajax search */

    $('#search').find('[name=search]').first().keyup(function(ev){
        doLiveSearch(ev, this.value);
    }).focus(function(ev){
            doLiveSearch(ev, this.value);
        }).keydown(function(ev){
            upDownEvent( ev );
        }).blur(function(){
            window.setTimeout("$('#livesearch_search_results').remove();updown=0;", 1500);
        });
    $(document).bind('keydown', function(ev) {
        try {
            if( ev.keyCode == 13 && $('.highlighted').length > 0 ) {
                document.location.href = $('.highlighted').find('a').first().attr('href');
            }
        }
        catch(e) {}
    });

    /* end ajax search */


});
/* end  scripts.js*/

/* navigation.js  */
(function($){$(window).load(function(){var $dropdowns=$("li.dropdown");var deviceAgent=navigator.userAgent.toLowerCase();var agentID=deviceAgent.match(/(iphone|ipod|ipad)/);if(agentID){if("ontouchstart" in document.documentElement){$dropdowns.each(function(){var $this=$(this);this.addEventListener("touchstart",function(e){if(e.touches.length===1){e.stopPropagation();if(!$this.hasClass("hover")){if(e.target===this||e.target.parentNode===this){e.preventDefault();}$dropdowns.removeClass("hover");$this.addClass("hover");$("#nav").addClass("focus");document.addEventListener("touchstart",closeDropdown=function(e){e.stopPropagation();$dropdowns.removeClass("hover");$this.removeClass("hover");$("#nav").removeClass("focus");document.removeEventListener("touchstart",closeDropdown);});}}},false);});}}else{$dropdowns.on("mouseover",function(){var $this=$(this);if($this.prop("hoverTimeout")){$this.prop("hoverTimeout",clearTimeout($this.prop("hoverTimeout")));}$this.prop("hoverIntent",setTimeout(function(){$this.addClass("hover");}));}).on("mouseleave",function(){var $this=$(this);if($this.prop("hoverIntent")){$this.prop("hoverIntent",clearTimeout($this.prop("hoverIntent")));}$this.prop("hoverTimeout",setTimeout(function(){$this.removeClass("hover");}));});}});})($);
/* end  navigation.js  */

/*smooting scroll in Chrome*/
function ssc_init(){if(!document.body)return;var e=document.body;var t=document.documentElement;var n=window.innerHeight;var r=e.scrollHeight;ssc_root=document.compatMode.indexOf("CSS")>=0?t:e;ssc_activeElement=e;ssc_initdone=true;if(top!=self){ssc_frame=true}else if(r>n&&(e.offsetHeight<=n||t.offsetHeight<=n)){ssc_root.style.height="auto";if(ssc_root.offsetHeight<=n){var i=document.createElement("div");i.style.clear="both";e.appendChild(i)}}if(!ssc_fixedback){e.style.backgroundAttachment="scroll";t.style.backgroundAttachment="scroll"}if(ssc_keyboardsupport){ssc_addEvent("keydown",ssc_keydown)}}function ssc_scrollArray(e,t,n,r){r||(r=1e3);ssc_directionCheck(t,n);ssc_que.push({x:t,y:n,lastX:t<0?.99:-.99,lastY:n<0?.99:-.99,start:+(new Date)});if(ssc_pending){return}var i=function(){var s=+(new Date);var o=0;var u=0;for(var a=0;a<ssc_que.length;a++){var f=ssc_que[a];var l=s-f.start;var c=l>=ssc_animtime;var h=c?1:l/ssc_animtime;if(ssc_pulseAlgorithm){h=ssc_pulse(h)}var p=f.x*h-f.lastX>>0;var d=f.y*h-f.lastY>>0;o+=p;u+=d;f.lastX+=p;f.lastY+=d;if(c){ssc_que.splice(a,1);a--}}if(t){var v=e.scrollLeft;e.scrollLeft+=o;if(o&&e.scrollLeft===v){t=0}}if(n){var m=e.scrollTop;e.scrollTop+=u;if(u&&e.scrollTop===m){n=0}}if(!t&&!n){ssc_que=[]}if(ssc_que.length){setTimeout(i,r/ssc_framerate+1)}else{ssc_pending=false}};setTimeout(i,0);ssc_pending=true}function ssc_wheel(e){if(!ssc_initdone){ssc_init()}var t=e.target;var n=ssc_overflowingAncestor(t);if(!n||e.defaultPrevented||ssc_isNodeName(ssc_activeElement,"embed")||ssc_isNodeName(t,"embed")&&/\.pdf/i.test(t.src)){return true}var r=e.wheelDeltaX||0;var i=e.wheelDeltaY||0;if(!r&&!i){i=e.wheelDelta||0}if(Math.abs(r)>1.2){r*=ssc_stepsize/120}if(Math.abs(i)>1.2){i*=ssc_stepsize/120}ssc_scrollArray(n,-r,-i);e.preventDefault()}function ssc_keydown(e){var t=e.target;var n=e.ctrlKey||e.altKey||e.metaKey;if(/input|textarea|embed/i.test(t.nodeName)||t.isContentEditable||e.defaultPrevented||n){return true}if(ssc_isNodeName(t,"button")&&e.keyCode===ssc_key.spacebar){return true}var r,i=0,s=0;var o=ssc_overflowingAncestor(ssc_activeElement);var u=o.clientHeight;if(o==document.body){u=window.innerHeight}switch(e.keyCode){case ssc_key.up:s=-ssc_arrowscroll;break;case ssc_key.down:s=ssc_arrowscroll;break;case ssc_key.spacebar:r=e.shiftKey?1:-1;s=-r*u*.9;break;case ssc_key.pageup:s=-u*.9;break;case ssc_key.pagedown:s=u*.9;break;case ssc_key.home:s=-o.scrollTop;break;case ssc_key.end:var a=o.scrollHeight-o.scrollTop-u;s=a>0?a+10:0;break;case ssc_key.left:i=-ssc_arrowscroll;break;case ssc_key.right:i=ssc_arrowscroll;break;default:return true}ssc_scrollArray(o,i,s);e.preventDefault()}function ssc_mousedown(e){ssc_activeElement=e.target}function ssc_setCache(e,t){for(var n=e.length;n--;)ssc_cache[ssc_uniqueID(e[n])]=t;return t}function ssc_overflowingAncestor(e){var t=[];var n=ssc_root.scrollHeight;do{var r=ssc_cache[ssc_uniqueID(e)];if(r){return ssc_setCache(t,r)}t.push(e);if(n===e.scrollHeight){if(!ssc_frame||ssc_root.clientHeight+10<n){return ssc_setCache(t,document.body)}}else if(e.clientHeight+10<e.scrollHeight){overflow=getComputedStyle(e,"").getPropertyValue("overflow");if(overflow==="scroll"||overflow==="auto"){return ssc_setCache(t,e)}}}while(e=e.parentNode)}function ssc_addEvent(e,t,n){window.addEventListener(e,t,n||false)}function ssc_removeEvent(e,t,n){window.removeEventListener(e,t,n||false)}function ssc_isNodeName(e,t){return e.nodeName.toLowerCase()===t.toLowerCase()}function ssc_directionCheck(e,t){e=e>0?1:-1;t=t>0?1:-1;if(ssc_direction.x!==e||ssc_direction.y!==t){ssc_direction.x=e;ssc_direction.y=t;ssc_que=[]}}function ssc_pulse_(e){var t,n,r;e=e*ssc_pulseScale;if(e<1){t=e-(1-Math.exp(-e))}else{n=Math.exp(-1);e-=1;r=1-Math.exp(-e);t=n+r*(1-n)}return t*ssc_pulseNormalize}function ssc_pulse(e){if(e>=1)return 1;if(e<=0)return 0;if(ssc_pulseNormalize==1){ssc_pulseNormalize/=ssc_pulse_(1)}return ssc_pulse_(e)}var ssc_framerate=150;var ssc_animtime=500;var ssc_stepsize=150;var ssc_pulseAlgorithm=true;var ssc_pulseScale=6;var ssc_pulseNormalize=1;var ssc_keyboardsupport=true;var ssc_arrowscroll=50;var ssc_frame=false;var ssc_direction={x:0,y:0};var ssc_initdone=false;var ssc_fixedback=true;var ssc_root=document.documentElement;var ssc_activeElement;var ssc_key={left:37,up:38,right:39,down:40,spacebar:32,pageup:33,pagedown:34,end:35,home:36};var ssc_que=[];var ssc_pending=false;var ssc_cache={};setInterval(function(){ssc_cache={}},10*1e3);var ssc_uniqueID=function(){var e=0;return function(t){return t.ssc_uniqueID||(t.ssc_uniqueID=e++)}}();jQuery(document).ready(function(e){function t(){var e=navigator.appName,t=navigator.userAgent,n;var r=t.match(/(opera|chrome|safari|firefox|msie)\/?\s*(\.?\d+(\.\d+)*)/i);if(r&&(n=t.match(/version\/([\.\d]+)/i))!=null)r[2]=n[1];r=r?[r[1],r[2]]:[e,navigator.appVersion,"-?"];return r[0]}var n=t().toLowerCase();if(!Modernizr.touch&&(n==="firefox"||n==="chrome"||n==="safari")){ssc_addEvent("mousedown",ssc_mousedown);ssc_addEvent("mousewheel",ssc_wheel);ssc_addEvent("load",ssc_init)}});

/* layout panel  */
(function($){$(document).ready(function(){var themeDemos=$("#themeDemos");var demoView=$(".demoView");var demoViews=$(".demoViews");demoViews.css({height:themeDemos.height()-53});themeDemos.css({marginBottom:-themeDemos.height()+50});themeDemos.find("a").click(function(){if(themeDemos.hasClass("open-panel")){themeDemos.removeClass("open-panel");themeDemos.animate({marginBottom:-themeDemos.height()+50});}else{themeDemos.addClass("open-panel");themeDemos.animate({marginBottom:0});}});themeDemos.find('.item:not(".comingsoon")').mouseenter(function(){demoView.stop(true,true).show(0);$(".demoView img").attr("src",$(this).attr("data-img"));$(".demoView .title").html($(this).attr("data-title"));});themeDemos.find('.item:not(".comingsoon")').mouseleave(function(){demoView.stop(true,true).hide(0);});$(window).resize(function(){demoViews.css({height:themeDemos.height()-53});if(!themeDemos.hasClass("open-panel")){themeDemos.animate({marginBottom:-themeDemos.height()+50});}else{themeDemos.animate({marginBottom:0});}});});}(window.jQuery));
/* end layout panel  */
