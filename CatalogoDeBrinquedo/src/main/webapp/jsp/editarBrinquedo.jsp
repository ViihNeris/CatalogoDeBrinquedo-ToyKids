<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="br.edu.catalogo.model.Brinquedo"%>
<%@ page import="br.edu.catalogo.dao.BrinquedoDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css"
	media="screen" />
<link rel="stylesheet" type="text/css" href="./css/pages-table.css"
	media="screen" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
	integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="shortcut icon" type="imagex/png" href="./images/toyKids.ico">
<script src="js/logic-flow/confirmUpdate.js" defer></script>
<script src="./js/product/redirect-to-details.js" defer></script>
<title>Editar Item | ToyKids</title>
</head>
<body>
	<jsp:useBean id="brinquedo" scope="session"
		class="br.edu.catalogo.model.Brinquedo" />
	<header>
		<nav
			class="navbar navbar-expand-sm navbar-toggleable-sm border-bottom box-shadow">
			<div class="container-fluid">
				<a class="navbar-brand text-dark p-3 typ-logo"
					style="font-size: 30px" href="./index.jsp"> <img
					src="./images/toyKids.png" />ToyKids<br> <span
					style="display: flex; font-size: 12px; color: rgb(221, 131, 32); justify-content: center; height: 1vh; padding-left: 2vw;">
						<b>Alegria em Brincar</b>
				</span>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target=".navbar-collapse">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div
					class="navbar-collapse collapse d-sm-inline-flex justify-content-between">
					<ul class="navbar-nav flex-grow-1 menu">
						<li class="nav-item na"><a class="nav-link text-dark"
							href="./index.jsp" style="font-size: 20px; text-decoration: none">Home</a></li>
						<li class="nav-item na">
							<form method="post" action="ServletBrinquedo?cmd=cat"
								enctype="multipart/form-data">
								<%
								BrinquedoDAO daoClass = new BrinquedoDAO();
								List<String> categories = daoClass.getAllCategories();
								%>
								<select name="txtCategoria" onchange="handleChange(this)"
									style="font-size: 20px; text-transform: capitalize;">
									<option disabled selected>Categorias</option>
									<%
									for (String category : categories) {
									%>
									<option value="<%=category%>"><%=category%></option>
									<%
									}
									%>
									<option value="fixedOption"
										style="font-weight: 600; color: skyblue;">Todas</option>
								</select>
							</form>
						</li>
						<li class="nav-item actualNav"><a class="nav-link text-dark"
							href="ServletBrinquedo?cmd=listar"
							style="font-size: 20px; text-decoration: none">Administração</a></li>
						<li class="nav-item na"><a class="nav-link text-dark"
							href="./jsp/sobre.jsp"
							style="font-size: 20px; text-decoration: none">Sobre</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<div class="container">
		<main role="main" class="pt-5">
			<h1>Atualização de Item</h1>
			<p>
				Edite abaixo as informações do item <span><b><%=brinquedo.getCodigo()%></b></span>.
			</p>
			<%
			String pathImage;
			if (brinquedo.getImagem().contains("http")) {
				pathImage = brinquedo.getImagem();
			} else if (!brinquedo.getImagem().equals("")) {
				pathImage = "images/items/" + brinquedo.getImagem();
			} else {
				pathImage = "https://static.vecteezy.com/system/resources/previews/005/337/799/original/icon-image-not-found-free-vector.jpg";
			}
			%>
			<form action="ServletBrinquedo?cmd=atualizar" method="post"
				id="form-update" class="d-grid justify-content-center"
				enctype="multipart/form-data">
				<table class="table text-white"
					style="font-weight: 600; margin: auto; max-width: 25vw;">
					<tr>
						<td style="width: 7rem;">CÓDIGO</td>
						<td><input type="number" size="25" name="txtCodigo" id="cod"
							value="<%=brinquedo.getCodigo()%>" class="form-control-plaintext"
							readonly style="color: #fff; font-weight: 700;" /></td>
					</tr>
					<tr>
						<td>DESCRIÇÃO</td>
						<td><input type="text" size="25" name="txtDescricao"
							value="<%=brinquedo.getDescricao()%>" class="form-control" /></td>
					</tr>
					<tr>
						<td>CATEGORIA</td>
						<td><input type="text" size="15" name="txtCategoria"
							id="catValue" value="<%=brinquedo.getCategoria()%>"
							class="form-control" /></td>
					</tr>
					<tr>
						<td>MARCA</td>
						<td><input type="text" size="20" name="txtMarca"
							value="<%=brinquedo.getMarca()%>" class="form-control" /></td>
					</tr>
					<tr>
						<td>IMAGEM</td>
						<td><p>
								Imagem Atual<br> <img src="<%=pathImage%>" width="35%"
									style="max-height: 130px; object-fit: cover">
							</p> <input type="file" name="txtImagem" /></td>
					</tr>
					<tr>
						<td>VALOR</td>
						<td><input type="text" size="10" name="txtValor"
							id="txtValor" value="<%=brinquedo.getValor()%>"
							class="form-control" /></td>
					</tr>
					<tr>
						<td>DETALHES</td>
						<td><input type="text" size="100" name="txtDetalhes"
							value="<%=brinquedo.getDetalhes()%>" class="form-control" /></td>
					</tr>
				</table>
				<div
					class="mt-5 d-flex justify-content-center w-100 text-center mb-5 space-around">
					<div class="d-flex justify-content-around w-50">
						<div>
							<button class="btn btn-warning ml-5" id="updateData"
								type="submit">Atualizar</button>
						</div>
						<div>
							<a class="btn btn-dark" href="ServletBrinquedo?cmd=listar"
								style="width: 8rem">Voltar</a>
						</div>
					</div>
				</div>
			</form>
		</main>
	</div>
	<footer style="position: absolute">
		<div class="container p-3">
			&copy; 2023 - <b>ToyKids</b> - 4ºC | ADS - <a href="./jsp/sobre.jsp"
				class="linkFooter">Conheça os desenvolvedores</a>
		</div>
	</footer>
</body>
</html>