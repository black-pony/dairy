var express = require('express');
var formidable = require('express-formidable');
var app = express();
app.set('view engine','ejs');
app.use(express.static('public'));
app.use(formidable());
var router = require('./router');
app.use(router);
app.listen(3000,function(){
    console.log('服务器开启成功，正在监听端口3000...');
});