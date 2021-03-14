<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>

      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Page d'Acceuil</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet" />

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

        <!-- Owl Carousel -->
        <link type="text/css" rel="stylesheet" href="css/owl.carousel.css" />
        <link type="text/css" rel="stylesheet" href="css/owl.theme.default.css" />

        <!-- Magnific Popup -->
        <link type="text/css" rel="stylesheet" href="css/magnific-popup.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css" />

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css" />


      </head>
      <body>

        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
          Ajouter
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ajouter un étudiant</h5>


                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true"></span>
                </button>
              </div>
              <div class="modal-body">

                <form class="container-fluid">
                  <div class="row">
                    <div class="col">
                      <label for="exampleInputEmail1">CNE</label>
                      <input id="cne" type="text" class="form-control" />
                    </div>
                    <div class="col">
                      <label for="exampleInputEmail1">CIN</label>
                      <input id="cin" type="text" class="form-control" />
                    </div>
                    <div class="col">
                      <label for="exampleInputEmail1">Nom</label>
                      <input id="name" type="text" class="form-control" />
                    </div>
                    <div class="col">
                      <label for="exampleInputEmail1">Prénom</label>
                      <input id="nickname" type="text" class="form-control" />
                    </div>
                    <label for="exampleInputEmail1">Age</label>
                    <input type="number" id="age" name="tentacles" min="18" max="40" />

                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                <button type="button" class="btn btn-primary" onclick="addStudent()">Ajouter</button>
              </div>
            </div>
          </div>
        </div>


        <div class="card mb-3">
          <div class="card-header">
            <i class="fas fa-table"></i>
            Liste des étudiants
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>CNE</th>
                    <th>CIN</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Age</th>

                    <th>Action</th>
                  </tr>
                </thead>

                <tbody>
                  <xsl:for-each select="/students/student">
                    <tr>
                      <td>
                        <xsl:value-of select="@cne" />
                      </td>
                      <td>
                        <xsl:value-of select="@cin" />
                      </td>
                      <td>
                        <xsl:value-of select="name" />
                      </td>
                      <td>
                        <xsl:value-of select="nickname" />
                      </td>
                      <td>
                        <xsl:value-of select="age" />
                      </td>
                      <td>

                        <a href="#" class="btn btn-primary" onclick="deleteStudent('{@cne}')">Supprimer</a>
                        <button type="button" onclick="hydrateModal('{@cne}','{@cin}','{name}','{nickname}','{age}')" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1">
                                        Modifier
                                      </button>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel2">Modifier un étudiant</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true"></span>
                                </button>
                              </div>
                              <div class="modal-body">
                                <form class="container-fluid">
                                  <div class="row">
                                    <div class="col">
                                      <label for="exampleInputEmail1">CNE</label>
                                      <input id="cne1" type="text" class="form-control" />
                                    </div>
                                    <div class="col">
                                      <label for="exampleInputEmail1">CIN</label>
                                      <input id="cin1" type="text" class="form-control" />
                                    </div>
                                    <div class="col">
                                      <label for="exampleInputEmail1">Nom</label>
                                      <input id="name1" type="text" class="form-control" />
                                    </div>
                                    <div class="col">
                                      <label for="exampleInputEmail1">Prénom</label>
                                      <input id="nickname1" type="text" class="form-control" />
                                    </div>
                                    <label for="exampleInputEmail1">Age</label>
                                    <input type="number" id="age1" name="tentacles" min="18" max="40" />
                                  </div>
                                </form>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                                <button type="button" class="btn btn-primary" onclick="updateStudent()">Enregistrer</button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </body>
      <script>

        <!-- making cin and cne readonly for modification -->
        document.getElementById("cne1").readOnly = true;
              document.getElementById("cin1").readOnly = true;


              function hydrateModal(cne,cin,name,nickname,age){
                document.getElementById("cne1").value = cne;
                document.getElementById("cin1").value = cin;
                document.getElementById("name1").value = name;
                document.getElementById("nickname1").value = nickname;
                document.getElementById("age1").value = age;
              }
  
              function deleteStudent(cne){
                  let isConfirmed = confirm("Voulez vous vraiment supprimer l'étudiant CNE : "+cne);
                  if(isConfirmed){
                    fetch(`/students/${cne}`,{
                      method: 'DELETE'
                    }).then((res) => location.reload());
                  }
              }
  
              function addStudent(){
                let cne = document.getElementById("cne").value;
                let cin = document.getElementById("cin").value;
                let name = document.getElementById("name").value;
                let nickname = document.getElementById("nickname").value;
                let age = document.getElementById("age").value;
                
                fetch('/students', {
                  method: 'POST',
                  headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                  },
                  body: JSON.stringify({cne,cin,name,nickname,age})
                }).then(function(){ 
                  location.reload();
                 });
              }
  
              function updateStudent(){
  
                let cne = document.getElementById("cne1").value;
                let cin = document.getElementById("cin1").value;
                let name = document.getElementById("name1").value;
                let nickname = document.getElementById("nickname1").value;
                let age = document.getElementById("age1").value;
  
                fetch(`/students/${cne}`, {
                  method: 'PUT',
                  headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                  },
                  body: JSON.stringify({cne,cin,name,nickname,age})
                }).then(function(){ 
                  location.reload();
                 });
  
              }
      </script>
      <script type="text/javascript" src="js/jquery.min.js"></script>
      <script type="text/javascript" src="js/bootstrap.min.js"></script>
      <script type="text/javascript" src="js/owl.carousel.min.js"></script>
      <script type="text/javascript" src="js/jquery.magnific-popup.js"></script>
      <script type="text/javascript" src="js/main.js"></script>
    </html>
  </xsl:template>
</xsl:stylesheet> 