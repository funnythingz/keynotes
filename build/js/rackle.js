var RACKLE;
(function (RACKLE) {
    var View = (function () {
        function View(viewCreateOptions) {
            if (typeof viewCreateOptions === "undefined") { viewCreateOptions = {}; }
            this.tagName = 'div';
            this.attributes = {};
        }
        return View;
    })();
    RACKLE.View = View;
})(RACKLE || (RACKLE = {}));
