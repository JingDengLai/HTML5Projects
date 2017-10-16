/** 
2  * impress.js 
3  * 
4  * impress.js is a presentation tool based on the power of CSS3 transforms and transitions 
5  * in modern browsers and inspired by the idea behind prezi.com. 
6  * 
7  * 
8  * Copyright 2011-2012 Bartek Szopka (@bartaz) 
9  * 
10  * Released under the MIT and GPL Licenses. 
11  * 
12  * ------------------------------------------------ 
13  *  author:  Bartek Szopka 
14  *  version: 0.5.3 
15  *  url:     http://bartaz.github.com/impress.js/ 
16  *  source:  http://github.com/bartaz/impress.js/ 
17  */ 

 
/*jshint bitwise:true, curly:true, eqeqeq:true, forin:true, latedef:true, newcap:true, 
         noarg:true, noempty:true, undef:true, strict:true, browser:true */ 

 
// You are one of those who like to know how things work inside? 
// Let me show you the cogs that make impress.js run... 
( function( document, window ) { 
    "use strict"; 

 
   // HELPER FUNCTIONS  
 
    // `pfx` is a function that takes a standard CSS property name as a parameter 
    // and returns it's prefixed version valid for current browser it runs in. 
    // The code is heavily inspired by Modernizr http://www.modernizr.com/ 
    var pfx = ( function() { 

 
       var style = document.createElement( "dummy" ).style, 
          prefixes = "Webkit Moz O ms Khtml".split( " " ), 
           memory = {}; 

 
        return function( prop ) { 
             if ( typeof memory[ prop ] === "undefined" ) { 

 
               var ucProp  = prop.charAt( 0 ).toUpperCase() + prop.substr( 1 ), 
                   props   = ( prop + " " + prefixes.join( ucProp + " " ) + ucProp ).split( " " ); 

 
                memory[ prop ] = null; 
                for ( var i in props ) { 
                    if ( style[ props[ i ] ] !== undefined ) { 
                         memory[ prop ] = props[ i ]; 
                         break; 
                     } 
                 } 
 
 
             } 
 
 
             return memory[ prop ]; 
         }; 
 
 
     } )(); 
 
 
     // `arraify` takes an array-like object and turns it into real Array 
     // to make all the Array.prototype goodness available. 
     var arrayify = function( a ) { 
         return [].slice.call( a ); 
     }; 
 
 
     // `css` function applies the styles given in `props` object to the element 
     // given as `el`. It runs all property names through `pfx` function to make 
     // sure proper prefixed version of the property is used. 
     var css = function( el, props ) { 
         var key, pkey; 
         for ( key in props ) { 
             if ( props.hasOwnProperty( key ) ) { 
                 pkey = pfx( key ); 
                 if ( pkey !== null ) { 
                     el.style[ pkey ] = props[ key ]; 
                 } 
             } 
         } 
         return el; 
     }; 
 
 
     // `toNumber` takes a value given as `numeric` parameter and tries to turn 
     // it into a number. If it is not possible it returns 0 (or other value 
     // given as `fallback`). 
     var toNumber = function( numeric, fallback ) { 
         return isNaN( numeric ) ? ( fallback || 0 ) : Number( numeric ); 
     }; 
 
 
     // `byId` returns element with given `id` - you probably have guessed that ;) 
     var byId = function( id ) { 
        return document.getElementById( id ); 
    }; 

 
    // `$` returns first element for given CSS `selector` in the `context` of 
     // the given element or whole document. 
     var $ = function( selector, context ) { 
         context = context || document; 
         return context.querySelector( selector ); 
    }; 
 
 
    // `$$` return an array of elements for given CSS `selector` in the `context` of 
     // the given element or whole document. 
    var $$ = function( selector, context ) { 
        context = context || document; 
        return arrayify( context.querySelectorAll( selector ) ); 
     }; 

 
     // `triggerEvent` builds a custom DOM event with given `eventName` and `detail` data 
     // and triggers it on element given as `el`. 
    var triggerEvent = function( el, eventName, detail ) { 
         var event = document.createEvent( "CustomEvent" ); 
        event.initCustomEvent( eventName, true, true, detail ); 
        el.dispatchEvent( event ); 
     }; 
 
 
    // `translate` builds a translate transform string for given data. 
     var translate = function( t ) { 
        return " translate3d(" + t.x + "px," + t.y + "px," + t.z + "px) "; 
     }; 
 
    // `rotate` builds a rotate transform string for given data. 
     // By default the rotations are in X Y Z order that can be reverted by passing `true` 
    // as second parameter. 
    var rotate = function( r, revert ) { 
         var rX = " rotateX(" + r.x + "deg) ", 
             rY = " rotateY(" + r.y + "deg) ", 
             rZ = " rotateZ(" + r.z + "deg) "; 

 
        return revert ? rZ + rY + rX : rX + rY + rZ; 
     }; 
 
 
     // `scale` builds a scale transform string for given data. 
     var scale = function( s ) { 
         return " scale(" + s + ") "; 
     }; 
 
 
     // `perspective` builds a perspective transform string for given data. 
    var perspective = function( p ) { 
        return " perspective(" + p + "px) "; 
     }; 
 
 
141     // `getElementFromHash` returns an element located by id from hash part of 
142     // window location. 
143     var getElementFromHash = function() { 
144 
 
145         // Get id from url # by removing `#` or `#/` from the beginning, 
146         // so both "fallback" `#slide-id` and "enhanced" `#/slide-id` will work 
147         return byId( window.location.hash.replace( /^#\/?/, "" ) ); 
148     }; 
149 
 
150     // `computeWindowScale` counts the scale factor between window size and size 
151     // defined for the presentation in the config. 
152     var computeWindowScale = function( config ) { 
153         var hScale = window.innerHeight / config.height, 
154             wScale = window.innerWidth / config.width, 
155             scale = hScale > wScale ? wScale : hScale; 
156 
 
157         if ( config.maxScale && scale > config.maxScale ) { 
158             scale = config.maxScale; 
159         } 
160 
 
161         if ( config.minScale && scale < config.minScale ) { 
162             scale = config.minScale; 
163         } 
164 
 
165         return scale; 
166     }; 
167 
 
168     // CHECK SUPPORT 
169     var body = document.body; 
170 
 
171     var ua = navigator.userAgent.toLowerCase(); 
172     var impressSupported = 
173 
 
174                           // Browser should support CSS 3D transtorms 
175                            ( pfx( "perspective" ) !== null ) && 
176 
 
177                           // Browser should support `classList` and `dataset` APIs 
178                            ( body.classList ) && 
179                            ( body.dataset ) && 
180 
 
181                           // But some mobile devices need to be blacklisted, 
182                           // because their CSS 3D support or hardware is not 
183                           // good enough to run impress.js properly, sorry... 
184                            ( ua.search( /(iphone)|(ipod)|(android)/ ) === -1 ); 
185 
 
186     if ( !impressSupported ) { 
187 
 
188         // We can't be sure that `classList` is supported 
189         body.className += " impress-not-supported "; 
190     } else { 
191         body.classList.remove( "impress-not-supported" ); 
192         body.classList.add( "impress-supported" ); 
193     } 
194 
 
195     // GLOBALS AND DEFAULTS 
196 
 
197     // This is where the root elements of all impress.js instances will be kept. 
198     // Yes, this means you can have more than one instance on a page, but I'm not 
199     // sure if it makes any sense in practice ;) 
200     var roots = {}; 
201 
 
202     // Some default config values. 
203     var defaults = { 
204         width: 1024, 
205         height: 768, 
206         maxScale: 1, 
207         minScale: 0, 
208 
 
209         perspective: 1000, 
210 
 
211         transitionDuration: 1000 
212     }; 
213 
 
214     // It's just an empty function ... and a useless comment. 
215     var empty = function() { return false; }; 
216 
 
217     // IMPRESS.JS API 
218 
 
219     // And that's where interesting things will start to happen. 
220     // It's the core `impress` function that returns the impress.js API 
221     // for a presentation based on the element with given id ('impress' 
222     // by default). 
223     var impress = window.impress = function( rootId ) { 
224 
 
225         // If impress.js is not supported by the browser return a dummy API 
226         // it may not be a perfect solution but we return early and avoid 
227         // running code that may use features not implemented in the browser. 
228         if ( !impressSupported ) { 
229             return { 
230                 init: empty, 
231                 goto: empty, 
232                 prev: empty, 
233                 next: empty 
234             }; 
235         } 
236 
 
237         rootId = rootId || "impress"; 
238 
 
239         // If given root is already initialized just return the API 
240         if ( roots[ "impress-root-" + rootId ] ) { 
241             return roots[ "impress-root-" + rootId ]; 
242         } 
243 
 
244         // Data of all presentation steps 
245         var stepsData = {}; 
246 
 
247         // Element of currently active step 
248         var activeStep = null; 
249 
 
250         // Current state (position, rotation and scale) of the presentation 
251         var currentState = null; 
252 
 
253         // Array of step elements 
254         var steps = null; 
255 
 
256         // Configuration options 
257         var config = null; 
258 
 
259         // Scale factor of the browser window 
260         var windowScale = null; 
261 
 
262         // Root presentation elements 
263         var root = byId( rootId ); 
264         var canvas = document.createElement( "div" ); 
265 
 
266         var initialized = false; 
267 
 
268         // STEP EVENTS 
269         // 
270         // There are currently two step events triggered by impress.js 
271         // `impress:stepenter` is triggered when the step is shown on the 
272         // screen (the transition from the previous one is finished) and 
273         // `impress:stepleave` is triggered when the step is left (the 
274         // transition to next step just starts). 
275 
 
276         // Reference to last entered step 
277         var lastEntered = null; 
278 
 
279         // `onStepEnter` is called whenever the step element is entered 
280         // but the event is triggered only if the step is different than 
281         // last entered step. 
282         var onStepEnter = function( step ) { 
283             if ( lastEntered !== step ) { 
284                 triggerEvent( step, "impress:stepenter" ); 
285                 lastEntered = step; 
286             } 
287         }; 
288 
 
289         // `onStepLeave` is called whenever the step element is left 
290         // but the event is triggered only if the step is the same as 
291         // last entered step. 
292         var onStepLeave = function( step ) { 
293             if ( lastEntered === step ) { 
294                 triggerEvent( step, "impress:stepleave" ); 
295                 lastEntered = null; 
296             } 
297         }; 
298 
 
299         // `initStep` initializes given step element by reading data from its 
300         // data attributes and setting correct styles. 
301         var initStep = function( el, idx ) { 
302             var data = el.dataset, 
303                 step = { 
304                     translate: { 
305                         x: toNumber( data.x ), 
306                         y: toNumber( data.y ), 
307                         z: toNumber( data.z ) 
308                     }, 
309                     rotate: { 
310                         x: toNumber( data.rotateX ), 
311                         y: toNumber( data.rotateY ), 
312                         z: toNumber( data.rotateZ || data.rotate ) 
313                     }, 
314                     scale: toNumber( data.scale, 1 ), 
315                     el: el 
316                 }; 
317 
 
318             if ( !el.id ) { 
319                 el.id = "step-" + ( idx + 1 ); 
320             } 
321 
 
322             stepsData[ "impress-" + el.id ] = step; 
323 
 
324             css( el, { 
325                 position: "absolute", 
326                 transform: "translate(-50%,-50%)" + 
327                            translate( step.translate ) + 
328                            rotate( step.rotate ) + 
329                            scale( step.scale ), 
330                 transformStyle: "preserve-3d" 
331             } ); 
332         }; 
333 
 
334         // `init` API function that initializes (and runs) the presentation. 
335         var init = function() { 
336             if ( initialized ) { return; } 
337 
 
338             // First we set up the viewport for mobile devices. 
339             // For some reason iPad goes nuts when it is not done properly. 
340             var meta = $( "meta[name='viewport']" ) || document.createElement( "meta" ); 
341             meta.content = "width=device-width, minimum-scale=1, maximum-scale=1, user-scalable=no"; 
342             if ( meta.parentNode !== document.head ) { 
343                 meta.name = "viewport"; 
344                 document.head.appendChild( meta ); 
345             } 
346 
 
347             // Initialize configuration object 
348             var rootData = root.dataset; 
349             config = { 
350                 width: toNumber( rootData.width, defaults.width ), 
351                 height: toNumber( rootData.height, defaults.height ), 
352                 maxScale: toNumber( rootData.maxScale, defaults.maxScale ), 
353                 minScale: toNumber( rootData.minScale, defaults.minScale ), 
354                 perspective: toNumber( rootData.perspective, defaults.perspective ), 
355                 transitionDuration: toNumber( 
356                   rootData.transitionDuration, defaults.transitionDuration 
357                 ) 
358             }; 
359 
 
360             windowScale = computeWindowScale( config ); 
361 
 
362             // Wrap steps with "canvas" element 
363             arrayify( root.childNodes ).forEach( function( el ) { 
364                 canvas.appendChild( el ); 
365             } ); 
366             root.appendChild( canvas ); 
367 
 
368             // Set initial styles 
369             document.documentElement.style.height = "100%"; 
370 
 
371             css( body, { 
372                 height: "100%", 
373                 overflow: "hidden" 
374             } ); 
375 
 
376             var rootStyles = { 
377                 position: "absolute", 
378                 transformOrigin: "top left", 
379                 transition: "all 0s ease-in-out", 
380                 transformStyle: "preserve-3d" 
381             }; 
382 
 
383             css( root, rootStyles ); 
384             css( root, { 
385                 top: "50%", 
386                 left: "50%", 
387                 transform: perspective( config.perspective / windowScale ) + scale( windowScale ) 
388             } ); 
389             css( canvas, rootStyles ); 
390 
 
391             body.classList.remove( "impress-disabled" ); 
392             body.classList.add( "impress-enabled" ); 
393 
 
394             // Get and init steps 
395             steps = $$( ".step", root ); 
396             steps.forEach( initStep ); 
397 
 
398             // Set a default initial state of the canvas 
399             currentState = { 
400                 translate: { x: 0, y: 0, z: 0 }, 
401                 rotate:    { x: 0, y: 0, z: 0 }, 
402                 scale:     1 
403             }; 
404 
 
405             initialized = true; 
406 
 
407             triggerEvent( root, "impress:init", { api: roots[ "impress-root-" + rootId ] } ); 
408         }; 
409 
 
410         // `getStep` is a helper function that returns a step element defined by parameter. 
411         // If a number is given, step with index given by the number is returned, if a string 
412         // is given step element with such id is returned, if DOM element is given it is returned 
413         // if it is a correct step element. 
414         var getStep = function( step ) { 
415             if ( typeof step === "number" ) { 
416                 step = step < 0 ? steps[ steps.length + step ] : steps[ step ]; 
417             } else if ( typeof step === "string" ) { 
418                 step = byId( step ); 
419             } 
420             return ( step && step.id && stepsData[ "impress-" + step.id ] ) ? step : null; 
421         }; 
422 
 
423         // Used to reset timeout for `impress:stepenter` event 
424         var stepEnterTimeout = null; 
425 
 
426         // `goto` API function that moves to step given with `el` parameter 
427         // (by index, id or element), with a transition `duration` optionally 
428         // given as second parameter. 
429         var goto = function( el, duration ) { 
430 
 
431             if ( !initialized || !( el = getStep( el ) ) ) { 
432 
 
433                 // Presentation not initialized or given element is not a step 
434                 return false; 
435             } 
436 
 
437             // Sometimes it's possible to trigger focus on first link with some keyboard action. 
438             // Browser in such a case tries to scroll the page to make this element visible 
439             // (even that body overflow is set to hidden) and it breaks our careful positioning. 
440             // 
441             // So, as a lousy (and lazy) workaround we will make the page scroll back to the top 
442             // whenever slide is selected 
443             // 
444             // If you are reading this and know any better way to handle it, I'll be glad to hear 
445             // about it! 
446             window.scrollTo( 0, 0 ); 
447 
 
448             var step = stepsData[ "impress-" + el.id ]; 
449 
 
450             if ( activeStep ) { 
451                 activeStep.classList.remove( "active" ); 
452                 body.classList.remove( "impress-on-" + activeStep.id ); 
453             } 
454             el.classList.add( "active" ); 
455 
 
456             body.classList.add( "impress-on-" + el.id ); 
457 
 
458             // Compute target state of the canvas based on given step 
459             var target = { 
460                 rotate: { 
461                     x: -step.rotate.x, 
462                     y: -step.rotate.y, 
463                     z: -step.rotate.z 
464                 }, 
465                 translate: { 
466                     x: -step.translate.x, 
467                     y: -step.translate.y, 
468                     z: -step.translate.z 
469                 }, 
470                 scale: 1 / step.scale 
471             }; 
472 
 
473             // Check if the transition is zooming in or not. 
474             // 
475             // This information is used to alter the transition style: 
476             // when we are zooming in - we start with move and rotate transition 
477             // and the scaling is delayed, but when we are zooming out we start 
478             // with scaling down and move and rotation are delayed. 
479             var zoomin = target.scale >= currentState.scale; 
480 
 
481             duration = toNumber( duration, config.transitionDuration ); 
482             var delay = ( duration / 2 ); 
483 
 
484             // If the same step is re-selected, force computing window scaling, 
485             // because it is likely to be caused by window resize 
486             if ( el === activeStep ) { 
487                 windowScale = computeWindowScale( config ); 
488             } 
489 
 
490             var targetScale = target.scale * windowScale; 
491 
 
492             // Trigger leave of currently active element (if it's not the same step again) 
493             if ( activeStep && activeStep !== el ) { 
494                 onStepLeave( activeStep ); 
495             } 
496 
 
497             // Now we alter transforms of `root` and `canvas` to trigger transitions. 
498             // 
499             // And here is why there are two elements: `root` and `canvas` - they are 
500             // being animated separately: 
501             // `root` is used for scaling and `canvas` for translate and rotations. 
502             // Transitions on them are triggered with different delays (to make 
503             // visually nice and 'natural' looking transitions), so we need to know 
504             // that both of them are finished. 
505             css( root, { 
506 
 
507                 // To keep the perspective look similar for different scales 
508                 // we need to 'scale' the perspective, too 
509                 transform: perspective( config.perspective / targetScale ) + scale( targetScale ), 
510                 transitionDuration: duration + "ms", 
511                 transitionDelay: ( zoomin ? delay : 0 ) + "ms" 
512             } ); 
513 
 
514             css( canvas, { 
515                 transform: rotate( target.rotate, true ) + translate( target.translate ), 
516                 transitionDuration: duration + "ms", 
517                 transitionDelay: ( zoomin ? 0 : delay ) + "ms" 
518             } ); 
519 
 
520             // Here is a tricky part... 
521             // 
522             // If there is no change in scale or no change in rotation and translation, it means 
523             // there was actually no delay - because there was no transition on `root` or `canvas` 
524             // elements. We want to trigger `impress:stepenter` event in the correct moment, so 
525             // here we compare the current and target values to check if delay should be taken into 
526             // account. 
527             // 
528             // I know that this `if` statement looks scary, but it's pretty simple when you know 
529             // what is going on 
530             // - it's simply comparing all the values. 
531             if ( currentState.scale === target.scale || 
532                 ( currentState.rotate.x === target.rotate.x && 
533                   currentState.rotate.y === target.rotate.y && 
534                   currentState.rotate.z === target.rotate.z && 
535                   currentState.translate.x === target.translate.x && 
536                   currentState.translate.y === target.translate.y && 
537                   currentState.translate.z === target.translate.z ) ) { 
538                 delay = 0; 
539             } 
540 
 
541             // Store current state 
542             currentState = target; 
543             activeStep = el; 
544 
 
545             // And here is where we trigger `impress:stepenter` event. 
546             // We simply set up a timeout to fire it taking transition duration 
547             // (and possible delay) into account. 
548             // 
549             // I really wanted to make it in more elegant way. The `transitionend` event seemed to 
550             // be the best way to do it, but the fact that I'm using transitions on two separate 
551             // elements and that the `transitionend` event is only triggered when there was a 
552             // transition (change in the values) caused some bugs and made the code really 
553             // complicated, cause I had to handle all the conditions separately. And it still 
554             // needed a `setTimeout` fallback for the situations when there is no transition at 
555             // all. 
556             // So I decided that I'd rather make the code simpler than use shiny new 
557             // `transitionend`. 
558             // 
559             // If you want learn something interesting and see how it was done with `transitionend` 
560             // go back to 
561             // version 0.5.2 of impress.js: 
562             // http://github.com/bartaz/impress.js/blob/0.5.2/js/impress.js 
563             window.clearTimeout( stepEnterTimeout ); 
564             stepEnterTimeout = window.setTimeout( function() { 
565                 onStepEnter( activeStep ); 
566             }, duration + delay ); 
567 
 
568             return el; 
569         }; 
570 
 
571         // `prev` API function goes to previous step (in document order) 
572         var prev = function() { 
573             var prev = steps.indexOf( activeStep ) - 1; 
574             prev = prev >= 0 ? steps[ prev ] : steps[ steps.length - 1 ]; 
575 
 
576             return goto( prev ); 
577         }; 
578 
 
579         // `next` API function goes to next step (in document order) 
580         var next = function() { 
581             var next = steps.indexOf( activeStep ) + 1; 
582             next = next < steps.length ? steps[ next ] : steps[ 0 ]; 
583 
 
584             return goto( next ); 
585         }; 
586 
 
587         // Adding some useful classes to step elements. 
588         // 
589         // All the steps that have not been shown yet are given `future` class. 
590         // When the step is entered the `future` class is removed and the `present` 
591         // class is given. When the step is left `present` class is replaced with 
592         // `past` class. 
593         // 
594         // So every step element is always in one of three possible states: 
595         // `future`, `present` and `past`. 
596         // 
597         // There classes can be used in CSS to style different types of steps. 
598         // For example the `present` class can be used to trigger some custom 
599         // animations when step is shown. 
600         root.addEventListener( "impress:init", function() { 
601 
 
602             // STEP CLASSES 
603             steps.forEach( function( step ) { 
604                 step.classList.add( "future" ); 
605             } ); 
606 
 
607             root.addEventListener( "impress:stepenter", function( event ) { 
608                 event.target.classList.remove( "past" ); 
609                 event.target.classList.remove( "future" ); 
610                 event.target.classList.add( "present" ); 
611             }, false ); 
612 
 
613             root.addEventListener( "impress:stepleave", function( event ) { 
614                 event.target.classList.remove( "present" ); 
615                 event.target.classList.add( "past" ); 
616             }, false ); 
617 
 
618         }, false ); 
619 
 
620         // Adding hash change support. 
621         root.addEventListener( "impress:init", function() { 
622 
 
623             // Last hash detected 
624             var lastHash = ""; 
625 
 
626             // `#/step-id` is used instead of `#step-id` to prevent default browser 
627             // scrolling to element in hash. 
628             // 
629             // And it has to be set after animation finishes, because in Chrome it 
630             // makes transtion laggy. 
631             // BUG: http://code.google.com/p/chromium/issues/detail?id=62820 
632             root.addEventListener( "impress:stepenter", function( event ) { 
633                 window.location.hash = lastHash = "#/" + event.target.id; 
634             }, false ); 
635 
 
636             window.addEventListener( "hashchange", function() { 
637 
 
638                 // When the step is entered hash in the location is updated 
639                 // (just few lines above from here), so the hash change is 
640                 // triggered and we would call `goto` again on the same element. 
641                 // 
642                 // To avoid this we store last entered hash and compare. 
643                 if ( window.location.hash !== lastHash ) { 
644                     goto( getElementFromHash() ); 
645                 } 
646             }, false ); 
647 
 
648             // START 
649             // by selecting step defined in url or first step of the presentation 
650             goto( getElementFromHash() || steps[ 0 ], 0 ); 
651         }, false ); 
652 
 
653         body.classList.add( "impress-disabled" ); 
654 
 
655         // Store and return API for given impress.js root element 
656         return ( roots[ "impress-root-" + rootId ] = { 
657             init: init, 
658             goto: goto, 
659             next: next, 
660             prev: prev 
661         } ); 
662 
 
663     }; 
664 
 
665     // Flag that can be used in JS to check if browser have passed the support test 
666     impress.supported = impressSupported; 
667 
 
668 } )( document, window ); 
669 
 
670 // NAVIGATION EVENTS 
671 
 
672 // As you can see this part is separate from the impress.js core code. 
673 // It's because these navigation actions only need what impress.js provides with 
674 // its simple API. 
675 // 
676 // In future I think about moving it to make them optional, move to separate files 
677 // and treat more like a 'plugins'. 
678 ( function( document, window ) { 
679     "use strict"; 
680 
 
681     // Throttling function calls, by Remy Sharp 
682     // http://remysharp.com/2010/07/21/throttling-function-calls/ 
683     var throttle = function( fn, delay ) { 
684         var timer = null; 
685         return function() { 
686             var context = this, args = arguments; 
687             clearTimeout( timer ); 
688             timer = setTimeout( function() { 
689                 fn.apply( context, args ); 
690             }, delay ); 
691         }; 
692     }; 
693 
 
694     // Wait for impress.js to be initialized 
695     document.addEventListener( "impress:init", function( event ) { 
696 
 
697         // Getting API from event data. 
698         // So you don't event need to know what is the id of the root element 
699         // or anything. `impress:init` event data gives you everything you 
700         // need to control the presentation that was just initialized. 
701         var api = event.detail.api; 
702 
 
703         // KEYBOARD NAVIGATION HANDLERS 
704 
 
705         // Prevent default keydown action when one of supported key is pressed. 
706         document.addEventListener( "keydown", function( event ) { 
707             if ( event.keyCode === 9 || 
708                ( event.keyCode >= 32 && event.keyCode <= 34 ) || 
709                ( event.keyCode >= 37 && event.keyCode <= 40 ) ) { 
710                 event.preventDefault(); 
711             } 
712         }, false ); 
713 
 
714         // Trigger impress action (next or prev) on keyup. 
715 
 
716         // Supported keys are: 
717         // [space] - quite common in presentation software to move forward 
718         // [up] [right] / [down] [left] - again common and natural addition, 
719         // [pgdown] / [pgup] - often triggered by remote controllers, 
720         // [tab] - this one is quite controversial, but the reason it ended up on 
721         //   this list is quite an interesting story... Remember that strange part 
722         //   in the impress.js code where window is scrolled to 0,0 on every presentation 
723         //   step, because sometimes browser scrolls viewport because of the focused element? 
724         //   Well, the [tab] key by default navigates around focusable elements, so clicking 
725         //   it very often caused scrolling to focused element and breaking impress.js 
726         //   positioning. I didn't want to just prevent this default action, so I used [tab] 
727         //   as another way to moving to next step... And yes, I know that for the sake of 
728         //   consistency I should add [shift+tab] as opposite action... 
729         document.addEventListener( "keyup", function( event ) { 
730 
 
731             if ( event.shiftKey || event.altKey || event.ctrlKey || event.metaKey ) { 
732                 return; 
733             } 
734 
 
735             if ( event.keyCode === 9 || 
736                ( event.keyCode >= 32 && event.keyCode <= 34 ) || 
737                ( event.keyCode >= 37 && event.keyCode <= 40 ) ) { 
738                 switch ( event.keyCode ) { 
739                     case 33: // Page up 
740                     case 37: // Left 
741                     case 38: // Up 
742                              api.prev(); 
743                              break; 
744                     case 9:  // Tab 
745                     case 32: // Space 
746                     case 34: // Page down 
747                     case 39: // Right 
748                     case 40: // Down 
749                              api.next(); 
750                              break; 
751                 } 
752 
 
753                 event.preventDefault(); 
754             } 
755         }, false ); 
756 
 
757         // Delegated handler for clicking on the links to presentation steps 
758         document.addEventListener( "click", function( event ) { 
759 
 
760             // Event delegation with "bubbling" 
761             // Check if event target (or any of its parents is a link) 
762             var target = event.target; 
763             while ( ( target.tagName !== "A" ) && 
764                     ( target !== document.documentElement ) ) { 
765                 target = target.parentNode; 
766             } 
767 
 
768             if ( target.tagName === "A" ) { 
769                 var href = target.getAttribute( "href" ); 
770 
 
771                 // If it's a link to presentation step, target this step 
772                 if ( href && href[ 0 ] === "#" ) { 
773                     target = document.getElementById( href.slice( 1 ) ); 
774                 } 
775             } 
776 
 
777             if ( api.goto( target ) ) { 
778                 event.stopImmediatePropagation(); 
779                 event.preventDefault(); 
780             } 
781         }, false ); 
782 
 
783         // Delegated handler for clicking on step elements 
784         document.addEventListener( "click", function( event ) { 
785             var target = event.target; 
786 
 
787             // Find closest step element that is not active 
788             while ( !( target.classList.contains( "step" ) && 
789                       !target.classList.contains( "active" ) ) && 
790                       ( target !== document.documentElement ) ) { 
791                 target = target.parentNode; 
792             } 
793 
 
794             if ( api.goto( target ) ) { 
795                 event.preventDefault(); 
796             } 
797         }, false ); 
798 
 
799         // Touch handler to detect taps on the left and right side of the screen 
800         // based on awesome work of @hakimel: https://github.com/hakimel/reveal.js 
801         document.addEventListener( "touchstart", function( event ) { 
802             if ( event.touches.length === 1 ) { 
803                 var x = event.touches[ 0 ].clientX, 
804                     width = window.innerWidth * 0.3, 
805                     result = null; 
806 
 
807                 if ( x < width ) { 
808                     result = api.prev(); 
809                 } else if ( x > window.innerWidth - width ) { 
810                     result = api.next(); 
811                 } 
812 
 
813                 if ( result ) { 
814                     event.preventDefault(); 
815                 } 
816             } 
817         }, false ); 
818 
 
819         // Rescale presentation when window is resized 
820         window.addEventListener( "resize", throttle( function() { 
821 
 
822             // Force going to active step again, to trigger rescaling 
823             api.goto( document.querySelector( ".step.active" ), 500 ); 
824         }, 250 ), false ); 
825 
 
826     }, false ); 
827 
 
828 } )( document, window ); 
829 
 
830 // THAT'S ALL FOLKS! 
831 // 
832 // Thanks for reading it all. 
833 // Or thanks for scrolling down and reading the last part. 
834 // 
835 // I've learnt a lot when building impress.js and I hope this code and comments 
836 // will help somebody learn at least some part of it. 
