## 学习目标
- 通过本项目熟悉express的用法
- 通过本项目熟悉如何用node使用mysql

## 项目模板下载地址
[下载地址](https://github.com/black-pony/dairy_template)

## 步骤
### 步骤1 - 初始化项目
执行`npm init -y`，修改package.json中的entry point为`app.js`

```javascript
{
  "name": "dairy",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "express": "^4.14.1"
  }
}

```

### 步骤2 - 安装express第三方包
执行`npm install --save express`

### 步骤3 - 书写app.js代码
创建app.js文件，代码如下：

```javascript
var express = require('express');
var app = express();
app.get('/',function(req,res){
    res.send('Hello World');
});
app.listen(3000,function(){
    console.log('服务器开启成功，正在监听端口3000...');
});
```

### 步骤4 - 测试服务器代码是否成功
在命令行里面执行`node app.js`,通过浏览器测试代码是否成功

### 步骤5 - 构建路由
修改app.js代码如下：
```javascript
var express = require('express');
var app = express();
var router = require('./router');
app.use(router);
app.listen(3000,function(){
    console.log('服务器开启成功，正在监听端口3000...');
});
```
添加router.js代码如下：
```javascript
var express = require('express');
var router = express.Router();
router.get('/',function(req,res){
    res.send('首页');
});
router.route('/add')
      .get(function(req,res){
        res.send('添加页面 get');
      })
      .post(function(req,res){
        res.send('添加页面 post');
      });
router.route('/edit')
      .get(function(req,res){
        res.send('编辑页面 get');
      })
      .post(function(req,res){
        res.send('添加页面 post');
      });
router.get('/delete',function(req,res){
    res.send('删除 get');
});
module.exports = router;
```

### 步骤6 - 检测路由是否成功
使用postman把上面的这几个路由全部检测一下看是否都可以使用

### 步骤7 - 渲染模板
这里，我们使用的模板引擎是ejs,所以，我们先安装一下ejs第三方依赖
```
npm install --save ejs
```
然后，我们在app.js当中加载进来ejs这个中间件：
```javascript
var express = require('express');
var app = express();
app.set('view engine','ejs');
var router = require('./router');
app.use(router);
app.listen(3000,function(){
    console.log('服务器开启成功，正在监听端口3000...');
});

```

我们把`index.html`,`edit.html`,`add.html`三个文件放到views文件夹当中，扩展名改成ejs

接着，我们修改router.js的代码如下：
```javascript
var express = require('express');
var router = express.Router();
router.get('/',function(req,res){
    // res.send('首页');
    res.render('index');
});
router.route('/add')
      .get(function(req,res){
        // res.send('添加页面 get');
        res.render('add');
      })
      .post(function(req,res){
        res.send('添加页面 post');
      });
router.route('/edit')
      .get(function(req,res){
        // res.send('编辑页面 get');
        res.render('edit');
      })
      .post(function(req,res){
        res.send('编辑页面 post');
      });
router.get('/delete',function(req,res){
    res.send('删除 get');
});
module.exports = router;
```

### 步骤8 - 设置静态资源
我们检测代码会发现，虽然首页，编辑页面，添加页面全部可以正常显示成功，但是它们都没有样式，所以我们现在设置一下静态资源

修改app.js代码如下：
```javascript
var express = require('express');
var app = express();
app.set('view engine','ejs');
app.use(express.static('public'));
var router = require('./router');
app.use(router);
app.listen(3000,function(){
    console.log('服务器开启成功，正在监听端口3000...');
});
```

因为我们知道静态资源的文件夹是作为根文件夹，所以，我们把index.ejs,edit.ejs,add.ejs中的路径修改一下

### 步骤9 - 连接数据库
我们打开phpmyadmin,切换到sql界面如下：
![](http://i1.piimg.com/567571/be28b74d7012c0c0.png)
![](http://p1.bqimg.com/567571/6032260d812a03d5.png)

把模板中的itcast_erit.sql用编辑器打开，把里面的文本全部拷贝到sqll界面当中，点击`执行`
![](http://p1.bqimg.com/567571/6b6749862cbefddc.png)

### 步骤10 - 安装mysql第三方依赖
```
npm install --save mysql
```

### 步骤11 - 把mysql集成到express代码当中：
router.js代码如下：
```javascript
var express = require('express');
var router = express.Router();
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
        console.log(rows);
    });
    res.render('index');
});
router.route('/add')
      .get(function(req,res){
        // res.send('添加页面 get');
        res.render('add');
      })
      .post(function(req,res){
        res.send('添加页面 post');
      });
router.route('/edit')
      .get(function(req,res){
        // res.send('编辑页面 get');
        res.render('edit');
      })
      .post(function(req,res){
        res.send('编辑页面 post');
      });
router.get('/delete',function(req,res){
    res.send('删除 get');
});
module.exports = router;
```

### 步骤12 - 把首页的数据换成动态
修改router.js代码如下：
```javascript
var express = require('express');
var router = express.Router();
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
      .post(function(req,res){
        res.send('添加页面 post');
      });
router.route('/edit')
      .get(function(req,res){
        // res.send('编辑页面 get');
        res.render('edit');
      })
      .post(function(req,res){
        res.send('编辑页面 post');
      });
router.get('/delete',function(req,res){
    res.send('删除 get');
});
module.exports = router;
```

修改`index.ejs`js代码如下：
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="/css/index.css">
</head>
<body>
  <div class="wrapper">
    <h1>首页</h1>
    <ul class="list">
      <% for(var i=0;i<list.length;i++){ %>
      <li>
        <span class="num"><%= list[i].id %></span><span><%= list[i].title %></span><a class="delete" href="/delete?id=<%= list[i].id %>">删除</a><a class="edit" href="/edit?id=<%= list[i].id %>">编辑</a>
      </li>
      <% } %>
    </ul>
  </div>
</body>
</html>

```

这个时候我们访问浏览器会发现我们首页数据全部换成动态数据了

### 步骤13 - 删除功能实现
```javascript
var express = require('express');
var router = express.Router();
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
      .post(function(req,res){
        res.send('添加页面 post');
      });
router.route('/edit')
      .get(function(req,res){
        // res.send('编辑页面 get');
        res.render('edit');
      })
      .post(function(req,res){
        res.send('编辑页面 post');
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
```

### 步骤14 - 添加功能实现
修改请求方法为post,请求的url为/add的相关代码：

add.ejs代码如下：
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="/css/index.css">
</head>
<body>
  <div class="wrapper">
    <h1>添加</h1>
    <form method="POST" action="/add" enctype="multipart/form-data">
      <div class="title">
        <input type="text" placeholder="标题" name="title">
      </div>
      <div class="content">
        <textarea  id="" cols="150" rows="30" placeholder="内容" name="content"></textarea>
      </div>
      <div>
        <input type="submit" value="提交">
      </div>
    </form>
  </div>
</body>
</html>

```

app.js代码如下：
```javascript
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
```

router.js代码如下：
```javascript
var express = require('express');
var router = express.Router();
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
      .post(function(req,res){
        // console.log(req.fields);
        // res.send('添加页面 post');
        connection.query(`insert into articles(title,content) values ("${req.fields.title}","${req.fields.content}")`,function(err,result){
            if(err)throw err;
            // console.log(result);
            res.redirect('/');
        });
      });
router.route('/edit')
      .get(function(req,res){
        // res.send('编辑页面 get');
        res.render('edit');
      })
      .post(function(req,res){
        res.send('编辑页面 post');
      });
router.get('/delete',function(req,res){
    // res.send('删除 get');
    var id = req.query.id;
    connection.query(`delete from articles where id = ${id}`,function(err,rows,fields){
        if(err)throw err;
        // console.log(rows);
        res.redirect('/');
    });

module.exports = router;
```
### 步骤15：编辑功能完成
#### 编辑功能是最复杂的，注意事项如下：
- textarea里面的内容涉及到换行、单双引号等，所以需要用encodeURIComponent转义
-  在显示的时候相应的使用decodeURIComponent

edit.ejs代码如下：
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="/css/index.css">
</head>
<body>
  <div class="wrapper">
    <h1>编辑</h1>
    <form method="POST" action="/edit" enctype="multipart/form-data">
      <div class="title">
        <input type="text" placeholder="标题" name="title" value="<%= title %>">
      </div>
      <div class="content">
        <textarea  id="" cols="150" rows="30" placeholder="内容" name="content"><%= content %></textarea>
      </div>
      <div>
        <input type="hidden" value="<%= id %>" name="id">
        <input type="submit" value="提交">
      </div>
    </form>
  </div>
</body>
</html>

```

router.js代码如下：
```javascript
var express = require('express');
var router = express.Router();
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
      .post(function(req,res){
        // console.log(req.fields);
        // res.send('添加页面 post');
        connection.query(`insert into articles(title,content) values ("${req.fields.title}","${req.fields.content}")`,function(err,result){
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
      .post(function(req,res){
        // res.send('编辑页面 post');
        connection.query(`update articles set title="${req.fields.title}",content="${encodeURIComponent(req.fields.content)}" where id = ${req.fields.id}`,function(err,result){
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
```

## 最终实现代码地址
[下载地址](https://github.com/black-pony/dairy)


## 待优化
- 把数据模型相关的代码提取出来
- 使用orm2
