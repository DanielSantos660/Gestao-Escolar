<?php // Tela de login com ramificação para aluno, professor ou admin. 
include 'Banco/conn.php';
?>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestão Escolar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="Css/style.css">
</head>

<body>

    <!-- Nav -->
    <nav class="navbar topo shadow-sm">
        <div class="container-fluid px-4">
            <span class="navbar-brand mb-0 h1">Gestão Escolar</span>
        </div>
    </nav>

    <!-- Centralização -->
    <div class="conteudo">
        <!-- Container da caixa -->
        <div class="painel-login">
            <h2 class="titulo">Login</h2>
            <div class="caixa">
                <form>

                    <div class="mb-4">
                        <label for="email" class="form-label">E-mail</label>
                        <input type="email" class="form-control form-control-lg campo-texto" id="email" name="email"
                            placeholder="seu.email@email.com" required>
                    </div>

                    <div class="mb-4">
                        <label for="senha" class="form-label">Senha</label>
                        <input type="password" class="form-control form-control-lg campo-texto" id="senha" name="senha"
                            placeholder="••••••••" required>
                    </div>

                    <div class="mt-4">
                        <button type="button" class="btn btn-primary botao-entrar">Acessar</button>
                    </div>

                    <div class="container-links">
                        <a href="#" class="link-esqueci-senha">Esqueci minha senha</a>
                        <a href="#" class="link-esqueci-senha">Cadastrar-se</a>
                    </div>

                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>