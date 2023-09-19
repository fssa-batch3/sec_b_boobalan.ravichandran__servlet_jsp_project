<style>
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: 'Lora', serif;
 
  }
.header{
display:flex;
 background-color:rgba(232, 232, 232, 0.929);
 box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 1px 3px 1px;
padding:1vh 3vw;
justify-content:space-between;
}
.header img{
width:15vw;
}
.create-product{
margin-top:3.2vh;
}
.create-product a{
margin-right:10vw;
text-decoration:none;
font-size:19px;
color:black;
font-weight:bold;
}
.create-product a button{
padding:1vh 2.5vw;
 background-color: #176047;
 border: none;
 color:white;
 border-radius:5px;
 font-size:16px;
}
.create-product a button:hover{
 background-color: #3aa37e;
 box-shadow: rgba(0, 0, 0, 0.16) 0px 3px 6px, rgba(0, 0, 0, 0.23) 0px 3px 6px;
 }
 .banner{
 width:90vw;
 height:65vh;
 margin:8vh 5vw;
 border-radius:15px;
 }
 
</style>

<header>
<div class="header">
<a href="<%= request.getContextPath()%>/admin"><img src="https://iili.io/Hyihp7S.md.png"
							alt="logo for fert agri boomi" class="admin-logo" /></a>
<div class="create-product">
<a href="get_all_products_admin">Products</a>
<a href="<%= request.getContextPath()%>/logout"> Logout</a>
<a href="<%= request.getContextPath()%>/product/new"><button>Create New Product</button></a>

</div>
</div>
</header>