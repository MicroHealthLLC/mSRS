!function(k){"use strict";var e,t,S=function(e){return e&&r(e,"[")&&n(e,"]")&&(e=(e=e.substring(e.lastIndexOf("[")+1)).substring(0,e.length-1)),e},r=function(e,t){return e.slice(0,t.length)==t},n=function(e,t){return""==t||e.slice(-t.length)==t};e=function(w,C){return function(e,t){var r,n,a,i,l,s,o,h,g,d,c,u,p,v,b,f,m;for(l={$el:k(document),localeStrings:{vs:"vs",by:"by",and:"and"}},t=k.extend({},l,t),0===(c=e.getRowKeys()).length&&c.push([]),0===(a=e.getColKeys()).length&&a.push([]),g=[],v=0,f=c.length;v<f;v++){var y=[];for(d=c[v],b=0,m=a.length;b<m;b++)n=a[b],null!=(r=e.getAggregator(d,n)).value()?y.push(r.value()):y.push(null);o=c[v],g.push({name:o.join("-"),data:y})}for(i=[],v=0,f=a.length;v<f;v++)n=a[v],i.push(n.join("-"));u=S(e.aggregatorName),""!==(h=e.rowAttrs.map(S).join(","))&&(u+=" "+t.localeStrings.by+" "+h),""!==(s=e.colAttrs.map(S).join(","))&&(u+=h?" "+t.localeStrings.and+" "+s:" "+t.localeStrings.by+" "+s);var x=k("<div class='novixTable'>").width(t.$el.find(".pvtRendererArea").width()-5).height(t.$el.find(".pvtRendererArea").height()-5),A={chart:{type:w,zoomType:"x",events:{load:function(){t.onDrawTable&&(t.onDrawTable(),this.reflow())}}},title:{text:u},xAxis:{title:{text:h},categories:i},yAxis:{title:{text:p}},tooltip:{formatter:function(){return(this.key&&""!=this.key?'<span style="font-size: 10px">'+this.key+"</span><br/>":"")+'<span style="color:'+this.point.series.color+'">\u25cf</span> '+this.series.name+": <b>"+Highcharts.numberFormat(this.point.y,2)+"</b><br/>"}},legend:{layout:"vertical",align:"right",verticalAlign:"middle",borderWidth:0,itemWidth:200},credits:!1,series:g};return C&&(A=k.extend(A,C,!0)),t&&(A=k.extend(A,t,!0)),x.highcharts(A),x}},t=function(){return function(e,t){var r,n,a,i,l,s;l={$el:k(document),localeStrings:{vs:"vs",by:"by",and:"and"}},t=k.extend(l,t),i=e.getRowKeys(),a=[];for(var o={},h=0,g=0;g<i.length;g++)for(var d=i[g],c="",u="",p=0;p<d.length;p++){o[c=c+"_"+(v=d[p])]||(s={id:c,name:v,value:0},0==p?(s.color=Highcharts.getOptions().colors[h],h++):s.parent=u,o[c]=s),(s=o[c]).value+=e.getAggregator(d,[]).value(),u=c}for(var v in o)a.push(o[v]);r=S(e.aggregatorName),""!==(n=e.rowAttrs.map(S).join(","))&&(r+=" "+t.localeStrings.by+" "+n);var b={chart:{type:"treemap"},series:[{layoutAlgorithm:"squarified",allowDrillToNode:!0,dataLabels:{enabled:!1},levelIsConstant:!1,levels:[{level:1,dataLabels:{enabled:!0},borderWidth:3}],data:a}],title:{text:r},credits:!1};t&&(b=k.extend(b,t,!0));var f=k("<div class='novixTable'>").width(t.$el.find(".pvtRendererArea").width()-5).height(t.$el.find(".pvtRendererArea").height()-5);return f.highcharts(b),f}},k.pivotUtilities.highchart_renderers={"Line Chart":e("line"),"Bar Chart":e("bar"),"Stacked Bar Chart":e("bar",{plotOptions:{series:{stacking:"normal"}}}),"Column Chart":e("column"),"Stacked Column Chart":e("column",{plotOptions:{series:{stacking:"normal"}}}),"Area Chart":e("area",{plotOptions:{series:{stacking:"normal"}}}),"TreeMap Chart":t()}}(jQuery);