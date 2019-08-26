!function(l){var t=l.editors.NumericEditor.prototype.extend();t.prototype.beginEditing=function(t){var e=l.editors.NumericEditor.prototype;if(void 0===t&&this.originalValue){var o=""+this.originalValue;isNaN(parseFloat(o))||(o=o.replace(",",""),o=parseFloat(o).toFixed(10)),e.beginEditing.apply(this,[o])}else e.beginEditing.apply(this,arguments);e.beginEditing.apply(this,[t])},l.editors.GenericEditor=t}(Handsontable),$.pivotUtilities.novix_renderers={"Pivot Table":function(t,e){return $.pivotUtilities.novix_renderers["Input Table"](t,$.extend({},e,{readOnly:!0}))},"Input Table":function(t,y){var e,o={$el:$(document),showTotals:!0,header:{className:"header"},total:{className:"total",format:"0,0.00"},data:{className:"data",format:"0,0.00"},getIndexContent:function(t){return t}};y=$.extend(o,y,!0);var r=function(t){t.readOnly=!0,t.className=y.header.className},a=function(t){t.readOnly=y.showTotals,t.format=y.total.format,t.className=y.total.className},h=function(t){t.readOnly=y.readOnly,t.className=y.data.className,t.format=y.data.format},u=function(t,e,o){var l=t[0]-o.fixedRows,r=t[1]-o.fixedColumns,s={filterList:[],oldValue:t[2],newValue:t[3]};if(0<=r)for(var a=e.getColKeys(),n=0;n<e.colAttrs.length;n++)if(r<a.length){var i=a[r];s.filterList.push({Key:e.colAttrs[n],Value:i[n]})}if(0<=l)for(var h=e.getRowKeys(),u=0;u<e.rowAttrs.length;u++)if(l<h.length){var g=h[l];s.filterList.push({Key:e.rowAttrs[u],Value:g[u]})}return s},g=function(t){var r={data:[],columns:[],fixedColumns:0,fixedRows:0,mergeCells:[],totalColumns:0,totalRows:0},e=t.getColKeys(),o=t.getRowKeys(),l=0<t.colAttrs.length,s=0<t.rowAttrs.length,a=function(t,e,o,l){r.mergeCells.push({row:t,col:e,rowspan:o,colspan:l})};r.fixedColumns=t.rowAttrs.length+(l?1:0),r.fixedRows=t.colAttrs.length+(s?1:0);var n="Totals",i=!1,h=!1;0==t.colKeys.length&&(i=!0),0==t.rowKeys.length&&(h=!0);for(var u=r.totalColumns=t.colKeys.length+t.rowAttrs.length+(0<t.colAttrs.length?1:0)+(y.showTotals||i?1:0),g=0;g<u;g++)g<r.fixedColumns?r.columns.push({type:"text"}):r.columns.push({type:"text",editor:Handsontable.editors.GenericEditor});s&&l&&a(0,0,l?t.colAttrs.length:1,s?t.rowAttrs.length:1);for(var c=0;c<t.colAttrs.length+(s?1:0);c++){var d=[];if(c<t.colAttrs.length){for(g=0;g<t.rowAttrs.length;g++)d.push("");if(d.push(y.getIndexContent(t.colAttrs[c])),0<t.colKeys.length){var f=d.length,p=e[0][c],w=0;for(g=0;g<e.length;g++){var m=e[g][c];c<t.colAttrs.length-1&&p!=m?(d.push(m),p=m,a(c,f,1,w),f+=w,w=1):(w++,d.push(m))}c<t.colAttrs.length-1&&a(c,f,1,w)}(y.showTotals||i)&&d.push(n)}else{for(g=0;g<t.rowAttrs.length;g++)d.push(y.getIndexContent(t.rowAttrs[g])),g==t.rowAttrs.length-1&&l&&a(c,g,1,2);0<l&&d.push("");for(g=0;g<e.length;g++)d.push("");(y.showTotals||i)&&d.push(n)}r.data.push(d)}for(var v={},C=0;C<o.length;C++){for(d=[],g=0;g<t.rowAttrs.length;g++)d.push(o[C][g]),g==o[C].length-1&&l?a(C+t.colAttrs.length+1,g,1,2,!0,!0):0==C?v[g]={toMerge:1,row:0,priorText:o[C][g]}:o[C][g]==v[g].priorText?v[g].toMerge++:g<o[C].length-1&&(a(v[g].row+t.colAttrs.length+1,g,v[g].toMerge,1),v[g].row=C,v[g].toMerge=1,v[g].priorText=o[C][g]);l&&d.push("");for(g=0;g<e.length;g++){var x=t.getAggregator(o[C],e[g]).value();x?d.push(x):0===x?d.push("0"):d.push("")}if(y.showTotals||i){var A=o[C].join(String.fromCharCode(0));t.rowTotals[A]?d.push(t.rowTotals[A].value()):d.push(0)}r.data.push(d)}for(g=0;g<t.rowAttrs.length-1;g++)v[g]&&1<v[g].toMerge&&a(v[g].row+t.colAttrs.length+1,g,v[g].toMerge,1);if(y.showTotals||h){for(d=[],g=0;g<t.rowAttrs.length;g++)d.push(n);l&&d.push(n);for(g=0;g<e.length;g++){var T=e[g].join(String.fromCharCode(0));t.colTotals[T]?d.push(t.colTotals[T].value()):d.push(0)}d.push(t.allTotal.value()),r.data.push(d)}return r.totalRows=r.data.length,(y.showTotals||h)&&(0<t.rowAttrs.length&&a(r.totalRows-1,0,1,t.rowAttrs.length+(l?1:0)),0<t.colAttrs.length&&a(0,u-1,t.colAttrs.length+(s?1:0),1)),r},l=function(s,n){var i=g(s),l=function(t,e,o,l,r,s){var a=""+s;return isNaN(parseFloat(a))||(a=a.replace(",",""),a=parseFloat(a).toFixed(2)),e.innerHTML=a,!n.showTotals||o!=i.totalRows-1&&l!=i.totalColumns-1?e.className=n.data.className:e.className=n.total.className,e.className+=" __"+o+","+l+"__",e};e&&e.destroy();var t=n.$el.find(".novixPivot");return t.empty(),e=new Handsontable(t.get(0),{data:i.data,contextMenu:!1,colHeaders:!1,allowInsertColumn:!1,allowInsertRow:!1,columns:i.columns,fixedColumnsLeft:i.fixedColumns,fixedRowsTop:i.fixedRows,mergeCells:i.mergeCells,cells:function(t,e){var o;return t<i.fixedRows||e<i.fixedColumns?r(o={renderer:"html"}):(o={type:"text",renderer:l},!n.showTotals||t!=i.totalRows-1&&e!=i.totalColumns-1?h(o):a(o)),o},afterChange:function(t){if(t&&0<=t.length){for(var e=[],o=0;o<t.length;o++)if(t[o][2]!=t[o][3]){var l=u(t[o],s,i);e.push(l)}if(n.onEditValues&&0<e.length){var r={lastRowChanged:t[t.length-1][0],lasColChanged:t[t.length-1][1],scrollX:n.$el.scrollLeft(),scrollY:n.$el.scrollTop()};n.$el.data("currentState",r),n.onEditValues(e)}}},afterInit:function(){n.onDrawTable&&n.onDrawTable(this)},afterRender:function(t){n.onRender&&n.onRender(t)}}),setTimeout(function(){var t=n.$el.data("currentState");t&&t&&t.lastRowChanged&&(e.selectCell(t.lastRowChanged+1,t.lasColChanged,t.lastRowChanged+1,t.lasColChanged),t.lastRowChanged=null,t.scrollX&&0<t.scrollX&&n.$el.scrollLeft(t.scrollX),t.scrollY&&0<t.scrollY&&n.$el.scrollTop(t.scrollY),t=null,n.$el.data("currentState",null))},5),!1};return setTimeout(function(){l(t,y)},10),"<div class='novixPivot' style='overflow:auto'></div>"}};