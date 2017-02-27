var express = require('express');
var router = express.Router();
var multer  = require('multer')
var upload = multer({ dest: 'uploads/' })

var mysql = require('mysql');
var connection = mysql.createConnection({
    host:'127.0.0.1',
    user:'root',
    password:'root',
    database:'itcast_eric'
});

router.get('/',function(req,res){
    // res.send('首页');
    connection.query('select * from articles',function(err,rows,fields){
        if(err)throw err;
        // console.log(rows);
        res.render('index',{list:rows});
    });
});
router.route('/add')
      .get(function(req,res){
        // res.send('添加页面 get');
        res.render('add');
      })
      .post(upload.any(),function(req,res){
        // res.send('添加页面 post');
        // var files = req.files;
        var fields = req.body;
        connection.query(`insert into articles(title,content) values ("${fields.title}","${fields.content}")`,function(err,result){
            if(err)throw err;
            // console.log(result);
            res.redirect('/');
        });
      });
router.route('/edit')
      .get(function(req,res){
        // res.send('编辑页面 get');
        var id = req.query.id;
        connection.query(`select * from articles where id = ${id} limit 1`,function(err,rows,fields){
            if(err)throw err;
            // console.log(rows);
            res.render('edit',{id:rows[0].id,title:rows[0].title,content:decodeURIComponent(rows[0].content)});
        });
      })
      .post(upload.any(),function(req,res){
        // res.send('编辑页面 post');
        var fields = req.body;
        connection.query(`update articles set title="${fields.title}",content="${encodeURIComponent(fields.content)}" where id = ${fields.id}`,function(err,result){
            if(err)throw err;
            console.log(result);
            res.redirect('/');
        });
      });
router.get('/delete',function(req,res){
    // res.send('删除 get');
    var id = req.query.id;
    connection.query(`delete from articles where id = ${id}`,function(err,rows,fields){
        if(err)throw err;
        // console.log(rows);
        res.redirect('/');
    });
});
module.exports = router;