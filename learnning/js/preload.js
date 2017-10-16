//图片预加载
(function($){
	
	function PreLoad(imgs , options){
		this.imgs=(typeof imgs==='string')
		}
	PreLoad.DEFAULTS = {
		each:null, //每一张图片加载完毕后执行
		all:null //所有图片加载完毕后执行
	};
})(jQuery);
