/// <reference path="../../../typings/jquery/jquery.d.ts" />
/// <reference path="../../../typings/handlebars/handlebars.d.ts" />

module RACKLE {

    export interface IViewCreateOptions {
        $el?: JQuery;
        tagName?: string;
        id?: string;
        className?: string;
        attributes?: Object;
    }

    export class View {

        tagName: string = 'div';
        id: string;
        className: string;
        attributes: Object = {};
        $el: JQuery;

        constructor(viewCreateOptions: IViewCreateOptions = {}) {
        }

    }

}
